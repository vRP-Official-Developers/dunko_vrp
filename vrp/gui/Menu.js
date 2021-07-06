function Menu() {
	var id,menuName, selected, menuLevel, goingBack;

	this.opened = false;

	debug = function(msg) {
		$("#ogrpErrDiv").prepend("<br />Menu Debug: " + msg);
	};

	init = function() {
		id = 0;
		menuName = "";
		menuLevel = -1;
		selected = -1;
		goingBack = false;

		buildMainMenu();
	};

	buildMainMenu = function() {
		$("body").append(
			$("<div>",{"id":"ogrp_mainMenu","class":"ogrp_mainMenu"}).css("display","none").append(
				$("<h1>",{"id":"ogrp_menuHeader","class":"ogrp_menuHeader"})
			).append(
				$("<div>",{"id":"ogrp_menuChoices","class":"ogrp_menuChoices"})
			).append(
				$("<div>",{"id":"ogrp_menuDescription","class":"ogrp_menuDescription"}).append(
					$("<div>",{"id":"ogrp_menuDescriptionContent","class":"ogrp_menuDescriptionContent"})
				)
			)
		);
	};

	getChoicesCount = function() {
		return $("#ogrp_menuChoices").find(".ogrp_menuChoice").length;
	};

	getChoiceText = function() {
		return $($("#ogrp_menuChoices").find(".ogrp_MenuChoiceSelected")[0]).text();
	};

	getChoiceDesc = function() {
		var selectedChoiceEl = $("#ogrp_menuChoices").find(".ogrp_MenuChoiceSelected")[0];

		return ($(selectedChoiceEl).attr("data-desc")) ? $(selectedChoiceEl).data("desc"):"";
	};

	scrollToMenuOption = function() {
		if($("#ogrp_menuChoices").find(".ogrp_MenuChoiceSelected").length) {
			var scrollto = $($("#ogrp_menuChoices").find(".ogrp_MenuChoiceSelected"));
			var container = $("#ogrp_menuChoices");

			if(scrollto.offset().top < container.offset().top || scrollto.offset().top + scrollto.height() >= container.offset().top+container.height()) {
				container.scrollTop(scrollto.offset().top - container.offset().top + container.scrollTop());
			}
		}
	};

	setHeaderColor = function(headerColor) {
		$("#ogrp_menuHeader").css("backgroundColor",headerColor);
	};

	this.open = function(data) {
		menuName = data.menudata.name;
		var choices = data.menudata.choices;
		var css = (data.menudata.css) ? data.menudata.css:false;
		var headerColor = (css.header_color) ? css.header_color:false;

		$("#ogrp_menuChoices").empty();
		$("#ogrp_menuHeader").html(menuName);

		setHeaderColor(headerColor);

		if(!this.opened) {
			this.opened = true;
			goingBack = false;
			menuLevel = 0;
		} else if(!goingBack) {
			++menuLevel;
		} else {
			goingBack = false;
		}

		$("#ogrp_mainMenu").show();

		$.each(choices,function(i,c) {
			$("#ogrp_menuChoices").append(
				$("<div>",{"class":"ogrp_menuChoice", "data-desc":c[1]}).html(getChoiceContents(c[0]))
			);
		});

		this.setSelected(0);
	};

	getChoiceContents = function(choice) {
		if(choice.substr(0,1) === "<") {
			var bgColor = $(choice).data("bgcolor");
			return $("<div>").html($(choice).css("background-color",bgColor));
		} else {
			return choice;
		}
	};

	this.close = function() {
		if(this.opened) {
			goingBack = true;
			--menuLevel;

			if(menuLevel < 1) {
				this.opened = false;
				$("#ogrp_mainMenu").hide();
			}

			if(this.onClose) {
				this.onClose();
			}
		}
	};

	this.setSelected = function(i) {
		selected = i;
		$(".ogrp_menuChoice").removeClass("ogrp_MenuChoiceSelected");

		if(selected < 0) {
			selected = getChoicesCount()-1;
		} else if(selected >= getChoicesCount()) {
			selected = 0;
		}

		if(selected >= 0 && (selected < getChoicesCount())) {
			$("#ogrp_menuChoices div.ogrp_menuChoice:nth-child(" + (selected + 1) + ")").addClass("ogrp_MenuChoiceSelected");
		}

		scrollToMenuOption();

		if(getChoiceDesc().length) {
			$("#ogrp_menuDescriptionContent").html(getChoiceDesc());
			$("#ogrp_menuDescription").show();
		} else {
			$("#ogrp_menuDescription").hide();
		}
	};

	this.moveUp = function() {
		if(this.opened) {
			this.setSelected(selected-1);
		}
	};

	this.moveDown = function() {
		if(this.opened) {
			this.setSelected(selected+1);
		}
	};

	this.valid = function(mod) {
		if(selected >= 0 && selected < getChoicesCount()) {
			if(this.onValid && this.opened) {
				this.onValid(getChoiceText(), mod);
			}
		}
	};

	init();
}
