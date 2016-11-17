-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jun 17, 2016 at 04:08 PM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `lapor`
--

-- --------------------------------------------------------

--
-- Table structure for table `agreedisagree`
--

CREATE TABLE IF NOT EXISTS `agreedisagree` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `stream_id` bigint(20) DEFAULT NULL,
  `agreedisagree` tinyint(4) DEFAULT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=27088 ;

-- --------------------------------------------------------

--
-- Table structure for table `bannednohp`
--

CREATE TABLE IF NOT EXISTS `bannednohp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nohp` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=179 ;

-- --------------------------------------------------------

--
-- Table structure for table `bukan_wewenang`
--

CREATE TABLE IF NOT EXISTS `bukan_wewenang` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_id` bigint(20) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `saran_instansi_id` int(11) NOT NULL,
  `alasan` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `respon` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `respon_by` bigint(20) DEFAULT NULL,
  `respon_timestamp` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stream_idx` (`stream_id`),
  KEY `user_idx` (`user_id`),
  KEY `status_idx` (`status`),
  KEY `responby_idx` (`respon_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC AUTO_INCREMENT=557 ;

-- --------------------------------------------------------

--
-- Table structure for table `ci_sessions`
--

CREATE TABLE IF NOT EXISTS `ci_sessions` (
  `session_id` varchar(40) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `ip_address` varchar(16) COLLATE utf8_bin NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_activity` int(10) unsigned NOT NULL DEFAULT '0',
  `user_data` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `claims`
--

CREATE TABLE IF NOT EXISTS `claims` (
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_nid` bigint(20) DEFAULT NULL,
  `user_nid` bigint(20) DEFAULT NULL,
  `claim_text` text CHARACTER SET latin1,
  `ref_filename` varchar(100) CHARACTER SET latin1 DEFAULT NULL,
  `ref_filehash` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `source` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `from_ip` varchar(15) CHARACTER SET latin1 DEFAULT NULL,
  `sanggah` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`nid`),
  KEY `ClaimStream_idx` (`stream_nid`),
  KEY `FK_ClaimToUser` (`user_nid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=161335 ;

-- --------------------------------------------------------

--
-- Table structure for table `claim_files`
--

CREATE TABLE IF NOT EXISTS `claim_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `claim_id` bigint(20) NOT NULL,
  `file_hash` varchar(100) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `file_type` varchar(25) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12096 ;

-- --------------------------------------------------------

--
-- Table structure for table `claim_rates`
--

CREATE TABLE IF NOT EXISTS `claim_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `claim_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3812 ;

-- --------------------------------------------------------

--
-- Table structure for table `comment_rates`
--

CREATE TABLE IF NOT EXISTS `comment_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1767 ;

-- --------------------------------------------------------

--
-- Table structure for table `comunication_logs`
--

CREATE TABLE IF NOT EXISTS `comunication_logs` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `parent_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `content` text,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

-- --------------------------------------------------------

--
-- Table structure for table `conf_junk`
--

CREATE TABLE IF NOT EXISTS `conf_junk` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kata` varchar(25) DEFAULT NULL,
  `jumlah` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=121 ;

-- --------------------------------------------------------

--
-- Table structure for table `daemons`
--

CREATE TABLE IF NOT EXISTS `daemons` (
  `Start` text NOT NULL,
  `Info` text NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `deleted`
--

CREATE TABLE IF NOT EXISTS `deleted` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_nid` bigint(20) DEFAULT NULL,
  `user_id` varchar(25) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `from_ip` varchar(15) DEFAULT NULL,
  `idx_alasanhapus_id` int(11) DEFAULT NULL,
  `ket_hapus` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_to_stream_deleted` (`stream_nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=529594 ;

-- --------------------------------------------------------

--
-- Table structure for table `disposisi`
--

CREATE TABLE IF NOT EXISTS `disposisi` (
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_nid` bigint(20) NOT NULL,
  `disposisi_by` bigint(20) NOT NULL,
  `disposisi_to` int(11) NOT NULL,
  `status` tinyint(4) DEFAULT '1',
  `disposisi_tipe` tinyint(4) DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  `from_ip` varchar(15) NOT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `nid` (`nid`),
  KEY `FK_to_stream` (`stream_nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=139306 ;

-- --------------------------------------------------------

--
-- Table structure for table `disposisi_messages`
--

CREATE TABLE IF NOT EXISTS `disposisi_messages` (
  `stream_nid` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `from_instansi` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `content` text,
  `status` tinyint(4) DEFAULT '1',
  `disposisi_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3185 ;

-- --------------------------------------------------------

--
-- Table structure for table `disposisi_message_files`
--

CREATE TABLE IF NOT EXISTS `disposisi_message_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_id` bigint(20) DEFAULT NULL,
  `disposisi_message_id` bigint(20) DEFAULT NULL,
  `file_hash` varchar(100) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `file_type` varchar(25) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `domains`
--

CREATE TABLE IF NOT EXISTS `domains` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) NOT NULL,
  `source_api` varchar(255) DEFAULT NULL,
  `perfix_sms` varchar(255) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `source_number` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=258 ;

-- --------------------------------------------------------

--
-- Table structure for table `gammu`
--

CREATE TABLE IF NOT EXISTS `gammu` (
  `Version` int(11) NOT NULL DEFAULT '0'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `geo_blocks`
--

CREATE TABLE IF NOT EXISTS `geo_blocks` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `location_id` int(10) unsigned DEFAULT NULL,
  `ip_start` int(10) unsigned NOT NULL,
  `ip_end` int(10) unsigned NOT NULL,
  `index_geo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_start` (`ip_start`),
  KEY `idx_end` (`ip_end`),
  KEY `idx_geo` (`index_geo`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3648187 ;

-- --------------------------------------------------------

--
-- Table structure for table `geo_location`
--

CREATE TABLE IF NOT EXISTS `geo_location` (
  `locId` int(11) NOT NULL,
  `country` varchar(2) NOT NULL,
  `region` varchar(2) NOT NULL,
  `city` varchar(20) NOT NULL,
  `postalCode` varchar(10) NOT NULL,
  `latitude` double NOT NULL,
  `longitude` double NOT NULL,
  `metroCode` int(11) NOT NULL,
  `areaCode` int(11) NOT NULL,
  PRIMARY KEY (`locId`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `holidays`
--

CREATE TABLE IF NOT EXISTS `holidays` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `date_holiday` date NOT NULL DEFAULT '0000-00-00',
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`,`date_holiday`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=56 ;

-- --------------------------------------------------------

--
-- Table structure for table `idx_alasanhapus`
--

CREATE TABLE IF NOT EXISTS `idx_alasanhapus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

-- --------------------------------------------------------

--
-- Table structure for table `idx_area`
--

CREATE TABLE IF NOT EXISTS `idx_area` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `name` varchar(255) CHARACTER SET latin1 DEFAULT NULL,
  `coordinate_lat` float DEFAULT NULL,
  `coordinate_lon` float DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `areaidx` (`id`),
  KEY `areaparentidx` (`parent_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=84922 ;

-- --------------------------------------------------------

--
-- Table structure for table `idx_download_category`
--

CREATE TABLE IF NOT EXISTS `idx_download_category` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;

-- --------------------------------------------------------

--
-- Table structure for table `idx_kategori`
--

CREATE TABLE IF NOT EXISTS `idx_kategori` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `kategori_idx` (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- --------------------------------------------------------

--
-- Table structure for table `idx_sumber_laporan`
--

CREATE TABLE IF NOT EXISTS `idx_sumber_laporan` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `idx_user_group`
--

CREATE TABLE IF NOT EXISTS `idx_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

-- --------------------------------------------------------

--
-- Table structure for table `inbox`
--

CREATE TABLE IF NOT EXISTS `inbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `ReceivingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Text` text NOT NULL,
  `SenderNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `RecipientID` text NOT NULL,
  `Processed` enum('false','true') NOT NULL DEFAULT 'false',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `keterangan` varchar(500) NOT NULL DEFAULT '',
  `diupdate_oleh` varchar(100) NOT NULL DEFAULT '',
  `diupdate_tanggal` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=45066 ;

--
-- Triggers `inbox`
--
DROP TRIGGER IF EXISTS `inbox_timestamp`;
DELIMITER //
CREATE TRIGGER `inbox_timestamp` BEFORE INSERT ON `inbox`
 FOR EACH ROW BEGIN
    IF NEW.ReceivingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.ReceivingDateTime = CURRENT_TIMESTAMP();
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `instansi`
--

CREATE TABLE IF NOT EXISTS `instansi` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `parent_nid` int(11) NOT NULL DEFAULT '0',
  `jenis_instansi_id` tinyint(4) DEFAULT NULL,
  `name` varchar(100) CHARACTER SET latin1 NOT NULL,
  `alias` varchar(100) CHARACTER SET latin1 NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `image` varchar(50) CHARACTER SET latin1 NOT NULL,
  `emails` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `alamat` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `website` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `telp` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `fax` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `idxarea_id` int(11) DEFAULT NULL,
  `can_forward` tinyint(4) DEFAULT '0',
  `api_ipaddress` varchar(50) DEFAULT NULL,
  `api_token` varchar(100) DEFAULT NULL,
  `api_status` tinyint(4) DEFAULT NULL,
  `api_sourceapi` varchar(50) DEFAULT NULL,
  `api_push_status` tinyint(4) DEFAULT NULL,
  `api_push_url` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `form_laporan_status` tinyint(4) DEFAULT NULL,
  `form_laporan_disposisi` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  KEY `instansiid_id` (`nid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=11141 ;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_instansi`
--

CREATE TABLE IF NOT EXISTS `jenis_instansi` (
  `id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

-- --------------------------------------------------------

--
-- Table structure for table `junk_config`
--

CREATE TABLE IF NOT EXISTS `junk_config` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `group_config` tinyint(2) DEFAULT NULL COMMENT '1=bycontent,2=bynosms',
  `junk_content` varchar(250) DEFAULT NULL,
  `updated_by` varchar(100) DEFAULT NULL,
  `updated_date` datetime DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `kategori_pending`
--

CREATE TABLE IF NOT EXISTS `kategori_pending` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kategori_pending` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `komunitas`
--

CREATE TABLE IF NOT EXISTS `komunitas` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `nama` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=19 ;

-- --------------------------------------------------------

--
-- Table structure for table `login_attempts`
--

CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(40) COLLATE utf8_bin NOT NULL,
  `login` varchar(50) COLLATE utf8_bin NOT NULL,
  `time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=241013 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_followupemail`
--

CREATE TABLE IF NOT EXISTS `log_followupemail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `stream_id` bigint(20) DEFAULT NULL,
  `nama_tujuan` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `email_tujuan` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `pengirim` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `balas_ke` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `pesan` text CHARACTER SET latin1,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_form_manual`
--

CREATE TABLE IF NOT EXISTS `log_form_manual` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `ip` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `stream_nid` bigint(20) DEFAULT NULL,
  `idx_sumber_laporan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_useridlogm` (`user_id`),
  KEY `idx_streamnidlogm` (`stream_nid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16718 ;

-- --------------------------------------------------------

--
-- Table structure for table `log_transaksi_api`
--

CREATE TABLE IF NOT EXISTS `log_transaksi_api` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `ip` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `instansi_id` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `push_type` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `trackingid` bigint(20) DEFAULT NULL,
  `push_content` longtext CHARACTER SET latin1,
  `status` tinyint(4) DEFAULT NULL,
  `respon_timestamp` int(11) DEFAULT NULL,
  `respon_status` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `respon_content` longtext CHARACTER SET latin1,
  `respon_message` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `logtransinstansi_idx` (`instansi_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=2083 ;

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE IF NOT EXISTS `message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `instansi_id` int(11) DEFAULT NULL,
  `subject` varchar(250) DEFAULT NULL,
  `content` text,
  `timestamp` int(11) DEFAULT NULL,
  `msg_type` int(11) DEFAULT NULL,
  `msg_to` varchar(25) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `lastactivity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=136 ;

-- --------------------------------------------------------

--
-- Table structure for table `message_read`
--

CREATE TABLE IF NOT EXISTS `message_read` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1500 ;

-- --------------------------------------------------------

--
-- Table structure for table `message_replay`
--

CREATE TABLE IF NOT EXISTS `message_replay` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `instansi_id` int(11) DEFAULT NULL,
  `content` text,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=215 ;

-- --------------------------------------------------------

--
-- Table structure for table `message_replay_read`
--

CREATE TABLE IF NOT EXISTS `message_replay_read` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message_replay_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1153 ;

-- --------------------------------------------------------

--
-- Table structure for table `message_to`
--

CREATE TABLE IF NOT EXISTS `message_to` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `message_id` bigint(20) DEFAULT NULL,
  `instansi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=135 ;

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE IF NOT EXISTS `notifications` (
  `id` bigint(8) NOT NULL AUTO_INCREMENT,
  `group_notification` varchar(20) DEFAULT NULL,
  `user_id` bigint(8) DEFAULT NULL,
  `stream_nid` bigint(8) DEFAULT NULL,
  `relation_nid` bigint(8) DEFAULT NULL,
  `status` tinyint(20) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6005542 ;

-- --------------------------------------------------------

--
-- Table structure for table `ombudsman_category`
--

CREATE TABLE IF NOT EXISTS `ombudsman_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

-- --------------------------------------------------------

--
-- Table structure for table `outbox`
--

CREATE TABLE IF NOT EXISTS `outbox` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendBefore` time NOT NULL DEFAULT '23:59:59',
  `SendAfter` time NOT NULL DEFAULT '00:00:00',
  `Text` text,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `MultiPart` enum('false','true') DEFAULT 'false',
  `RelativeValidity` int(11) DEFAULT '-1',
  `SenderID` varchar(255) DEFAULT NULL,
  `SendingTimeOut` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryReport` enum('default','yes','no') DEFAULT 'default',
  `CreatorID` text NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `outbox_date` (`SendingDateTime`,`SendingTimeOut`),
  KEY `outbox_sender` (`SenderID`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=105724 ;

--
-- Triggers `outbox`
--
DROP TRIGGER IF EXISTS `outbox_timestamp`;
DELIMITER //
CREATE TRIGGER `outbox_timestamp` BEFORE INSERT ON `outbox`
 FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.SendingDateTime = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingTimeOut = '0000-00-00 00:00:00' THEN
        SET NEW.SendingTimeOut = CURRENT_TIMESTAMP();
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `outbox_multipart`
--

CREATE TABLE IF NOT EXISTS `outbox_multipart` (
  `Text` text,
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text,
  `Class` int(11) DEFAULT '-1',
  `TextDecoded` text,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`,`SequencePosition`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `pbk`
--

CREATE TABLE IF NOT EXISTS `pbk` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `GroupID` int(11) NOT NULL DEFAULT '-1',
  `Name` text NOT NULL,
  `Number` text NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pbk_groups`
--

CREATE TABLE IF NOT EXISTS `pbk_groups` (
  `Name` text NOT NULL,
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `pending`
--

CREATE TABLE IF NOT EXISTS `pending` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stream_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `KetPending` text,
  `timestamp` int(11) DEFAULT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `approved_by` bigint(20) DEFAULT NULL,
  `alasan` varchar(500) DEFAULT NULL,
  `kategori_pending_id` int(11) DEFAULT NULL,
  `instansi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pendingstreamnid` (`stream_id`),
  KEY `pendinguserid` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25154 ;

-- --------------------------------------------------------

--
-- Table structure for table `pending_replay_sms`
--

CREATE TABLE IF NOT EXISTS `pending_replay_sms` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `msisdn` varchar(25) DEFAULT NULL,
  `content` text,
  `operator` varchar(200) DEFAULT NULL,
  `mo_id` varchar(50) DEFAULT NULL,
  `trx_id` varchar(50) DEFAULT NULL,
  `ip` varchar(25) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `jml` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=51250 ;

-- --------------------------------------------------------

--
-- Table structure for table `perfix_to_push`
--

CREATE TABLE IF NOT EXISTS `perfix_to_push` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nama` varchar(50) DEFAULT NULL,
  `perfix` varchar(25) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  `sr_params` varchar(250) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `phones`
--

CREATE TABLE IF NOT EXISTS `phones` (
  `ID` text NOT NULL,
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `TimeOut` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `Send` enum('yes','no') NOT NULL DEFAULT 'no',
  `Receive` enum('yes','no') NOT NULL DEFAULT 'no',
  `IMEI` varchar(35) NOT NULL,
  `Client` text NOT NULL,
  `Battery` int(11) NOT NULL DEFAULT '-1',
  `Signal` int(11) NOT NULL DEFAULT '-1',
  `Sent` int(11) NOT NULL DEFAULT '0',
  `Received` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`IMEI`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `phones`
--
DROP TRIGGER IF EXISTS `phones_timestamp`;
DELIMITER //
CREATE TRIGGER `phones_timestamp` BEFORE INSERT ON `phones`
 FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.TimeOut = '0000-00-00 00:00:00' THEN
        SET NEW.TimeOut = CURRENT_TIMESTAMP();
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE IF NOT EXISTS `reports` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `classification_id` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `group` varchar(25) DEFAULT NULL,
  `stream_nid` bigint(20) DEFAULT NULL,
  `relation_nid` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `ip` varchar(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1363 ;

-- --------------------------------------------------------

--
-- Table structure for table `rpt_summary_kld`
--

CREATE TABLE IF NOT EXISTS `rpt_summary_kld` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source_api` varchar(50) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `instansi_id` int(11) DEFAULT NULL,
  `belum` int(11) DEFAULT NULL,
  `proses` int(11) DEFAULT NULL,
  `selesai` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=844635 ;

-- --------------------------------------------------------

--
-- Table structure for table `sanggah`
--

CREATE TABLE IF NOT EXISTS `sanggah` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `claim_id` bigint(20) DEFAULT NULL,
  `ip_address` varchar(100) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Table structure for table `sentitems`
--

CREATE TABLE IF NOT EXISTS `sentitems` (
  `UpdatedInDB` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `InsertIntoDB` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `SendingDateTime` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `DeliveryDateTime` timestamp NULL DEFAULT NULL,
  `Text` text NOT NULL,
  `DestinationNumber` varchar(20) NOT NULL DEFAULT '',
  `Coding` enum('Default_No_Compression','Unicode_No_Compression','8bit','Default_Compression','Unicode_Compression') NOT NULL DEFAULT 'Default_No_Compression',
  `UDH` text NOT NULL,
  `SMSCNumber` varchar(20) NOT NULL DEFAULT '',
  `Class` int(11) NOT NULL DEFAULT '-1',
  `TextDecoded` text NOT NULL,
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `SenderID` varchar(255) NOT NULL,
  `SequencePosition` int(11) NOT NULL DEFAULT '1',
  `Status` enum('SendingOK','SendingOKNoReport','SendingError','DeliveryOK','DeliveryFailed','DeliveryPending','DeliveryUnknown','Error') NOT NULL DEFAULT 'SendingOK',
  `StatusError` int(11) NOT NULL DEFAULT '-1',
  `TPMR` int(11) NOT NULL DEFAULT '-1',
  `RelativeValidity` int(11) NOT NULL DEFAULT '-1',
  `CreatorID` text NOT NULL,
  PRIMARY KEY (`ID`,`SequencePosition`),
  KEY `sentitems_date` (`DeliveryDateTime`),
  KEY `sentitems_tpmr` (`TPMR`),
  KEY `sentitems_dest` (`DestinationNumber`),
  KEY `sentitems_sender` (`SenderID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Triggers `sentitems`
--
DROP TRIGGER IF EXISTS `sentitems_timestamp`;
DELIMITER //
CREATE TRIGGER `sentitems_timestamp` BEFORE INSERT ON `sentitems`
 FOR EACH ROW BEGIN
    IF NEW.InsertIntoDB = '0000-00-00 00:00:00' THEN
        SET NEW.InsertIntoDB = CURRENT_TIMESTAMP();
    END IF;
    IF NEW.SendingDateTime = '0000-00-00 00:00:00' THEN
        SET NEW.SendingDateTime = CURRENT_TIMESTAMP();
    END IF;
END
//
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_pull`
--

CREATE TABLE IF NOT EXISTS `sms_pull` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(10) NOT NULL,
  `transaction_id` varchar(40) NOT NULL,
  `msisdn` varchar(20) NOT NULL,
  `substype` int(11) NOT NULL,
  `mo_raw` text,
  `mo_message` text NOT NULL,
  `mo_timestamp` datetime NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `mt_message` varchar(500) DEFAULT NULL,
  `mt_response` text,
  `mt_timestamp` datetime DEFAULT NULL,
  `dlr_message` varchar(200) DEFAULT NULL,
  `dlr_timestamp` datetime DEFAULT NULL,
  `dlr_datedone` varchar(14) DEFAULT NULL,
  `ip` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `source_api` varchar(50) DEFAULT NULL,
  `source_number` varchar(50) DEFAULT NULL,
  `pre_disposisi` int(11) DEFAULT NULL,
  `code` varchar(17) DEFAULT NULL,
  `reply_group` bigint(20) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=786821 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_pull_9949`
--

CREATE TABLE IF NOT EXISTS `sms_pull_9949` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(10) NOT NULL,
  `transaction_id` varchar(40) NOT NULL,
  `msisdn` varchar(20) NOT NULL,
  `substype` int(11) NOT NULL,
  `mo_message` text NOT NULL,
  `mo_timestamp` datetime NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `mt_message` varchar(500) DEFAULT NULL,
  `mt_response` text,
  `mt_timestamp` datetime DEFAULT NULL,
  `dlr_message` varchar(200) DEFAULT NULL,
  `dlr_timestamp` datetime DEFAULT NULL,
  `dlr_datedone` varchar(14) DEFAULT NULL,
  `ip` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `source_api` varchar(50) DEFAULT NULL,
  `source_number` varchar(50) DEFAULT NULL,
  `pre_disposisi` int(11) DEFAULT NULL,
  `code` varchar(17) DEFAULT NULL,
  `reply_group` bigint(20) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=313470 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_pull_instansi`
--

CREATE TABLE IF NOT EXISTS `sms_pull_instansi` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(10) NOT NULL,
  `transaction_id` varchar(40) NOT NULL,
  `msisdn` varchar(20) NOT NULL,
  `substype` int(11) NOT NULL,
  `mo_message` text NOT NULL,
  `mo_timestamp` datetime NOT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `mt_message` varchar(500) DEFAULT NULL,
  `mt_response` text,
  `mt_timestamp` datetime DEFAULT NULL,
  `dlr_message` varchar(200) DEFAULT NULL,
  `dlr_timestamp` datetime DEFAULT NULL,
  `dlr_datedone` varchar(14) DEFAULT NULL,
  `ip` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `source_api` varchar(50) DEFAULT NULL,
  `source_number` varchar(50) DEFAULT NULL,
  `pre_disposisi` int(11) DEFAULT NULL,
  `code` varchar(17) DEFAULT NULL,
  `reply_group` bigint(20) NOT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=142044 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_pull_isat`
--

CREATE TABLE IF NOT EXISTS `sms_pull_isat` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(10) DEFAULT NULL,
  `transaction_id` varchar(40) DEFAULT NULL,
  `msisdn` varchar(20) DEFAULT NULL,
  `substype` int(11) DEFAULT NULL,
  `mo_message` text,
  `mo_timestamp` datetime DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `mt_message` varchar(500) DEFAULT NULL,
  `mt_response` text,
  `mt_timestamp` datetime DEFAULT NULL,
  `dlr_message` varchar(200) DEFAULT NULL,
  `dlr_timestamp` datetime DEFAULT NULL,
  `dlr_datedone` varchar(14) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `source_api` varchar(50) DEFAULT NULL,
  `source_number` varchar(50) DEFAULT NULL,
  `pre_disposisi` int(11) DEFAULT NULL,
  `code` varchar(17) DEFAULT NULL,
  `reply_group` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=317723 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_pull_tsel`
--

CREATE TABLE IF NOT EXISTS `sms_pull_tsel` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(10) NOT NULL,
  `message_id` varchar(50) DEFAULT NULL,
  `transaction_id` varchar(50) NOT NULL,
  `msisdn` varchar(20) NOT NULL,
  `substype` int(11) NOT NULL,
  `mo_raw` text,
  `mo_message` text NOT NULL,
  `mo_timestamp` datetime NOT NULL,
  `mo_udh` varchar(25) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `mt_message` varchar(500) DEFAULT NULL,
  `mt_response` text,
  `mt_timestamp` datetime DEFAULT NULL,
  `dlr_message` varchar(200) DEFAULT NULL,
  `dlr_timestamp` datetime DEFAULT NULL,
  `dlr_datedone` varchar(14) DEFAULT NULL,
  `ip` varchar(20) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `source_api` varchar(50) DEFAULT NULL,
  `source_number` varchar(50) DEFAULT NULL,
  `pre_disposisi` int(11) DEFAULT NULL,
  `code` varchar(17) DEFAULT NULL,
  `reply_group` bigint(20) NOT NULL,
  PRIMARY KEY (`nid`),
  KEY `nid_smspulltsel` (`nid`),
  KEY `timestamp_smspultsel` (`mo_timestamp`),
  KEY `msdn_smspulltsel` (`msisdn`),
  KEY `udh_smspulltsel` (`mo_udh`),
  KEY `messageid_smspulltsel` (`message_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=132070 ;

-- --------------------------------------------------------

--
-- Table structure for table `sms_pull_xl`
--

CREATE TABLE IF NOT EXISTS `sms_pull_xl` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `operator` varchar(10) DEFAULT NULL,
  `transaction_id` varchar(40) DEFAULT NULL,
  `msisdn` varchar(20) DEFAULT NULL,
  `substype` int(11) DEFAULT NULL,
  `mo_message` text,
  `mo_timestamp` datetime DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `mt_message` varchar(500) DEFAULT NULL,
  `mt_response` text,
  `mt_timestamp` datetime DEFAULT NULL,
  `dlr_message` varchar(200) DEFAULT NULL,
  `dlr_timestamp` datetime DEFAULT NULL,
  `dlr_datedone` varchar(14) DEFAULT NULL,
  `ip` varchar(20) DEFAULT NULL,
  `status` int(11) DEFAULT '1',
  `source_api` varchar(50) DEFAULT NULL,
  `source_number` varchar(50) DEFAULT NULL,
  `pre_disposisi` int(11) DEFAULT NULL,
  `code` varchar(17) DEFAULT NULL,
  `reply_group` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=339308 ;

-- --------------------------------------------------------

--
-- Table structure for table `statments`
--

CREATE TABLE IF NOT EXISTS `statments` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `subject` varchar(250) DEFAULT NULL,
  `content_web` text NOT NULL,
  `code_sms` varchar(5) NOT NULL,
  `content_sms` varchar(700) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `status` tinyint(11) NOT NULL,
  `destination_numbers` text,
  `destination_emails` text,
  `created_by` bigint(20) DEFAULT NULL,
  `created_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nid`,`code_sms`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=30 ;

-- --------------------------------------------------------

--
-- Table structure for table `statment_comments`
--

CREATE TABLE IF NOT EXISTS `statment_comments` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `statment_id` int(11) DEFAULT NULL,
  `timestamp` int(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `content` text NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `source` varchar(10) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `update_by` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=951 ;

-- --------------------------------------------------------

--
-- Table structure for table `statment_comment_files`
--

CREATE TABLE IF NOT EXISTS `statment_comment_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statment_comment_id` bigint(20) NOT NULL,
  `file_hash` varchar(100) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `file_type` varchar(25) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=50 ;

-- --------------------------------------------------------

--
-- Table structure for table `statment_files`
--

CREATE TABLE IF NOT EXISTS `statment_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `statment_id` bigint(20) NOT NULL,
  `file_hash` varchar(100) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `file_type` varchar(25) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

-- --------------------------------------------------------

--
-- Table structure for table `statment_likes`
--

CREATE TABLE IF NOT EXISTS `statment_likes` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `stream_id` bigint(20) DEFAULT NULL,
  `agreedisagree` tinyint(4) DEFAULT NULL,
  `ip_address` varchar(15) DEFAULT NULL,
  `last_update` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream`
--

CREATE TABLE IF NOT EXISTS `stream` (
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `content` text CHARACTER SET latin1 NOT NULL,
  `subject` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `tags` text CHARACTER SET latin1 NOT NULL,
  `photo` tinyint(4) NOT NULL DEFAULT '0',
  `photo_hash` text CHARACTER SET latin1,
  `coordinate` int(11) NOT NULL DEFAULT '0',
  `coordinate_lat` double DEFAULT NULL,
  `coordinate_lon` double DEFAULT NULL,
  `report_type` tinyint(4) DEFAULT NULL,
  `is_anonim` tinyint(4) DEFAULT '0',
  `address` text CHARACTER SET latin1 NOT NULL,
  `agree` int(11) NOT NULL DEFAULT '0',
  `disagree` int(11) NOT NULL DEFAULT '0',
  `rate` tinyint(4) DEFAULT NULL,
  `source` varchar(100) CHARACTER SET latin1 NOT NULL,
  `source_api` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `source_number` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `verified` tinyint(4) DEFAULT '0',
  `kategori_id` int(11) DEFAULT NULL,
  `topik_nid` int(11) NOT NULL DEFAULT '0',
  `disposisi_nid` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tbl_GolonganTopik_id` int(11) DEFAULT NULL,
  `ombudsman_category_id` int(11) DEFAULT NULL,
  `reply_nid` int(11) NOT NULL,
  `comments` int(11) NOT NULL DEFAULT '0',
  `mo_id` int(11) NOT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `last_activity` int(11) DEFAULT NULL,
  `isHold` tinyint(4) DEFAULT '0',
  `closed_at` int(11) DEFAULT NULL,
  `closed_by` bigint(20) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `isSticky` tinyint(4) DEFAULT '0',
  `provinsi_id` int(11) DEFAULT NULL,
  `kabupaten_id` int(11) DEFAULT NULL,
  `kecamatan_id` int(11) DEFAULT NULL,
  `kelurahan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`),
  UNIQUE KEY `streamnididx` (`nid`),
  KEY `userid_idx` (`user_id`),
  KEY `dispoisisnid_idx` (`disposisi_nid`),
  KEY `kategoriid_idx` (`kategori_id`),
  KEY `areaid_idx` (`area_id`),
  KEY `sourceapi_idx` (`source_api`),
  KEY `status_idx` (`status`),
  KEY `stream_timestamp_idx` (`timestamp`),
  KEY `stream_lastactivity_id` (`last_activity`),
  KEY `stream_lastmodified_idx` (`last_modified`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=1448796 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_comments`
--

CREATE TABLE IF NOT EXISTS `stream_comments` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `user_id` bigint(11) NOT NULL,
  `content` text CHARACTER SET latin1 NOT NULL,
  `reply_nid` bigint(11) NOT NULL DEFAULT '0',
  `coordinate` int(11) NOT NULL DEFAULT '0',
  `coordinate_lat` double DEFAULT NULL,
  `coordinate_lon` double DEFAULT NULL,
  `address` text CHARACTER SET latin1 NOT NULL,
  `source` varchar(100) CHARACTER SET latin1 NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`nid`),
  KEY `timestamp_idx` (`timestamp`),
  KEY `stream_idx` (`reply_nid`),
  KEY `FK_CommentToUser` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=11094 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_deleted`
--

CREATE TABLE IF NOT EXISTS `stream_deleted` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nid` bigint(20) NOT NULL,
  `timestamp` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `content` text CHARACTER SET latin1 NOT NULL,
  `subject` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `tags` text CHARACTER SET latin1 NOT NULL,
  `photo` tinyint(4) NOT NULL DEFAULT '0',
  `photo_hash` text CHARACTER SET latin1,
  `coordinate` int(11) NOT NULL DEFAULT '0',
  `coordinate_lat` double DEFAULT NULL,
  `coordinate_lon` double DEFAULT NULL,
  `report_type` tinyint(4) DEFAULT NULL,
  `is_anonim` tinyint(4) DEFAULT '0',
  `address` text CHARACTER SET latin1 NOT NULL,
  `agree` int(11) NOT NULL DEFAULT '0',
  `disagree` int(11) NOT NULL DEFAULT '0',
  `rate` tinyint(4) DEFAULT NULL,
  `source` varchar(100) CHARACTER SET latin1 NOT NULL,
  `source_api` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `source_number` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `verified` tinyint(4) DEFAULT '0',
  `kategori_id` int(11) DEFAULT NULL,
  `topik_nid` int(11) NOT NULL DEFAULT '0',
  `disposisi_nid` varchar(50) CHARACTER SET latin1 NOT NULL,
  `tbl_GolonganTopik_id` int(11) DEFAULT NULL,
  `ombudsman_category_id` int(11) DEFAULT NULL,
  `reply_nid` int(11) NOT NULL,
  `comments` int(11) NOT NULL DEFAULT '0',
  `mo_id` int(11) NOT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `last_activity` int(11) DEFAULT NULL,
  `isHold` tinyint(4) DEFAULT '0',
  `closed_at` int(11) DEFAULT NULL,
  `closed_by` bigint(20) DEFAULT NULL,
  `views` int(11) DEFAULT '0',
  `isSticky` tinyint(4) DEFAULT '0',
  `provinsi_id` int(11) DEFAULT NULL,
  `kabupaten_id` int(11) DEFAULT NULL,
  `kecamatan_id` int(11) DEFAULT NULL,
  `kelurahan_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nid` (`nid`),
  KEY `Duserididx` (`user_id`),
  KEY `Ddispoisisnididx` (`disposisi_nid`),
  KEY `Dkategoriididx` (`kategori_id`),
  KEY `Dareaididx` (`area_id`),
  KEY `Dsourceapiidx` (`source_api`),
  KEY `Dstatusidx` (`status`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=820345 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_extras`
--

CREATE TABLE IF NOT EXISTS `stream_extras` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `stream_nid` bigint(20) DEFAULT NULL,
  `extra_field` text,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_exstreamid` (`stream_nid`),
  FULLTEXT KEY `IDX_exextreafield` (`extra_field`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=455 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_files`
--

CREATE TABLE IF NOT EXISTS `stream_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_nid` bigint(20) DEFAULT NULL,
  `filename` varchar(500) DEFAULT NULL,
  `filehash` varchar(500) DEFAULT NULL,
  `filetype` varchar(50) DEFAULT NULL,
  `fileext` varchar(10) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=35876 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_followup`
--

CREATE TABLE IF NOT EXISTS `stream_followup` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_nid` bigint(20) NOT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `follow_by` bigint(20) DEFAULT NULL,
  `follow_date` date DEFAULT NULL,
  `follow_type` varchar(10) DEFAULT NULL,
  `follow_content` text,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `IDX_mystreamnid` (`stream_nid`),
  KEY `IDX_myuserid` (`user_id`),
  KEY `IDX_myfolloupby` (`follow_by`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_info01`
--

CREATE TABLE IF NOT EXISTS `stream_info01` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_nid` bigint(20) DEFAULT NULL,
  `content_info` text,
  `updated_by` bigint(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=1451 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_info01_files`
--

CREATE TABLE IF NOT EXISTS `stream_info01_files` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_info01_id` bigint(20) NOT NULL,
  `file_hash` varchar(100) DEFAULT NULL,
  `file_name` varchar(100) DEFAULT NULL,
  `file_extension` varchar(10) DEFAULT NULL,
  `file_type` varchar(25) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=632 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_komunitas`
--

CREATE TABLE IF NOT EXISTS `stream_komunitas` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `komunitas_id` int(11) DEFAULT NULL,
  `stream_nid` bigint(20) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=103 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_lock`
--

CREATE TABLE IF NOT EXISTS `stream_lock` (
  `user_id` bigint(20) NOT NULL,
  `locked_by` bigint(20) DEFAULT NULL,
  `stream_nid` bigint(20) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `stream_misc`
--

CREATE TABLE IF NOT EXISTS `stream_misc` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `srdata` text,
  `timestamp` int(11) DEFAULT NULL,
  `ip` varchar(12) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14275 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_ori`
--

CREATE TABLE IF NOT EXISTS `stream_ori` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_nid` bigint(20) NOT NULL,
  `stream_ori` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=94338 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_rates`
--

CREATE TABLE IF NOT EXISTS `stream_rates` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `rate` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=11462 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_statement`
--

CREATE TABLE IF NOT EXISTS `stream_statement` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(250) NOT NULL,
  `reply_nid` int(11) NOT NULL DEFAULT '0',
  `tags` text NOT NULL,
  `photo` int(11) NOT NULL DEFAULT '0',
  `photo_hash` text,
  `coordinate` int(11) NOT NULL DEFAULT '0',
  `coordinate_lat` double DEFAULT NULL,
  `coordinate_lon` double DEFAULT NULL,
  `address` text NOT NULL,
  `agree` int(11) NOT NULL DEFAULT '0',
  `disagree` int(11) NOT NULL DEFAULT '0',
  `source` varchar(100) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `verified` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_success`
--

CREATE TABLE IF NOT EXISTS `stream_success` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `subject` varchar(750) CHARACTER SET latin1 DEFAULT NULL,
  `stream_id` bigint(20) DEFAULT NULL,
  `added_by` bigint(20) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `stream_idIDX` (`stream_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=122 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_tags`
--

CREATE TABLE IF NOT EXISTS `stream_tags` (
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_nid` bigint(20) DEFAULT NULL,
  `instansi_nid` int(20) DEFAULT NULL,
  `disposisi_nid` bigint(20) DEFAULT NULL,
  `group_tags` int(11) DEFAULT NULL,
  `status` tinyint(3) unsigned DEFAULT '1',
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=77088 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_terpilih`
--

CREATE TABLE IF NOT EXISTS `stream_terpilih` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `stream_nid` bigint(20) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=758 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_tmp`
--

CREATE TABLE IF NOT EXISTS `stream_tmp` (
  `nid` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) NOT NULL,
  `user_id` bigint(20) NOT NULL,
  `content` text NOT NULL,
  `subject` varchar(1000) DEFAULT NULL,
  `area_id` int(11) DEFAULT NULL,
  `tags` text NOT NULL,
  `photo` tinyint(4) NOT NULL DEFAULT '0',
  `photo_hash` text,
  `coordinate` int(11) NOT NULL DEFAULT '0',
  `coordinate_lat` double DEFAULT NULL,
  `coordinate_lon` double DEFAULT NULL,
  `report_type` tinyint(4) DEFAULT NULL,
  `is_anonim` tinyint(4) DEFAULT '0',
  `address` text NOT NULL,
  `agree` int(11) NOT NULL DEFAULT '0',
  `disagree` int(11) NOT NULL DEFAULT '0',
  `source` varchar(100) NOT NULL,
  `source_api` varchar(50) DEFAULT NULL,
  `source_number` varchar(50) DEFAULT NULL,
  `status` tinyint(4) NOT NULL DEFAULT '1',
  `verified` tinyint(4) DEFAULT '0',
  `kategori_id` int(11) DEFAULT NULL,
  `topik_nid` int(11) NOT NULL DEFAULT '0',
  `disposisi_nid` varchar(50) NOT NULL,
  `tbl_GolonganTopik_id` int(11) DEFAULT NULL,
  `ombudsman_category_id` int(11) DEFAULT NULL,
  `reply_nid` int(11) NOT NULL,
  `comments` int(11) NOT NULL DEFAULT '0',
  `mo_id` int(11) NOT NULL,
  `last_modified` int(11) DEFAULT NULL,
  `last_activity` int(11) DEFAULT NULL,
  `isHold` tinyint(4) DEFAULT '0',
  `closed_at` int(11) DEFAULT NULL,
  `isSticky` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `streamnididx` (`nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=782798 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_topics`
--

CREATE TABLE IF NOT EXISTS `stream_topics` (
  `nid` int(11) NOT NULL AUTO_INCREMENT,
  `parent_nid` int(11) NOT NULL DEFAULT '0',
  `name` varchar(200) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT '0',
  `region_nid` int(11) NOT NULL,
  `instansi_nid` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT '1',
  PRIMARY KEY (`nid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=432 ;

-- --------------------------------------------------------

--
-- Table structure for table `stream_transfer`
--

CREATE TABLE IF NOT EXISTS `stream_transfer` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_id` bigint(20) NOT NULL,
  `transfer_by_user_id` bigint(20) NOT NULL,
  `transfer_from_domain_id` int(11) NOT NULL,
  `transfer_to_domain_id` int(11) NOT NULL,
  `timestamp` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=58915 ;

-- --------------------------------------------------------

--
-- Table structure for table `subscribers`
--

CREATE TABLE IF NOT EXISTS `subscribers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `stream_nid` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=720 ;

-- --------------------------------------------------------

--
-- Table structure for table `tags`
--

CREATE TABLE IF NOT EXISTS `tags` (
  `stream_nid` bigint(20) DEFAULT NULL,
  `tbl_tag_id` int(11) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_config`
--

CREATE TABLE IF NOT EXISTS `tbl_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) DEFAULT '',
  `isi` text,
  `params` varchar(100) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=61 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_download_files`
--

CREATE TABLE IF NOT EXISTS `tbl_download_files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) DEFAULT NULL,
  `idx_download_category_id` int(11) DEFAULT NULL,
  `periode` varchar(50) DEFAULT NULL,
  `subject` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `description` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `thumbnail` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `file` varchar(250) CHARACTER SET latin1 DEFAULT NULL,
  `downloaded` int(11) DEFAULT NULL,
  `update_by` varchar(25) CHARACTER SET latin1 DEFAULT NULL,
  `update_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_golongantopik`
--

CREATE TABLE IF NOT EXISTS `tbl_golongantopik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kode` varchar(50) DEFAULT NULL,
  `nama` varchar(250) DEFAULT NULL,
  `keterangan` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=26 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_kepuasan_pelapor`
--

CREATE TABLE IF NOT EXISTS `tbl_kepuasan_pelapor` (
  `stream_nid` bigint(20) NOT NULL,
  `pilihan` int(11) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  PRIMARY KEY (`stream_nid`),
  KEY `id_stream_nid_kepuasan` (`stream_nid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_logservices`
--

CREATE TABLE IF NOT EXISTS `tbl_logservices` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `timestamp` int(11) DEFAULT NULL,
  `group_log` varchar(50) DEFAULT NULL,
  `content_log` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3779296 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_tags`
--

CREATE TABLE IF NOT EXISTS `tbl_tags` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `created_by` varchar(50) DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12238 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_usersgolongantopik`
--

CREATE TABLE IF NOT EXISTS `tbl_usersgolongantopik` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `golongantopik_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=136 ;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_user_group`
--

CREATE TABLE IF NOT EXISTS `tbl_user_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `idx_user_group_id` tinyint(4) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `dibuat_tanggal` datetime DEFAULT NULL,
  `dibuat_oleh` varchar(50) DEFAULT NULL,
  `diubah_tanggal` datetime DEFAULT NULL,
  `diubah_oleh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

-- --------------------------------------------------------

--
-- Table structure for table `token_akses`
--

CREATE TABLE IF NOT EXISTS `token_akses` (
  `token` varchar(64) NOT NULL,
  `instansi_id` int(11) NOT NULL,
  `ip_address` varchar(250) DEFAULT NULL,
  `dibuat_tanggal` datetime DEFAULT NULL,
  `akses_terakhir` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `jumlah_akses` bigint(20) DEFAULT '0',
  PRIMARY KEY (`token`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `unit_instansi`
--

CREATE TABLE IF NOT EXISTS `unit_instansi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `instansi_id` int(11) DEFAULT NULL,
  `unit_instansi_id` int(11) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `instansi_id_idx` (`instansi_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=167 ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8_bin NOT NULL,
  `password` varchar(255) COLLATE utf8_bin NOT NULL,
  `email` varchar(100) COLLATE utf8_bin NOT NULL,
  `activated` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(4) DEFAULT '1',
  `hash_photo` varchar(50) COLLATE utf8_bin NOT NULL,
  `banned` tinyint(1) NOT NULL DEFAULT '0',
  `ban_reason` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `passo` text COLLATE utf8_bin,
  `new_password_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `new_password_requested` datetime DEFAULT NULL,
  `RedirectURL` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `KeyToken` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `userdata` varchar(500) COLLATE utf8_bin DEFAULT NULL,
  `new_email` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `new_email_key` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `register_from` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `fb_uid` varchar(100) COLLATE utf8_bin NOT NULL,
  `tw_uid` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `skor` int(11) DEFAULT '0',
  `user_level_id` tinyint(4) DEFAULT '1',
  `instansi_id` int(11) DEFAULT NULL,
  `alwaysShowName` tinyint(4) DEFAULT '0',
  `streams` int(11) NOT NULL DEFAULT '0',
  `verifieds` int(11) NOT NULL DEFAULT '0',
  `closeds` int(11) NOT NULL DEFAULT '0',
  `dukung` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=6285883458798 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_autologin`
--

CREATE TABLE IF NOT EXISTS `user_autologin` (
  `key_id` char(32) COLLATE utf8_bin NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `user_agent` varchar(150) COLLATE utf8_bin NOT NULL,
  `last_ip` varchar(40) COLLATE utf8_bin NOT NULL,
  `last_login` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`key_id`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `user_interest`
--

CREATE TABLE IF NOT EXISTS `user_interest` (
  `user_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `interest_score` int(11) NOT NULL,
  KEY `user_id_topik_id` (`user_id`,`topic_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_interest_priority`
--

CREATE TABLE IF NOT EXISTS `user_interest_priority` (
  `user_id` int(11) NOT NULL,
  `first_priority` int(11) NOT NULL,
  `second_priority` int(11) NOT NULL,
  `third_priority` int(11) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user_komunitas`
--

CREATE TABLE IF NOT EXISTS `user_komunitas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `komunitas_id` tinyint(4) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `tanggal_mulai` date DEFAULT NULL,
  `tanggal_akhir` date DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `nama` varchar(100) DEFAULT NULL,
  `dibuat_tanggal` datetime DEFAULT NULL,
  `dibuat_oleh` varchar(50) DEFAULT NULL,
  `diubah_tanggal` datetime DEFAULT NULL,
  `diubah_oleh` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=45 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_levels`
--

CREATE TABLE IF NOT EXISTS `user_levels` (
  `id` tinyint(11) NOT NULL,
  `level` varchar(45) CHARACTER SET latin1 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `user_ombudsman`
--

CREATE TABLE IF NOT EXISTS `user_ombudsman` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ombudsman_category_id` tinyint(4) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=36 ;

-- --------------------------------------------------------

--
-- Table structure for table `user_profiles`
--

CREATE TABLE IF NOT EXISTS `user_profiles` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `country` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `website` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `first_name` varchar(250) COLLATE utf8_bin NOT NULL,
  `last_name` varchar(250) COLLATE utf8_bin NOT NULL,
  `sex` int(11) NOT NULL DEFAULT '0',
  `birthday` int(11) NOT NULL,
  `phone` double(17,0) NOT NULL,
  `phone_verifikasi` double(17,0) DEFAULT NULL,
  `kode_verifikasi` varchar(17) COLLATE utf8_bin DEFAULT NULL,
  `tgl_verifikasi` int(11) DEFAULT NULL,
  `no_id` varchar(45) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_id` (`id`,`user_id`) USING BTREE,
  KEY `user_idx` (`user_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_bin AUTO_INCREMENT=391073 ;

-- --------------------------------------------------------

--
-- Table structure for table `verifications`
--

CREATE TABLE IF NOT EXISTS `verifications` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `stream_nid` bigint(20) DEFAULT NULL,
  `user_id` bigint(25) DEFAULT NULL,
  `timestamp` int(11) DEFAULT NULL,
  `from_ip` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=123998 ;

-- --------------------------------------------------------

--
-- Table structure for table `view_attemps`
--

CREATE TABLE IF NOT EXISTS `view_attemps` (
  `ip` varchar(25) DEFAULT NULL,
  `stream_nid` bigint(20) DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `view_users`
--
CREATE TABLE IF NOT EXISTS `view_users` (
`id` bigint(20)
,`activated` tinyint(1)
,`status` tinyint(4)
,`hash_photo` varchar(50)
,`banned` tinyint(1)
,`ban_reason` varchar(255)
,`passo` text
,`new_password_key` varchar(50)
,`new_password_requested` datetime
,`RedirectURL` varchar(500)
,`KeyToken` varchar(500)
,`userdata` varchar(500)
,`new_email` varchar(100)
,`new_email_key` varchar(50)
,`last_ip` varchar(40)
,`last_login` datetime
,`created` datetime
,`modified` timestamp
,`register_from` varchar(50)
,`fb_uid` varchar(100)
,`tw_uid` varchar(100)
,`skor` int(11)
,`user_level_id` tinyint(4)
,`instansi_id` int(11)
,`streams` int(11)
,`verifieds` int(11)
,`closeds` int(11)
,`dukung` int(11)
);
-- --------------------------------------------------------

--
-- Stand-in structure for view `view_user_profiles`
--
CREATE TABLE IF NOT EXISTS `view_user_profiles` (
`id` bigint(11)
,`user_id` bigint(20)
,`country` varchar(20)
,`website` varchar(255)
,`first_name` varchar(250)
,`last_name` varchar(250)
,`sex` int(11)
,`phone_verifikasi` double(17,0)
,`kode_verifikasi` varchar(17)
,`tgl_verifikasi` int(11)
,`no_id` varchar(45)
);
-- --------------------------------------------------------

--
-- Table structure for table `wh_aktivitasadmin`
--

CREATE TABLE IF NOT EXISTS `wh_aktivitasadmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `jumlah_approval_1` int(11) DEFAULT NULL COMMENT 'jumlah approval sesuai sop',
  `jumlah_approval_2` int(11) DEFAULT NULL,
  `jumlah_approval_sampai_tanggal` int(11) DEFAULT NULL,
  `jumlah_approval_hari_kerja` int(11) DEFAULT NULL,
  `jumlah_arsip` int(11) DEFAULT NULL,
  `jumlah_arsip_sampai_tanggal` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx` (`tanggal`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=453566 ;

-- --------------------------------------------------------

--
-- Table structure for table `wh_laporanmasukperdomain`
--

CREATE TABLE IF NOT EXISTS `wh_laporanmasukperdomain` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date NOT NULL,
  `domain_id` int(11) NOT NULL,
  `jumlah_masuk_approval` bigint(20) DEFAULT NULL COMMENT 'laporan masuk ke halaman approval',
  `jumlah_masuk_approval_sampai_tanggal` bigint(20) DEFAULT NULL,
  `jumlah_masuk_arsip` bigint(20) DEFAULT NULL COMMENT 'otomatis arsip ,status 33,66,88',
  `jumlah_masuk_arsip_sampai_tanggal` bigint(20) DEFAULT NULL COMMENT 'otomatis arsip ,status 33,66,88',
  `total_arsip_sampai_tanggal` bigint(20) DEFAULT NULL,
  `total_belum_dikelola_sampai_tanggal` bigint(20) DEFAULT NULL,
  `total_terkelola_sampai_tanggal` bigint(20) DEFAULT NULL,
  `total_terkelola_aktif` bigint(20) DEFAULT NULL,
  `total_terkelola_arsip` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx` (`tanggal`,`domain_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29300 ;

-- --------------------------------------------------------

--
-- Table structure for table `wh_pencapaiantindaklanjut`
--

CREATE TABLE IF NOT EXISTS `wh_pencapaiantindaklanjut` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tanggal` date DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `jumlah_tindaklanjut_1` int(11) DEFAULT NULL COMMENT 'jumlah tindak lanjut sesuai sop',
  `jumlah_tindaklanjut_2` int(11) DEFAULT NULL,
  `jumlah_tindaklanjut_hari_kerja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx` (`tanggal`,`user_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=29106 ;

-- --------------------------------------------------------

--
-- Table structure for table `wh_pencapaiantindaklanjutinstansi`
--

CREATE TABLE IF NOT EXISTS `wh_pencapaiantindaklanjutinstansi` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sampai_tanggal` date DEFAULT NULL,
  `instansi_id` bigint(20) DEFAULT NULL,
  `jumlah_tindaklanjut_1` int(11) DEFAULT NULL COMMENT 'jumlah tindak lanjut sesuai sop',
  `jumlah_tindaklanjut_2` int(11) DEFAULT NULL,
  `jumlah_tindaklanjut_hari_kerja` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx` (`sampai_tanggal`,`instansi_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=364127 ;

-- --------------------------------------------------------

--
-- Structure for view `view_users`
--
DROP TABLE IF EXISTS `view_users`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_users` AS select `users`.`id` AS `id`,`users`.`activated` AS `activated`,`users`.`status` AS `status`,`users`.`hash_photo` AS `hash_photo`,`users`.`banned` AS `banned`,`users`.`ban_reason` AS `ban_reason`,`users`.`passo` AS `passo`,`users`.`new_password_key` AS `new_password_key`,`users`.`new_password_requested` AS `new_password_requested`,`users`.`RedirectURL` AS `RedirectURL`,`users`.`KeyToken` AS `KeyToken`,`users`.`userdata` AS `userdata`,`users`.`new_email` AS `new_email`,`users`.`new_email_key` AS `new_email_key`,`users`.`last_ip` AS `last_ip`,`users`.`last_login` AS `last_login`,`users`.`created` AS `created`,`users`.`modified` AS `modified`,`users`.`register_from` AS `register_from`,`users`.`fb_uid` AS `fb_uid`,`users`.`tw_uid` AS `tw_uid`,`users`.`skor` AS `skor`,`users`.`user_level_id` AS `user_level_id`,`users`.`instansi_id` AS `instansi_id`,`users`.`streams` AS `streams`,`users`.`verifieds` AS `verifieds`,`users`.`closeds` AS `closeds`,`users`.`dukung` AS `dukung` from `users`;

-- --------------------------------------------------------

--
-- Structure for view `view_user_profiles`
--
DROP TABLE IF EXISTS `view_user_profiles`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_user_profiles` AS select `user_profiles`.`id` AS `id`,`user_profiles`.`user_id` AS `user_id`,`user_profiles`.`country` AS `country`,`user_profiles`.`website` AS `website`,`user_profiles`.`first_name` AS `first_name`,`user_profiles`.`last_name` AS `last_name`,`user_profiles`.`sex` AS `sex`,`user_profiles`.`phone_verifikasi` AS `phone_verifikasi`,`user_profiles`.`kode_verifikasi` AS `kode_verifikasi`,`user_profiles`.`tgl_verifikasi` AS `tgl_verifikasi`,`user_profiles`.`no_id` AS `no_id` from `user_profiles`;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `claims`
--
ALTER TABLE `claims`
  ADD CONSTRAINT `FK_ClaimToUser` FOREIGN KEY (`user_nid`) REFERENCES `users` (`id`);

--
-- Constraints for table `stream`
--
ALTER TABLE `stream`
  ADD CONSTRAINT `FK_useridx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `stream_comments`
--
ALTER TABLE `stream_comments`
  ADD CONSTRAINT `FK_CommentToUser` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `stream_deleted`
--
ALTER TABLE `stream_deleted`
  ADD CONSTRAINT `FK_Duseridx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `user_profiles`
--
ALTER TABLE `user_profiles`
  ADD CONSTRAINT `user_idx` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
