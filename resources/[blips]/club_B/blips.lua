local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	-- Discord
	{title="Beach Bar", colour=47, id=102, x=1374.25, y=-2711.89, z=2.31},
  }

	--{title="The Red Fox", colour=17, id=463, x=-560.13873291016, y=286.93334960938, z=82.176391601563},
  --}

Citizen.CreateThread(function()

    for _, info in pairs(blips) do
      info.blip = AddBlipForCoord(info.x, info.y, info.z)
      SetBlipSprite(info.blip, info.id)
      SetBlipDisplay(info.blip, 4)
      SetBlipScale(info.blip, 0.9)
      SetBlipColour(info.blip, info.colour)
      SetBlipAsShortRange(info.blip, true)
	  BeginTextCommandSetBlipName("STRING")
      AddTextComponentString(info.title)
      EndTextCommandSetBlipName(info.blip)
    end
end)



