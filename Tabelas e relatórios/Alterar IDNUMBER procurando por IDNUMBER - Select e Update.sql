update
	mdl_grade_items gi1
set
	idnumber = 'AE2A1' 
from 
	mdl_grade_items gi2
inner join mdl_course c on 
	gi2.courseid = c.id and 
	gi2.idnumber like 'AE1A1'
inner join mdl_course_categories cc on 
	cc.id = c.category 
	and cc."path" like '%/xxx/%' --alterar para categoria correta
where
	gi2.idnumber like 'AE1A1'
	and gi1.id = gi2.id


#########################################################################


select 
	c.id, 
	c.fullname,
	cc."path" 
from 
	mdl_grade_items gi
inner join mdl_course c on 
	gi.courseid = c.id and 
	gi.idnumber like 'AE1A1'
inner join mdl_course_categories cc on 
	cc.id = c.category 
	and cc."path" like '%/xxx/%'--alterar para categoria correta
where
	gi.idnumber like 'AE1A1'

order by cc."path"


#############

select 
	c.id, 
	c.fullname,
	cc."path",
        gi.idnumber,
        gi.itemname
from 
	mdl_grade_items gi
inner join mdl_course c on 
	gi.courseid = c.id 
inner join mdl_course_categories cc on 
	cc.id = c.category and
	(
cc."path" like '%/3440%' or
cc."path" like '%/824%' or
cc."path" like '%/2709%' or
cc."path" like '%/903%' or
cc."path" like '%/775%' or
cc."path" like '%/3039%' or
cc."path" like '%/747%' or
cc."path" like '%/3080%' or
cc."path" like '%/752%' or
cc."path" like '%/2715%' or
cc."path" like '%/2714%' or
cc."path" like '%/2718%' or
cc."path" like '%/2719%' or
cc."path" like '%/3023%' or
cc."path" like '%/2613%' or
cc."path" like '%/892%' or
cc."path" like '%/3538%' 
)
where gi.itemtype like 'category' and (gi.idnumber = 'AE1A1'  or gi.idnumber is null  or gi.idnumber = '' )

order by cc."path"