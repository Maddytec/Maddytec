-- MySQL dump 10.13  Distrib 5.6.24, for Win64 (x86_64)
--
-- Host: 52.27.198.199    Database: soniflores_db
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(60) NOT NULL,
  `categoria_pai_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_fkuqkgkisyom8dxthrqo1ttix` (`categoria_pai_id`),
  CONSTRAINT `FK_fkuqkgkisyom8dxthrqo1ttix` FOREIGN KEY (`categoria_pai_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (3,'MÓVEIS',NULL),(15,'Cadeiras',3),(16,'Mesas',3),(25,'ROUPAS',NULL),(27,'DIVERSOS',NULL),(28,'SONORIZAÇÃO',NULL),(29,'Toalha',25),(30,'Forros',25),(31,'DOCES E SALGADOS',NULL),(32,'Doces Finos',31),(33,'Salgado Misto',31),(34,'Bolo',31),(35,'Malhas',25),(36,'UTENSILIOS',NULL),(38,'Talheres',36),(39,'Puff',3),(40,'Serviços',27),(41,'FLORES',NULL),(42,'Arranjos',41),(43,'Pratos',36),(44,'COPOS',36),(45,'Tapetes',27),(46,'Cortinas',25),(47,'Espaços',27),(48,'Vidro',27),(49,'Som',28),(50,'Iluminação',28);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `doc_receita_federal` varchar(14) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo` varchar(10) NOT NULL,
  `fone_movel` varchar(20) NOT NULL,
  `fone_fixo` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (31,'12345678900','antoniocarlos.souza1@juceb.ba.gov.br','ANTONIO CARLOS DE SOUZA','FISICA','(71) 8169-2297',''),(32,'12345678910','madsonnota10@hotmail.com','Teste','FISICA','(71) 3333-3333','(71) 9999-9999');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `endereco`
--

DROP TABLE IF EXISTS `endereco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `endereco` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cep` varchar(25) NOT NULL,
  `cidade` varchar(60) NOT NULL,
  `complemento` varchar(150) DEFAULT NULL,
  `logradouro` varchar(150) NOT NULL,
  `numero` varchar(20) NOT NULL,
  `uf` varchar(60) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `bairro` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_5hhg2rsvgex3ulsdy1svy8s62` (`cliente_id`),
  CONSTRAINT `FK_5hhg2rsvgex3ulsdy1svy8s62` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `endereco`
--

LOCK TABLES `endereco` WRITE;
/*!40000 ALTER TABLE `endereco` DISABLE KEYS */;
/*!40000 ALTER TABLE `endereco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `grupo`
--

DROP TABLE IF EXISTS `grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `grupo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(80) NOT NULL,
  `nome` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` VALUES (2,'ADMINISTRADOR DO SISTEMA','ADMINISTRADORES'),(3,'VENDEDORES','VENDEDORES'),(4,'VENDAS CONSULTA','VENDAS-CONSULTA');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item_pedido` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `quantidade` int(11) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `pedido_id` bigint(20) NOT NULL,
  `produto_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_4ql24iphly75cwd5vx596mx8v` (`pedido_id`),
  KEY `FK_r5pmilksmhlmh5mccbvplg8b7` (`produto_id`),
  CONSTRAINT `FK_4ql24iphly75cwd5vx596mx8v` FOREIGN KEY (`pedido_id`) REFERENCES `pedido` (`id`),
  CONSTRAINT `FK_r5pmilksmhlmh5mccbvplg8b7` FOREIGN KEY (`produto_id`) REFERENCES `produto` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
INSERT INTO `item_pedido` VALUES (44,1,80.00,20,63),(45,1,15.00,20,39),(46,1,25.00,20,38),(47,4,15.00,20,37),(48,16,15.00,20,54),(49,8,4.00,20,27),(50,8,4.00,20,26),(51,8,7.00,20,28),(52,8,7.00,20,29),(53,1,120.00,20,43),(54,1,100.00,20,48),(55,1,80.00,20,42),(56,4,80.00,20,41),(57,1,400.00,20,23),(58,600,1.00,20,21),(59,1200,0.90,20,22),(60,11,5.00,20,30),(61,12,5.00,20,33),(62,100,0.50,20,46),(63,100,1.00,20,55),(64,6,15.00,20,58),(65,120,4.00,20,24),(66,2,50.00,20,35),(67,2,50.00,20,32),(68,1,70.00,20,65),(69,3,70.00,20,64),(70,1,300.00,20,51),(71,16,4.00,20,36),(72,3,50.00,20,59),(73,1,80.00,20,12),(74,1,500.00,20,61),(75,1,500.00,20,62),(76,16,4.00,20,8),(77,10,8.00,20,67),(78,1,1500.00,20,66),(79,1,80.00,20,60),(80,50,1.50,21,9),(81,10,4.00,21,8),(82,40,1.50,22,9),(83,10,4.00,22,8),(84,2,80.00,21,12),(85,10,50.00,21,11);
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pedido` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `data_criacao` datetime NOT NULL,
  `data_entrega` date NOT NULL,
  `entrega_cep` varchar(9) NOT NULL,
  `entrega_cidade` varchar(60) NOT NULL,
  `entrega_complemento` varchar(150) DEFAULT NULL,
  `entrega_logradouro` varchar(150) NOT NULL,
  `entrega_numero` varchar(20) NOT NULL,
  `entrega_bairro` varchar(150) NOT NULL,
  `entrega_uf` varchar(60) NOT NULL,
  `forma_pagamento` varchar(20) NOT NULL,
  `status_pedido` varchar(20) DEFAULT NULL,
  `valor_desconto` decimal(10,2) NOT NULL,
  `valor_frete` decimal(10,2) NOT NULL,
  `valor_total` decimal(10,2) NOT NULL,
  `cliente_id` bigint(20) NOT NULL,
  `vendedor_id` bigint(20) NOT NULL,
  `observacao` text,
  PRIMARY KEY (`id`),
  KEY `FK_jvfwgjbqjdp5sk1qto0trgpla` (`cliente_id`),
  KEY `FK_k1yq38ro8cntr2av6fllk3xwt` (`vendedor_id`),
  CONSTRAINT `FK_jvfwgjbqjdp5sk1qto0trgpla` FOREIGN KEY (`cliente_id`) REFERENCES `cliente` (`id`),
  CONSTRAINT `FK_k1yq38ro8cntr2av6fllk3xwt` FOREIGN KEY (`vendedor_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (20,'2015-09-30 19:48:36','2015-10-03','4100000','Salvador','','Espaço Soniflores','15','Cajazeiras','Ba','CARTAO_DEBITO','BAIXADO',2029.00,0.00,5900.00,31,22,'Festa para 120 pessoas'),(21,'2015-10-01 08:25:34','2015-10-25','41343762','Salvador','','Espaço Soniflores','15','Cajazeiras','BA','DINHEIRO','ORCAMENTO',0.00,100.00,875.00,32,21,''),(22,'2015-10-01 16:26:32','2015-10-26','4100000','Salvador','Espaço Social','Cajazeira 11','s/n','Cajazeiras','BA','CARTAO_DEBITO','EMITIDO',20.00,15.00,95.00,32,22,'Entregar pela manhã');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nome` varchar(80) NOT NULL,
  `quantidade_estoque` int(11) NOT NULL,
  `sku` varchar(20) NOT NULL,
  `valor_unitario` decimal(10,2) NOT NULL,
  `categoria_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_j6npst3feop938l4x5h675kyv` (`sku`),
  KEY `FK_el0d58htywfs914w4grf6aoa0` (`categoria_id`),
  CONSTRAINT `FK_el0d58htywfs914w4grf6aoa0` FOREIGN KEY (`categoria_id`) REFERENCES `categoria` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (8,'MESA PLASTICA',97,'ME0001',4.00,16),(9,'CADEIRA PLASTICA',409,'CA0001',1.50,16),(10,'PRANCHAO RETANGULAR',9999,'PR0001',10.00,16),(11,'MESA DE VIDRO REDONDA',44,'ME0002',50.00,16),(12,'MESA PROVENSAL RETANGULAR',6,'ME0003',80.00,16),(16,'AQUARIO GRANDE',12,'VI0001',50.00,16),(17,'TOALHA P XADREZ VERDE P',26,'TO0001',4.00,29),(18,'TOALHA XADREZ AZUL P',20,'TO0002',4.00,29),(19,'FORRO DE CADEIRA TIPO A',1000,'FO0001',1.80,30),(20,'FORRO DE CADEIRA TIPO B',500,'FO0002',1.50,30),(21,'DOCES FINOS',9999,'DF0001',1.00,32),(22,'SALGADO MISTO',9999,'DS0002',0.90,33),(23,'BOLO 3 ANDARES',9999,'DS0003',400.00,34),(24,'CADEIRA DE FERRO BRANCA',412,'CA0002',4.00,15),(25,'CADEIRA DE FERRO DOURADA',156,'CA0003',4.00,15),(26,'TOALHA BRANCA C\\ NOTAS PRETA P',9999,'TO0003',4.00,29),(27,'TOALHA PRETA C\\ NOTAS BRANCA P',9999,'TO0004',4.00,29),(28,'TOALHA BRANCA M',9999,'TO0005',7.00,29),(29,'TOALHA PRETA M',9999,'TO0006',7.00,29),(30,'MALHA PRETA P',9999,'MA0001',5.00,35),(31,'MALHA PRETA M ',9999,'MA0002',15.00,35),(32,'MALHA PRETA G',9999,'MA0003',50.00,35),(33,'MALHA ROSA PINK P',9999,'MA0004',5.00,35),(34,'MALHA ROSA PINK M',9999,'MA0005',15.00,35),(35,'MALHA ROSA PINK G',9999,'MA0006',50.00,35),(36,'PRANCHAO REDONDO',9999,'PR0002',4.00,16),(37,'PUFF QUADRADO BRANCO P',9999,'PU0001',15.00,39),(38,'PUFF DOIS LUGARES BRANCO',9999,'PU0002',25.00,39),(39,'PUFF REDONDO BRANCO P',9999,'PU0003',15.00,39),(40,'PUFF REDONDO BRANCO G',1,'PU0004',40.00,39),(41,'GARÇON',9999,'SE0001',80.00,40),(42,'COPEIRO(A)',9999,'SE0002',80.00,40),(43,'SEGURANÇA',9999,'SE0003',120.00,40),(44,'FRITADEIRA',9999,'SE0004',120.00,40),(45,'ROSKEIRO',9999,'SE0005',150.00,40),(46,'GARFO',9999,'TA0001',0.50,38),(47,'FACA',9999,'TA0002',0.50,38),(48,'RECEPCIONISTA',9999,'SE0006',100.00,40),(49,'DECORAÇÃO 1',9999,'SE0007',100.00,40),(50,'DECORAÇÃO 2',9999,'SE0008',200.00,40),(51,'DECORAÇÃO 3',9999,'SE0009',300.00,40),(52,'DECORAÇÃO 4',9999,'SE0010',400.00,40),(53,'DECORAÇÃO 5',9999,'SE0011',500.00,40),(54,'ARRANJO C\\ TULIPA P',9999,'AR0001',15.00,42),(55,'PRATO P',9999,'UT0001',1.00,43),(56,'CARRETO',9999,'SE0012',100.00,40),(57,'ARRANJO PARA AQUARIO',9999,'AR0002',15.00,42),(58,'TAÇA CAIXA',9999,'UT0002',15.00,44),(59,'MESA PROVENSAL REDONDA',9999,'ME0004',50.00,16),(60,'TAPETE RETANGULAR ROSA 7Mt',9999,'TP0001',80.00,45),(61,'DJAY',9999,'SE0013',500.00,40),(62,'PROGRAMADOR',9999,'SE0014',500.00,40),(63,'ESTANTE BRANCA G',9999,'MO0001',80.00,16),(64,'CORTINA 1 PAR PRETA C\\ NOTAS BRANCAS',9999,'CO0001',70.00,46),(65,'CORTINA 1 PAR BRANCA C\\ NOTAS PRETAS',9999,'CO0002',70.00,46),(66,'SONIFLORES 3 PAVIMENTOS',9999,'ES0001',1500.00,47),(67,'VIDRO REDONDO E SUPORTE',9999,'DI0001',8.00,48),(68,'LUZ NEGRA',2,'SO0001',10.00,50);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `nome` varchar(80) NOT NULL,
  `senha` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_5171l57faosmj8myawaucatdw` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (21,'madsonnota10@hotmail.com','Madson Silva','b2b013739ed946448e96'),(22,'sonia@soniflores.com.br','Sonia Maria','101164'),(23,'jose.cosmiro@soniflores.com.br','Jose Cosmiro','b2b013739ed946448e96'),(25,'tamirisjoia@gmail.com','Tamiris da Silva','meuamor31'),(26,'sonimar@soniflores.com.br','Sonimar Magalhães','sonimar@2015');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_grupo`
--

DROP TABLE IF EXISTS `usuario_grupo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario_grupo` (
  `usuario_id` bigint(20) NOT NULL,
  `grupo_id` bigint(20) NOT NULL,
  KEY `FK_5p20y5panoea7wc040qm6eemd` (`grupo_id`),
  KEY `FK_m32it4c8rkf6t8nno481k43q4` (`usuario_id`),
  CONSTRAINT `FK_5p20y5panoea7wc040qm6eemd` FOREIGN KEY (`grupo_id`) REFERENCES `grupo` (`id`),
  CONSTRAINT `FK_m32it4c8rkf6t8nno481k43q4` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_grupo`
--

LOCK TABLES `usuario_grupo` WRITE;
/*!40000 ALTER TABLE `usuario_grupo` DISABLE KEYS */;
INSERT INTO `usuario_grupo` VALUES (21,2),(23,4),(22,3),(22,2),(25,3),(25,2),(26,4);
/*!40000 ALTER TABLE `usuario_grupo` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-28 17:06:51
