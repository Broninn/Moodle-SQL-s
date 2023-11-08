--SELECT
select
    ue.userid,
    ue.status,
    ue.timeend,
    concat('https://ava.fiep.digital/user/index.php?id=',  c.id)
from
    mdl_user_enrolments ue
    inner join mdl_enrol e on e.id = ue.enrolid
    and ue.status = 1
    and e.enrol = 'manual' --1 = suspenso | 0 = ativo, precisa alterar o status e alterar o ue.timeend
    inner join mdl_course c on c.id = e.courseid --and c.id = 23366
    inner join mdl_role_assignments ra on ra.userid = ue.userid
    and ra.roleid = 5
    inner join mdl_context ct on ct.contextlevel = 50
    and ct.id = ra.contextid
    and ct.instanceid = c.id
    inner join mdl_course_categories cc on cc.id = c.category
    and cc."path" like '%/8947/%'
    --left join mdl_groups gp on gp.courseid = c.id
    --inner join mdl_groups_members gpm on gpm.groupid = gp.id
    --and gpm.userid = ue.userid
order by
    1 
    
    
--UPDATE
UPDATE
    mdl_user_enrolments
SET
    status = 0,
    timeend = 1698144660
FROM
    mdl_enrol e,
    mdl_course c,
    mdl_role_assignments ra,
    mdl_context ct,
    mdl_course_categories cc
WHERE
    mdl_user_enrolments.enrolid = e.id
    AND c.id = e.courseid
    AND ra.userid = mdl_user_enrolments.userid
    AND ct.contextlevel = 50
    AND ct.id = ra.contextid
    AND ct.instanceid = c.id
    AND cc.id = c.category
    AND cc."path" LIKE '%/8558/%'
    AND mdl_user_enrolments.status = 1
    AND e.enrol = 'manual'
    AND ra.roleid = 5;