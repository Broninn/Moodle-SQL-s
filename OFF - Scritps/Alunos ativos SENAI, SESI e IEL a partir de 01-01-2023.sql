//SENAI
select count(distinct u.id) from mdl_user_enrolments ue
inner join mdl_enrol e on e.id = ue.enrolid
inner join  mdl_course c on c.id = e.courseid
inner join mdl_course_categories cc on cc."path" ~ '/68/'
    and cc.id = c.category
inner join mdl_user u on u.id = ue.userid
    and ue.status = 0
    and ue.timestart > 1641006000
    and ue.timeend != 0
inner join mdl_role_assignments ra on
  ra.userid = ue.userid
  and ra.roleid = 5
inner join mdl_context ct on
  ct.contextlevel = 50
  and ct.id = ra.contextid
  and ct.instanceid = c.id

////////////////////////////////

//SESI
select count(distinct u.id) from mdl_user_enrolments ue
inner join mdl_enrol e on e.id = ue.enrolid
inner join  mdl_course c on c.id = e.courseid
inner join mdl_course_categories cc on cc."path" ~ '/803/'
    and cc.id = c.category
inner join mdl_user u on u.id = ue.userid
    and ue.status = 0
    and ue.timestart > 1641006000
    and ue.timeend != 0
inner join mdl_role_assignments ra on
  ra.userid = ue.userid
  and ra.roleid = 5
inner join mdl_context ct on
  ct.contextlevel = 50
  and ct.id = ra.contextid
  and ct.instanceid = c.id


//IEL
select count(distinct u.id) from mdl_user_enrolments ue
inner join mdl_enrol e on e.id = ue.enrolid
inner join  mdl_course c on c.id = e.courseid
inner join mdl_course_categories cc on cc."path" ~ '/743/'
    and cc.id = c.category
inner join mdl_user u on u.id = ue.userid
    and ue.status = 0
    and ue.timestart > 1641006000
    and ue.timeend != 0
inner join mdl_role_assignments ra on
  ra.userid = ue.userid
  and ra.roleid = 5
inner join mdl_context ct on
  ct.contextlevel = 50
  and ct.id = ra.contextid
  and ct.instanceid = c.id