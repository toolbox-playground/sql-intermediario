1: Captura de um Psyduck em Kanto Safari Zone
O treinador ID 2 capturou o Psyduck (pokedex_number = 54) na Kanto Safari Zone.

-- 1. Registra a captura para o treinador
INSERT INTO treinador_pokemons (treinador_id, pokedex_number, apelido, nivel) 
VALUES (2, 54, 'Duck', 15);

-- 2. Reduz em 1 a quantidade populacional na Safari Zone de Kanto
UPDATE safari_log 
SET quantidade = quantidade - 1 
WHERE pokedex_number = 54 
  AND cidade = 'Kanto Safari Zone';
