petrolCanPrice = 1

lang = "en"
-- lang = "en"

settings = {}
settings["en"] = {
	openMenu = "Press ~g~E~w~ to open the menu.",
	electricError = "~r~You have an electric vehicle.",
	fuelError = "~r~You're not in the good place.",
	buyFuel = "buy fuel",
	liters = "liters",
	percent = "percent",
	confirm = "Confirm",
	fuelStation = "Fuel station",
	boatFuelStation = "Fuel station | Boat",
	avionFuelStation = "Fuel station | Plane ",
	heliFuelStation = "Fuel station | Helicopter",
	getJerryCan = "Press ~g~E~w~ to buy a Petrol can ("..petrolCanPrice.."$)",
	refeel = "Press ~g~E~w~ to refeel the car.",
	YouHaveBought = "You have bought ",
	fuel = " liters of fuel",
	price = "price"
}

settings["fr"] = {
	openMenu = "Appuyez sur ~g~E~w~ pour ouvrir le menu.",
	electricError = "~r~Vous avez une voiture électrique.",
	fuelError = "~r~Vous n'êtes pas au bon endroit.",
	buyFuel = "acheter de l'essence",
	liters = "litres",
	percent = "pourcent",
	confirm = "Valider",
	fuelStation = "Station essence",
	boatFuelStation = "Station d'essence | Bateau",
	avionFuelStation = "Station d'essence | Avions",
	heliFuelStation = "Station d'essence | Hélicoptères",
	getJerryCan = "Appuyez sur ~g~E~w~ pour acheter un bidon d'essence ("..petrolCanPrice.."$)",
	refeel = "Appuyez sur ~g~E~w~ pour remplir votre voiture d'essence.",
	YouHaveBought = "Vous avez acheté ",
	fuel = " litres d'essence",
	price = "prix"
}


showBar = false
showText = false


hud_form = 1 -- 1 : Vertical | 2 = Horizontal
hud_x = 0.175 
hud_y = 0.885

text_x = 0.2575
text_y = 0.975


electricityPrice = 1 -- NOT RANOMED !!

randomPrice = true --Random the price of each stations
price = 1 --If random price is on False, set the price here for 1 liter