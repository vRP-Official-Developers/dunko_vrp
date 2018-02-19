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
	-- {title="Santa's Sleigh", colour=30, id=102, x = -1345.333984375, y = -2692.7885742188, z = 13.944937705994},
	-- {title="Santa's Cloakroom", colour=30, id=102, x = -1373.0778808594, y = -2677.6694335938, z = 13.944942474365}
	{title="Police Reports", colour=38, id=408, x = 439.57083129883, y = -995.072265625, z = 30.689596176147}, -- Mission Row
	{title="Police Reports", colour=38, id=408, x = 1851.6605224609, y = 3690.6713867188, z = 34.267044067383}, -- Sandy Shores
	{title="Police Reports", colour=38, id=408, x = -449.43395996094, y = 6010.796875, z = 31.716377258301}, -- Paleto
	{title="Medical Reports", colour=30, id=102, x = -272.08700561523,y = 27.639623641968, z = 54.752536773682},
	{title="Medical Reports", colour=30, id=102, x = 465.04064941406, y = 3569.1174316406, z = 33.238555908203},
	{title="Medical Reports", colour=30, id=102, x = -1145.8566894531,y = 4939.5083007813,z = 222.2686920166},
	{title="Drug Dealer Job", colour=4, id=277, x = 1865.1586914063, y = 3749.4343261719, z = 33.046268463135}, -- Drug Dealer
	{title="Job Selector", colour=47, id=351, x = -1911.9273681641, y = -569.71649169922, z = 19.097215652466}, -- CoC
	{title="Police Job", colour=38, id=351, x = 447.35137939453, y = -975.57592773438, z = 30.689584732056}, -- Mission Row
	{title="Police Job", colour=38, id=351, x = 1857.5961914063, y = 3688.8952636719, z = 34.267040252686}, -- Sandy Shores
	{title="Police Job", colour=38, id=351, x = -449.00927734375, y = 6017.1953125, z = 31.716377258301}, -- Paleto
	{title="Smuggler Job", colour=2, id=351, x = 283.10546875, y = 6788.7104492188, z = 15.695198059082}, -- Weapons Smuggler
	{title="Cargo Job", colour=2, id=351, x = -928.89624023438, y = -2937.396484375, z = 13.945074081421}, -- Cargo Pilot
	{title="Trash Job", colour=2, id=351, x = 750.05029296875, y = -1402.9224853516, z = 26.549806594849}, -- Trash Collector
	{title="Judge Job", colour=7, id=351, x = -59.127178192139, y = 359.25082397461, z = 113.05643463135}, -- Judge
	{title="Forger Job", colour=2, id=351, x = 388.61703491211, y = 3587.1179199219, z = 33.292263031006}, -- Forger
	{title="Cargo Collection", colour=2, id=94, x = 1618.9204101563, y = 3227.7058105469, z = 40.411529541016}, -- Cargo
	{title="Garage (Cargo)", colour=30, id=16, x = -901.70129394531,y = -3293.984375,z = 13.944430351257}, -- Cargo Garage Sa
	{title="Garage (Cargo)", colour=30, id=16, x = 2128.9069824219, y = 4806.134765625, z = 41.168750762939}, -- Cargo Garage Sa
	{title="Garage (Cargo)", colour=30, id=16, x = 1734.9053955078, y = 3297.9689941406, z = 41.22350311279}, -- Cargo Garage Sa
	{title="Garage (Airline)", colour=30, id=16, x = 2128.9069824219, y = 4806.134765625, z = 41.168750762939}, -- Airline Garage
	{title="Garage (Airline)", colour=30, id=16, x = 1734.9053955078, y = 3297.9689941406, z = 41.223503112793}, -- Airline Garage
	{title="Garage (Helicopter Airline)", colour=30, id=43, x = -745.14343261719, y = -1468.5361328125, z = 5.0005240440369} -- Helicopter Garage for Airline Job
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
