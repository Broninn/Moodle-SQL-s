SELECT TO_CHAR(TO_TIMESTAMP(timestart), 'DD/MM/YYYY HH24:MI:SS') FROM mdl_user_enrolments where (timestart >= extract(epoch from date_trunc('seconds', Now()))) and (timeend >= extract(epoch from date_trunc('seconds', now()))) order by timestart
