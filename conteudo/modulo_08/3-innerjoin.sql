select p.name, count(1)
FROM pokemon as p
INNER JOIN treinador_pokemons tp 
ON tp.pokedex_number = p.pokedex_number
group by p.name;

select p.name, count(1), t.nome
FROM pokemon as p
INNER JOIN treinador_pokemons as tp 
INNER JOIN treinadores as t
ON tp.pokedex_number = p.pokedex_number
AND t.treinador_id = tp.treinador_id
group by p.name, t.nome
