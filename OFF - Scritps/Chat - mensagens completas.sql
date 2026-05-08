SELECT 
    msg.conversationid,
    msg.useridfrom AS sender_id,
    CONCAT(sender.firstname, ' ', sender.lastname) AS "Nome Remetente",
    mcm.userid AS receiver_id,
    CONCAT(receiver.firstname, ' ', receiver.lastname) AS "Nome Destinatário",
    msg.fullmessage,
    TO_CHAR(TO_TIMESTAMP(msg.timecreated), 'DD/MM/YYYY HH24:MI:SS') AS message_time
FROM 
    mdl_messages AS msg
JOIN 
    mdl_user AS sender ON msg.useridfrom = sender.id
JOIN 
    mdl_message_conversation_members AS mcm 
    ON msg.conversationid = mcm.conversationid 
    AND mcm.userid != msg.useridfrom
JOIN 
    mdl_user AS receiver ON mcm.userid = receiver.id
WHERE 
    (msg.useridfrom in (17413, 27116, 40376) 
        OR mcm.userid in (17413, 27116, 40376)
    )
    AND sender.id != 27
    AND msg.timecreated >= EXTRACT(EPOCH FROM (NOW() - INTERVAL '150 days'))
ORDER BY 
    msg.conversationid, message_time;