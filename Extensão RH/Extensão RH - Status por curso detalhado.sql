select c.id as IdDiscplina, c.fullname as Disciplina, mcc2.name as Curso, case when carga_horaria.value is null or carga_horaria.value = '' then 'Não informado' else carga_horaria.value end as carga_horaria, gpn.name as unidade, u.id, u.username, u.email, concat(u.firstname, ' ', u.lastname) as nome, to_timestamp(ue.timestart) as inicio, to_timestamp(ue.timeend) as termino, gi.idnumber as "avaliacao", gi.itemname as "nome avaliacao", gg.finalgrade, mq.attempts as "Tentativas Disponiveis", count(mcmc.id) as modulo, count(distinct mqa.id) as "Tentativas Utilizadas", case when count(mcmc.id) = 0 then 'Não Iniciado' when gg.finalgrade >= 7 then 'Aprovado' when gg.finalgrade > 0 and gg.finalgrade < 7 and ((mq.attempts = count(distinct mqa.id))) then 'Reprovado' when count(mcmc.id) > 0 and (gg.finalgrade is null or (gg.finalgrade>0 and count(distinct mqa.id)< mq.attempts)) then 'Em andamento' end as processo from mdl_course c inner join mdl_enrol e on e.courseid = c.id and e.enrol = 'manual' inner join mdl_course_modules mcm on mcm.course = c.id inner join mdl_user_enrolments ue on ue.enrolid = e.id inner join mdl_user u on u.id = ue.userid left join mdl_course_modules_completion mcmc on mcm.id = mcmc.coursemoduleid and mcmc.userid = u.id inner join mdl_grade_items gi on gi.courseid = c.id and gi.idnumber ~ '^(AE|RE)[0-9](A|R)[0-9]$|RF3R1' inner join mdl_grade_grades gg on gg.itemid = gi.id and gg.userid = u.id inner join mdl_course_categories cc on cc."path" ~ '/752/' and cc.id = c.category inner join mdl_groupings gpn on gpn.courseid = c.id and gpn.idnumber is not null and gpn.idnumber != '' inner join mdl_groupings_groups gpg on gpg.groupingid = gpn.id inner join mdl_groups gp on gp.id = gpg.groupid and gp.courseid = c.id inner join mdl_groups_members gpm on gpm.groupid = gp.id and gpm.userid = u.id inner join mdl_course_categories mcc on mcc.id = c.category inner join mdl_course_categories mcc2 on mcc2.id = mcc.parent inner join mdl_quiz mq on mq.course = c.id left join mdl_quiz_attempts mqa on mqa.quiz = mq.id and mqa.userid = u.id left join mdl_customfield_data carga_horaria on carga_horaria.fieldid = 9 and carga_horaria.instanceid = c.id group by curso, disciplina, c.id, u.id, u.username, carga_horaria, nome, inicio, termino, avaliacao, "nome avaliacao", unidade, gg.finalgrade, "Tentativas Disponiveis"
