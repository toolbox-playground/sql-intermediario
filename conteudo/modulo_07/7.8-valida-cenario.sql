-- Testando os Cenários
-- 1. Simular uma captura (UPDATE):
UPDATE safari_log 
SET quantidade = quantidade - 1 
WHERE pokedex_number = 25 AND cidade = 'Fuchsia City';

-- 2. Simular uma catástrofe (DELETE):
DELETE FROM safari_log 
WHERE log_id = 789;
-- 3. Verificar as notificações geradas:
SELECT * FROM eventos_safari ORDER BY evento_id DESC;
