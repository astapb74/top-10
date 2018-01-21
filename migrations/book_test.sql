-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               5.6.37 - MySQL Community Server (GPL)
-- Операционная система:         Win32
-- HeidiSQL Версия:              9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Дамп структуры базы данных book_test
DROP DATABASE IF EXISTS `book_test`;
CREATE DATABASE IF NOT EXISTS `book_test` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `book_test`;

-- Дамп структуры для таблица book_test.autors
DROP TABLE IF EXISTS `autors`;
CREATE TABLE IF NOT EXISTS `autors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fio` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы book_test.autors: ~7 rows (приблизительно)
DELETE FROM `autors`;
/*!40000 ALTER TABLE `autors` DISABLE KEYS */;
INSERT INTO `autors` (`id`, `fio`) VALUES
	(1, 'Костин М.Ю.'),
	(2, 'Липатов Адрей'),
	(3, 'Пушкин А.С.'),
	(4, 'Лермонтов М.Ю.'),
	(5, 'Толстой Л.Н.'),
	(6, 'Стивин Кинг'),
	(7, 'Гоголь Н.В.');
/*!40000 ALTER TABLE `autors` ENABLE KEYS */;

-- Дамп структуры для таблица book_test.books
DROP TABLE IF EXISTS `books`;
CREATE TABLE IF NOT EXISTS `books` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(120) NOT NULL,
  `image_id` int(11) NOT NULL,
  `desc` text NOT NULL,
  `dt` int(11) NOT NULL,
  `isbn` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `books_image` (`image_id`),
  CONSTRAINT `books_image` FOREIGN KEY (`image_id`) REFERENCES `images` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы book_test.books: ~5 rows (приблизительно)
DELETE FROM `books`;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` (`id`, `name`, `image_id`, `desc`, `dt`, `isbn`) VALUES
	(3, 'Невеста вне отбора', 13, 'В семнадцать лет Катти мечтала оказаться в числе избранниц принца. Но в двадцать заветное желание стало болью - из-за несчастного случая она обзавелась тростью. Вот только судьба все равно решила исполнить мечту и на голове Катти загорелся венец невесты-избранницы. Насмешка судьбы или издевка? Или, все же, шанс на счастье...\r\nАльтгар, один из сильнейших магов королевства, презирает участниц отбора. Он знает, что им нужен только статус и золото. Особенно сильно его раздражает Катарина ван Ретт. Эта девица не постеснялась даже хромоты!\r\nРоман в одном томе\r\nподписка возможна\r\nОбновления - ежедневно, за исключением воскресенья', 1991, 'dddddddd'),
	(4, 'Мой босс, Тёмный Князь', 16, 'Владельцу нефтяной компании Князеву Владиславу Мстиславовичу срочно требуется помощница. Обязательные требования: пожилая и умная. Ведь все его предыдущие кандидатки думали вовсе не о работе, а о том, как выскочить замуж за богатого и привлекательного босса. \r\nОднако это место, кровь из носу, нужно молодой и свободной девушке, Золоторёвой Софии Николаевне, ведь если она не добьется этого, то останется без будущего…\r\n', 2000, 'aaaaaaaa'),
	(5, 'Попаданка в академии драконов 2', 17, 'Если принц-дракон считает тебя своим любимым сокровищем – не отчаивайся! \r\nКогда втягивают в придворные интриги – не опускай руки! \r\nВсем врагам покажи, где у землян раки зимуют. \r\nВ мире магии возможно почти всё, дерзай, ведь на кону твоё счастье…', 1998, 'bbbbbb'),
	(6, 'Порочная невеста', 19, 'Легкая романтичная сказка. Хэ́ппи-энд.\r\nЮной Фабиане приходится скрывать свой редкий дар от посторонних, она видит эхо людей, покинувших этот мир и знает постыдные тайны живых. Получив предложение руки и сердца от уважаемого лорда, девушка вынуждена отказать, понимая, что за маской учтивости и благородства скрывается садист и мерзавец. Но несостоявшийся жених намерен заполучить непокорную красавицу, и совершает низкий поступок. Теперь репутация униженной и опороченной Фабианы висит на волоске, высший свет отвернулся, некогда близкие друзья предали, а поклонники предпочли исчезнуть. Казалось все потеряно и нет возможности на спасение, но неожиданно она получает странное и пугающе предложение.', 1980, 'tttttttttt'),
	(7, 'Провинциалка для сноба. Меж двух огней (книга 2)', 22, 'Куда бежать от любви и чужих тараканов?\r\nКонечно, в Питер - город, побывать в котором мечтаешь с детства, а теперь мечта твоя может стать явью.\r\nТам тебя ждет хорошая работа и новая жизнь. Только вот, ты уверена, что и там тебя не настигнут отголоски прошлой жизни. А настигнув, не ворвутся в новую, сметая на своем пути все то, что ты так старательно пытаешься построить.\r\n', 2000, 'bbbbbmmm');
/*!40000 ALTER TABLE `books` ENABLE KEYS */;

-- Дамп структуры для таблица book_test.books_has_autor
DROP TABLE IF EXISTS `books_has_autor`;
CREATE TABLE IF NOT EXISTS `books_has_autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `book_id` int(11) NOT NULL,
  `autor_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `autors_books` (`book_id`),
  KEY `books_autors` (`autor_id`),
  CONSTRAINT `autors_books` FOREIGN KEY (`book_id`) REFERENCES `books` (`id`) ON DELETE NO ACTION,
  CONSTRAINT `books_autors` FOREIGN KEY (`autor_id`) REFERENCES `autors` (`id`) ON DELETE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы book_test.books_has_autor: ~8 rows (приблизительно)
DELETE FROM `books_has_autor`;
/*!40000 ALTER TABLE `books_has_autor` DISABLE KEYS */;
INSERT INTO `books_has_autor` (`id`, `book_id`, `autor_id`) VALUES
	(3, 3, 1),
	(4, 3, 4),
	(5, 4, 6),
	(6, 5, 3),
	(7, 5, 5),
	(8, 6, 2),
	(10, 7, 1),
	(11, 7, 6);
/*!40000 ALTER TABLE `books_has_autor` ENABLE KEYS */;

-- Дамп структуры для таблица book_test.images
DROP TABLE IF EXISTS `images`;
CREATE TABLE IF NOT EXISTS `images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) DEFAULT NULL,
  `path` varchar(250) DEFAULT NULL,
  `mine` varchar(50) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- Дамп данных таблицы book_test.images: ~5 rows (приблизительно)
DELETE FROM `images`;
/*!40000 ALTER TABLE `images` DISABLE KEYS */;
INSERT INTO `images` (`id`, `name`, `path`, `mine`, `size`) VALUES
	(13, '1513884878_97.jpg', 'uploads/5a64adda32fd3.jpg', 'image/jpeg', 9327),
	(16, '1511245775_29.jpg', 'uploads/5a64af25584b8.jpg', 'image/jpeg', 8639),
	(17, '1513631854_88.jpg', 'uploads/5a64af4509f14.jpg', 'image/jpeg', 9628),
	(19, '1513884878_97.jpg', 'uploads/5a64aff2cf3b9.jpg', 'image/jpeg', 9327),
	(22, '1515598361_96.jpg', 'uploads/5a64caa4bc05b.jpg', 'image/jpeg', 6972);
/*!40000 ALTER TABLE `images` ENABLE KEYS */;

-- Дамп структуры для таблица book_test.migration
DROP TABLE IF EXISTS `migration`;
CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Дамп данных таблицы book_test.migration: ~18 rows (приблизительно)
DELETE FROM `migration`;
/*!40000 ALTER TABLE `migration` DISABLE KEYS */;
INSERT INTO `migration` (`version`, `apply_time`) VALUES
	('m000000_000000_base', 1516455000),
	('m140209_132017_init', 1516456115),
	('m140403_174025_create_account_table', 1516456117),
	('m140504_113157_update_tables', 1516456121),
	('m140504_130429_create_token_table', 1516456122),
	('m140830_171933_fix_ip_field', 1516456123),
	('m140830_172703_change_account_table_name', 1516456123),
	('m141222_110026_update_ip_field', 1516456124),
	('m141222_135246_alter_username_length', 1516456124),
	('m150614_103145_update_social_account_table', 1516456128),
	('m150623_212711_fix_username_notnull', 1516456128),
	('m151218_234654_add_timezone_to_profile', 1516456129),
	('m160929_103127_add_last_login_at_to_user_table', 1516456130),
	('m180120_153012_images', 1516462504),
	('m180120_153540_books', 1516463227),
	('m180120_153642_autors', 1516463227),
	('m180120_154253_books_has_autor', 1516463228),
	('m180121_075716_book_autors_add_foregin', 1516522250),
	('m180121_110934_add_autors_list', 1516533752),
	('m180121_114642_books_add_colums_desc_dt_isbn', 1516535465);
/*!40000 ALTER TABLE `migration` ENABLE KEYS */;

-- Дамп структуры для таблица book_test.profile
DROP TABLE IF EXISTS `profile`;
CREATE TABLE IF NOT EXISTS `profile` (
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `public_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gravatar_id` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bio` text COLLATE utf8_unicode_ci,
  `timezone` varchar(40) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы book_test.profile: ~0 rows (приблизительно)
DELETE FROM `profile`;
/*!40000 ALTER TABLE `profile` DISABLE KEYS */;
INSERT INTO `profile` (`user_id`, `name`, `public_email`, `gravatar_email`, `gravatar_id`, `location`, `website`, `bio`, `timezone`) VALUES
	(2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
/*!40000 ALTER TABLE `profile` ENABLE KEYS */;

-- Дамп структуры для таблица book_test.social_account
DROP TABLE IF EXISTS `social_account`;
CREATE TABLE IF NOT EXISTS `social_account` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `code` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `account_unique` (`provider`,`client_id`),
  UNIQUE KEY `account_unique_code` (`code`),
  KEY `fk_user_account` (`user_id`),
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы book_test.social_account: ~0 rows (приблизительно)
DELETE FROM `social_account`;
/*!40000 ALTER TABLE `social_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `social_account` ENABLE KEYS */;

-- Дамп структуры для таблица book_test.token
DROP TABLE IF EXISTS `token`;
CREATE TABLE IF NOT EXISTS `token` (
  `user_id` int(11) NOT NULL,
  `code` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) NOT NULL,
  `type` smallint(6) NOT NULL,
  UNIQUE KEY `token_unique` (`user_id`,`code`,`type`),
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы book_test.token: ~0 rows (приблизительно)
DELETE FROM `token`;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;

-- Дамп структуры для таблица book_test.user
DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int(11) DEFAULT NULL,
  `unconfirmed_email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `blocked_at` int(11) DEFAULT NULL,
  `registration_ip` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  `flags` int(11) NOT NULL DEFAULT '0',
  `last_login_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_unique_username` (`username`),
  UNIQUE KEY `user_unique_email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Дамп данных таблицы book_test.user: ~0 rows (приблизительно)
DELETE FROM `user`;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`id`, `username`, `email`, `password_hash`, `auth_key`, `confirmed_at`, `unconfirmed_email`, `blocked_at`, `registration_ip`, `created_at`, `updated_at`, `flags`, `last_login_at`) VALUES
	(2, 'admin', 'mpeegy@ya.ru', '$2y$10$jENjg60RE.iOb5g2HS8XEeHL6sYJ739O2JRh1RKM8dGskFOsFM9MC', '3ODHxcg2jjW3h8u1em_fXnJidnFtIEdf', 1516457612, NULL, NULL, NULL, 1516457612, 1516457612, 0, 1516461780);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
