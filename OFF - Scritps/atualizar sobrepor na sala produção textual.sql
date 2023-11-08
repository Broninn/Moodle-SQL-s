-- Nome da atividade -> 1T Seg1 - Atividade Avaliativa 1
SELECT * FROM "mdl_grade_grades" WHERE "finalgrade" = '70' and itemid = 82204
update "mdl_grade_grades" set overridden = 0, finalgrade = null  WHERE "finalgrade" = '70' and itemid = 82204

-- Nome da atividade -> 1T Seg3 - Atividade Avaliativa 1
SELECT * FROM "mdl_grade_grades" WHERE "finalgrade" = '70' and itemid = 82212
update "mdl_grade_grades" set overridden = 0, finalgrade = null  WHERE "finalgrade" = '70' and itemid = 82212

-- Nome da atividade -> 1T Seg1 - Scorm - Motivação
SELECT * FROM "mdl_grade_grades" WHERE "finalgrade" = '70' and itemid = 82181
update "mdl_grade_grades" set overridden = 0, finalgrade = null  WHERE "finalgrade" = '70' and itemid = 82181



SANDBOX
-- Nome da atividade -> 1T Seg1 - Atividade Avaliativa 1
SELECT * FROM "mdl_grade_grades" WHERE "finalgrade" = '70' and itemid = 79578

update "mdl_grade_grades" 
set overridden = 0, finalgrade = null WHERE "finalgrade" = '70' and itemid = 79578
