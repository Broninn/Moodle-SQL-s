--AVA
SELECT
    username,
    firstname,
    lastname,
    email,
    TO_CHAR(TO_TIMESTAMP(lastaccess), 'DD/MM/YYYY HH24:MI:SS') AS lastaccess_br
FROM
    mdl_user
WHERE
    lastaccess > 1688180400; --alterar data timestamp para a data desejada


SELECT
    username,
    firstname,
    lastname,
    email,
    CASE 
        WHEN lastaccess = 0 THEN 'Nunca acessou'
        ELSE CONCAT(
            EXTRACT(DAY FROM NOW() - TO_TIMESTAMP(lastaccess)), ' dias e ',
            EXTRACT(HOUR FROM NOW() - TO_TIMESTAMP(lastaccess)), ' horas'
        )
    END AS lastaccess_relative
FROM
    mdl_user
WHERE
    lastaccess > 1688180400


--SESCOOP
SELECT
    username,
    firstname,
    lastname,
    email,
    DATE_FORMAT(FROM_UNIXTIME(lastaccess), '%d/%m/%Y %H:%i:%s') AS lastaccess_br
FROM
    mdl_user
WHERE
    lastaccess > 1688180400 --alterar data timestamp para a data desejada


