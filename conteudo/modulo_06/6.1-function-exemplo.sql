DELIMITER //

CREATE FUNCTION `fn_fraco_contra_grass`(p_name VARCHAR(100)) 
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE v_against_grass DECIMAL(3, 2);

    -- Busca o multiplicador de dano sofrido contra o tipo grass
    SELECT against_grass INTO v_against_grass 
    FROM pokemon 
    WHERE name = p_name 
    LIMIT 1;

    -- Regra de negócio para verificar fraqueza
    IF (v_against_grass > 1.0) THEN
        RETURN 'É fraco contra Planta!';
    ELSEIF (v_against_grass = 1.0) THEN
        RETURN 'Dano normal contra Planta!';
    ELSE
        RETURN 'Resistente/Imune a Planta!';
    END IF;
END //

DELIMITER ;

SELECT fn_fraco_contra_grass('Squirtle');
