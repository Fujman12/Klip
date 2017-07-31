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
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can add permission',2,'add_permission'),(5,'Can change permission',2,'change_permission'),(6,'Can delete permission',2,'delete_permission'),(7,'Can add group',3,'add_group'),(8,'Can change group',3,'change_group'),(9,'Can delete group',3,'delete_group'),(10,'Can add user',4,'add_user'),(11,'Can change user',4,'change_user'),(12,'Can delete user',4,'delete_user'),(13,'Can add content type',5,'add_contenttype'),(14,'Can change content type',5,'change_contenttype'),(15,'Can delete content type',5,'delete_contenttype'),(16,'Can add session',6,'add_session'),(17,'Can change session',6,'change_session'),(18,'Can delete session',6,'delete_session'),(19,'Can add association',7,'add_association'),(20,'Can change association',7,'change_association'),(21,'Can delete association',7,'delete_association'),(22,'Can add code',8,'add_code'),(23,'Can change code',8,'change_code'),(24,'Can delete code',8,'delete_code'),(25,'Can add nonce',9,'add_nonce'),(26,'Can change nonce',9,'change_nonce'),(27,'Can delete nonce',9,'delete_nonce'),(28,'Can add user social auth',10,'add_usersocialauth'),(29,'Can change user social auth',10,'change_usersocialauth'),(30,'Can delete user social auth',10,'delete_usersocialauth'),(31,'Can add partial',11,'add_partial'),(32,'Can change partial',11,'change_partial'),(33,'Can delete partial',11,'delete_partial'),(34,'Can add profile',12,'add_profile'),(35,'Can change profile',12,'change_profile'),(36,'Can delete profile',12,'delete_profile'),(37,'Can add deal',13,'add_deal'),(38,'Can change deal',13,'change_deal'),(39,'Can delete deal',13,'delete_deal'),(40,'Can add dispensary',14,'add_dispensary'),(41,'Can change dispensary',14,'change_dispensary'),(42,'Can delete dispensary',14,'delete_dispensary'),(43,'Can add review',15,'add_review'),(44,'Can change review',15,'change_review'),(45,'Can delete review',15,'delete_review'),(46,'Can add location',16,'add_location'),(47,'Can change location',16,'change_location'),(48,'Can delete location',16,'delete_location'),(49,'Can add deal image',17,'add_dealimage'),(50,'Can change deal image',17,'change_dealimage'),(51,'Can delete deal image',17,'delete_dealimage'),(52,'Can add coupon',18,'add_coupon'),(53,'Can change coupon',18,'change_coupon'),(54,'Can delete coupon',18,'delete_coupon');
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
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (26,'pbkdf2_sha256$36000$XJl8Y0UefmsY$S8BevapcDvfesdkIRlxK5xAlVNirOv2AV3JakUtWCQs=','2017-07-29 23:11:30.602570',1,'admin','','','armenbizz@gmail.com',1,1,'2017-07-11 16:33:27.739389'),(27,'pbkdf2_sha256$36000$XWpbkrYHuL63$b2XWQ68sKayLMCvN6rnwo4Ikb0TDFI7vGn7ClByGOx0=',NULL,0,'dsf','dsf','jdf','a@a.ua',0,1,'2017-07-11 16:34:00.037747'),(28,'pbkdf2_sha256$36000$TvKxklRzb3NB$DBZoHX3IapHvN3kNlyfBEx56odxtFNa0BO10BHYORIU=','2017-07-21 14:41:42.930793',0,'sdfsadf','sdfsadf','sdfasdf','i@i.ua',0,1,'2017-07-11 17:17:54.015624'),(29,'!9HOXlyHFWFI8FMq0iQF6jKIly0tHFOBVIROntDkc','2017-07-22 14:40:55.357542',0,'ArmennnnnArmen','Armen','','',0,1,'2017-07-14 17:46:01.166359'),(30,'!Uu66eb6PHBS7IUFPJT2hRHDUznksTqylVaIbHIaM','2017-07-22 14:41:26.226584',0,'armenbizz','Армен','Мартикян','armenbizz@gmail.com',0,1,'2017-07-16 12:24:39.794581'),(31,'pbkdf2_sha256$36000$X3QkoRF97ZGi$glcK1iX7Hv05c2DCjadNHBXpEFctVOJfkVRb646ee7U=','2017-07-21 16:58:24.317197',0,'s','bla','s','l@l.ua',0,1,'2017-07-21 16:23:57.221498'),(32,'pbkdf2_sha256$36000$QZXnpNJt5yTx$uImnApL8M6E9a3pyo19kIDsSWUjvmBgqFHpRWquDzF0=','2017-07-21 16:59:34.841399',0,'fsdjfhakf','fsdjfhakf','fajskdfhasf','o@o.ua',0,1,'2017-07-21 16:59:22.241445'),(33,'pbkdf2_sha256$36000$UR7or1cgcNkW$nh+D9q0k2g7lUhxCjg/yV1QH5A731cyANxhpSTb4pgY=',NULL,0,'fhsadfhsak','fhsadfhsak','fksadhfasjd','j@j.ua',0,1,'2017-07-21 17:01:19.686129'),(35,'pbkdf2_sha256$36000$eITk1tqNqjLq$YvLjJWeJRKcXNtWh+jPtqUQzsBy8kryruvfBRj7w9Fg=','2017-07-21 17:02:21.350080',0,'sdfsadfffff','sdfsadfffff','fksadhfasjd','b@b.ua',0,1,'2017-07-21 17:02:09.606623'),(36,'pbkdf2_sha256$36000$siKTylvnZN0V$CicXPWDlG5heZp2CHd4CdTVqidhBQRTuRId9ASUvFXA=','2017-07-21 17:06:30.765373',0,'ahdf','ahdf','fsjdfh','h@h.ua',0,1,'2017-07-21 17:05:15.636072'),(37,'pbkdf2_sha256$36000$1gQmelfUplSi$Cy+NGV9p8h06DKIIJBHKOdQS8Q9MqpiD1UoV7FaRYko=','2017-07-21 17:09:00.691568',0,'fajkshfasjkdf','fajkshfasjkdf','fjaksdfhasdjfh','k@k.ua',0,1,'2017-07-21 17:08:45.048885'),(38,'pbkdf2_sha256$36000$N5AqkC9sRjNq$lr+Suko9o9OW3LssbupAw/2edpECQft/d/YHduipbdI=','2017-07-21 17:41:00.390487',0,'fasdjkfsaj','fasdjkfsaj','fjasdhf','g@g.ua',0,1,'2017-07-21 17:40:49.540414'),(39,'pbkdf2_sha256$36000$rzL0wfM8sddp$biilKe2wP2uANVKIVgFxcl4D2fCrSVHZnEJ39r9iIEU=','2017-07-31 08:07:12.136743',0,'Mike','Mikes','Hannigan','n@n.ua',0,1,'2017-07-21 17:57:56.319629'),(40,'!9QJikewoR15zHYos0pJk2RuCIF2Udm2VHNxNglbf','2017-07-27 16:58:46.651813',0,'bloginvestmonitor','Monitor','Invest','bloginvestmonitor@gmail.com',0,1,'2017-07-27 16:58:46.632171'),(41,'!1K1VkprzRgntuyLydmVwFm7KlCJP40BhDNynRcli','2017-07-31 00:11:28.695848',0,'fujman94','Нарек','Мартикян','fujman94@gmail.com',0,1,'2017-07-28 16:29:55.776291'),(44,'pbkdf2_sha256$36000$K8slIUuZkhRj$/IwL2wMpNS98dhDPIwOIeETkX7zMz3DWx9LB6u/c9VQ=','2017-07-30 14:39:01.515613',0,'Clark Mikes','Clark','Mikes','k@k.com',0,1,'2017-07-30 14:37:59.280618'),(45,'pbkdf2_sha256$36000$cCCGEbP9vfgv$d0o2A2HSs8BHmFvHoKVEBYLZLJ9/Q4cg/RRCNKNauIY=','2017-07-31 07:59:09.411388',0,'Clark Thompson','Clark','Thompson','meme@mail.com',0,1,'2017-07-30 21:11:58.166952');
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2017-07-27 17:42:35.280399','56','asdf - by My Dispensaryklk',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',13,26),(2,'2017-07-27 17:47:28.190299','78','sadf - by My Dispensaryklk',2,'[]',13,26),(3,'2017-07-27 17:47:35.714913','78','sadf - by My Dispensaryklk',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',13,26),(4,'2017-07-27 17:48:40.294142','68','234 - by My Dispensaryklk',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',13,26),(5,'2017-07-27 17:49:15.954256','44','New_ deals - by My Dispensaryklk',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',13,26),(6,'2017-07-28 20:25:19.606274','9','Нарек, Мартикян - new_deal_babe; 2017-07-28 20:18:43.323827+00:00',3,'',18,26),(7,'2017-07-28 20:25:19.614784','8','Нарек, Мартикян - new_deal_babe; 2017-07-28 17:22:34.998463+00:00',3,'',18,26),(8,'2017-07-28 20:25:19.616826','7','Нарек, Мартикян - new_deal_babe; 2017-07-28 17:22:12.247441+00:00',3,'',18,26),(9,'2017-07-28 20:25:19.618739','6','Нарек, Мартикян - new_deal_babe; 2017-07-28 17:16:03.569433+00:00',3,'',18,26),(10,'2017-07-28 20:25:19.620496','5','Нарек, Мартикян - new_deal_babe; 2017-07-28 17:14:03.461157+00:00',3,'',18,26),(11,'2017-07-28 20:25:19.622259','4','Нарек, Мартикян - new_deal_babe; 2017-07-28 17:13:05.732310+00:00',3,'',18,26),(12,'2017-07-28 20:25:19.624042','3','Нарек, Мартикян - new_deal_babe; 2017-07-28 17:03:24.068676+00:00',3,'',18,26),(13,'2017-07-28 20:25:19.625606','2','Нарек, Мартикян - new_deal_babe; 2017-07-28 16:43:26.409898+00:00',3,'',18,26),(14,'2017-07-28 20:25:19.626919','1','Нарек, Мартикян - new_deal_babe; 2017-07-28 16:40:09.264665+00:00',3,'',18,26),(15,'2017-07-29 23:15:37.177251','14','My Dispensaryklk - Kiev, Kiev',2,'[{\"changed\": {\"fields\": [\"secret\"]}}]',14,26),(16,'2017-07-30 13:41:44.691045','4','new_deal_babe - by Newpik',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',13,26),(17,'2017-07-30 14:38:53.991834','42','Clark',3,'',4,26),(18,'2017-07-30 14:41:21.104835','85','My deal title! Here\'s one - by Dispensary #1',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',13,26),(19,'2017-07-30 21:18:21.994858','16','New dispensary in Montebello - Bell Gardens, CA',2,'[{\"changed\": {\"fields\": [\"description\"]}}]',14,26),(20,'2017-07-30 21:20:54.398159','86','New Deal! Hurry up! - by New dispensary in Montebello',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',13,26),(21,'2017-07-30 22:36:52.792681','86','New Deal! Hurry up! - by New dispensary in Montebello',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',13,26),(22,'2017-07-30 22:46:45.641528','87','Deal #2 in Montebello! - by New dispensary in Montebello',2,'[{\"changed\": {\"fields\": [\"status\"]}}]',13,26);
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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(18,'main_app','coupon'),(13,'main_app','deal'),(17,'main_app','dealimage'),(14,'main_app','dispensary'),(16,'main_app','location'),(15,'main_app','review'),(6,'sessions','session'),(7,'social_django','association'),(8,'social_django','code'),(9,'social_django','nonce'),(11,'social_django','partial'),(10,'social_django','usersocialauth'),(12,'users_app','profile');
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
) ENGINE=InnoDB AUTO_INCREMENT=63 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2017-06-13 21:37:46.560801'),(2,'auth','0001_initial','2017-06-13 21:37:46.950204'),(3,'admin','0001_initial','2017-06-13 21:37:47.050633'),(4,'admin','0002_logentry_remove_auto_add','2017-06-13 21:37:47.091726'),(5,'contenttypes','0002_remove_content_type_name','2017-06-13 21:37:47.165514'),(6,'auth','0002_alter_permission_name_max_length','2017-06-13 21:37:47.203535'),(7,'auth','0003_alter_user_email_max_length','2017-06-13 21:37:47.247415'),(8,'auth','0004_alter_user_username_opts','2017-06-13 21:37:47.271316'),(9,'auth','0005_alter_user_last_login_null','2017-06-13 21:37:47.312179'),(10,'auth','0006_require_contenttypes_0002','2017-06-13 21:37:47.323269'),(11,'auth','0007_alter_validators_add_error_messages','2017-06-13 21:37:47.343460'),(12,'auth','0008_alter_user_username_max_length','2017-06-13 21:37:47.406098'),(13,'main_app','0001_initial','2017-06-13 21:37:47.519599'),(14,'sessions','0001_initial','2017-06-13 21:37:47.571238'),(15,'default','0001_initial','2017-06-13 21:37:48.000839'),(16,'social_auth','0001_initial','2017-06-13 21:37:48.011252'),(17,'default','0002_add_related_name','2017-06-13 21:37:48.071436'),(18,'social_auth','0002_add_related_name','2017-06-13 21:37:48.077479'),(19,'default','0003_alter_email_max_length','2017-06-13 21:37:48.113674'),(20,'social_auth','0003_alter_email_max_length','2017-06-13 21:37:48.125508'),(21,'default','0004_auto_20160423_0400','2017-06-13 21:37:48.147534'),(22,'social_auth','0004_auto_20160423_0400','2017-06-13 21:37:48.160396'),(23,'social_auth','0005_auto_20160727_2333','2017-06-13 21:37:48.191859'),(24,'social_django','0006_partial','2017-06-13 21:37:48.242629'),(25,'users_app','0001_initial','2017-06-13 21:37:48.310765'),(26,'users_app','0002_profile_phone_number','2017-06-13 21:37:48.355168'),(27,'users_app','0003_auto_20170609_2051','2017-06-13 21:37:48.405632'),(28,'users_app','0004_auto_20170609_2054','2017-06-13 21:37:48.442491'),(29,'users_app','0005_auto_20170609_2056','2017-06-13 21:37:48.527514'),(30,'users_app','0006_auto_20170609_2104','2017-06-13 21:37:48.576392'),(31,'users_app','0007_profile_avatar','2017-06-13 21:37:48.622893'),(32,'social_django','0003_alter_email_max_length','2017-06-13 21:37:48.646472'),(33,'social_django','0002_add_related_name','2017-06-13 21:37:48.660358'),(34,'social_django','0005_auto_20160727_2333','2017-06-13 21:37:48.669374'),(35,'social_django','0001_initial','2017-06-13 21:37:48.677002'),(36,'social_django','0004_auto_20160423_0400','2017-06-13 21:37:48.684219'),(37,'main_app','0002_auto_20170616_2333','2017-06-16 23:33:15.466524'),(38,'main_app','0003_auto_20170617_0055','2017-06-17 00:56:02.944571'),(39,'main_app','0004_auto_20170617_2255','2017-06-17 22:56:21.070089'),(40,'main_app','0005_auto_20170622_1444','2017-06-22 14:45:07.997608'),(41,'main_app','0006_auto_20170706_2054','2017-07-06 20:54:57.505270'),(42,'users_app','0008_auto_20170706_2054','2017-07-06 20:54:58.006905'),(43,'main_app','0007_auto_20170706_2055','2017-07-06 20:55:48.363940'),(44,'main_app','0008_auto_20170707_0823','2017-07-07 08:23:13.121755'),(45,'users_app','0009_auto_20170707_0823','2017-07-07 08:23:13.137895'),(46,'main_app','0009_auto_20170711_1504','2017-07-11 15:04:15.979291'),(47,'main_app','0010_auto_20170721_1700','2017-07-21 17:00:26.274081'),(48,'main_app','0011_auto_20170721_1732','2017-07-21 17:33:12.136630'),(49,'main_app','0012_auto_20170721_1732','2017-07-21 17:33:12.159048'),(50,'main_app','0013_auto_20170721_1739','2017-07-21 17:39:42.765287'),(51,'users_app','0010_profile_dispensary','2017-07-21 17:39:42.851229'),(52,'main_app','0014_auto_20170721_1748','2017-07-21 17:48:56.010133'),(53,'main_app','0015_auto_20170725_1516','2017-07-25 15:16:22.956145'),(54,'main_app','0016_auto_20170725_2123','2017-07-25 21:23:55.618154'),(55,'main_app','0017_auto_20170727_1656','2017-07-27 16:57:09.055196'),(56,'main_app','0018_auto_20170727_1705','2017-07-27 17:05:56.941128'),(57,'main_app','0019_auto_20170727_1745','2017-07-27 17:45:08.770479'),(58,'main_app','0020_auto_20170727_1747','2017-07-27 17:47:22.183291'),(59,'main_app','0021_auto_20170728_1627','2017-07-28 16:27:38.136724'),(60,'main_app','0022_auto_20170728_1641','2017-07-28 16:41:19.650894'),(61,'main_app','0023_auto_20170729_2248','2017-07-29 22:48:44.873259'),(62,'main_app','0024_auto_20170729_2308','2017-07-29 23:08:25.151386');
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
INSERT INTO `django_session` VALUES ('06qc5rd3fosq2rk4qxxhxogs7a7se5n5','ZDRiMmFiYmQ4Y2QxMTc4NmJiNTljMjY2MzkzZDg3YTE4YjU5YTU5ZDp7Il9jc3JmdG9rZW4iOiJyMUJidWNFZ2xzN0RwVm5neGZkOGgxT08zNGZmM2FpTkNWQmF6YXBYeVBLOGZNWmJ0TU45NTdvWnhHTXVSM1NzIiwiZmFjZWJvb2tfc3RhdGUiOiJEUkVJSnVCaEJoU1BOUUdJaU5Wa3dpbE1JUkEzY2xmSiIsInR3aXR0ZXJfc3RhdGUiOiJ5RnpIcGU0aGwzRFh4WXpvdVc4RUVrTmVWU0pOWFRleiIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6W10sIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMudHdpdHRlci5Ud2l0dGVyT0F1dGgiLCJfYXV0aF91c2VyX2hhc2giOiIwZDc4Y2YyY2NmZDQyMmM2ZTI0MzJiYWRhNDQzMDZhZTA0MGNjNzMyIiwic29jaWFsX2F1dGhfbGFzdF9sb2dpbl9iYWNrZW5kIjoidHdpdHRlciJ9','2017-07-06 14:56:47.489870'),('1zzcnctlnwua2h91kargq8eco4u30t8n','MzAzYWNhOTc2ODUwNmI4MmM2ZjVkZGQwNTQ2OGU0NTU2Y2U1OTllMTp7Il9hdXRoX3VzZXJfaWQiOiIyNiIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiM2Y0MDc0NjEyZjZhNTRhZmYxZmRlMjhmMDFjMzk0N2JhMzc0ODQxNCIsIl9jc3JmdG9rZW4iOiJEdzZjM200VmZxRUtKR2xRdlZwSXVnREZtT3NvRGc1SDJwZVo3TmJIZnBuY2NncHp2OEtCVFhoQjlDUjhWaFh2IiwiYWNjZXNzIjp0cnVlfQ==','2017-08-13 22:46:46.057158'),('2x2rbz1o8fuqmqhe61dzxgzk4r8yp6n1','NTBlOWQ2ZjRjMWE5NmFmN2JlMjkxNzBlODAxZjQ1MjgzYWFjMTNlMzp7Il9jc3JmdG9rZW4iOiJ2VWJHV3phM0pGSnVjdlBXWXBMN3d3cWJsN1V0UERIeDhSWFdkVVFFWDVSTXVNNGpQU3N0M3YxRUNvbU5KV3h4IiwiZ29vZ2xlLW9hdXRoMl9zdGF0ZSI6ImhvUHNaVFVvTWVKaGRMTGlUaVI0MmJaU0E4VEZicWQ3IiwiX2F1dGhfdXNlcl9pZCI6IjQxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMuZ29vZ2xlLkdvb2dsZU9BdXRoMiIsIl9hdXRoX3VzZXJfaGFzaCI6ImQzMWE3MjhlZWFjOWQ2ZjkzZDkxOTViNDY4YTZlODU5MTA5MjFhNjMiLCJzb2NpYWxfYXV0aF9sYXN0X2xvZ2luX2JhY2tlbmQiOiJnb29nbGUtb2F1dGgyIn0=','2017-08-14 00:11:28.702457'),('h0kf8thsrsxs7tmocf8nu53t18696s8y','OTM5OGMzMzQyNTY0MWNjODkxMjU4YmZhOWEwZTNjNmQwNzI0MTQyODp7Il9jc3JmdG9rZW4iOiJrWk5tUTBEZU5EMGNoZW1PMnhLY1F0RnRub2NtNFcxV3RITnpJZGpYc0FpZFVFcEtYZEN4T1Q4SDdoaHZINjZRIiwiZmFjZWJvb2tfc3RhdGUiOiJSWjRTZVFUNzlpQ1JWSzFUOE43S3FaWHoyVXdsNUVWSiIsImdvb2dsZS1vYXV0aDJfc3RhdGUiOiJGWDF2QmhybDFUNHJqR2dQUTVpT0U4ODRtSXhPcWlYWSJ9','2017-07-20 20:51:46.920676'),('i0wzoj2js44zk8t3nj76sv93btlmsema','OWUzOGQ3NjdiMmNlYjM1NWNhYmQ2YTNiNjE2MmNkNmY3NDA5MjdhZTp7Il9jc3JmdG9rZW4iOiI0WnpkSEc1blFvV29nQm9vYXpPR2Npazc1VU9EbEV2ZFdqSXd5MzJZcU15Sk5DdVd3RllLUHZUYm8ySGd3VXV1IiwiZmFjZWJvb2tfc3RhdGUiOiJpVzB1SFJMeGVnaE9vNURLWnN2UEJLTmdycnh0bktabyIsInR3aXR0ZXJfc3RhdGUiOiJxdGxRc1FIUFZlSFY3MWY4Tk04b0VhV2pkbEM5dVdsMiIsInR3aXR0ZXJ1bmF1dGhvcml6ZWRfdG9rZW5fbmFtZSI6W10sIl9hdXRoX3VzZXJfaWQiOiIzIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoic29jaWFsX2NvcmUuYmFja2VuZHMudHdpdHRlci5Ud2l0dGVyT0F1dGgiLCJfYXV0aF91c2VyX2hhc2giOiIwZDc4Y2YyY2NmZDQyMmM2ZTI0MzJiYWRhNDQzMDZhZTA0MGNjNzMyIiwic29jaWFsX2F1dGhfbGFzdF9sb2dpbl9iYWNrZW5kIjoidHdpdHRlciJ9','2017-07-03 22:17:34.448567'),('jvwf6uq9ica91kwgvqyd4q89upcpygxv','OGExOWM2NGZiMmYxZTI5NmE1ODc1YTAzN2RkZmY5OGQyMGQ3NzAyOTp7Il9jc3JmdG9rZW4iOiJmRWJIRUNpYWtkVzVoVDJ6eVBwZjYxbGI5czFFY2ViYTNhblRudXdLNnlnZEVrYkc1Q3lSV09YRTBVNmtkUWdkIn0=','2017-08-13 14:56:33.740638');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_coupon`
--

DROP TABLE IF EXISTS `main_app_coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_created` datetime(6) NOT NULL,
  `qr_image` varchar(100) DEFAULT NULL,
  `deal_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` varchar(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_app_coupon_deal_id_35419ff4_fk_main_app_deal_id` (`deal_id`),
  KEY `main_app_coupon_user_id_c2d16dfb_fk_auth_user_id` (`user_id`),
  CONSTRAINT `main_app_coupon_deal_id_35419ff4_fk_main_app_deal_id` FOREIGN KEY (`deal_id`) REFERENCES `main_app_deal` (`id`),
  CONSTRAINT `main_app_coupon_user_id_c2d16dfb_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_coupon`
--

LOCK TABLES `main_app_coupon` WRITE;
/*!40000 ALTER TABLE `main_app_coupon` DISABLE KEYS */;
INSERT INTO `main_app_coupon` VALUES (11,'2017-07-28 20:26:42.689343','coupon_11/coupon-11.png',4,41,'1'),(13,'2017-07-28 20:30:21.229541','coupon_13/coupon-13.png',4,41,'1'),(14,'2017-07-29 13:42:47.667118','coupon_14/coupon-14.png',78,41,'1'),(15,'2017-07-29 20:21:21.800741','coupon_15/coupon-15.png',4,41,'1'),(16,'2017-07-29 23:08:33.086768','',43,41,'1'),(17,'2017-07-29 23:10:29.806100','coupon_17/coupon-17.png',43,41,'0'),(18,'2017-07-30 12:57:45.063058','coupon_18/coupon-18.png',4,41,'1'),(19,'2017-07-30 15:52:19.422999','coupon_19/coupon-19.png',43,41,'1'),(20,'2017-07-30 21:35:22.333060','coupon_20/coupon-20.png',85,41,'1'),(21,'2017-07-30 22:16:02.858077','coupon_21/coupon-21.png',85,41,'1'),(22,'2017-07-30 22:37:56.252419','coupon_22/coupon-22.png',86,41,'1'),(23,'2017-07-30 22:47:48.483394','coupon_23/coupon-23.png',87,41,'1'),(24,'2017-07-30 23:06:18.392473','coupon_24/coupon-24.png',78,41,'1');
/*!40000 ALTER TABLE `main_app_coupon` ENABLE KEYS */;
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
  `category` varchar(3) NOT NULL,
  `status` varchar(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_app_deal_dispensary_id_6b103a34_fk_main_app_dispensary_id` (`dispensary_id`),
  CONSTRAINT `main_app_deal_dispensary_id_6b103a34_fk_main_app_dispensary_id` FOREIGN KEY (`dispensary_id`) REFERENCES `main_app_dispensary` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_deal`
--

LOCK TABLES `main_app_deal` WRITE;
/*!40000 ALTER TABLE `main_app_deal` DISABLE KEYS */;
INSERT INTO `main_app_deal` VALUES (4,'new_deal_babe','new_deal_babe dfjlskjflsdf lsakjdf ls fksa flks klf slkjf',1000.00,2,1,'2017-07-11 15:34:13.320940','2017-07-11','2017-08-10',5,200.00,'cbd','1'),(5,'dasd','pdf',13.00,0,0,'2017-07-22 16:37:58.158980','2017-07-04','2017-07-12',14,12.00,'in','2'),(6,'New Deal Real','GOGOGOGO',10.00,0,0,'2017-07-22 17:44:34.976007','2017-07-22','2017-07-18',14,12.00,'ed','2'),(8,'fsdf','sdfsdf',23.00,0,0,'2017-07-24 14:04:20.217206','2017-07-06','2017-07-17',14,12.00,'in','2'),(9,'sdfsdf','and',32.00,0,0,'2017-07-24 14:05:05.211394','2017-07-24','2017-07-28',14,12.00,'hy','2'),(10,'sdfsdf','fsdfasdf',12.00,0,0,'2017-07-24 15:20:15.161885','2017-07-24','2017-07-27',14,12.00,'cbd','2'),(11,'dasd','dasd',23.00,0,0,'2017-07-24 15:21:51.227670','2017-07-24','2017-07-27',14,12.00,'cbd','2'),(12,'sf','f',12.00,0,0,'2017-07-24 15:23:46.527851','2017-07-24','2017-07-28',14,12.00,'in','2'),(13,'sdfsdf','sfdf',12.00,0,0,'2017-07-24 15:24:34.382389','2017-07-24','2017-07-26',14,12.00,'in','2'),(14,'sdfds','pdf',12.00,0,0,'2017-07-24 15:28:46.569935','2017-07-24','2017-07-18',14,12.00,'hy','2'),(15,'fsdf','dasd',10.00,0,0,'2017-07-24 15:40:50.664817','2017-07-24','2017-07-27',14,12.00,'ed','2'),(16,'fsdfds','and',12.00,0,0,'2017-07-24 15:47:04.983771','2017-07-24','2017-07-19',14,12.00,'in','2'),(17,'fsdfds','pdf',12.00,0,0,'2017-07-24 16:03:00.809826','2017-07-24','2017-07-29',14,12.00,'cbd','2'),(20,'and','sad',12.00,0,0,'2017-07-24 16:07:58.332620','2017-07-24','2017-07-29',14,12.00,'in','2'),(23,'sdfds','fsdfsd',12.00,0,0,'2017-07-24 16:47:30.645908','2017-07-24','2017-07-31',14,123.00,'in','2'),(25,'fsdfa','fsdf',32.00,0,0,'2017-07-24 16:49:13.056156','2017-07-24','2017-07-31',14,123.00,'in','2'),(26,'fsdfa','sd',32.00,0,0,'2017-07-24 16:51:14.228007','2017-07-24','2017-07-29',14,1.00,'co','2'),(27,'sdfds','fads',32.00,0,0,'2017-07-24 16:52:19.078312','2017-07-24','2017-07-31',14,123.00,'in','2'),(28,'sdfds','das',32.00,0,0,'2017-07-24 16:54:12.517836','2017-07-24','2017-07-31',14,123.00,'in','2'),(29,'fsdfa','das',32.00,0,0,'2017-07-24 16:55:47.696159','2017-07-24','2017-07-31',14,123.00,'in','2'),(30,'fsdfa','sd',312.00,0,0,'2017-07-24 16:56:06.754144','2017-07-24','2017-07-28',14,123.00,'cbd','2'),(31,'sfdf','as',32.00,0,0,'2017-07-24 16:56:35.790524','2017-07-24','2017-07-31',14,123.00,'in','2'),(32,'dasd','as',32.00,0,0,'2017-07-24 16:58:26.120708','2017-07-24','2017-07-31',14,123.00,'in','2'),(33,'fsdfa','dosa',32.00,0,0,'2017-07-24 16:59:31.809635','2017-07-24','2017-07-27',14,123.00,'in','2'),(34,'fsdfa','as',123.00,0,0,'2017-07-24 16:59:58.639180','2017-07-24','2017-07-29',14,123.00,'in','2'),(35,'fsdfa','pdf',32.00,0,0,'2017-07-24 17:00:34.512337','2017-07-24','2017-07-26',14,123.00,'in','2'),(36,'fd','pdf',32.00,0,0,'2017-07-24 17:01:27.922591','2017-07-24','2017-07-31',14,123.00,'in','2'),(37,'fsdfa','fads',3.00,0,0,'2017-07-24 17:03:35.765694','2017-07-24','2017-07-31',14,32.00,'in','2'),(38,'fsdfa','das',32.00,0,0,'2017-07-24 17:06:27.378058','2017-07-24','2017-07-31',14,123.00,'in','2'),(39,'fsdfa','das',2.00,0,0,'2017-07-24 17:07:16.000951','2017-07-24','2017-07-31',14,32.00,'in','2'),(40,'fsdfa','da',32.00,0,0,'2017-07-24 17:07:51.356820','2017-07-24','2017-07-30',14,12.00,'in','2'),(41,'df','pdf',32.00,0,0,'2017-07-24 17:16:40.286695','2017-07-24','2017-07-31',14,123.00,'in','2'),(42,'fsdfa','sad',32.00,0,0,'2017-07-24 17:17:29.897767','2017-07-24','2017-07-31',14,123.00,'in','2'),(43,'fsdfa','das',2.00,0,0,'2017-07-24 17:18:25.570987','2017-07-24','2017-07-31',14,32.00,'ed','2'),(45,'sdfds','das',32.00,0,0,'2017-07-25 15:14:41.587030','2017-07-25','2017-07-31',14,123.00,'in','2'),(46,'sdfds','as',32.00,0,0,'2017-07-25 15:17:06.744868','2017-07-25','2017-07-31',14,123.00,'in','2'),(47,'sfdf','fed',32.00,0,0,'2017-07-25 15:18:38.686620','2017-07-25','2017-07-26',14,123.00,'in','2'),(48,'fast','sad',32.00,0,0,'2017-07-25 15:19:59.839157','2017-07-25','2017-07-31',14,123.00,'in','2'),(49,'sdfds','as',32.00,0,0,'2017-07-25 15:20:57.758614','2017-07-25','2017-07-31',14,123.00,'in','2'),(50,'sad','pdf',32.00,0,0,'2017-07-25 15:22:22.137505','2017-07-25','2017-07-31',14,123.00,'in','2'),(51,'asdf','fd',32.00,0,0,'2017-07-25 15:30:45.062978','2017-07-25','2017-07-31',14,123.00,'in','2'),(52,'sad','sd',32.00,0,0,'2017-07-25 15:31:29.531421','2017-07-25','2017-07-31',14,123.00,'in','2'),(53,'asdf','sad',32.00,0,0,'2017-07-25 15:32:06.039786','2017-07-25','2017-07-31',14,123.00,'co','2'),(54,'asdf','ads',43.00,0,0,'2017-07-25 15:51:31.325761','2017-07-25','2017-07-31',14,423.00,'cbd','2'),(55,'sad','pdf',32.00,0,0,'2017-07-25 15:54:44.236728','2017-07-25','2017-07-31',14,123.00,'cbd','2'),(57,'add','pdf',32.00,0,0,'2017-07-25 15:56:06.545266','2017-07-25','2017-07-31',14,123.00,'in','2'),(58,'asdf','pdf',32.00,0,0,'2017-07-25 15:57:49.175029','2017-07-25','2017-07-31',14,123.00,'in','2'),(59,'staff','pdf',32.00,0,0,'2017-07-25 15:58:16.062251','2017-07-25','2017-07-31',14,123.00,'in','2'),(60,'sad','def',32.00,0,0,'2017-07-25 15:59:58.143225','2017-07-25','2017-07-31',14,132.00,'in','2'),(61,'sad','dosa',32.00,0,0,'2017-07-25 20:36:20.613882','2017-07-25','2017-07-31',14,123.00,'in','2'),(62,'sdfds','pdf',3.00,0,0,'2017-07-25 20:38:22.742238','2017-07-25','2017-07-31',14,321.00,'in','2'),(63,'add','fs',2.00,0,0,'2017-07-25 20:40:11.034371','2017-07-25','2017-07-31',14,312.00,'co','2'),(64,'asdf','sf',2.00,0,0,'2017-07-25 20:41:23.075172','2017-07-25','2017-07-31',14,32.00,'in','2'),(65,'sfdf','ads',32.00,0,0,'2017-07-25 20:43:25.712224','2017-07-25','2017-07-03',14,32.00,'in','2'),(66,'asdf','das',32.00,0,0,'2017-07-25 21:02:08.986645','2017-07-25','2017-07-31',14,123.00,'in','2'),(67,'sfdf','as',32.00,0,0,'2017-07-25 21:03:31.042941','2017-07-25','2017-07-31',14,123.00,'in','2'),(69,'sfdf','fsadf',34.00,0,0,'2017-07-25 21:10:31.175615','2017-07-25','2017-07-31',14,423.00,'in','2'),(70,'asdf','sd',3.00,0,0,'2017-07-25 21:12:35.357210','2017-07-25','2017-07-31',14,43.00,'in','2'),(71,'ask','df',2.00,0,0,'2017-07-25 21:13:38.951556','2017-07-25','2017-07-31',14,32.00,'in','2'),(72,'and','das',32.00,0,0,'2017-07-25 21:14:12.759815','2017-07-24','2017-07-29',14,123.00,'in','2'),(73,'asdf','2',23.00,0,0,'2017-07-25 21:15:56.347248','2017-07-25','2017-07-31',14,321.00,'cbd','2'),(74,'asdf','adsasd',32.00,0,0,'2017-07-25 21:24:21.886591','2017-07-25','2017-07-25',14,123.00,'in','2'),(75,'Me new deal!!!','ads',32.00,0,0,'2017-07-27 16:55:55.689652','2017-07-27','2017-07-31',14,312.00,'in','2'),(76,'new new awn ewe wf','sad',32.00,0,0,'2017-07-27 16:57:38.360649','2017-07-27','2017-07-31',14,321.00,'in','2'),(77,'asdf','pdf',32.00,0,0,'2017-07-27 17:01:32.076490','2017-07-27','2017-07-31',14,123.00,'in','2'),(78,'sadf','sf',2.00,0,0,'2017-07-27 17:06:21.928543','2017-07-27','2017-07-31',14,31.00,'in','1'),(79,'My Deal','adds',32.00,0,0,'2017-07-30 12:03:57.310636','2017-07-30','2017-07-17',14,312.00,'in','2'),(80,'asdfdf','pdf',32.00,0,0,'2017-07-30 12:05:30.920313','2017-07-30','2017-07-31',14,13123.00,'in','2'),(81,'sad','ad',32.00,0,0,'2017-07-30 12:10:52.107829','2017-07-30','2017-07-31',14,123.00,'in','2'),(82,'asdfdf','pdf',2.00,0,0,'2017-07-30 12:13:47.144453','2017-07-30','2017-07-31',14,3123.00,'in','2'),(83,'adsf','zd',32.00,0,0,'2017-07-30 12:14:43.143116','2017-07-30','2017-07-31',14,312.00,'in','2'),(84,'ads','and',3.00,0,0,'2017-07-30 12:15:06.389613','2017-07-30','2017-07-31',14,312.00,'in','2'),(85,'My deal title! Here\'s one','LOrem ipsum blah blah blah\r\nLOrem ipsum blah blah blah\r\n\r\nLOrem ipsum blah blah blah\r\nLOrem ipsum blah blah blah\r\nLOrem ipsum blah blah blah\r\nLOrem ipsum blah blah blah\r\nLOrem ipsum blah blah blah',2.00,0,0,'2017-07-30 14:39:54.167003','2017-07-30','2017-07-31',15,32.00,'in','1'),(86,'New Deal! Hurry up!','pdf',32.00,0,0,'2017-07-30 21:19:08.715552','2017-07-30','2017-07-31',16,321.00,'in','1'),(87,'Deal #2 in Montebello!','sa',31.00,0,0,'2017-07-30 22:45:55.325000','2017-07-30','2017-08-11',16,31.00,'in','1'),(88,'fsafd','4234',3.00,0,0,'2017-07-31 07:59:30.044074','2017-07-31','2017-07-31',16,43.00,'cbd','2');
/*!40000 ALTER TABLE `main_app_deal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_dealimage`
--

DROP TABLE IF EXISTS `main_app_dealimage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_dealimage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image` varchar(100) DEFAULT NULL,
  `deal_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `main_app_dealimage_deal_id_7190fb86_fk_main_app_deal_id` (`deal_id`),
  CONSTRAINT `main_app_dealimage_deal_id_7190fb86_fk_main_app_deal_id` FOREIGN KEY (`deal_id`) REFERENCES `main_app_deal` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_dealimage`
--

LOCK TABLES `main_app_dealimage` WRITE;
/*!40000 ALTER TABLE `main_app_dealimage` DISABLE KEYS */;
INSERT INTO `main_app_dealimage` VALUES (1,'file[0]',53),(2,'file[0]',53),(3,'file[0]',53),(4,'file[0]',53),(5,'file[0]',53),(6,'file[0]',53),(7,'file[0]',53),(8,'file[0]',54),(9,'file[0]',55),(10,'file[0]',57),(11,'file[0]',59),(12,'file[0]',60),(13,'file[0]',61),(14,'file[0]',62),(15,'file[0]',63),(16,'file[0]',64),(17,'file[0]',65),(18,'file[0]',67),(19,'file[0]',67),(21,'file[0]',69),(22,'file[0]',67),(23,'file[0]',70),(24,'file[0]',71),(26,'file[0]',73),(28,'file[0]',73),(30,'file[0]',74),(33,'file[0]',74),(34,'file[0]',74),(35,'file[0]',75),(36,'file[0]',76),(37,'file[0]',77),(38,'file[0]',77),(40,'media/images/Frankfurt174.jpg',77),(41,'media/images/post-463382-1469379925.jpg',77),(42,'deal_78/post-463382-1469379925.jpg',78),(43,'deal_78/bamperbol.jpg',78),(44,'deal_85/Снимок_экрана_2017-04-06_в_19.02.14.png',85),(45,'deal_85/Снимок_экрана_2017-04-06_в_19.02.11.png',85),(46,'deal_85/Снимок_экрана_2017-04-06_в_19.02.35.png',85),(47,'deal_86/Снимок_экрана_2017-04-22_в_11.13.52.png',86),(48,'deal_86/Снимок_экрана_2017-05-16_в_23.37.04.png',86),(49,'deal_86/Снимок_экрана_2017-05-02_в_14.57.11.png',86),(50,'deal_87/709192-331725-34.png',87),(51,'deal_87/maxresdefault.jpg',87),(52,'deal_87/470..jpg',87);
/*!40000 ALTER TABLE `main_app_dealimage` ENABLE KEYS */;
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
  `description` longtext NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `website` varchar(100) DEFAULT NULL,
  `secret` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `location_id` (`location_id`),
  CONSTRAINT `main_app_dispensary_location_id_2bc10901_fk_main_app_location_id` FOREIGN KEY (`location_id`) REFERENCES `main_app_location` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_dispensary`
--

LOCK TABLES `main_app_dispensary` WRITE;
/*!40000 ALTER TABLE `main_app_dispensary` DISABLE KEYS */;
INSERT INTO `main_app_dispensary` VALUES (5,'Newpik','fsdfsafdfsd',1,NULL,NULL),(6,'sdfsdf','blabla',2,NULL,NULL),(7,'blah','blabla',3,NULL,NULL),(8,'Test Disp','test disp',4,NULL,NULL),(9,'fshadfhajkf','blabla',5,NULL,NULL),(10,'jasdkl;dsafsadfklsadfkj','blabla',6,NULL,NULL),(11,'asjdfds','blabla',7,NULL,NULL),(12,'sdfhasj','blabla',8,NULL,NULL),(13,'dsfas','blabla',9,NULL,NULL),(14,'My Dispensaryklk','blabla',10,'mysti1c.com','bllblasdfj'),(15,'Dispensary #1','blabla',12,'mysite.com','fvsycosaon'),(16,'New dispensary in Montebello','Yeah! Super class dipesnary',13,'mysite.com','uxgukxfzir');
/*!40000 ALTER TABLE `main_app_dispensary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_app_location`
--

DROP TABLE IF EXISTS `main_app_location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_app_location` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `city` varchar(30) NOT NULL,
  `state` varchar(30) NOT NULL,
  `street_address` varchar(90) DEFAULT NULL,
  `lat` double NOT NULL,
  `lng` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_location`
--

LOCK TABLES `main_app_location` WRITE;
/*!40000 ALTER TABLE `main_app_location` DISABLE KEYS */;
INSERT INTO `main_app_location` VALUES (1,'New York','NY','11 Wall St',40.7068661,-74.0113189),(2,'New York','NY','67 Mulberry St',40.7159175,-73.9993322),(3,'New York','New york','1, wall street',40.707491,-74.0116385),(4,'New York','New York','12, Wall street',40.7075936,-74.0108953),(5,'New York','New York','Wall street 32',40.7070682,-74.0099694),(6,'New york','New york','3, wall street',40.707321,-74.011728),(7,'New York','New York','45, wall street',40.7061778,-74.0099151),(8,'New York','New York','34, wall street',40.7070171,-74.0098891),(9,'New York','New York','15 wall street',40.7071526,-74.0107255),(10,'Kiev','Kiev','7, Lebedeva-Kumacha street',50.4393055,30.4412839),(11,'New York','NY','11 wall street',40.7068661,-74.0113189),(12,'New York','NY','11 wall street',40.7068661,-74.0113189),(13,'Bell Gardens','CA','8000 Park Ln,',33.9586975,-118.1522739);
/*!40000 ALTER TABLE `main_app_location` ENABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_app_review`
--

LOCK TABLES `main_app_review` WRITE;
/*!40000 ALTER TABLE `main_app_review` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `social_auth_usersocialauth`
--

LOCK TABLES `social_auth_usersocialauth` WRITE;
/*!40000 ALTER TABLE `social_auth_usersocialauth` DISABLE KEYS */;
INSERT INTO `social_auth_usersocialauth` VALUES (4,'twitter','3361355566','{\"auth_time\": 1500734455, \"id\": 3361355566, \"access_token\": {\"oauth_token\": \"3361355566-GuLP24f1pV98Lr6d2xdqjquQpj1LOASLGVUbh6q\", \"oauth_token_secret\": \"npuLptEpUvXdKW4odwsScglmk1QCBEjHdxal1cSiEIaAR\", \"user_id\": \"3361355566\", \"screen_name\": \"ArmennnnnArmen\", \"x_auth_expires\": \"0\"}}',29),(5,'google-oauth2','armenbizz@gmail.com','{\"auth_time\": 1500734486, \"expires\": 3600, \"token_type\": \"Bearer\", \"access_token\": \"ya29.GluQBHNznesKs-ci7CZ1dACFCobdvmgMMSJ8q4KlhRJZhuK4MkzEmpwZm7L8psUJu3oMu_Georg6hdVty5QAFTZjL2xGIDR8mepAyP5Dq8nSl4MtfVgccYKH29Ol\"}',30),(6,'google-oauth2','bloginvestmonitor@gmail.com','{\"auth_time\": 1501174726, \"expires\": 3599, \"token_type\": \"Bearer\", \"access_token\": \"ya29.Gl2VBMUejqZU0XXO43q_TLbVIyK9PBU95uHO6wKzMH2PL_gYXhB4xnb7JKMVe7NSCyTSmW9RC9ViGu47ixxUKPLchCV9t_dK0M5MdBcyuXtrdenbjSIEcOk5C42sjS0\"}',40),(7,'google-oauth2','fujman94@gmail.com','{\"auth_time\": 1501459888, \"expires\": 3599, \"token_type\": \"Bearer\", \"access_token\": \"ya29.GlyZBBfLh-ODx2QQGbRoLz5-gLsrTpE972b62tI-RLfOZ406x9EMlr58h7YBIAISBuVSZaiY8EgfUdmqL_JvMET1jH6RMRp26Q1JNXU8zTJ-FePq58xQW5nKLca4Fw\"}',41);
/*!40000 ALTER TABLE `social_auth_usersocialauth` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_app_profile`
--

DROP TABLE IF EXISTS `users_app_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_app_profile` (
  `user_id` int(11) NOT NULL,
  `phone_number` varchar(35) DEFAULT NULL,
  `avatar` varchar(100) DEFAULT NULL,
  `user_type` int(11) DEFAULT NULL,
  `dispensary_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `dispensary_id` (`dispensary_id`),
  CONSTRAINT `users_app_profile_dispensary_id_41d3db49_fk_main_app_` FOREIGN KEY (`dispensary_id`) REFERENCES `main_app_dispensary` (`id`),
  CONSTRAINT `users_app_profile_user_id_14b76bc0_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_app_profile`
--

LOCK TABLES `users_app_profile` WRITE;
/*!40000 ALTER TABLE `users_app_profile` DISABLE KEYS */;
INSERT INTO `users_app_profile` VALUES (26,NULL,'',NULL,NULL),(27,NULL,'',0,NULL),(28,NULL,'',1,NULL),(29,NULL,'',NULL,NULL),(30,NULL,'',NULL,NULL),(31,NULL,'',1,NULL),(32,NULL,'',1,NULL),(33,NULL,'',1,NULL),(35,NULL,'',1,NULL),(36,NULL,'',1,NULL),(37,NULL,'',1,NULL),(38,NULL,'',1,13),(39,'34 89','user_39/post-463382-1469379925.jpg',1,14),(40,NULL,'user_40/bamperbol.jpg',NULL,NULL),(41,'4234234','',NULL,NULL),(44,'8943-434-43','',1,15),(45,'898234-4309','user_45/Снимок_экрана_2017-04-06_в_18.57.38.png',1,16);
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

-- Dump completed on 2017-07-31 20:24:25
