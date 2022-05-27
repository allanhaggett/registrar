-- MySQL dump 10.13  Distrib 5.7.35, for Linux (x86_64)
--
-- Host: localhost    Database: registrar
-- ------------------------------------------------------
-- Server version	5.7.35-0ubuntu0.18.04.1

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



DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `created` datetime NOT NULL,
  `createdby` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `stat_createduser_ibfk_1` (`createdby`),
  CONSTRAINT `stat_createduser_ibfk_1` FOREIGN KEY (`createdby`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=60022 DEFAULT CHARSET=latin1;


--
-- Table structure for table `courses`
--

DROP TABLE IF EXISTS `courses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `hyperlink` varchar(255) DEFAULT NULL,
  `description` text,
  `status_id` int(11) DEFAULT '1',
  `created` datetime NOT NULL,
  `createdby_id` char(36) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_ibfk_0` (`status_id`),
  KEY `coursescreateduser_ibfk_1` (`createdby_id`),
  KEY `coursesmodifieduser_ibfk_1` (`modifiedby_id`),
  CONSTRAINT `courses_ibfk_0` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `coursescreateduser_ibfk_1` FOREIGN KEY (`createdby_id`) REFERENCES `users` (`id`),
  CONSTRAINT `coursesmodifieduser_ibfk_1` FOREIGN KEY (`modifiedby_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16180339 DEFAULT CHARSET=latin1;


--
-- Table structure for table `classes`
--

DROP TABLE IF EXISTS `classes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `classes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `first_session` datetime NOT NULL,
  `last_session` datetime NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `hyperlink` varchar(255) DEFAULT NULL,
  `description` text,
  `max_capacity` int(11) DEFAULT '100',
  `min_capacity` int(11) DEFAULT '1',
  `status_id` int(11) DEFAULT '1',
  `created` datetime NOT NULL,
  `createdby_id` char(36) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classes_ibfk_0` (`status_id`),
  KEY `classescreateduser_ibfk_1` (`createdby_id`),
  KEY `classesmodifieduser_ibfk_1` (`modifiedby_id`),
  CONSTRAINT `classes_ibfk_0` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `classescreateduser_ibfk_1` FOREIGN KEY (`createdby_id`) REFERENCES `users` (`id`),
  CONSTRAINT `classesmodifieduser_ibfk_1` FOREIGN KEY (`modifiedby_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=314159 DEFAULT CHARSET=latin1;



--
-- Table structure for table `classes_courses`
--

DROP TABLE IF EXISTS `classes_courses`;
CREATE TABLE `classes_courses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `classes_courses_ibfk_1` (`class_id`),
  KEY `classes_courses_ibfk_2` (`course_id`),
  CONSTRAINT `classes_courses_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `classes_courses_ibfk_2` FOREIGN KEY (`course_id`) REFERENCES `courses` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000928 DEFAULT CHARSET=latin1;



--
-- Table structure for table `ministries`
--

DROP TABLE IF EXISTS `ministries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ministries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `elm_learner_group` varchar(255) NOT NULL,
  `description` text,
  `hyperlink` varchar(255) DEFAULT NULL,
  `image_path` varchar(255) DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `featured` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=400200 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;


--
-- Table structure for table `classes_ministries`
--

DROP TABLE IF EXISTS `classes_ministries`;
CREATE TABLE `classes_ministries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `class_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  `capacity` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `classes_ministries_ibfk_1` (`class_id`),
  KEY `classes_ministries_ibfk_2` (`ministry_id`),
  CONSTRAINT `classes_ministries_ibfk_1` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `classes_ministries_ibfk_2` FOREIGN KEY (`ministry_id`) REFERENCES `ministries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1000928 DEFAULT CHARSET=latin1;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status_id` int(11) DEFAULT '1',
  `class_id` int(11) DEFAULT '1',
  `name` varchar(255) DEFAULT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `slug` varchar(255) DEFAULT NULL,
  `hyperlink` varchar(255) DEFAULT NULL,
  `description` text,
  `created` datetime NOT NULL,
  `createdby_id` char(36) NOT NULL,
  `modified` datetime NOT NULL,
  `modifiedby_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `sessions_ibfk_0` (`class_id`),
  KEY `sessionstat_ibfk_0` (`status_id`),
  KEY `sessionscreateduser_ibfk_1` (`createdby_id`),
  KEY `sessionsmodifieduser_ibfk_1` (`modifiedby_id`),
  CONSTRAINT `sessions_ibfk_0` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `sessionstat_ibfk_0` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
  CONSTRAINT `sessionscreateduser_ibfk_1` FOREIGN KEY (`createdby_id`) REFERENCES `users` (`id`),
  CONSTRAINT `sessionsmodifieduser_ibfk_1` FOREIGN KEY (`modifiedby_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=314159 DEFAULT CHARSET=latin1;



--
-- Table structure for table `registrants`
--

DROP TABLE IF EXISTS `registrants`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registrants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `status_id` int(11) DEFAULT '1',
  `class_id` int(11) NOT NULL,
  `ministry_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `hyperlink` varchar(255) DEFAULT NULL,
  `created` datetime NOT NULL,
  `createdby_id` char(36) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `registrants_ibfk_0` (`class_id`),
  KEY `registrantstat_ibfk_0` (`status_id`),
  KEY `registrant_ministry_ibfk_0` (`ministry_id`),
  KEY `registrantscreateduser_ibfk_1` (`createdby_id`),
  CONSTRAINT `registrants_ibfk_0` FOREIGN KEY (`class_id`) REFERENCES `classes` (`id`),
  CONSTRAINT `registrant_ministry_ibfk_0` FOREIGN KEY (`ministry_id`) REFERENCES `ministries` (`id`),
  CONSTRAINT `registrantsstat_ibfk_0` FOREIGN KEY (`status_id`) REFERENCES `statuses` (`id`),
) ENGINE=InnoDB AUTO_INCREMENT=314159 DEFAULT CHARSET=latin1;


/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-08-17 11:45:49
