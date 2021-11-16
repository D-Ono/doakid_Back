-- -----------------------------------------------------
-- CRIA BANCO DE DADOS `doakid`
-- -----------------------------------------------------
CREATE DATABASE `doakid`;
use doakid;
-- -----------------------------------------------------
-- TABELA `familia`
-- -----------------------------------------------------
CREATE TABLE `familia` (
  `cod_familia` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `email_familia` VARCHAR(30) NOT NULL UNIQUE,
  `nome` VARCHAR(30) NOT NULL,
  `sobrenome` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`cod_familia`)
);

-- -----------------------------------------------------
-- TABELA `escola`
-- -----------------------------------------------------
CREATE TABLE `escola` (
  `cod_escola` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `nome_escola` VARCHAR(25) NOT NULL,
  `email_escola` VARCHAR(30) NOT NULL UNIQUE,
  `senha` VARCHAR(10) NOT NULL, 
  `rua_escola` VARCHAR(50) NOT NULL,
  `numero_rua` INT NOT NULL,
  `bairro_escola` VARCHAR(50) NOT NULL,
  `horario_funcionamento_inicio` TIME NOT NULL,
  `horario_funcionamento_fim` TIME NOT NULL,
  PRIMARY KEY (`cod_escola`)
);

-- -----------------------------------------------------
-- TABELA `telefoneFamilia`
-- -----------------------------------------------------
create table `telefoneFamilia` (
	`numero` VARCHAR(14) NOT NULL UNIQUE,
    `cod_familia` INT NOT NULL,
	PRIMARY KEY (`numero`),
	FOREIGN KEY (`cod_familia`)
        REFERENCES `familia`(`cod_familia`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- TABELA `telefoneEscola`
-- -----------------------------------------------------
create table `telefoneEscola` (
	`numero` VARCHAR(14) NOT NULL UNIQUE,
    `cod_escola` INT NOT NULL,
	PRIMARY KEY (`numero`),
	FOREIGN KEY (`cod_escola`)
        REFERENCES `escola`(`cod_escola`)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- -----------------------------------------------------
-- TABELA `item`
-- -----------------------------------------------------
CREATE TABLE `item` (
  `cod_item` INT NOT NULL AUTO_INCREMENT UNIQUE,
  `nome_item` VARCHAR(25) NOT NULL,
  `url` VARCHAR(250) NOT NULL,
  `descricao_item` VARCHAR(150) NOT NULL,
  `data_registro` DATE NOT NULL,
  PRIMARY KEY (`cod_item`)
);

-- -----------------------------------------------------
-- TABELA `livro`
-- -----------------------------------------------------
CREATE TABLE `livro` (
  `cod_item` INT NOT NULL UNIQUE,
  `cod_livro` INT NOT NULL UNIQUE,
  `idade_livro` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`cod_item`, `cod_livro`),
  FOREIGN KEY (`cod_item`)
		REFERENCES `item`(`cod_item`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- -----------------------------------------------------
-- TABELA `brinquedo`
-- -----------------------------------------------------
CREATE TABLE `brinquedo` (
  `cod_item` INT NOT NULL,
  `cod_brinquedo` INT NOT NULL,
  `idade_brinquedo` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`cod_item`, `cod_brinquedo`),
  FOREIGN KEY (`cod_item`)
		REFERENCES `item`(`cod_item`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- -----------------------------------------------------
-- TABELA `fralda`
-- -----------------------------------------------------
CREATE TABLE `fralda` (
  `cod_item` INT NOT NULL,
  `cod_fralda` INT NOT NULL,
  `quantidade_fralda` INT NOT NULL,
  `tamanho_fralda` VARCHAR(5) NOT NULL,
  PRIMARY KEY (`cod_item`, `cod_fralda`),
  FOREIGN KEY (`cod_item`)
		REFERENCES `item`(`cod_item`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- -----------------------------------------------------
-- TABELA `roupa`
-- -----------------------------------------------------
CREATE TABLE `roupa` (
  `cod_item` INT NOT NULL,
  `cod_roupa` INT NOT NULL,
  `tamanho_roupa` VARCHAR(3) NOT NULL,
  PRIMARY KEY (`cod_item`, `cod_roupa`),
  FOREIGN KEY (`cod_item`)
		REFERENCES `item`(`cod_item`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- -----------------------------------------------------
-- TABELA `sapato`
-- -----------------------------------------------------
CREATE TABLE `sapato` (
  `cod_item` INT NOT NULL,
  `cod_sapato` INT NOT NULL,
  `numeracao_sapato` INT NOT NULL,
  PRIMARY KEY (`cod_item`, `cod_sapato`),
  FOREIGN KEY (`cod_item`)
		REFERENCES `item`(`cod_item`)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

-- -----------------------------------------------------
-- INSERÇÃO NA TABELA `familia` - 5 TUPLAS 
-- -----------------------------------------------------
INSERT INTO `familia`(`cod_familia`, `email_familia`, `nome`, `sobrenome`)  VALUES (1, 'marcos_tadeu@gmail.com', 'Marcos', 'Tadeu');
INSERT INTO `familia`(`cod_familia`, `email_familia`, `nome`, `sobrenome`)  VALUES (2, 'jessica_2010@gmail.com', 'Jessica', 'Amaral');
INSERT INTO `familia`(`cod_familia`, `email_familia`, `nome`, `sobrenome`)  VALUES (3, 'andre_dev@gmail.com', 'Andre', 'de Souza');
INSERT INTO `familia`(`cod_familia`, `email_familia`, `nome`, `sobrenome`)  VALUES (4, 'mariana10@gmail.com', 'Mariana', 'Ribeiro dos Santos');
INSERT INTO `familia`(`cod_familia`, `email_familia`, `nome`, `sobrenome`)  VALUES (5, 'carlos_ligor@gmail.com', 'Carlos', 'Almeida');

-- -----------------------------------------------------
-- INSERÇÃO NA TABELA `escola` - 5 TUPLAS 
-- -----------------------------------------------------
INSERT INTO `escola`(`cod_escola`, `nome_escola`, `email_escola`, `senha`, `rua_escola`, `numero_rua`, `bairro_escola`, `horario_funcionamento_inicio`, `horario_funcionamento_fim`) VALUES (1, 'Escola Fernando Costa', 'fernando_costa@gmail.com', "aaa", 'Washigton Luiz', 1200, 'Centro', '08:00:00', '17:00:00');
INSERT INTO `escola`(`cod_escola`, `nome_escola`, `email_escola`, `senha`, `rua_escola`, `numero_rua`, `bairro_escola`, `horario_funcionamento_inicio`, `horario_funcionamento_fim`) VALUES (2, 'Escola Marrey Junior', 'marrey_junior@gmail.com', "bbb", 'Coronel Albino', 500, 'São Judas Tadeu', '08:00:00', '17:00:00');
INSERT INTO `escola`(`cod_escola`, `nome_escola`, `email_escola`, `senha`, `rua_escola`, `numero_rua`, `bairro_escola`, `horario_funcionamento_inicio`, `horario_funcionamento_fim`) VALUES (3, 'Escola Hugo Miele', 'hugo_miele@gmail.com', "ccc", 'Fagundes Varella', 1149, 'Vila Esperança', '08:00:00', '17:00:00');
INSERT INTO `escola`(`cod_escola`, `nome_escola`, `email_escola`, `senha`, `rua_escola`, `numero_rua`, `bairro_escola`, `horario_funcionamento_inicio`, `horario_funcionamento_fim`) VALUES (4, 'Escola Anglo', 'anglo_prudente@gmail.com', "123", 'Jose Bongiovani', 560, 'Jardim Esplanada', '08:00:00', '17:00:00');
INSERT INTO `escola`(`cod_escola`, `nome_escola`, `email_escola`, `senha`, `rua_escola`, `numero_rua`, `bairro_escola`, `horario_funcionamento_inicio`, `horario_funcionamento_fim`) VALUES (5, 'Escola Adventista', 'adventista_prudente@gmail.com', "qqq", 'Washigton Luiz', 356, 'Centro', '08:00:00', '17:00:00');

-- -----------------------------------------------------
-- INSERÇÃO NA TABELA `telefoneFamilia` - 5 TUPLAS 
-- -----------------------------------------------------
INSERT INTO `telefoneFamilia`(`numero`, `cod_familia`) VALUES ('(18)99452-3214', 1);
INSERT INTO `telefoneFamilia`(`numero`, `cod_familia`) VALUES ('(18)99632-2020', 2);
INSERT INTO `telefoneFamilia`(`numero`, `cod_familia`) VALUES ('(18)99672-4749', 3);
INSERT INTO `telefoneFamilia`(`numero`, `cod_familia`) VALUES ('(18)98100-3270', 4);
INSERT INTO `telefoneFamilia`(`numero`, `cod_familia`) VALUES ('(18)99881-8801', 5);

-- -----------------------------------------------------
-- INSERÇÃO NA TABELA `telefoneEscola` - 5 TUPLAS 
-- -----------------------------------------------------
INSERT INTO `telefoneEscola`(`numero`, `cod_escola`) VALUES ('(18)3223-1585', 1);
INSERT INTO `telefoneEscola`(`numero`, `cod_escola`) VALUES ('(18)3223-1232', 2);
INSERT INTO `telefoneEscola`(`numero`, `cod_escola`) VALUES ('(18)3223-5462', 3);
INSERT INTO `telefoneEscola`(`numero`, `cod_escola`) VALUES ('(18)3223-6598', 4);
INSERT INTO `telefoneEscola`(`numero`, `cod_escola`) VALUES ('(18)3223-1245', 5);

-- -----------------------------------------------------
-- INSERÇÃO NA TABELA `item` - 25 TUPLAS 
-- -----------------------------------------------------
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (1, 'O Patinho Feio', 'https://www.extra-imagens.com.br/Control/ArquivoExibir.aspx?IdArquivo=1853086133', 'Livro infantil', '2021-08-05');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (6, 'Cabe na Mala.', 'https://www.moderna.com.br/data/files/15/83/3D/1E/8BACD310507C0AD328A8A8A8/9788516083397.jpg', 'Livro educativo', '2021-08-05');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (7, 'Gato pra cá, rato pra lá', 'Livro infantil', '2021-08-05');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (8, 'Papai!', 'Livro infantil', '2021-08-05');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (9, 'O ratinho, o morango vermelho maduro e o grande urso esfomeado!', 'Livro infantil', '2021-08-05');

INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (2, 'Caminhão de bombeiro', 'https://cf.shopee.com.br/file/8b00c4f9093f493f6ebdd36b8281008d_tn', 'Caminhão de brinquedo que espirra água', '2021-07-29');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (10, 'Boneca', 'https://d3ddx6b2p2pevg.cloudfront.net/Custom/Content/Products/10/09/1009621_boneca-multikids-baby-wow-analu-rosa-br732_m7_636810322265700895', 'Boneca com mamadeira e fraldas', '2021-07-29');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (11, 'Kit de cozinha', 'Panelas, pratos e talheres de plástico', '2021-07-29');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (12, 'Ferramentas', 'Ferramentas diversas de plástico', '2021-07-29');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (13, 'Quebra-cabeça', 'Quebra-cabeça da Frozen com peças em MDF', '2021-07-29');

INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (3, 'Body', 'https://www.extra-imagens.com.br/Control/ArquivoExibir.aspx?IdArquivo=1627505965', 'Body azul aveludado em ótimo estado', '2021-08-03');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (14, 'Macacão', 'https://img.clasf.com.br/2018/10/29/Macaco-Infantil-Roupas-De-Criana-Beb-Mms-Manga-Longa-20181029025816.1164240015.jpg', 'Macacão de vermelho do M', '2021-08-03');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (15, 'Camiseta', 'Camiseta da Patrulha Canina', '2021-08-03');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (16, 'Calça', 'Calça de moletom verde', '2021-08-03');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (17, 'Regata', 'Regata branca lisa', '2021-08-03');

INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (4, 'Fralda', 'https://static.netshoes.com.br/produtos/fralda-pampers-confort-sec-rn-plus-36-tiras/60/EKV-0014-460/EKV-0014-460_zoom1.jpg?ts=1608149894', 'Fralda Pampers', '2021-08-04');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (18, 'Fralda', 'https://cdn1.staticpanvel.com.br/produtos/15/109268-15.jpg', 'Fralda Pampers', '2021-08-04');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (19, 'Fralda', 'Fralda MamyPoko', '2021-08-04');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (20, 'Fralda', 'Fralda Turma da Mônica', '2021-08-04');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (21, 'Fralda', 'Fralda MamyPoko', '2021-08-04');

INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (5, 'Tênis', 'https://img.lojasrenner.com.br/item/552612478/small/5.jpg', 'Tênis infantil vermelho', '2021-08-05');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (22, 'Sapatilha', 'https://cdnv2.moovin.com.br/cirandinha/imagens/produtos/original/kidy-i8-01502313330-bailarina-c5d5ff792a417653cbc064395a918d70.jpg', 'Sapatilha verde com gliter', '2021-08-05');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (23, 'Tênis', 'Tênis esportivo', '2021-08-05');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (24, 'Chinelo', 'Chinelo havaianas amarelo', '2021-08-05');
INSERT INTO `item` (`cod_item`, `nome_item`, `url`, `descricao_item`, `data_registro`) VALUES (25, 'Galocha', 'Galochas vermelhas do Relâmpago McQueen', '2021-08-05');

-- -----------------------------------------------------
-- INSERÇÃO NA TABELA `livro` - 5 TUPLAS 
-- -----------------------------------------------------
INSERT INTO `livro` (`cod_item`, `cod_livro`, `idade_livro`) VALUES (1, '1234', '2-5 anos');
INSERT INTO `livro` (`cod_item`, `cod_livro`, `idade_livro`) VALUES (6, '1239', '2-5 anos');
INSERT INTO `livro` (`cod_item`, `cod_livro`, `idade_livro`) VALUES (7, '1240', '3-5 anos');
INSERT INTO `livro` (`cod_item`, `cod_livro`, `idade_livro`) VALUES (8, '1241', '3-5 anos');
INSERT INTO `livro` (`cod_item`, `cod_livro`, `idade_livro`) VALUES (9, '1242', '3-6 anos');

-- -----------------------------------------------------
-- INSERÇÃO NA TABELA `brinquedo` - 5 TUPLAS 
-- -----------------------------------------------------
INSERT INTO `brinquedo` (`cod_item`, `cod_brinquedo`, `idade_brinquedo`) VALUES (2, '1235', '2-5 anos');
INSERT INTO `brinquedo` (`cod_item`, `cod_brinquedo`, `idade_brinquedo`) VALUES (10, '1243', '2-5 anos');
INSERT INTO `brinquedo` (`cod_item`, `cod_brinquedo`, `idade_brinquedo`) VALUES (11, '1244', '3-6 anos');
INSERT INTO `brinquedo` (`cod_item`, `cod_brinquedo`, `idade_brinquedo`) VALUES (12, '1245', '3-6 anos');
INSERT INTO `brinquedo` (`cod_item`, `cod_brinquedo`, `idade_brinquedo`) VALUES (13, '1246', '5-8 anos');

-- -----------------------------------------------------
-- INSERÇÃO NA TABELA `roupa` - 5 TUPLAS 
-- -----------------------------------------------------
INSERT INTO `roupa` (`cod_item`, `cod_roupa`, `tamanho_roupa`) VALUES (3, '1236', 'RN');
INSERT INTO `roupa` (`cod_item`, `cod_roupa`, `tamanho_roupa`) VALUES (14, '1247', 'P');
INSERT INTO `roupa` (`cod_item`, `cod_roupa`, `tamanho_roupa`) VALUES (15, '1248', '2 anos');
INSERT INTO `roupa` (`cod_item`, `cod_roupa`, `tamanho_roupa`) VALUES (16, '1249', '5 anos');
INSERT INTO `roupa` (`cod_item`, `cod_roupa`, `tamanho_roupa`) VALUES (17, '1250', 'M');

-- -----------------------------------------------------
-- INSERÇÃO NA TABELA `fralda` - 5 TUPLAS 
-- -----------------------------------------------------
INSERT INTO `fralda` (`cod_item`, `cod_fralda`, `quantidade_fralda`, `tamanho_fralda`) VALUES (4, '1237', 20, 'RN');
INSERT INTO `fralda` (`cod_item`, `cod_fralda`, `quantidade_fralda`, `tamanho_fralda`) VALUES (18, '1251', 55,'P');
INSERT INTO `fralda` (`cod_item`, `cod_fralda`, `quantidade_fralda`, `tamanho_fralda`) VALUES (19, '1252', 12,'GG');
INSERT INTO `fralda` (`cod_item`, `cod_fralda`, `quantidade_fralda`, `tamanho_fralda`) VALUES (20, '1253', 10,'XG');
INSERT INTO `fralda` (`cod_item`, `cod_fralda`, `quantidade_fralda`, `tamanho_fralda`) VALUES (21, '1254', 25,'M');

-- -----------------------------------------------------
-- INSERÇÃO NA TABELA SAPATO - 5 TUPLAS 
-- -----------------------------------------------------
INSERT INTO `sapato` (`cod_item`, `cod_sapato`, `numeracao_sapato`) VALUES (5, '1238', 20);
INSERT INTO `sapato` (`cod_item`, `cod_sapato`, `numeracao_sapato`) VALUES (22, '1255', 18);
INSERT INTO `sapato` (`cod_item`, `cod_sapato`, `numeracao_sapato`) VALUES (23, '1256', 30);
INSERT INTO `sapato` (`cod_item`, `cod_sapato`, `numeracao_sapato`) VALUES (24, '1257', 24);
INSERT INTO `sapato` (`cod_item`, `cod_sapato`, `numeracao_sapato`) VALUES (25, '1258', 26);


use doakid;
SELECT * FROM familia;
update familia set email_familia="tadeu@gmail.com", nome="jose", sobrenome="maria" where cod_familia=1;
SELECT * FROM escola;
SELECT * FROM telefoneEscola;
SELECT * FROM escola where email_escola='marrey_junior@gmail.com' AND senha='bbb';
SELECT * FROM item;
Select * from roupa inner join item ON roupa.cod_item = item.cod_item;
Select * from escola inner join telefoneEscola ON escola.cod_escola=telefoneEscola.cod_escola;
SELECT * FROM brinquedo;
SELECT * FROM fralda;
SELECT * FROM livro;
SELECT * FROM sapato;
SELECT * FROM roupa;

DELIMITER $$
CREATE PROCEDURE UpdateSchool (Nome VARCHAR(25), email VARCHAR(30), rua VARCHAR(50), numero int, bairro VARCHAR(50), inicio time, fim time, cod int, numeroTelefone VARCHAR(14))
BEGIN
	UPDATE escola set nome_escola=Nome, email_escola=email, rua_escola=rua, numero_rua=numero, bairro_escola=bairro, horario_funcionamento_inicio=inicio, horario_funcionamento_fim=fim where cod_escola=cod;
    UPDATE telefoneEscola set numero=numeroTelefone where cod_escola=cod;
END$$

DELIMITER ;
call UpdateSchool('Marrey', 'mar@gmail.com', 'Albino', 150, 'JUDAS', '08:00:00', '17:00:00', 2, '(18)1111-2123');