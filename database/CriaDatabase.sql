

-- -----------------------------------------------------
-- CRIA DATABASE
-- -----------------------------------------------------

CREATE DATABASE avaliacao;

USE avaliacao;



-- -----------------------------------------------------
-- CRIA TABELA categorias 
-- -----------------------------------------------------


CREATE  TABLE IF NOT EXISTS `avaliacao`.`tbl_categorias` (
  `cat_index` INT(3) NOT NULL AUTO_INCREMENT ,
  `cat_nome` VARCHAR(70) NOT NULL ,
  `cat_status` VARCHAR(30) ,
  `cat_identificador` INT(5) NOT NULL ,
   

  PRIMARY KEY (`cat_index`) ,
  UNIQUE INDEX `cat_identificador_UNIQUE` (`cat_identificador` ASC) )

  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8
  COLLATE = utf8_general_ci;



-- -----------------------------------------------------
-- CRIA TABELA Clientes
-- -----------------------------------------------------


CREATE  TABLE IF NOT EXISTS `avaliacao`.`tbl_clientes` (
  `cli_index` INT(3) NOT NULL AUTO_INCREMENT ,
  `cli_categoria` INT(3) NOT NULL ,
  `cli_nome` VARCHAR(70) NOT NULL ,
  `cli_idade` INT(3) ,
  `cli_telefone` INT(12) ,
  `cli_endereco` VARCHAR(70) ,
  `cli_identificador` INT(5) NOT NULL ,
   

  PRIMARY KEY (`cli_index`) ,
  UNIQUE INDEX `cli_identificador_UNIQUE` (`cli_identificador` ASC))

  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8
  COLLATE = utf8_general_ci;


ALTER TABLE `tbl_clientes` ADD CONSTRAINT `fk_tbl_categorias` FOREIGN KEY (`cli_categoria`) REFERENCES `tbl_categorias` (`cat_index` );




-- -----------------------------------------------------
-- SQL PARA CARGA NA BASE
-- -----------------------------------------------------


INSERT INTO tbl_categorias (cat_nome, cat_status, cat_identificador) VALUES ('APOIO', 'ATIVO', '10');

INSERT INTO tbl_categorias (cat_nome, cat_status, cat_identificador) VALUES ('ADMINISTRATIVO', 'ATIVO', '20');



INSERT INTO tbl_clientes (cli_categoria, cli_nome, cli_identificador) VALUES ('1', 'Manoel', '00005');

INSERT INTO tbl_clientes (cli_categoria, cli_nome, cli_identificador) VALUES ('1', 'Carlos', '00008');

INSERT INTO tbl_clientes (cli_categoria, cli_nome, cli_identificador) VALUES ('2', 'Carlos', '00010');

INSERT INTO tbl_clientes (cli_categoria, cli_nome, cli_identificador) VALUES ('1', 'Moacir', '00050');





