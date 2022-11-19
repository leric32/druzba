-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: database
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Dumping data for table `activity`
--

LOCK TABLES `activity` WRITE;
/*!40000 ALTER TABLE `activity` DISABLE KEYS */;
INSERT INTO `activity` VALUES (1,'Fudbal termin','Ko hoce na fudbal?','Stadion Rajko Mitic','2022-12-12 00:00:00',3,20,3,1,2),(2,'Grupa za hakaton','Ko hoce na hakaton gde cu ja biti mentor?','NTP Cacak','2022-11-18 00:00:00',32,4,2,6,4),(3,'Oce neko na koncert Zdravka Colica?','U poad se odrzavaa koncert na tasu, 23. po redu i zelim da najdem ekipu za to.','Vukov spomenik','2022-02-02 18:00:00',4,55,5,2,3),(4,'Oce neko na koncert Maje Berovic?','U poad se odrzavaa koncert na tasu, 23. po redu i zelim da najdem ekipu za to.','Vukov spomenik','2022-02-02 18:00:00',4,55,5,2,11),(5,'Oce neko na koncert KARLEUSE?','U poad se odrzavaa koncert na tasu, 23. po redu i zelim da najdem ekipu za to.','Vukov spomenik','2022-02-02 18:00:00',4,55,5,2,2);
/*!40000 ALTER TABLE `activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add users',6,'add_users'),(22,'Can change users',6,'change_users'),(23,'Can delete users',6,'delete_users'),(24,'Can view users',6,'view_users'),(25,'Can add activity',7,'add_activity'),(26,'Can change activity',7,'change_activity'),(27,'Can delete activity',7,'delete_activity'),(28,'Can view activity',7,'view_activity'),(29,'Can add type',8,'add_type'),(30,'Can change type',8,'change_type'),(31,'Can delete type',8,'delete_type'),(32,'Can view type',8,'view_type'),(33,'Can add comment',9,'add_comment'),(34,'Can change comment',9,'change_comment'),(35,'Can delete comment',9,'delete_comment'),(36,'Can view comment',9,'view_comment');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'Ocu ja TUBICUUUU',1,3),(2,'Ocu ja mentorcicu',2,1),(3,'Mogu li ja da budem deo tvog tima?',2,3),(4,'Najjace na koncert maje sa cmikijem',4,1);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-11-19 01:49:34.172194','10','vfgfd',1,'[{\"added\": {}}]',6,5);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(7,'druzbaApp','activity'),(9,'druzbaApp','comment'),(8,'druzbaApp','type'),(6,'druzbaApp','users'),(5,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-11-18 23:14:48.870454'),(2,'contenttypes','0002_remove_content_type_name','2022-11-18 23:14:49.048859'),(3,'auth','0001_initial','2022-11-18 23:14:49.618960'),(4,'auth','0002_alter_permission_name_max_length','2022-11-18 23:14:49.872884'),(5,'auth','0003_alter_user_email_max_length','2022-11-18 23:14:49.888521'),(6,'auth','0004_alter_user_username_opts','2022-11-18 23:14:49.904145'),(7,'auth','0005_alter_user_last_login_null','2022-11-18 23:14:49.904145'),(8,'auth','0006_require_contenttypes_0002','2022-11-18 23:14:49.919771'),(9,'auth','0007_alter_validators_add_error_messages','2022-11-18 23:14:49.935396'),(10,'auth','0008_alter_user_username_max_length','2022-11-18 23:14:49.935396'),(11,'auth','0009_alter_user_last_name_max_length','2022-11-18 23:14:49.951021'),(12,'auth','0010_alter_group_name_max_length','2022-11-18 23:14:49.973157'),(13,'auth','0011_update_proxy_permissions','2022-11-18 23:14:49.988798'),(14,'auth','0012_alter_user_first_name_max_length','2022-11-18 23:14:50.004422'),(15,'druzbaApp','0001_initial','2022-11-18 23:14:51.022751'),(16,'admin','0001_initial','2022-11-18 23:14:51.292320'),(17,'admin','0002_logentry_remove_auto_add','2022-11-18 23:14:51.307946'),(18,'admin','0003_logentry_add_action_flag_choices','2022-11-18 23:14:51.323569'),(19,'sessions','0001_initial','2022-11-18 23:14:51.392591'),(20,'druzbaApp','0002_comment_idu','2022-11-18 23:36:55.650780');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0aonrgosulpvo0fa53s2169sc8mom2f0','.eJxVjEEOgjAQRe_StWk6DFM6Lt17BjJlWosaSCisjHdXEha6_e-9_zK9bGvpt5qWflRzNmROv1uU4ZGmHehdpttsh3lalzHaXbEHrfY6a3peDvfvoEgt37pFgIANUYbs0EOOwI5R1DNhZvBeEVoPnZeOXUehQQrCQI41pazm_QGYszY2:1owCsm:TItE9NSmx_tcaEqTkPZclROUW3nzKoDWTxtoo67yaS8','2022-12-03 01:43:00.778151'),('iemw5ygs56ipo3ub6sljuuiiyczppyf2','.eJxVjEEOgjAQRe_StWk6DFM6Lt17BjJlWosaSCisjHdXEha6_e-9_zK9bGvpt5qWflRzNmROv1uU4ZGmHehdpttsh3lalzHaXbEHrfY6a3peDvfvoEgt37pFgIANUYbs0EOOwI5R1DNhZvBeEVoPnZeOXUehQQrCQI41pazm_QGYszY2:1owC8f:rCd6o-B9pLJcgptPj_c6rUg7i9ZzsMfufTuGosLm9ho','2022-12-03 00:55:21.526860'),('m9r5arta1tn86bbxsg2wu0f92llifomd','.eJxVjEsOwjAMBe-SNYriuk5jluw5Q-XWCSmgROpnhbg7VOoCtm9m3sv0sq2535Y495OaswFz-t0GGR-x7EDvUm7VjrWs8zTYXbEHXey1anxeDvfvIMuSv3WLAAEbogTJoYc0ADtGUc-EicF7RWg9dF46dh2FBikIAznWGJOa9weWTzYy:1owNZb:wR-mOXrwDmmsoP_Sh_3cvxJ-GYTgKSfJaXSKHz6Obxo','2022-12-03 13:07:55.720224');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `type`
--

LOCK TABLES `type` WRITE;
/*!40000 ALTER TABLE `type` DISABLE KEYS */;
INSERT INTO `type` VALUES (1,'Sport'),(2,'Koncert'),(3,'Ucenje'),(4,'Izlazak'),(5,'Kulturno desavanje'),(6,'Izlet'),(7,'Takmicenje'),(8,'Drustvene igre'),(9,'Ostalo');
/*!40000 ALTER TABLE `type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_activity`
--

LOCK TABLES `user_activity` WRITE;
/*!40000 ALTER TABLE `user_activity` DISABLE KEYS */;
INSERT INTO `user_activity` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,3),(5,2,1),(6,4,1),(7,NULL,1);
/*!40000 ALTER TABLE `user_activity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('pbkdf2_sha256$320000$of6emPfQpk4EKx2AbxTQyJ$kJ7qf5h9TlyM7FqzQnEC6MifwcIwVivQKKHEq7ZQISs=','2022-11-19 13:07:55.712157',NULL,'tasha','Tasha','Sekularac','tasha@etf.rs',NULL,NULL,NULL,1,NULL),('pbkdf2_sha256$320000$of6emPfQpk4EKx2AbxTQyJ$kJ7qf5h9TlyM7FqzQnEC6MifwcIwVivQKKHEq7ZQISs=','2022-11-19 10:17:02.613060',NULL,'tubic','Stefan','Tubic','tubic@etf.rs',NULL,NULL,NULL,2,NULL),('pbkdf2_sha256$320000$of6emPfQpk4EKx2AbxTQyJ$kJ7qf5h9TlyM7FqzQnEC6MifwcIwVivQKKHEq7ZQISs=',NULL,NULL,'cmiki','Milos','Cvetanovic','cmiki@etf.rs',NULL,NULL,NULL,3,NULL),('pbkdf2_sha256$320000$IYTE6Uw5wd93aYcEr29Dpw$cRB/T7Ti5v6DgGH5FUW4h9WrjjW2LRlAXOFTbIelKio=',NULL,NULL,'aki','Aleksa','Racic','aki@etf.rs',NULL,NULL,NULL,4,NULL),('pbkdf2_sha256$320000$of6emPfQpk4EKx2AbxTQyJ$kJ7qf5h9TlyM7FqzQnEC6MifwcIwVivQKKHEq7ZQISs=','2022-11-19 01:43:00.773150',1,'dp','','','',1,1,'2022-11-19 00:54:51.555904',5,''),('123',NULL,0,'markok','dsa','fsdsfdsa','fsdfs@gs.com',0,1,'2022-11-19 01:13:42.807205',6,''),('123','2022-11-19 01:17:35.080761',0,'markok1','dsa','fsdsfdsa','fsdfs@gs.com',0,1,'2022-11-19 01:17:18.257106',7,''),('123','2022-11-19 01:34:17.147200',0,'markok2','dsa','fsdsfdsa','fsdfs@gs.com',0,1,'2022-11-19 01:34:17.106918',8,''),('<sha1 _hashlib.HASH object @ 0x000002763DF5E650>','2022-11-19 01:37:08.980413',0,'markok3','dsa','fsdsfdsa','fsdfs@gs.com',0,1,'2022-11-19 01:37:08.952409',9,''),('123',NULL,0,'vfgfd','fdfg','gff','gd@gmai.com',0,1,'2022-11-19 01:49:13.000000',10,'wallpaper.png'),('pbkdf2_sha256$320000$0cjAlL3WqYByD56iFOmRSz$p3NOcOiHoffhyaH0ih7worAti91QXWzU5tRjpSudO7c=','2022-11-19 10:14:31.492701',0,'markok5','dsa','fsdsfdsa','fsdfs@gs.com',0,1,'2022-11-19 01:56:18.780043',11,''),('pbkdf2_sha256$320000$7lbDcDFpAAzpZvlXWWzagl$9vvL/GnL54zy49nWBtuCDpZ3VsPpozAqHoLo2rlIezA=','2022-11-19 12:25:44.442866',0,'markok6','dsa','fsdsfdsa','fsdf@sgs.com',0,1,'2022-11-19 12:25:44.415832',12,NULL),('pbkdf2_sha256$320000$IgPS5f2e30S27BU9JhPvsK$r8/fu0enmB8ZpvczDgzC+X7omp8A8N6TiimxHEKVSMg=','2022-11-19 12:27:52.199344',0,'markok7','dsa','fsdsfdsa','fsdf@sgs.com',0,1,'2022-11-19 12:27:52.174292',13,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `users_user_permissions`
--

LOCK TABLES `users_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-19 14:54:40
