UPDATE mdl_course c
SET fullname = CONCAT('Modelo - ', fullname)
WHERE c.category IN (SELECT id FROM mdl_course_categories WHERE path LIKE '%/8/%');


---------------------


UPDATE mdl_course c
SET fullname = CONCAT(fullname, ' | 2021')
WHERE c.category IN (SELECT id FROM mdl_course_categories WHERE path LIKE '%/746/%') and c.fullname not like '%2021%';



-----------------------

update mdl_course
set fullname = replace(mdl_course.fullname,'Legado IEL - ','') 
WHERE mdl_course.category IN (SELECT id FROM mdl_course_categories WHERE path LIKE '%/8331/%') and mdl_course.fullname like '%Legado IEL - %';
