local blips = {
    -- Example {title="", colour=, id=, x=, y=, z=},
	{title="Fishing Spot", colour=68, id=28, x=743.19586181641, y=-3895.3967285156, z=30.556676864624},
	{title="Stolen Weapons", color=4, id=150, x=-342.75030517578, y=6098.2495117188, z=31.318670272827},
	{title="Medical Weed", color=2, id=140, x=2213.0520019531, y=5577.5981445313, z=53.795757293701},
	{title="Drug Lab", color=2, id=140, x=-77.722381591797, y=6223.626953125, z=31.089864730835},
	{title="Club", colour=48, id=121, x=-1395.9016113281, y=-607.93939208984, z=30.319543838501},
	{title="Biker-Gang", colour=38, id=378, x=-560.13873291016, y=286.93334960938, z=82.176391601563},
	{title="Cargo Pilot", colour=3, id=90, x=-928.89624023438,y=-2937.396484375,z=13.945074081421},
	{title="Nite Club", colour=3, id=121, x=-346.18237304688, y=165.31571960449, z=86.390754699707},
	{title="Bank Driver", color=4, id=198, x = 243.67727661133, y = 230.6535949707, z = 106.28681945801},
	{title="Club", colour=48, id=121, x=-1395.9016113281, y=-607.93939208984, z=30.319543838501},
	{title="Beach Bar", colour=47, id=102, x=1374.25, y=-2711.89, z=2.31},
	{title="Blue Airlines", colour=30, id=43, x = -759.6591796875, y = -1515.3978271484, z = 4.9768991470337},
	{title="Hacker", colour=30, id=150, x = 705.67150878906, y = -966.78765869141, z = 30.395341873169},
	{title="Lawyer", colour=30, id=102, x = -1911.9273681641, y = -569.71649169922, z = 19.097215652466},
	{title="Santa's Sleigh", colour=30, id=102, x = -1345.333984375, y = -2692.7885742188, z = 13.944937705994},
	{title="Santa's Cloakroom", colour=30, id=102, x = -1373.0778808594, y = -2677.6694335938, z = 13.944942474365}
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
