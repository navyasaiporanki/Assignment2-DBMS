-- use Assignment6;

-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: cs5200-fall2019-poranki.camfldnst76t.us-east-2.rds.amazonaws.com    Database: Assignment2_New
-- ------------------------------------------------------
-- Server version	5.7.22-log

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `street1` varchar(45) NOT NULL,
  `street2` varchar(45) DEFAULT NULL,
  `city` varchar(45) NOT NULL,
  `state` varchar(45) NOT NULL,
  `zip` varchar(45) NOT NULL,
  `primary` tinyint(4) NOT NULL,
  KEY `address_person_composition_idx` (`id`),
  CONSTRAINT `address_person_composition` FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

--
-- Table structure for table `dtype`
--

DROP TABLE IF EXISTS `dtype`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dtype` (
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`type`),
  UNIQUE KEY `type_UNIQUE` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dtype`
--


--
-- Table structure for table `developer`
--

DROP TABLE IF EXISTS `developer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `developer` (
  `id` int(11) NOT NULL,
  `developer_key` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `developer_person_generalization` FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `developer`
--



--
-- Temporary view structure for view `developer_roles_and_privileges`
--


--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL,
  `created` date DEFAULT '2019-09-04',
  `updated` date DEFAULT '2019-10-09',
  `visits` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_website_composition_idx` (`website_id`),
  CONSTRAINT `page_website_composition` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=568 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--



--
-- Table structure for table `page_priviledge`
--

DROP TABLE IF EXISTS `page_priviledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_priviledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `priviledge` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_priviledge_developer_association_idx` (`developer_id`),
  KEY `page_priviledge_page_association_idx` (`page_id`),
  KEY `page_priviledge_priviledge_association_idx` (`priviledge`),
  CONSTRAINT `page_priviledge_developer_association` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_priviledge_page_association` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_priviledge_priviledge_association` FOREIGN KEY (`priviledge`) REFERENCES `priviledge` (`priviledge`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_priviledge`
--


--
-- Table structure for table `page_role`
--

DROP TABLE IF EXISTS `page_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `page_role_developer_association_idx` (`developer_id`),
  KEY `page_role_page_association_idx` (`page_id`),
  KEY `page_role_role_association_idx` (`role`),
  CONSTRAINT `page_role_developer_association` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_role_page_association` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `page_role_role_association` FOREIGN KEY (`role`) REFERENCES `role` (`role`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_role`
--


--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `person` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--



--
-- Table structure for table `phone`
--

DROP TABLE IF EXISTS `phone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phone` (
  `id` int(11) NOT NULL,
  `phones` varchar(45) NOT NULL,
  `primary` varchar(45) NOT NULL,
  KEY `phone_person_composition_idx` (`id`),
  CONSTRAINT `phone_person_composition` FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phone`
--


--
-- Table structure for table `priviledge`
--

DROP TABLE IF EXISTS `priviledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priviledge` (
  `priviledge` varchar(45) NOT NULL,
  PRIMARY KEY (`priviledge`),
  UNIQUE KEY `priviledge_UNIQUE` (`priviledge`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priviledge`
--



--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`role`),
  UNIQUE KEY `role_UNIQUE` (`role`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--



--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `user_agreement` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `user_person_generalization` FOREIGN KEY (`id`) REFERENCES `person` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--


--
-- Table structure for table `website`
--

DROP TABLE IF EXISTS `website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `description` varchar(200) NOT NULL,
  `created` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `visits` int(11) NOT NULL,
  `developer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `website_developer_aggregation_idx` (`developer_id`),
  CONSTRAINT `website_developer_aggregation` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website`
--



--
-- Table structure for table `website_priviledge`
--

DROP TABLE IF EXISTS `website_priviledge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_priviledge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `priviledge` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_priviledge_website_association_idx` (`website_id`),
  KEY `website_priviledge_developer_association_idx` (`developer_id`),
  KEY `website_priviledge_priviledge_association_idx` (`priviledge`),
  CONSTRAINT `website_priviledge_developer_association` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_priviledge_priviledge_association` FOREIGN KEY (`priviledge`) REFERENCES `priviledge` (`priviledge`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_priviledge_website_association` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_priviledge`
--



--
-- Table structure for table `website_role`
--

DROP TABLE IF EXISTS `website_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `website_role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `developer_id` int(11) NOT NULL,
  `website_id` int(11) NOT NULL,
  `role` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `website_priviledge_role_association_idx` (`role`),
  KEY `website_priviledge_website_association_idx` (`website_id`),
  KEY `website_priviledge_developer_association_idx` (`developer_id`),
  CONSTRAINT `website_role_developer_association` FOREIGN KEY (`developer_id`) REFERENCES `developer` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_role_role_association` FOREIGN KEY (`role`) REFERENCES `role` (`role`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `website_role_website_association` FOREIGN KEY (`website_id`) REFERENCES `website` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `website_role`
--

--
-- Table structure for table `widget`
--

DROP TABLE IF EXISTS `widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `dtype` varchar(45) NOT NULL,
  `text` varchar(45) DEFAULT NULL,
  `width/height` varchar(45) DEFAULT NULL,
  `css_class` varchar(45) DEFAULT NULL,
  `css_style` varchar(45) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `size` int(11) DEFAULT '2',
  `html` varchar(45) DEFAULT NULL,
  `src` varchar(45) DEFAULT NULL,
  `url` varchar(45) DEFAULT NULL,
  `shareable` tinyint(4) DEFAULT NULL,
  `expandable` tinyint(4) DEFAULT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `widget_dtype_aggregation_idx` (`dtype`),
  KEY `widget_page_composition_idx` (`page_id`),
  CONSTRAINT `widget_dtype_aggregation` FOREIGN KEY (`dtype`) REFERENCES `dtype` (`type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `widget_page_composition` FOREIGN KEY (`page_id`) REFERENCES `page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=679 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widget`
--


