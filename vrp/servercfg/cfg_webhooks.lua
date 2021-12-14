local webhooks = {}
-- THESE LOGS CAN BE TURNED OFF BY CHANGING THE VALUE TO 'NONE'
-- THESE LOGS ONLY LOG user_id + source_id




-- ADMIN LOGS

webhooks.banlog = 'none'
webhooks.kicklog = 'none'
webhooks.warnlog = 'none'

-- JOIN/LEAVE LOGS

webhooks.joinlog = 'none'
webhooks.leavelog = 'none'




return webhooks