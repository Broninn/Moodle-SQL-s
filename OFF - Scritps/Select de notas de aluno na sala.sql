select
  gi.courseid,
  ue.userid,
  gi.itemname,
  gi.idnumber,
  gg2.finalgrade,
  gi.itemtype,
  gi.itemmodule,
gi.id,
gg2.itemid
from
  mdl_grade_grades gg2
inner join mdl_grade_items gi on
  gi.id = gg2.itemid
  and gi.courseid = 16811
  and gg2.userid = 5298
inner join mdl_enrol e on
  e.courseid = gi.courseid
  and e.enrol = 'manual'
inner join mdl_user_enrolments ue on
  ue.userid = gg2.userid
  and ue.enrolid = e.id 
inner join mdl_role_assignments ra on
  ra.userid = gg2.userid
  and ra.roleid = 5
inner join mdl_context ct on
  ct.contextlevel = 50
  and ct.id = ra.contextid
  and ct.instanceid = gi.courseid
order by gi.idnumber

-- O que identifiquei aqui:
/*
Para o userid = 5298 retorna 19 resultados (não volta a etapa 2 completa)
Para o userid = 1062 retorna 25 resultados (volta a etapa 2)

aparentemente pra essa turma https://ava.fiep.digital/user/index.php?id=16811 TEC-N-000011/2023 nao aparece.
Para a TEC-N-000012/2023 sim.

*/