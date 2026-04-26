-- MySQL dump 10.13  Distrib 8.4.3, for Win64 (x86_64)
--
-- Host: localhost    Database: sofragrancias_estoque
-- ------------------------------------------------------
-- Server version	8.4.3

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `data_cadastro` datetime DEFAULT NULL,
  `razao_social` varchar(45) DEFAULT NULL,
  `nome_fantasia` varchar(45) DEFAULT NULL,
  `cnpj_cpf` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fornecedor`
--

DROP TABLE IF EXISTS `fornecedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fornecedor` (
  `idFornecedor` int NOT NULL AUTO_INCREMENT,
  `razao_social` varchar(45) DEFAULT NULL,
  `nome_fantasia` varchar(45) DEFAULT NULL,
  `cnpj_cpf` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `endereco` varchar(45) DEFAULT NULL,
  `cidade` varchar(45) DEFAULT NULL,
  `estado` char(2) DEFAULT NULL,
  PRIMARY KEY (`idFornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fornecedor`
--

LOCK TABLES `fornecedor` WRITE;
/*!40000 ALTER TABLE `fornecedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `fornecedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_pedido`
--

DROP TABLE IF EXISTS `item_pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_pedido` (
  `idItemPedido` int NOT NULL AUTO_INCREMENT,
  `Pedido_venda_idVenda` int DEFAULT NULL,
  `Produto_idProduto` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idItemPedido`),
  KEY `Pedido_venda_idVenda` (`Pedido_venda_idVenda`),
  KEY `Produto_idProduto` (`Produto_idProduto`),
  CONSTRAINT `item_pedido_ibfk_1` FOREIGN KEY (`Pedido_venda_idVenda`) REFERENCES `pedido_venda` (`idVenda`),
  CONSTRAINT `item_pedido_ibfk_2` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_pedido`
--

LOCK TABLES `item_pedido` WRITE;
/*!40000 ALTER TABLE `item_pedido` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_compra`
--

DROP TABLE IF EXISTS `pedido_compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_compra` (
  `idPedidoCompra` int NOT NULL AUTO_INCREMENT,
  `Produto_idProduto` int DEFAULT NULL,
  `Fornecedor_idFornecedor` int DEFAULT NULL,
  `quantidade` int DEFAULT NULL,
  `preco_unitario` decimal(10,2) DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idPedidoCompra`),
  KEY `Produto_idProduto` (`Produto_idProduto`),
  KEY `Fornecedor_idFornecedor` (`Fornecedor_idFornecedor`),
  CONSTRAINT `pedido_compra_ibfk_1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`),
  CONSTRAINT `pedido_compra_ibfk_2` FOREIGN KEY (`Fornecedor_idFornecedor`) REFERENCES `fornecedor` (`idFornecedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_compra`
--

LOCK TABLES `pedido_compra` WRITE;
/*!40000 ALTER TABLE `pedido_compra` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido_venda`
--

DROP TABLE IF EXISTS `pedido_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido_venda` (
  `idVenda` int NOT NULL AUTO_INCREMENT,
  `Cliente_idCliente` int DEFAULT NULL,
  `Vendedor_idVendedor` int DEFAULT NULL,
  `numero_pedido` varchar(45) DEFAULT NULL,
  `data` datetime DEFAULT NULL,
  `desconto` decimal(10,2) DEFAULT NULL,
  `total` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`idVenda`),
  KEY `Cliente_idCliente` (`Cliente_idCliente`),
  KEY `Vendedor_idVendedor` (`Vendedor_idVendedor`),
  CONSTRAINT `pedido_venda_ibfk_1` FOREIGN KEY (`Cliente_idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `pedido_venda_ibfk_2` FOREIGN KEY (`Vendedor_idVendedor`) REFERENCES `vendedor` (`idVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido_venda`
--

LOCK TABLES `pedido_venda` WRITE;
/*!40000 ALTER TABLE `pedido_venda` DISABLE KEYS */;
/*!40000 ALTER TABLE `pedido_venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `descricao_produto` varchar(45) DEFAULT NULL,
  `valor_unitario` decimal(10,2) DEFAULT NULL,
  `cota_vendedor` int DEFAULT NULL,
  `estoque_minimo` int DEFAULT NULL,
  `estoque_atual` int DEFAULT NULL,
  PRIMARY KEY (`idProduto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `idVendedor` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idVendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-26 16:25:47
