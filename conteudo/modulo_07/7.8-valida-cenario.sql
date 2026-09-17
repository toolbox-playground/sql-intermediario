-- Testando os Cenários
-- 1. Simular uma captura (UPDATE):
UPDATE safari_log 
SET quantidade = quantidade - 1 
WHERE pokedex_number = 25 AND cidade = 'Kanto Safari Zone';

-- 2. Simular uma catástrofe (DELETE):
DELETE FROM safari_log 
WHERE pokedex_number = 25 AND cidade = 'Kanto Safari Zone';

-- 3. Verificar as notificações geradas:
SELECT * FROM eventos_safari ORDER BY data_evento
