/*
SQLyog Ultimate v11.11 (64 bit)
MySQL - 5.1.36-community-log : Database - db_pengiriman_barang
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`db_pengiriman_barang` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `db_pengiriman_barang`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `id_admin` char(10) NOT NULL,
  `nama_admin` varchar(30) DEFAULT NULL,
  `pass_admin` varchar(32) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `admin` */

insert  into `admin`(`id_admin`,`nama_admin`,`pass_admin`,`last_login`) values ('A0001','YOLANDA SSAADAH','698d51a19d8a121ce581499d7b701668','2024-01-12 01:07:17');

/*Table structure for table `karyawan` */

DROP TABLE IF EXISTS `karyawan`;

CREATE TABLE `karyawan` (
  `kd_karyawan` char(10) NOT NULL,
  `nama_karyawan` varchar(50) DEFAULT NULL,
  `alamat_karyawan` varchar(50) DEFAULT NULL,
  `notelp_karyawan` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`kd_karyawan`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `karyawan` */

insert  into `karyawan`(`kd_karyawan`,`nama_karyawan`,`alamat_karyawan`,`notelp_karyawan`) values ('K0001','Shandra','Jl. Khatib Sulaiman ','089765456788');

/*Table structure for table `kurir` */

DROP TABLE IF EXISTS `kurir`;

CREATE TABLE `kurir` (
  `kd_kurir` char(10) NOT NULL,
  `nama_kurir` varchar(50) DEFAULT NULL,
  `alamat_kurir` varchar(50) DEFAULT NULL,
  `notelp_kurir` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`kd_kurir`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `kurir` */

insert  into `kurir`(`kd_kurir`,`nama_kurir`,`alamat_kurir`,`notelp_kurir`) values ('KR001','Ridho','Jl. Indarung','081324567889');

/*Table structure for table `paket` */

DROP TABLE IF EXISTS `paket`;

CREATE TABLE `paket` (
  `no_resi` char(20) NOT NULL,
  `tanggal` date DEFAULT NULL,
  `nama_barang` varchar(50) DEFAULT NULL,
  `paket_nama_pengirim` varchar(50) DEFAULT NULL,
  `paket_nama_penerima` varchar(50) DEFAULT NULL,
  `berat_barang` double DEFAULT NULL,
  `kota_tujuan` varchar(50) DEFAULT NULL,
  `biaya_perkg` double DEFAULT NULL,
  `ongkos_kirim` double DEFAULT NULL,
  `paket_sampai` date DEFAULT NULL,
  PRIMARY KEY (`no_resi`),
  KEY `paket_nama_pengirim` (`paket_nama_pengirim`),
  KEY `paket_nama_penerima` (`paket_nama_penerima`),
  CONSTRAINT `paket_ibfk_1` FOREIGN KEY (`paket_nama_pengirim`) REFERENCES `pengirim` (`kd_pengirim`) ON UPDATE CASCADE,
  CONSTRAINT `paket_ibfk_2` FOREIGN KEY (`paket_nama_penerima`) REFERENCES `penerima` (`kd_penerima`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `paket` */

insert  into `paket`(`no_resi`,`tanggal`,`nama_barang`,`paket_nama_pengirim`,`paket_nama_penerima`,`berat_barang`,`kota_tujuan`,`biaya_perkg`,`ongkos_kirim`,`paket_sampai`) values ('EX0001','2024-01-01','Elektronik','PG001','P0001',70,NULL,NULL,10000,'2024-01-05');

/*Table structure for table `penerima` */

DROP TABLE IF EXISTS `penerima`;

CREATE TABLE `penerima` (
  `kd_penerima` char(10) NOT NULL,
  `nama_penerima` varchar(50) DEFAULT NULL,
  `alamat_penerima` varchar(50) DEFAULT NULL,
  `notelp_penerima` varchar(15) DEFAULT NULL,
  `kota_penerima` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_penerima`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `penerima` */

insert  into `penerima`(`kd_penerima`,`nama_penerima`,`alamat_penerima`,`notelp_penerima`,`kota_penerima`) values ('P0001','Shiha','Jl. Sirsak 4','081324567787','Padang');

/*Table structure for table `pengirim` */

DROP TABLE IF EXISTS `pengirim`;

CREATE TABLE `pengirim` (
  `kd_pengirim` char(10) NOT NULL,
  `nama_pengirim` varchar(50) DEFAULT NULL,
  `alamat_pengirim` varchar(50) DEFAULT NULL,
  `notelp_pengirim` varchar(15) DEFAULT NULL,
  `kota_pengirim` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`kd_pengirim`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pengirim` */

insert  into `pengirim`(`kd_pengirim`,`nama_pengirim`,`alamat_pengirim`,`notelp_pengirim`,`kota_pengirim`) values ('PG001','Nurly Sya','Jl. Sungai Bramas','082314567891','Padang');

/*Table structure for table `temp` */

DROP TABLE IF EXISTS `temp`;

CREATE TABLE `temp` (
  `no_resi` char(20) DEFAULT NULL,
  `nambar` varchar(50) DEFAULT NULL,
  `beratbrg` double DEFAULT NULL,
  `ongkir` double DEFAULT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

/*Data for the table `temp` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
