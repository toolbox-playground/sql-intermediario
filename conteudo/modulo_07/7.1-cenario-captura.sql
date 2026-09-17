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

2: Captura de um Pikachu em Fuchsia City
O treinador ID 1 capturou um Pikachu (pokedex_number = 25) em Fuchsia City.

-- 1. Registra a captura para o treinador
INSERT INTO treinador_pokemons (treinador_id, pokedex_number, apelido, nivel) 
VALUES (1, 25, 'Faisca', 5);

-- 2. Reduz em 1 a quantidade populacional em Fuchsia City
UPDATE safari_log 
SET quantidade = quantidade - 1 
WHERE pokedex_number = 25 
  AND cidade = 'Fuchsia City';

Cenário 3: Captura de um Scyther no Sinnoh Great Marsh
O treinador ID 3 capturou um Scyther (pokedex_number = 123) no Sinnoh Great Marsh.

SQL
-- 1. Registra a captura para o treinador
INSERT INTO treinador_pokemons (treinador_id, pokedex_number, apelido, nivel) 
VALUES (3, 123, 'CortaVento', 22);

-- 2. Reduz em 1 a quantidade populacional no Sinnoh Great Marsh
UPDATE safari_log 
SET quantidade = quantidade - 1 
WHERE pokedex_number = 123 
  AND cidade = 'Sinnoh Great Marsh';

Cenário 4: Captura de um Dratini na Johto Safari Zone
O treinador ID 4 capturou um Dratini (pokedex_number = 147) na Johto Safari Zone.

-- 1. Registra a captura para o treinador
INSERT INTO treinador_pokemons (treinador_id, pokedex_number, apelido, nivel) 
VALUES (4, 147, 'BlueDragon', 10);

-- 2. Reduz em 1 a quantidade populacional em Johto Safari Zone
UPDATE safari_log 
SET quantidade = quantidade - 1 
WHERE pokedex_number = 147 
  AND cidade = 'Johto Safari Zone';

Cenário 5: Captura de um Eevee na Kalos Safari Zone
O treinador ID 5 capturou um Eevee (pokedex_number = 133) na Kalos Safari Zone.

-- 1. Registra a captura para o treinador
INSERT INTO treinador_pokemons (treinador_id, pokedex_number, apelido, nivel) 
VALUES (5, 133, 'Fofinho', 8);

-- 2. Reduz em 1 a quantidade populacional na Kalos Safari Zone
UPDATE safari_log 
SET quantidade = quantidade - 1 
WHERE pokedex_number = 133 
  AND cidade = 'Kalos Safari Zone';
