select 
/*mc.id as IDDisciplina,
mc.shortname as NomeDisciplina,
mcf.id as IDEstrutura,
mcf.shortname as NomeEstrutura,
mct.id as IDModeloDePlano,
mct.shortname as NomeModeloDePlano*/

concat(mct.id, ',' , mc.id)
from mdl_competency mc
inner join mdl_competency_framework mcf on mcf.id = mc.competencyframeworkid
inner join mdl_competency_template mct on mct.shortname = mcf.shortname
where mc.competencyframeworkid = 50