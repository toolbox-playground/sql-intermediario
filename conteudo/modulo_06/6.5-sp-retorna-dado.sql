DELIMITER //

CREATE PROCEDURE `sp_obter_nome_treinador`(
    IN p_treinador_id INT,
    OUT p_nome_saida VARCHAR(100)
)
BEGIN
    -- Busca o nome do treinador e armazena na variável de saída
    SELECT nome INTO p_nome_saida
    FROM treinadores
    WHERE treinador_id = p_treinador_id
    LIMIT 1;
END //

DELIMITER ;

-- Para preencher uma variável global/sessão (@nome_treinador) e fazer o SELECT nela em seguida:
-- 1. Executa a procedure passando o ID do treinador (ex: 1) e a variável global
```
CALL sp_obter_nome_treinador(1, @nome_treinador);
```

-- 2. Faz o SELECT na variável preenchida
```
SELECT @nome_treinador AS nome_do_treinador;
```
