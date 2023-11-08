-- Deixar os campos iguais
Update mdl_customfield_data
Set value = charvalue
FROM mdl_customfield_field 
where mdl_customfield_field.shortname like 'carga_horaria' 
and mdl_customfield_data.value <> mdl_customfield_data.charvalue

-- Tirar o espaço, virgula e h do value
Update mdl_customfield_data
Set value = replace(replace(replace(mdl_customfield_data.value,',',''),' ',''),'h','')
FROM mdl_customfield_field 
where mdl_customfield_field.shortname like 'carga_horaria' 
and mdl_customfield_data.value ~ '[a-z]'

-- Tirar o espaço, virgula e h do charvalue
Update mdl_customfield_data
Set charvalue = replace(replace(replace(mdl_customfield_data.charvalue,',',''),' ',''),'h','')
FROM mdl_customfield_field 
where mdl_customfield_field.shortname like 'carga_horaria' 
and mdl_customfield_data.charvalue ~ '[a-z]'

-- Setar para 0 os campos nulos
Update mdl_customfield_data
Set value = '0', charvalue = '0'
FROM mdl_customfield_field 
where mdl_customfield_field.shortname like 'carga_horaria' and
(mdl_customfield_data.value like '' or mdl_customfield_data.charvalue like '')