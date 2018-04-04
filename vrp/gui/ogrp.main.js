
window.addEventListener("load", function() {
	ogrpDebugBar();
	ogrpMainError();

	var requestMan = new RequestManager();
	var ogrpMenu = new OGRP_MENU();

	requestMan.onResponse = function(id, ok) {
		$.post("http://vrp/request",JSON.stringify({act: "response", id: id, ok: ok}));
	};

	ogrpMenu.onClose = function() {
		$.post("http://vrp/menu",JSON.stringify({act: "close", id: ogrpMenu.id}));
	};
	ogrpMenu.onValid = function(choice,mod) {
		$.post("http://vrp/menu",JSON.stringify({act: "valid", id: ogrpMenu.id, choice: choice, mod: mod}));
	};

	$.post("http://vrp/cfg","");

	window.addEventListener("message", function(evt) {
		var data = evt.data;

		if(data.act === "open_menu") {
			openMenu(data);
		} else if(data.act === "close_menu") {
			ogrpMenu.close(data);
		} else if(data.act === "event") {
			messageEventHandler(data);
		} else if(data.act === "request") {
			requestMan.addRequest(data.id,data.text,data.time);
		}
	});

	openMenu = function(data) {
		ogrpMenu.open(data);
		ogrpMenu.id = data.menudata.id;
	};

	closeMenu = function() {
		ogrpMenu.close();
	};

	messageEventHandler = function(data) {
		if(data.event === "CANCEL") {
			if (ogrpMenu.opened) {
				ogrpMenu.close(data);
			}
		} else if(data.event === "UP") {
			if (ogrpMenu.opened) {
				ogrpMenu.moveUp();
			}
		} else if(data.event === "DOWN") {
			if (ogrpMenu.opened) {
				ogrpMenu.moveDown();
			}
		} else if(data.event === "LEFT") {
			ogrpMenu.valid(-1);
		} else if(data.event === "RIGHT") {
			ogrpMenu.valid(1);
		} else if(data.event === "SELECT") {
			ogrpMenu.valid(0);
		} else if (data.event == "F5") {
            requestMan.respond(true);
        } else if (data.event == "F6") {
            requestMan.respond(false);
        }
	};
});

function ogrpDebugBar() {
	$("body").append(
		$("<div>",{"id":"ogrpErrDiv","class":"ogrp_console"})
	);
}

function ogrpMainError() {
	window.onerror = function(errorMsg, url, lineNumber, column, errorObj) {
		$("#ogrpErrDiv").append(
			"<br />Error: " + errorMsg + " Script: " + url + " Line: " + lineNumber + " Column: " + column + " StackTrace: " +  errorObj
		);
	};
}