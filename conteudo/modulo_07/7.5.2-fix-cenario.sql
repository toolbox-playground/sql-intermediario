ALTER TABLE eventos_safari
ADD COLUMN pokedex_number INT NULL,
ADD CONSTRAINT fk_eventos_safari_pokemon
    FOREIGN KEY (pokedex_number) 
    REFERENCES pokemon(id);

-- fix da trigger
DROP TRIGGER IF EXISTS trg_notificar_novos_pokemons_safari;

DELIMITER //

CREATE TRIGGER `trg_notificar_novos_pokemons_safari` 
AFTER INSERT ON `safari_log` 
FOR EACH ROW 
BEGIN
    DECLARE v_nome_pokemon VARCHAR(100);
    DECLARE v_mensagem VARCHAR(255);

    -- Busca o nome do pokemon a partir do pokedex_number inserido na safari_log
    SELECT name INTO v_nome_pokemon 
    FROM pokemon 
    WHERE pokedex_number = NEW.pokedex_number;

    -- Concatena a mensagem informando qual pokemon foi gerado
    SET v_mensagem = CONCAT('O pokemon ', COALESCE(v_nome_pokemon, 'desconhecido'), ' foi gerado com sucesso!');

    -- Insere o registro no log de eventos incluindo a nova coluna pokedex_number
    INSERT INTO eventos_safari (
        treinador_id, 
        cidade, 
        quantidade, 
        mensagem, 
        pokedex_number
    ) VALUES (
        NULL, -- Não há treinador associado na geração de habitat
        NEW.cidade, 
        NEW.quantidade, 
        v_mensagem, 
        NEW.pokedex_number
    );
END //

DELIMITER ;
