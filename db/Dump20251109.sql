-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: localhost    Database: dvsr_spec
-- ------------------------------------------------------
-- Server version	8.0.44

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add site',2,'add_site'),(6,'Can change site',2,'change_site'),(7,'Can delete site',2,'delete_site'),(8,'Can view site',2,'view_site'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add user',5,'add_user'),(18,'Can change user',5,'change_user'),(19,'Can delete user',5,'delete_user'),(20,'Can view user',5,'view_user'),(21,'Can add content type',6,'add_contenttype'),(22,'Can change content type',6,'change_contenttype'),(23,'Can delete content type',6,'delete_contenttype'),(24,'Can view content type',6,'view_contenttype'),(25,'Can add session',7,'add_session'),(26,'Can change session',7,'change_session'),(27,'Can delete session',7,'delete_session'),(28,'Can view session',7,'view_session'),(29,'Can add container',8,'add_container'),(30,'Can change container',8,'change_container'),(31,'Can delete container',8,'delete_container'),(32,'Can view container',8,'view_container'),(33,'Can add osn10m view',9,'add_osn10mview'),(34,'Can change osn10m view',9,'change_osn10mview'),(35,'Can delete osn10m view',9,'delete_osn10mview'),(36,'Can view osn10m view',9,'view_osn10mview');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$KdfK7skKLPQTcw9P0q45x5$ZN/bwRtVcpqUdzuLKz95MTIF7CXmOwR7zQHiHOuErUI=','2025-11-07 18:29:32.657139',1,'ram','','','alextutya@gmail.com',1,1,'2025-11-05 14:20:29.759831');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `constr_pr_types`
--

DROP TABLE IF EXISTS `constr_pr_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `constr_pr_types` (
  `idConstr_pr_types` int NOT NULL,
  `Type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idConstr_pr_types`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `constr_pr_types`
--

LOCK TABLES `constr_pr_types` WRITE;
/*!40000 ALTER TABLE `constr_pr_types` DISABLE KEYS */;
INSERT INTO `constr_pr_types` VALUES (1,'Профиль квадратный'),(2,'Профиль прямоугольный'),(3,'Швеллер'),(4,'Уголок горячекатанный');
/*!40000 ALTER TABLE `constr_pr_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `container`
--

DROP TABLE IF EXISTS `container`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `container` (
  `idcontainer` int NOT NULL,
  `ContainerLength` int DEFAULT NULL,
  `ContainerWidth` int DEFAULT NULL,
  `ContainerHeight` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idcontainer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `container`
--

LOCK TABLES `container` WRITE;
/*!40000 ALTER TABLE `container` DISABLE KEYS */;
INSERT INTO `container` VALUES (1,9,2900,'3000'),(2,10,2900,'3000'),(3,12,3400,'3200'),(4,14,3400,'3200');
/*!40000 ALTER TABLE `container` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(4,'auth','group'),(3,'auth','permission'),(5,'auth','user'),(6,'contenttypes','contenttype'),(8,'dvsr','container'),(9,'dvsr','osn10mview'),(7,'sessions','session'),(2,'sites','site');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-11-05 12:18:45.052476'),(2,'auth','0001_initial','2025-11-05 12:18:45.850749'),(3,'admin','0001_initial','2025-11-05 12:18:46.101791'),(4,'admin','0002_logentry_remove_auto_add','2025-11-05 12:18:46.110038'),(5,'admin','0003_logentry_add_action_flag_choices','2025-11-05 12:18:46.118330'),(6,'contenttypes','0002_remove_content_type_name','2025-11-05 12:18:46.233695'),(7,'auth','0002_alter_permission_name_max_length','2025-11-05 12:18:46.312174'),(8,'auth','0003_alter_user_email_max_length','2025-11-05 12:18:46.335040'),(9,'auth','0004_alter_user_username_opts','2025-11-05 12:18:46.343014'),(10,'auth','0005_alter_user_last_login_null','2025-11-05 12:18:46.406655'),(11,'auth','0006_require_contenttypes_0002','2025-11-05 12:18:46.412026'),(12,'auth','0007_alter_validators_add_error_messages','2025-11-05 12:18:46.420177'),(13,'auth','0008_alter_user_username_max_length','2025-11-05 12:18:46.497083'),(14,'auth','0009_alter_user_last_name_max_length','2025-11-05 12:18:46.577526'),(15,'auth','0010_alter_group_name_max_length','2025-11-05 12:18:46.598615'),(16,'auth','0011_update_proxy_permissions','2025-11-05 12:18:46.606806'),(17,'auth','0012_alter_user_first_name_max_length','2025-11-05 12:18:46.683577'),(18,'sessions','0001_initial','2025-11-05 12:18:46.732544'),(19,'sites','0001_initial','2025-11-05 12:18:46.768036'),(20,'sites','0002_alter_domain_unique','2025-11-05 12:18:46.791758');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0u5o6ivpwn5q9qhy6qz2qer54vb1qobg','.eJxVjMsOwiAQRf-FtSE8WgZcuvcbyAwwUjU0Ke3K-O_apAvd3nPOfYmI21rj1ssSpyzOQovT70aYHqXtIN-x3WaZ5rYuE8ldkQft8jrn8rwc7t9BxV6_dQE76sTARKSMMtkab4EH9oHBBEc6-ARuUKgtjYTFAYRg2TBopX0W7w_Z3DdU:1vGeNY:6obDCU_OZxoHODiZD0Fd_yOfEO8iVJu1j6G2b_hbK84','2025-11-19 14:20:52.954991'),('jy82rdgk1cs69c5jnlbelvfkyp2yue22','.eJxVjEsOwiAUAO_C2pDHt9Sl-56B8HggVQNJaVfGuxuSLnQ7M5k38-HYiz962vxK7MoEu_wyDPGZ6hD0CPXeeGx131bkI-Gn7XxplF63s_0blNDL2OoMAgQJp4ywkwNJghzOOiDOoLNFgzZE0NIa52iClEEnqYyVEZTT7PMFtDQ2nA:1vHRDI:__najt0mM2KU0NFAumU-AVUKO-8uI5gqy3NoIDK4zW0','2025-11-21 18:29:32.663355');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drycoolers`
--

DROP TABLE IF EXISTS `drycoolers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drycoolers` (
  `idDryCoolers` int NOT NULL,
  `DryCoolerType` varchar(45) DEFAULT NULL,
  `DrycoolerLength` int DEFAULT NULL,
  `DrycoolerWidth` varchar(45) DEFAULT NULL,
  `DryCoolerHeight` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idDryCoolers`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drycoolers`
--

LOCK TABLES `drycoolers` WRITE;
/*!40000 ALTER TABLE `drycoolers` DISABLE KEYS */;
/*!40000 ALTER TABLE `drycoolers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `edizmer`
--

DROP TABLE IF EXISTS `edizmer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `edizmer` (
  `idedizmer` int NOT NULL,
  `edizmer` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idedizmer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edizmer`
--

LOCK TABLES `edizmer` WRITE;
/*!40000 ALTER TABLE `edizmer` DISABLE KEYS */;
INSERT INTO `edizmer` VALUES (1,'м.'),(2,'шт.');
/*!40000 ALTER TABLE `edizmer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gpu`
--

DROP TABLE IF EXISTS `gpu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gpu` (
  `idGPU` int NOT NULL,
  `OrderNumber` varchar(45) DEFAULT NULL,
  `OrderCompany` varchar(45) DEFAULT NULL,
  `GPUName` varchar(45) DEFAULT NULL,
  `MotorType` varchar(45) DEFAULT NULL,
  `Utilization` tinyint(1) DEFAULT NULL,
  `GPUContainerType` int DEFAULT NULL,
  `TransformatorContainer` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idGPU`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gpu`
--

LOCK TABLES `gpu` WRITE;
/*!40000 ALTER TABLE `gpu` DISABLE KEYS */;
/*!40000 ALTER TABLE `gpu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `liststal`
--

DROP TABLE IF EXISTS `liststal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `liststal` (
  `idlist-stal` int NOT NULL,
  `code1c` varchar(45) DEFAULT NULL,
  `naimenovanie` varchar(45) DEFAULT NULL,
  `edizmer` int DEFAULT NULL,
  PRIMARY KEY (`idlist-stal`),
  UNIQUE KEY `code1c_UNIQUE` (`code1c`),
  UNIQUE KEY `naimenovanie_UNIQUE` (`naimenovanie`),
  KEY `edizmer_idx` (`edizmer`),
  CONSTRAINT `edimer_list` FOREIGN KEY (`edizmer`) REFERENCES `edizmer` (`idedizmer`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `liststal`
--

LOCK TABLES `liststal` WRITE;
/*!40000 ALTER TABLE `liststal` DISABLE KEYS */;
/*!40000 ALTER TABLE `liststal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `osn_10m_view`
--

DROP TABLE IF EXISTS `osn_10m_view`;
/*!50001 DROP VIEW IF EXISTS `osn_10m_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `osn_10m_view` AS SELECT 
 1 AS `materials_osn_10m`,
 1 AS `code1c`,
 1 AS `naimenovanie`,
 1 AS `type`,
 1 AS `gost`,
 1 AS `kolichestvo`,
 1 AS `edizmer`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `osnovanie_10m`
--

DROP TABLE IF EXISTS `osnovanie_10m`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `osnovanie_10m` (
  `materials_osn_10m` int NOT NULL,
  `naimenovanie_10m` varchar(45) NOT NULL,
  `kolichestvo` float DEFAULT NULL,
  PRIMARY KEY (`materials_osn_10m`,`naimenovanie_10m`),
  KEY `osn_10_naimenovanie_IDX` (`naimenovanie_10m`) /*!80000 INVISIBLE */
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `osnovanie_10m`
--

LOCK TABLES `osnovanie_10m` WRITE;
/*!40000 ALTER TABLE `osnovanie_10m` DISABLE KEYS */;
INSERT INTO `osnovanie_10m` VALUES (1,'8',40),(2,'9',100);
/*!40000 ALTER TABLE `osnovanie_10m` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profilestal`
--

DROP TABLE IF EXISTS `profilestal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profilestal` (
  `idprofileStal` int NOT NULL,
  `code1c` varchar(65) DEFAULT NULL,
  `naimenovanie` varchar(65) DEFAULT NULL,
  `type` int DEFAULT NULL,
  `gost` varchar(45) DEFAULT NULL,
  `edizmer` int DEFAULT NULL,
  PRIMARY KEY (`idprofileStal`),
  UNIQUE KEY `naimenovanie_UNIQUE` (`naimenovanie`),
  KEY `profile_type_idx` (`type`),
  KEY `code1c_idx` (`code1c`) /*!80000 INVISIBLE */,
  KEY `gost_idx` (`gost`),
  KEY `profile_edizmer_idx` (`edizmer`),
  CONSTRAINT `profile_edizmer_idx` FOREIGN KEY (`edizmer`) REFERENCES `edizmer` (`idedizmer`),
  CONSTRAINT `profile_type` FOREIGN KEY (`type`) REFERENCES `constr_pr_types` (`idConstr_pr_types`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profilestal`
--

LOCK TABLES `profilestal` WRITE;
/*!40000 ALTER TABLE `profilestal` DISABLE KEYS */;
INSERT INTO `profilestal` VALUES (1,'00-00025267','Швеллер горячекатанный 16U',3,'ГОСТ 8240-97',1),(2,'00-00024040','Швеллер горячекатанный 14U',3,'ГОСТ 8240-97',1),(3,'0','Швеллер горячекатанный 12U',3,'ГОСТ 8240-97',1),(4,'0','Профиль квадратный 150x150x5',1,'ГОСТ 8645-68 09Г2С',1),(5,'0','Профиль квадратный 100x100x5',1,'ГОСТ 30245-2003 / 10 ГОСТ 1050-2013',1),(6,'0','Профиль квадратны 50x50x3',1,'ГОСТ 30245-2003 / 10 ГОСТ 1050-2013',1),(7,'0','Профиль прямоугольный 200x100x5',2,'ГОСТ 8645-68 09Г2С',1),(8,'00-00036679','Профиль прямоугольный 150x100x5',2,'ГОСТ 8645-68 09Г2С',1),(9,'00-00020238','Профиль прямоугольный 100x50x4',2,'ГОСТ 30245-2003 / 10 ГОСТ 1050-2013',1),(10,'0','Профиль прямоугольный 80x40x3',2,'ГОСТ 30245-2003 / 10 ГОСТ 1050-2013',1),(11,'0','Профиль прямоугольный 60x30x2',2,'ГОСТ 30245-2003 / 10 ГОСТ 1050-2013',1),(12,'0','Профиль прямоугольный 40x20x2',2,'ГОСТ 30245-2003 / 10 ГОСТ 1050-2013',1),(13,'00-00032279','Уголок 100x100x7',4,'ГОСТ 8509-93 / Ст0 ГОСТ 535-2005',1),(14,'00-00026032','Уголок 75x75x5',4,'ГОСТ 8509-93 / Ст0 ГОСТ 535-2005',1),(15,'0','Уголок 50x50x3',4,'ГОСТ 8509-93 / Ст0 ГОСТ 535-2005',1);
/*!40000 ALTER TABLE `profilestal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trubi`
--

DROP TABLE IF EXISTS `trubi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trubi` (
  `idTrubi` int NOT NULL,
  `TrubiType` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_ru_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`idTrubi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trubi`
--

LOCK TABLES `trubi` WRITE;
/*!40000 ALTER TABLE `trubi` DISABLE KEYS */;
/*!40000 ALTER TABLE `trubi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `osn_10m_view`
--

/*!50001 DROP VIEW IF EXISTS `osn_10m_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `osn_10m_view` AS select `osnovanie_10m`.`materials_osn_10m` AS `materials_osn_10m`,`profilestal`.`code1c` AS `code1c`,`profilestal`.`naimenovanie` AS `naimenovanie`,`constr_pr_types`.`Type` AS `type`,`profilestal`.`gost` AS `gost`,`osnovanie_10m`.`kolichestvo` AS `kolichestvo`,`edizmer`.`edizmer` AS `edizmer` from (((`osnovanie_10m` join `profilestal` on((`osnovanie_10m`.`naimenovanie_10m` = `profilestal`.`idprofileStal`))) join `edizmer` on((`profilestal`.`edizmer` = `edizmer`.`idedizmer`))) left join `constr_pr_types` on((`profilestal`.`type` = `constr_pr_types`.`idConstr_pr_types`))) order by `osnovanie_10m`.`materials_osn_10m` */;
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

-- Dump completed on 2025-11-09 21:46:08
