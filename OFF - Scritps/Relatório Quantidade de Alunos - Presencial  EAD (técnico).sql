select
    concat('https://ava.fiep.digital/user/index.php?id=',c.id),
    c.fullname as Disciplina,
    COUNT(DISTINCT CONCAT (u.firstname, ' ', u.lastname)) AS QuantidadeAlunos
from
    mdl_course c
    inner join mdl_enrol e on e.courseid = c.id
    and e.enrol = 'manual'
    inner join mdl_course_modules mcm on mcm.course = c.id
    inner join mdl_user_enrolments ue on ue.enrolid = e.id
    inner join mdl_user u on u.id = ue.userid
    and ue.status = 0
    inner join mdl_course_categories cc on cc.id = c.category
    and c.fullname like '%Gerencial%'
    and (
        cc."path" like '%/16775%'
        or cc."path" like '%/14830%'
        or cc."path" like '%/18234%'
        or cc."path" like '%/14909%'
    )
    and cc.id = c.category
    inner join mdl_groupings gpn on gpn.courseid = c.id
    and gpn.idnumber is not null
    and gpn.idnumber != ''
    inner join mdl_groupings_groups gpg on gpg.groupingid = gpn.id
    inner join mdl_groups gp on gp.id = gpg.groupid
    and gp.courseid = c.id
    inner join mdl_groups_members gpm on gpm.groupid = gp.id
    and gpm.userid = u.id
    inner join mdl_role_assignments ra on ra.userid = ue.userid
    and ra.roleid = 5
    inner join mdl_context ct on ct.contextlevel = 50
    and ct.id = ra.contextid
    and ct.instanceid = e.courseid
group by
    c.id,
    disciplina
order by
1