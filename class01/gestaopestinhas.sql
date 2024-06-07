/*
	CREATE DATABASE 'livraria'
	CHARACTER SET utf8mb4
	COLLATE utf8mb4_0900_ai_ci;
    ------------------------------
    DROP DATABASE gestaoalunos; -> Para excluir tua BD
*/
/*
	CREATE TABLE autor(
		`idautor` INT NOT NULL AUTO_INCREMENT,
        `nomeautor` VARCHAR(15) NOT NULL,
        `sobrenome` VARCHAR(30) NULL,
        PRIMARY KEY (`idautor`));
    ------------------------------
    DROP TABLE autor -> Para excluir
*/
	
    CREATE TABLE editora (
		`ideditora` INT NOT NULL AUTO_INCREMENT,
        `nomeeditora` VARCHAR(30) NOT NULL,
        PRIMARY KEY (`ideditora`)
    );
    
    CREATE TABLE livro (
		`idlivro` INT NOT NULL AUTO_INCREMENT,
        `nomelivro` VARCHAR(30) NOT NULL,
        `autor` INT NOT NULL,
        `editora` INT NOT NULL,
        PRIMARY KEY (`idlivro`),
        INDEX `fkautor_idx` (`autor` ASC) VISIBLE,
        INDEX `fkeditora_idx` (`editora`ASC) VISIBLE,
        CONSTRAINT `fkautorXlivro`
			FOREIGN KEY (`autor`)
            REFERENCES `livraria`.`autor` (`idautor`)
            ON DELETE RESTRICT
            ON UPDATE RESTRICT,
		CONSTRAINT `fkeditora`
			FOREIGN KEY (`editora`)
            REFERENCES `livraria`.`editora`(`ideditora`)
			ON DELETE RESTRICT
            ON UPDATE RESTRICT
    );