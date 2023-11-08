select 
ct.id as cactttemplateid,
c.id as cacttcompetencyid

from mdl_competency c 
inner join mdl_competency_framework cf on cf.id = c.competencyframeworkid
inner join mdl_competency_template ct on ct.shortname = cf.shortname
order by 1