-- Coletar notas sobrepostas SENAI
SELECT
    mcc2.name AS "Curso",
    c.fullname AS "Disciplina",
    CONCAT(
        'https://ava.fiep.digital/course/view.php?id=',
        c.id
    ) AS "Link sala",
    u.id AS "ID do usuario",
    CONCAT(u.firstname, ' ', u.lastname) AS "Nome Completo",
    ROUND(gg.finalgrade) AS "Nota",
    case
        when gg.overridden > 0 then 'sobreposto'
    end as Sobreposto
FROM
    mdl_course AS c
    INNER JOIN mdl_enrol AS e ON e.courseid = c.id
    AND e.enrol = 'manual'
    INNER JOIN mdl_user_enrolments AS ue ON ue.enrolid = e.id
    INNER JOIN mdl_user AS u ON u.id = ue.userid
    INNER JOIN mdl_grade_items AS gi ON gi.courseid = c.id
    INNER JOIN mdl_grade_grades AS gg ON gg.itemid = gi.id
    AND gg.userid = u.id
    and gg.overridden > 0
    INNER JOIN mdl_course_categories AS cc ON cc.id = c.category
    INNER JOIN mdl_course_categories AS mcc ON mcc.id = c.category
    INNER JOIN mdl_course_categories AS mcc2 ON mcc2.id = mcc.parent
    INNER JOIN mdl_role_assignments ra ON ra.userid = gg.userid
    AND ra.roleid = 5
    INNER JOIN mdl_context ct ON ct.contextlevel = 50
    AND ct.id = ra.contextid
    AND ct.instanceid = gi.courseid
WHERE
    cc."path" ~ '/10670/' or -- Filtro adicionado para a categoria
    cc."path" ~ '/10671/' or
    cc."path" ~ '/10671/' or
    cc."path" ~ '/10671/' 
GROUP BY
    c.id,
    u.id,
    gg.finalgrade,
    mcc2.name,
    c.fullname,
    "Nome Completo",
    gg.overridden
ORDER BY
    1,
    2,
    5


-----------------------------------------------------------------------------

-- Coletar notas do IEL

SELECT
    mcc2.name AS "Curso",
    c.fullname AS "Disciplina",
    CONCAT(
        'https://ava.fiep.digital/course/view.php?id=',
        c.id
    ) AS "Link sala",
    u.id AS "ID do usuario",
    CONCAT(u.firstname, ' ', u.lastname) AS "Nome Completo",
    ROUND(gg.finalgrade,1) AS "Nota"
FROM
    mdl_course AS c
    INNER JOIN mdl_enrol AS e ON e.courseid = c.id
    AND e.enrol = 'manual'
    INNER JOIN mdl_user_enrolments AS ue ON ue.enrolid = e.id
    INNER JOIN mdl_user AS u ON u.id = ue.userid
    INNER JOIN mdl_grade_items AS gi ON gi.courseid = c.id
    AND gi.itemtype like '%course%'
    INNER JOIN mdl_grade_grades AS gg ON gg.itemid = gi.id
    AND gg.userid = u.id
    AND gg.finalgrade > 0
    INNER JOIN mdl_course_categories AS cc ON cc.id = c.category
    INNER JOIN mdl_course_categories AS mcc ON mcc.id = c.category
    INNER JOIN mdl_course_categories AS mcc2 ON mcc2.id = mcc.parent
    INNER JOIN mdl_role_assignments ra ON ra.userid = gg.userid
    AND ra.roleid = 5
    INNER JOIN mdl_context ct ON ct.contextlevel = 50
    AND ct.id = ra.contextid
    AND ct.instanceid = gi.courseid
WHERE
    cc."path" ~ '/2622/' or -- Filtro adicionado para a categoria
    cc."path" ~ '/2580/' or
    cc."path" ~ '/2580/' or
    cc."path" ~ '/2580/' 
GROUP BY
    c.id,
    u.id,
    gg.finalgrade,
    mcc2.name,
    c.fullname,
    "Nome Completo"
ORDER BY
    1,
    2,
    5