SELECT 
 d.id,
 d.instanceid AS courseid,
 f.name AS fieldname,
 f.shortname AS fieldkey,
 d.value,
 d.charvalue 
FROM 
 mdl_customfield_data d 
INNER JOIN mdl_customfield_field f ON f.id=d.fieldid
where 
 f.shortname like 'carga_horaria' and
 (d.value ~'[a-z]' or d.charvalue ~ '[a-z]') 