/*
Instruções do projeto

Uma loja tem um banco de dados que contém todo o controle de vendas de produtos e de cadastro de clientes. Pensando nisso, crie uma função para somar todos os clientes que foram cadastrados na loja durante um dia.
*/

DELIMITER$

CREATE FUNCTION total(dia)
RETURN INT
BEGIN
returns (SELECT COUNT(*) FROM cadastros WHERE cadastros.dia = dia);
END$$

DELIMITER ;