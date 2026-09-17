1. Trigger de Atualização Automática do Safari Log
A trigger abaixo é acionada após cada inserção na tabela treinador_pokemons. Ela busca a cidade onde a população do Pokémon capturado é maior que zero e reduz a quantidade disponível em 1 unidade.

DELIMITER //

CREATE TRIGGER `trg_atualizar_safari_apos_captura`
AFTER INSERT ON `treinador_pokemons`
FOR EACH ROW
BEGIN
    -- Reduz em 1 a quantidade da espécie na primeira cidade que tiver população disponível
    UPDATE safari_log
    SET quantidade = quantidade - 1
    WHERE pokedex_number = NEW.pokedex_number
      AND quantidade > 0
    ORDER BY quantidade DESC
    LIMIT 1;
END //

DELIMITER ;
