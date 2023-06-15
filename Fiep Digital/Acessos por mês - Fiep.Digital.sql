SELECT DISTINCT userid AS "UID", to_char(to_timestamp(timecreated), 'MM/YYYY') AS "DATA", 'Fiep.Digital' AS "INSTANCIA" FROM mdl_logstore_standard_log WHERE userid > 2 AND action = 'loggedin' AND ( ( date_part('year', to_timestamp(timecreated)) = 2020 AND date_part('month', to_timestamp(timecreated)) > 1 ) OR date_part('year', to_timestamp(timecreated)) > 2020 );
