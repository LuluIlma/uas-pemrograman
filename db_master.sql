/*
SQLyog Ultimate v12.5.1 (64 bit)
MySQL - 10.4.22-MariaDB : Database - db_master
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_master` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `db_master`;

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id_blog` int(11) NOT NULL AUTO_INCREMENT,
  `id_service` int(11) NOT NULL,
  `tags` varchar(50) NOT NULL,
  `authors` varchar(50) NOT NULL,
  `postdate` date NOT NULL,
  `content` longtext NOT NULL,
  `path_img` longtext NOT NULL,
  PRIMARY KEY (`id_blog`,`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `blog` */

/*Table structure for table `client` */

DROP TABLE IF EXISTS `client`;

CREATE TABLE `client` (
  `id_client` int(11) NOT NULL AUTO_INCREMENT,
  `nama_client` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `no_client` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `email_client` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `client` */

/*Table structure for table `project` */

DROP TABLE IF EXISTS `project`;

CREATE TABLE `project` (
  `id_project` int(11) NOT NULL AUTO_INCREMENT,
  `id_client` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `nama_project` varchar(100) NOT NULL,
  `testimoni` longtext DEFAULT NULL,
  `status_project` int(11) NOT NULL,
  `deskripsi_project` longtext NOT NULL,
  `tgl_mulai` date NOT NULL,
  `tgl_selesai` date NOT NULL,
  PRIMARY KEY (`id_project`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `project` */

/*Table structure for table `project_skill` */

DROP TABLE IF EXISTS `project_skill`;

CREATE TABLE `project_skill` (
  `id_projectskill` int(11) NOT NULL AUTO_INCREMENT,
  `id_project` int(11) NOT NULL,
  `id_skill` int(11) NOT NULL,
  PRIMARY KEY (`id_projectskill`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `project_skill` */

/*Table structure for table `service` */

DROP TABLE IF EXISTS `service`;

CREATE TABLE `service` (
  `id_service` int(11) NOT NULL AUTO_INCREMENT,
  `nama_service` varchar(50) NOT NULL,
  `deskripsi_service` longtext NOT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `service` */

/*Table structure for table `skill` */

DROP TABLE IF EXISTS `skill`;

CREATE TABLE `skill` (
  `id_skill` int(11) NOT NULL AUTO_INCREMENT,
  `nama_skill` varchar(50) NOT NULL,
  PRIMARY KEY (`id_skill`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `skill` */

/*Table structure for table `user_login` */

DROP TABLE IF EXISTS `user_login`;

CREATE TABLE `user_login` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 NOT NULL,
  `nama_user` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`id_user`,`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `user_login` */

insert  into `user_login`(`id_user`,`username`,`nama_user`,`password`) values 
(1,'admin','admin','202cb962ac59075b964b07152d234b70');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
