-- MySQL dump 10.13  Distrib 8.0.42, for Win64 (x86_64)
--
-- Host: localhost    Database: ticket_system
-- ------------------------------------------------------
-- Server version	8.0.42

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
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (3,'Маркетинг'),(6,'Отдел аналитики'),(4,'Отдел первой линии'),(5,'Отдел продаж'),(1,'Отдел разработки'),(7,'Отдел тех. помощи');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `priorities`
--

DROP TABLE IF EXISTS `priorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `priorities` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `priorities`
--

LOCK TABLES `priorities` WRITE;
/*!40000 ALTER TABLE `priorities` DISABLE KEYS */;
INSERT INTO `priorities` VALUES (2,'Высокий'),(1,'Немедленный'),(4,'Низкий'),(3,'Средний');
/*!40000 ALTER TABLE `priorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `processed_emails`
--

DROP TABLE IF EXISTS `processed_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `processed_emails` (
  `id` int NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `processed_emails`
--

LOCK TABLES `processed_emails` WRITE;
/*!40000 ALTER TABLE `processed_emails` DISABLE KEYS */;
INSERT INTO `processed_emails` VALUES (28,'17'),(29,'18'),(30,'19'),(31,'20'),(32,'21');
/*!40000 ALTER TABLE `processed_emails` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `department_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `projects_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
INSERT INTO `projects` VALUES (20,'ЛК студента',1);
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statuses` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (3,'Завершён'),(2,'На исполнении'),(4,'На распределении'),(5,'Обратная связь'),(6,'Отложен'),(1,'Принят в работу');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_files`
--

DROP TABLE IF EXISTS `ticket_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_files` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `file_name` varchar(255) COLLATE utf8mb4_general_ci NOT NULL,
  `relative_path` text COLLATE utf8mb4_general_ci NOT NULL,
  `uploaded_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `ticket_id` (`ticket_id`),
  CONSTRAINT `ticket_files_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_files`
--

LOCK TABLES `ticket_files` WRITE;
/*!40000 ALTER TABLE `ticket_files` DISABLE KEYS */;
INSERT INTO `ticket_files` VALUES (57,56,'task.png','ticketFiles/task.png','2025-06-14 19:54:40'),(58,56,'Список обновлений библиотеки.pdf','ticketFiles/Список обновлений библиотеки.pdf','2025-06-14 19:54:40'),(59,58,'image (2).png','ticketFiles/image (2).png','2025-06-14 20:08:30');
/*!40000 ALTER TABLE `ticket_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket_history`
--

DROP TABLE IF EXISTS `ticket_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket_history` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ticket_id` int NOT NULL,
  `user_id` int NOT NULL,
  `field_name` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `old_value` text COLLATE utf8mb4_general_ci,
  `new_value` text COLLATE utf8mb4_general_ci,
  `comment` text COLLATE utf8mb4_general_ci,
  `changed_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `changes_summary` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ticket_history_ibfk_1` (`ticket_id`),
  CONSTRAINT `ticket_history_ibfk_1` FOREIGN KEY (`ticket_id`) REFERENCES `tickets` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ticket_history_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket_history`
--

LOCK TABLES `ticket_history` WRITE;
/*!40000 ALTER TABLE `ticket_history` DISABLE KEYS */;
INSERT INTO `ticket_history` VALUES (64,56,1,NULL,NULL,NULL,'Начинаю выполнение задачи','2025-06-14 19:55:41','Параметр <b>Статус</b> изменился с <i>Обратная связь</i> на <b>Принят в работу</b>'),(65,56,1,NULL,NULL,NULL,'Задача выполнена, завершаю тикет','2025-06-14 19:56:43',NULL),(66,56,1,NULL,NULL,NULL,'','2025-06-14 19:56:52','Параметр <b>Статус</b> изменился с <i>Принят в работу</i> на <b>Завершён</b>'),(67,56,1,NULL,NULL,NULL,'','2025-06-14 19:57:32','Параметр <b>Статус</b> изменился с <i>Завершён</i> на <b>Принят в работу</b>'),(68,56,1,NULL,NULL,NULL,'','2025-06-14 20:02:38','Параметр <b>Статус</b> изменился с <i>Принят в работу</i> на <b>Завершён</b>'),(69,56,1,NULL,NULL,NULL,'','2025-06-14 20:04:27','Параметр <b>Назначена</b> изменился с <i>Иванов Иван</i> на <b>Абдуллин Тагир Ренатович</b>'),(70,58,1,NULL,NULL,NULL,'','2025-06-14 20:06:09','Параметр <b>Название</b> изменился с <i>Не работает кнопка проставления сессии ##FRONT</i> на <b>Не работает кнопка проставления сессии #FRONT</b>'),(71,57,1,NULL,NULL,NULL,'','2025-06-14 20:06:18','Параметр <b>Название</b> изменился с <i>Не загружаются оценки ##BACK</i> на <b>Не загружаются оценки #BACK</b>'),(72,58,1,NULL,NULL,NULL,'','2025-06-14 20:08:30','Файл <a href=\'image (2).png\'>image (2).png</a> добавлен'),(73,58,1,NULL,NULL,NULL,'','2025-06-14 20:10:03','Параметр <b>Назначена</b> изменился с <i>Абдуллин Тагир Ренатович</i> на <b>Иванов Иван</b>'),(74,57,1,NULL,NULL,NULL,'','2025-06-14 20:10:22','Параметр <b>Назначена</b> изменился с <i>Абдуллин Тагир Ренатович</i> на <b>Иванов Иван</b>'),(75,61,15,NULL,NULL,NULL,'','2025-06-14 20:22:18','Параметр <b>Статус</b> изменился с <i>На распределении</i> на <b>Обратная связь</b><br>Параметр <b>Приоритет</b> изменился с <i></i> на <b>Высокий</b><br>Параметр <b>Назначена</b> изменился с <i>Орлова Елена Степановна</i> на <b>Абдуллин Тагир Ренатович</b><br>Параметр <b>Наблюдатель</b> изменился с <i></i> на <b>Абдуллин Тагир Ренатович</b><br>Параметр <b>Трекер</b> изменился с <i></i> на <b>Ошибка</b>'),(76,57,14,NULL,NULL,NULL,'','2025-06-14 23:20:33','Параметр <b>Статус</b> изменился с <i>На исполнении</i> на <b>Завершён</b>'),(77,62,15,NULL,NULL,NULL,'','2025-06-15 01:47:23','Параметр <b>Статус</b> изменился с <i>На распределении</i> на <b>Обратная связь</b><br>Параметр <b>Приоритет</b> изменился с <i></i> на <b>Немедленный</b><br>Параметр <b>Назначена</b> изменился с <i>Орлова Елена Степановна</i> на <b>Абдуллин Тагир Ренатович</b><br>Параметр <b>Наблюдатель</b> изменился с <i></i> на <b>Абдуллин Тагир Ренатович</b><br>Параметр <b>Трекер</b> изменился с <i></i> на <b>Ошибка</b>');
/*!40000 ALTER TABLE `ticket_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `project_id` int DEFAULT NULL,
  `tracker_id` int DEFAULT NULL,
  `status_id` int DEFAULT NULL,
  `priority_id` int DEFAULT NULL,
  `assignee_id` int NOT NULL,
  `watcher_id` int DEFAULT NULL,
  `creator_id` int DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `attachment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `project_id` (`project_id`),
  KEY `tracker_id` (`tracker_id`),
  KEY `status_id` (`status_id`),
  KEY `priority_id` (`priority_id`),
  KEY `assignee_id` (`assignee_id`),
  KEY `watcher_id` (`watcher_id`),
  KEY `creator_id` (`creator_id`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`project_id`) REFERENCES `projects` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`tracker_id`) REFERENCES `trackers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_4` FOREIGN KEY (`priority_id`) REFERENCES `priorities` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_5` FOREIGN KEY (`assignee_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_6` FOREIGN KEY (`watcher_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `tickets_ibfk_7` FOREIGN KEY (`creator_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (56,'Обновление библиотеки проекта #BACK','Необходимо обновить код в соответствие с обновлением библиотеки проекта',20,2,3,3,1,1,1,'2025-06-14',NULL,'2025-06-14 19:54:40','2025-06-14 20:04:27'),(57,'Не загружаются оценки #BACK','',20,3,3,2,14,1,1,'2025-06-14',NULL,'2025-06-14 20:05:23','2025-06-14 23:20:33'),(58,'Не работает кнопка проставления сессии #FRONT','',20,3,2,1,14,1,1,'2025-06-14',NULL,'2025-06-14 20:05:50','2025-06-14 20:10:03'),(59,'Не получается оставить отзыв преподавателю','',20,3,2,4,1,1,1,'2025-06-14',NULL,'2025-06-14 20:07:10','2025-06-14 20:07:10'),(60,'В расписании не тот цвет','',20,3,2,3,1,1,1,'2025-06-14',NULL,'2025-06-14 20:07:50','2025-06-14 20:07:50'),(61,'Ошибка при попытке зайти в ЛК','Отправитель: tagir.abdullin13@mail.ru\n\n\n \nЗдравствуйте, я не могу зайти в свой личный кабинет, падает 500 ошибка\n--\nСтудент РГУ нефти и газа (НИУ) имени И. М. Губкина\nФакультета КБ ТЭК\nГруппы КС-22-03\nАбдуллин Тагир Ренатович',NULL,3,5,2,1,1,15,'2025-06-14',NULL,'2025-06-14 17:21:18','2025-06-14 20:22:18'),(62,'Не пришли деньги за алюминий','Отправитель: tagir.abdullin13@mail.ru\n\n\nДобрый день! Платёж за алюминий так и не поступил, просьба разобраться с оплатой\n \n--\nСтудент РГУ нефти и газа (НИУ) имени И. М. Губкина\nФакультета КБ ТЭК\nГруппы КС-22-03\nАбдуллин Тагир Ренатович',NULL,3,5,1,1,1,15,'2025-06-14',NULL,'2025-06-14 17:21:18','2025-06-15 01:47:23'),(63,'Запрос на рекламу','Отправитель: tagir.abdullin13@mail.ru\n\n\nХай, не могли бы вы прорекламировать наше кафе? Сколько это будет стоить?\n \n--\nСтудент РГУ нефти и газа (НИУ) имени И. М. Губкина\nФакультета КБ ТЭК\nГруппы КС-22-03\nАбдуллин Тагир Ренатович',NULL,NULL,4,NULL,15,NULL,15,'2025-06-14',NULL,'2025-06-14 17:21:18','2025-06-14 20:21:17'),(64,'Протёк кран','Отправитель: tagir.abdullin13@mail.ru\n\n\nЗдравствуйте, у меня в общежитие по адресу Москва, ул. Бутлерова, д. 1 в блоке 1114 протекает кран, вышлите пожалуйста сантехника!',NULL,NULL,4,NULL,15,NULL,15,'2025-06-14',NULL,'2025-06-14 17:21:18','2025-06-14 20:21:17'),(65,'Не отображается фото','Отправитель: tagir.abdullin13@mail.ru\n\n\nЗдравствуйте, у меня на портале не отображается фотография профиля, разберитесь, пожалуйста.\n \n ',NULL,NULL,4,NULL,15,NULL,15,'2025-06-14',NULL,'2025-06-14 17:21:18','2025-06-14 20:21:17');
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trackers`
--

DROP TABLE IF EXISTS `trackers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trackers` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trackers`
--

LOCK TABLES `trackers` WRITE;
/*!40000 ALTER TABLE `trackers` DISABLE KEYS */;
INSERT INTO `trackers` VALUES (3,'Ошибка'),(2,'Поддержка'),(1,'Разработка');
/*!40000 ALTER TABLE `trackers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `middle_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `role` enum('распределитель','начальник','работник') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `department_id` int NOT NULL,
  `full_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `photo_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `department_id` (`department_id`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`department_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Тагир','Ренатович','Абдуллин','@123','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','начальник',1,'Абдуллин Тагир Ренатович','photos/user_1.png'),(14,'Илья','','Иванов','@000','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','работник',1,'Иванов Иван',NULL),(15,'Елена','Степановна','Орлова','@1234','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','распределитель',4,'Орлова Елена Степановна',NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'ticket_system'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-10  0:02:44
