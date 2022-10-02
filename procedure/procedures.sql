CREATE OR REPLACE FUNCTION users () 
    RETURNS TABLE (
        id INTEGER,
        nome VARCHAR(20),
		sobrenome VARCHAR(100),
		cpf NUMERIC(11),
		cnpj NUMERIC(14)		
) 
AS $$
BEGIN
    RETURN QUERY SELECT 
		C.id, 
		C.nome, 
		C.sobrenome, 
		F.cpf,
		J.cnpj 
	FROM 
		cliente C 
	LEFT JOIN 
		pessoa_fisica F 	 
	ON 
		C.id = F.id_cliente 
	LEFT JOIN 
		pessoa_juridica J 
	ON 
		C.id = J.id_cliente;
END; $$ 

LANGUAGE 'plpgsql';

SELECT users ();


DELETE FROM cliente;