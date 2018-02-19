--[[------------------------------------------------------------------------
    Vehicle Damage Shit
------------------------------------------------------------------------]]--
local levelOfDamageToKillThisBitch = 985.0 

function IsValidVehicle( veh )
    local model = GetEntityModel( veh )

    if ( IsThisModelACar( model ) or IsThisModelABike( model ) or IsThisModelAQuadbike( model ) ) then  
        return true 
    else 
        return false 
    end 
end 

function ManageVehicleDamage()
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                local damage = GetVehicleEngineHealth( vehicle )

                if ( damage < levelOfDamageToKillThisBitch and IsValidVehicle( vehicle ) ) then 
                    SetVehicleEngineHealth( vehicle, 300 )
                    SetVehicleEngineOn( vehicle, false, true )
                end 
            end  
        end 
    end 
end 

Citizen.CreateThread( function()
    while true do 
        ManageVehicleDamage()

        Citizen.Wait( 0 )
    end 
end )


--[[------------------------------------------------------------------------
    Vehicle Fix
------------------------------------------------------------------------]]--
RegisterNetEvent( 'wk:fixVehicle' )
AddEventHandler( 'wk:fixVehicle', function() 
    local ped = GetPlayerPed( -1 )

    if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then 
        if ( IsPedSittingInAnyVehicle( ped ) ) then 
            local vehicle = GetVehiclePedIsIn( ped, false )

            if ( GetPedInVehicleSeat( vehicle, -1 ) == ped ) then 
                SetVehicleEngineHealth( vehicle, 1000 )
                SetVehicleEngineOn( vehicle, true, true )
                SetVehicleFixed( vehicle )
            end  
        end 
    end 
end )