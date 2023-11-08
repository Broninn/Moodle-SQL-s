select 

c.fullname,
g.courseid

from mdl_groupings g
inner join mdl_course c on c.id = g.courseid
inner join mdl_course_categories cc on cc.id = c.category and cc."path" like '%/1/%'
order by 2