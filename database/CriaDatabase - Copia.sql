

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

  ENGINE = MyISAM
  DEFAULT CHARACTER SET = utf8
  COLLATE = utf8_general_ci;



-- -----------------------------------------------------
-- CRIA TABELA Clientes
-- -----------------------------------------------------


CREATE  TABLE IF NOT EXISTS `avaliacao`.`tbl_clientes` (
  `cli_index` INT(3) NOT NULL AUTO_INCREMENT ,
  `cli_nome` VARCHAR(70) NOT NULL ,
  `cli_idade` INT(3) ,
  `cli_telefone` INT(12) ,
  `cli_endereco` VARCHAR(70) ,
  `cli_categoria` INT(3) NOT NULL ,
  `cli_identificador` INT(5) NOT NULL ,
   

  PRIMARY KEY (`cli_index`) ,
  UNIQUE INDEX `cli_identificador_UNIQUE` (`cli_identificador` ASC),
  CONSTRAINT `cli_categoria`
  FOREIGN KEY (`cli_categoria`)
  REFERENCES `avaliacao`.`tbl_categorias` (`cat_index` )
)

  ENGINE = MyISAM
  DEFAULT CHARACTER SET = utf8
  COLLATE = utf8_general_ci;




-- -----------------------------------------------------
-- SQL PARA CARGA NA BASE
-- -----------------------------------------------------


INSERT INTO tbl_categorias (cat_nome, cat_status, cat_identificador) VALUES ('APOIO', 'ATIVO', '10');

INSERT INTO tbl_categorias (cat_nome, cat_status, cat_identificador) VALUES ('ADMINISTRATIVO', 'ATIVO', '20');



INSERT INTO tbl_clientes (cli_nome, cli_categoria, cli_identificador) VALUES ('Manoel', '10', '00005');






