SELECT
    c.id AS IdDisciplina,
    c.fullname AS Disciplina,
    mcc2.name AS Curso,
    COALESCE(carga_horaria.value, 'Não informado') AS carga_horaria,
    gpn.name AS unidade,
    u.id,
    u.username,
    u.email,
    CONCAT(u.firstname, ' ', u.lastname) AS nome,
    TO_TIMESTAMP(ue.timestart) AS inicio,
    TO_TIMESTAMP(ue.timeend) AS termino,
    gi.idnumber AS "avaliacao",
    gi.itemname AS "nome avaliacao",
    gg.finalgrade,
    mq.attempts AS "Tentativas Disponiveis",
    COUNT(mcmc.id) AS modulo,
    COUNT(DISTINCT mqa.id) AS "Tentativas Utilizadas",
    CASE
        WHEN COUNT(mcmc.id) = 0 THEN 'Não Iniciado'
        WHEN gg.finalgrade >= 7 THEN 'Aprovado'
        WHEN gg.finalgrade > 0 AND gg.finalgrade < 7 AND mq.attempts = COUNT(DISTINCT mqa.id) THEN 'Reprovado'
        WHEN COUNT(mcmc.id) > 0 AND (gg.finalgrade IS NULL OR (gg.finalgrade > 0 AND COUNT(DISTINCT mqa.id) < mq.attempts)) THEN 'Em andamento'
    END AS processo
FROM
    mdl_course AS c
    INNER JOIN mdl_enrol AS e ON e.courseid = c.id AND e.enrol = 'manual'
    INNER JOIN mdl_user_enrolments AS ue ON ue.enrolid = e.id
    INNER JOIN mdl_user AS u ON u.id = ue.userid
    LEFT JOIN mdl_course_modules_completion AS mcmc ON mcmc.coursemoduleid = (
        SELECT mcm.id
        FROM mdl_course_modules AS mcm
        WHERE mcm.course = c.id
        LIMIT 1
    ) AND mcmc.userid = u.id
    INNER JOIN mdl_grade_items AS gi ON gi.courseid = c.id AND gi.idnumber ~ '^(AE|RE)[0-9](A|R)[0-9]$|RF3R1'
    INNER JOIN mdl_grade_grades AS gg ON gg.itemid = gi.id AND gg.userid = u.id
    INNER JOIN mdl_course_categories AS cc ON cc.id = c.category
    INNER JOIN mdl_groupings AS gpn ON gpn.courseid = c.id AND gpn.idnumber IS NOT NULL AND gpn.idnumber != ''
    INNER JOIN mdl_groupings_groups AS gpg ON gpg.groupingid = gpn.id
    INNER JOIN mdl_groups AS gp ON gp.id = gpg.groupid AND gp.courseid = c.id
    INNER JOIN mdl_groups_members AS gpm ON gpm.groupid = gp.id AND gpm.userid = u.id
    INNER JOIN mdl_course_categories AS mcc ON mcc.id = c.category
    INNER JOIN mdl_course_categories AS mcc2 ON mcc2.id = mcc.parent
    INNER JOIN mdl_quiz AS mq ON mq.course = c.id
    LEFT JOIN mdl_quiz_attempts AS mqa ON mqa.quiz = mq.id AND mqa.userid = u.id
    LEFT JOIN mdl_customfield_data AS carga_horaria ON carga_horaria.fieldid = 9 AND carga_horaria.instanceid = c.id
WHERE
    cc."path" ~ '/752/' -- Filtro adicionado para a categoria
GROUP BY
    c.id,
    u.id,
    carga_horaria,
    gg.finalgrade,
    Curso,
    Disciplina,
    u.username,
    nome,
    inicio,
    termino,
    avaliacao,
    "nome avaliacao",
    unidade,
    "Tentativas Disponiveis";
