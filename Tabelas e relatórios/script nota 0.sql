select
  gi.courseid,
  ue.userid,
  gi.itemname,
  gi.idnumber,
  to_timestamp(ue.timeend),
  to_timestamp(ue.timeend - 259200) 
from
  mdl_grade_grades gg2
inner join mdl_grade_items gi on
  gi.id = gg2.itemid
  and gi.idnumber ~ '^AE[0-9]A[0-9]$'
  --and gi.courseid = 3562
inner join mdl_enrol e on
  e.courseid = gi.courseid
  and e.enrol = 'manual'
inner join mdl_user_enrolments ue on
  ue.userid = gg2.userid
  and ue.enrolid = e.id
  and ue.timeend > 0
  and (extract(epoch from date_trunc('seconds', now())) < ue.timeend and extract(epoch from date_trunc('seconds', now())) >= ue.timeend - 259200)
inner join mdl_role_assignments ra on
  ra.userid = gg2.userid
  and ra.roleid = 5
inner join mdl_context ct on
  ct.contextlevel = 50
  and ct.id = ra.contextid
  and ct.instanceid = gi.courseid
where
  gg2.finalgrade is null;



update
  mdl_grade_grades gg1
set
  finalgrade = 0
from
  mdl_grade_grades gg2
inner join mdl_grade_items gi on
  gi.id = gg2.itemid
  and gi.idnumber ~ '^AE[0-9]A[0-9]$'
  --and gi.courseid = 3562
inner join mdl_enrol e on
  e.courseid = gi.courseid
  and e.enrol = 'manual'
inner join mdl_user_enrolments ue on
  ue.userid = gg2.userid
  and ue.enrolid = e.id
  and ue.timeend > 0
  and (extract(epoch from date_trunc('seconds', now())) < ue.timeend and extract(epoch from date_trunc('seconds', now())) >= ue.timeend - 259200)
inner join mdl_role_assignments ra on
  ra.userid = gg2.userid
  and ra.roleid = 5
inner join mdl_context ct on
  ct.contextlevel = 50
  and ct.id = ra.contextid
  and ct.instanceid = gi.courseid
where
  gg2.finalgrade is null
  and gg1.id = gg2.id;