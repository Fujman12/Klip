-- MySQL dump 10.13  Distrib 5.6.35, for osx10.9 (x86_64)
--
-- Host: localhost    Database: mydb
-- ------------------------------------------------------
-- Server version	5.6.35

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add association',7,'add_association'),(20,'Can change association',7,'change_association'),(21,'Can delete association',7,'delete_association'),(22,'Can add code',8,'add_code'),(23,'Can change code',8,'change_code'),(24,'Can delete code',8,'delete_code'),(25,'Can add nonce',9,'add_nonce'),(26,'Can change nonce',9,'change_nonce'),(27,'Can delete nonce',9,'delete_nonce'),(28,'Can add user social auth',10,'add_usersocialauth'),(29,'Can change user social auth',10,'change_usersocialauth'),(30,'Can delete user social auth',10,'delete_usersocialauth'),(31,'Can add partial',11,'add_partial'),(32,'Can change partial',11,'change_partial'),(33,'Can delete partial',11,'delete_partial'),(34,'Can add profile',12,'add_profile'),(35,'Can change profile',12,'change_profile'),(36,'Can delete profile',12,'delete_profile'),(37,'Can add deal',13,'add_deal'),(38,'Can change deal',13,'change_deal'),(39,'Can delete deal',13,'delete_deal'),(40,'Can add dispensary',14,'add_dispensary'),(41,'Can change dispensary',14,'change_dispensary'),(42,'Can delete dispensary',14,'delete_dispensary'),(43,'Can add review',15,'add_review'),(44,'Can change review',15,'change_review'),(45,'Can delete review',15,'delete_review');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$36000$dtl75G7l5c5f$2rgVbhmeEoLCelZbq+RhyaE7pZBekmFuMCKqjuw1Dw4=','2017-06-13 21:43:18.975728',1,'admin','','','armenbizz@gmail.com',1,1,'2017-06-13 21:43:06.861654'),(2,'!TmHVc7zI25d0jfYwZYKnKbIiVcdRTpnTyhdYmRYW','2017-06-15 16:02:55.559821',0,'ArmenMartikyan','Armen','Martikyan','gogo@mail.ru',0,1,'2017-06-14 08:35:20.759204'),(3,'!NIVDUTMNPp43b2mvoNWzeeGoyX2gHlMDAHDDt7PV','2017-06-14 20:18:55.090528',0,'ArmennnnnArmen','Armen','','',0,1,'2017-06-14 20:16:47.575150'),(4,'!rRMKiEPZzKxBqjbWHQljJV3UBtjY9ZuYyzwom4AY','2017-06-14 20:19:18.801825',0,'armenbizz','Армен','Мартикян','armenbizz@gmail.com',0,1,'2017-06-14 20:19:18.784568');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-06-13 21:43:52.170142','1','Dispensary object',1,'[{\"added\": {}}]',14,1),(2,'2017-06-13 21:44:16.129299','2','Dispensary object',1,'[{\"added\": {}}]',14,1),(3,'2017-06-13 21:53:56.586453','1','First_deal - asdas _gogogo provided by first',1,'[{\"added\": {}}]',13,1),(4,'2017-06-13 21:54:16.240346','2','second deal - sadfdf provided by second',1,'[{\"added\": {}}]',13,1),(5,'2017-06-13 21:55:24.390627','3','third disp - sdfsdf',1,'[{\"added\": {}}]',14,1),(6,'2017-06-13 21:55:50.200565','3','third deal - third disp provided by third disp',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(13,'main_app','deal'),(14,'main_app','dispensary'),(15,'main_app','review'),(6,'sessions','session'),(7,'social_django','association'),(8,'social_django','code'),(9,'social_django','nonce'),(11,'social_django','partial'),(10,'social_django','usersocialauth'),(12,'users_app','profile');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-06-13 21:37:46.560801'),(2,'auth','0001_initial','2017-06-13 21:37:46.950204'),(3,'admin','0001_initial','2017-06-13 21:37:47.050633'),(4,'admin','0002_logentry_remove_auto_add','2017-06-13 21:37:47.091726'),(5,'contenttypes','0002_remove_content_type_name','2017-06-13 21:37:47.165514'),(6,'auth','0002_alter_permission_name_max_length','2017-06-13 21:37:47.203535'),(7,'auth','0003_alter_user_email_max_length','2017-06-13 21:37:47.247415'),(8,'auth','0004_alter_user_username_opts','2017-06-13 21:37:47.271316'),(9,'auth','0005_alter_user_last_login_null','2017-06-13 21:37:47.312179'),(10,'auth','0006_require_contenttypes_0002','2017-06-13 21:37:47.323269'),(11,'auth','0007_alter_validators_add_error_messages','2017-06-13 21:37:47.343460'),(12,'auth','0008_alter_user_username_max_length','2017-06-13 21:37:47.406098'),(13,'main_app','0001_initial','2017-06-13 21:37:47.519599'),(14,'sessions','0001_initial','2017-06-13 21:37:47.571238'),(15,'default','0001_initial','2017-06-13 21:37:48.000839'),(16,'social_auth','0001_initial','2017-06-13 21:37:48.011252'),(17,'default','0002_add_related_name','2017-06-13 21:37:48.071436'),(18,'social_auth','0002_add_related_name','2017-06-13 21:37:48.077479'),(19,'default','0003_alter_email_max_length','2017-06-13 21:37:48.113674'),(20,'social_auth','0003_alter_email_max_length','2017-06-13 21:37:48.125508'),(21,'default','0004_auto_20160423_0400','2017-06-13 21:37:48.147534'),(22,'social_auth','0004_auto_20160423_0400','2017-06-13 21:37:48.160396'),(23,'social_auth','0005_auto_20160727_2333','2017-06-13 21:37:48.191859'),(24,'social_django','0006_partial','2017-06-13 21:37:48.242629'),(25,'users_app','0001_initial','2017-06-13 21:37:48.310765'),(26,'users_app','0002_profile_phone_number','2017-06-13 21:37:48.355168'),(27,'users_app','0003_auto_20170609_2051','2017-06-13 21:37:48.405632'),(28,'users_app','0004_auto_20170609_2054','2017-06-13 21:37:48.442491'),(29,'users_app','0005_auto_20170609_2056','2017-06-13 21:37:48.527514'),(30,'users_app','0006_auto_20170609_2104','2017-06-13 21:37:48.576392'),(31,'users_app','0007_profile_avatar','2017-06-13 21:37:48.622893'),(32,'social_django','0003_alter_email_max_length','2017-06-13 21:37:48.646472'),(33,'social_django','0002_add_related_name','2017-06-13 21:37:48.660358'),(34,'social_django','0005_auto_20160727_2333','2017-06-13 21:37:48.669374'),(35,'social_django','0001_initial','2017-06-13 21:37:48.677002'),(36,'social_django','0004_auto_20160423_0400','2017-06-13 21:37:48.684219'),(37,'main_app','0002_auto_20170616_2333','2017-06-16 23:33:15.466524'),(38,'main_app','0003_auto_20170617_0055','2017-06-17 00:56:02.944571');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('4opzzdf69o5h4xxike3u8j65hdtyza3a','ZDFiNTRmOTljZDQ3NWIzOGFmZGViM2ZlZTgzM2NjMjdkY2I4NDZlNTp7ImZhY2Vib29rX3N0YXRlIjoiNElPSnREYllkR1lQekJUa2luYWZoTm1NUk9mazh6bTUiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InNvY2lhbF9jb3JlLmJhY2tlbmRzLmZhY2Vib29rLkZhY2Vib29rT0F1dGgyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjkxMjEzOWRmZTVjZDlmYWJlYmEzNWM3NDg0MGMxNGY5MTViOTdkZCIsInNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZCI6ImZhY2Vib29rIn0=','2017-06-29 16:02:55.565635'),('yl19itfp3q68pixhh597jhxf0euykl72','NTE5YmMwNzlkYWM2Zjk3ZTE2OWUwMTkxZTYyOWIxYjVjOTIwYjE3Zjp7ImZhY2Vib29rX3N0YXRlIjoiRGVOa2lqRFdKVGZoNUsya2J4MjFad01VbmxMTlhDdXAiLCJfYXV0aF91c2VyX2lkIjoiMiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6InNvY2lhbF9jb3JlLmJhY2tlbmRzLmZhY2Vib29rLkZhY2Vib29rT0F1dGgyIiwiX2F1dGhfdXNlcl9oYXNoIjoiNjkxMjEzOWRmZTVjZDlmYWJlYmEzNWM3NDg0MGMxNGY5MTViOTdkZCIsInNvY2lhbF9hdXRoX2xhc3RfbG9naW5fYmFja2VuZCI6ImZhY2Vib29rIn0=','2017-06-28 20:20:32.712134');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_deal`
--

DROP TABLE IF EXISTS `main_app_deal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_deal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(150) NOT NULL,
  `description` longtext NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `likes` int(11) NOT NULL,
  `dislikes` int(11) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `date_starts` date NOT NULL,
  `date_expires` date NOT NULL,
  `dispensary_id` int(11) NOT NULL,
  `old_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `main_app_deal_dispensary_id_6b103a34_fk_main_app_dispensary_id` (`dispensary_id`),
  CONSTRAINT `main_app_deal_dispensary_id_6b103a34_fk_main_app_dispensary_id` FOREIGN KEY (`dispensary_id`) REFERENCES `main_app_dispensary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_deal`
--

LOCK TABLES `main_app_deal` WRITE;
/*!40000 ALTER TABLE `main_app_deal` DISABLE KEYS */;
INSERT INTO `main_app_deal` VALUES (1,'First_deal','asdas _gogogo',0.08,6,4,'2017-06-13 21:53:56.584486','2017-06-13','2017-07-13',1,NULL),(2,'second deal','sadfdf',0.03,0,0,'2017-06-13 21:54:16.239576','2017-06-13','2017-07-13',2,NULL),(3,'third deal','third disp',0.02,3,1,'2017-06-13 21:55:50.199878','2017-06-13','2017-07-13',3,NULL);
/*!40000 ALTER TABLE `main_app_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_dispensary`
--

DROP TABLE IF EXISTS `main_app_dispensary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_dispensary` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `description` longtext NOT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_dispensary`
--

LOCK TABLES `main_app_dispensary` WRITE;
/*!40000 ALTER TABLE `main_app_dispensary` DISABLE KEYS */;
INSERT INTO `main_app_dispensary` VALUES (1,'first','sdf','fsdf','fsdf',37.3,-122),(2,'second','sdf','fsfsadf','sdfsdf',37.1,-122.1),(3,'third disp','sdfdf','sdfdsf','sdfsdf',39,-122);
/*!40000 ALTER TABLE `main_app_dispensary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_review`
--

DROP TABLE IF EXISTS `main_app_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` longtext NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `deal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_app_review_deal_id_75d3c480_fk_main_app_deal_id` (`deal_id`),
  KEY `main_app_review_user_id_d5174122_fk_auth_user_id` (`user_id`),
  CONSTRAINT `main_app_review_deal_id_75d3c480_fk_main_app_deal_id` FOREIGN KEY (`deal_id`) REFERENCES `main_app_deal` (`id`),
  CONSTRAINT `main_app_review_user_id_d5174122_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_review`
--

LOCK TABLES `main_app_review` WRITE;
/*!40000 ALTER TABLE `main_app_review` DISABLE KEYS */;
INSERT INTO `main_app_review` VALUES (1,'fsd','2017-06-16 23:33:23.819815',1,2),(2,'fsdfdsf','2017-06-17 00:10:58.288540',1,2),(3,'sdf','2017-06-17 00:11:42.133954',1,2),(4,'fsd','2017-06-17 00:12:01.266679',1,2),(5,'fsd','2017-06-17 00:12:30.379062',1,2),(6,'fsd','2017-06-17 00:15:48.490479',1,2),(7,'fsdasd','2017-06-17 00:16:03.180568',1,2),(8,'dfsdf','2017-06-17 00:20:36.914593',1,2),(9,'sdff','2017-06-17 00:24:41.832137',1,2),(10,'fsd','2017-06-17 00:25:27.967256',1,2),(11,'fs','2017-06-17 00:27:35.424737',1,2),(12,'fds','2017-06-17 00:30:13.442906',1,2),(13,'fdsfsd','2017-06-17 00:32:34.162302',1,2),(14,'fds','2017-06-17 00:33:13.783028',1,2),(15,'fdsfsd','2017-06-17 00:35:58.957744',1,2),(16,'fsd','2017-06-17 00:37:46.271836',1,2),(17,'gogogog','2017-06-17 00:46:24.889676',1,2),(18,'gogogog','2017-06-17 00:46:32.560206',1,2),(19,'gogogog','2017-06-17 00:46:34.755535',1,2),(20,'This was the best stuff I ever got in my life. \r\nThanks','2017-06-17 00:47:16.709508',1,2),(21,'as\r\nd\r\nas\r\nda\r\nsd\r\nas\r\nd','2017-06-17 00:50:00.234402',1,2),(22,'fsdfsd','2017-06-17 00:51:27.581058',1,2),(23,'fsdfsd','2017-06-17 00:52:43.995490',1,2),(24,'fsd','2017-06-17 00:53:04.190177',1,2),(25,'fds','2017-06-17 00:53:19.403402',1,2),(26,'fsdfsdf','2017-06-17 00:53:23.641710',1,2);
/*!40000 ALTER TABLE `main_app_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_association`
--

DROP TABLE IF EXISTS `social_auth_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_association` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `handle` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `issued` int(11) NOT NULL,
  `lifetime` int(11) NOT NULL,
  `assoc_type` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_association_server_url_handle_078befa2_uniq` (`server_url`,`handle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_association`
--

LOCK TABLES `social_auth_association` WRITE;
/*!40000 ALTER TABLE `social_auth_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_code`
--

DROP TABLE IF EXISTS `social_auth_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(254) NOT NULL,
  `code` varchar(32) NOT NULL,
  `verified` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_code_email_code_801b2d02_uniq` (`email`,`code`),
  KEY `social_auth_code_code_a2393167` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_code`
--

LOCK TABLES `social_auth_code` WRITE;
/*!40000 ALTER TABLE `social_auth_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_nonce`
--

DROP TABLE IF EXISTS `social_auth_nonce`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_nonce` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `server_url` varchar(255) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `salt` varchar(65) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_nonce_server_url_timestamp_salt_f6284463_uniq` (`server_url`,`timestamp`,`salt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_nonce`
--

LOCK TABLES `social_auth_nonce` WRITE;
/*!40000 ALTER TABLE `social_auth_nonce` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_nonce` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_partial`
--

DROP TABLE IF EXISTS `social_auth_partial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_partial` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(32) NOT NULL,
  `next_step` smallint(5) unsigned NOT NULL,
  `backend` varchar(32) NOT NULL,
  `data` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `social_auth_partial_token_3017fea3` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_partial`
--

LOCK TABLES `social_auth_partial` WRITE;
/*!40000 ALTER TABLE `social_auth_partial` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_auth_partial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `social_auth_usersocialauth`
--

DROP TABLE IF EXISTS `social_auth_usersocialauth`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `social_auth_usersocialauth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `provider` varchar(32) NOT NULL,
  `uid` varchar(255) NOT NULL,
  `extra_data` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `social_auth_usersocialauth_provider_uid_e6b5e668_uniq` (`provider`,`uid`),
  KEY `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` (`user_id`),
  CONSTRAINT `social_auth_usersocialauth_user_id_17d28448_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (1,'facebook','1963052863981447','{\"auth_time\": 1497650720, \"id\": \"1963052863981447\", \"expires\": 5181549, \"granted_scopes\": [\"public_profile\"], \"denied_scopes\": null, \"access_token\": \"EAADzMVSGza0BAImiCsiQ6x4dMTZBQmV677KhlbVauZCve1ZBWRJxkbOWz8EnyOgOWVRZAsVSXCRpzC0US3DuOpUfMMT08yNtGNWjc17tH6DTRL5vCZBbM0jiUWBtrqna7QOgjsnNUdGRKsvRrMFWZBZAGGiLjwHaRh7D9VkexMHLAZDZD\", \"token_type\": null}',2),(2,'twitter','3361355566','{\"auth_time\": 1497471534, \"id\": 3361355566, \"access_token\": {\"oauth_token\": \"3361355566-GuLP24f1pV98Lr6d2xdqjquQpj1LOASLGVUbh6q\", \"oauth_token_secret\": \"npuLptEpUvXdKW4odwsScglmk1QCBEjHdxal1cSiEIaAR\", \"user_id\": \"3361355566\", \"screen_name\": \"ArmennnnnArmen\", \"x_auth_expires\": \"0\"}}',3),(3,'google-oauth2','armenbizz@gmail.com','{\"auth_time\": 1497471558, \"expires\": 3600, \"token_type\": \"Bearer\", \"access_token\": \"ya29.GltpBGXkqSXi_WMskDKsKvKEa-HEoU1ZK88ls766_lNaF1QfIAiBNqmCvDTWzA0-mKDPFxamIOmEaByPLc11QLpmItrZ4CiTITLytmpRrOxNfhuUn16OhQQ24ThG\"}',4);
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_app_profile`
--

DROP TABLE IF EXISTS `users_app_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_app_profile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street_address` varchar(90) DEFAULT NULL,
  `apt_unit` varchar(10) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `zipcode` varchar(5) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(35) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `users_app_profile_user_id_14b76bc0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_app_profile`
--

LOCK TABLES `users_app_profile` WRITE;
/*!40000 ALTER TABLE `users_app_profile` DISABLE KEYS */;
INSERT INTO `users_app_profile` VALUES (1,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,''),(2,NULL,NULL,NULL,NULL,NULL,NULL,2,NULL,'user_2/Снимок_экрана_2017-04-04_в_15.29.52.png'),(3,NULL,NULL,NULL,NULL,NULL,NULL,3,NULL,''),(4,NULL,NULL,NULL,NULL,NULL,NULL,4,NULL,'');
/*!40000 ALTER TABLE `users_app_profile` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-06-17 13:15:37
