--Stored Procedure para Capturar Pokémon
--A procedure abstrai o processo de inserção: você passa apenas o ID do treinador, o nome do Pokémon, o apelido e o nível. A procedure localiza o pokedex_number e insere o registro na treinador_pokemons, o que automaticamente dispara a trigger acima.

DELIMITER //

CREATE PROCEDURE `sp_capturar_pokemon_safari`(
    IN p_treinador_id INT,
    IN p_nome_pokemon VARCHAR(100),
    IN p_apelido VARCHAR(100),
    IN p_nivel INT
)
BEGIN
    DECLARE v_pokedex_number INT;

    -- Busca o pokedex_number correspondente ao nome
    SELECT pokedex_number INTO v_pokedex_number
    FROM pokemon
    WHERE LOWER(name) = LOWER(p_nome_pokemon)
    LIMIT 1;

    -- Se o Pokémon existir, insere o registro (disparando a TRIGGER)
    IF (v_pokedex_number IS NOT NULL) THEN
        INSERT INTO treinador_pokemons (
            treinador_id, 
            pokedex_number, 
            apelido, 
            nivel
        ) VALUES (
            p_treinador_id, 
            v_pokedex_number, 
            p_apelido, 
            COALESCE(p_nivel, 1)
        );
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Pokémon não encontrado na base de dados!';
    END IF;
END //

DELIMITER ;
