--[[------------------------------------------------------------------------
	Fix Vehicle 
------------------------------------------------------------------------]]--
AddEventHandler( 'chatMessage', function( source, n, message )
    if ( message == "/fixthiscar" ) then 
    	CancelEvent()
        TriggerClientEvent( 'wk:fixVehicle', source )
    end 
end )