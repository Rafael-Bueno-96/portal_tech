--Cria um banco de dados para uma loja de venda de carros
CREATE DATABASE lojadecarros;

--Seleciona o banco
USE lojadecarros;

--Cria a tabela vendedores
CREATE TABLE vendedores(
    id_vendedor INT AUTO_INCREMENT PRIMARY KEY,
    id_nome VARCHAR(60),
    vendas_mes INT
);

--Cria a tabela carros
CREATE TABLE carros(
    id_carro INT AUTO_INCREMENT PRIMARY KEY,
    nome_carro VARCHAR(60),
    marca_carro VARCHAR(60)
);

--Cria a tabela vendas
CREATE TABLE vendas(
    id_venda INT AUTO_INCREMENT PRIMARY KEY,
    vendedor_id INT,
    carro_id INT,
    --Cria os relacionamentos
    CONSTRAINT fk_venda_vendedor FOREIGN KEY (vendedor_id) REFERENCES vendedores(id_vendedor),
    CONSTRAINT fk_venda_carro FOREIGN KEY (carro_id) REFERENCES carros(id_carro)
);

--Insere dados na tabela vendedores
INSERT INTO vendedores(id_nome, vendas_mes) VALUES('Demerval', 10), ('Marieta', 13), ('Petrolino', 8), ('Juscelino', 0);

--Insere dados na tabela carros
INSERT INTO carros(nome_carro, marca_carro) VALUES('Fusca', 'Volkswagen'), ('Opala', 'Chevrolet'), ('Brasilia', 'Volkswagen'), ('Variant', 'Volkswagen');

--Insere dados na tabela vendas
INSERT INTO vendas(vendedor_id, carro_id) VALUES(1, 3), (3, 1), (2, 2), (null, 4);

--Mostra somente o ID da venda e o vendedor que estão relacionadas(ignora nulos)
SELECT id_venda, id_nome FROM vendas INNER JOIN vendedores
ON vendas.vendedor_id = vendedores.id_vendedor

--Mostra o ID de todas as vendas, mesmo que não exita um vendedor
SELECT id_venda, id_nome FROM vendas LEFT JOIN vendedores
ON vendas.vendedor_id = vendedores.id_vendedor

--Mostra o vendedor, mesmo que não tenha realizado nenhuma venda
SELECT id_venda, id_nome FROM vendas RIGHT JOIN vendedores
ON vendas.vendedor_id = vendedores.id_vendedor

--Mostra todos os Ids das vendas e todos os vendedores, mesmo que existam valores nulos
SELECT id_venda, id_nome FROM vendas LEFT JOIN vendedores
ON vendas.vendedor_id = vendedores.id_vendedor
UNION
SELECT id_venda, id_nome FROM vendas RIGHT JOIN vendedores
ON vendas.vendedor_id = vendedores.id_vendedor


