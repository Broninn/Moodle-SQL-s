SELECT pid, 
       now() - query_start AS duracao, 
       state, 
       query 
FROM pg_stat_activity 
WHERE state = 'active' 
  AND query NOT LIKE '%pg_stat_activity%'
ORDER BY duracao DESC;
