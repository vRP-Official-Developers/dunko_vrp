local webhooks = {}
-- THESE LOGS CAN BE TURNED OFF BY CHANGING THE VALUE TO 'NONE'
-- THESE LOGS ONLY LOG user_id + source_id




-- ADMIN LOGS



-- JOIN/LEAVE LOGS

webhooks.spawnlog = 'https://canary.discord.com/api/webhooks/911789640409833522/zz0lcxcxeCs1WRGcIBQv1Rk4c4lNyRJJpFrwtvhYIrFr1eaKTo21vv1bihxeaJmnVuM3' -- when player passes queue and is spawned.
webhooks.leavelog = 'none' -- when any player leaves server.




return webhooks