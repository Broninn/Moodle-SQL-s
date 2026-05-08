select
    cm.cohortid as IDdoCoorte,
    cm.userid as IDdoUsuario,
    c.name as NomeDoCoorte
from
    mdl_cohort_members cm
    inner join mdl_cohort c on c.id = cm.cohortid
where
    cm.userid = 11176 --trocar o ID do usuario


select
    cm.cohortid as cvalue,
    cm.userid as uvalue

from
    mdl_cohort_members cm
    inner join mdl_cohort c on c.id = cm.cohortid
where
    cm.userid = 65126
-- PARA MULTIPLOS USUARIOS
select
    cm.cohortid as cvalue,
    cm.userid as uvalue
from
    mdl_cohort_members cm
    inner join mdl_cohort c on c.id = cm.cohortid
where
    cm.userid = 113573 or cm.userid = 117875 or cm.userid = 112990 --trocar o ID do usuario