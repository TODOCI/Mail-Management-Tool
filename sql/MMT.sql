-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 12, 2015 at 12:02 PM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `mmt`
--
CREATE DATABASE IF NOT EXISTS `mmt` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `mmt`;

-- --------------------------------------------------------

--
-- Table structure for table `acl`
--

CREATE TABLE IF NOT EXISTS `acl` (
  `id` int(11) NOT NULL,
  `name` varchar(15) NOT NULL,
  `description` text NOT NULL,
  `display_name` varchar(30) NOT NULL,
  `link` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `acl`
--

INSERT INTO `acl` (`id`, `name`, `description`, `display_name`, `link`) VALUES
(1, 'admin_view', 'View all admins', 'View Admins', 'admin_view.php'),
(2, 'admin_add', 'Add an admin', 'Add an Admin', 'admin_add.php'),
(3, 'admin_edit', 'Edit an admin', '', ''),
(4, 'admin_revoke', 'Invalidate secret key for admin', '', ''),
(5, 'admin_delete', 'Delete an admin', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `secret` varchar(32) NOT NULL,
  `password` varchar(32) NOT NULL,
  `salt` varchar(16) NOT NULL,
  `cookie` varchar(32) NOT NULL DEFAULT '',
  `last_login` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `email`, `secret`, `password`, `salt`, `cookie`, `last_login`) VALUES
(8, 'anshumanpattanayak@gmail.com', '7be1f7a994a0cb2d9921a19fef9c52ae', 'e5b725fd14b675a4085766f70883ba68', 'namak', '', 1436696778),
(9, 'zsonix27@gmail.com', '89f481aaaf704bf9adfe7297ad96a6c3', '890be5d2ea164f60c04aaf59803ca020', '8b0c5b', '', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `admin_access`
--

CREATE TABLE IF NOT EXISTS `admin_access` (
  `admin_id` int(11) NOT NULL,
  `access_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin_access`
--

INSERT INTO `admin_access` (`admin_id`, `access_id`) VALUES
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 5),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 5);

-- --------------------------------------------------------

--
-- Table structure for table `api`
--

CREATE TABLE IF NOT EXISTS `api` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(5) NOT NULL,
  `name` varchar(30) NOT NULL,
  `template_id` int(11) NOT NULL,
  `created_on` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `template_id` (`template_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `api`
--

INSERT INTO `api` (`id`, `code`, `name`, `template_id`, `created_on`) VALUES
(3, 'e0ff6', 'API101', 20, 1436447723);

-- --------------------------------------------------------

--
-- Table structure for table `api_params`
--

CREATE TABLE IF NOT EXISTS `api_params` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `template_id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_id` (`template_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `campaign`
--

CREATE TABLE IF NOT EXISTS `campaign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `api_id` int(11) NOT NULL,
  `payload` text NOT NULL,
  `called_on` int(11) NOT NULL,
  `todo` int(11) NOT NULL DEFAULT '0',
  `done` int(11) NOT NULL DEFAULT '0',
  `status` int(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_id` (`api_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `email`
--

CREATE TABLE IF NOT EXISTS `email` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `email_id` varchar(100) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `email_id` (`email_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `links`
--

CREATE TABLE IF NOT EXISTS `links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `mail_id` int(11) NOT NULL,
  `hash` varchar(32) NOT NULL,
  `url` text NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `mail_id` (`mail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE IF NOT EXISTS `mail` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `campaign_id` int(11) NOT NULL,
  `sent` int(1) NOT NULL DEFAULT '0',
  `seen` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `campaign_id` (`campaign_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `template`
--

CREATE TABLE IF NOT EXISTS `template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `template` text NOT NULL,
  `created_on` int(11) NOT NULL,
  `last_updated` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `template`
--

INSERT INTO `template` (`id`, `name`, `template`, `created_on`, `last_updated`) VALUES
(20, 'Demo', '<h2><span style="color: #993300;">Demo Template for API</span></h2>\r\n<blockquote>\r\n<h4><span style="color: #333300;">Something here...</span></h4>\r\n</blockquote>', 1436447668, 1436447668),
(22, 'Registration', '<h2><span style="color: #993300;"><strong>Welcome to TODOFY</strong></span></h2>\r\n<hr />\r\n<p>Hi,</p>\r\n<p>We are really happy to notify that you have been registered to Todofy with email id : {{email_id}}.</p>\r\n<p>Your randomly generated password is : {{password}}.</p>\r\n<p><em><span style="color: #ff0000;">(You can change your password by going into ''Profile'' after logging in)</span></em></p>\r\n<p>Your secret key for using APIs is : {{secret}}.</p>\r\n<hr />\r\n<p style="text-align: right;">-Todofy Team</p>', 1436699982, 1436701398);

-- --------------------------------------------------------

--
-- Table structure for table `unsubscribed`
--

CREATE TABLE IF NOT EXISTS `unsubscribed` (
  `user_id` int(11) NOT NULL,
  UNIQUE KEY `user_id_2` (`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `api`
--
ALTER TABLE `api`
  ADD CONSTRAINT `api_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `template` (`id`);

--
-- Constraints for table `api_params`
--
ALTER TABLE `api_params`
  ADD CONSTRAINT `api_params_ibfk_1` FOREIGN KEY (`template_id`) REFERENCES `api` (`id`);

--
-- Constraints for table `campaign`
--
ALTER TABLE `campaign`
  ADD CONSTRAINT `campaign_ibfk_1` FOREIGN KEY (`api_id`) REFERENCES `api` (`id`);

--
-- Constraints for table `links`
--
ALTER TABLE `links`
  ADD CONSTRAINT `links_ibfk_1` FOREIGN KEY (`mail_id`) REFERENCES `mail` (`id`);

--
-- Constraints for table `mail`
--
ALTER TABLE `mail`
  ADD CONSTRAINT `mail_ibfk_1` FOREIGN KEY (`campaign_id`) REFERENCES `campaign` (`id`);

--
-- Constraints for table `unsubscribed`
--
ALTER TABLE `unsubscribed`
  ADD CONSTRAINT `unsubscribed_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `email` (`user_id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
