SELECT 
    concat(u.firstname, ' ', u.lastname),
    TO_CHAR(
        TO_TIMESTAMP(sub.timecreated) AT TIME ZONE 'UTC' AT TIME ZONE INTERVAL '+03:00',
        'DD/MM/YYYY HH24:MI:SS'
    ) as ultimo_login
FROM (
    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY userid ORDER BY timecreated DESC) as rn
    FROM mdl_logstore_standard_log
    WHERE eventname LIKE '%logg%'
      AND timecreated BETWEEN EXTRACT(EPOCH FROM (NOW() - INTERVAL '1 month'))::bigint
                          AND EXTRACT(EPOCH FROM NOW())::bigint
      AND other LIKE '%{"username"%'
) sub
JOIN mdl_user u ON u.id = sub.userid
WHERE rn = 1
ORDER BY 1

-- Acessos de usuários mensais
SELECT count(*) FROM "mdl_logstore_standard_log" 
WHERE "eventname" LIKE '%logg%' 
AND ("timecreated" BETWEEN '1698807601' AND '1701399599') 
AND "other" LIKE '%{"username"%'