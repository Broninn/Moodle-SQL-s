SELECT 
 d.id,
 d.instanceid AS courseid,
 f.name AS fieldname,
 d.value,
 d.charvalue,
 c.shortname As "Nome do curso",
 c.idnumber
FROM 
 mdl_customfield_data d INNER JOIN mdl_customfield_field f ON f.id=d.fieldid
 INNER JOIN mdl_course c on c.id = d.instanceid
WHERE 
 f.shortname like 'carga_horaria' and
 (d.value ~'[a-z]' or d.charvalue ~ '[a-z]') and
 c.idnumber != ''
ORDER BY c.idnumber