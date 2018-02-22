local crouched = false

Citizen.CreateThread( function()
    while true do 
        Citizen.Wait( 1 )

        local ped = GetPlayerPed( -1 )

        if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
            DisableControlAction( 0, 36, true ) -- INPUT_DUCK  

            if ( not IsPauseMenuActive() ) then 
                if ( IsDisabledControlJustPressed( 0, 36 ) ) then 
                    RequestAnimSet( "move_ped_crouched" )
					RequestAnimSet( "move_m@casual@d" )

                    while ( not HasAnimSetLoaded( "move_ped_crouched" ) and not HasAnimSetLoaded( "move_m@casual@d" ) ) do 
                        Citizen.Wait( 100 )
                    end 

                    if ( crouched == true ) then 
                        SetPedMovementClipset( ped, "move_m@casual@d", 0.25 )
                        crouched = false 
                    elseif ( crouched == false ) then
                        SetPedMovementClipset( ped, "move_ped_crouched", 0.25 )
                        crouched = true 
                    end 
                end
            end 
        end 
    end
end )
