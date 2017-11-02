function showDoneNotif(mes)
	SendNUIMessage({
		showDone = true,
		text = mes
	})
end

function showWarnNotif(mes)
	SendNUIMessage({
		showWarn = true,
		text = mes
	})
end

RegisterNetEvent("showErrorNotif")
AddEventHandler("showErrorNotif", function(mes)
	SendNUIMessage({
		showError = true,
		text = mes
	})
end)

function showNoneNotif(mes)
	SendNUIMessage({
		showNone = true,
		text = mes
	})
end

