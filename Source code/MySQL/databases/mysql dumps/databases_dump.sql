CREATE DATABASE  IF NOT EXISTS `sql_invoicing` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sql_invoicing`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: sql_invoicing
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `client_id` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'Vinte','3 Nevada Parkway','Syracuse','NY','315-252-7305'),(2,'Myworks','34267 Glendale Parkway','Huntington','WV','304-659-1170'),(3,'Yadel','096 Pawling Parkway','San Francisco','CA','415-144-6037'),(4,'Kwideo','81674 Westerfield Circle','Waco','TX','254-750-0784'),(5,'Topiclounge','0863 Farmco Road','Portland','OR','971-888-9129');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `invoices`
--

DROP TABLE IF EXISTS `invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoices` (
  `invoice_id` int(11) NOT NULL,
  `number` varchar(50) NOT NULL,
  `client_id` int(11) NOT NULL,
  `invoice_total` decimal(9,2) NOT NULL,
  `payment_total` decimal(9,2) NOT NULL DEFAULT '0.00',
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `payment_date` date DEFAULT NULL,
  PRIMARY KEY (`invoice_id`),
  KEY `FK_client_id` (`client_id`),
  CONSTRAINT `FK_client_id` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoices`
--

LOCK TABLES `invoices` WRITE;
/*!40000 ALTER TABLE `invoices` DISABLE KEYS */;
INSERT INTO `invoices` VALUES (2,'03-898-6735',5,175.32,8.18,'2019-06-11','2019-07-01','2019-02-12'),(3,'20-228-0335',5,147.99,12.88,'2019-07-31','2019-08-20','2020-05-09'),(4,'56-934-0748',3,152.21,0.00,'2019-03-08','2019-03-28',NULL),(5,'87-052-3121',5,169.36,35.00,'2019-07-18','2019-08-07',NULL),(6,'75-587-6626',1,157.78,74.55,'2019-01-29','2019-02-18','2019-01-03'),(7,'68-093-9863',3,133.87,0.00,'2019-09-04','2019-09-24',NULL),(8,'78-145-1093',1,189.12,0.00,'2019-05-20','2019-06-09',NULL),(9,'77-593-0081',5,172.17,0.00,'2019-07-09','2019-07-29',NULL),(10,'48-266-1517',1,159.50,0.00,'2019-06-30','2019-07-20',NULL),(11,'20-848-0181',3,126.15,0.03,'2019-01-07','2019-01-27','2019-01-11'),(13,'41-666-1035',5,135.01,87.44,'2019-06-25','2019-07-15','2019-01-26'),(15,'55-105-9605',3,167.29,80.31,'2019-11-25','2019-12-15','2019-01-15'),(16,'10-451-8824',1,162.02,0.00,'2019-03-30','2019-04-19',NULL),(17,'33-615-4694',3,126.38,68.10,'2019-07-30','2019-08-19','2019-01-15'),(18,'52-269-9803',5,180.17,42.77,'2019-05-23','2019-06-12','2019-01-08'),(19,'83-559-4105',1,134.47,0.00,'2019-11-23','2019-12-13',NULL);
/*!40000 ALTER TABLE `invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `invoices_with_balance`
--

DROP TABLE IF EXISTS `invoices_with_balance`;
/*!50001 DROP VIEW IF EXISTS `invoices_with_balance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `invoices_with_balance` AS SELECT 
 1 AS `invoice_id`,
 1 AS `number`,
 1 AS `client_id`,
 1 AS `invoice_total`,
 1 AS `payment_total`,
 1 AS `invoice_date`,
 1 AS `due_date`,
 1 AS `payment_date`,
 1 AS `balance`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `invoicing_archive`
--

DROP TABLE IF EXISTS `invoicing_archive`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `invoicing_archive` (
  `invoice_id` int(11) NOT NULL,
  `client_id` int(11) NOT NULL,
  `client` varchar(50) NOT NULL,
  `invoice_total` decimal(9,2) NOT NULL,
  `payment_total` decimal(9,2) NOT NULL DEFAULT '0.00',
  `invoice_date` date NOT NULL,
  `due_date` date NOT NULL,
  `payment_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `invoicing_archive`
--

LOCK TABLES `invoicing_archive` WRITE;
/*!40000 ALTER TABLE `invoicing_archive` DISABLE KEYS */;
INSERT INTO `invoicing_archive` VALUES (2,5,'Topiclounge',175.32,8.18,'2019-06-11','2019-07-01','2019-02-12'),(6,1,'Vinte',157.78,74.55,'2019-01-29','2019-02-18','2019-01-03'),(11,3,'Yadel',126.15,0.03,'2019-01-07','2019-01-27','2019-01-11'),(13,5,'Topiclounge',135.01,87.44,'2019-06-25','2019-07-15','2019-01-26'),(15,3,'Yadel',167.29,80.31,'2019-11-25','2019-12-15','2019-01-15'),(17,3,'Yadel',126.38,68.10,'2019-07-30','2019-08-19','2019-01-15'),(18,5,'Topiclounge',180.17,42.77,'2019-05-23','2019-06-12','2019-01-08');
/*!40000 ALTER TABLE `invoicing_archive` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_methods`
--

DROP TABLE IF EXISTS `payment_methods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment_methods` (
  `payment_method_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_methods`
--

LOCK TABLES `payment_methods` WRITE;
/*!40000 ALTER TABLE `payment_methods` DISABLE KEYS */;
INSERT INTO `payment_methods` VALUES (1,'Credit Card'),(2,'Cash'),(3,'PayPal'),(4,'Wire Transfer');
/*!40000 ALTER TABLE `payment_methods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `payment_id` int(11) NOT NULL AUTO_INCREMENT,
  `client_id` int(11) NOT NULL,
  `invoice_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `payment_method` tinyint(4) NOT NULL,
  PRIMARY KEY (`payment_id`),
  KEY `fk_client_id_idx` (`client_id`),
  KEY `fk_invoice_id_idx` (`invoice_id`),
  KEY `fk_payment_payment_method_idx` (`payment_method`),
  CONSTRAINT `fk_payment_client` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_invoice` FOREIGN KEY (`invoice_id`) REFERENCES `invoices` (`invoice_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_payment_payment_method` FOREIGN KEY (`payment_method`) REFERENCES `payment_methods` (`payment_method_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
INSERT INTO `payments` VALUES (1,5,2,'2019-02-12',8.18,1),(2,1,6,'2019-01-03',74.55,1),(3,3,11,'2019-01-11',0.03,1),(4,5,13,'2019-01-26',87.44,1),(5,3,15,'2019-01-15',80.31,1),(6,3,17,'2019-01-15',68.10,1),(7,5,18,'2019-01-08',32.77,1),(8,5,18,'2019-01-08',10.00,2),(9,5,3,'2020-01-01',10.00,1),(11,5,5,'2020-01-01',15.00,1),(12,5,5,'2020-01-01',20.00,1);
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `payments_after_insert` AFTER INSERT ON `payments` FOR EACH ROW BEGIN
		UPDATE invoices
        SET 
			payment_total = payment_total + NEW.amount
        WHERE invoice_id = NEW.invoice_id;
        
		INSERT INTO payments_audit
        VALUES (NEW.client_id, NEW.date, NEW.amount, 'insert', NOW());
			
	END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `payments_after_delete` AFTER DELETE ON `payments` FOR EACH ROW begin
		update invoices
        set payment_total = payment_total - OLD.amount
        where invoice_id = OLD.invoice_id;
        
        insert into payments_audit
        values (OLD.client_id, OLD.date, OLD.amount, 'delete', NOW());
	end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `payments_audit`
--

DROP TABLE IF EXISTS `payments_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments_audit` (
  `client_id` int(11) NOT NULL,
  `date` date NOT NULL,
  `amount` decimal(9,2) NOT NULL,
  `action_type` varchar(50) NOT NULL,
  `action_date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments_audit`
--

LOCK TABLES `payments_audit` WRITE;
/*!40000 ALTER TABLE `payments_audit` DISABLE KEYS */;
INSERT INTO `payments_audit` VALUES (5,'2020-01-01',15.00,'insert','2020-05-09 13:13:23'),(5,'2020-01-01',20.00,'insert','2020-05-09 13:13:23'),(5,'2020-01-01',10.00,'delete','2020-05-09 13:13:23');
/*!40000 ALTER TABLE `payments_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `sales_by_client`
--

DROP TABLE IF EXISTS `sales_by_client`;
/*!50001 DROP VIEW IF EXISTS `sales_by_client`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `sales_by_client` AS SELECT 
 1 AS `client_id`,
 1 AS `name`,
 1 AS `invoice_sum`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'sql_invoicing'
--
/*!50106 SET @save_time_zone= @@TIME_ZONE */ ;
/*!50106 DROP EVENT IF EXISTS `yearly_delete_old_audit_rows` */;
DELIMITER ;;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;;
/*!50003 SET character_set_client  = utf8mb4 */ ;;
/*!50003 SET character_set_results = utf8mb4 */ ;;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;;
/*!50003 SET @saved_time_zone      = @@time_zone */ ;;
/*!50003 SET time_zone             = 'SYSTEM' */ ;;
/*!50106 CREATE*/ /*!50117 DEFINER=`root`@`localhost`*/ /*!50106 EVENT `yearly_delete_old_audit_rows` ON SCHEDULE EVERY 1 YEAR STARTS '2019-01-01 00:00:00' ENDS '2029-01-01 00:00:00' ON COMPLETION NOT PRESERVE ENABLE DO begin
		delete from payments_audit
        where action_date < now() - INTERVAL 1 year;
end */ ;;
/*!50003 SET time_zone             = @saved_time_zone */ ;;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;;
/*!50003 SET character_set_client  = @saved_cs_client */ ;;
/*!50003 SET character_set_results = @saved_cs_results */ ;;
/*!50003 SET collation_connection  = @saved_col_connection */ ;;
DELIMITER ;
/*!50106 SET TIME_ZONE= @save_time_zone */ ;

--
-- Dumping routines for database 'sql_invoicing'
--
/*!50003 DROP FUNCTION IF EXISTS `get_avg_invoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `get_avg_invoice`(
	client_id int
) RETURNS int(11)
    READS SQL DATA
begin
		declare sum_invoices decimal(9,2) default 0;	-- declare a variable
        declare count_invoices int;						-- declare a variable
        declare avg_invoice decimal(9,2);				-- declare a variable
		
		select 
			sum(invoice_total), 
            count(*)
        into 
			sum_invoices, 
			count_invoices
        from invoices i
        where i.client_id = client_id;

		SET avg_invoice = sum_invoices/count_invoices;

		return IFNULL(avg_invoice,0);

	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_clients_by_state` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_clients_by_state`(state char(2))
BEGIN
	IF state IS NULL THEN
		SET state = 'CA';
	END IF;

	SELECT * FROM clients c
    WHERE c.state = state;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_clients_by_state2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_clients_by_state2`(state char(2))
begin
		if state is null then
			select * from clients;
		else
			select * from clients c
            where c.state = state;
        end if;
	end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_clients_by_state3` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_clients_by_state3`(state char(2))
BEGIN
	SELECT * FROM clients c
    WHERE c.state = IFNULL(state, c.state);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_invoices_by_client` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_invoices_by_client`(client_id int )
begin
		select * from invoices i
        where i.client_id = client_id;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_invoices_with_balance` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_invoices_with_balance`()
begin
    select 
		*,
        (invoice_total-payment_total) as balance
	from invoices 
    where invoice_total-payment_total>0;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_risk_factor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_risk_factor`()
BEGIN
	DECLARE risk_factor  DECIMAL(9,2) DEFAULT 0;
    DECLARE invoices_total DECIMAL (9.2);
    DECLARE invoices_count INT;
    
    SELECT 
		COUNT(*), 
        SUM(invoice_total)
    INTO 
		invoices_count,
        invoices_total
    FROM invoices;
    
    SET risk_factor = invoices_total / invoices_count;
    
    SELECT risk_factor;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_unpaid_invoices` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_unpaid_invoices`(
	client_id int,
    out invoices_count int,
    out invoices_total decimal(9,2)
)
begin
		select
			COUNT(*), SUM(invoice_total)
        into 
			invoices_count,
            invoices_total
        from invoices i where i.client_id = client_id AND i.payment_total = 0;    
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `make_payment` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `make_payment`(
	invoice_id int, 
    payment_amount decimal(9,2), 
    payment_date DATE 
)
begin	

		-- data validation
        IF payment_amount <= 0 THEN
			SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT = 'Invalid payment amount';
        END IF;
        
        update invoices i
		set
			i.payment_total = payment_amount,
			i.payment_date = payment_date
		where i.invoice_id = invoice_id;
    end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `invoices_with_balance`
--

/*!50001 DROP VIEW IF EXISTS `invoices_with_balance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `invoices_with_balance` AS select `invoices`.`invoice_id` AS `invoice_id`,`invoices`.`number` AS `number`,`invoices`.`client_id` AS `client_id`,`invoices`.`invoice_total` AS `invoice_total`,`invoices`.`payment_total` AS `payment_total`,`invoices`.`invoice_date` AS `invoice_date`,`invoices`.`due_date` AS `due_date`,`invoices`.`payment_date` AS `payment_date`,(`invoices`.`invoice_total` - `invoices`.`payment_total`) AS `balance` from `invoices` where ((`invoices`.`invoice_total` - `invoices`.`payment_total`) > 0) */
/*!50002 WITH CASCADED CHECK OPTION */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `sales_by_client`
--

/*!50001 DROP VIEW IF EXISTS `sales_by_client`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `sales_by_client` AS select `c`.`client_id` AS `client_id`,`c`.`name` AS `name`,sum(`i`.`invoice_total`) AS `invoice_sum` from (`clients` `c` join `invoices` `i` on((`c`.`client_id` = `i`.`client_id`))) group by `c`.`client_id`,`c`.`name` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19 14:15:36
CREATE DATABASE  IF NOT EXISTS `sql_blog` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sql_blog`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: sql_blog
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `date_published` datetime DEFAULT NULL,
  PRIMARY KEY (`post_id`),
  FULLTEXT KEY `idx_title_body` (`title`,`body`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (11,'Handling a Form in React','Web applications often need to send data from browser to the backend server. Certainly, the most used way of doing so is through a HTML form, by using text inputs, radio buttons, checkboxes, selects and so on. This remains true in React. Are you looking how to handle forms in React? If so, this article is a great fit for you. Have a good read.','2019-01-01 00:00:00'),(12,'What JavaScript Framework You Should Learn to Get a Job in 2019?','Are you wondering what JavaScript framework or library you should use to land a job in 2019? In this post, I am going to go over a comparison of the most popular JavaScript frameworks that are available today. By the end of this post, you will be ready to pick the right framework to help you land a front-end developer job in 2019.','2019-03-02 00:00:00'),(13,'Building an Accessible React Modal Component','Modal is an overlay on the web-page, but has some standards to follow. WAI-ARIA Authoring Practices are the standards set by W3C. This lets bots and screen-readers know that it is a modal. It is not within the regular flow of the page. We’ll create an awesome react modal using React components.','2019-01-15 00:00:00'),(14,'Redux Vs. Mobx – What Should I Pick For My Web App?','State management is a hard problem to solve in large applications. Redux and Mobx are both external libraries that are popularly used to solve state management problems.','2019-02-20 00:00:00'),(15,'Stateful and Stateless Components in React','Today, we’re going to review what stateful and stateless components are in React, how you can tell the difference, and the complex process of deciding whether to make components stateful or not.','2019-03-29 00:00:00');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sql_blog'
--

--
-- Dumping routines for database 'sql_blog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19 14:15:37
CREATE DATABASE  IF NOT EXISTS `sql_inventory` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sql_inventory`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: sql_inventory
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `unit_price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Foam Dinner Plate',70,1.21),(2,'Pork - Bacon,back Peameal',49,4.65),(3,'Lettuce - Romaine, Heart',38,3.35),(4,'Brocolinni - Gaylan, Chinese',90,4.53),(5,'Sauce - Ranch Dressing',94,1.63),(6,'Petit Baguette',14,2.39),(7,'Sweet Pea Sprouts',98,3.29),(8,'Island Oasis - Raspberry',26,0.74),(9,'Longan',67,2.26),(10,'Broom - Push',6,1.09);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sql_inventory'
--

--
-- Dumping routines for database 'sql_inventory'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19 14:15:37
CREATE DATABASE  IF NOT EXISTS `sql_hr` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sql_hr`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: sql_hr
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `employees`
--

DROP TABLE IF EXISTS `employees`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `job_title` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `reports_to` int(11) DEFAULT NULL,
  `office_id` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employees_offices_idx` (`office_id`),
  KEY `fk_employees_employees_idx` (`reports_to`),
  CONSTRAINT `fk_employees_managers` FOREIGN KEY (`reports_to`) REFERENCES `employees` (`employee_id`),
  CONSTRAINT `fk_employees_offices` FOREIGN KEY (`office_id`) REFERENCES `offices` (`office_id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employees`
--

LOCK TABLES `employees` WRITE;
/*!40000 ALTER TABLE `employees` DISABLE KEYS */;
INSERT INTO `employees` VALUES (33391,'D\'arcy','Nortunen','Account Executive',62871,37270,1),(37270,'Yovonnda','Magrannell','Executive Secretary',63996,NULL,10),(37851,'Sayer','Matterson','Statistician III',98926,37270,1),(40448,'Mindy','Crissil','Staff Scientist',94860,37270,1),(56274,'Keriann','Alloisi','VP Marketing',110150,37270,1),(63196,'Alaster','Scutchin','Assistant Professor',32179,37270,2),(67009,'North','de Clerc','VP Product Management',114257,37270,2),(67370,'Elladine','Rising','Social Worker',96767,37270,2),(68249,'Nisse','Voysey','Financial Advisor',52832,37270,2),(72540,'Guthrey','Iacopetti','Office Assistant I',117690,37270,3),(72913,'Kass','Hefferan','Computer Systems Analyst IV',96401,37270,3),(75900,'Virge','Goodrum','Information Systems Manager',54578,37270,3),(76196,'Mirilla','Janowski','Cost Accountant',119241,37270,3),(80529,'Lynde','Aronson','Junior Executive',77182,37270,4),(80679,'Mildrid','Sokale','Geologist II',67987,37270,4),(84791,'Hazel','Tarbert','General Manager',93760,37270,4),(95213,'Cole','Kesterton','Pharmacist',86119,37270,4),(96513,'Theresa','Binney','Food Chemist',47354,37270,5),(98374,'Estrellita','Daleman','Staff Accountant IV',70187,37270,5),(115357,'Ivy','Fearey','Structural Engineer',92710,37270,5);
/*!40000 ALTER TABLE `employees` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `offices`
--

DROP TABLE IF EXISTS `offices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `offices` (
  `office_id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` varchar(50) NOT NULL,
  PRIMARY KEY (`office_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `offices`
--

LOCK TABLES `offices` WRITE;
/*!40000 ALTER TABLE `offices` DISABLE KEYS */;
INSERT INTO `offices` VALUES (1,'03 Reinke Trail','Cincinnati','OH'),(2,'5507 Becker Terrace','New York City','NY'),(3,'54 Northland Court','Richmond','VA'),(4,'08 South Crossing','Cincinnati','OH'),(5,'553 Maple Drive','Minneapolis','MN'),(6,'23 North Plaza','Aurora','CO'),(7,'9658 Wayridge Court','Boise','ID'),(8,'9 Grayhawk Trail','New York City','NY'),(9,'16862 Westend Hill','Knoxville','TN'),(10,'4 Bluestem Parkway','Savannah','GA');
/*!40000 ALTER TABLE `offices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sql_hr'
--

--
-- Dumping routines for database 'sql_hr'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19 14:15:37
CREATE DATABASE  IF NOT EXISTS `sql_store` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `sql_store`;
-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: sql_store
-- ------------------------------------------------------
-- Server version	8.0.18

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `state` char(2) NOT NULL,
  `points` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`customer_id`),
  KEY `idx_state_points` (`state`,`points`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'Babara','MacCaffrey','1986-03-28','781-932-9754','0 Sage Terrace','Waltham','WV',30),(2,'Ines','Brushfield','1986-04-13','804-427-9456','14187 Commercial Trail','Hampton','VA',947),(3,'Freddi','Boagey','1985-02-07','719-724-7869','251 Springs Junction','Colorado Springs','CO',2967),(4,'Ambur','Roseburgh','1974-04-14','407-231-8017','30 Arapahoe Terrace','Orlando','FL',457),(5,'Clemmie','Betchley','1973-11-07',NULL,'5 Spohn Circle','Arlington','TX',3675),(6,'Elka','Twiddell','1991-09-04','312-480-8498','7 Manley Drive','Chicago','IL',3073),(7,'Ilene','Dowson','1964-08-30','615-641-4759','50 Lillian Crossing','Nashville','TN',1672),(8,'Thacher','Naseby','1993-07-17','941-527-3977','538 Mosinee Center','Sarasota','FL',205),(9,'Romola','Rumgay','1992-05-23','559-181-3744','3520 Ohio Trail','Visalia','CA',1486),(10,'Levy','Mynett','1969-10-13','404-246-3370','68 Lawn Avenue','Atlanta','GA',796),(11,'Ashlin','Bickerdyke','1970-12-09',NULL,'79 Holmberg Parkway','Saint Louis','MO',1278),(12,'Mordecai','Barltrop','1970-08-06',NULL,'59322 Northridge Street','Long Beach','CA',838),(13,'Karoline','Gookey','1975-09-15',NULL,'180 Walton Pass','New York City','NY',24),(14,'Shelba','Pedden','1956-10-28',NULL,'50 Troy Drive','Minneapolis','MN',1937),(15,'Leighton','Beeble','1982-02-16',NULL,'2562 Northview Circle','Cleveland','OH',1824),(16,'Almeria','Biddlestone','1985-04-17',NULL,'41 Sunfield Junction','Los Angeles','CA',790),(17,'Michelle','Fassbender','1972-10-06',NULL,'645 Red Cloud Pass','Miami','FL',1441),(18,'Laurena','Grouer','1989-08-18',NULL,'746 Mosinee Drive','Norfolk','VA',1275),(19,'Murdock','Ashby','1984-05-25',NULL,'45 Holy Cross Hill','Wichita','KS',1919),(20,'Fidel','Limon','1989-04-03',NULL,'23571 Loftsgordon Hill','Denver','CO',1716),(21,'Maddy','Midden','1975-02-10',NULL,'977 Northridge Hill','Hattiesburg','MS',639),(22,'Kassia','ducarme','1959-05-16',NULL,'5301 Union Plaza','Sacramento','CA',572),(23,'Emmerich','Gabbat','1976-02-05',NULL,'7065 Utah Park','Baltimore','MD',103),(24,'See','Delhanty','1952-10-10',NULL,'40915 Mallory Point','Orlando','FL',1733),(25,'Rosita','Cuffley','1951-05-26',NULL,'1 Elmside Circle','Montgomery','AL',1717),(26,'Merry','Gonet','1952-01-01',NULL,'676 Gulseth Trail','Roanoke','VA',592),(27,'Washington','Messingham','1952-04-13',NULL,'64870 Beilfuss Trail','Orlando','FL',1524),(28,'Anders','Stammers','1966-08-11',NULL,'20 Porter Trail','Houston','TX',1153),(29,'Walker','Barrick','1976-03-28',NULL,'1961 Jay Circle','New York City','NY',285),(30,'Brigitta','O\'Hear','1960-12-03',NULL,'64 Warrior Junction','Santa Cruz','CA',1671),(31,'Field','Thomke','1951-06-25',NULL,'88 Hudson Parkway','Laredo','TX',514),(32,'Rees','Chipp','1986-07-18',NULL,'8 7th Road','Arlington','TX',1264),(33,'Ulysses','Nijs','1953-05-24',NULL,'0 Monument Terrace','El Paso','TX',1351),(34,'Valma','Kermon','1956-05-25',NULL,'3833 Maywood Road','Greensboro','NC',1806),(35,'Mathilde','Coffey','1960-08-19',NULL,'34218 Lawn Hill','Winter Haven','FL',1330),(36,'Ronny','Itscowicz','1971-04-10',NULL,'446 Di Loreto Lane','Billings','MT',918),(37,'Danyette','Tristram','1988-08-23',NULL,'3 Dapin Parkway','Portland','OR',764),(38,'Hort','Raubenheim','1952-07-02',NULL,'7927 Clyde Gallagher Hill','San Francisco','CA',571),(39,'Dulcia','Dallender','1975-08-05',NULL,'58043 Marquette Pass','Dallas','TX',753),(40,'Florie','Braben','1984-01-13',NULL,'432 Menomonie Way','Chicago','IL',1480),(41,'Sissy','Wadley','1962-03-22',NULL,'23371 Farwell Court','Garden Grove','CA',1555),(42,'Corney','Hawker','1971-02-27',NULL,'4 Northview Crossing','Lubbock','TX',104),(43,'Orin','Arlow','1985-02-02',NULL,'1 Twin Pines Point','Pinellas Park','FL',1354),(44,'Shem','Kerbler','1952-02-29',NULL,'7 Alpine Lane','Los Angeles','CA',1393),(45,'Humphrey','Winkless','1982-08-14',NULL,'9024 Meadow Valley Court','Fairfax','VA',281),(46,'Humbert','Gourley','1986-08-23',NULL,'006 Talmadge Parkway','Naperville','IL',867),(47,'Dorthy','Yve','1967-05-13',NULL,'1 Dexter Court','Reno','NV',583),(48,'Zak','Brannan','1977-01-25',NULL,'43529 Rutledge Terrace','Hampton','VA',1149),(49,'Dayna','Arpin','1972-08-09',NULL,'4473 Talmadge Junction','Jackson','MS',545),(50,'Perla','Vasnev','1971-04-14',NULL,'7624 Loftsgordon Avenue','Tampa','FL',587),(51,'Feliza','Slayton','1970-10-08',NULL,'28624 Sunfield Pass','Wilmington','DE',1604),(52,'Gaynor','Rosie','1980-06-29',NULL,'5 Twin Pines Alley','Birmingham','AL',646),(53,'Crystie','Maasze','1977-04-13',NULL,'16884 Dennis Pass','Jamaica','NY',1539),(54,'Erich','Chasle','1968-10-11',NULL,'6 Express Trail','Milwaukee','WI',665),(55,'Blair','Ditty','1984-12-09',NULL,'64599 Warrior Terrace','Davenport','IA',44),(56,'Herrick','Elderbrant','1950-05-11',NULL,'41 Nobel Street','Charlottesville','VA',1510),(57,'Elliott','Rawlin','1974-01-14',NULL,'79 Memorial Junction','Stockton','CA',703),(58,'Desmond','Blacklidge','1972-04-17',NULL,'7358 Kenwood Crossing','Gainesville','FL',90),(59,'Sherwood','Pridding','1978-08-28',NULL,'5 Quincy Center','Baltimore','MD',197),(60,'Yancy','Slimmon','1986-05-12',NULL,'82 Longview Pass','Jackson','MS',1377),(61,'Sammie','Heggman','1952-12-27',NULL,'31698 Anzinger Alley','Columbia','SC',376),(62,'Donny','Bligh','1960-10-01',NULL,'947 Gerald Avenue','Mesa','AZ',1416),(63,'Lou','Yurkevich','1971-05-05',NULL,'8 Spenser Court','Fort Lauderdale','FL',1511),(64,'Bran','Cardwell','1986-09-11',NULL,'47 Chive Court','Memphis','TN',245),(65,'Dian','Esome','1964-09-13',NULL,'601 Erie Pass','Kansas City','MO',418),(66,'Yule','Lagen','1985-07-31',NULL,'343 Karstens Crossing','Carson City','NV',1894),(67,'Ilaire','Northage','1953-11-10',NULL,'94 Grasskamp Parkway','Fresno','CA',1275),(68,'Cyrillus','Folshom','1953-11-29',NULL,'97913 Wayridge Center','Brooklyn','NY',1223),(69,'Joshia','Dreye','1970-01-17',NULL,'22 Park Meadow Pass','Greensboro','NC',1654),(70,'Sly','Kinson','1987-04-27',NULL,'4 Reindahl Circle','Vienna','VA',429),(71,'Brynna','Diboll','1951-12-30',NULL,'428 3rd Park','Irvine','CA',498),(72,'Adele','Carratt','1972-09-13',NULL,'98957 Kipling Street','Atlanta','GA',1462),(73,'Adelice','Govini','1987-11-20',NULL,'7 Crescent Oaks Park','West Palm Beach','FL',1282),(74,'Jeremy','Furnell','1951-03-21',NULL,'58 Lotheville Trail','Peoria','IL',1057),(75,'Laurice','Blacklock','1976-08-04',NULL,'8406 Dixon Alley','Saint Louis','MO',1571),(76,'Innis','Fassbender','1983-07-22',NULL,'64 Reindahl Road','Phoenix','AZ',246),(77,'Perri','Brawn','1960-11-30',NULL,'66255 Gina Plaza','Washington','DC',1804),(78,'Teddie','Klulik','1973-02-25',NULL,'504 Muir Terrace','Hartford','CT',152),(79,'Elnar','Barke','1958-10-03',NULL,'189 Hooker Parkway','Boise','ID',1789),(80,'Theda','McTrustie','1978-06-29',NULL,'1 Sachtjen Road','Dallas','TX',1237),(81,'Keslie','Fidelus','1960-03-21',NULL,'36 Reinke Terrace','Alhambra','CA',1616),(82,'Zaria','Scamaden','1969-10-15',NULL,'721 Sundown Avenue','Baltimore','MD',1695),(83,'Pate','Godley','1973-02-12',NULL,'734 Merchant Park','Cincinnati','OH',1240),(84,'Carrie','Torricella','1979-10-22',NULL,'114 Alpine Way','Ocala','FL',883),(85,'Florie','Keogh','1966-07-05',NULL,'81748 Superior Terrace','Houston','TX',191),(86,'Kelcey','Gartshore','1975-11-12',NULL,'572 Arkansas Lane','Kansas City','MO',1455),(87,'Katerine','Litton','1961-05-07',NULL,'81 Mosinee Road','San Luis Obispo','CA',1023),(88,'Elwira','Bartosch','1971-12-09',NULL,'7429 Clemons Pass','Rochester','NY',734),(89,'Gizela','Kyne','1967-02-25',NULL,'1349 David Avenue','Edmond','OK',1087),(90,'Darnell','O\' Reagan','1985-05-17',NULL,'3 Moland Drive','Marietta','GA',1067),(91,'Roslyn','Handes','1974-11-20',NULL,'590 3rd Circle','Toledo','OH',940),(92,'Brittni','Lazell','1988-02-01',NULL,'91 Bultman Crossing','Sioux Falls','SD',1846),(93,'Flss','Trenouth','1982-12-06',NULL,'67878 Doe Crossing Circle','Jacksonville','FL',878),(94,'Rosalia','Mogridge','1988-01-18',NULL,'77065 Magdeline Alley','Tulsa','OK',47),(95,'Christian','Collumbell','1962-12-02',NULL,'3712 Portage Lane','Baltimore','MD',63),(96,'Dre','Coffelt','1953-11-27',NULL,'55 Warbler Lane','Atlanta','GA',1452),(97,'Leif','Geare','1981-12-17',NULL,'7 Corben Pass','Newark','DE',1331),(98,'Caitrin','Vedishchev','1966-01-29',NULL,'435 Little Fleur Lane','Glendale','AZ',629),(99,'Sunshine','Lenard','1975-12-24',NULL,'5 Kensington Park','Baltimore','MD',948),(100,'Kaitlin','Pottinger','1969-02-23',NULL,'4 Straubel Junction','Sacramento','CA',1201),(101,'Sidnee','Yakubovich','1980-08-31',NULL,'06 Pankratz Street','El Paso','TX',1532),(102,'Constantina','Faulconer','1950-12-31',NULL,'33951 Kennedy Parkway','Reno','NV',1913),(103,'Bobbie','Brosio','1986-12-17',NULL,'7 Burrows Crossing','Richmond','VA',1314),(104,'Barbra','Somerscales','1952-06-26',NULL,'67 Corscot Terrace','Houston','TX',601),(105,'Joete','Lippo','1985-05-24',NULL,'1141 Charing Cross Junction','Fort Worth','TX',1412),(106,'Cleopatra','Peevor','1951-10-18',NULL,'8865 New Castle Point','Monticello','MN',1750),(107,'Evelyn','Saffill','1956-01-14',NULL,'4 Alpine Parkway','Buffalo','NY',762),(108,'Dacia','Callway','1950-07-26',NULL,'4 Sycamore Place','San Diego','CA',1570),(109,'Letta','Collinge','1976-08-05',NULL,'12687 Pine View Place','Richmond','VA',719),(110,'Homerus','Lorryman','1977-07-04',NULL,'4471 7th Pass','Topeka','KS',250),(111,'Brittan','Francie','1970-02-10',NULL,'046 Maryland Circle','Canton','OH',398),(112,'Gray','Letson','1982-08-03',NULL,'8 Lunder Center','New York City','NY',1631),(113,'Britte','Mewe','1984-06-14',NULL,'2 Hollow Ridge Hill','Tempe','AZ',118),(114,'Trey','MacClancey','1951-05-30',NULL,'4 Grim Circle','Tampa','FL',711),(115,'Shaun','Waeland','1954-04-07',NULL,'3434 Derek Terrace','Seattle','WA',1266),(116,'Ignatius','Boissier','1966-05-04',NULL,'94 Mendota Trail','Fort Myers','FL',806),(117,'Rosalynd','Ferryn','1970-04-15',NULL,'4 Morrow Plaza','Oklahoma City','OK',1879),(118,'Willdon','Andreoletti','1953-07-16',NULL,'95 Merrick Place','Wichita','KS',446),(119,'Shawn','Gaber','1980-10-15',NULL,'41 Clove Pass','Albuquerque','NM',1229),(120,'Jessamine','holmes','1984-03-17',NULL,'88 Ludington Point','Birmingham','AL',1790),(121,'Eden','Ellissen','1950-09-30',NULL,'97276 Mallard Lane','Houston','TX',77),(122,'Ibrahim','Whaplington','1954-05-15',NULL,'7 Esker Avenue','Farmington','MI',185),(123,'Jewell','Bensen','1963-09-18',NULL,'95202 Doe Crossing Parkway','Abilene','TX',669),(124,'Victoria','Agent','1975-02-28',NULL,'92810 Novick Crossing','Topeka','KS',1599),(125,'Cate','Van Der Hoog','1965-07-15',NULL,'14 Arkansas Parkway','Elmira','NY',835),(126,'Dory','Sarfass','1975-11-13',NULL,'83394 Quincy Pass','San Jose','CA',960),(127,'Mallorie','Kippax','1958-12-09',NULL,'75828 Raven Point','Warren','OH',470),(128,'Serge','Rotlauf','1989-10-24',NULL,'739 Mifflin Point','Dallas','TX',223),(129,'Lorita','Bielfeld','1959-10-24',NULL,'771 Lindbergh Center','Los Angeles','CA',1086),(130,'Jenn','Satyford','1981-04-11',NULL,'09 Toban Street','Staten Island','NY',1893),(131,'Forster','Sackes','1984-11-13',NULL,'25 Westerfield Center','Tucson','AZ',900),(133,'Fancie','Loveard','1954-09-29',NULL,'2811 Schmedeman Terrace','Norwalk','CT',1498),(134,'Vassili','Ogles','1963-03-13',NULL,'0 Tony Place','Cincinnati','OH',1869),(135,'Malissa','Folomin','1965-06-28',NULL,'82359 Meadow Vale Parkway','Akron','OH',478),(136,'Guillaume','Newbatt','1971-09-16',NULL,'84 Maple Drive','Minneapolis','MN',73),(137,'Cicely','Yeldon','1988-10-20',NULL,'5381 Fisk Center','Anderson','SC',1328),(138,'Cora','Plessing','1953-08-29',NULL,'3 Vermont Circle','Nashville','TN',574),(139,'Seymour','Glaisner','1963-05-18',NULL,'9 Ohio Terrace','Lancaster','PA',156),(140,'Katerine','Adolf','1968-03-12',NULL,'467 Vernon Plaza','Omaha','NE',1216),(141,'Mario','Middlehurst','1977-05-01',NULL,'85657 Prairieview Parkway','Pittsburgh','PA',1992),(142,'Darya','Gianinotti','1960-10-11',NULL,'3743 Bultman Crossing','Phoenix','AZ',507),(143,'Erma','Flade','1976-03-23',NULL,'4 Prairieview Circle','Amarillo','TX',1278),(144,'Lanita','Landis','1966-08-19',NULL,'2117 Mcbride Place','San Antonio','TX',714),(145,'Bartlet','Niccols','1955-11-23',NULL,'8687 Bunting Alley','Birmingham','AL',116),(146,'Mathe','Tal','1969-12-19',NULL,'85 Drewry Alley','New York City','NY',882),(147,'Camile','Huckerbe','1969-08-12',NULL,'794 Old Shore Alley','Erie','PA',1021),(148,'Kassia','Westmorland','1963-07-19',NULL,'402 Mockingbird Way','Raleigh','NC',530),(149,'Betsey','MacTrustrie','1968-05-27',NULL,'6 Grasskamp Terrace','Mc Keesport','PA',1324),(150,'Kale','Cullotey','1981-01-18',NULL,'75 Loftsgordon Road','Portland','OR',263),(151,'Zsa zsa','McClunaghan','1989-04-27',NULL,'09 Melby Drive','Oklahoma City','OK',263),(152,'Tina','Toler','1962-07-30',NULL,'94690 Shelley Pass','Visalia','CA',167),(153,'Audra','Ranaghan','1964-09-18',NULL,'61 Bluestem Hill','Vancouver','WA',748),(154,'Adolphus','Sidry','1989-05-26',NULL,'53754 Eastlawn Hill','Newport News','VA',65),(155,'Lammond','Emig','1983-06-30',NULL,'6 Pennsylvania Drive','Washington','DC',1484),(156,'Anna-diana','Lidgett','1961-03-01',NULL,'9286 Reinke Alley','Bronx','NY',640),(157,'Vally','Sheivels','1963-02-14',NULL,'14 Portage Parkway','Billings','MT',1252),(158,'Brenna','Toulamain','1961-08-04',NULL,'7 Sunnyside Parkway','Buffalo','NY',1171),(159,'Erhart','Persehouse','1958-04-17',NULL,'84549 Waubesa Center','El Paso','TX',306),(160,'Myrtie','Ewence','1972-09-19',NULL,'76 7th Terrace','Arlington','TX',1111),(161,'Velma','Osman','1960-04-28',NULL,'8 Butternut Park','Hartford','CT',1103),(162,'Tomkin','Shavel','1982-01-01',NULL,'79 Cambridge Plaza','Nashville','TN',1939),(163,'Geoffrey','Mocher','1981-04-02',NULL,'89 Ilene Junction','Hartford','CT',584),(164,'Clem','Rippingall','1980-04-03',NULL,'240 Shelley Lane','Pittsburgh','PA',1303),(165,'Quill','Leal','1954-02-07',NULL,'039 Barnett Court','Albuquerque','NM',1336),(166,'Nealon','Spottiswood','1975-05-03',NULL,'104 Logan Park','Philadelphia','PA',1958),(167,'Athene','Newsham','1963-09-27',NULL,'90 Anderson Pass','Lexington','KY',451),(168,'Konstantin','Hodgets','1970-04-18',NULL,'8 Sachs Court','Charleston','SC',1492),(169,'Ilise','Howsden','1990-01-07',NULL,'2144 Northfield Crossing','Trenton','NJ',826),(170,'Alphonso','Reuben','1981-03-09',NULL,'35918 Grover Pass','Chicago','IL',277),(171,'Rik','Salterne','1972-08-04',NULL,'9136 Montana Parkway','Tampa','FL',1178),(172,'Conny','Yegorev','1964-02-08',NULL,'5 Monument Parkway','Rochester','NY',1915),(173,'Babita','Wikey','1951-04-03',NULL,'3229 Northland Trail','Baton Rouge','LA',945),(174,'Yvonne','Derington','1957-07-15',NULL,'10079 Darwin Circle','Hartford','CT',603),(175,'Arliene','Schulken','1961-11-06',NULL,'303 Holy Cross Avenue','Rochester','NY',1830),(176,'Derby','Nisbith','1977-07-29',NULL,'741 Fordem Terrace','Spring','TX',584),(177,'Joly','Danko','1966-03-14',NULL,'282 Stuart Drive','Houston','TX',1103),(178,'Starr','Vardie','1974-03-27',NULL,'84 Debra Avenue','San Diego','CA',201),(179,'Darwin','Maffezzoli','1988-07-26',NULL,'5 Dryden Park','Jacksonville','FL',512),(180,'Aggy','Poff','1961-10-19',NULL,'02 Express Circle','El Paso','TX',183),(181,'Jarvis','Armsden','1958-10-18',NULL,'11 Canary Crossing','Erie','PA',52),(182,'Lauree','Sokill','1986-01-20',NULL,'9266 Monica Crossing','Pittsburgh','PA',1009),(183,'Berky','Muat','1978-05-12',NULL,'56716 Ohio Alley','Juneau','AK',992),(184,'Trudy','Atkirk','1964-08-18',NULL,'3494 Schurz Park','Los Angeles','CA',1334),(185,'Marne','Slobom','1980-09-25',NULL,'04 Mesta Way','Charlottesville','VA',604),(186,'Reed','Abrams','1987-09-25',NULL,'6435 Redwing Place','Los Angeles','CA',1634),(187,'Virginia','Colin','1983-11-07',NULL,'65 Manley Parkway','San Diego','CA',1419),(188,'Lila','Garvill','1973-02-23',NULL,'204 8th Street','Reno','NV',458),(189,'Dwight','Hatz','1968-05-22',NULL,'066 Lake View Pass','Des Moines','IA',1483),(190,'Cate','Guilaem','1980-10-25',NULL,'82 Porter Plaza','Anderson','SC',433),(191,'Minni','Kop','1962-12-05',NULL,'0 Anzinger Pass','Boynton Beach','FL',599),(192,'Penny','Probin','1980-11-22',NULL,'93450 Carey Parkway','Spokane','WA',879),(193,'Manya','Heazel','1971-12-23',NULL,'21716 Cascade Street','Jackson','MS',744),(194,'Enrika','Saterweyte','1964-03-16',NULL,'66 Kenwood Drive','Oklahoma City','OK',1168),(195,'Avis','Papez','1989-06-30',NULL,'4 Eagan Center','Austin','TX',1376),(196,'Aubrey','Skipton','1965-10-15',NULL,'704 Comanche Alley','Orlando','FL',1512),(197,'Kelsey','Lafranconi','1990-01-12',NULL,'6 Buhler Pass','San Antonio','TX',1884),(198,'Walton','Kopp','1975-11-06',NULL,'681 Lakeland Plaza','Jeffersonville','IN',1883),(199,'Gisele','Osmar','1955-06-28',NULL,'5400 Alpine Circle','Chicago','IL',1713),(200,'Rania','Plevin','1952-07-11',NULL,'41041 Kingsford Junction','Pasadena','CA',1369),(201,'Terrel','Kenworthy','1988-01-25',NULL,'41832 Londonderry Junction','Odessa','TX',164),(202,'Brit','Sisland','1959-03-29',NULL,'9279 Warbler Center','Brooksville','FL',886),(203,'Vanya','Glasspoole','1989-08-11',NULL,'5 Esch Point','Cincinnati','OH',1861),(204,'Shaun','MacBrearty','1959-04-28',NULL,'9156 Westport Center','Inglewood','CA',1448),(205,'Kasey','Vasyukov','1951-03-24',NULL,'35362 Kedzie Street','Houston','TX',829),(206,'Abagael','Wagenen','1950-09-11',NULL,'09296 Forest Run Center','Battle Creek','MI',1701),(207,'Ninon','Leversuch','1973-09-20',NULL,'89157 Scoville Crossing','Phoenix','AZ',1991),(208,'Tomaso','Salvador','1974-09-01',NULL,'22 Arapahoe Park','Levittown','PA',1699),(209,'Shel','Hedgeman','1954-05-08',NULL,'33 Armistice Trail','Baton Rouge','LA',1675),(210,'Denny','Glabach','1986-08-25',NULL,'032 Orin Terrace','San Francisco','CA',1820),(211,'Jayson','McCullogh','1950-08-11',NULL,'7330 Union Crossing','San Jose','CA',1573),(212,'Amie','Kingzet','1961-12-24',NULL,'03 Waxwing Pass','Boynton Beach','FL',1827),(213,'Zaccaria','Castano','1957-04-14',NULL,'3 John Wall Pass','Elizabeth','NJ',339),(214,'Brockie','Toor','1976-08-23',NULL,'97 Cherokee Junction','Anchorage','AK',182),(215,'Dedie','Abrahamian','1967-11-20',NULL,'6 Brentwood Terrace','Norwalk','CT',1099),(216,'Omero','Whitwham','1984-11-12',NULL,'82 Raven Circle','Austin','TX',533),(217,'Parke','Stelfox','1953-08-23',NULL,'6 Sage Way','San Antonio','TX',189),(218,'Madlin','Mandre','1981-12-17',NULL,'721 Hooker Alley','New Bedford','MA',1716),(219,'Far','Cosgrove','1968-11-22',NULL,'5915 Walton Center','Salt Lake City','UT',745),(220,'Elise','Yann','1973-02-21',NULL,'38 Springview Center','Vero Beach','FL',20),(221,'Ingeborg','Lankham','1956-03-13',NULL,'1096 Kenwood Crossing','Jamaica','NY',590),(222,'Bernette','Ticksall','1985-02-03',NULL,'15 Bartillon Circle','Minneapolis','MN',1158),(223,'Carolan','Camois','1978-05-18',NULL,'8 Arkansas Trail','Baton Rouge','LA',1698),(224,'Brena','Bottelstone','1969-02-25',NULL,'38666 Buell Parkway','Camden','NJ',1318),(225,'Kynthia','Blabber','1967-11-30',NULL,'8409 Cardinal Way','Portland','OR',441),(226,'Briney','De Caroli','1968-11-21',NULL,'94 Basil Park','Memphis','TN',1275),(227,'Bibby','Oldland','1961-05-08',NULL,'94717 Lyons Point','San Diego','CA',1339),(228,'Eimile','Haggas','1958-04-06',NULL,'5312 Riverside Park','Corpus Christi','TX',608),(229,'Beverlie','Padefield','1980-06-16',NULL,'9 Dottie Road','Memphis','TN',1071),(230,'Dorie','Ryves','1952-02-11',NULL,'7 Schurz Park','Denver','CO',1895),(231,'Stevie','Burk','1988-09-03',NULL,'68275 Esker Pass','Wichita','KS',323),(232,'Hobard','Bolver','1967-04-04',NULL,'206 Hudson Terrace','Tucson','AZ',1113),(233,'Perice','De Mico','1975-04-07',NULL,'303 Sachtjen Trail','Tampa','FL',428),(234,'Guido','Brunn','1984-08-20',NULL,'4 Sunbrook Point','Atlanta','GA',1652),(235,'Doyle','Lindelof','1977-08-15',NULL,'3308 Esch Trail','Harrisburg','PA',480),(236,'Kliment','Piatto','1970-02-05',NULL,'6 Talmadge Street','Fresno','CA',246),(237,'Judith','Hedger','1983-06-19',NULL,'817 Jenifer Avenue','Henderson','NV',1646),(238,'Gayel','Gonthier','1965-04-22',NULL,'990 Ryan Terrace','Columbus','OH',262),(239,'Anni','Rodda','1968-02-24',NULL,'92196 Havey Trail','Fairfield','CT',103),(240,'Melisa','Rollings','1966-08-26',NULL,'3 Crownhardt Point','Charlottesville','VA',122),(241,'Bill','Cordero','1952-11-21',NULL,'12440 Merry Drive','Memphis','TN',1743),(242,'Debbi','Bennetto','1978-08-13',NULL,'69 Burrows Place','Fort Smith','AR',1834),(243,'Lovell','Gook','1987-03-11',NULL,'05 5th Crossing','Young America','MN',1326),(244,'Rodi','Norgate','1950-12-29',NULL,'6816 Norway Maple Alley','Pomona','CA',540),(245,'Jennie','Leasor','1967-03-11',NULL,'67 Graedel Street','Albuquerque','NM',213),(246,'Dulcine','Derdes','1963-05-24',NULL,'30 Sloan Junction','Peoria','IL',714),(247,'Alvinia','Sothcott','1955-11-12',NULL,'25 Memorial Circle','Houston','TX',1465),(248,'Betteanne','Whoolehan','1964-10-08',NULL,'75 Green Hill','Honolulu','HI',1755),(249,'Ulberto','McAlinden','1988-04-02',NULL,'78 Pawling Terrace','Norfolk','VA',515),(250,'Gerardo','Leavry','1957-04-12',NULL,'939 Arapahoe Lane','Fort Lauderdale','FL',537),(251,'Anne','Meijer','1962-07-05',NULL,'247 Mayfield Point','Wilmington','DE',361),(252,'Art','Vivash','1975-04-03',NULL,'19 Monument Drive','Glendale','CA',1437),(253,'Franklin','Martine','1980-12-26',NULL,'241 Farmco Crossing','Orlando','FL',1196),(254,'August','Caccavari','1979-06-05',NULL,'19933 2nd Terrace','Atlanta','GA',1161),(255,'Karine','Kidde','1970-05-03',NULL,'60723 Bartelt Pass','Kansas City','MO',1424),(256,'Roshelle','Crat','1980-09-16',NULL,'24 Morrow Parkway','Buffalo','NY',1864),(257,'Elga','Chomiszewski','1977-06-09',NULL,'2285 Welch Lane','Naples','FL',352),(258,'Mildred','Gunther','1973-07-30',NULL,'6346 Dottie Court','Las Cruces','NM',1498),(259,'Shirley','Burberye','1983-01-27',NULL,'8 Grim Place','Newark','NJ',701),(260,'Fitz','Darrigrand','1984-04-15',NULL,'9806 Maryland Hill','Las Cruces','NM',1615),(261,'Annadiana','Esson','1982-07-30',NULL,'8667 Mendota Terrace','Toledo','OH',1645),(262,'Morlee','Bonhan','1981-01-25',NULL,'2 Logan Drive','Dayton','OH',1658),(263,'Estel','Hawthorne','1962-03-18',NULL,'6 Westend Street','North Las Vegas','NV',1628),(265,'Eirena','Cran','1982-01-12',NULL,'9 Washington Plaza','Norcross','GA',932),(266,'Elmore','Jiruca','1966-11-28',NULL,'02553 Prairieview Alley','Port Saint Lucie','FL',1845),(267,'Wilmette','Comino','1950-12-17',NULL,'050 Mendota Lane','Saint Paul','MN',100),(268,'Yolane','Foden','1961-05-11',NULL,'9052 Loftsgordon Avenue','Minneapolis','MN',1833),(269,'Elsy','Hriinchenko','1972-07-06',NULL,'011 Caliangt Avenue','Saint Petersburg','FL',1058),(270,'Travus','Moyer','1971-03-28',NULL,'9 Hazelcrest Avenue','Roanoke','VA',324),(271,'Farley','Tregea','1970-11-03',NULL,'8 Kenwood Circle','Minneapolis','MN',374),(272,'Timmi','Fetherstonhaugh','1964-11-06',NULL,'4049 Drewry Terrace','Pittsburgh','PA',195),(273,'Wernher','Gircke','1956-07-13',NULL,'10 Anniversary Alley','Albuquerque','NM',1902),(274,'Lucas','Zanussii','1984-04-05',NULL,'34823 Glacier Hill Circle','Corpus Christi','TX',1012),(275,'Eliot','Kirmond','1954-01-20',NULL,'25097 Ramsey Parkway','Winter Haven','FL',570),(276,'Sibella','Dansken','1957-09-15',NULL,'93 Scott Alley','Mansfield','OH',798),(277,'Arlen','Kayzer','1984-01-10',NULL,'624 Shopko Crossing','Melbourne','FL',1783),(278,'Richie','Gommowe','1954-05-23',NULL,'05 Merry Drive','Hialeah','FL',1789),(279,'Brynne','Cinnamond','1966-07-22',NULL,'81800 Loomis Drive','Erie','PA',1872),(280,'Rosalia','Logie','1956-06-19',NULL,'241 Everett Parkway','Denver','CO',612),(281,'Jenelle','Labuschagne','1972-07-06',NULL,'13 Homewood Circle','Lees Summit','MO',289),(282,'Miller','Rycraft','1979-05-28',NULL,'0 Pine View Avenue','Irvine','CA',1709),(283,'Philis','Shedd','1955-11-30',NULL,'27 Menomonie Street','San Jose','CA',740),(284,'Geno','Ganforth','1970-03-21',NULL,'9 Thompson Alley','Philadelphia','PA',1016),(285,'Millisent','Dachey','1960-07-08',NULL,'8 Towne Center','Indianapolis','IN',1691),(286,'Brandyn','Burling','1987-07-20',NULL,'03669 Tennyson Crossing','Atlanta','GA',1),(287,'Alric','Bugdall','1976-02-26',NULL,'9 Moose Parkway','Fresno','CA',1142),(288,'Fannie','Watchorn','1959-04-24',NULL,'63 Nobel Pass','Washington','DC',266),(290,'Lorette','Daens','1972-11-12',NULL,'484 Porter Plaza','New York City','NY',578),(291,'Mattheus','Broscombe','1975-04-11',NULL,'8605 Prairie Rose Way','Denver','CO',978),(292,'Patin','McMickan','1952-07-02',NULL,'90358 Lakewood Gardens Crossing','Duluth','MN',727),(293,'Darrelle','Lulham','1973-09-18',NULL,'4247 Florence Avenue','Greensboro','NC',572),(294,'Reade','Bodycomb','1955-01-16',NULL,'57 Ilene Point','Baton Rouge','LA',1046),(295,'Jacquenetta','Landy','1961-12-24',NULL,'179 Bashford Place','Cincinnati','OH',502),(296,'Lexine','Overington','1971-01-18',NULL,'81 Southridge Street','Lakewood','WA',1532),(297,'Conni','Agett','1955-08-28',NULL,'782 Clyde Gallagher Plaza','Roanoke','VA',1294),(298,'Flin','Blackshaw','1985-10-31',NULL,'7024 Union Park','Clearwater','FL',1636),(299,'Timmie','Letford','1971-08-28',NULL,'018 Shopko Avenue','Sacramento','CA',568),(300,'Kalie','Critchley','1973-09-03',NULL,'851 Superior Place','Grand Rapids','MI',901),(301,'Chaunce','Narracott','1953-10-17',NULL,'541 Village Terrace','Washington','DC',660),(302,'Rafaelia','Jenkin','1983-12-07',NULL,'7 Scott Terrace','Brooklyn','NY',116),(303,'Vaclav','Torns','1953-08-15',NULL,'907 Wayridge Plaza','Anchorage','AK',1763),(304,'Bartholomew','Creer','1970-05-11',NULL,'84896 Golf Pass','Melbourne','FL',1153),(305,'Celia','Rikel','1951-08-07',NULL,'6 Susan Court','Buffalo','NY',1009),(306,'Chadd','Kinze','1963-07-08',NULL,'93596 Melvin Park','Mobile','AL',1429),(307,'Gaile','Thackston','1981-06-08',NULL,'93 Truax Center','Odessa','TX',1240),(308,'Minnaminnie','Hintzer','1986-08-30',NULL,'52850 Ronald Regan Parkway','Amarillo','TX',361),(309,'Marylynne','Whiteley','1956-03-09',NULL,'13397 Northport Avenue','Levittown','PA',100),(310,'Petronia','Stimpson','1958-10-16',NULL,'0368 Dryden Parkway','Saint Louis','MO',149),(311,'Megen','Hagart','1986-01-01',NULL,'1 Northwestern Lane','North Port','FL',1349),(312,'Rani','Seally','1968-03-18',NULL,'28 Goodland Crossing','Pittsburgh','PA',1107),(313,'Ave','Mollene','1970-11-22',NULL,'416 Lukken Court','Fort Lauderdale','FL',1561),(314,'Ulrica','Schubert','1983-02-17',NULL,'94 Ohio Trail','Las Vegas','NV',1952),(315,'Abigale','Bottoms','1977-06-12',NULL,'370 Packers Parkway','Saint Paul','MN',1212),(316,'Harvey','Buxam','1978-02-05',NULL,'40 Shelley Center','Winston Salem','NC',1535),(317,'Norton','Tivolier','1967-12-16',NULL,'9859 Ronald Regan Alley','Bridgeport','CT',1850),(318,'Arluene','Peplaw','1980-01-09',NULL,'5665 Dayton Street','Charlotte','NC',1460),(319,'Minnaminnie','Martynka','1984-06-30',NULL,'752 Del Sol Parkway','Washington','DC',1236),(320,'Alon','Munnings','1972-07-22',NULL,'46 Monument Street','Huntsville','AL',370),(321,'Brenna','Simic','1958-01-04',NULL,'66550 Lunder Point','Columbus','OH',306),(322,'Salvador','Dafydd','1964-12-21',NULL,'26 Lukken Road','Brooklyn','NY',1704),(323,'Demott','Normanvill','1989-07-19',NULL,'673 Paget Trail','Bowie','MD',267),(324,'Eran','Roebottom','1967-11-25',NULL,'97918 Gateway Pass','Buffalo','NY',369),(325,'Ricardo','Shimman','1969-07-02',NULL,'6 Evergreen Terrace','Killeen','TX',1462),(326,'Durante','Keasey','1979-03-30',NULL,'10 Toban Pass','Baton Rouge','LA',517),(327,'Bren','Serginson','1962-08-23',NULL,'259 Ilene Trail','San Francisco','CA',325),(328,'Cicily','Scholtz','1982-06-25',NULL,'923 Starling Drive','San Francisco','CA',845),(329,'Patsy','McCreedy','1978-05-09',NULL,'47844 Anthes Lane','Sacramento','CA',325),(330,'Corie','Foffano','1971-01-27',NULL,'93 2nd Junction','New Orleans','LA',63),(331,'Brana','Rustich','1986-12-05',NULL,'9 Nova Road','Lincoln','NE',412),(332,'Dominic','Fraser','1986-10-06',NULL,'6 Buena Vista Crossing','Los Angeles','CA',485),(333,'Zea','Hazeman','1960-08-31',NULL,'03 Lukken Circle','Atlanta','GA',1192),(334,'Christie','Darell','1954-04-28',NULL,'8709 Veith Lane','Baltimore','MD',187),(335,'Jermain','Bass','1961-03-08',NULL,'377 Anderson Point','Lawrenceville','GA',1326),(336,'Marlee','Bidder','1990-03-10',NULL,'14536 Longview Point','Boston','MA',1623),(337,'Salmon','Del Dello','1963-05-06',NULL,'03454 Express Street','Miami','FL',677),(338,'Lesley','Lichfield','1965-12-14',NULL,'4 Annamark Parkway','Fort Worth','TX',1864),(339,'Otho','Pawlik','1957-03-01',NULL,'821 Hintze Terrace','Houston','TX',1502),(340,'Josias','Robertz','1967-12-30',NULL,'81 Westport Drive','Sacramento','CA',207),(341,'Derrik','Burbage','1954-02-06',NULL,'98 Eagle Crest Crossing','Jamaica','NY',1123),(342,'Mariquilla','Owain','1973-05-03',NULL,'411 2nd Parkway','Tampa','FL',1159),(344,'Gloria','Drillot','1966-07-11',NULL,'5 Shoshone Pass','San Antonio','TX',1668),(345,'Annamaria','Milbourne','1965-08-20',NULL,'811 Reindahl Junction','South Bend','IN',405),(346,'Lory','Gilleon','1953-09-25',NULL,'43 Schurz Trail','New Haven','CT',1554),(347,'Mace','John','1974-03-28',NULL,'43815 Express Avenue','Abilene','TX',76),(348,'Mohandis','Suttill','1972-04-30',NULL,'80926 Cottonwood Drive','Olympia','WA',932),(349,'Andrea','Combes','1973-04-17',NULL,'37 Parkside Crossing','Cleveland','OH',825),(350,'Ikey','Oblein','1957-10-03',NULL,'85 Bayside Avenue','Peoria','AZ',1222),(351,'Aleen','Assante','1969-08-19',NULL,'2 Erie Place','Asheville','NC',1701),(352,'Staffard','Yellop','1952-03-09',NULL,'3270 Eggendart Drive','Winston Salem','NC',1002),(353,'Jeannette','Levin','1985-06-22',NULL,'93514 Stoughton Hill','Grand Forks','ND',315),(355,'Winifred','Hutson','1951-12-06',NULL,'234 Muir Hill','New Haven','CT',38),(356,'Brennen','Freeborn','1975-12-24',NULL,'4461 Westport Avenue','Houston','TX',1342),(357,'June','Bottomore','1959-04-26',NULL,'84 Ruskin Court','Maple Plain','MN',1920),(358,'Katrine','Kobelt','1989-12-05',NULL,'0479 East Place','Anderson','IN',1662),(359,'Anna-maria','Beardon','1971-07-24',NULL,'6 Petterle Place','Johnson City','TN',599),(360,'Eugenio','Toffoloni','1983-03-19',NULL,'57391 Randy Pass','New York City','NY',872),(361,'Coop','Michieli','1956-11-20',NULL,'094 Corben Circle','Miami','FL',377),(362,'Melosa','Mickleburgh','1959-12-07',NULL,'48 Grasskamp Trail','Topeka','KS',1438),(363,'Sherilyn','Fery','1966-01-16',NULL,'19241 Clarendon Trail','Knoxville','TN',279),(364,'Rudolf','Casterou','1965-08-12',NULL,'95 Gina Pass','Atlanta','GA',773),(365,'Lucille','Cossentine','1955-05-10',NULL,'03 Jay Parkway','Bronx','NY',285),(366,'Cyndia','Dadd','1978-09-22',NULL,'53258 Dennis Way','Des Moines','IA',78),(367,'Glynnis','Goldsmith','1957-11-08',NULL,'6859 Center Trail','Honolulu','HI',436),(368,'Arlen','Manjin','1977-09-27',NULL,'08 Maple Wood Center','Fort Pierce','FL',385),(369,'Levy','Cleeton','1978-08-06',NULL,'702 Eagle Crest Terrace','Akron','OH',1004),(370,'Ermentrude','Wardell','1958-11-01',NULL,'65321 Bobwhite Circle','Boston','MA',343),(371,'Odelle','Wanless','1986-03-12',NULL,'73 Bunting Way','Honolulu','HI',1565),(372,'Dougy','Scaife','1952-06-05',NULL,'0056 Crowley Place','Detroit','MI',619),(373,'Shelley','Gricks','1977-01-16',NULL,'640 Badeau Park','West Palm Beach','FL',1168),(374,'Cass','Kembrey','1987-11-16',NULL,'5 Anniversary Hill','Indianapolis','IN',1568),(375,'Shelden','Skewes','1987-04-13',NULL,'1689 Lukken Hill','Kansas City','MO',1090),(376,'Thedric','Shilburne','1956-08-08',NULL,'94779 Kedzie Trail','Panama City','FL',1928),(377,'Iggie','Filtness','1986-05-24',NULL,'64 Logan Plaza','Washington','DC',1635),(378,'Justino','Skirling','1971-11-05',NULL,'7 Bunker Hill Circle','Miami','FL',898),(379,'Antin','Done','1988-09-02',NULL,'54 Vahlen Court','Orlando','FL',1510),(380,'Sascha','Setchfield','1953-05-13',NULL,'9362 Spohn Lane','Augusta','GA',86),(381,'Steffen','Gertray','1975-09-14',NULL,'9588 Washington Point','Hayward','CA',229),(382,'Thebault','Dunlop','1956-01-12',NULL,'01275 Ridgeview Park','Cleveland','OH',331),(383,'Ab','Jozsa','1958-02-14',NULL,'00 Tomscot Avenue','Omaha','NE',1508),(384,'Lockwood','Lowrie','1978-01-19',NULL,'065 Kipling Drive','Texarkana','TX',1402),(385,'Kristofer','Standring','1988-03-03',NULL,'8 Sutherland Drive','Saint Cloud','MN',1767),(386,'Wayne','Jemison','1980-06-14',NULL,'7 Stuart Circle','Asheville','NC',1183),(387,'Kermie','Cotterrill','1976-08-06',NULL,'344 Nobel Center','Miami','FL',1285),(388,'Roman','Ivel','1956-06-14',NULL,'4212 Sage Place','Jersey City','NJ',1002),(389,'Leigh','Angless','1963-08-30',NULL,'735 Chive Street','Meridian','MS',1859),(390,'Carline','Brushfield','1983-03-31',NULL,'20257 Rusk Plaza','Jefferson City','MO',480),(391,'Kerrie','Cupitt','1975-06-30',NULL,'380 Twin Pines Plaza','Wilkes Barre','PA',24),(392,'Gradeigh','Ibbotson','1987-01-19',NULL,'645 Anzinger Park','New York City','NY',190),(393,'Rad','Woodington','1958-12-16',NULL,'1 Upham Park','Pensacola','FL',1765),(394,'Jimmie','Floris','1967-12-31',NULL,'12185 Myrtle Alley','Phoenix','AZ',1412),(395,'Vivia','Brugemann','1961-08-31',NULL,'44 Hayes Court','Springfield','MO',15),(396,'Fancy','Jachtym','1976-09-03',NULL,'6318 Jenifer Trail','Erie','PA',1395),(397,'Lilia','Lepper','1972-08-11',NULL,'329 Glendale Alley','Newport News','VA',816),(398,'Randy','Malby','1956-10-20',NULL,'1707 Butternut Parkway','Macon','GA',1151),(399,'Alvera','McCaughan','1987-12-24',NULL,'47 Anderson Lane','Midland','TX',230),(400,'Caryl','Kolyagin','1987-04-16',NULL,'675 Morningstar Parkway','Littleton','CO',1410),(401,'Margareta','Jenking','1970-04-12',NULL,'10882 Sutherland Plaza','York','PA',1673),(402,'Silvia','Gold','1971-03-07',NULL,'5303 Northfield Street','Denver','CO',409),(403,'Orton','Gynn','1975-11-12',NULL,'2 Chive Park','Brooklyn','NY',607),(404,'Cami','Britch','1962-06-24',NULL,'43474 Calypso Way','South Bend','IN',1288),(405,'Nertie','Peacher','1953-01-05',NULL,'78697 Delaware Pass','San Diego','CA',38),(406,'Marlane','Papps','1974-01-26',NULL,'923 Clarendon Alley','Pueblo','CO',719),(407,'Hildagarde','Martinson','1972-10-25',NULL,'3371 Logan Lane','Evansville','IN',1180),(408,'Gussi','Haresign','1954-12-12',NULL,'9 Ludington Trail','Waterbury','CT',1281),(409,'Rycca','Sigart','1959-06-19',NULL,'1 Arapahoe Trail','Lubbock','TX',1617),(410,'Judas','Combe','1965-09-21',NULL,'64 Cody Terrace','Albany','NY',1517),(411,'Wain','Stanesby','1978-11-25',NULL,'9 Truax Pass','Melbourne','FL',1763),(412,'Shayne','Bisacre','1988-04-26',NULL,'41 Briar Crest Center','New York City','NY',1641),(413,'Rivy','Robertis','1955-09-07',NULL,'586 Twin Pines Parkway','Knoxville','TN',1510),(414,'Justinn','Newvill','1976-09-13',NULL,'819 Westport Street','New Haven','CT',1792),(415,'Lind','Itscovitz','1970-07-21',NULL,'06 Morrow Center','Muncie','IN',1604),(416,'Nerissa','Avison','1975-04-12',NULL,'6 Nevada Way','Columbia','SC',210),(417,'Felipe','Grabeham','1988-10-30',NULL,'52 Delladonna Circle','Louisville','KY',954),(418,'Si','Rippin','1953-12-11',NULL,'95100 Fallview Crossing','Spokane','WA',1439),(419,'Rosana','Limer','1977-04-28',NULL,'8802 Mifflin Plaza','Chicago','IL',1818),(420,'Chrissy','holmes','1952-12-02',NULL,'73679 Monica Parkway','Houston','TX',1270),(421,'Dionysus','Garrique','1985-01-16',NULL,'4509 Service Parkway','Fort Smith','AR',976),(422,'Ernesto','Burnell','1985-05-11',NULL,'986 Little Fleur Avenue','Toledo','OH',1462),(423,'Dulcy','Peskin','1977-03-15',NULL,'5951 Shasta Trail','Newport News','VA',981),(424,'Alexandrina','Jodrelle','1957-08-24',NULL,'42337 Fordem Crossing','Trenton','NJ',1491),(425,'Dottie','Gunston','1986-10-03',NULL,'4 Elmside Place','New York City','NY',1078),(426,'Sherie','Readhead','1971-08-21',NULL,'9721 Rieder Lane','Salt Lake City','UT',372),(427,'Fiorenze','Cristofolini','1970-02-11',NULL,'9289 Mallory Way','Washington','DC',1151),(428,'Margarita','McGarel','1958-09-06',NULL,'292 Corscot Lane','Springfield','IL',1531),(429,'Devon','Docwra','1980-10-02',NULL,'5925 Cambridge Trail','Young America','MN',1738),(430,'Corbin','Kosel','1989-07-09',NULL,'326 Bunting Pass','Portland','OR',980),(431,'Reuben','Suero','1988-12-16',NULL,'5695 Granby Terrace','Hyattsville','MD',416),(432,'Tasha','Jansens','1986-05-19',NULL,'5 Gulseth Terrace','Camden','NJ',510),(433,'Maxie','Caush','1953-01-17',NULL,'1 Sutteridge Parkway','Charlotte','NC',1820),(434,'Doy','Flaxman','1980-01-12',NULL,'88 Arizona Center','Topeka','KS',776),(435,'Carine','Gutowski','1967-02-23',NULL,'9597 Valley Edge Pass','Oklahoma City','OK',1243),(436,'Kasey','Bennough','1979-10-06',NULL,'87 Hallows Terrace','El Paso','TX',1262),(437,'Mickey','Valentin','1983-12-16',NULL,'5 Nancy Center','Battle Creek','MI',1311),(438,'Borden','Bickerstaff','1988-02-12',NULL,'40448 Kings Crossing','Atlanta','GA',1788),(439,'Linette','Kenwell','1973-09-29',NULL,'4407 Pennsylvania Alley','Cincinnati','OH',716),(440,'Arnie','Swalteridge','1980-10-01',NULL,'49 Johnson Lane','Modesto','CA',78),(441,'Abdul','Darcey','1980-12-23',NULL,'415 Nelson Avenue','South Lake Tahoe','CA',1858),(442,'Calla','D\'Costa','1958-08-10',NULL,'3 Sachtjen Alley','Birmingham','AL',1812),(443,'Yorgo','Snartt','1962-07-26',NULL,'303 Everett Court','Orlando','FL',1911),(444,'Lucio','Squibe','1963-12-06',NULL,'67060 Anhalt Crossing','Washington','DC',914),(445,'Donnie','Pride','1983-09-27',NULL,'99299 Messerschmidt Drive','Minneapolis','MN',653),(446,'Shoshanna','Eppson','1987-04-09',NULL,'19118 Forest Trail','Tucson','AZ',1810),(447,'Lillis','Middle','1974-12-15',NULL,'95 Old Shore Hill','Saint Paul','MN',1116),(448,'Loren','Olenchikov','1963-10-21',NULL,'8 North Place','Irvine','CA',1835),(449,'Robinson','Filipic','1965-11-19',NULL,'156 Lien Avenue','Lakeland','FL',774),(450,'Esta','Battrum','1964-12-18',NULL,'7272 Sloan Center','Spokane','WA',726),(451,'Clem','Balfre','1968-12-04',NULL,'3 Buena Vista Hill','Charleston','SC',535),(452,'Gertrude','Gulk','1965-06-01',NULL,'20805 Londonderry Alley','Petaluma','CA',1829),(453,'Percival','Baser','1950-08-14',NULL,'32 Ramsey Place','Spokane','WA',1695),(454,'Hastie','Fishleigh','1950-11-26',NULL,'32 Johnson Court','Lubbock','TX',1416),(455,'Dalston','Dullard','1987-05-11',NULL,'87053 Little Fleur Parkway','Valdosta','GA',582),(456,'Goldi','Girone','1952-05-06',NULL,'68 Memorial Park','San Diego','CA',413),(457,'Nicolea','Djurevic','1955-12-15',NULL,'78 Schlimgen Street','Colorado Springs','CO',1697),(458,'Lezlie','Gatling','1989-02-05',NULL,'48 Grover Road','Colorado Springs','CO',668),(459,'Robbin','Dudley','1951-03-20',NULL,'97 Spohn Lane','Gainesville','FL',1432),(460,'Walsh','Husband','1951-04-07',NULL,'3 5th Crossing','Concord','CA',1995),(461,'Berkeley','Gaspard','1960-09-28',NULL,'83 Gateway Hill','Kansas City','KS',620),(462,'Margret','Verma','1971-04-09',NULL,'26867 Coleman Street','North Las Vegas','NV',1971),(463,'Myriam','Rochell','1987-08-06',NULL,'0735 Melrose Road','Vienna','VA',1475),(464,'Germana','Mucillo','1951-11-12',NULL,'55 Iowa Park','Apache Junction','AZ',87),(465,'Mira','Portinari','1964-09-30',NULL,'0325 Tomscot Junction','Knoxville','TN',939),(466,'Rudie','Vallis','1975-10-10',NULL,'84769 Lotheville Alley','South Bend','IN',474),(467,'Dyanne','Sherwood','1967-04-19',NULL,'99 Hermina Road','Denver','CO',1169),(468,'Vincents','Malatalant','1988-04-17',NULL,'66 Melrose Drive','Boulder','CO',1469),(469,'Dale','Moogan','1969-06-21',NULL,'9 Haas Plaza','Terre Haute','IN',1479),(470,'Dotti','Sparham','1959-08-13',NULL,'2563 Linden Point','Akron','OH',1667),(471,'Ibbie','Omond','1979-03-14',NULL,'996 Granby Junction','Philadelphia','PA',285),(472,'Pen','Lawlan','1950-09-24',NULL,'098 Sunfield Street','New York City','NY',715),(473,'Miller','Brittlebank','1966-05-15',NULL,'0247 Lukken Point','San Diego','CA',1726),(474,'Delora','Shovel','1950-10-08',NULL,'489 Lindbergh Place','El Paso','TX',338),(475,'Darbee','Godsil','1982-12-09',NULL,'36 Mariners Cove Alley','Des Moines','IA',53),(476,'Britte','Heatley','1972-11-25',NULL,'36 Walton Court','Washington','DC',1981),(477,'Ivette','Grinnov','1983-09-02',NULL,'642 Straubel Way','Birmingham','AL',884),(478,'Ellery','Wilkins','1980-05-29',NULL,'53804 Sheridan Terrace','Peoria','IL',884),(479,'Noni','Iannitti','1975-01-05',NULL,'12 Manufacturers Way','San Diego','CA',189),(480,'Alecia','MacMarcuis','1970-10-18',NULL,'5124 Heath Pass','San Diego','CA',1984),(481,'Clarine','Frankiewicz','1955-08-18',NULL,'6148 Holy Cross Pass','Conroe','TX',255),(482,'Shelton','Rany','1988-01-01',NULL,'725 Vidon Way','El Paso','TX',4),(483,'Arty','Hearnaman','1962-09-25',NULL,'9753 Eagle Crest Crossing','Roanoke','VA',1338),(484,'Feodora','Cluer','1955-07-20',NULL,'90 Norway Maple Terrace','Peoria','IL',929),(485,'Charles','Jeannot','1981-11-12',NULL,'8 Reinke Junction','Syracuse','NY',604),(486,'Linette','Hounihan','1954-03-26',NULL,'1996 Carpenter Park','Saint Augustine','FL',876),(487,'Stirling','Ferreras','1955-08-24',NULL,'6376 Warrior Street','Jacksonville','FL',1278),(488,'Brod','Hurry','1977-12-18',NULL,'657 Commercial Alley','Jackson','MS',1872),(489,'Chandler','Wolton','1954-02-19',NULL,'5 Merrick Center','Chattanooga','TN',1880),(490,'Pamella','Barton','1985-11-10',NULL,'1406 Starling Road','Merrifield','VA',825),(491,'Matthias','Milbourne','1971-02-05',NULL,'83 Elka Place','Levittown','PA',8),(492,'Colby','Castro','1987-01-21',NULL,'94917 Donald Terrace','Tyler','TX',1781),(493,'Isahella','Wasmuth','1985-03-09',NULL,'355 Farmco Place','Gatesville','TX',1964),(494,'Tabbie','Gubbins','1982-02-26',NULL,'04283 Harbort Center','Fresno','CA',1975),(495,'Rudolph','Carbonell','1977-02-23',NULL,'7540 Everett Circle','Norman','OK',1749),(496,'Norbert','Pardew','1962-10-17',NULL,'73568 Hudson Alley','Lansing','MI',629),(497,'Alanna','Leech','1984-03-11',NULL,'3914 Sachtjen Drive','Springfield','IL',1723),(498,'Kippy','Hawksby','1966-07-15',NULL,'9155 Del Mar Circle','Jacksonville','FL',662),(499,'Abbey','Hindshaw','1970-04-14',NULL,'3 Toban Point','Herndon','VA',1540),(500,'Forbes','Mulchrone','1954-07-15',NULL,'9566 Washington Avenue','Huntsville','AL',719),(501,'Doralin','Swatheridge','1972-05-06',NULL,'24 Canary Crossing','Bronx','NY',1626),(502,'Tad','Gillice','1982-10-11',NULL,'7828 Dawn Avenue','Austin','TX',346),(503,'Archy','Chapleo','1954-04-23',NULL,'538 Springs Road','Washington','DC',1374),(504,'Darrick','Littledike','1974-10-18',NULL,'0127 Pankratz Lane','Kansas City','MO',962),(505,'Umberto','Berntssen','1960-06-13',NULL,'0066 Merchant Junction','Arlington','VA',1650),(506,'Rockwell','Starsmore','1961-03-07',NULL,'4243 Delaware Circle','Roanoke','VA',202),(507,'Deirdre','Seargeant','1978-03-17',NULL,'73 Anderson Alley','Sacramento','CA',1393),(508,'Zed','Jerger','1957-06-21',NULL,'52 Bashford Junction','Bowie','MD',1667),(509,'Pam','Dargie','1958-03-26',NULL,'69283 Scoville Point','Amarillo','TX',117),(510,'Barrett','Pimley','1964-02-28',NULL,'72 Veith Center','Punta Gorda','FL',787),(511,'Augustina','Vasilchenko','1984-06-09',NULL,'8183 Linden Pass','Boston','MA',1040),(512,'Lee','McShirie','1987-11-20',NULL,'983 Green Place','Olympia','WA',529),(513,'Petr','MacAvaddy','1976-12-11',NULL,'2002 Moose Plaza','Edmond','OK',1971),(514,'Kristyn','Goward','1970-02-08',NULL,'358 Dayton Parkway','Akron','OH',1219),(515,'Clayson','Roxburch','1977-11-17',NULL,'64471 Arapahoe Circle','Wilkes Barre','PA',695),(516,'Perry','Shovell','1973-06-20',NULL,'2 Manufacturers Drive','Colorado Springs','CO',1026),(517,'Eddy','Flintoff','1968-03-08',NULL,'8 2nd Point','Irvine','CA',998),(518,'Anastasie','Vivian','1961-08-17',NULL,'75 Evergreen Point','Lexington','KY',663),(519,'Lyndy','Arkill','1959-03-01',NULL,'515 Charing Cross Hill','Buffalo','NY',159),(520,'Tamra','Brunger','1960-09-22',NULL,'299 Lerdahl Avenue','Des Moines','IA',825),(521,'Mitch','Adam','1986-10-30',NULL,'2 Sheridan Trail','Dallas','TX',1199),(522,'Addie','Commuzzo','1952-12-22',NULL,'2 Hooker Parkway','Mesa','AZ',933),(523,'Anetta','Farrell','1988-11-01',NULL,'354 Delaware Circle','Orlando','FL',936),(524,'Margot','Gemnett','1961-07-26',NULL,'68 Charing Cross Junction','Syracuse','NY',1002),(525,'Eva','Duffree','1954-04-09',NULL,'42195 Brentwood Pass','Dayton','OH',1139),(526,'Emile','Silmon','1955-10-16',NULL,'61914 Butternut Plaza','Spokane','WA',520),(527,'Gill','Dusey','1950-05-14',NULL,'25 Graceland Road','Columbus','OH',1725),(528,'Rani','Dunkinson','1970-11-03',NULL,'53 Lunder Plaza','North Las Vegas','NV',12),(529,'Marilyn','Gregs','1962-09-11',NULL,'3003 Granby Avenue','Monticello','MN',1306),(530,'Ariana','Van Leijs','1950-05-10',NULL,'8 Heath Place','Peoria','IL',1556),(531,'Jaimie','Cronk','1954-05-18',NULL,'991 Brickson Park Crossing','Houston','TX',889),(532,'Korry','Ornelas','1963-04-27',NULL,'18070 Eastlawn Park','Las Vegas','NV',686),(533,'Lynn','Braham','1960-07-06',NULL,'5476 Loeprich Junction','Visalia','CA',1662),(534,'Shawn','Houseago','1981-06-19',NULL,'24 Nevada Junction','Cleveland','OH',728),(535,'Etan','Espada','1977-05-06',NULL,'8056 Village Plaza','Lansing','MI',1883),(536,'Bruno','Sone','1970-09-01',NULL,'447 Colorado Pass','Provo','UT',503),(537,'Walker','Hitschke','1964-01-30',NULL,'2844 Lawn Lane','Charlotte','NC',991),(538,'Shea','Yockney','1963-11-12',NULL,'371 Hanover Lane','Houston','TX',1594),(539,'Killian','Gedney','1968-08-07',NULL,'9 Brentwood Park','Mobile','AL',818),(540,'Derrik','Rule','1961-04-11',NULL,'5 Muir Trail','Cincinnati','OH',822),(541,'Albina','Fullilove','1951-02-11',NULL,'7 Sutteridge Place','Albuquerque','NM',1742),(542,'Myriam','Westall','1982-08-13',NULL,'71705 Pierstorff Court','Augusta','GA',803),(543,'Katusha','Ghilardi','1977-01-13',NULL,'1 Judy Center','Henderson','NV',1903),(544,'Elna','Clute','1985-06-29',NULL,'5 Melby Road','Glendale','CA',1659),(545,'Jerri','Arnet','1979-01-17',NULL,'437 Crescent Oaks Pass','Houston','TX',523),(546,'Balduin','Clemendot','1956-04-04',NULL,'07 Di Loreto Junction','Cape Coral','FL',841),(547,'Risa','Duny','1989-10-21',NULL,'2 Melody Trail','Phoenix','AZ',601),(548,'Nady','McCloughlin','1975-08-30',NULL,'093 Bluejay Road','Philadelphia','PA',1304),(549,'Lisbeth','Lovell','1961-08-17',NULL,'086 Westport Parkway','Orlando','FL',283),(550,'Quentin','Helks','1967-11-08',NULL,'71 Oakridge Court','Arlington','VA',1496),(551,'Neel','Tremathick','1972-08-23',NULL,'718 Kedzie Pass','Albuquerque','NM',1191),(552,'Dale','Gostyke','1981-03-20',NULL,'5052 Anniversary Park','Everett','WA',385),(553,'Corrie','Danahar','1959-03-17',NULL,'8778 Fairfield Street','Saint Paul','MN',305),(554,'Helga','Causby','1977-06-25',NULL,'7 Blackbird Crossing','Hartford','CT',1456),(555,'Stuart','Ashplant','1962-04-28',NULL,'0 Lakeland Lane','Burbank','CA',1227),(556,'Glenn','Westerman','1959-03-24',NULL,'00728 Tennessee Parkway','Fort Wayne','IN',18),(557,'Culver','Bradd','1951-02-02',NULL,'07449 Gateway Junction','Shawnee Mission','KS',1755),(558,'Correy','Extall','1954-09-12',NULL,'462 Becker Junction','Knoxville','TN',1423),(559,'Henrik','Clemenzo','1982-09-19',NULL,'62863 Lunder Way','Henderson','NV',325),(560,'Kristo','Andell','1954-03-07',NULL,'2 Loftsgordon Pass','Washington','DC',150),(561,'Banky','Kidds','1980-02-23',NULL,'63 Old Shore Circle','Flint','MI',1956),(562,'Auberon','Silber','1956-05-14',NULL,'6221 4th Center','San Francisco','CA',1174),(563,'Cullen','Klimkiewich','1987-02-27',NULL,'1 Quincy Point','Washington','DC',1432),(564,'Rock','Solomonides','1953-12-11',NULL,'01 Porter Point','Kansas City','MO',426),(565,'Westbrook','McGonigle','1979-09-27',NULL,'93 Hanover Terrace','Santa Fe','NM',1948),(566,'Kahlil','Cobbin','1970-12-20',NULL,'565 Pankratz Place','Gastonia','NC',89),(567,'Lela','Taber','1975-01-05',NULL,'13 Miller Avenue','Hollywood','FL',994),(568,'Freeman','Moubray','1977-01-16',NULL,'8687 Anderson Street','Pensacola','FL',56),(569,'Stacee','Broinlich','1959-08-26',NULL,'13928 Helena Center','Colorado Springs','CO',218),(570,'Darren','Cogley','1966-01-31',NULL,'56226 Crescent Oaks Alley','Spokane','WA',576),(571,'Gian','Parke','1988-01-28',NULL,'810 Bartillon Center','Lansing','MI',1078),(572,'Emmalyn','Jakubovitch','1956-09-06',NULL,'1 Forster Trail','San Francisco','CA',1717),(573,'Lettie','Washtell','1980-03-23',NULL,'3 Pennsylvania Point','Sioux Falls','SD',998),(574,'Alvinia','Swinley','1981-06-08',NULL,'174 West Point','Dallas','TX',598),(575,'Carlie','Blanque','1975-10-09',NULL,'1 Mccormick Place','Reston','VA',218),(576,'Thekla','Simmans','1963-04-02',NULL,'61292 Morrow Point','Denver','CO',839),(577,'Aline','Benner','1982-12-04',NULL,'3 Londonderry Point','Dayton','OH',1286),(578,'Kennett','Clinton','1954-11-09',NULL,'9 Shasta Point','Santa Ana','CA',42),(579,'Farris','Nayshe','1988-10-12',NULL,'85 Talmadge Lane','Houston','TX',1236),(580,'Amble','McCarty','1986-03-09',NULL,'9 Merry Avenue','Bronx','NY',1497),(581,'Vallie','Brotherwood','1968-09-22',NULL,'009 Kipling Crossing','Pittsburgh','PA',56),(582,'Maryjane','Rowlson','1954-11-11',NULL,'93 Randy Alley','Chicago','IL',1280),(583,'Ekaterina','Bygott','1980-10-24',NULL,'02 Kensington Terrace','Fort Lauderdale','FL',941),(584,'Lissi','Joan','1972-08-14',NULL,'1585 Sloan Court','Orlando','FL',1518),(585,'Kristin','Dybell','1963-03-20',NULL,'48281 Corry Crossing','Miami','FL',1742),(586,'Wynn','Hattrick','1951-05-06',NULL,'1874 Lerdahl Road','Manassas','VA',297),(587,'Madelena','Pirelli','1952-04-14',NULL,'33706 Victoria Plaza','Oklahoma City','OK',543),(588,'Salmon','Carnier','1983-01-05',NULL,'2546 Monterey Avenue','Washington','DC',92),(589,'Whitney','Denington','1951-04-11',NULL,'5521 Judy Junction','Philadelphia','PA',152),(590,'Sean','Pilcher','1988-04-18',NULL,'1 Eastlawn Crossing','Pinellas Park','FL',428),(591,'Tyrus','Deplacido','1988-05-23',NULL,'9 Porter Court','Glendale','CA',1204),(592,'Easter','Gommowe','1963-06-01',NULL,'9 Fulton Drive','New York City','NY',1951),(593,'Olivie','Welsby','1969-03-29',NULL,'8 Ilene Trail','Memphis','TN',51),(594,'Kenyon','Martonfi','1980-05-13',NULL,'330 Stuart Park','Saint Petersburg','FL',240),(595,'Grady','Peniman','1984-11-21',NULL,'1 Cordelia Avenue','Colorado Springs','CO',1782),(596,'Gerrilee','Durrell','1981-07-28',NULL,'8449 Bunting Pass','Lexington','KY',734),(597,'Quentin','Heathcote','1984-01-10',NULL,'7 Crescent Oaks Pass','Orlando','FL',676),(598,'Ira','Probate','1977-10-16',NULL,'1 Oakridge Plaza','San Diego','CA',1078),(599,'Jedd','Waggitt','1965-01-14',NULL,'7 Roth Hill','Jacksonville','FL',1029),(600,'Baron','Major','1967-01-17',NULL,'73 Express Pass','Washington','DC',1715),(601,'Rock','Alyukin','1979-06-10',NULL,'1 Northridge Place','Austin','TX',330),(602,'Conroy','Molloy','1971-12-05',NULL,'2 Waxwing Street','Jacksonville','FL',1680),(603,'Hamlin','Pennini','1978-01-13',NULL,'53 Coleman Drive','Lakewood','WA',1201),(604,'Deena','Benge','1956-05-01',NULL,'193 Hanover Street','Nashville','TN',1605),(605,'Gussy','Gane','1959-03-08',NULL,'9931 Bluestem Pass','Miami','FL',973),(606,'Zoe','Dilkes','1969-04-16',NULL,'31 Bayside Alley','Santa Cruz','CA',971),(607,'Forbes','Tinson','1965-12-19',NULL,'37 Calypso Crossing','Muskegon','MI',556),(608,'Minnnie','Cobley','1953-10-21',NULL,'5669 Shoshone Center','Huntington','WV',701),(609,'Abagail','Treen','1960-06-02',NULL,'0235 Bultman Alley','Kansas City','MO',1838),(610,'Maryjo','Cardon','1983-01-08',NULL,'490 Chive Road','Indianapolis','IN',98),(611,'Anson','Fulger','1952-06-12',NULL,'431 Park Meadow Way','Topeka','KS',364),(612,'Marlowe','Dicky','1966-07-17',NULL,'7 Coolidge Hill','Modesto','CA',574),(613,'Bryan','Farnin','1979-06-11',NULL,'515 3rd Pass','Young America','MN',1151),(614,'Dannie','Bishop','1981-02-22',NULL,'50 Mifflin Trail','Utica','NY',734),(615,'Irma','Pygott','1972-07-13',NULL,'7 American Ash Crossing','Spokane','WA',41),(616,'Thorpe','Hudd','1957-04-21',NULL,'3 Pleasure Drive','Wilmington','DE',1151),(617,'Opaline','Loft','1973-08-25',NULL,'4 Bay Trail','Champaign','IL',468),(618,'Allianora','Suermeiers','1960-10-04',NULL,'17553 Thackeray Drive','Reno','NV',1132),(619,'Nigel','Northcliffe','1966-01-12',NULL,'9381 Barnett Avenue','Austin','TX',1867),(620,'Ethelred','Curbishley','1979-03-20',NULL,'63189 Mockingbird Parkway','New Haven','CT',517),(621,'Davy','Inskipp','1957-02-19',NULL,'0800 Pepper Wood Parkway','Migrate','KY',1845),(622,'Hercules','O\'Hallagan','1986-01-06',NULL,'1087 Thackeray Street','Lincoln','NE',1186),(623,'Allyn','Stoney','1989-07-05',NULL,'1847 Golf Hill','Waterbury','CT',864),(624,'Byran','Von Salzberg','1980-02-16',NULL,'54506 Miller Parkway','El Paso','TX',1160),(625,'Phylys','Presnail','1963-10-08',NULL,'46733 Fallview Lane','Metairie','LA',1648),(626,'Darryl','Winsborrow','1977-10-23',NULL,'9767 Mosinee Street','Memphis','TN',1598),(627,'Frieda','Deacon','1978-09-23',NULL,'812 Carey Court','San Diego','CA',1798),(628,'Boycie','McGaughie','1959-05-20',NULL,'9498 Utah Pass','Fresno','CA',1284),(629,'Marietta','Waiting','1966-03-03',NULL,'2 Redwing Drive','Clearwater','FL',808),(630,'Vonni','Smither','1957-10-09',NULL,'104 Coolidge Road','Houston','TX',654),(631,'Alexandre','O\'Brogan','1970-11-08',NULL,'2175 Kennedy Hill','Springfield','OH',1558),(632,'Kelsi','Raistrick','1980-06-30',NULL,'43994 Maple Trail','North Port','FL',1812),(633,'Fayette','Delue','1977-06-21',NULL,'66570 Sachtjen Junction','Battle Creek','MI',511),(634,'Matthew','Chadbourne','1967-06-19',NULL,'243 Erie Junction','Fort Worth','TX',1138),(635,'Floris','Linsey','1975-09-18',NULL,'1 Shasta Trail','Houston','TX',1241),(636,'Dillie','Demchen','1973-07-23',NULL,'89 Johnson Drive','El Paso','TX',29),(637,'Liliane','Cristofolini','1976-08-27',NULL,'3 Bashford Road','Phoenix','AZ',1388),(638,'Nicolis','Tommeo','1962-05-12',NULL,'0 Burrows Plaza','Fort Myers','FL',1908),(639,'Phylis','Ondra','1982-06-02',NULL,'90916 Cordelia Way','Tulsa','OK',127),(640,'Dania','Greenstock','1974-12-18',NULL,'6489 Eagle Crest Road','Austin','TX',1246),(641,'Goddart','Longthorn','1953-01-29',NULL,'47 Schmedeman Point','New York City','NY',1709),(642,'Bertine','Armstrong','1987-12-17',NULL,'3 Carioca Circle','Independence','MO',1843),(643,'Matelda','Gerry','1961-07-09',NULL,'9 2nd Circle','Knoxville','TN',1315),(644,'Josey','Vedeneev','1975-02-09',NULL,'2775 Algoma Hill','Port Saint Lucie','FL',1579),(645,'Carolann','Wreath','1986-07-28',NULL,'693 Garrison Point','Sacramento','CA',586),(646,'Cletus','Sambath','1980-03-12',NULL,'2086 Kingsford Point','Chicago','IL',1238),(647,'Melisse','Bowering','1973-09-16',NULL,'9 Lotheville Alley','New York City','NY',807),(648,'Marrissa','Doy','1983-05-09',NULL,'410 Vera Avenue','Baton Rouge','LA',93),(649,'Chrysa','Bake','1958-04-16',NULL,'9414 Vera Crossing','Charlotte','NC',1439),(650,'Lincoln','Colliver','1980-10-05',NULL,'729 Rusk Parkway','Washington','DC',325),(651,'Bird','Hunsworth','1960-07-30',NULL,'19 Mifflin Circle','Newark','NJ',212),(652,'Andie','Follitt','1986-12-19',NULL,'60 Manitowish Alley','Midland','MI',161),(653,'Meris','Glancy','1989-12-08',NULL,'99725 Fisk Point','Wichita','KS',1259),(654,'Arlan','Vann','1961-04-02',NULL,'9925 Pine View Parkway','Stockton','CA',672),(655,'Sibby','Turfrey','1972-04-11',NULL,'474 Lindbergh Terrace','New York City','NY',34),(656,'Wendell','Gwynn','1977-06-15',NULL,'271 Homewood Center','Sioux Falls','SD',1224),(657,'Huberto','Preble','1980-05-02',NULL,'9994 David Hill','Bronx','NY',1130),(658,'Ginnifer','MacColl','1966-08-21',NULL,'25 Moland Crossing','Fresno','CA',1453),(659,'Hamilton','Woolward','1976-06-23',NULL,'6460 Waxwing Crossing','Canton','OH',1591),(660,'Mirelle','Stutte','1974-11-02',NULL,'76390 Meadow Vale Plaza','Montgomery','AL',255),(661,'Francesca','Combes','1983-01-21',NULL,'96 Cambridge Circle','Columbia','SC',867),(662,'Worthington','Whiley','1977-12-28',NULL,'7386 Glendale Court','Green Bay','WI',1166),(663,'Gualterio','Quilty','1973-01-03',NULL,'8 Farwell Way','Elizabeth','NJ',1033),(664,'Neda','Killich','1961-01-02',NULL,'11 Brown Lane','Des Moines','IA',391),(665,'Ruperto','Lavis','1960-11-05',NULL,'3008 Chinook Street','Davenport','IA',288),(666,'Tammie','Duffy','1972-11-15',NULL,'958 American Way','Gainesville','FL',1928),(667,'Clayborn','Tarn','1967-05-24',NULL,'42524 Waxwing Street','Burbank','CA',193),(668,'Terrance','Pennicard','1952-03-27',NULL,'95 American Court','Marietta','GA',1949),(669,'Thurstan','MacGebenay','1963-07-13',NULL,'11 Golf Course Way','Columbus','GA',24),(670,'Esra','Fowkes','1989-10-12',NULL,'5 Dryden Way','Shawnee Mission','KS',286),(671,'Sigismond','Collinge','1990-04-01',NULL,'1 Welch Alley','Boulder','CO',1276),(672,'Paule','Escalero','1988-05-25',NULL,'16608 Crowley Road','Van Nuys','CA',720),(673,'Cathrin','Soan','1970-11-22',NULL,'666 Packers Trail','El Paso','TX',1187),(674,'Alane','Leward','1985-01-27',NULL,'67528 Badeau Center','Macon','GA',264),(675,'Siward','Jeans','1989-02-16',NULL,'19 Chinook Place','Des Moines','IA',1368),(676,'Drugi','Standish-Brooks','1962-02-20',NULL,'85391 Lighthouse Bay Road','Chicago','IL',676),(677,'Moyra','Angerstein','1950-11-15',NULL,'21309 Pine View Circle','Philadelphia','PA',672),(678,'Rosalinda','Kingswoode','1960-05-01',NULL,'92049 Esker Circle','Charlotte','NC',1680),(679,'Murial','Sevior','1956-08-23',NULL,'57 Alpine Trail','Akron','OH',76),(680,'Corissa','O\'Teague','1979-05-18',NULL,'909 Morningstar Way','Montgomery','AL',100),(681,'Patin','MacTimpany','1962-04-30',NULL,'7147 Towne Hill','Saint Petersburg','FL',98),(682,'Zilvia','Aylesbury','1971-11-28',NULL,'6146 Jackson Terrace','Cincinnati','OH',1970),(683,'Tiffie','McKinstry','1962-12-12',NULL,'4082 Scoville Terrace','Washington','DC',641),(684,'Hieronymus','Hablot','1959-09-20',NULL,'6 Hayes Avenue','Norwalk','CT',1125),(685,'Rem','Vallantine','1972-07-10',NULL,'416 Stone Corner Parkway','Miami','FL',1649),(686,'Chloe','Stillmann','1962-07-07',NULL,'131 Paget Crossing','Paterson','NJ',1255),(687,'Scarlett','Ollivier','1963-09-20',NULL,'58469 Derek Terrace','Atlanta','GA',1499),(688,'Gaylor','Lerner','1955-01-10',NULL,'1 Clarendon Circle','Philadelphia','PA',1444),(689,'Curran','Conerding','1954-07-04',NULL,'2 Claremont Trail','Mc Keesport','PA',1982),(690,'Glynis','Pether','1973-12-17',NULL,'34 Westport Point','Brooklyn','NY',786),(691,'Jameson','Cocklie','1956-10-25',NULL,'7 Almo Avenue','Alexandria','VA',393),(692,'Weider','Hebblewhite','1984-07-03',NULL,'002 Erie Center','Santa Rosa','CA',1669),(693,'Sarine','McCrudden','1954-01-01',NULL,'19 Comanche Pass','Jackson','MS',286),(694,'Teirtza','Finci','1975-01-13',NULL,'4 Northwestern Road','Birmingham','AL',834),(695,'Ruttger','Lassen','1960-04-28',NULL,'44 Hermina Place','Washington','DC',748),(696,'Calypso','Ketchen','1984-08-26',NULL,'8 Fulton Road','Fairbanks','AK',1199),(697,'My','McReedy','1986-04-06',NULL,'8 Buena Vista Terrace','Beaumont','TX',490),(698,'Burlie','Binnall','1951-11-12',NULL,'904 Rowland Avenue','Scottsdale','AZ',1970),(699,'Omero','Martinson','1975-12-21',NULL,'1263 Northport Trail','Lakeland','FL',1184),(700,'Othella','Markson','1990-02-18',NULL,'6 Lerdahl Way','Anaheim','CA',1102),(701,'Pace','Pitrelli','1987-01-27',NULL,'36 Bunker Hill Drive','Decatur','GA',587),(702,'Alica','Bredbury','1971-07-09',NULL,'732 Bunting Junction','Flushing','NY',1209),(703,'Siffre','Ivic','1988-02-03',NULL,'221 Green Point','Los Angeles','CA',1647),(704,'Vivianne','MacCaffery','1951-12-30',NULL,'72 Ilene Center','Amarillo','TX',968),(705,'Daloris','Lewin','1986-02-18',NULL,'0932 Elgar Drive','Phoenix','AZ',1879),(706,'Holly','Hulstrom','1954-11-14',NULL,'30267 Larry Circle','Indianapolis','IN',1563),(707,'Chrysler','Tapp','1982-12-18',NULL,'5017 Mayer Park','Dallas','TX',936),(708,'Emilie','Christaeas','1974-05-14',NULL,'33 Goodland Lane','Santa Barbara','CA',568),(709,'Jackquelin','Spelman','1974-11-19',NULL,'72512 Gale Lane','Long Beach','CA',106),(710,'Yalonda','Yushkin','1957-03-07',NULL,'7 Moland Road','Garland','TX',918),(711,'Daren','Kobpa','1980-09-06',NULL,'04 Oak Valley Park','Springfield','MA',1247),(712,'Orelle','Muffen','1979-06-03',NULL,'569 Doe Crossing Junction','Evansville','IN',1620),(713,'Helsa','Huson','1952-07-01',NULL,'53739 Declaration Lane','Newark','NJ',1346),(714,'Yurik','Langford','1971-09-06',NULL,'10 Springs Crossing','Las Cruces','NM',1757),(715,'Porter','Reeks','1969-10-25',NULL,'4269 Eagle Crest Circle','Santa Fe','NM',1928),(716,'Deana','Ambroisin','1985-01-12',NULL,'86 Judy Plaza','Cincinnati','OH',1407),(717,'Kizzee','Josefowicz','1989-11-28',NULL,'8 5th Hill','Baltimore','MD',753),(718,'Selestina','Meins','1955-08-22',NULL,'06057 Bayside Terrace','Lexington','KY',988),(719,'Cleavland','Cloughton','1958-01-14',NULL,'831 Bellgrove Park','Norfolk','VA',513),(720,'Marti','Barensky','1963-07-03',NULL,'91 Golf Course Terrace','Sioux City','IA',1251),(721,'Leland','Labbez','1986-04-03',NULL,'636 Stone Corner Trail','Boise','ID',674),(722,'Doralynn','Shorbrook','1970-09-09',NULL,'88 Mitchell Parkway','Virginia Beach','VA',217),(723,'Josy','Duchart','1983-01-31',NULL,'593 Darwin Way','Milwaukee','WI',903),(724,'Carolyne','Pexton','1952-11-10',NULL,'08 Daystar Circle','Oxnard','CA',162),(725,'Adelind','Moffat','1986-06-10',NULL,'32000 Sullivan Center','Washington','DC',1335),(726,'Henriette','Ciepluch','1985-03-10',NULL,'2151 Haas Terrace','Indianapolis','IN',1556),(727,'Stan','Hourihan','1950-10-11',NULL,'641 Arrowood Circle','Shawnee Mission','KS',757),(728,'Gerek','Blasdale','1969-11-17',NULL,'961 Fremont Parkway','Dearborn','MI',1681),(729,'Ammamaria','Lesaunier','1951-02-23',NULL,'9533 East Trail','Fort Worth','TX',866),(730,'Gussi','Matityahu','1950-08-03',NULL,'2 Portage Terrace','San Francisco','CA',454),(731,'Haslett','Feehily','1982-06-18',NULL,'68 Sugar Center','Rockford','IL',1065),(732,'Nolie','Wilkowski','1953-08-28',NULL,'21 Morningstar Way','Pompano Beach','FL',974),(733,'Paddy','Sergant','1970-07-16',NULL,'1678 Dryden Trail','Akron','OH',422),(734,'Clementia','Barrowcliffe','1958-09-10',NULL,'694 Eagan Way','Fairbanks','AK',263),(735,'Helene','Devonport','1965-06-29',NULL,'48739 Buhler Pass','Torrance','CA',911),(736,'Efren','De Ortega','1972-10-04',NULL,'75300 Cordelia Terrace','Humble','TX',1249),(737,'Suellen','Juris','1965-09-05',NULL,'647 Mayer Pass','Reston','VA',1441),(738,'Leanor','Hazel','1952-11-26',NULL,'551 Dennis Place','Greensboro','NC',45),(739,'Nicolai','Sprague','1986-08-15',NULL,'8920 Westridge Terrace','Cincinnati','OH',1045),(740,'Mira','Habershon','1962-10-05',NULL,'1674 Clarendon Pass','Abilene','TX',1309),(741,'Tymon','Speek','1963-07-30',NULL,'74 Ridgeview Terrace','Fort Lauderdale','FL',1103),(742,'Clarabelle','Yirrell','1956-03-06',NULL,'3 Hermina Junction','Atlanta','GA',48),(743,'Evelina','Waterstone','1972-02-12',NULL,'45 Garrison Road','Sacramento','CA',1554),(744,'Terrye','Howler','1984-10-30',NULL,'35 Dayton Pass','Des Moines','IA',1406),(745,'Viviyan','Pallatina','1967-10-08',NULL,'585 Maryland Circle','Cincinnati','OH',1710),(746,'Tuckie','Cummins','1965-02-22',NULL,'97841 Ryan Crossing','Erie','PA',285),(747,'Waneta','Winnett','1959-06-24',NULL,'0878 Loftsgordon Court','Cleveland','OH',1853),(748,'Lauri','Kettles','1979-09-25',NULL,'89723 Main Park','Utica','NY',1052),(749,'Frances','Jordi','1966-06-15',NULL,'55920 West Crossing','Palatine','IL',1831),(750,'Elizabet','Donavan','1978-09-17',NULL,'37650 Little Fleur Trail','Boulder','CO',198),(751,'Cinnamon','Finnick','1962-10-15',NULL,'20 Carpenter Drive','Los Angeles','CA',310),(752,'Lauralee','Burnie','1967-03-30',NULL,'0 Hayes Drive','Canton','OH',178),(753,'Cleveland','Banbrook','1978-07-19',NULL,'56692 Lotheville Plaza','Lexington','KY',1747),(754,'Martino','MacMearty','1980-03-27',NULL,'416 Schlimgen Hill','Melbourne','FL',83),(755,'Raul','Straniero','1961-06-15',NULL,'9 Rowland Place','Colorado Springs','CO',577),(756,'Harris','Shills','1974-06-06',NULL,'9427 Messerschmidt Drive','Berkeley','CA',1332),(757,'Sterling','Andreix','1973-03-02',NULL,'849 Fisk Hill','Detroit','MI',597),(758,'Humphrey','Bjerkan','1981-10-11',NULL,'7244 Shopko Alley','Kansas City','KS',457),(759,'Cory','Eagan','1966-09-22',NULL,'536 Cody Drive','Riverside','CA',1886),(760,'Murry','Penwright','1981-07-16',NULL,'598 Moulton Pass','Minneapolis','MN',1256),(761,'Paten','Mourge','1968-04-25',NULL,'423 Fairfield Crossing','Orlando','FL',225),(762,'Carolynn','Mapother','1970-06-23',NULL,'2 South Drive','Washington','DC',522),(763,'Michail','Joyce','1988-04-23',NULL,'4 Union Avenue','Roanoke','VA',1720),(764,'Honor','Skrzynski','1974-07-21',NULL,'745 Spaight Terrace','Kansas City','MO',142),(765,'Germaine','Donn','1970-07-08',NULL,'7013 Oriole Drive','Atlanta','GA',134),(766,'Jephthah','Cant','1972-04-27',NULL,'6 Parkside Junction','Boston','MA',20),(767,'Eleni','Benediktovich','1980-01-10',NULL,'94533 Service Terrace','Kansas City','MO',96),(768,'Grissel','Goldin','1960-10-02',NULL,'2 Haas Terrace','Roanoke','VA',1543),(769,'Anthony','McVittie','1988-01-13',NULL,'10077 Lillian Center','New York City','NY',640),(770,'Cordell','Glenwright','1989-04-18',NULL,'33 Ilene Hill','Green Bay','WI',1569),(771,'L;urette','Curneen','1972-02-01',NULL,'54 Packers Road','Phoenix','AZ',1972),(772,'Dyann','Jindracek','1975-07-03',NULL,'95 Arkansas Plaza','Baton Rouge','LA',1241),(773,'Cariotta','Kolak','1962-05-23',NULL,'132 Novick Pass','New York City','NY',1062),(774,'Virgina','Wattingham','1969-04-04',NULL,'021 Sycamore Avenue','El Paso','TX',1167),(775,'Vergil','Jamme','1954-09-09',NULL,'015 Cody Center','Stamford','CT',1498),(776,'Titos','Baudinot','1970-12-27',NULL,'9 Armistice Parkway','York','PA',1107),(777,'Jaimie','Leigh','1970-11-03',NULL,'81593 Becker Hill','San Jose','CA',720),(778,'Donovan','Barenski','1978-05-03',NULL,'7 Butterfield Alley','Springfield','MA',930),(779,'Rupert','Haycroft','1973-02-12',NULL,'98905 Old Gate Place','Anchorage','AK',1830),(780,'Millisent','Verbrugge','1954-10-08',NULL,'866 Canary Trail','Chattanooga','TN',273),(781,'Anastasie','Wybourne','1964-03-04',NULL,'34077 Golf Course Pass','Daytona Beach','FL',1670),(782,'Cordi','Georgeau','1978-09-08',NULL,'6853 Warbler Place','Salt Lake City','UT',1086),(783,'Alfreda','Heakins','1970-04-13',NULL,'75 Bayside Pass','West Palm Beach','FL',657),(784,'Misha','Parcall','1986-11-17',NULL,'83 Warbler Center','Tallahassee','FL',677),(785,'Ulberto','Branston','1984-04-09',NULL,'8 Toban Pass','Charlotte','NC',1340),(786,'Drucill','Poolton','1986-04-08',NULL,'60 Porter Junction','Huntsville','AL',1246),(787,'Jo-ann','Boanas','1985-09-25',NULL,'557 Dawn Lane','New Orleans','LA',379),(788,'Palmer','Birkmyr','1985-04-23',NULL,'61969 Drewry Street','West Palm Beach','FL',1781),(789,'Ernie','Thurborn','1979-04-10',NULL,'72 Pond Point','Chicago','IL',839),(790,'Valida','Willavoys','1958-12-23',NULL,'91 Larry Drive','Stockton','CA',863),(791,'Phillida','Macguire','1981-08-17',NULL,'007 Dorton Center','Baltimore','MD',1845),(792,'Ole','Blant','1958-06-13',NULL,'6 Lyons Trail','Baltimore','MD',1746),(793,'Pier','Ayliff','1957-04-25',NULL,'06 Melody Alley','Boca Raton','FL',839),(794,'Staffard','Hayland','1956-07-01',NULL,'6 Amoth Way','Phoenix','AZ',1788),(795,'Susanna','Measor','1966-03-05',NULL,'06892 Ohio Junction','Akron','OH',1205),(796,'Alistair','McCorkell','1989-06-25',NULL,'1480 Carey Lane','Harrisburg','PA',1043),(797,'Gloriane','Clery','1953-12-03',NULL,'2958 Superior Place','Jacksonville','FL',1844),(798,'Jennica','Gilford','1967-10-30',NULL,'50406 Northfield Junction','Richmond','VA',1095),(799,'Jada','Bothams','1969-02-19',NULL,'34987 Nova Road','Cambridge','MA',1692),(800,'Blanch','Gatheridge','1977-02-28',NULL,'4 Karstens Center','Dallas','TX',403),(801,'Dame','Kocher','1979-02-09',NULL,'16780 Sage Trail','Atlanta','GA',566),(802,'Rancell','O\'Hdirscoll','1962-12-18',NULL,'52 Messerschmidt Trail','Cedar Rapids','IA',1872),(803,'Jaime','Beers','1966-10-21',NULL,'66 Mcbride Pass','Atlanta','GA',1808),(804,'Abagael','Brigginshaw','1977-04-19',NULL,'707 Lighthouse Bay Pass','Naples','FL',1162),(805,'Muire','O\'Brogan','1984-08-14',NULL,'7 Eagle Crest Avenue','Hayward','CA',1047),(806,'Loren','Alwen','1955-06-12',NULL,'48138 Susan Road','Springfield','MA',876),(807,'Kingsley','Ducarne','1982-07-22',NULL,'37023 Leroy Way','Metairie','LA',1130),(808,'Glynnis','Marrill','1963-10-09',NULL,'74295 Lake View Plaza','Clearwater','FL',481),(809,'Will','Elsie','1983-11-19',NULL,'7927 Jay Point','Columbia','SC',1792),(810,'Laurianne','Whittall','1967-08-24',NULL,'00825 Esch Avenue','Hampton','VA',921),(811,'Judye','MacKeague','1980-05-23',NULL,'7 Lakeland Drive','Billings','MT',1028),(812,'Christabella','Coffee','1983-06-15',NULL,'1640 Jenifer Street','Oakland','CA',957),(813,'Carolann','Gleaves','1962-10-12',NULL,'2 Eagan Road','Albuquerque','NM',1386),(814,'Shep','Brinkworth','1976-06-15',NULL,'96064 Arapahoe Center','Chattanooga','TN',830),(815,'Maddy','Wastling','1970-08-07',NULL,'90889 Maywood Point','Tulsa','OK',6),(816,'Gerri','Dumbellow','1979-12-31',NULL,'27 Kensington Circle','Boston','MA',1483),(817,'Staci','Beves','1971-06-01',NULL,'0 Annamark Junction','Detroit','MI',1803),(818,'Paxton','Pesic','1973-12-05',NULL,'4 Arrowood Trail','Boston','MA',1866),(819,'Buiron','Pellett','1952-01-10',NULL,'1557 Main Way','Seattle','WA',175),(820,'Modesty','Timmis','1977-11-03',NULL,'7 Haas Point','San Jose','CA',2),(821,'Jay','Hemms','1983-12-06',NULL,'9 Maywood Hill','Provo','UT',1920),(822,'Chevy','Aucutt','1987-08-29',NULL,'0840 Northridge Avenue','Harrisburg','PA',1405),(823,'Findlay','McCardle','1952-05-10',NULL,'4079 Cascade Point','Cincinnati','OH',817),(824,'Siward','Tern','1974-06-07',NULL,'693 Memorial Place','Boston','MA',1838),(825,'Alina','Malbon','1973-09-09',NULL,'99 Quincy Way','Pueblo','CO',1199),(826,'Vasili','Goodbourn','1951-04-21',NULL,'37 Armistice Court','Beaumont','TX',1576),(827,'Denney','Eads','1970-05-27',NULL,'86581 Lien Way','Houston','TX',1779),(828,'Cherye','Davley','1971-04-27',NULL,'334 Merchant Junction','Springfield','IL',1451),(829,'Margette','Ridolfo','1973-05-08',NULL,'2304 Drewry Alley','El Paso','TX',1774),(830,'Briano','Dutt','1971-07-06',NULL,'31971 Hermina Plaza','New York City','NY',1003),(831,'Jamie','Silveston','1955-09-20',NULL,'0275 Shopko Trail','El Paso','TX',351),(832,'Tiff','Runnalls','1973-05-18',NULL,'611 Maryland Hill','Seattle','WA',1793),(833,'Josiah','Duguid','1964-06-18',NULL,'12 Larry Avenue','Chicago','IL',1805),(834,'Tallulah','Thoms','1961-06-02',NULL,'0 Sheridan Way','Provo','UT',1506),(835,'Mahmoud','Hovey','1982-06-04',NULL,'6 Toban Park','Jacksonville','FL',1579),(836,'Colby','Alsopp','1984-09-22',NULL,'6 Stone Corner Alley','San Jose','CA',1529),(837,'Philippine','Warnock','1980-01-26',NULL,'20 Ridgeway Lane','El Paso','TX',198),(838,'Austina','Vsanelli','1969-10-01',NULL,'53 Walton Point','Indianapolis','IN',481),(839,'Riobard','Kordovani','1968-09-26',NULL,'85 Boyd Terrace','Santa Monica','CA',412),(840,'Liliane','Rubinsztein','1964-04-30',NULL,'40001 Blue Bill Park Trail','Atlanta','GA',754),(841,'Guss','Prestage','1978-03-10',NULL,'36358 Hoepker Trail','Alexandria','VA',1436),(842,'Eldridge','Theze','1952-12-16',NULL,'3752 Maple Wood Parkway','New Orleans','LA',551),(843,'Hedwiga','Heiss','1962-03-16',NULL,'0480 Melody Junction','Shawnee Mission','KS',510),(844,'Mariana','Parlor','1973-03-21',NULL,'5488 Mandrake Point','Kansas City','MO',699),(845,'Cyrill','Wingeatt','1974-01-27',NULL,'8 Magdeline Way','Minneapolis','MN',1875),(846,'Kristina','Lowes','1958-12-29',NULL,'50 Grayhawk Park','Clearwater','FL',888),(847,'Howard','Allenson','1977-03-31',NULL,'03087 Hayes Terrace','Allentown','PA',667),(848,'Stevy','Yarnton','1977-07-02',NULL,'54171 Hollow Ridge Alley','Van Nuys','CA',4),(849,'Briano','Scarre','1979-05-11',NULL,'4 8th Court','Greeley','CO',153),(850,'Chantalle','McIlmorie','1970-06-22',NULL,'53 Messerschmidt Plaza','Philadelphia','PA',352),(851,'Carmine','Wardlow','1983-05-01',NULL,'6 Sundown Way','Seattle','WA',1418),(852,'Germaine','Berkley','1950-12-27',NULL,'1 Lukken Center','Chicago','IL',494),(853,'Miran','McAllen','1970-01-11',NULL,'24 Ilene Hill','Jackson','MS',968),(854,'Tonnie','Wilde','1964-11-06',NULL,'6459 Dovetail Drive','Naples','FL',100),(855,'Charity','Wakes','1962-09-05',NULL,'8245 Pleasure Circle','New York City','NY',1128),(856,'Etta','Calderhead','1967-12-19',NULL,'4880 Northwestern Place','Gainesville','FL',1138),(857,'Briny','Lambe','1971-07-09',NULL,'695 Fieldstone Road','Fort Worth','TX',822),(858,'Hilary','Straun','1952-05-19',NULL,'0 Sunfield Point','New York City','NY',1284),(859,'Fernando','Colam','1950-04-30',NULL,'1 Stoughton Road','Portsmouth','NH',1448),(860,'Kimberli','Jurkiewicz','1962-04-18',NULL,'4 Golf Plaza','Bakersfield','CA',1936),(861,'Drucill','Yvens','1980-03-17',NULL,'83 Ilene Lane','Stamford','CT',1739),(862,'Danila','Rosenblatt','1964-06-15',NULL,'95847 Butternut Park','Chico','CA',245),(863,'Meridel','Shepland','1989-10-02',NULL,'850 Cherokee Drive','Boynton Beach','FL',1190),(864,'Lorelei','Posse','1969-05-21',NULL,'927 Randy Terrace','Fresno','CA',41),(865,'Orsa','Larmuth','1957-09-13',NULL,'422 Eastlawn Court','Dallas','TX',1787),(866,'Boycie','Aiken','1951-03-14',NULL,'222 Marquette Center','Saint Petersburg','FL',1300),(867,'Auberta','Drummer','1977-06-30',NULL,'4 Lotheville Park','Largo','FL',1806),(868,'Bronny','Vanichev','1983-11-22',NULL,'2 Valley Edge Drive','Orlando','FL',342),(869,'Cordy','Rahl','1957-01-19',NULL,'27 Lerdahl Junction','Springfield','IL',262),(870,'Selene','Breacher','1963-08-09',NULL,'17 Helena Pass','Little Rock','AR',97),(871,'Opalina','Issacov','1962-04-04',NULL,'12 Welch Circle','Columbus','OH',1306),(872,'Kalinda','Huntly','1972-04-08',NULL,'83 Birchwood Terrace','Los Angeles','CA',511),(873,'Arv','Buckler','1965-04-30',NULL,'3 Miller Trail','Great Neck','NY',146),(874,'Tomaso','Comport','1960-06-30',NULL,'0 Colorado Drive','Baton Rouge','LA',208),(875,'Dalenna','Speirs','1952-06-16',NULL,'0 Clarendon Terrace','Irving','TX',1827),(876,'Roda','Mabe','1985-09-18',NULL,'94482 Basil Center','Charlotte','NC',1337),(877,'Caralie','Lamshead','1961-02-24',NULL,'5025 South Junction','Lancaster','PA',702),(878,'Tedie','Cabrer','1964-04-10',NULL,'65 Macpherson Point','El Paso','TX',1699),(879,'Kaia','Erratt','1979-01-13',NULL,'95 Milwaukee Road','North Hollywood','CA',1079),(880,'Lemar','Hiscoke','1961-01-08',NULL,'99 Center Parkway','Mountain View','CA',1922),(881,'Carce','Butterley','1969-01-12',NULL,'1 1st Center','Pittsburgh','PA',437),(882,'Jordan','Wallwood','1987-02-27',NULL,'6 Dapin Crossing','Ogden','UT',1849),(883,'Fonzie','Cornbell','1961-07-08',NULL,'484 Columbus Court','Charlotte','NC',1173),(884,'Nikkie','Antognetti','1955-03-25',NULL,'56 Vera Crossing','San Francisco','CA',964),(885,'Donella','Quye','1967-10-08',NULL,'51651 Texas Way','New Haven','CT',888),(886,'Frannie','Boas','1985-09-22',NULL,'3 Dottie Street','Nashville','TN',1967),(887,'Francklin','Mill','1982-09-24',NULL,'2181 Hoard Park','Hicksville','NY',1077),(888,'Analise','Jugging','1960-07-11',NULL,'93002 Nancy Way','Vancouver','WA',851),(889,'Murray','Reiach','1969-03-12',NULL,'8 Swallow Alley','Atlanta','GA',108),(890,'Derrek','Daymont','1958-10-07',NULL,'02 Birchwood Way','Philadelphia','PA',999),(891,'Bartholemy','Haste','1965-08-18',NULL,'34062 Bunting Terrace','New York City','NY',1052),(892,'Leonidas','Olenikov','1973-11-15',NULL,'7 Mallory Pass','Rochester','NY',1752),(893,'Tybie','Hansed','1965-09-23',NULL,'03 Westridge Lane','Saint Louis','MO',1186),(894,'Alistair','Coslett','1959-11-18',NULL,'227 Larry Terrace','North Port','FL',480),(895,'Rafferty','Giroldi','1958-05-01',NULL,'0 Helena Court','Charlotte','NC',1667),(896,'Charles','Gaither','1964-07-20',NULL,'1915 Hauk Point','Hartford','CT',839),(897,'Lou','Pariso','1969-11-19',NULL,'4901 Maple Wood Way','Tucson','AZ',219),(898,'Judah','Durnin','1983-04-02',NULL,'12 Derek Circle','Austin','TX',365),(899,'Maude','Wettern','1950-07-01',NULL,'88 Hoffman Parkway','Iowa City','IA',234),(900,'Cos','Bibey','1963-02-21',NULL,'76098 Waubesa Circle','Scottsdale','AZ',1671),(901,'Binni','Courtes','1977-02-25',NULL,'8 Hayes Road','Chula Vista','CA',238),(902,'Ermentrude','Imeson','1959-07-17',NULL,'25166 Mcguire Crossing','Memphis','TN',1370),(903,'Dallon','Francke','1960-10-22',NULL,'08 Briar Crest Court','Oklahoma City','OK',1361),(904,'Rey','Badger','1973-12-24',NULL,'43 Bellgrove Center','San Francisco','CA',393),(905,'Mathilde','Combes','1951-09-03',NULL,'9 American Ash Avenue','Palm Bay','FL',1467),(906,'Brianna','Twitchett','1989-05-06',NULL,'424 Ramsey Way','Des Moines','IA',1364),(907,'Jeremy','Pfeffel','1959-12-20',NULL,'83343 Brentwood Lane','Corpus Christi','TX',147),(908,'Mariska','Scotts','1989-09-05',NULL,'4 Schiller Hill','Cleveland','OH',1130),(909,'Tedie','Sillars','1982-08-24',NULL,'037 Spaight Way','New York City','NY',834),(910,'Giraldo','O\'Lagene','1966-01-28',NULL,'7929 Rutledge Court','Lexington','KY',298),(911,'Lodovico','Berthome','1961-10-06',NULL,'5263 Briar Crest Pass','Albuquerque','NM',1163),(912,'Delphinia','Burberye','1979-05-20',NULL,'26108 Mitchell Trail','Atlanta','GA',54),(913,'Catharina','Grunnell','1961-12-01',NULL,'3923 Talisman Trail','Shreveport','LA',1245),(914,'Raven','Benam','1989-03-16',NULL,'7883 Blaine Crossing','Boynton Beach','FL',1192),(915,'Babbie','Salvin','1983-11-26',NULL,'694 Fallview Drive','Fayetteville','NC',110),(916,'Vinni','Arrighi','1950-12-28',NULL,'903 Prairieview Pass','South Lake Tahoe','CA',1142),(917,'Lauree','Bolter','1988-02-22',NULL,'0072 Bartelt Point','Trenton','NJ',108),(918,'Fayina','Moylane','1969-10-27',NULL,'31004 Pierstorff Street','Olympia','WA',1913),(919,'Modestine','Rudgley','1970-05-18',NULL,'60 Anthes Avenue','Memphis','TN',1331),(920,'Demetra','Hubbucke','1964-09-09',NULL,'8152 Spenser Avenue','Fairbanks','AK',1592),(921,'Odessa','Josowitz','1978-10-26',NULL,'24 Mcbride Road','Kansas City','KS',1016),(922,'Lorenzo','Attow','1952-11-26',NULL,'8 Autumn Leaf Road','Denver','CO',975),(923,'Goldi','Jubb','1964-12-19',NULL,'64 Lyons Avenue','Clearwater','FL',959),(924,'Eveline','Lemmon','1966-09-05',NULL,'15944 Talmadge Avenue','Arlington','TX',586),(925,'Irene','Yakushkev','1970-07-28',NULL,'60476 Sachtjen Court','Chattanooga','TN',1515),(926,'Jerald','Kunes','1965-01-22',NULL,'65 Blaine Way','Las Vegas','NV',1090),(927,'Sherwynd','Farress','1973-07-28',NULL,'63 Gateway Pass','Stockton','CA',1815),(928,'Lotta','Bilbrey','1970-09-26',NULL,'3 Loeprich Terrace','Montpelier','VT',754),(929,'Kris','Garvan','1961-04-07',NULL,'02463 Loomis Center','Bronx','NY',45),(930,'Kally','Liddiard','1985-04-18',NULL,'4 Pepper Wood Avenue','Duluth','MN',881),(931,'Carree','Clohessy','1955-05-12',NULL,'41701 Homewood Hill','Iowa City','IA',1094),(932,'Pate','Rasper','1958-02-08',NULL,'40294 Mosinee Street','Oklahoma City','OK',584),(933,'Pippy','Birtwisle','1953-05-19',NULL,'6751 Burning Wood Parkway','Cincinnati','OH',1629),(934,'Stepha','Greve','1972-10-22',NULL,'75335 Arkansas Avenue','Worcester','MA',1232),(935,'Barn','Wallbanks','1961-08-19',NULL,'439 Park Meadow Hill','New York City','NY',272),(936,'Aleksandr','Spreckley','1962-07-26',NULL,'6 Granby Circle','El Paso','TX',418),(937,'Selina','Albany','1956-05-28',NULL,'5 Main Avenue','Jeffersonville','IN',1263),(938,'Krispin','Phillpotts','1974-04-08',NULL,'05557 Brown Trail','Stockton','CA',1908),(939,'Corbett','Darbyshire','1987-12-08',NULL,'22 Loftsgordon Point','Austin','TX',11),(940,'Dalston','Gidden','1957-11-03',NULL,'446 Hansons Avenue','Young America','MN',172),(941,'Annadiane','Glanister','1963-06-20',NULL,'3030 Fuller Park','Greensboro','NC',1852),(942,'Ginevra','Clee','1988-06-25',NULL,'9867 Donald Drive','Bronx','NY',324),(943,'Roberto','Machan','1975-11-10',NULL,'026 Sutherland Pass','Fresno','CA',120),(944,'Didi','Aldhous','1955-12-08',NULL,'533 Washington Point','New York City','NY',152),(945,'Araldo','Hagard','1959-10-21',NULL,'3974 Scoville Plaza','Sacramento','CA',146),(946,'Catlee','Denison','1969-11-07',NULL,'77896 Katie Point','Valdosta','GA',682),(947,'Ade','Caughte','1981-08-29',NULL,'14 Heath Park','Washington','DC',1644),(948,'Cary','Klasen','1969-10-17',NULL,'5 Sachs Hill','Houston','TX',577),(949,'Nathanial','Utley','1987-08-10',NULL,'656 Fairfield Circle','Grand Rapids','MI',1763),(950,'Elyssa','Grinsted','1951-04-16',NULL,'5013 Prairieview Terrace','Colorado Springs','CO',522),(951,'Gill','Poulney','1973-10-03',NULL,'256 Oakridge Road','Woburn','MA',183),(952,'Zebulen','Mueller','1961-10-23',NULL,'174 Bunting Alley','San Antonio','TX',113),(953,'Urbanus','Cheer','1950-11-12',NULL,'117 Emmet Junction','Virginia Beach','VA',1434),(954,'Joane','Zanotti','1965-04-21',NULL,'5343 Sachtjen Circle','Sacramento','CA',1867),(955,'Taylor','Darkott','1973-07-01',NULL,'54 Thierer Trail','Evansville','IN',1710),(956,'Kristofor','Sumpton','1961-04-13',NULL,'351 Manufacturers Point','San Diego','CA',1401),(957,'Paulette','de Pinna','1964-03-06',NULL,'3634 Comanche Circle','Prescott','AZ',288),(958,'Jerrold','Honywill','1961-06-26',NULL,'32 Pine View Parkway','San Jose','CA',644),(959,'Gertruda','Fawdry','1979-10-09',NULL,'17800 Ridgeview Avenue','Norcross','GA',1759),(960,'Duane','Coopper','1952-06-09',NULL,'361 Michigan Place','Saint Louis','MO',1882),(961,'Alberik','Guisot','1960-09-07',NULL,'49 Carberry Drive','Houston','TX',119),(962,'Sheilah','De la Barre','1988-07-20',NULL,'9273 Sachtjen Street','Chicago','IL',1893),(963,'Briney','Klimuk','1971-04-05',NULL,'8951 Hudson Lane','Fort Wayne','IN',1107),(964,'Shannon','Monk','1977-12-07',NULL,'6046 Calypso Point','Houston','TX',284),(965,'Chevalier','Casali','1953-03-31',NULL,'9 Marquette Lane','Colorado Springs','CO',1389),(966,'Margaretta','Offner','1956-11-30',NULL,'94721 Lake View Street','Lansing','MI',71),(967,'Claudio','Mochan','1968-10-19',NULL,'127 Anthes Street','Akron','OH',903),(968,'Sergeant','Barby','1963-11-13',NULL,'5 Oneill Way','Lawrenceville','GA',264),(969,'Estella','Bamfield','1981-05-03',NULL,'466 Fuller Plaza','Glendale','AZ',1338),(970,'Clea','Orrett','1965-12-07',NULL,'5533 Cardinal Hill','Pittsburgh','PA',1423),(971,'Elijah','Alvarado','1986-10-02',NULL,'98 Melrose Place','Montgomery','AL',804),(972,'Archibaldo','Fosdick','1987-02-17',NULL,'845 Aberg Circle','Spokane','WA',1742),(973,'Cristy','Yole','1969-05-09',NULL,'3117 Gulseth Pass','Des Moines','IA',1100),(974,'Hailee','Cashley','1963-04-08',NULL,'7 Pawling Way','Atlanta','GA',743),(975,'Clovis','Eleshenar','1981-11-26',NULL,'2 Monterey Street','Port Saint Lucie','FL',1570),(976,'Berkley','Lampens','1950-05-29',NULL,'68813 Kennedy Street','Albany','NY',1460),(977,'Annmaria','O\'Sharry','1970-06-11',NULL,'5785 Kropf Way','Honolulu','HI',971),(978,'Leah','Jowitt','1963-10-18',NULL,'1480 Park Meadow Road','Phoenix','AZ',1873),(979,'Shannen','Troughton','1958-11-03',NULL,'8 Aberg Alley','Detroit','MI',299),(980,'Florina','Asman','1953-04-14',NULL,'78088 Marquette Plaza','Bonita Springs','FL',1677),(981,'Hermie','Bazeley','1979-04-12',NULL,'46 Kenwood Plaza','Portland','OR',1025),(982,'Sammy','Epinoy','1985-09-19',NULL,'772 Namekagon Hill','North Hollywood','CA',1123),(983,'Rabbi','Scally','1986-08-12',NULL,'0765 North Avenue','Glendale','AZ',1009),(984,'Gwennie','Guilaem','1963-02-20',NULL,'263 Lakeland Avenue','Punta Gorda','FL',238),(985,'Eleanor','Anthiftle','1951-03-08',NULL,'7 5th Terrace','South Bend','IN',1358),(986,'Chris','Cuthbertson','1974-02-02',NULL,'74648 Golf Course Alley','Carol Stream','IL',1005),(987,'Chad','Tuplin','1973-10-11',NULL,'3 Division Circle','Sarasota','FL',677),(988,'Vera','Heintze','1988-07-18',NULL,'16 Welch Junction','Albany','GA',1165),(989,'Umberto','Mayte','1970-06-10',NULL,'437 Ramsey Trail','Loretto','MN',1649),(990,'Ursula','Weyman','1956-11-22',NULL,'764 Elgar Park','South Bend','IN',1967),(991,'Jordan','Nowaczyk','1961-11-02',NULL,'70007 Hoffman Street','Palatine','IL',830),(992,'Fulvia','Cullum','1968-10-16',NULL,'33 Monument Place','Oklahoma City','OK',1358),(993,'Clemence','Erdis','1960-12-19',NULL,'94733 Bay Pass','Portsmouth','VA',912),(994,'Emmie','Sheppard','1966-02-24',NULL,'7 Rieder Junction','Macon','GA',1162),(995,'Alicea','Kruszelnicki','1955-06-01',NULL,'49836 Park Meadow Place','Sacramento','CA',348),(996,'Lief','Fontes','1951-09-02',NULL,'3 Norway Maple Plaza','Mountain View','CA',1486),(997,'Jessey','Braxay','1957-07-15',NULL,'8 Chinook Hill','Palatine','IL',550),(998,'Janna','Cavet','1952-12-11',NULL,'74884 Norway Maple Pass','Cleveland','OH',1666),(999,'Hardy','Wedgwood','1958-01-17',NULL,'4981 Grayhawk Lane','Washington','DC',1419),(1000,'Salomone','Conerding','1953-04-20',NULL,'36522 Hoffman Trail','Clearwater','FL',100),(1001,'Donia','Mobberley','1957-11-07',NULL,'615 Lakewood Pass','Worcester','MA',1901),(1002,'Georges','Kaszper','1963-01-22',NULL,'80318 Kenwood Park','Detroit','MI',859),(1003,'Pavla','Boumphrey','1965-09-07',NULL,'24738 Darwin Place','Tuscaloosa','AL',1735),(1004,'Cullin','Kleimt','1968-09-27',NULL,'40 Bartillon Circle','Wichita','KS',81),(1005,'Ezra','Drayn','1977-04-06',NULL,'76173 Kingsford Place','Whittier','CA',1358),(1006,'Livvy','Almack','1981-06-12',NULL,'98934 Lake View Parkway','Pomona','CA',687),(1007,'Mycah','Hearse','1979-07-19',NULL,'5795 Basil Circle','Naperville','IL',490),(1008,'Towny','Dooly','1985-10-01',NULL,'58064 Bonner Pass','San Antonio','TX',790),(1009,'Jacky','Dimblebee','1974-10-31',NULL,'9099 Meadow Ridge Park','Fort Worth','TX',1132),(1010,'Orville','Barnfield','1984-01-05',NULL,'73338 Blue Bill Park Crossing','Lansing','MI',1425);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item_notes`
--

DROP TABLE IF EXISTS `order_item_notes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item_notes` (
  `note_id` int(11) NOT NULL,
  `order_Id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `note` varchar(255) NOT NULL,
  PRIMARY KEY (`note_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item_notes`
--

LOCK TABLES `order_item_notes` WRITE;
/*!40000 ALTER TABLE `order_item_notes` DISABLE KEYS */;
INSERT INTO `order_item_notes` VALUES (1,1,2,'first note'),(2,1,2,'second note');
/*!40000 ALTER TABLE `order_item_notes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `unit_price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`order_id`,`product_id`),
  KEY `fk_order_items_products_idx` (`product_id`),
  CONSTRAINT `fk_order_items_orders` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_order_items_products` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,2,4,3.74),(2,1,2,9.10),(2,4,4,1.66),(2,6,2,2.94),(3,3,10,9.12),(4,3,7,6.99),(4,10,7,6.40),(5,2,3,9.89),(6,1,4,8.65),(6,2,4,3.28),(6,3,4,7.46),(6,5,1,3.45),(7,3,7,9.17),(8,5,2,6.94),(8,8,2,8.59),(9,6,5,7.28),(10,1,10,6.01),(10,9,9,4.28),(11,1,2,2.50),(12,1,2,2.50),(13,2,3,1.10),(13,3,1,2.10);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_statuses`
--

DROP TABLE IF EXISTS `order_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_statuses` (
  `order_status_id` tinyint(4) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`order_status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_statuses`
--

LOCK TABLES `order_statuses` WRITE;
/*!40000 ALTER TABLE `order_statuses` DISABLE KEYS */;
INSERT INTO `order_statuses` VALUES (1,'Processed'),(2,'Shipped'),(3,'Delivered');
/*!40000 ALTER TABLE `order_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL AUTO_INCREMENT,
  `customer_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `comments` varchar(2000) DEFAULT NULL,
  `shipped_date` date DEFAULT NULL,
  `shipper_id` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `fk_orders_customers_idx` (`customer_id`),
  KEY `fk_orders_shippers_idx` (`shipper_id`),
  KEY `fk_orders_order_statuses_idx` (`status`),
  CONSTRAINT `fk_orders_customers` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_order_statuses` FOREIGN KEY (`status`) REFERENCES `order_statuses` (`order_status_id`) ON UPDATE CASCADE,
  CONSTRAINT `fk_orders_shippers` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`shipper_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,6,'2020-01-30',1,NULL,NULL,NULL),(2,7,'2020-02-02',2,NULL,'2018-08-03',4),(3,8,'2019-12-01',1,NULL,NULL,NULL),(4,2,'2017-01-22',1,NULL,NULL,NULL),(5,5,'2017-08-25',2,'','2017-08-26',3),(6,10,'2018-11-18',1,'Aliquam erat volutpat. In congue.',NULL,NULL),(7,2,'2018-09-22',2,NULL,'2018-09-23',4),(8,5,'2018-06-08',1,'Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis.',NULL,NULL),(9,10,'2017-07-05',2,'Nulla mollis molestie lorem. Quisque ut erat.','2017-07-06',1),(10,6,'2021-04-22',2,NULL,'2018-04-23',2),(11,1,'2020-01-01',1,NULL,NULL,NULL),(12,1,'2020-01-01',1,NULL,NULL,NULL),(13,5,'2019-01-01',2,NULL,NULL,NULL);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `unit_price` decimal(4,2) NOT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Foam Dinner Plate',70,1.21),(2,'Pork - Bacon,back Peameal',49,4.65),(3,'Lettuce - Romaine, Heart',38,3.35),(4,'Brocolinni - Gaylan, Chinese',90,4.53),(5,'Sauce - Ranch Dressing',94,1.63),(6,'Petit Baguette',14,2.39),(7,'Sweet Pea Sprouts',98,3.29),(8,'Island Oasis - Raspberry',26,0.74),(9,'Longan',67,2.26),(10,'Broom - Push',6,1.09);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shippers` (
  `shipper_id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`shipper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
INSERT INTO `shippers` VALUES (1,'Hettinger LLC'),(2,'Schinner-Predovic'),(3,'Satterfield LLC'),(4,'Mraz, Renner and Nolan'),(5,'Waters, Mayert and Prohaska');
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sql_store'
--

--
-- Dumping routines for database 'sql_store'
--
/*!50003 DROP FUNCTION IF EXISTS `CustomerLevel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `CustomerLevel`(
	points INT(11)
) RETURNS varchar(20) CHARSET utf8mb4
    DETERMINISTIC
BEGIN
    DECLARE customerLevel VARCHAR(20);

    IF points > 2000 THEN
		SET customerLevel = 'PLATINUM';
    ELSEIF (points <= 2000 AND 
			points >= 1000) THEN
        SET customerLevel = 'GOLD';
    ELSEIF points < 1000 THEN
        SET customerLevel = 'SILVER';
    END IF;
	-- return the customer level
	RETURN (customerLevel);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `get_customer_level` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `get_customer_level`()
begin
	select 
			*,
			CustomerLevel(c.points) AS level
 	from customers c;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-08-19 14:15:37
