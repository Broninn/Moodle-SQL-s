SELECT
    CONCAT(u.firstname, ' ', u.lastname) AS nome,
    TO_TIMESTAMP(u.lastaccess) AT TIME ZONE 'UTC' AS data_hora,
    EXTRACT(
        YEAR
        FROM
            TO_TIMESTAMP(u.lastaccess) AT TIME ZONE 'UTC'
    ) * 12 as teste,
    CASE
        WHEN c.id = 70 THEN c.name
        WHEN c.id = 76 THEN c.name
        WHEN c.id = 77 THEN c.name
    END AS "Casa"
FROM
    mdl_cohort_members cm
    INNER JOIN mdl_cohort c ON c.id = cm.cohortid
    INNER JOIN mdl_user u ON u.id = cm.userid
WHERE
    c.id IN (70, 76, 77)
    AND EXTRACT(
        YEAR
        FROM
            TO_TIMESTAMP(u.lastaccess) AT TIME ZONE 'UTC'
    ) * 12 + EXTRACT(
        MONTH
        FROM
            TO_TIMESTAMP(u.lastaccess) AT TIME ZONE 'UTC'
    ) <= EXTRACT(
        YEAR
        FROM
            CURRENT_DATE
    ) * 12 + EXTRACT(
        MONTH
        FROM
            CURRENT_DATE
    ) - 6;