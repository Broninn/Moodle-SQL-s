select c.id, c.fullname, cc.path
from mdl_course as c 
inner join mdl_course_categories cc on cc.id = c.category and 
cc."path" like '%/6028%'


select cc2.name as curso, CONCAT('https://ava.fiep.digital/course/view.php?id=',c.id) as linksala, c.fullname as nomedisciplina
from mdl_course as c 
inner join mdl_course_categories cc on cc.id = c.category and cc."path" like '%/15950/%'
inner join mdl_course_categories cc2 on cc2.id = cc.parent
order by 1


select c.id, c.fullname, c.shortname, cc.path, gc.id, gc.fullname, gc.aggregateonlygraded 
from mdl_course as c 
inner join mdl_grade_categories gc on gc.courseid = c.id
inner join mdl_course_categories cc on cc.id = c.category and cc."path" like '%/281/%'
where gc.aggregateonlygraded = 1 and (gc.fullname = 'Etapa 1 (Distância)' or gc.fullname = 'Etapa 2 (Presencial)')