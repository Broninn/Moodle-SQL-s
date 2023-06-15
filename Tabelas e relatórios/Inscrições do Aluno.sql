select mu.id as UserId, mu.username, concat(mu.firstname, ' ', mu.lastname) as nome, mc.id as CourseId, mc.fullname as Curso, to_timestamp(mue.timestart) as inicio, to_timestamp(mue.timeend) as termino, case when to_timestamp(mue.timestart)>= now() and mue.status = 0 then 'Aguardando data de Início' when to_timestamp(mue.timestart)< now() and mue.status = 0 then 'Em Andamento' when mue.status = 1 then 'Concluído' end as Status from mdl_user mu inner join mdl_user_enrolments mue on mue.userid = mu.id inner join mdl_enrol me on me.id = mue.enrolid inner join mdl_course mc on mc.id = me.courseid order by mu.id
