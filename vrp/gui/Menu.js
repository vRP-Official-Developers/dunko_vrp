function MENU() {
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
			$("<div>",{"id":"mainMenu","class":"mainMenu"}).css("display","none").append(
				$("<h1>",{"id":"menuHeader","class":"menuHeader"})
			).append(
				$("<div>",{"id":"menuChoices","class":"menuChoices"})
			).append(
				$("<div>",{"id":"menuDescription","class":"menuDescription"}).append(
					$("<div>",{"id":"menuDescriptionContent","class":"menuDescriptionContent"})
				)
			)
		);
	};

	getChoicesCount = function() {
		return $("#menuChoices").find(".menuChoice").length;
	};

	getChoiceText = function() {
		return $("#menuChoices").find(".MenuChoiceSelected")[0].innerHTML;
	};

	getChoiceDesc = function() {
		var selectedChoiceEl = $("#menuChoices").find(".MenuChoiceSelected")[0];

		return ($(selectedChoiceEl).attr("data-desc")) ? $(selectedChoiceEl).data("desc"):"";
	};

	scrollToMenuOption = function() {
		if($("#menuChoices").find(".MenuChoiceSelected").length) {
			var scrollto = $($("#menuChoices").find(".MenuChoiceSelected"));
			var container = $("#menuChoices");

			if(scrollto.offset().top < container.offset().top || scrollto.offset().top + scrollto.height() >= container.offset().top+container.height()) {
				container.scrollTop(scrollto.offset().top - container.offset().top + container.scrollTop());
			}
		}
	};

	setHeaderColor = function(headerColor) {
		$("#menuHeader").css("backgroundColor",headerColor);
	};

	this.open = function(data) {
		menuName = data.menudata.name;
		var choices = data.menudata.choices;
		var css = (data.menudata.css) ? data.menudata.css:false;
		var headerColor = (css.header_color) ? css.header_color:false;

		$("#menuChoices").empty();
		$("#menuHeader").html(menuName);

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

		$("#mainMenu").show();

		$.each(choices,function(i,c) {
			$("#menuChoices").append(
				$("<div>",{"class":"menuChoice", "data-desc":c[1]}).html(getChoiceContents(c[0]))
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
				$("#mainMenu").hide();
			}

			if(this.onClose) {
				this.onClose();
			}
		}
	};

	this.setSelected = function(i) {
		selected = i;
		$(".menuChoice").removeClass("MenuChoiceSelected");

		if(selected < 0) {
			selected = getChoicesCount()-1;
		} else if(selected >= getChoicesCount()) {
			selected = 0;
		}

		if(selected >= 0 && (selected < getChoicesCount())) {
			$("#menuChoices div.menuChoice:nth-child(" + (selected + 1) + ")").addClass("MenuChoiceSelected");
		}

		scrollToMenuOption();

		if(getChoiceDesc().length) {
			$("#menuDescriptionContent").html(getChoiceDesc());
			$("#menuDescription").show();
		} else {
			$("#menuDescription").hide();
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