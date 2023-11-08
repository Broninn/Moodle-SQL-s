SELECT *
FROM mdl_competency_template
WHERE shortname IN (
    SELECT shortname
    FROM mdl_competency_template
    GROUP BY shortname
    HAVING COUNT(*) > 1
);