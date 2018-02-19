Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if IsControlPressed(1, 323) then --Start holding X
			TaskHandsUp(GetPlayerPed(-1), 1000, -1, -1, true) -- Perform animation.
		end
	end
end)