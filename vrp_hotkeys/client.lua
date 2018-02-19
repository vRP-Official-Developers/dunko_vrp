-- MAIN THREAD
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		for k,v in pairs(cfg.hotkeys) do
		  if IsControlJustPressed(v.group, k) or IsDisabledControlJustPressed(v.group, k) then
		    v.pressed()
		  end

		  if IsControlJustReleased(v.group, k) or IsDisabledControlJustReleased(v.group, k) then
		    v.released()
		  end
		end
	end
end)


-- THIS IS FOR NO DOC COMA
Citizen.CreateThread(function() -- coma thread
  while true do
    Citizen.Wait(1000)
    if vRP.isInComa({}) then
	  if called == 0  then
	    HKserver.canSkipComa({},function(skipper)
	      if skipper then
		    HKserver.docsOnline({},function(docs)
		      if docs == 0 then
			    vRP.notify({"~r~There's nobody to revive you.\n~b~Press ~g~E~b~ to respawn."})
			  else
			    vRP.notify({"~g~EMS is online.\n~b~Press ~g~E~b~ to call an ambulance."})
			  end
		    end)
          end
	    end)
	  else
	    called = called - 1
	  end
	else
	  called = 0
	end
  end
end)


