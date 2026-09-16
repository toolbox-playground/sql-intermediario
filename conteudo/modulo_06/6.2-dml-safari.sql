USE pokemon_db;

CREATE TABLE IF NOT EXISTS safari_log (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    pokedex_number INT NOT NULL,
    quantidade INT NOT NULL DEFAULT 1,
    sexo ENUM('M', 'F', 'N/A') NOT NULL DEFAULT 'N/A',
    cidade VARCHAR(100) NOT NULL,
    data_registro TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    
    CONSTRAINT fk_safari_pokemon 
        FOREIGN KEY (pokedex_number) 
        REFERENCES pokemon(pokedex_number) 
        ON DELETE RESTRICT
);
