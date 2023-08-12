-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: poc-database
-- ------------------------------------------------------
-- Server version	8.0.31

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
  `payrollDate` date NOT NULL,
  `baseCompensation` decimal(20,2) unsigned DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL,
  `totalPayment` decimal(20,2) unsigned DEFAULT NULL,
  `reviewDate` date DEFAULT NULL,
  `bonus` tinyint DEFAULT NULL,
  `savingsPlan` int unsigned DEFAULT NULL,
  `reviewedBy` varchar(36) DEFAULT NULL,
  `adminNotes` varchar(5000) DEFAULT NULL,
  `paymentDate` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`paymentId`),
  UNIQUE KEY `paymentId_UNIQUE` (`paymentId`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `reviewedBy` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES ('_-E3T5Do2taPahnVUK0nb','1','2023-08-11','pending',10.0,NULL,'2023-08-09',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('023fbce4-8a29-4514-8d3e-8f3527639a6e','1','2022-11-24','paid',80.0,80,'2022-10-15',3200.00,'USD',3200.00,'2022-11-28',1,NULL,'7777777777777','great job this period.',NULL),('126da342-4a62-4da2-8a17-aaa15d45523d','1','2022-11-24','paid',85.0,85,'2022-12-15',3400.00,'USD',3400.00,'2022-11-28',0,NULL,'7777777777777','great job this period.',NULL),('16871bf1-034c-47d7-8570-56137d5ca503','1','2022-11-24','paid',84.0,84,'2021-01-31',3360.00,'CAD',3360.00,'2022-11-28',0,NULL,'7777777777777','no notes',NULL),('1fbb4321-b84c-426c-92c9-345cd500e510','1','2022-11-24','paid',80.0,80,'2021-07-15',3200.00,'CAD',3200.00,'2022-11-28',0,NULL,'7777777777777','Approved. No notes.',NULL),('2a514300-1b7d-11ee-be76-2c3358aea758','1','2023-07-05','paid',80.0,80,'2023-07-25',3500.00,'CAD',3500.00,'2023-07-15',1,NULL,'7777777777777','bonus payment for p1',NULL),('2X97aCahtOWQsX7BIqdXJ','1','2023-08-07','pending',11.0,NULL,'2023-08-07',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('30926f46-b29f-45a9-ae6e-887d97e66e93','4','2022-11-24','paid',80.0,80,'2021-03-15',3200.00,'MXN',1000.00,'2023-06-26',0,NULL,'7777777777777','Good job!',NULL),('3a2410f0-de5c-4529-9d4e-0f898cac69b5','1','2022-11-24','paid',80.5,82,'2021-05-15',3220.00,'MXN',3220.00,'2022-11-28',0,NULL,'7777777777777','Great job. Client was very happy.',NULL),('448d432d-4845-444c-a3e7-8386d6f7f676','1','2022-11-24','paid',88.0,88,'2021-01-31',3520.00,'CAD',3520.00,'2022-11-28',0,NULL,'7777777777777','Great job. Client was very happy.',NULL),('4B3svNXuSr3DePes-t7Jd','bBb-SC_FDoevdabm56n-m','2023-07-31','pending',70.0,NULL,'2023-06-03',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('4i-OMgjUg-9g91ViUKSXV','1','2023-08-11','pending',50.0,NULL,'2023-08-09',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('4v9FbG6_kYru85vyWByEl','FqnBbljtFVtBh0VYvcgaI','2023-08-11','pending',60.0,NULL,'2023-07-18',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('5ad1485b-6a9d-46da-bb35-4c6b8f3c8096','1','2022-11-23','declined',70.0,80,'2022-08-10',3500.00,'USD',NULL,'2022-11-24',0,NULL,'0','More details are required for the work performed this pay period. Please include meeting details including company, date of meeting, attendees, etc.',NULL),('5dVtK3Aj2ri0DGQHpDGxM','1','2023-08-11','pending',20.0,NULL,'2023-08-09',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('5IlDOcjk1WhfA8c_rOYC_','1','2023-08-11','pending',3.0,NULL,'2023-08-08',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('5WwGWVIiPlzkyj4rbX5p0','1','2023-08-11','pending',3.0,NULL,'2023-08-09',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('6d84268e-46d2-4e85-87e3-ece7e8d7bb7c','1','2022-11-24','paid',80.0,80,'2023-11-30',3200.00,'USD',3200.00,'2022-11-28',0,NULL,'7777777777777','no notes.',NULL),('6MIq6t3Fy5AiUVYuskXEN','bBb-SC_FDoevdabm56n-m','2023-07-31','pending',70.0,NULL,'2023-06-24',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('71sjEtYnHZv5tkP9q1F4M','5','2023-06-26','in progress',500.0,500,'2023-07-15',3500.00,'USD',3500.00,'2023-06-26',1,NULL,'7777777777777','Bonus payment for Q2.',NULL),('73XZ_dvOteL9xhOcmlxM7','bBb-SC_FDoevdabm56n-m','2023-07-31','pending',70.0,NULL,'2023-06-26',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('8b717171-d040-488f-969d-7187cea68088','1','2022-11-24','paid',86.0,88,'2022-11-30',3440.00,'CAD',3440.00,'2022-11-28',0,NULL,'7777777777777','\"no notes. Keep up the great work.\"',NULL),('8bd0595a-fe49-4656-b472-09bccbf6e4a9','1','2022-11-24','paid',80.0,80,'2021-06-30',3200.00,'MXN',3200.00,'2022-11-28',0,NULL,'7777777777777','\"Great job! No notes.\"',NULL),('8CXU6D3wvGmR_l6gr7lOn','1','2023-08-11','pending',25.0,NULL,'2023-08-11',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('9E3v7OnkD_z_P_deQox25','1','2023-08-07','pending',3.0,NULL,'2023-08-04',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('9SYHbjtqWGyl0KaFz7Wyr','1','2023-08-11','pending',10.0,NULL,'2023-08-08',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('9u-ADC1VFGDf3NI9wNZrg','1','2023-08-11','pending',10.0,NULL,'2023-08-11',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('a3AzcHDr0Ylyk-aQ8GMfU','1','2023-08-07','pending',15.0,NULL,'2023-08-07',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('a6478acd-9e46-4ef7-a9b4-cf70efbfa8c3','1','2022-11-21','paid',88.0,88,'2022-11-30',3500.00,'USD',3500.00,NULL,0,NULL,NULL,NULL,NULL),('aBhU5LdYlx4ZML3Zujdue','1','2023-08-07','pending',16.0,NULL,'2023-08-07',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('agOoKjLvmmTBT4cMC3xDA','1','2023-08-11','pending',20.0,NULL,'2023-08-10',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('AOyUFVco-E1VjxMMgdN7v','1','2023-08-11','pending',10.0,NULL,'2023-08-09',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('AscI2yjpcbjsaxfYsiO5W','1','2023-08-11','pending',5.0,NULL,'2023-08-08',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('Asyhs2CqDuXmExDU6SXXP','bBb-SC_FDoevdabm56n-m','2023-08-09','pending',80.0,NULL,'2023-07-30',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('b53e11e3-f0a4-43b4-9b2b-cd7c94276da8','1','2022-11-24','paid',80.0,80,'2021-07-31',3200.00,'MXN',3200.00,'2022-11-28',0,NULL,'7777777777777','\"No notes.\"',NULL),('BbWYOOo3FZBpIw9pAUZGe','1','2022-12-03','paid',80.0,80,'2022-02-15',3500.00,'USD',3500.00,NULL,0,NULL,NULL,NULL,NULL),('bCZdOImOCtVI9OgOVt929','1','2023-08-10','pending',35.0,NULL,'2023-08-05',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('BLuo7pusvYvv5Y9Mlg7Sm','1','2023-08-10','pending',10.0,NULL,'2023-08-09',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('cDMW2gu1oS1Uvbjjxl3sL','1','2023-08-07','pending',15.0,NULL,'2023-08-07',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('cDX3ISl7ZbxelkTRx7yWv','1','2023-08-11','pending',10.0,NULL,'2023-08-07',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('Ch3CKuUgCKlvU3P70s72v','4','2022-12-07','paid',500.0,504,'2022-05-15',3200.00,'CAD',2380.95,'2022-12-07',1,NULL,'7777777777777','Bonus payment for Q1.',NULL),('CK7X82ZjuBk_1HMrQ6LE4','1','2023-08-10','pending',10.0,NULL,'2023-08-02',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('COEqmdp9_aJi_c3HsDLv0','1','2023-08-11','pending',10.0,NULL,'2023-08-11',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('CpNNgMTKj_nnPu5Iy0WnC','4','2022-12-09','paid',40.0,88,'2022-12-15',NULL,'MXN',454.55,'2023-07-31',0,NULL,'AlQ80CDb6bK7o1BoonXym','no notes',NULL),('Cwo_gFDMFc7-lgqNMecz1','1','2023-08-07','pending',7.5,NULL,'2023-08-04',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('d35ec158-e8b9-4d10-a394-0e71fa4a0c25','1','2022-11-24','paid',78.0,80,'2022-11-30',3120.00,'MXN',3120.00,'2022-11-28',0,NULL,'7777777777777','\"no notes.\"',NULL),('d63f4366-dbe9-4d44-8fae-44c00ff71696','1','2022-11-24','paid',82.0,82,'2023-11-15',3280.00,'MXN',3280.00,'2022-11-28',0,NULL,'7777777777777','\"Great job. Client was very happy.\"',NULL),('DiS3jrwIR4EUTWWul99Zp','bBb-SC_FDoevdabm56n-m','2023-07-31','in progress',90.0,NULL,'2023-06-10',NULL,'CAD',0.00,'2023-07-31',0,NULL,'AlQ80CDb6bK7o1BoonXym','no notes',NULL),('e8985399-8bbe-4673-b066-1dcde738ad6f','1','2022-11-24','paid',80.0,80,'2021-03-31',3200.00,'MXN',3200.00,'2022-11-28',0,NULL,'7777777777777','\"Excellent work.\"',NULL),('E8UaX8zusEp2Fr7ALFh8Z','bBb-SC_FDoevdabm56n-m','2023-08-09','pending',30.0,NULL,'2023-08-05',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('esmYBLfGg71uVMoCNskHx','1','2022-12-09','in progress',40.0,88,'2022-12-15',NULL,'USD',1818.18,'2023-07-31',0,NULL,'AlQ80CDb6bK7o1BoonXym','no notes',NULL),('fd5c62f8-1b7c-11ee-be76-2c3358aea758','1','2023-07-05','paid',80.0,80,'2023-07-25',3500.00,'CAD',3500.00,'2023-07-15',1,NULL,'7777777777777','bonus payment for p1',NULL),('fdR5jkdg49kVWhnfSlm3z','1','2023-08-11','pending',10.0,NULL,'2023-08-01',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('fKGhFu4PE50EFjZ0IOOWH','1','2022-12-06','in progress',80.0,88,'2023-08-15',NULL,'USD',3636.36,'2022-12-06',0,NULL,'7777777777777','Good job!',NULL),('fqgKoOTWSHIkWe3JqFfEW','5','2022-12-06','paid',20.0,520,'2022-07-30',3200.00,'CAD',123.08,'2022-12-06',1,NULL,'7777777777777','Bonus payment for Q2.',NULL),('Fye-_mNQN34OIUuLDhpdE','1','2022-12-03','paid',80.0,80,'2022-04-19',3500.00,'USD',3500.00,NULL,0,NULL,NULL,NULL,NULL),('G99pmwWdz2_jeNXplQaBn','1','2023-08-08','pending',8.0,NULL,'2023-08-01',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('GMisNgt2qMAfMTQZmCFKf','1','2023-08-11','pending',5.0,NULL,'2023-08-10',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('GnmeA3HX6FskmIRdxCpc3','1','2023-08-10','pending',4.0,NULL,'2023-08-04',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('GOS1iCZDkd8gOZybq8bNb','1','2022-12-07','in progress',70.0,NULL,'2023-01-15',NULL,'USD',NULL,NULL,0,NULL,NULL,NULL,NULL),('Gs3UcH-El6eOf5dS8N_Pi','1','2022-12-05','paid',80.0,88,'2022-12-15',NULL,'USD',3636.36,'2022-12-05',0,NULL,'7777777777777','Good job!',NULL),('H4Kyfk5gYM98HNbwFe5Fb','1','2023-08-11','pending',10.0,NULL,'2023-08-11',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('iCtnMrXPrHRfP9zzpgYoc','FqnBbljtFVtBh0VYvcgaI','2023-08-11','paid',50.0,80,'2023-05-28',NULL,'CAD',1875.00,'2023-08-11',0,NULL,'AlQ80CDb6bK7o1BoonXym','good job',NULL),('iPT8k6PaoXo-ib7mxTcjQ','1','2023-08-11','pending',10.0,NULL,'2023-08-06',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('iq6viEeV_Br7aFe649H6O','1','2023-08-08','pending',8.5,NULL,'2023-08-07',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('isxSxp58sSOxQdfmvYYt0','1','2023-08-07','pending',7.5,NULL,'2023-08-01',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('Jg1AzqqfI8SLov3Mk4pCl','bBb-SC_FDoevdabm56n-m','2023-07-31','paid',40.0,72,'2023-06-28',NULL,'CAD',0.00,'2023-07-31',0,NULL,'AlQ80CDb6bK7o1BoonXym','good job',NULL),('jYdpX68Wbo0Ac9jTDsu9_','1','2023-08-08','pending',7.5,NULL,'2023-08-01',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('jyehtoOBz46MrlyCAy8zc','bBb-SC_FDoevdabm56n-m','2023-07-31','declined',100.0,16,'2023-07-18',NULL,'CAD',0.00,'2023-07-31',0,NULL,'AlQ80CDb6bK7o1BoonXym','missing hours',NULL),('lCZcZ9hof95FJJEqUAMyC','1','2023-08-08','pending',6.0,NULL,'2023-08-01',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('LKmIvkHs4ZeEx5jf2S6Vb','1','2023-08-11','pending',10.0,NULL,'2023-08-10',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('lmVtOJ17_alHvSUUqRiS9','bBb-SC_FDoevdabm56n-m','2023-07-31','pending',180.0,NULL,'2023-06-25',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('lwgVeVv0NaopV9gCqsan3','1','2023-08-07','pending',11.0,NULL,'2023-08-07',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('m00obi0AmB621uIFwRZv1','FqnBbljtFVtBh0VYvcgaI','2023-08-11','in progress',80.0,32,'2023-07-11',NULL,'CAD',7500.00,'2023-08-11',0,NULL,'AlQ80CDb6bK7o1BoonXym','good job',NULL),('nO4S5jUpOYt_hQu6KmANF','1','2023-08-11','pending',10.0,NULL,'2023-08-10',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('o0LQcHzfe7xMu6jIFx1we','1','2023-08-09','pending',80.0,NULL,'2023-07-03',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('oA2i-VU4ZG3D_rynDr5nD','1','2023-08-11','pending',5.0,NULL,'2023-08-08',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('OKs3jGPuSCgC57iDrLOJO','bBb-SC_FDoevdabm56n-m','2023-08-09','pending',76.0,NULL,'2023-08-02',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('oO1ZMjUNMSZfUr8DJNabg','FqnBbljtFVtBh0VYvcgaI','2023-08-11','pending',40.0,NULL,'2023-07-25',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('PbsoIo49W3lCmRQTqTAqs','1','2023-08-11','pending',4.0,NULL,'2023-08-10',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('PLc23BC4qpzbUU2xFBTen','FqnBbljtFVtBh0VYvcgaI','2023-08-11','declined',80.0,72,'2023-07-04',NULL,'CAD',3333.33,'2023-08-11',0,NULL,'AlQ80CDb6bK7o1BoonXym','missing some work',NULL),('PNg4ViPU6LYTHmMGtxpP6','1','2023-08-11','pending',20.0,NULL,'2023-08-10',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('pQI7xf4SIIsmj79jzgLtD','1','2023-08-11','pending',80.0,NULL,'2023-08-11',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('pvkiL474BVLD1yO2kUNy5','2c06e6ae-5a5c-4f09-b965-8e876efd8550','2022-12-07','paid',200.0,504,'2022-05-15',1000.00,'CAD',396.83,'2022-12-07',1,NULL,'7777777777777','Bonus payment for Q1.',NULL),('Q-i4QhD02xijCVx2PfmEh','1','2023-08-11','pending',40.0,NULL,'2023-08-11',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('qmRQ2FKlUSrmxv_qTuJ1b','1','2022-12-03','paid',80.0,80,'2022-09-13',3500.00,'USD',4000.00,NULL,0,NULL,NULL,NULL,NULL),('quPi5b2TvEA0-oOyiY_0w','bbde82fc-715a-41b4-b9e1-93dd9a1a8f79','2023-06-26','paid',500.0,512,'2023-04-15',2000.00,'CAD',1953.13,'2023-06-26',1,NULL,'7777777777777','Bonus payment for Q1.',NULL),('rnJOyDojQ9pGADJz2fwAS','1','2023-08-11','pending',4.0,NULL,'2023-08-11',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('rvmk2BFRYbk5mERzr2fac','5','2022-12-07','in progress',500.0,504,'2022-07-15',3200.00,'CAD',1587.30,'2022-12-07',1,NULL,'7777777777777','Bonus payment for Q2.',NULL),('s-i5pjpbpWfrfF9TZFEll','1','2023-08-11','pending',20.0,NULL,'2023-08-01',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('sB9RF8ffIKiqHZgrjf2LM','1','2023-08-11','pending',2.0,NULL,'2023-08-11',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('uhV9bJ9zC3ZanyPELpIrM','1','2023-08-07','pending',15.0,NULL,'2023-08-07',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('V0QgttmR2tVS5EyS-6llN','1','2023-08-08','pending',8.0,NULL,'2023-08-04',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('voS-hpED-TbtnSnhan3gw','5','2022-12-05','paid',50.0,512,'2022-04-15',3200.00,'CAD',312.50,'2022-12-05',1,NULL,'7777777777777','Bonus payment for Q1.',NULL),('VQmxivRYiMhNYRatcxXLx','1','2023-08-11','pending',8.0,NULL,'2023-08-08',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('WC9v6_pZ32X_lyzb6yJ6J','1','2022-12-07','paid',500.0,504,'2022-04-15',4000.00,'USD',3968.25,'2022-12-07',1,NULL,'7777777777777','Bonus payment for Q1.',NULL),('Wlr5e9FVO55-OcKH0HyxC','1','2023-08-07','pending',15.0,NULL,'2023-08-07',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('WNXT-3AZNqcOcxxvC2vm4','1','2023-08-08','pending',7.5,NULL,'2023-08-03',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('x5vaRX1faNu8UcgIBpwuD','1','2022-12-03','paid',80.0,80,'2022-03-15',3500.00,'USD',3595.00,NULL,0,NULL,NULL,NULL,NULL),('Xb0HcHJ_3cWpVn_xCBn0S','FqnBbljtFVtBh0VYvcgaI','2023-08-11','pending',35.0,NULL,'2023-08-01',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('XNsfwHw-Nt23Y3bHckE0v','5','2022-12-05','paid',20.0,512,'2022-04-15',3200.00,'CAD',125.00,'2022-12-05',1,NULL,'7777777777777','Bonus payment for Q1.',NULL),('y2uEvpPMhHhXuhyfVYI0W','1','2023-06-26','pending',25.0,NULL,'2023-07-31',NULL,'USD',NULL,NULL,0,NULL,NULL,NULL,NULL),('YGuaJS_KMsHCmmgKe4l1e','1','2023-07-27','pending',80.0,NULL,'2023-07-27',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('yoidlwvilyDDyUENEvxp2','1','2023-08-07','pending',15.0,NULL,'2023-08-07',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL),('znUNzzsozEXnjIqcOvITs','1','2023-08-11','pending',10.0,NULL,'2023-08-15',NULL,'CAD',NULL,NULL,0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_criteria`
--

DROP TABLE IF EXISTS `performance_criteria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_criteria` (
  `id` varchar(36) NOT NULL,
  `criteria_name` varchar(100) DEFAULT NULL,
  `criteria_description` varchar(1000) DEFAULT NULL,
  `lowest_value` int NOT NULL,
  `highest_value` int NOT NULL,
  `period_start` datetime DEFAULT NULL,
  `period_end` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_criteria`
--

LOCK TABLES `performance_criteria` WRITE;
/*!40000 ALTER TABLE `performance_criteria` DISABLE KEYS */;
INSERT INTO `performance_criteria` VALUES ('58758b3a-1b7e-11ee-be76-2c3358aea758','communication skills','you have good communication skills',0,10,NULL,NULL),('6febcea9-1b7e-11ee-be76-2c3358aea758','communication skills','you have good communication skills',0,10,NULL,NULL),('6febd536-1b7e-11ee-be76-2c3358aea758','coding skills','you have good coding skills',0,10,NULL,NULL),('86ef84a8-1c3a-11ee-9349-2c3358aea758','communication skills','you have good communication skills',0,10,'2022-12-03 00:00:00','2023-12-03 00:00:00'),('86efbb8e-1c3a-11ee-9349-2c3358aea758','coding skills','you have good coding skills',0,10,'2022-07-09 00:00:00','2023-07-09 00:00:00');
/*!40000 ALTER TABLE `performance_criteria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `performance_review`
--

DROP TABLE IF EXISTS `performance_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `performance_review` (
  `id` varchar(36) NOT NULL,
  `review_for_id` varchar(36) DEFAULT NULL,
  `review_by` varchar(36) DEFAULT NULL,
  `review_datetime` timestamp NULL DEFAULT NULL,
  `review_criteria_id` varchar(36) DEFAULT NULL,
  `perct_weight` int NOT NULL,
  `self_review_id` varchar(36) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `review_for_id` (`review_for_id`),
  KEY `review_by` (`review_by`),
  KEY `review_criteria_id` (`review_criteria_id`),
  KEY `self_review_id` (`self_review_id`),
  CONSTRAINT `review_by` FOREIGN KEY (`review_by`) REFERENCES `users` (`userId`),
  CONSTRAINT `review_criteria_id` FOREIGN KEY (`review_criteria_id`) REFERENCES `performance_criteria` (`id`),
  CONSTRAINT `review_for_id` FOREIGN KEY (`review_for_id`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `performance_review`
--

LOCK TABLES `performance_review` WRITE;
/*!40000 ALTER TABLE `performance_review` DISABLE KEYS */;
INSERT INTO `performance_review` VALUES ('4f4db955-1b80-11ee-be76-2c3358aea758','1','101010101010101010','2023-07-05 22:07:19','58758b3a-1b7e-11ee-be76-2c3358aea758',50,'');
/*!40000 ALTER TABLE `performance_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `id` varchar(36) NOT NULL,
  `project_name` varchar(100) DEFAULT NULL,
  `project_description` varchar(1000) DEFAULT NULL,
  `status` varchar(35) DEFAULT NULL,
  `program` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('2cae2949-1b74-11ee-be76-2c3358aea758','project 1','project 1 description',NULL,'program 1'),('2cae318e-1b74-11ee-be76-2c3358aea758','project 2','project 2 description',NULL,'program 2'),('2cae337c-1b74-11ee-be76-2c3358aea758','project 3','project 3 description',NULL,'program 1'),('2cae344b-1b74-11ee-be76-2c3358aea758','project 4','project 4 description',NULL,'program 2'),('2cae3502-1b74-11ee-be76-2c3358aea758','project 5','project 5 description',NULL,'program 1');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
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
  `profilePhoto` varchar(1000) DEFAULT NULL,
  `reminders` smallint DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `userName` varchar(50) DEFAULT NULL,
  `bimonthlyRate` decimal(10,0) DEFAULT NULL,
  `bimonthlyRateStartDate` datetime DEFAULT NULL,
  PRIMARY KEY (`userId`),
  UNIQUE KEY `userId_UNIQUE` (`userId`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('0wh_GTyHCf2ApqzSyinhQ','Krunal','joshi','krunaljoshi@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$1tdWbzGaLKC21vci/VHW0Q$qrs1K10P+G5gSUpXvGEsb3/f9x/M0SuafhtzD0b+AKA','contractor','2023-07-26','fake company','Canada','Toronto','1234567890','CAD',NULL,'active','richard_avatar1.png',NULL,'2020-12-08','krunalj',NULL,NULL),('1','Richard','Hendricks','rhendricks@piedpiper.com','richard','contractor','2022-01-01','Pied Piper Inc','Canada','Toronto','1122334455','CAD',4000.00,'active','richard_avatar11.jpg',NULL,NULL,NULL,NULL,NULL),('101010101010101010','Bertram','Gilfoyle','gilfoyle@pieceofcake.com','$argon2id$v=19$m=65536,t=3,p=4$S/sOb3EHcncGzy0ntJbr6A$dwrnF8301B75gSKcQc1bpEgAJ65KXZQqyMB3oiXHP+M','admin','2022-04-07','Piece of Cake',NULL,NULL,'not provided',NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('2','Gavin','Belson','gavin@hooli.com','$argon2id$v=19$m=65536,t=3,p=4$NNi6wlHGdnkc06+7XqtqKw$p/bZsji5cPSuQXXunUw5OTFVGBkC5qCWo+h0q5GXGrk','contractor','2022-05-25','Hooli','USA','Los Angeles','not provided','USD',NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('295e7e2b-63b4-4bcf-ab55-524b5bcf77c0','Nelson','Bighetti','bighead@hooli.com','$argon2id$v=19$m=65536,t=3,p=4$WKjQZVg2DOMOYqzm9AzKtQ$8AGw0u8Fo2uNiNaLAP75nEhPjy24A1pzKw8YSD+mNtU','contractor','2022-11-25','Hooli','USA','not provided','not provided',NULL,2000.00,'inactive',NULL,NULL,NULL,NULL,NULL,NULL),('2c06e6ae-5a5c-4f09-b965-8e876efd8550','Dinesh','Chugtai','Dchugtai@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$38CB2OXXpZYAmAVsqQwZ/A$8DLiSIIkh7qcFlPHANWUIo+sxoNjomQ6u5GRzuS6ay8','contractor','2022-11-25','Pied Piper','USA','not provided','not provided','CDN',1000.00,'active',NULL,NULL,NULL,NULL,NULL,NULL),('3','Peter','Gregory','pg@raviga.com','$argon2id$v=19$m=65536,t=3,p=4$ps2iN+UzkwLAcx5LnfbbIw$8af4RaD3TRmQrlxyOWU1iKce83aC6f+i3d1ub870f+w','contractor','2022-03-15','Raviga Capital','USA','San Francisco','not provided','MXN',3500.00,'active',NULL,NULL,NULL,NULL,NULL,NULL),('3EU0_5NwNe9my8vwdQSDe','Kishan','joshi','kishanjoshi@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$fCNFhRydxfq/88ZKt7SG9g$I7zYMCQohLPTpUO5LudmC6I6bs4ZL85MHYudYpz6he8','contractor','2023-07-26','fake company','Canada','Toronto','1234567890','CAD',NULL,'active','richard_avatar11.jpg',NULL,'1992-12-08','kishanj',NULL,NULL),('4','Russ','Hanneman','russhanneman@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$lbrblUrGZa3IT4nzRu7+wQ$+QfsziefGJFlqk1YmLMYZ3I49wHbnl3e6VFCudV8vbg','contractor','2022-09-25','Tres Comas','Mexico','Mexico City','not provided','MXN',1000.00,'active',NULL,NULL,NULL,NULL,NULL,NULL),('5','Erlich','Bachman','ebachman@aviato.ca','$argon2id$v=19$m=65536,t=3,p=4$CVWOqYnqFkiCf4cPaNKD3A$nUU9VbxSuxo0Z8DxxAToDcNAFmdM7T9ksDPED1kUhu4','contractor','2022-02-14','Aviato','Canada','Vancouver','not provided','USD',3500.00,'active',NULL,NULL,NULL,NULL,NULL,NULL),('6666666666666','Jared','Dunn','admin@pieceofcake.com','$argon2id$v=19$m=65536,t=3,p=4$GN1IPjEj8CSFsHVo1hSPTg$4trO1M0ScmIIcKowb7r/TtWqN8oTyOgKLjzeSfuNpAM','superAdmin','2022-01-01','Piece of Cake','','','not provided','',NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('7777777777777','Laurie','Bream','info@pieceofcake.com','laurie','superAdmin','2022-01-16','Piece of Cake','',NULL,'not provided',NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('8888888888888888','Jian','Yang','jyang@pieceofcake.com','$argon2id$v=19$m=65536,t=3,p=4$VLb3T7bP/dUmraykWYZi9Q$IJDssj/HsWb5UTB/v4WqYtq3nnwIIB3ggefWUeBXe2s','admin','2022-10-30','Piece of Cake',NULL,NULL,'not provided',NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('927cbfa8-bf65-4903-8fc2-34413c35e1f1','Sarah','Salvatore','sarah.h.salvatore@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$xwf1nBJVWxv6lzyHNQaDkA$8r+zm1BFZG7lEB/hvRdlDnuqBEVbjESllCkCFo09YbM','contractor','2022-11-21',NULL,'Canada','not provided','not provided',NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('999999999999','Monica','Hall','mhall@pieceofcake.com','$argon2id$v=19$m=65536,t=3,p=4$9W4QYP9fUQbkguAxcMhF0w$/QxSj0MuZr/1h5VtPdmh4H8RvmuVfv5Y1mbrPOa+9oU','superAdmin','2022-07-15','Piece of Cake',NULL,NULL,'not provided',NULL,NULL,'inactive',NULL,NULL,NULL,NULL,NULL,NULL),('AlQ80CDb6bK7o1BoonXym','Dipal','Admin','dipaladmin@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$Ilu2laDJqHKsPfd7A8/TMQ$re7IT2JzJjIiz2nMp8XUWqoJJIB3MoxfDRdPtoAZ4wU','admin','2023-07-21','Piece of Cake',NULL,NULL,NULL,NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('AvgYWykq8JCch0Z6Y7hWb','Kishanp','joshii','kishansjoshii@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$e+6WAjD0LZoTnBPjANwQFw$77BOe99QSBnledYIU7sVHsscBJQiwRNjg/j+xnCM27k','contractor','2023-07-26','fake company','Canada','Toronto','1234567890',NULL,NULL,'active',NULL,NULL,'1993-12-08','kishanpj',NULL,NULL),('bBb-SC_FDoevdabm56n-m','kishan','swami','kishans@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$g2Ql8IUnxNO6jDjVZ+yZSw$1kM2Yhaoecy2ranYPmWKnISSazIpcsLZJYv1CemS1vQ','contractor','2023-07-26','tata','Canada','not provided','not provided','CAD',NULL,'active','richard_avatar1.png',NULL,'1992-12-12','kishans',NULL,NULL),('bbde82fc-715a-41b4-b9e1-93dd9a1a8f79','Jack','Barker','jbarker@hooli.com','$argon2id$v=19$m=65536,t=3,p=4$LDNjCV32GkBSt2g/Gx/mlA$a8AkQj3KGm5ruWw9AOXbDR3ivSwlFBB6uslUHkHcRHE','contractor','2022-11-25','Hooli','USA','not provided','not provided','CDN',2000.00,'inactive',NULL,NULL,NULL,NULL,NULL,NULL),('BBm761xUgEjaXrgVRj2KJ','ram1','patel','ram1@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$8k0VjTL6TBEkvrvoqg1h1A$cX4Ya0JfspCO01AH5kjFsb7lRImNZmKnKi7RXkalokc','contractor','2023-07-11','fake company','Canada','not provided','not provided',NULL,NULL,'active',NULL,NULL,'1990-09-08',NULL,NULL,NULL),('cae9b849-d0b1-4d95-9214-806b98d0e7f5','Carla','Walton','cwalton@cw.ca','$argon2id$v=19$m=65536,t=3,p=4$4MiqTVIFSsX2HCtYixo5/g$F4NGu/QWhevkMzB6PIbpyoepGyay9FHii1FJJAUMP0o','contractor','2022-11-25','CW Inc.','Canada','not provided','not provided',NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('eshUjIIo-GSw8JrCiT2jn','Buddy','Salvatore','buddy@buddythedog.com','$argon2id$v=19$m=65536,t=3,p=4$7WKXNzRniALCbZ5jikoe1Q$VJRXFNnh9/3nWTFE8MfQhqi7dgwvzKynxMTeDOz59zY','contractor','2022-12-09','','Canada','not provided','not provided',NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('f112b10b-b930-454e-a36e-d2a955a0690d','Ron','LaFlamme','ronlaflamme@hotmail.com','$argon2id$v=19$m=65536,t=3,p=4$CFwJ6uVwkyWxb/7aEyNWkQ$JzRFQmL957xhofKlft3ihlkVJbSrtFYYHb6fDNlPm6s','contractor','2022-11-25','','Mexico','not provided','not provided',NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('FqnBbljtFVtBh0VYvcgaI','Anna','Campbell','annac8@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$3fPwUP/hvgF1M6YzY7NVtQ$/SKCRvSJL7tdfviDTOXfPYBhT+PAsPZLOq+sSm4M26s','contractor','2023-06-11','Piece of Cake','Canada','Toronto','9107403749','CAD',3000.00,'active','female avatar.jpg',NULL,'1997-11-09','anna8',6000,'2023-06-11 00:00:00'),('fVm8pviPb1JzmoTHsz-0s','Dipal','Patel','thakar.dipal.8@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$S0lWqJPshaIuQYpKtobZyQ$nHGEQdKw3tMEcycUHYaZKuLq/yNSQNd7WNetn2MSdsc','contractor','2023-06-29','','Canada','not provided','not provided',NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('hbx6e6t2wUVImCLCWa9iB','Viaan','Joshi','viaanjoshi31@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$hNePtc97A62dOniX/SW2zg$YMAO7OibUBm/YraAoIwu0LotXT1Mn1XYOnjbhH6KIf8','contractor','2023-07-13','fake company 2','Canada','not provided','not provided',NULL,NULL,'active',NULL,NULL,'2021-08-31',NULL,1000,'2023-08-14 00:00:00'),('Hs_oR8i8rnO4RnyUkeK2Z','Kishankumar','Patel','kp8@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$iKm239OviCmthFafLMCSFw$GDZ/lSZ+A9BDu6C03wL/639VaacOKTdFMzbyVQr3SoY','contractor','2023-07-11','fake company','Canada','not provided','not provided',NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('i87YmHhGD_mOi_dKFzZsv','Dipal','Patel','thakardipal8@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$oXpp6mnBwCkYkE1X9v3sMA$7Sqm+7G0gL7E1G7p2O526aPNPRgRK3Umpi2dtJdhmJA','admin','2023-08-10','Piece of Cake',NULL,NULL,NULL,NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('iL7sieHR9PSuP2FbfUJUo','ram','patel','ram@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$myy/stbGyQVkObFzEQ5mkw$vfTyoJjXXvu5tb2YkK4ekM/dvPrgAqTAsVddEYskYVU','contractor','2023-07-11','fake company 1','Canada','not provided','not provided',NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('k9CctKtiawXDk3oFA78Uq','Kinjal','Admin','kinjal.joshi1710@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$XeIqc42urPDx97I0cPFsMQ$4dnbvRDbos8x1Jhca22LEpt1kjLIRnk7yA+qq+yQ7a8','admin','2023-07-27','Piece of Cake',NULL,NULL,NULL,NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('q_EQAY-whd86eG_MRdgLO','kinjal','patel','kinjalp@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$C/4GEgBJ6q6RAQeYBrSv9Q$X0xlO9re6IkOy24vco8mFMkSxmVAvPizR3mMa9gGJbM','contractor','2023-07-22','fake company 2','Canada','not provided','not provided','CAD',NULL,'active','dipal_avatar.png',NULL,'2023-07-11','dipal.thakar1',NULL,NULL),('SeeKlgCdCmn7LMAHaI7wa','Dipal','Thakar','dipal.thakar@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$X1lXnonN8Bk3VUsDFMTjFA$VMVZW1wQegFTDv4WyjwfoLo2h+n1iKlZyzYiqXIasRY','contractor','2023-07-21','fake company','Canada','not provided','not provided','CAD',NULL,'active','dipal_avatar.png',NULL,'1990-01-01','dipal.thakar',NULL,NULL),('uWUwOW0giEZNEcGRxvjVV','kishan','Patel','kishanp8@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$Q+cahRzzorOE+78FvJD0jQ$k1Rm4E6uy55zsvD77lyClniRApd8NaoR8qEt1VAWgew','contractor','2023-07-11','','Canada','not provided','not provided',NULL,NULL,'active',NULL,NULL,NULL,NULL,NULL,NULL),('WSyoVSeJNyhyiFmJYyvEp','viaan','joshi','viaanj@gmail.com','$argon2id$v=19$m=65536,t=3,p=4$lOtbemGPKP8bwLSjjg5A5g$ZRKF/n9XBX5J3iQCAn++YmWVmnS0i91lwdn3BRC3wfM','contractor','2023-07-26','fake company','Canada','Toronto','1234567890','CAD',NULL,'active','richard_avatar11.jpg',NULL,'2020-12-08','viaanj',NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `work_item`
--

DROP TABLE IF EXISTS `work_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `work_item` (
  `id` varchar(36) NOT NULL,
  `project_id` varchar(36) DEFAULT NULL,
  `item_description` varchar(1000) DEFAULT NULL,
  `payment_id` varchar(36) DEFAULT NULL,
  `hours` decimal(10,0) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `work_item_project_id_fk` (`project_id`),
  KEY `work_item_payment_id_fk` (`payment_id`),
  CONSTRAINT `work_item_payment_id_fk` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`paymentId`),
  CONSTRAINT `work_item_project_id_fk` FOREIGN KEY (`project_id`) REFERENCES `project` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `work_item`
--

LOCK TABLES `work_item` WRITE;
/*!40000 ALTER TABLE `work_item` DISABLE KEYS */;
INSERT INTO `work_item` VALUES ('-0Z2fL1A2zcwUOO6S0k6m','2cae2949-1b74-11ee-be76-2c3358aea758','API Testing','5dVtK3Aj2ri0DGQHpDGxM',20,'2023-08-11 05:31:44'),('-P8KNtOsln1ceurRui_u4','2cae337c-1b74-11ee-be76-2c3358aea758','API Testing','CK7X82ZjuBk_1HMrQ6LE4',10,'2023-08-11 03:15:49'),('-sf2hdsUeq3lCuH01WNo4','2cae3502-1b74-11ee-be76-2c3358aea758','worked on main page','PLc23BC4qpzbUU2xFBTen',80,'2023-08-11 18:22:34'),('07Y9OtqGd7jU37BIgdq4k','2cae2949-1b74-11ee-be76-2c3358aea758','API Testing','oA2i-VU4ZG3D_rynDr5nD',5,'2023-08-11 04:53:11'),('1jFndSd4kB0wHOHKxDCg2','2cae337c-1b74-11ee-be76-2c3358aea758','I worked on profile','Asyhs2CqDuXmExDU6SXXP',80,'2023-08-09 19:27:58'),('2z0IQUDcsZ2zLjwjExcfy','2cae2949-1b74-11ee-be76-2c3358aea758','API Testing','_-E3T5Do2taPahnVUK0nb',10,'2023-08-11 05:20:58'),('3X5Uu4zXKAwdfde9r-odV','2cae2949-1b74-11ee-be76-2c3358aea758','API Design','nO4S5jUpOYt_hQu6KmANF',10,'2023-08-11 04:09:45'),('8B8b9dijqRy4HOJ8edb6L','2cae337c-1b74-11ee-be76-2c3358aea758','UI Work','4v9FbG6_kYru85vyWByEl',60,'2023-08-11 18:21:40'),('BbKx4wdMbj0dCvq90Ecva','2cae318e-1b74-11ee-be76-2c3358aea758','Project Documentation','iq6viEeV_Br7aFe649H6O',5,'2023-08-09 01:45:01'),('c1835a65-1b7d-11ee-be76-2c3358aea758','2cae2949-1b74-11ee-be76-2c3358aea758','i worked on project 1','023fbce4-8a29-4514-8d3e-8f3527639a6e',8,'2023-07-05 21:49:02'),('c183733d-1b7d-11ee-be76-2c3358aea758','2cae318e-1b74-11ee-be76-2c3358aea758','i worked on project 2','126da342-4a62-4da2-8a17-aaa15d45523d',6,'2023-07-05 21:49:02'),('CjQSqDWBfe8_jJqF5p9CI','2cae318e-1b74-11ee-be76-2c3358aea758','UX Work','oO1ZMjUNMSZfUr8DJNabg',40,'2023-08-11 18:21:05'),('cZs1UbRsg0GslLDK_d1Tx','2cae318e-1b74-11ee-be76-2c3358aea758','I worked on profile','s-i5pjpbpWfrfF9TZFEll',20,'2023-08-11 05:22:06'),('eJeZ2bds69dMG6TbTKH6H','2cae337c-1b74-11ee-be76-2c3358aea758','Document','o0LQcHzfe7xMu6jIFx1we',80,'2023-08-10 00:16:21'),('f7PNj0SJlWIUK1ysZfJh7','2cae318e-1b74-11ee-be76-2c3358aea758','ux work','cDX3ISl7ZbxelkTRx7yWv',10,'2023-08-11 04:56:20'),('FSKxnfLn50McTYH4pkdnT','2cae2949-1b74-11ee-be76-2c3358aea758','UI Work','Q-i4QhD02xijCVx2PfmEh',40,'2023-08-11 05:35:34'),('I1QVmPEhAU42etnyfg1lu','2cae2949-1b74-11ee-be76-2c3358aea758','UX Work','jYdpX68Wbo0Ac9jTDsu9_',2,'2023-08-09 01:32:55'),('IJMf2OAyrucIxmhi__PfA','2cae2949-1b74-11ee-be76-2c3358aea758','UX Work','4i-OMgjUg-9g91ViUKSXV',20,'2023-08-11 05:33:57'),('ilS1Sa7ijnoLOodhB2wiY','2cae2949-1b74-11ee-be76-2c3358aea758','Worked on bug stories','E8UaX8zusEp2Fr7ALFh8Z',30,'2023-08-09 19:18:44'),('IO84jV29krRMeMrIKq81n','2cae2949-1b74-11ee-be76-2c3358aea758','UX Work','AscI2yjpcbjsaxfYsiO5W',5,'2023-08-11 05:16:57'),('jKwj9lyjx4rIQSlyDc1Qn','2cae2949-1b74-11ee-be76-2c3358aea758','UI work','iPT8k6PaoXo-ib7mxTcjQ',10,'2023-08-11 05:18:36'),('jO4QWrbAV3SD3Tcu6TJcD','2cae2949-1b74-11ee-be76-2c3358aea758','UI work','5WwGWVIiPlzkyj4rbX5p0',3,'2023-08-11 05:27:56'),('knUiaPpP_DYbTdAMyOx5F','2cae2949-1b74-11ee-be76-2c3358aea758','UX Work','VQmxivRYiMhNYRatcxXLx',8,'2023-08-11 05:27:17'),('Lwh5sW_DcnKvDuoZFteC2','2cae2949-1b74-11ee-be76-2c3358aea758','API Work','jYdpX68Wbo0Ac9jTDsu9_',6,'2023-08-09 01:32:55'),('m_O_2_96Y72pjNHIVOITQ','2cae2949-1b74-11ee-be76-2c3358aea758','UI Work','fdR5jkdg49kVWhnfSlm3z',10,'2023-08-11 05:22:51'),('n7dSPkxtLgpoGnNYNiByY','2cae337c-1b74-11ee-be76-2c3358aea758','Database Designs','PNg4ViPU6LYTHmMGtxpP6',20,'2023-08-11 04:04:23'),('nI1CnndLm8UsHu2Ad7kHW','2cae2949-1b74-11ee-be76-2c3358aea758','I worked on profile','AOyUFVco-E1VjxMMgdN7v',10,'2023-08-11 05:20:11'),('No84ZxvqQZfJdSqO9Hr8b','2cae318e-1b74-11ee-be76-2c3358aea758','fake desc','LKmIvkHs4ZeEx5jf2S6Vb',10,'2023-08-11 04:44:53'),('nzughAmBeHbyW_lBH9_FA','2cae2949-1b74-11ee-be76-2c3358aea758','UX Work','9u-ADC1VFGDf3NI9wNZrg',10,'2023-08-11 04:11:22'),('o7prP1zfkTGFz6tpVTg0V','2cae318e-1b74-11ee-be76-2c3358aea758','API Testing','GnmeA3HX6FskmIRdxCpc3',4,'2023-08-11 03:17:06'),('OOTxQLkQnEjUZjNuaklma','2cae2949-1b74-11ee-be76-2c3358aea758','API Testing','znUNzzsozEXnjIqcOvITs',10,'2023-08-11 05:29:14'),('pXyyWOlc_EqyzTvwschDM','2cae337c-1b74-11ee-be76-2c3358aea758','Testing work','8CXU6D3wvGmR_l6gr7lOn',25,'2023-08-11 19:25:25'),('qD8SnXEEeYkmkRNDJsOnA','2cae344b-1b74-11ee-be76-2c3358aea758','I worked on profile','m00obi0AmB621uIFwRZv1',80,'2023-08-11 18:22:00'),('raJthOSOQf_d8VDGq3aY6','2cae2949-1b74-11ee-be76-2c3358aea758','UI work','agOoKjLvmmTBT4cMC3xDA',20,'2023-08-11 04:41:58'),('tVrjklTxgK95XrSZiuV-I','2cae2949-1b74-11ee-be76-2c3358aea758','worked on main page of app','bCZdOImOCtVI9OgOVt929',35,'2023-08-11 02:16:57'),('tZYJU5wovTS1NNX2Xukn3','2cae344b-1b74-11ee-be76-2c3358aea758','API Testing','GMisNgt2qMAfMTQZmCFKf',5,'2023-08-11 04:14:02'),('vBUQhuspqsONtoHWGtMSM','2cae344b-1b74-11ee-be76-2c3358aea758','API Testing','4i-OMgjUg-9g91ViUKSXV',30,'2023-08-11 05:33:57'),('WxBOu8_EA6tCUrq0AmTUH','2cae344b-1b74-11ee-be76-2c3358aea758','Unit testing','PbsoIo49W3lCmRQTqTAqs',4,'2023-08-11 04:07:39'),('xVSw_ztacVPxgPaBZensO','2cae2949-1b74-11ee-be76-2c3358aea758','API Testing','Xb0HcHJ_3cWpVn_xCBn0S',35,'2023-08-11 18:20:24'),('Y7HI6YvJz8lhhXHQ8fXb5','2cae318e-1b74-11ee-be76-2c3358aea758','Server Deployment','iq6viEeV_Br7aFe649H6O',4,'2023-08-09 01:45:01'),('YAfYzt1wCmSESbFUcB92p','2cae2949-1b74-11ee-be76-2c3358aea758','UI Work','9SYHbjtqWGyl0KaFz7Wyr',10,'2023-08-11 05:26:06'),('YL67HiT3dG6Id50cLTrcF','2cae2949-1b74-11ee-be76-2c3358aea758','da','iCtnMrXPrHRfP9zzpgYoc',50,'2023-08-11 18:40:29'),('ztSax-rxwj-k3Nvu18sjr','2cae337c-1b74-11ee-be76-2c3358aea758','fake desc','5IlDOcjk1WhfA8c_rOYC_',3,'2023-08-11 04:55:22');
/*!40000 ALTER TABLE `work_item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-08-11 21:21:10
