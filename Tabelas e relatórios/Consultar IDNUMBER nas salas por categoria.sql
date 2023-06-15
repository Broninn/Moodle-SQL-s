###############################################################

select gi.idnumber from mdl_grade_items as gi 
inner join mdl_course c on c.id = gi.courseid
inner join mdl_course_categories cc on cc.id = c.category and cc."path" like '%/752/%'
where gi.idnumber = 'AE1A1'

###############################################################

select * from mdl_grade_items as gi
inner join mdl_course c on c.id = gi.courseid
inner join mdl_course_categories cc on cc.id = c.category and cc."path" like '%/3440%' --alterar para categoria correta
where gi.itemtype like 'category' and (gi.idnumber = 'AE1A1'  or gi.idnumber is null  or gi.idnumber = '' )
order by gi.idnumber

###############################################################

select * from mdl_grade_items as gi
inner join mdl_course c on c.id = gi.courseid
inner join mdl_course_categories cc on cc.id = c.category and 
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
order by gi.idnumber