DELIMITER //

CREATE PROCEDURE `sp_gerar_log_safari_aleatorio`()
BEGIN
    DECLARE i INT DEFAULT 1;
    DECLARE v_pokedex_number INT;
    DECLARE v_quantidade INT;
    DECLARE v_sexo VARCHAR(5);
    DECLARE v_cidade VARCHAR(100);

    WHILE i <= 200 DO
        -- Seleciona um pokedex_number existente de forma aleatória
        SELECT pokedex_number INTO v_pokedex_number 
        FROM pokemon 
        ORDER BY RAND() 
        LIMIT 1;

        -- Gera uma quantidade aleatória entre 1 e 50
        SET v_quantidade = FLOOR(1 + RAND() * 50);

        -- Define o sexo aleatoriamente (1 = M, 2 = F, 3 = N/A)
        SET v_sexo = ELT(FLOOR(1 + RAND() * 3), 'M', 'F', 'N/A');

        -- Sorteia a cidade de origem da população
        SET v_cidade = ELT(FLOOR(1 + RAND() * 5), 
            'Fuchsia City', 
            'Kanto Safari Zone', 
            'Sinnoh Great Marsh', 
            'Johto Safari Zone', 
            'Kalos Safari Zone'
        );

        -- Insere o registro na tabela de log
        INSERT INTO safari_log (pokedex_number, quantidade, sexo, cidade)
        VALUES (v_pokedex_number, v_quantidade, v_sexo, v_cidade);

        SET i = i + 1;
    END WHILE;
END //

DELIMITER ;
