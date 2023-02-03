--Cria um banco de dados para uma empresa de recrutamento
CREATE DATABASE recrutamento;

--Seleciona o banco
USE recrutamento;

--Cria a tabela candidatos
CREATE TABLE candidatos(
    id_candidato INT AUTO_INCREMENT PRIMARY KEY,
    nome_candidato VARCHAR(60)
);

--Cria a tabela funcionarios
CREATE TABLE funcionarios(
    id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(60)
);

--Insere dados na tabela candidatos
INSERT INTO candidatos(nome_candidato) VALUES('Cleberson'), ('Julina'), ('Zeferino');

--Insere dados na tabela funcionarios
INSERT INTO funcionarios(nome_funcionario) VALUES('Creide'), ('Jovescley'), ('Leoncio');

--Cria uma trigger que apaga o candidato toda vez que seu nome virar funcionario
DELIMITER $

CREATE TRIGGER novo_funcionario
AFTER INSERT ON funcionarios
FOR EACH ROW
BEGIN
    DELETE FROM candidatos WHERE candidatos.nome_candidato = NEW.nome_funcionario;
END$$;

--Insere 'Julina' em funcionarios e apaga de candidatos por causa da trigger
INSERT INTO funcionarios (nome_funcionario) VALUES('Julina');