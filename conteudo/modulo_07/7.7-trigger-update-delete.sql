--1. Trigger de UPDATE (Captura de Pokémon)
--Disparada quando a quantidade de um Pokémon diminui, registrando a captura na eventos_safari:

DELIMITER //

CREATE TRIGGER `trg_log_captura_safari_update`
AFTER UPDATE ON `safari_log`
FOR EACH ROW
BEGIN
    -- Verifica se a quantidade de pokémons diminuiu
    IF NEW.quantidade < OLD.quantidade THEN
        INSERT INTO eventos_safari (
            treinador_id,
            cidade,
            quantidade,
            mensagem
        ) VALUES (
            NULL,
            NEW.cidade,
            (OLD.quantidade - NEW.quantidade),
            'Um ou mais pokemons foram capturados na regiao!'
        );
    END IF;
END //

DELIMITER ;

-- 2. Trigger de DELETE (Catástrofe/Extermínio)
-- Disparada quando um registro de habitat é removido por completo do log do Safari:

DELIMITER //

CREATE TRIGGER `trg_log_catastrofe_safari_delete`
AFTER DELETE ON `safari_log`
FOR EACH ROW
BEGIN
    INSERT INTO eventos_safari (
        treinador_id,
        cidade,
        quantidade,
        mensagem
    ) VALUES (
        NULL,
        OLD.cidade,
        OLD.quantidade,
        'ALERTA: Uma catastrofe aconteceu e os pokemons foram exterminados da regiao! Autoridades foram acionadas para investigar.'
    );
END //

DELIMITER ;
