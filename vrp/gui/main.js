var vrp_html_tags = ["b", "big", "blockquote", "br", "center", "code", "div", "em", "font", "h1", "h2", "h3", "h4", "h5", "h6", "hr", "i", "li", "ol", "p", "pre", "s", "small", "span", "strong", "sub", "sup", "table", "tbody", "td", "tfoot", "th", "thead", "tr", "u", "ul"];
var vrp_html_drop = ["script", "style", "template", "noscript", "iframe", "object", "embed", "svg", "math", "textarea", "title", "select", "xmp", "noembed", "noframes"];
var vrp_html_attrs = ["class", "style", "color", "align", "colspan", "rowspan"];

function vrpCleanHtmlNode(parent) {
    var nodes = Array.prototype.slice.call(parent.childNodes);
    for (var i = 0; i < nodes.length; i++) {
        var node = nodes[i];
        if (node.nodeType == 1) {
            var tag = node.localName;
            if (node.namespaceURI != "http://www.w3.org/1999/xhtml" || vrp_html_drop.indexOf(tag) >= 0) {
                parent.removeChild(node);
            } else if (vrp_html_tags.indexOf(tag) < 0) {
                vrpCleanHtmlNode(node);
                while (node.firstChild)
                    parent.insertBefore(node.firstChild, node);
                parent.removeChild(node);
            } else {
                var attrs = Array.prototype.slice.call(node.attributes);
                for (var j = 0; j < attrs.length; j++) {
                    var name = attrs[j].name.toLowerCase();
                    var value = attrs[j].value;
                    var allowed = false;
                    if (name == "style")
                        allowed = !/\\|url|image/i.test(value);
                    else if (name == "class")
                        allowed = !/ogrp_/i.test(value);
                    else
                        allowed = vrp_html_attrs.indexOf(name) >= 0 || /^data-[a-z0-9_.-]+$/.test(name);
                    if (!allowed)
                        node.removeAttribute(attrs[j].name);
                }
                vrpCleanHtmlNode(node);
            }
        } else if (node.nodeType != 3) {
            parent.removeChild(node);
        }
    }
}

function vrpSanitizeHtml(html) {
    var tpl = document.createElement("template");
    tpl.innerHTML = html;
    vrpCleanHtmlNode(tpl.content);
    return tpl.content;
}

function vrpSetHtml(el, html) {
    el.textContent = "";
    el.appendChild(vrpSanitizeHtml(html));
}

window.addEventListener("load", function() {
    errdiv = document.createElement("div");

    //init dynamic menu
    var ogrpMenu = new Menu();
    var wprompt = new WPrompt();
    var requestmgr = new RequestManager();
    var announcemgr = new AnnounceManager();

    wprompt.onClose = function() {
        $.post("https://vrp/prompt", JSON.stringify({ act: "close", result: wprompt.result.substring(0, 1000) }));
    };

    requestmgr.onResponse = function(id, ok) {
        $.post("https://vrp/request", JSON.stringify({ act: "response", id: id, ok: ok }));
    };

    ogrpMenu.onClose = function() {
        $.post("https://vrp/menu", JSON.stringify({ act: "close", id: ogrpMenu.id }));
    };

    ogrpMenu.onValid = function(choice, mod) {
        $.post("https://vrp/menu", JSON.stringify({ act: "valid", id: ogrpMenu.id, choice: choice, mod: mod }));
    };

    //request config
    $.post("https://vrp/cfg", "");

    //var current_menu = dynamic_menu;
    var pbars = {}
    var divs = {}

    //progress bar ticks (25fps)
    setInterval(function() {
        for (var k in pbars) {
            pbars[k].frame(1 / 25.0 * 1000);
        }

    }, 1 / 25.0 * 1000);

    //MESSAGES
    window.addEventListener("message", function(evt) { //lua actions
        var data = evt.data;

        if (data.act == "cfg") {
            cfg = data.cfg
        } else if (data.act == "open_menu") { //OPEN DYNAMIC MENU
            ogrpMenu.open(data);
            ogrpMenu.id = data.menudata.id;
        } else if (data.act == "close_menu") { //CLOSE MENU
            ogrpMenu.close();
        }
        // PROGRESS BAR
        else if (data.act == "set_pbar") {
            var pbar = pbars[data.pbar.name];
            if (pbar)
                pbar.removeDom();

            pbars[data.pbar.name] = new ProgressBar(data.pbar);
            pbars[data.pbar.name].addDom();
        } else if (data.act == "set_pbar_val") {
            var pbar = pbars[data.name];
            if (pbar)
                pbar.setValue(data.value);
        } else if (data.act == "set_pbar_text") {
            var pbar = pbars[data.name];
            if (pbar)
                pbar.setText(data.text);
        } else if (data.act == "remove_pbar") {
            var pbar = pbars[data.name]
            if (pbar) {
                pbar.removeDom();
                delete pbars[data.name];
            }
        }
        // PROMPT
        else if (data.act == "prompt") {
            wprompt.open(data.title, data.text);
        }
        // REQUEST
        else if (data.act == "request") {
            requestmgr.addRequest(data.id, data.text, data.time);
        }
        // ANNOUNCE
        else if (data.act == "announce") {
            announcemgr.addAnnounce(data.background, data.content);
        }
        // DIV
        else if (data.act == "set_div") {
            var div = divs[data.name];
            if (div)
                div.removeDom();

            divs[data.name] = new Div(data)
            divs[data.name].addDom();
        } else if (data.act == "set_div_css") {
            var div = divs[data.name];
            if (div)
                div.setCss(data.css);
        } else if (data.act == "set_div_content") {
            var div = divs[data.name];
            if (div)
                div.setContent(data.content);
        } else if (data.act == "div_execjs") {
            var div = divs[data.name];
            if (div)
                div.executeJS(data.js);
        } else if (data.act == "remove_div") {
            var div = divs[data.name];
            if (div)
                div.removeDom();

            delete divs[data.name];
        }
        // CONTROLS
        else if (data.act == "event") { //EVENTS
            if (data.event == "UP") {
                if (ogrpMenu.opened) {
                    ogrpMenu.moveUp();
                }
            } else if (data.event == "DOWN") {
                if (ogrpMenu.opened) {
                    ogrpMenu.moveDown();
                }
            } else if (data.event == "LEFT") {
                ogrpMenu.valid(-1);
            } else if (data.event == "RIGHT") {
                ogrpMenu.valid(1);
            } else if (data.event == "SELECT") {
                ogrpMenu.valid(0);
            } else if (data.event == "CANCEL") {
                if (wprompt.opened)
                    wprompt.close();
                else
                    ogrpMenu.close(data);
            } else if (data.event == "F5") {
                requestmgr.respond(true);
            } else if (data.event == "F6") {
                requestmgr.respond(false);
            }
        }
    });
});