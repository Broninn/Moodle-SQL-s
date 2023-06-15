select count(distinct userid) as 'ACESSOS', from_unixtime(timecreated,'%d/%m/%Y') as 'DATA', 'IELPR' as "INSTANCIA" from mdl_logstore_standard_log where `action` = 'loggedin' AND timecreated >= UNIX_TIMESTAMP('2020-01-01') group by `DATA`, `INSTANCIA`
