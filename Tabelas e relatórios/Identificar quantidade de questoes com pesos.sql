select 

mq.course,
mq.sumgrades,
mq.grade,
mqs.maxmark

from mdl_quiz_slots mqs
inner join mdl_quiz mq on mq.id = mqs.quizid
where mq.course = xxx