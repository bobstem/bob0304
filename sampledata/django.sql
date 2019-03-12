-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.38 - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Дамп структуры для таблица dddjango.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.auth_group: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.auth_group_permissions: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.auth_permission: ~40 rows (приблизительно)
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add choice', 7, 'add_choice'),
	(26, 'Can change choice', 7, 'change_choice'),
	(27, 'Can delete choice', 7, 'delete_choice'),
	(28, 'Can view choice', 7, 'view_choice'),
	(29, 'Can add question', 8, 'add_question'),
	(30, 'Can change question', 8, 'change_question'),
	(31, 'Can delete question', 8, 'delete_question'),
	(32, 'Can view question', 8, 'view_question'),
	(33, 'Can add musician', 9, 'add_musician'),
	(34, 'Can change musician', 9, 'change_musician'),
	(35, 'Can delete musician', 9, 'delete_musician'),
	(36, 'Can view musician', 9, 'view_musician'),
	(37, 'Can add album', 10, 'add_album'),
	(38, 'Can change album', 10, 'change_album'),
	(39, 'Can delete album', 10, 'delete_album'),
	(40, 'Can view album', 10, 'view_album');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.auth_user: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$120000$8WYFGE7fW430$F400hLJRT01NDY+bgAzixL6nRVIx9vyHocNdkiFYt94=', '2019-03-04 17:15:32.958013', 1, 'bob', '', '', 'artembor.gvr@gmail.com', 1, 1, '2019-03-04 17:08:35.650145');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.auth_user_groups: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.auth_user_user_permissions: ~0 rows (приблизительно)
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.django_admin_log: ~21 rows (приблизительно)
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2019-03-05 09:49:59.545939', '1', 'Есть ли жизнь на Марсе', 1, '[{"added": {}}]', 8, 1),
	(2, '2019-03-05 09:50:18.584028', '2', 'Есть ли жизнь на Земле', 1, '[{"added": {}}]', 8, 1),
	(3, '2019-03-05 09:50:44.645519', '3', 'Есть ли жизнь на Солнце', 1, '[{"added": {}}]', 8, 1),
	(4, '2019-03-05 11:24:38.005728', '4', 'Есть', 1, '[{"added": {}}]', 7, 1),
	(5, '2019-03-05 11:24:45.908180', '5', 'нет', 1, '[{"added": {}}]', 7, 1),
	(6, '2019-03-05 11:24:54.775688', '6', 'есть', 1, '[{"added": {}}]', 7, 1),
	(7, '2019-03-05 11:25:03.260173', '7', 'нет', 1, '[{"added": {}}]', 7, 1),
	(8, '2019-03-05 11:26:42.125828', '8', 'tcnm', 1, '[{"added": {}}]', 7, 1),
	(9, '2019-03-05 11:26:52.863442', '9', 'нет', 1, '[{"added": {}}]', 7, 1),
	(10, '2019-03-05 11:27:06.497222', '8', 'есть', 2, '[{"changed": {"fields": ["choice_text"]}}]', 7, 1),
	(11, '2019-03-05 11:27:48.323614', '10', 'Затрудняюсь ответить', 1, '[{"added": {}}]', 7, 1),
	(12, '2019-03-05 13:39:24.506250', '1', 'Musician object (1)', 1, '[{"added": {}}]', 9, 1),
	(13, '2019-03-05 13:39:42.730292', '2', 'Musician object (2)', 1, '[{"added": {}}]', 9, 1),
	(14, '2019-03-05 13:40:01.903389', '3', 'Musician object (3)', 1, '[{"added": {}}]', 9, 1),
	(15, '2019-03-05 13:42:57.172414', '1', 'Album object (1)', 1, '[{"added": {}}]', 10, 1),
	(16, '2019-03-05 13:43:12.958316', '2', 'Album object (2)', 1, '[{"added": {}}]', 10, 1),
	(17, '2019-03-05 13:47:26.621825', '1', 'соло для балалайки', 2, '[{"changed": {"fields": ["artist"]}}]', 10, 1),
	(18, '2019-03-05 13:55:12.035445', '2', 'соло для рояля', 2, '[]', 10, 1),
	(19, '2019-03-05 15:28:38.520118', '4', 'Кто будет презиком', 1, '[{"added": {}}, {"added": {"name": "choice", "object": "\\u041f\\u043e\\u0440\\u043e\\u0445"}}, {"added": {"name": "choice", "object": "\\u0417\\u0435\\u043b\\u0435\\u043d\\u044b\\u0439"}}, {"added": {"name": "choice", "object": "\\u043c\\u0430\\u043c\\u043a\\u0430"}}]', 8, 1),
	(20, '2019-03-05 16:12:09.116435', '2', 'Гавриленко', 2, '[]', 9, 1),
	(21, '2019-03-05 16:13:16.967316', '4', 'Алимова', 1, '[{"added": {}}, {"added": {"name": "album", "object": "\\u043f\\u0435\\u0441\\u043d\\u044f\\u0440\\u044b"}}, {"added": {"name": "album", "object": "\\u0441\\u0430\\u043c\\u043e\\u0446\\u0432\\u0435\\u0442\\u044b"}}]', 9, 1),
	(22, '2019-03-05 17:15:05.419428', '4', 'самоцветы', 2, '[{"changed": {"fields": ["release_date"]}}]', 10, 1),
	(23, '2019-03-05 17:15:51.279051', '3', 'песняры', 2, '[{"changed": {"fields": ["release_date"]}}]', 10, 1),
	(24, '2019-03-06 09:04:56.681274', '3', 'Шитов', 2, '[]', 9, 1),
	(25, '2019-03-06 14:26:35.433099', '1', 'Билык', 2, '[{"added": {"name": "album", "object": "\\u0430\\u043b\\u044c\\u0431\\u043e\\u043c \\u041e\\u043b\\u0435\\u0433\\u0430"}}]', 9, 1),
	(26, '2019-03-06 14:33:08.159562', '1', 'Билык', 2, '[{"added": {"name": "album", "object": "\\u0432\\u0442\\u043e\\u0440\\u043e\\u0439 \\u0430\\u043b\\u044c\\u0431\\u043e\\u043c \\u041e\\u043b\\u0435\\u0433\\u0430"}}]', 9, 1),
	(27, '2019-03-10 11:55:08.853053', '409', '" or 1=1 drop table', 3, '', 11, 1),
	(28, '2019-03-10 11:55:08.854053', '408', '  ', 3, '', 11, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.django_content_type: ~8 rows (приблизительно)
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(10, 'polls', 'album'),
	(7, 'polls', 'choice'),
	(9, 'polls', 'musician'),
	(8, 'polls', 'question'),
	(11, 'polls', 'users'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.django_migrations: ~15 rows (приблизительно)
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2019-03-04 16:52:05.864532'),
	(2, 'auth', '0001_initial', '2019-03-04 16:52:19.358304'),
	(3, 'admin', '0001_initial', '2019-03-04 16:52:21.025399'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2019-03-04 16:52:21.041400'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2019-03-04 16:52:21.057401'),
	(6, 'contenttypes', '0002_remove_content_type_name', '2019-03-04 16:52:22.007455'),
	(7, 'auth', '0002_alter_permission_name_max_length', '2019-03-04 16:52:22.422479'),
	(8, 'auth', '0003_alter_user_email_max_length', '2019-03-04 16:52:23.071516'),
	(9, 'auth', '0004_alter_user_username_opts', '2019-03-04 16:52:23.088517'),
	(10, 'auth', '0005_alter_user_last_login_null', '2019-03-04 16:52:23.594546'),
	(11, 'auth', '0006_require_contenttypes_0002', '2019-03-04 16:52:23.598546'),
	(12, 'auth', '0007_alter_validators_add_error_messages', '2019-03-04 16:52:23.611547'),
	(13, 'auth', '0008_alter_user_username_max_length', '2019-03-04 16:52:24.025571'),
	(14, 'auth', '0009_alter_user_last_name_max_length', '2019-03-04 16:52:24.640606'),
	(15, 'sessions', '0001_initial', '2019-03-04 16:52:25.169636'),
	(16, 'polls', '0001_initial', '2019-03-05 09:07:06.838789'),
	(17, 'polls', '0002_auto_20190305_1536', '2019-03-05 13:37:03.637193'),
	(18, 'polls', '0003_auto_20190306_1832', '2019-03-06 16:32:34.160434');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.django_session: ~1 rows (приблизительно)
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('glzvo9xt8ku2s7674jngcmtqeu9sqknm', 'ZDYyZWVlODdlNTM3NGE4OTE5ZTVhZjA5MmYxMDZiZjZiNzdmYmVkNzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJkOGVkM2UzMDMzZDE2NzNhOGE1YzE2MTRmODQ5NWJjOTMzMzE5YjQ5In0=', '2019-03-18 17:15:32.984015');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.polls_album
CREATE TABLE IF NOT EXISTS `polls_album` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `release_date` date NOT NULL,
  `num_stars` int(11) NOT NULL,
  `artist_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_album_artist_id_0eab7421_fk_polls_musician_id` (`artist_id`),
  CONSTRAINT `polls_album_artist_id_0eab7421_fk_polls_musician_id` FOREIGN KEY (`artist_id`) REFERENCES `polls_musician` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.polls_album: ~6 rows (приблизительно)
/*!40000 ALTER TABLE `polls_album` DISABLE KEYS */;
INSERT INTO `polls_album` (`id`, `name`, `release_date`, `num_stars`, `artist_id`) VALUES
	(1, 'соло для балалайки', '2019-03-05', 2, 2),
	(2, 'соло для рояля', '2019-03-05', 1, 2),
	(3, 'песняры', '2018-12-12', 0, 4),
	(4, 'самоцветы', '2019-03-04', 0, 4),
	(5, 'альбом Олега', '2019-03-06', 0, 1),
	(6, 'второй альбом Олега', '2019-03-06', 0, 1);
/*!40000 ALTER TABLE `polls_album` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.polls_choice
CREATE TABLE IF NOT EXISTS `polls_choice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `polls_choice_question_id_c5b4b260_fk_polls_question_id` (`question_id`),
  CONSTRAINT `polls_choice_question_id_c5b4b260_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.polls_choice: ~10 rows (приблизительно)
/*!40000 ALTER TABLE `polls_choice` DISABLE KEYS */;
INSERT INTO `polls_choice` (`id`, `choice_text`, `votes`, `question_id`) VALUES
	(4, 'Есть', 2, 1),
	(5, 'нет', 5, 1),
	(6, 'есть', 2, 2),
	(7, 'нет', 1, 2),
	(8, 'есть', 2, 3),
	(9, 'нет', 1, 3),
	(10, 'Затрудняюсь ответить', 3, 1),
	(11, 'Порох', 1, 4),
	(12, 'Зеленый', 3, 4),
	(13, 'мамка', 1, 4);
/*!40000 ALTER TABLE `polls_choice` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.polls_musician
CREATE TABLE IF NOT EXISTS `polls_musician` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `instrument` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.polls_musician: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `polls_musician` DISABLE KEYS */;
INSERT INTO `polls_musician` (`id`, `first_name`, `last_name`, `instrument`) VALUES
	(1, 'Олег', 'Билык', 'балалайка'),
	(2, 'Борис', 'Гавриленко', 'рояль'),
	(3, 'Максим', 'Шитов', 'тромбон'),
	(4, 'Нина', 'Алимова', 'грамофон');
/*!40000 ALTER TABLE `polls_musician` ENABLE KEYS */;

-- Дамп структуры для таблица dddjango.polls_question
CREATE TABLE IF NOT EXISTS `polls_question` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы dddjango.polls_question: ~4 rows (приблизительно)
/*!40000 ALTER TABLE `polls_question` DISABLE KEYS */;
INSERT INTO `polls_question` (`id`, `question_text`, `pub_date`) VALUES
	(1, 'Есть ли жизнь на Марсе', '2019-03-05 09:49:35.000000'),
	(2, 'Есть ли жизнь на Земле', '2019-03-04 09:50:10.000000'),
	(3, 'Есть ли жизнь на Солнце', '2019-03-01 09:50:42.000000'),
	(4, 'Кто будет презиком', '2019-03-05 15:28:06.000000');
/*!40000 ALTER TABLE `polls_question` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
