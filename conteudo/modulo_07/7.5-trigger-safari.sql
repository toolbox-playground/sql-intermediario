-- Criando a tabela de eventos de captura no safari
CREATE TABLE IF NOT EXISTS eventos_safari (
    evento_id INT AUTO_INCREMENT PRIMARY KEY,
    treinador_id INT NULL,
    cidade VARCHAR(100) NOT NULL,
    quantidade INT NOT NULL,
    mensagem VARCHAR(255) NOT NULL,
    data_evento TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 2. Trigger na Tabela safari_log
--Toda vez que uma nova linha for inserida na safari_log (por exemplo, durante a geração inicial de população ou repovoamento), a trigger registrará o evento automaticamente.

DELIMITER //

CREATE TRIGGER `trg_notificar_novos_pokemons_safari`
AFTER INSERT ON `safari_log`
FOR EACH ROW
BEGIN
    INSERT INTO eventos_safari (
        treinador_id,
        cidade,
        quantidade,
        mensagem
    ) VALUES (
        NULL, -- Não há treinador associado na geração de habitat
        NEW.cidade,
        NEW.quantidade,
        'Novos pokemons foram gerados com sucesso!'
    );
END //

DELIMITER ;
