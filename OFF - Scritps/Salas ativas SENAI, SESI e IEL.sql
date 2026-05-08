//SENAI
select count(distinct(c.id)) from mdl_course c
inner join mdl_course_categories cc on cc.id = c.category and cc.path like '%/68/%'
inner join mdl_course_categories mcc on mcc.id = c.category
inner join mdl_course_categories mcc2 on mcc2.id = mcc.parent
    AND mcc2.name NOT LIKE '%PERIODO%'
    inner join mdl_course_categories mcc3 on mcc3.id = mcc2.parent
    inner join mdl_course_categories mcc4 on mcc4.id = mcc3.parent
    AND mcc4.name NOT LIKE '%2021%'
WHERE c.visible = 1

////////////////////////////////

//SESI
select count(distinct(c.id)) from mdl_course c
inner join mdl_course_categories cc on cc.id = c.category and cc.path like '%/803/%'
inner join mdl_course_categories mcc on mcc.id = c.category
inner join mdl_course_categories mcc2 on mcc2.id = mcc.parent
    AND mcc2.name NOT LIKE '%PERIODO%'
    inner join mdl_course_categories mcc3 on mcc3.id = mcc2.parent
    inner join mdl_course_categories mcc4 on mcc4.id = mcc3.parent
    AND mcc4.name NOT LIKE '%2021%'
WHERE c.visible = 1

////////////////////////////////

//IEL
select count(distinct(c.id)) from mdl_course c
inner join mdl_course_categories cc on cc.id = c.category and cc.path like '%/744/%'
inner join mdl_course_categories mcc on mcc.id = c.category
inner join mdl_course_categories mcc2 on mcc2.id = mcc.parent
    AND mcc2.name NOT LIKE '%PERIODO%'
    inner join mdl_course_categories mcc3 on mcc3.id = mcc2.parent
    inner join mdl_course_categories mcc4 on mcc4.id = mcc3.parent
    AND mcc4.name NOT LIKE '%2022%'
    AND mcc4.name NOT LIKE '%2021%'
WHERE c.visible = 1