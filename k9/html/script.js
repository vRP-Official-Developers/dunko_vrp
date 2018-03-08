// Vue //
var app = new Vue({
    el: "#app",

    data: {
        resource_name: "",
        show_app: false,
        current_tab: "main",

        k9_name_modal: false,
        dog_name: "",

        k9_model_modal: false,
        dog_models_list: [
            {title: "Rottweiler", model: "a_c_rottweiler", img: "images/rottweiler.png"},
            {title: "Husky", model: "a_c_husky", img: "images/husky.png"},
            {title: "Shephard", model: "a_c_shepherd", img: "images/shepherd.png"},
            {title: "Retriver", model: "a_c_retriever", img: "images/retriever.png"}
        ],
        dog_model: "a_c_rottweiler",

        k9_name_form_valid: false,
        k9_name_rules: [
            v => !!v || 'Name is required',
            v => v.length > 2 || 'Name must be atleast 2 characters',
            v => v.length < 10 || 'Name must be less than 10 characters',
            v => /^[A-Za-z]+$/.test(v) || "You can only use letters in the name"
        ],
    },

    methods: {

        EnableApp() {
            this.show_app = true;
        },

        DisableApp() {
            this.show_app = false;
            this.current_tab = "main";
            this.SendCloseMenuPost();
        },

        // Open Tab
        OpenTab(tab) {
            this.current_tab = tab;
        },

        // Opens Name Changer
        ToggleNameChanger() {
            this.k9_name_modal = !this.k9_name_modal;
        },

        // Opens Model Changer
        ToggleModelChanger() {
            this.k9_model_modal = !this.k9_model_modal;
        },

        // Passes Chosen Model To Data
        ChooseK9Model(model) {
            this.k9_model_modal = false;
            this.dog_model = model;
        },

        // Updates Resource Name
        UpdateResource(name) {
            this.resource_name = name
        },

        // Sets K9 Name
        SetK9Name() {
            if (this.k9_name_form_valid) {
                axios.post("http://" + this.resource_name + "/updatename", {name: this.dog_name}).then(function(response) {
                    console.log(response);
                }).catch(function(error) {
                    console.log(error);
                });
            } else {
                console.log("Form Not Valid!");
            }
        },

        // Spawns K9 or Deletes K9
        SpawnK9() {
            if (!this.dog_model == "") {
                axios.post("http://" + this.resource_name + "/spawnk9", {model: this.dog_model}).then(function(response) {
                    console.log(response);
                }).catch(function(error) {
                    console.log(error);
                });
            };
        },

        VehicleToggle() {
            axios.post("http://" + this.resource_name + "/vehicletoggle", {}).then(function(response) {
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            });
        },

        VehicleSearch() {
            axios.post("http://" + this.resource_name + "/vehiclesearch", {}).then(function(response) {
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            })
        },

        DogSit() {
            axios.post("http://" + this.resource_name + "/sit", {}).then(function(response) {
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            })
        },

        DogLaydown() {
            axios.post("http://" + this.resource_name + "/laydown", {}).then(function(response) {
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            })
        },

        // Send POST Close Menu
        SendCloseMenuPost() {
            axios.post("http://" + this.resource_name + "/closemenu", {}).then(function(response) {
                console.log(response);
            }).catch(function(error) {
                console.log(error);
            });
        },
    },
});

// Event Listener
document.onreadystatechange = () => {
    if (document.readyState === "complete") {
        window.addEventListener('message', function(event) {
            if (event.data.type == "open_k9_menu") {
                app.EnableApp();
            } else if (event.data.type == "update_resource_name") {
                app.UpdateResource(event.data.name);
            }
        });
    }
}