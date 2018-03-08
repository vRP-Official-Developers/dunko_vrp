var k9_app = new Vue({
    el: "#k9_base",

    data: {
        dogname: "DefaultNameHere",
        k9: {
            menu: false,
            base: true,
            options: false,
            actions: false,
            animations: false,
        }
    },

    methods: {

        ResetMenu: () => {
            k9_app.k9.base = true;
            k9_app.k9.options = false;
            k9_app.k9.actions = false;
            k9_app.k9.animations = false;
        },

        HideAllTabs: () => {
            k9_app.k9.base = false;
            k9_app.k9.options = false;
            k9_app.k9.actions = false;
            k9_app.k9.animations = false;
        },

        ToggleOptions: () => {
            k9_app.HideAllTabs();
            k9_app.k9.options = true;
        },

        ToggleActions: () => {
            k9_app.HideAllTabs();
            k9_app.k9.actions = true;
        },

        ToggleAnimations: () => {
            k9_app.HideAllTabs();
            k9_app.k9.animations = true;
        },

        ShowK9NameMenu: () => {
            $('.ui.modal').modal('show');
        },

        ChangeK9Name: () => {
            var newName = $("#k9namebox").val();
            if (!newName == "") {
                k9_app.dogname = newName;
                UpdateK9Name();
            }
        },

        ToggleK9Menu: () => {
            k9_app.ResetMenu();
            if (k9_app.k9.menu == true) {
                k9_app.k9.menu = false;
                DisableK9Menu();
            } else {
                k9_app.k9.menu = true;
            };
        },

    },
});

// Update K9 Name (WORKS)
function UpdateK9Name() {
    $.post("http://k9/recievek9name", JSON.stringify({
        name: k9_app.dogname,
    }));
};

// K9 Search (NOT WORKING)
function TriggerK9Search() {
    $.post("http://k9/triggerk9search", JSON.stringify({}));
}

// K9 Vehicle in/out (NOT WORKING)
function ToggleK9Vehicle() {
    $.post("http://k9/triggervehicletoggle", JSON.stringify({}));
}

// Spawn / Delete K9 (WORKS)
function ToggleK9Spawn() {
    $.post("http://k9/triggertogglek9", JSON.stringify({}));
};

// Disable k9 Menu (WORKS)
function DisableK9Menu() {
    $.post("http://k9/disablek9menu", JSON.stringify({}));
};


// K9 Play Animation (NOT IN)
function PlayK9Animaton(name) {
    $.post("http://k9/triggerk9animation", JSON.stringify({
        anim: name,
    }));
};

$(function(){
    window.addEventListener('message', function(event) {
        if (event.data.type == "enable_k9_menu") {
            k9_app.ToggleK9Menu();
        }
    });
});