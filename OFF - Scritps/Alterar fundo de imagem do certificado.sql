-- Subir a imagem do certificado a nivel contexto sistema
-- Executar o comando abaixo, alterando o id. Esse ID é o id do recurso bgimage do certificado, dentro do editar certificado.
WITH updated_data AS (
    SELECT
        id,
        jsonb_set(
            jsonb_set(data :: jsonb, '{contextid}', '1' :: jsonb, true),
            '{filename}',
            '"Certificado_UniSenai.png"' :: jsonb,
            true
        ) AS updated_data
    FROM
        mdl_customcert_elements
    WHERE
        id = 41910
        or id = 41920
        
)
UPDATE
    mdl_customcert_elements AS cce
SET
    data = ud.updated_data
FROM
    updated_data AS ud
WHERE
    cce.id = ud.id;

-- SELECT "id" FROM "mdl_customcert_elements" WHERE "element" = 'bgimage' AND "data" LIKE '%"Certificado_UniSenai.png"%'