/* 
Instruções do projeto

Uma empresa de vendas tem um banco de dados com informações sobre os seus produtos. Ela precisa criar um relatório que faça um levantamento diário da quantidade de produtos comprados por dia. Para ajudar a empresa, crie um procedure para agilizar esse processo.
*/

--Cria a tabela produtos
CREATE TABLE produtos(
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30),
    qtde_total INT
);

--Cria a tabela compras
CREATE TABLE compras(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_produto INT,
    qtde_comprada INT,
    dia_compra VARCHAR(10)
);

--Criação da Procedure
DELIMITER $
CREATE PROCEDURE pdt_cmprd_dia(dia)
BEGIN
  --Consulta as compras feitas em um determinado dia
  SELECT * FROM compras WHERE compras.dia_compra = dia;
END$$;