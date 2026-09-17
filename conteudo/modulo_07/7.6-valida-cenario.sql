--Insira um registro diretamente na safari_log (ou execute a procedure de repovoamento):
INSERT INTO safari_log (pokedex_number, quantidade, sexo, cidade) 
VALUES (25, 10, 'M', 'Kanto Safari Zone');

-- Consulte a tabela de eventos para verificar a notificação automática:
SELECT * FROM eventos_safari;
