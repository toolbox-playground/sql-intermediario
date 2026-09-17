-- Como Testar a Integração
-- Execute a captura chamando a Procedure:

CALL sp_capturar_pokemon_safari(1, 'Pikachu', 'Sparky', 12);
Verifique se o Pokémon foi registrado para o treinador:

SELECT * FROM treinador_pokemons WHERE treinador_id = 1;
Verifique a quantidade atualizada no Safari Log:

SELECT * FROM safari_log WHERE pokedex_number
