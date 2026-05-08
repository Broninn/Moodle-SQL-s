SELECT
  CASE
    WHEN cc3.name = 'Distância' THEN cc2.name
    ELSE cc3.name
  END AS nome_curso,
  concat (
    '%%WWWROOT%%/admin/tool/lp/coursecompetencies.php%%Q%%courseid=',
    c.id
  )
FROM
  mdl_course c
  INNER JOIN mdl_course_categories cc ON cc.id = c.category
  AND cc.path LIKE '%/66/%'
  and c.fullname like '%2026%'
  INNER JOIN mdl_course_categories cc2 on cc2.id = cc.parent
  INNER JOIN mdl_course_categories cc3 on cc3.id = cc2.parent
  LEFT JOIN mdl_competency_coursecomp cpt on cpt.courseid = c.id
where
  cpt.competencyid IS NULL
order by
  1