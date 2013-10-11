-- phpMyAdmin SQL Dump
-- version 3.4.10.1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le : Ven 11 Octobre 2013 à 18:03
-- Version du serveur: 5.5.20
-- Version de PHP: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `barre`
--

-- --------------------------------------------------------

--
-- Structure de la table `acl_classes`
--

CREATE TABLE IF NOT EXISTS `acl_classes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_type` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_69DD750638A36066` (`class_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `acl_entries`
--

CREATE TABLE IF NOT EXISTS `acl_entries` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `class_id` int(10) unsigned NOT NULL,
  `object_identity_id` int(10) unsigned DEFAULT NULL,
  `security_identity_id` int(10) unsigned NOT NULL,
  `field_name` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ace_order` smallint(5) unsigned NOT NULL,
  `mask` int(11) NOT NULL,
  `granting` tinyint(1) NOT NULL,
  `granting_strategy` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `audit_success` tinyint(1) NOT NULL,
  `audit_failure` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_46C8B806EA000B103D9AB4A64DEF17BCE4289BF4` (`class_id`,`object_identity_id`,`field_name`,`ace_order`),
  KEY `IDX_46C8B806EA000B103D9AB4A6DF9183C9` (`class_id`,`object_identity_id`,`security_identity_id`),
  KEY `IDX_46C8B806EA000B10` (`class_id`),
  KEY `IDX_46C8B8063D9AB4A6` (`object_identity_id`),
  KEY `IDX_46C8B806DF9183C9` (`security_identity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `acl_object_identities`
--

CREATE TABLE IF NOT EXISTS `acl_object_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_object_identity_id` int(10) unsigned DEFAULT NULL,
  `class_id` int(10) unsigned NOT NULL,
  `object_identifier` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `entries_inheriting` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_9407E5494B12AD6EA000B10` (`object_identifier`,`class_id`),
  KEY `IDX_9407E54977FA751A` (`parent_object_identity_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `acl_object_identity_ancestors`
--

CREATE TABLE IF NOT EXISTS `acl_object_identity_ancestors` (
  `object_identity_id` int(10) unsigned NOT NULL,
  `ancestor_id` int(10) unsigned NOT NULL,
  PRIMARY KEY (`object_identity_id`,`ancestor_id`),
  KEY `IDX_825DE2993D9AB4A6` (`object_identity_id`),
  KEY `IDX_825DE299C671CEA1` (`ancestor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `acl_security_identities`
--

CREATE TABLE IF NOT EXISTS `acl_security_identities` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `identifier` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  `username` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8835EE78772E836AF85E0677` (`identifier`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descreption` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `article`
--

INSERT INTO `article` (`id`, `title`, `descreption`) VALUES
(1, 'alo', 'test');

-- --------------------------------------------------------

--
-- Structure de la table `classification__category`
--

CREATE TABLE IF NOT EXISTS `classification__category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_43629B36727ACA70` (`parent_id`),
  KEY `IDX_43629B36EA9FDD75` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `classification__collection`
--

CREATE TABLE IF NOT EXISTS `classification__collection` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `media_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A406B56AEA9FDD75` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `classification__tag`
--

CREATE TABLE IF NOT EXISTS `classification__tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `classification__tag`
--

INSERT INTO `classification__tag` (`id`, `name`, `enabled`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'football', 0, 'football', '2013-10-11 11:19:27', '2013-10-11 11:19:27');

-- --------------------------------------------------------

--
-- Structure de la table `fos_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_583D1F3E5E237E06` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `fos_user_user`
--

CREATE TABLE IF NOT EXISTS `fos_user_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `firstname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lastname` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `website` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `biography` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gender` varchar(1) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locale` varchar(8) COLLATE utf8_unicode_ci DEFAULT NULL,
  `timezone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phone` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `facebook_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `twitter_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `twitter_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `gplus_uid` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `gplus_data` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `two_step_code` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email_canonical` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `salt` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `last_login` datetime DEFAULT NULL,
  `locked` tinyint(1) NOT NULL,
  `expired` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  `confirmation_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_requested_at` datetime DEFAULT NULL,
  `roles` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:array)',
  `credentials_expired` tinyint(1) NOT NULL,
  `credentials_expire_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_C560D76192FC23A8` (`username_canonical`),
  UNIQUE KEY `UNIQ_C560D761A0D96FBF` (`email_canonical`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `fos_user_user`
--

INSERT INTO `fos_user_user` (`id`, `created_at`, `updated_at`, `date_of_birth`, `firstname`, `lastname`, `website`, `biography`, `gender`, `locale`, `timezone`, `phone`, `facebook_uid`, `facebook_name`, `facebook_data`, `twitter_uid`, `twitter_name`, `twitter_data`, `gplus_uid`, `gplus_name`, `gplus_data`, `token`, `two_step_code`, `username`, `username_canonical`, `email`, `email_canonical`, `enabled`, `salt`, `password`, `last_login`, `locked`, `expired`, `expires_at`, `confirmation_token`, `password_requested_at`, `roles`, `credentials_expired`, `credentials_expire_at`) VALUES
(1, '2013-10-10 15:06:41', '2013-10-11 13:22:41', NULL, NULL, NULL, NULL, NULL, 'u', NULL, NULL, NULL, NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'null', NULL, NULL, 'fareh', 'fareh', 'fareh.nasreddine@gmail.com', 'fareh.nasreddine@gmail.com', 1, 'o00yw4aneg0kkokgc08cggswg84ckwo', 'pm3NPs2ibDEh/o+y7aa5JGOYKa48DXJvmcao85PU2INqBBLV5bdi+Jkjfb65PQAuZPaHX6a/0+n2cpl54WA8oA==', '2013-10-11 13:22:41', 0, 0, NULL, NULL, NULL, 'a:1:{i:0;s:10:"ROLE_ADMIN";}', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `fos_user_user_group`
--

CREATE TABLE IF NOT EXISTS `fos_user_user_group` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_B3C77447A76ED395` (`user_id`),
  KEY `IDX_B3C77447FE54D947` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `media__gallery`
--

CREATE TABLE IF NOT EXISTS `media__gallery` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `default_format` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `media__gallery_media`
--

CREATE TABLE IF NOT EXISTS `media__gallery_media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gallery_id` int(11) DEFAULT NULL,
  `media_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_80D4C5414E7AF8F` (`gallery_id`),
  KEY `IDX_80D4C541EA9FDD75` (`media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `media__media`
--

CREATE TABLE IF NOT EXISTS `media__media` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `enabled` tinyint(1) NOT NULL,
  `provider_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_status` int(11) NOT NULL,
  `provider_reference` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `provider_metadata` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `length` decimal(10,0) DEFAULT NULL,
  `content_type` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content_size` int(11) DEFAULT NULL,
  `copyright` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author_name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `context` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cdn_is_flushable` tinyint(1) DEFAULT NULL,
  `cdn_flush_at` datetime DEFAULT NULL,
  `cdn_status` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `media__media`
--

INSERT INTO `media__media` (`id`, `name`, `description`, `enabled`, `provider_name`, `provider_status`, `provider_reference`, `provider_metadata`, `width`, `height`, `length`, `content_type`, `content_size`, `copyright`, `author_name`, `context`, `cdn_is_flushable`, `cdn_flush_at`, `cdn_status`, `updated_at`, `created_at`) VALUES
(1, '6E644A22.jpg', NULL, 1, 'sonata.media.provider.image', 1, 'c714d49f3e5a5dc42ed90df70c251ed371fac690.jpeg', '{"filename":"6E644A22.jpg"}', 1280, 960, NULL, 'image/jpeg', 464284, NULL, 'FAREH', 'default', 1, NULL, NULL, '2013-10-11 11:42:11', '2013-10-11 11:41:42');

-- --------------------------------------------------------

--
-- Structure de la table `my_custom_user_group_association_table_name`
--

CREATE TABLE IF NOT EXISTS `my_custom_user_group_association_table_name` (
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`group_id`),
  KEY `IDX_D1C9A4DCA76ED395` (`user_id`),
  KEY `IDX_D1C9A4DCFE54D947` (`group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `news__comment`
--

CREATE TABLE IF NOT EXISTS `news__comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `message` longtext COLLATE utf8_unicode_ci NOT NULL,
  `status` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `post_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_A90210404B89032C` (`post_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `news__comment`
--

INSERT INTO `news__comment` (`id`, `name`, `url`, `email`, `message`, `status`, `created_at`, `updated_at`, `post_id`) VALUES
(1, 'fareh', 'http://sonata-project.org/bundles/classification/master/doc/index.html', 'fareh@a.com', 'azszasa', 1, '2013-10-11 11:24:54', '2013-10-11 11:25:47', 1);

-- --------------------------------------------------------

--
-- Structure de la table `news__post`
--

CREATE TABLE IF NOT EXISTS `news__post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `abstract` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `raw_content` longtext COLLATE utf8_unicode_ci NOT NULL,
  `content_formatter` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `publication_date_start` datetime DEFAULT NULL,
  `comments_enabled` tinyint(1) NOT NULL,
  `comments_close_at` datetime DEFAULT NULL,
  `comments_default_status` int(11) NOT NULL,
  `comments_count` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `image_id` int(11) DEFAULT NULL,
  `author_id` int(11) DEFAULT NULL,
  `collection_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_7D109BC83DA5256D` (`image_id`),
  KEY `IDX_7D109BC8F675F31B` (`author_id`),
  KEY `IDX_7D109BC8514956FD` (`collection_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `news__post`
--

INSERT INTO `news__post` (`id`, `title`, `abstract`, `content`, `raw_content`, `content_formatter`, `enabled`, `slug`, `publication_date_start`, `comments_enabled`, `comments_close_at`, `comments_default_status`, `comments_count`, `created_at`, `updated_at`, `image_id`, `author_id`, `collection_id`) VALUES
(1, 'Le PSG cartonne en CFA', 'Ce weekend, alors que le PSG s’imposait au Vélodrome et que Monaco battait Saint-Etienne, avait lieu la 7ème journée du CFA. Passage en revue des principaux résultats et des matchs à suivre le week-end prochain.', 'Groupe A\n\nLe choc entre le leader Roye et le 3e Chambly a accouché d’un match nul (1-1), qui permet aux Royens d’obtenir un bon résultat en déplacement et de conforter leur première place du groupe. Grâce à sa victoire (3-2) face à Drancy, l’Entente Sannois-Saint-Gratien recolle à la tête du championnat, ex-aequo avec Roye (20 pts). Suivent Quevilly et Ivry (19 pts) et Chambly (18 pts).\n\nLa performance du weekend est à mettre au crédit de la réserve du PSG, qui l’a emporté 5-1 à Aubervilliers, grâce notamment à un but de Jean-Eudes Maurice. Les Parisiens sont 6e, à 3 points de la tête mais avec un match en moins que toutes les équipes du top 5.\n\nA suivre ce week-end : Nouveau derby pour le PSG B (6ème) qui recevra Ivry (4ème) avec pour objectif d’intégrer le top 5.\n\nGroupe B\n\nLa réserve de l’OL a bien failli créer l’un des exploits du weekend. Recevant Moulins, les jeunes gones, menés 4-0 à la mi-temps, ont inscrit trois buts (dont un coup-franc de Nabil Fekir) en seconde mi-temps, revenant à 4-3 à la 81e, mais ont été incapables d’égaliser.\n\nLa grosse performance du weekend est l’œuvre d’Epinal, vainqueur 5-2 à l’extérieur face à la réserve de Sochaux (2e avant cette journée). Yzeure est toujours en tête de ce groupe, trois points devant Moulins et Lyon Duchère et quatre devant Epinal.\n\nA suivre ce week-end : Samedi, duel au sommet entre Moulins (2e) et Yzeure (1er) sur la pelouse du dauphin. Le maillot jaune pourrait changer d’épaules.\n\nGroupe C\n\nL’équipe B de Monaco continue sa marche en avant avec une victoire (2-0) à Martigues pour consolider sa première place, dans un match haché (3 cartons rouges dont deux pour Martigues). Les Monégasques sont tout de même à portée de tir de Marseille Consolat (4 points derrière mais avec un match en retard).\n\nCe weekend, l’AS Cannes a été battu à domicile par Tarbes (1-2) et Grenoble a obtenu le match nul (1-1) à Hyères. Les Cannois sont quatrièmes et les Grenoblois cinquièmes.\n\nA suivre ce week-end : Pas de gros choc en tête du groupe, on suivra tout de même le résultat entre la réserve de Monaco et Rodez (7e, à 4 pts de la zone de promotion en national).\n\nGroupe D\n\nLe leader Avranches a perdu ses premiers points de la saison, en concédant le nul sur le terrain de la réserve de Bordeaux (0-0). Avec six victoires et un nul en sept journées, Avranches mène tout de même tranquillement la danse dans ce groupe.\n\nSaint-Malo suit tout de même à un point grâce à sa victoire (3-0) face à Fontenay. Les Herbiers complètent le podium grâce à un succès (4-0) face à la lanterne rouge Cherbourg.\n\nA suivre ce week-end : Pas vraiment un match entre équipes de tête, mais on suivra le derby bordelais puisque le Stade Bordelais (13e) recevra la réserve des Girondins de Bordeaux (8e).', 'Groupe A\r\n\r\nLe choc entre le leader Roye et le 3e Chambly a accouché d’un match nul (1-1), qui permet aux Royens d’obtenir un bon résultat en déplacement et de conforter leur première place du groupe. Grâce à sa victoire (3-2) face à Drancy, l’Entente Sannois-Saint-Gratien recolle à la tête du championnat, ex-aequo avec Roye (20 pts). Suivent Quevilly et Ivry (19 pts) et Chambly (18 pts).\r\n\r\nLa performance du weekend est à mettre au crédit de la réserve du PSG, qui l’a emporté 5-1 à Aubervilliers, grâce notamment à un but de Jean-Eudes Maurice. Les Parisiens sont 6e, à 3 points de la tête mais avec un match en moins que toutes les équipes du top 5.\r\n\r\nA suivre ce week-end : Nouveau derby pour le PSG B (6ème) qui recevra Ivry (4ème) avec pour objectif d’intégrer le top 5.\r\n\r\nGroupe B\r\n\r\nLa réserve de l’OL a bien failli créer l’un des exploits du weekend. Recevant Moulins, les jeunes gones, menés 4-0 à la mi-temps, ont inscrit trois buts (dont un coup-franc de Nabil Fekir) en seconde mi-temps, revenant à 4-3 à la 81e, mais ont été incapables d’égaliser.\r\n\r\nLa grosse performance du weekend est l’œuvre d’Epinal, vainqueur 5-2 à l’extérieur face à la réserve de Sochaux (2e avant cette journée). Yzeure est toujours en tête de ce groupe, trois points devant Moulins et Lyon Duchère et quatre devant Epinal.\r\n\r\nA suivre ce week-end : Samedi, duel au sommet entre Moulins (2e) et Yzeure (1er) sur la pelouse du dauphin. Le maillot jaune pourrait changer d’épaules.\r\n\r\nGroupe C\r\n\r\nL’équipe B de Monaco continue sa marche en avant avec une victoire (2-0) à Martigues pour consolider sa première place, dans un match haché (3 cartons rouges dont deux pour Martigues). Les Monégasques sont tout de même à portée de tir de Marseille Consolat (4 points derrière mais avec un match en retard).\r\n\r\nCe weekend, l’AS Cannes a été battu à domicile par Tarbes (1-2) et Grenoble a obtenu le match nul (1-1) à Hyères. Les Cannois sont quatrièmes et les Grenoblois cinquièmes.\r\n\r\nA suivre ce week-end : Pas de gros choc en tête du groupe, on suivra tout de même le résultat entre la réserve de Monaco et Rodez (7e, à 4 pts de la zone de promotion en national).\r\n\r\nGroupe D\r\n\r\nLe leader Avranches a perdu ses premiers points de la saison, en concédant le nul sur le terrain de la réserve de Bordeaux (0-0). Avec six victoires et un nul en sept journées, Avranches mène tout de même tranquillement la danse dans ce groupe.\r\n\r\nSaint-Malo suit tout de même à un point grâce à sa victoire (3-0) face à Fontenay. Les Herbiers complètent le podium grâce à un succès (4-0) face à la lanterne rouge Cherbourg.\r\n\r\nA suivre ce week-end : Pas vraiment un match entre équipes de tête, mais on suivra le derby bordelais puisque le Stade Bordelais (13e) recevra la réserve des Girondins de Bordeaux (8e).', 'richhtml', 1, 'le-psg-cartonne-en-cfa', '2013-10-11 11:16:00', 1, NULL, 2, 0, '2013-10-11 11:19:03', '2013-10-11 11:26:39', NULL, 1, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `news__post_tag`
--

CREATE TABLE IF NOT EXISTS `news__post_tag` (
  `post_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  PRIMARY KEY (`post_id`,`tag_id`),
  KEY `IDX_682B20514B89032C` (`post_id`),
  KEY `IDX_682B2051BAD26311` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `notification__message`
--

CREATE TABLE IF NOT EXISTS `notification__message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `state` int(11) NOT NULL,
  `restart_count` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime DEFAULT NULL,
  `started_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `page__block`
--

CREATE TABLE IF NOT EXISTS `page__block` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `settings` longtext COLLATE utf8_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `enabled` tinyint(1) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_66F58DA0727ACA70` (`parent_id`),
  KEY `IDX_66F58DA0C4663E4` (`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `page__page`
--

CREATE TABLE IF NOT EXISTS `page__page` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `route_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `decorate` tinyint(1) NOT NULL,
  `edited` tinyint(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `slug` longtext COLLATE utf8_unicode_ci,
  `url` longtext COLLATE utf8_unicode_ci,
  `custom_url` longtext COLLATE utf8_unicode_ci,
  `request_method` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keyword` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `javascript` longtext COLLATE utf8_unicode_ci,
  `stylesheet` longtext COLLATE utf8_unicode_ci,
  `raw_headers` longtext COLLATE utf8_unicode_ci,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_2FAE39EDF6BD1646` (`site_id`),
  KEY `IDX_2FAE39ED727ACA70` (`parent_id`),
  KEY `IDX_2FAE39ED158E0B66` (`target_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `page__page`
--

INSERT INTO `page__page` (`id`, `site_id`, `parent_id`, `target_id`, `route_name`, `page_alias`, `type`, `position`, `enabled`, `decorate`, `edited`, `name`, `slug`, `url`, `custom_url`, `request_method`, `title`, `meta_keyword`, `meta_description`, `javascript`, `stylesheet`, `raw_headers`, `template`, `created_at`, `updated_at`) VALUES
(1, 1, NULL, NULL, 'page_slug', NULL, NULL, 1, 1, 1, 1, 'mentions légal', '', '/', NULL, 'GET|POST|HEAD|DELETE|PUT', NULL, NULL, NULL, NULL, NULL, NULL, 'default', '2013-10-11 13:25:25', '2013-10-11 13:25:25');

-- --------------------------------------------------------

--
-- Structure de la table `page__site`
--

CREATE TABLE IF NOT EXISTS `page__site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `enabled` tinyint(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `relative_path` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `host` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `enabled_from` datetime NOT NULL,
  `enabled_to` datetime NOT NULL,
  `is_default` tinyint(1) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `locale` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `title` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `meta_description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Contenu de la table `page__site`
--

INSERT INTO `page__site` (`id`, `enabled`, `name`, `relative_path`, `host`, `enabled_from`, `enabled_to`, `is_default`, `created_at`, `updated_at`, `locale`, `title`, `meta_keywords`, `meta_description`) VALUES
(1, 1, 'localhost', NULL, 'localhost', '2008-01-01 00:00:00', '2008-01-01 00:00:00', 1, '2013-10-11 13:24:19', '2013-10-11 13:24:19', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `page__snapshot`
--

CREATE TABLE IF NOT EXISTS `page__snapshot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `site_id` int(11) DEFAULT NULL,
  `page_id` int(11) DEFAULT NULL,
  `route_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `page_alias` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` int(11) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  `decorate` tinyint(1) NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `url` longtext COLLATE utf8_unicode_ci,
  `parent_id` int(11) DEFAULT NULL,
  `target_id` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8_unicode_ci COMMENT '(DC2Type:json)',
  `publication_date_start` datetime DEFAULT NULL,
  `publication_date_end` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_3963EF9AF6BD1646` (`site_id`),
  KEY `IDX_3963EF9AC4663E4` (`page_id`),
  KEY `idx_snapshot_dates_enabled` (`publication_date_start`,`publication_date_end`,`enabled`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `acl_entries`
--
ALTER TABLE `acl_entries`
  ADD CONSTRAINT `FK_46C8B806DF9183C9` FOREIGN KEY (`security_identity_id`) REFERENCES `acl_security_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B8063D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_46C8B806EA000B10` FOREIGN KEY (`class_id`) REFERENCES `acl_classes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `acl_object_identities`
--
ALTER TABLE `acl_object_identities`
  ADD CONSTRAINT `FK_9407E54977FA751A` FOREIGN KEY (`parent_object_identity_id`) REFERENCES `acl_object_identities` (`id`);

--
-- Contraintes pour la table `acl_object_identity_ancestors`
--
ALTER TABLE `acl_object_identity_ancestors`
  ADD CONSTRAINT `FK_825DE299C671CEA1` FOREIGN KEY (`ancestor_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_825DE2993D9AB4A6` FOREIGN KEY (`object_identity_id`) REFERENCES `acl_object_identities` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `classification__category`
--
ALTER TABLE `classification__category`
  ADD CONSTRAINT `FK_43629B36727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `classification__category` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_43629B36EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `classification__collection`
--
ALTER TABLE `classification__collection`
  ADD CONSTRAINT `FK_A406B56AEA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `fos_user_user_group`
--
ALTER TABLE `fos_user_user_group`
  ADD CONSTRAINT `FK_B3C77447FE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_B3C77447A76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `media__gallery_media`
--
ALTER TABLE `media__gallery_media`
  ADD CONSTRAINT `FK_80D4C541EA9FDD75` FOREIGN KEY (`media_id`) REFERENCES `media__media` (`id`),
  ADD CONSTRAINT `FK_80D4C5414E7AF8F` FOREIGN KEY (`gallery_id`) REFERENCES `media__gallery` (`id`);

--
-- Contraintes pour la table `my_custom_user_group_association_table_name`
--
ALTER TABLE `my_custom_user_group_association_table_name`
  ADD CONSTRAINT `FK_D1C9A4DCFE54D947` FOREIGN KEY (`group_id`) REFERENCES `fos_user_group` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_D1C9A4DCA76ED395` FOREIGN KEY (`user_id`) REFERENCES `fos_user_user` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `news__comment`
--
ALTER TABLE `news__comment`
  ADD CONSTRAINT `FK_A90210404B89032C` FOREIGN KEY (`post_id`) REFERENCES `news__post` (`id`);

--
-- Contraintes pour la table `news__post`
--
ALTER TABLE `news__post`
  ADD CONSTRAINT `FK_7D109BC8514956FD` FOREIGN KEY (`collection_id`) REFERENCES `classification__collection` (`id`),
  ADD CONSTRAINT `FK_7D109BC83DA5256D` FOREIGN KEY (`image_id`) REFERENCES `media__media` (`id`),
  ADD CONSTRAINT `FK_7D109BC8F675F31B` FOREIGN KEY (`author_id`) REFERENCES `fos_user_user` (`id`);

--
-- Contraintes pour la table `news__post_tag`
--
ALTER TABLE `news__post_tag`
  ADD CONSTRAINT `FK_682B2051BAD26311` FOREIGN KEY (`tag_id`) REFERENCES `classification__tag` (`id`),
  ADD CONSTRAINT `FK_682B20514B89032C` FOREIGN KEY (`post_id`) REFERENCES `news__post` (`id`);

--
-- Contraintes pour la table `page__block`
--
ALTER TABLE `page__block`
  ADD CONSTRAINT `FK_66F58DA0C4663E4` FOREIGN KEY (`page_id`) REFERENCES `page__page` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_66F58DA0727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `page__block` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `page__page`
--
ALTER TABLE `page__page`
  ADD CONSTRAINT `FK_2FAE39ED158E0B66` FOREIGN KEY (`target_id`) REFERENCES `page__page` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2FAE39ED727ACA70` FOREIGN KEY (`parent_id`) REFERENCES `page__page` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_2FAE39EDF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `page__site` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `page__snapshot`
--
ALTER TABLE `page__snapshot`
  ADD CONSTRAINT `FK_3963EF9AC4663E4` FOREIGN KEY (`page_id`) REFERENCES `page__page` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_3963EF9AF6BD1646` FOREIGN KEY (`site_id`) REFERENCES `page__site` (`id`) ON DELETE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
