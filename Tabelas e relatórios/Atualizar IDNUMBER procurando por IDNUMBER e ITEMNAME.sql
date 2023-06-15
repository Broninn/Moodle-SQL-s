update
	mdl_grade_items gi1
set
	idnumber = 'AE2A1' 
from 
	mdl_grade_items gi2
inner join mdl_course c on 
	gi2.courseid = c.id and 
	gi2.idnumber like '' and
        gi2.idnumber !~ '^AE[0-9]A[0-9]$' and 
        gi2.itemname like 'Atividades Avaliativas'
inner join mdl_course_categories cc on 
	cc.id = c.category 
	and cc."path" like '%/2708/%' --alterar para categoria correta
where
	gi2.idnumber like '' and
        gi2.idnumber !~ '^AE[0-9]A[0-9]$' and 
        gi2.itemname like 'Atividades Avaliativas'
	and gi1.id = gi2.id




select * from mdl_grade_items as gi
inner join mdl_course c on c.id = gi.courseid
inner join mdl_course_categories cc on cc.id = c.category --and cc."path" like '%/3440%' --alterar para categoria correta
where
	gi.idnumber like '' and
        gi.idnumber !~ '^AE[0-9]A[0-9]$' and 
        gi.itemname like 'Atividades Avaliativas'
order by gi.idnumber