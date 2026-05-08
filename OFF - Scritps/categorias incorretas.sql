-- SENAI 7311
SELECT
    count(*)
FROM
    "mdl_course_categories"
WHERE
    (
        ("path" LIKE '%/371/%' AND "name" LIKE '%APB-%')
        OR --SENAI APB
        ("path" LIKE '%/439/%' AND "name" LIKE '%APT-%')
        OR --SENAI APT
        ("path" LIKE '%/68/%' AND "name" LIKE '%TEC-%')
        OR --SENAI TEC
        ("path" LIKE '%/7355/%' AND "name" LIKE '%TEC-%')
        OR --SENAI TEC NEM
        ("path" LIKE '%/67/%' AND "name" LIKE '%QUA-%')
        OR --SENAI QUA
        ("path" LIKE '%/69/%' AND "name" LIKE '%APP-%')
    ) --SENAI APP



-- SESI 826
SELECT * 
FROM "mdl_course_categories" 
WHERE 
    (
        ("path" LIKE '%/5119/%' AND "name" LIKE '%ECO.%') or --SESI ECO
        ("path" LIKE '%/807/%' AND "name" LIKE '%EMNEM%') or --SESI EMNEM
        ("path" LIKE '%/808/%' AND "name" LIKE '%EJA%') --SESI EJA 
    )
    AND id not in (16160,14899,14164,14282,18778,14763,14900,19285,16159,17495,15814,17972,19221,18848,18550,13511,6374,818,6373,16651,6384,819,6383,16691,5693,5832,5121,6790,17089,13831,13830,18346,12633,18226,16609,19058,12634,18524,13092,18883)
ORDER BY 2;
