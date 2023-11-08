update mdl_user_preferences
set
value = 0
where
name like 'auth_forcepasswordchange'
and value like '1'