--Retornando todos os alunos da sala
select   
  CONCAT( u.firstname, ' ',  u.lastname)as "Nome",
  u.username as "CPF",
  c.id as "CourseID",
  c.shortname as "Disciplina", 
  g.name as "Turma"
from 
  mdl_course as c 
inner join mdl_course_categories cc on 
  cc.id = c.category 
  and c.id = 18808
inner join mdl_groups g on 
  g.courseid = c.id
inner join mdl_enrol e on
  e.courseid = c.id
  and e.enrol = 'manual'
inner join mdl_groups_members gm on
  gm.groupid = g.id
inner join mdl_user_enrolments ue on
  ue.userid = gm.userid
  and ue.enrolid = e.id
inner join mdl_user u on
  u.id = ue.userid
order by g.name


--retornando apenas alunos ativos dentro da sala 
select
CONCAT( u.firstname, ' ', u.lastname)as "Nome",
  u.email as "email",
  u.username as "Username",
  c.id as "CourseID",
  c.shortname as "Disciplina",
  g.name as "Turma"
from
  mdl_course as c
inner join mdl_course_categories cc on
  cc.id = c.category
and c.id = 10839
  inner join mdl_groups g on
  g.courseid = c.id
  and g.name like 'Grupo A'
inner join mdl_enrol e on
  e.courseid = c.id
  and e.enrol = 'manual'
inner join mdl_groups_members gm on
  gm.groupid = g.id
inner join mdl_user_enrolments ue on
  ue.userid = gm.userid
  and ue.enrolid = e.id
  and ue.status = 0
inner join mdl_user u on
  u.id = ue.userid
order by 1