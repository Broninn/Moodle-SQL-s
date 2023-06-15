update
        mdl_quiz q1
set
	attempts = 5
from 
	mdl_quiz q2
inner join mdl_course c on 
	c.id = q2.course 
        and q2.attempts = 2
inner join mdl_course_categories cc on 
	cc.id = c.category 
	and cc."path" like '%/533%'--alterar para categoria correta
where
	q2.attempts = 2
	and q1.id = q2.id


#########################################################################


select 
        c.id, 
	c.fullname,
	cc."path",
        q.attempts
from mdl_quiz q
inner join mdl_course c on 
	c.id = q.course 
        and q.attempts = 2
inner join mdl_course_categories cc on 
	cc.id = c.category 
	and cc."path" like '%/533%'--alterar para categoria correta
where
	q.attempts = 2