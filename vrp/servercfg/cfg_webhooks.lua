local webhooks = {}
-- THESE LOGS CAN BE TURNED OFF BY CHANGING THE VALUE TO 'NONE'
-- THESE LOGS ONLY LOG user_id + source_id




-- ADMIN LOGS
webhooks.banlog = 'none' -- when a player is kicked
webhooks.unbanlog = 'none' -- when a player is unbanned
webhooks.kicklog = 'hone' -- when an admin kicks a player


-- JOIN/LEAVE LOGS

webhooks.spawnlog = 'none' -- when player passes queue and is spawned.
webhooks.leavelog = 'none' -- when any player leaves server.




return webhooks