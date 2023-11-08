update
	mdl_grade_categories gi1
set
	aggregation = 11
from 
	mdl_grade_categories gi2
inner join mdl_course c on 
	gi2.courseid = c.id and 
	gi2.aggregation = 10 and
	gi2.fullname like 'Avaliações Etapa 1 -  SGE'
inner join mdl_course_categories cc on 
	cc.id = c.category 
	and cc."path" like '%/914/%' --alterar para categoria correta
where
	gi2.fullname like 'Avaliações Etapa 1 -  SGE' and
	gi2.aggregation = 10 and 
	gi1.id = gi2.id


#########################################################################


select 
	c.id, 
	c.fullname,
	cc."path",
        gi.aggregation
from 
	mdl_grade_categories gi
inner join mdl_course c on 
	gi.courseid = c.id and 
	gi.aggregation = 10 and
	gi.fullname like 'Avaliações Etapa 1 -  SGE'
inner join mdl_course_categories cc on 
	cc.id = c.category 
	and cc."path" like '%/----/%'--alterar para categoria correta
where
	gi.aggregation = 10 and
	gi.fullname like 'Avaliações Etapa 1 -  SGE'

order by cc."path"