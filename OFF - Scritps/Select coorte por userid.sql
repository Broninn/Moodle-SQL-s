select
    cm.cohortid as IDdoCoorte,
    cm.userid as IDdoUsuario,
    c.name as NomeDoCoorte
from
    mdl_cohort_members cm
    inner join mdl_cohort c on c.id = cm.cohortid
where
    cm.userid = 11176 --trocar o ID do usuario