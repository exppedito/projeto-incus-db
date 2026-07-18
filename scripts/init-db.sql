CREATE DATABASE meubanco;
CREATE USER admin_db WITH ENCRYPTED PASSWORD 'senhafortona123';
GRANT ALL PRIVILEGES ON DATABASE meubanco TO admin_db;
\c meubanco
CREATE TABLE teste_conexao (id SERIAL PRIMARY KEY, mensagem VARCHAR(50));
INSERT INTO teste_conexao (mensagem) VALUES ('Golden Path ativado com sucesso!');
