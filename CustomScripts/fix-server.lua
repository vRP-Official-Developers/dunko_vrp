AddEventHandler('chatMessage', function(source, name, msg)
	if msg == "/fix" then
		CancelEvent();
		TriggerClientEvent('murtaza:fix', source);
	end
end)
