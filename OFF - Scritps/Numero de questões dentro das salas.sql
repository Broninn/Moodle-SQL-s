WITH salas AS (
  SELECT 
    c.id AS "Sala", 
    c.fullname AS "Disciplina", 
	cc.name AS "Raiz",
    cc2.name AS "Curso",
    cc3.name AS "cc3",
    cc4.name AS "cc4"
  FROM mdl_course c
  INNER JOIN mdl_course_categories cc ON cc.id = c.category AND cc.path LIKE '%/15/%'
  INNER JOIN mdl_course_categories cc2 ON cc2.id = cc.parent 
  INNER JOIN mdl_course_categories cc3 ON cc3.id = cc2.parent 
  INNER JOIN mdl_course_categories cc4 ON cc4.id = cc3.parent 
)
SELECT
    CASE
        WHEN s."cc4" = 'Habilitação Técnica de Nível Médio - Itinerário V Ensino Médio' THEN s."cc3"
		WHEN s."cc4" = 'Educação Profissional' THEN s."Curso"
		WHEN s."cc4" = 'SENAI' THEN s."Raiz"
		ELSE s."cc4"
    END AS "habilitação_nome",
    s."Disciplina" AS course_name,
    concat('https://ava.fiep.digital/course/view.php?id=', s."Sala") AS course_id,
    s."cc3",
    COUNT(DISTINCT q.id) AS total_questions
FROM salas s
JOIN mdl_context ctx ON ctx.instanceid = s."Sala" AND ctx.contextlevel = 50
JOIN mdl_question_categories qc ON qc.contextid = ctx.id
JOIN mdl_question_bank_entries qbe ON qbe.questioncategoryid = qc.id
JOIN (
    SELECT DISTINCT ON (questionbankentryid) *
    FROM mdl_question_versions qv2
    WHERE EXISTS (
        SELECT 1 FROM mdl_question_bank_entries qbe2
        JOIN mdl_question_categories qc2 ON qc2.id = qbe2.questioncategoryid
        JOIN mdl_context ctx2 ON ctx2.id = qc2.contextid
        JOIN mdl_course c2 ON c2.id = ctx2.instanceid
        WHERE qbe2.id = qv2.questionbankentryid 
          AND c2.id = ANY(ARRAY(SELECT "Sala" FROM salas))
    )
    ORDER BY questionbankentryid, id DESC
) qv ON qv.questionbankentryid = qbe.id
JOIN mdl_question q ON q.id = qv.questionid
GROUP BY s."Sala", s."Disciplina", s."Curso", s."cc3", s."cc4", s."Raiz"
ORDER BY "habilitação_nome", total_questions DESC;
