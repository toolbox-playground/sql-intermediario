--1. Trigger de UPDATE (Captura de Pokémon)
--Disparada quando a quantidade de um Pokémon diminui, registrando a captura na eventos_safari:
DROP TRIGGER IF EXISTS trg_log_captura_safari_update;

DELIMITER //

CREATE TRIGGER `trg_log_captura_safari_update`
AFTER UPDATE ON `safari_log`
FOR EACH ROW
BEGIN
    DECLARE v_nome_pokemon VARCHAR(100);
    DECLARE v_mensagem VARCHAR(255);

    -- Busca o nome do pokemon a partir do pokedex_number inserido na safari_log
    SELECT name INTO v_nome_pokemon 
    FROM pokemon 
    WHERE pokedex_number = NEW.pokedex_number;

    -- Concatena a mensagem informando qual pokemon foi gerado
    SET v_mensagem = CONCAT('O pokemon ', COALESCE(v_nome_pokemon, 'desconhecido'), '. Um ou mais pokemons foram capturados na regiao!');
    -- Verifica se a quantidade de pokémons diminuiu
    IF NEW.quantidade < OLD.quantidade THEN
        INSERT INTO eventos_safari (
            treinador_id,
            cidade,
            quantidade,
            mensagem,
            pokedex_number
        ) VALUES (
            NULL,
            NEW.cidade,
            (OLD.quantidade - NEW.quantidade),
            v_mensagem,
            NEW.pokedex_number
        );
    END IF;
END //

DELIMITER ;

-- 2. Trigger de DELETE (Catástrofe/Extermínio)
-- Disparada quando um registro de habitat é removido por completo do log do Safari:
DROP TRIGGER IF EXISTS trg_log_catastrofe_safari_delete;

DELIMITER //

CREATE TRIGGER `trg_log_catastrofe_safari_delete`
AFTER DELETE ON `safari_log`
FOR EACH ROW
BEGIN

    DECLARE v_nome_pokemon VARCHAR(100);
    DECLARE v_mensagem VARCHAR(255);

    -- Busca o nome do pokemon a partir do pokedex_number inserido na safari_log
    SELECT name INTO v_nome_pokemon 
    FROM pokemon 
    WHERE pokedex_number = OLD.pokedex_number;

    -- Concatena a mensagem informando qual pokemon foi gerado
    SET v_mensagem = CONCAT('ALERTA: Uma catastrofe aconteceu e os pokemons ', COALESCE(v_nome_pokemon, 'desconhecido'), '. foram exterminados da regiao! Autoridades foram acionadas para investigar.');
    
    INSERT INTO eventos_safari (
        treinador_id,
        cidade,
        quantidade,
        mensagem,
        pokedex_number
    ) VALUES (
        NULL,
        OLD.cidade,
        OLD.quantidade,
        v_mensagem,
        OLD.pokedex_number
    );
END //

DELIMITER ;
