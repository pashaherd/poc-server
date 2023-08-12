-- Setup --
-- -- with env vars --
DROP DATABASE IF EXISTS `poc-database`;
-- DROP USER IF EXISTS MYSQL_USER@'localhost';
CREATE DATABASE IF NOT EXISTS `poc-database`;
CREATE USER IF NOT EXISTS MYSQL_USER@'localhost' IDENTIFIED BY '{$MYSQL_PASSWORD}';
-- GRANT ALL ON poc-database.* TO MYSQL_USER@'localhost';
CREATE USER IF NOT EXISTS 'poc_payroll_admin'@'localhost' IDENTIFIED BY '{$MYSQL_PASSWORD}';
GRANT ALL ON `poc-database`.* TO 'poc_payroll_admin' @'localhost';
FLUSH PRIVILEGES;
SHOW GRANTS FOR 'poc_payroll_admin' @'localhost';
USE `poc-database`;
CREATE DATABASE IF NOT EXISTS `poc-database`;

;
USE `poc-database`;
-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: poc-database
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `paymentId` varchar(36) NOT NULL,
  `userId` varchar(36) NOT NULL,
  `requestDate` date NOT NULL,
  `status` varchar(30) NOT NULL,
  `hoursWorked` decimal(10,1) unsigned NOT NULL,
  `requiredHours` int DEFAULT NULL,
  `description` json DEFAULT NULL,
  `payrollDate` date NOT NULL,
  `baseCompensation` decimal(20,2) unsigned DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `totalPayment` decimal(20,2) unsigned DEFAULT NULL,
  `reviewDate` date DEFAULT NULL,
  `bonus` tinyint DEFAULT NULL,
  `savingsPlan` int unsigned DEFAULT NULL,
  `reviewedBy` varchar(36) DEFAULT NULL,
  `adminNotes` varchar(5000) DEFAULT NULL,
  PRIMARY KEY (`paymentId`),
  UNIQUE KEY `paymentId_UNIQUE` (`paymentId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `reviewedBy` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('023fbce4-8a29-4514-8d3e-8f3527639a6e','1','2022-11-24','paid',80.0,80,'{\"0\": {\"itemId\": \"dBlWq_dQ5n0huAVGIZzI0\", \"itemHours\": \"80\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Prepared for TechCrunch Disrupt SF\"}}','2022-10-15',3200.00,'USD',3200.00,'2022-11-28',1,NULL,'7777777777777','great job this period.'),('126da342-4a62-4da2-8a17-aaa15d45523d','1','2022-11-24','paid',85.0,85,'{\"0\": {\"itemId\": \"MhYg_eVmGW6nULSvZR1Pz\", \"itemHours\": \"45\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Advise customers and the Implementation Team on how to effectively use the product.\"}, \"1\": {\"itemId\": \"5xSuTl-kotMbYC0kC6FYT\", \"itemHours\": \"40\", \"itemProject\": \"Hooli\", \"itemDescription\": \"Provide feedback to the Product Team on what features or enhancements may improve the product.\"}}','2022-12-15',3400.00,'USD',3400.00,'2022-11-28',0,NULL,'7777777777777','great job this period.'),('16871bf1-034c-47d7-8570-56137d5ca503','1','2022-11-24','paid',84.0,84,'{\"0\": {\"itemId\": \"LokkLY9COLJRtPG4Y25hO\", \"itemHours\": \"5\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Reviewed code, mentored, and provided team feedback.\"}, \"1\": {\"itemId\": \"7rsxMApvRCiHS63gXjxDp\", \"itemHours\": \"10\", \"itemProject\": \"PiperNet\", \"itemDescription\": \"Collaborated with engineering team to identify and resolve pain points and establish best practices.\"}, \"2\": {\"itemId\": \"q-2xh9-DcC9gRMkwFd5c1\", \"itemHours\": \"35\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Engineer efficient, adaptable and scalable architecture for all stages of data lifecycle (ingest, streaming, structured and unstructured storage, search, aggregation) in support of a variety of data applications.\"}, \"3\": {\"itemId\": \"lo4fVwad9YyKgQJvAA7Jn\", \"itemHours\": \"34\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Built abstractions and tooling to allow other engineers to build streaming/batch self-service pipelines.\"}}','2021-01-31',3360.00,'CAD',3360.00,'2022-11-28',0,NULL,'7777777777777','no notes'),('1fbb4321-b84c-426c-92c9-345cd500e510','1','2022-11-24','paid',80.0,80,'{\"0\": {\"itemId\": \"3LMA3FpL4MfIjmGzTD8xW\", \"itemHours\": \"80\", \"itemProject\": \"Hooli\", \"itemDescription\": \"Supported and mentored intermediate and junior developers by sharing knowledge, collaborating and problem solving.\"}}','2021-07-15',3200.00,'CAD',3200.00,'2022-11-28',0,NULL,'7777777777777','Approved. No notes.'),('30926f46-b29f-45a9-ae6e-887d97e66e93','1','2022-11-24','paid',80.0,80,'{\"0\": {\"itemId\": \"OBHeZ8sxkWntGThGGkXDP\", \"itemHours\": \"30\", \"itemProject\": \"Aviato\", \"itemDescription\": \"Investigated slow performance and optimized queries\"}, \"1\": {\"itemId\": \"h0r9DMtdZ95qJCrT0YAXy\", \"itemHours\": \"30\", \"itemProject\": \"Aviato\", \"itemDescription\": \"Participated in Proof of Concept (POC) for new technologies \"}, \"2\": {\"itemId\": \"QWpQXMyk2myf2sZvVCvMz\", \"itemHours\": \"20\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Worked on Python API microservices\"}}','2021-03-15',3200.00,'MXN',3200.00,'2022-11-28',0,NULL,'7777777777777','Great job. Keep it up.'),('3a2410f0-de5c-4529-9d4e-0f898cac69b5','1','2022-11-24','paid',80.5,82,'{\"0\": {\"itemId\": \"uZTeR-frGEOOOYHScQXVj\", \"itemHours\": \"40\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Worked on beta\"}, \"1\": {\"itemId\": \"8zbbIuNEHn36Cjbam9u8w\", \"itemHours\": \"40.5\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Debugged errors within customers\' integrations.\"}}','2021-05-15',3220.00,'MXN',3220.00,'2022-11-28',0,NULL,'7777777777777','Great job. Client was very happy.'),('448d432d-4845-444c-a3e7-8386d6f7f676','1','2022-11-24','paid',88.0,88,'{\"0\": {\"itemId\": \"SQcZ-3e_YXvEnQpeVehXQ\", \"itemHours\": \"40\", \"itemProject\": \"PiperNet\", \"itemDescription\": \"Work on decentralization strategy\"}, \"1\": {\"itemId\": \"NVsHo_IShNPkqK3dg5UDU\", \"itemHours\": \"48\", \"itemProject\": \"PiperNet\", \"itemDescription\": \"Development\"}}','2021-01-31',3520.00,'CAD',3520.00,'2022-11-28',0,NULL,'7777777777777','Great job. Client was very happy.'),('5ad1485b-6a9d-46da-bb35-4c6b8f3c8096','1','2022-11-23','declined',70.0,80,'{\"0\": {\"itemId\": \"ae9qWA-SvxwHlnvxe9aMA\", \"itemHours\": \"8\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Meetings with investors\"}}','2022-08-10',3500.00,'USD',NULL,'2022-11-24',0,NULL,'0','More details are required for the work performed this pay period. Please include meeting details including company, date of meeting, attendees, etc.'),('6d84268e-46d2-4e85-87e3-ece7e8d7bb7c','1','2022-11-24','paid',80.0,80,'{\"0\": {\"itemId\": \"GWSS14nVQQ9awhESJsX7x\", \"itemHours\": \"40\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Ensured quality and completeness of the product through code review, unit testing and documentation\"}, \"1\": {\"itemId\": \"Ck69rHtqnXbZ4_sGMOSBu\", \"itemHours\": \"40\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Participated in project planning sessions with FO, BO, Ops, other teams, to analyze business requirements, any prevailing issues and carve out the progress path ahead\"}}','2023-11-30',3200.00,'USD',3200.00,'2022-11-28',0,NULL,'7777777777777','no notes.'),('76iExMC2FrnisV76lavxT','2c06e6ae-5a5c-4f09-b965-8e876efd8550','2022-12-07','paid',20.0,504,NULL,'2022-04-15',1000.00,'CDN',29.76,'2022-12-07',1,NULL,'7777777777777','Bonus payment for Q1.'),('8b717171-d040-488f-969d-7187cea68088','1','2022-11-24','paid',86.0,88,'{\"0\": {\"itemId\": \"3ekBWfsH4KA70rEArJQVR\", \"itemHours\": \"42\", \"itemProject\": \"Hooli\", \"itemDescription\": \"Performance and security considerations\"}, \"1\": {\"itemId\": \"7t0ksuHIRUrcVAi1CoXTn\", \"itemHours\": \"44\", \"itemProject\": \"Hooli\", \"itemDescription\": \"Production problem solving\"}}','2022-11-30',3440.00,'CAD',3440.00,'2022-11-28',0,NULL,'7777777777777','\"no notes. Keep up the great work.\"'),('8bd0595a-fe49-4656-b472-09bccbf6e4a9','1','2022-11-24','paid',80.0,80,'{\"0\": {\"itemId\": \"PC2R7rMwcNddlR6Yyp51e\", \"itemHours\": \"50\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Developed multi-year technology roadmaps that aligned with the company\'s vision, strategy, and business objectives.\"}, \"1\": {\"itemId\": \"SfWgIdoKLQbX5dfIRmQ5h\", \"itemHours\": \"30\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Ran review sessions with the wider team to ensure the project is on track to meet objectives. \"}}','2021-06-30',3200.00,'MXN',3200.00,'2022-11-28',0,NULL,'7777777777777','\"Great job! No notes.\"'),('a6478acd-9e46-4ef7-a9b4-cf70efbfa8c3','1','2022-11-21','paid',88.0,88,'{\"0\": {\"itemId\": \"wZdTGr1Qg0fMsT9IFCpsR\", \"itemHours\": \"5\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Fixed bugs in server routes\"}, \"1\": {\"itemId\": \"9Mr3HVxJGPB_ib8hx5WEW\", \"itemHours\": \"2\", \"itemProject\": \"Raviga Capital\", \"itemDescription\": \"Met with Laurie and Monica to discuss funding.\"}, \"2\": {\"itemId\": \"RevlbnlGeyTijqxfOhJ9Z\", \"itemHours\": \"1\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Weekly team meeting\"}, \"3\": {\"itemId\": \"7teAMCboCE01rPTj5_TI_\", \"itemHours\": \"1.5\", \"itemProject\": \"Hooli\", \"itemDescription\": \"Lunch meeting with Gavin to discuss contract\"}, \"4\": {\"itemId\": \"9EA79BqN8CWcem_P1w1qd\", \"itemHours\": \"3\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Strategization for app architecture\"}}','2022-11-30',3500.00,'USD',3500.00,NULL,0,NULL,NULL,NULL),('b53e11e3-f0a4-43b4-9b2b-cd7c94276da8','1','2022-11-24','paid',80.0,80,'{\"0\": {\"itemId\": \"inIgOqZFRkFhOPmJGqoMb\", \"itemHours\": \"80\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Analyzed and oversaw the team’s development efforts working towards successful code delivery\"}}','2021-07-31',3200.00,'MXN',3200.00,'2022-11-28',0,NULL,'7777777777777','\"No notes.\"'),('BbWYOOo3FZBpIw9pAUZGe','1','2022-12-03','paid',80.0,80,'{\"0\": {\"itemId\": \"cfM92L1PoOkcJZd5yAHu0\", \"itemHours\": \"80\", \"itemProject\": \"Hello\", \"itemDescription\": \"Hello\"}}','2022-02-15',3500.00,'USD',3500.00,NULL,0,NULL,NULL,NULL),('Ch3CKuUgCKlvU3P70s72v','5','2022-12-07','in progress',500.0,504,NULL,'2022-05-15',3200.00,'CDN',2380.95,'2022-12-07',1,NULL,'7777777777777','Bonus payment for Q1.'),('d35ec158-e8b9-4d10-a394-0e71fa4a0c25','1','2022-11-24','paid',78.0,80,'{\"0\": {\"itemId\": \"q5Devo5dRgK5ejDbHnwR2\", \"itemHours\": \"28\", \"itemProject\": \"Hooli\", \"itemDescription\": \"Participated in development of prototypes, minimum viable products and PoCs.\"}, \"1\": {\"itemId\": \"qvs_peZiEV5r6uMiiwyoV\", \"itemHours\": \"50\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Provided design documents and documentation to ensure efficient maintenance and code reuse.\"}}','2022-11-30',3120.00,'MXN',3120.00,'2022-11-28',0,NULL,'7777777777777','\"no notes.\"'),('d63f4366-dbe9-4d44-8fae-44c00ff71696','1','2022-11-24','paid',82.0,82,'{\"0\": {\"itemId\": \"leOSG3KBOJs0YoeZ8kTvV\", \"itemHours\": \"40\", \"itemProject\": \"Hooli\", \"itemDescription\": \"Contributed through participation in agile development of project timelines, implementation design specifications, system flow diagrams, documentation, testing, and ongoing support of systems\"}, \"1\": {\"itemId\": \"z_GUHxsw0jk0stz8uHF2g\", \"itemHours\": \"42\", \"itemProject\": \"PiperNet\", \"itemDescription\": \"Monitored production systems and debugged issues as they arosee\"}}','2023-11-15',3280.00,'MXN',3280.00,'2022-11-28',0,NULL,'7777777777777','\"Great job. Client was very happy.\"'),('e8985399-8bbe-4673-b066-1dcde738ad6f','1','2022-11-24','paid',80.0,80,'{\"0\": {\"itemId\": \"h6-kseA6M3ZNTZjrJUev0\", \"itemHours\": \"40\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"Debugged and fixed production issues\"}, \"1\": {\"itemId\": \"2QlH8FPoqdVLQ2gjLHPii\", \"itemHours\": \"40\", \"itemProject\": \"PiperNet\", \"itemDescription\": \"Assisted in code reviews for other developers (use TABS)\"}}','2021-03-31',3200.00,'MXN',3200.00,'2022-11-28',0,NULL,'7777777777777','\"Excellent work.\"'),('fKGhFu4PE50EFjZ0IOOWH','1','2022-12-06','in progress',80.0,88,'{\"0\": {\"itemId\": \"hBxHKar1LmyDnGd6Oc4RC\", \"itemHours\": \"40\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"This is a test payment request.\"}, \"1\": {\"itemId\": \"3nXVjeLcVsNFQE5IOo3wp\", \"itemHours\": \"40\", \"itemProject\": \"Pied Piper\", \"itemDescription\": \"This is a test payment request.\"}}','2022-12-31',NULL,'USD',3636.36,'2022-12-06',0,NULL,'7777777777777','Good job!'),('fqgKoOTWSHIkWe3JqFfEW','5','2022-12-06','paid',20.0,520,NULL,'2022-07-30',3200.00,'CDN',123.08,'2022-12-06',1,NULL,'7777777777777','Bonus payment for Q2.'),('Fye-_mNQN34OIUuLDhpdE','1','2022-12-03','paid',80.0,80,'{\"0\": {\"itemId\": \"dxT7j3R5iy7oEnVikXjhc\", \"itemHours\": \"80\", \"itemProject\": \"Hello\", \"itemDescription\": \"Hello\"}}','2022-04-19',3500.00,'USD',3500.00,NULL,0,NULL,NULL,NULL),('GOS1iCZDkd8gOZybq8bNb','1','2022-12-07','pending',70.0,NULL,'{\"0\": {\"itemId\": \"5uHaHFC9awwuFv0UYhwYG\", \"itemHours\": \"50\", \"itemProject\": \"Piece of Cake\", \"itemDescription\": \"This is a test payment request.\"}, \"1\": {\"itemId\": \"-k1AkHe8iGt7_IVTucJtW\", \"itemHours\": \"20\", \"itemProject\": \"Piece of Cake\", \"itemDescription\": \"Worked on marketing materials.\"}}','2023-01-15',NULL,'USD',NULL,NULL,0,NULL,NULL,NULL),('Gs3UcH-El6eOf5dS8N_Pi','1','2022-12-05','in progress',80.0,88,'{\"0\": {\"itemId\": \"1bGXE76vPfdbFx05FPRDf\", \"itemHours\": \"40\", \"itemProject\": \"Hello\", \"itemDescription\": \"Hello there this is a pending payment.\"}, \"1\": {\"itemId\": \"VLB4eHImdc2qDMpkIzDBQ\", \"itemHours\": \"40\", \"itemProject\": \"Hello\", \"itemDescription\": \"This is the pending payment description.\"}}','2022-12-15',NULL,'USD',3636.36,'2022-12-05',0,NULL,'7777777777777','Good job!'),('pvkiL474BVLD1yO2kUNy5','2c06e6ae-5a5c-4f09-b965-8e876efd8550','2022-12-07','in progress',200.0,504,NULL,'2022-04-15',1000.00,'CDN',396.83,'2022-12-07',1,NULL,'7777777777777','Bonus payment for Q1.'),('qmRQ2FKlUSrmxv_qTuJ1b','1','2022-12-03','paid',80.0,80,'{\"0\": {\"itemId\": \"4-ZYPjCHgDI5jHQTFOfOh\", \"itemHours\": \"80\", \"itemProject\": \"Hello\", \"itemDescription\": \"Hello\"}}','2022-09-13',3500.00,'USD',4000.00,NULL,0,NULL,NULL,NULL),('rvmk2BFRYbk5mERzr2fac','5','2022-12-07','in progress',500.0,504,NULL,'2022-07-15',3200.00,'CDN',1587.30,'2022-12-07',1,NULL,'7777777777777','Bonus payment for Q2.'),('voS-hpED-TbtnSnhan3gw','5','2022-12-05','paid',50.0,512,NULL,'2022-04-15',3200.00,'CDN',312.50,'2022-12-05',1,NULL,'7777777777777','Bonus payment for Q1.'),('WC9v6_pZ32X_lyzb6yJ6J','1','2022-12-07','in progress',500.0,504,NULL,'2022-04-15',4000.00,'USD',3968.25,'2022-12-07',1,NULL,'7777777777777','Bonus payment for Q1.'),('x5vaRX1faNu8UcgIBpwuD','1','2022-12-03','paid',80.0,80,'{\"0\": {\"itemId\": \"Ul9kKvjAAn_999ijDu_8-\", \"itemHours\": \"80\", \"itemProject\": \"Hello\", \"itemDescription\": \"Hello\"}}','2022-03-15',3500.00,'USD',3595.00,NULL,0,NULL,NULL,NULL),('XNsfwHw-Nt23Y3bHckE0v','5','2022-12-05','paid',20.0,512,NULL,'2022-04-15',3200.00,'CDN',125.00,'2022-12-05',1,NULL,'7777777777777','Bonus payment for Q1.');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `userId` varchar(36) NOT NULL,
  `firstName` varchar(100) NOT NULL,
  `lastName` varchar(100) NOT NULL,
  `email` varchar(200) NOT NULL,
  `password` varchar(200) NOT NULL,
  `accountType` varchar(45) NOT NULL,
  `dateJoined` varchar(45) NOT NULL,
  `company` varchar(100) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `currentCompensation` decimal(20,2) DEFAULT NULL,
  `status` varchar(20) NOT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('1','Richard','Hendricks','rhendricks@piedpiper.com','$argon2id$v=19$m=65536,t=3,p=4$BqCn94Q7exTvsOs1khfruA$gpFtjpdGZWIre0SMloMWXFBFWkBpF9vLdmg6ICKVYdI','contractor','2022-01-01','Pied Piper','USA','Los Angeles','not provided','USD',4000.00,'active'),('101010101010101010','Bertram','Gilfoyle','gilfoyle@pieceofcake.com','$argon2id$v=19$m=65536,t=3,p=4$S/sOb3EHcncGzy0ntJbr6A$dwrnF8301B75gSKcQc1bpEgAJ65KXZQqyMB3oiXHP+M','admin','2022-04-07','Piece of Cake',NULL,NULL,'not provided',NULL,NULL,'active'),('2','Gavin','Belson','gavin@hooli.com','$argon2id$v=19$m=65536,t=3,p=4$NNi6wlHGdnkc06+7XqtqKw$p/bZsji5cPSuQXXunUw5OTFVGBkC5qCWo+h0q5GXGrk','contractor','2022-05-25','Hooli','USA','Los Angeles','not provided','USD',NULL,'active'),('295e7e2b-63b4-4bcf-ab55-524b5bcf77c0','Nelson','Bighetti','bighead@hooli.com','$argon2id$v=19$m=65536,t=3,p=4$WKjQZVg2DOMOYqzm9AzKtQ$8AGw0u8Fo2uNiNaLAP75nEhPjy24A1pzKw8YSD+mNtU','contractor','2022-11-25','Hooli','USA','not provided','not provided',NULL,2000.00,'inactive'),('2c06e6ae-5a5c-4f09-b965-8e876efd8550','Dinesh','Chugtai','Dchugtai@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$38CB2OXXpZYAmAVsqQwZ/A$8DLiSIIkh7qcFlPHANWUIo+sxoNjomQ6u5GRzuS6ay8','contractor','2022-11-25','Pied Piper','USA','not provided','not provided','CDN',1000.00,'active'),('3','Peter','Gregory','pg@raviga.com','$argon2id$v=19$m=65536,t=3,p=4$ps2iN+UzkwLAcx5LnfbbIw$8af4RaD3TRmQrlxyOWU1iKce83aC6f+i3d1ub870f+w','contractor','2022-03-15','Raviga Capital','USA','San Francisco','not provided','MXN',3500.00,'active'),('4','Russ','Hanneman','russhanneman@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$lbrblUrGZa3IT4nzRu7+wQ$+QfsziefGJFlqk1YmLMYZ3I49wHbnl3e6VFCudV8vbg','contractor','2022-09-25','Tres Comas','Mexico','Mexico City','not provided','MXN',1000.00,'active'),('5','Erlich','Bachman','ebachman@aviato.ca','$argon2id$v=19$m=65536,t=3,p=4$CVWOqYnqFkiCf4cPaNKD3A$nUU9VbxSuxo0Z8DxxAToDcNAFmdM7T9ksDPED1kUhu4','contractor','2022-02-14','Aviato','Canada','Vancouver','not provided','CDN',3200.00,'active'),('6666666666666','Jared','Dunn','admin@pieceofcake.com','$argon2id$v=19$m=65536,t=3,p=4$GN1IPjEj8CSFsHVo1hSPTg$4trO1M0ScmIIcKowb7r/TtWqN8oTyOgKLjzeSfuNpAM','superAdmin','2022-01-01','Piece of Cake','','','not provided','',NULL,'active'),('7777777777777','Laurie','Bream','info@pieceofcake.com','$argon2id$v=19$m=65536,t=3,p=4$XAz7NOpgfh1opH0IuXCGhw$4aP/YExT0L9C/YsVTB74iAX63036ybJ+iXwxgNs+pnc','superAdmin','2022-01-16','Piece of Cake','',NULL,'not provided',NULL,NULL,'active'),('8888888888888888','Jian','Yang','jyang@pieceofcake.com','$argon2id$v=19$m=65536,t=3,p=4$VLb3T7bP/dUmraykWYZi9Q$IJDssj/HsWb5UTB/v4WqYtq3nnwIIB3ggefWUeBXe2s','admin','2022-10-30','Piece of Cake',NULL,NULL,'not provided',NULL,NULL,'active'),('927cbfa8-bf65-4903-8fc2-34413c35e1f1','Sarah','Salvatore','sarah.h.salvatore@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$xwf1nBJVWxv6lzyHNQaDkA$8r+zm1BFZG7lEB/hvRdlDnuqBEVbjESllCkCFo09YbM','contractor','2022-11-21',NULL,'Canada','not provided','not provided',NULL,NULL,'active'),('999999999999','Monica','Hall','mhall@pieceofcake.com','$argon2id$v=19$m=65536,t=3,p=4$9W4QYP9fUQbkguAxcMhF0w$/QxSj0MuZr/1h5VtPdmh4H8RvmuVfv5Y1mbrPOa+9oU','admin','2022-07-15','Piece of Cake',NULL,NULL,'not provided',NULL,NULL,'active'),('bbde82fc-715a-41b4-b9e1-93dd9a1a8f79','Jack','Barker','jbarker@hooli.com','$argon2id$v=19$m=65536,t=3,p=4$LDNjCV32GkBSt2g/Gx/mlA$a8AkQj3KGm5ruWw9AOXbDR3ivSwlFBB6uslUHkHcRHE','contractor','2022-11-25','Hooli','USA','not provided','not provided','CDN',2000.00,'inactive'),('cae9b849-d0b1-4d95-9214-806b98d0e7f5','Carla','Walton','cwalton@cw.ca','$argon2id$v=19$m=65536,t=3,p=4$4MiqTVIFSsX2HCtYixo5/g$F4NGu/QWhevkMzB6PIbpyoepGyay9FHii1FJJAUMP0o','contractor','2022-11-25','CW Inc.','Canada','not provided','not provided',NULL,NULL,'active'),('e9a72a85-5b07-485d-ad08-7fb2c556120b','Dean','Melamed','dean_melamed@hotmail.com','$argon2id$v=19$m=65536,t=3,p=4$W92axYBwFJeKJdGmgVEDbQ$ow/wC/cil//1KQ5+8CueB38XTSsz4TTe0+GQ2IGdcW0','contractor','2022-11-21',NULL,'Canada','not provided','not provided',NULL,NULL,'active'),('f112b10b-b930-454e-a36e-d2a955a0690d','Ron','LaFlamme','ronlaflamme@hotmail.com','$argon2id$v=19$m=65536,t=3,p=4$CFwJ6uVwkyWxb/7aEyNWkQ$JzRFQmL957xhofKlft3ihlkVJbSrtFYYHb6fDNlPm6s','contractor','2022-11-25','','Mexico','not provided','not provided',NULL,NULL,'active');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'poc-database'
--

--
-- Dumping routines for database 'poc-database'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-07 19:39:18

