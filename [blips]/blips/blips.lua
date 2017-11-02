local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	{title="Fishing Spot", colour=68, id=28, x=743.19586181641, y=-3895.3967285156, z=30.556676864624},
	{title="Stolen Weapons", color=4, id=150, x=-342.75030517578, y=6098.2495117188, z=31.318670272827},
	{title="Medical Weed", color=2, id=140, x=2213.0520019531, y=5577.5981445313, z=53.795757293701},
	{title="Drug Lab", color=2, id=140, x=-77.722381591797, y=6223.626953125, z=31.089864730835},
	{title="Club", colour=48, id=121, x=-1395.9016113281, y=-607.93939208984, z=30.319543838501},
	{title="Biker-Gang", colour=38, id=378, x=-560.13873291016, y=286.93334960938, z=82.176391601563}
  }

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
