/*
SQLyog Ultimate v11.42 (64 bit)
MySQL - 8.0.21 : Database - declara_chiapas
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`declara_chiapas` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `declara_chiapas`;

/*Table structure for table `aclaraciones` */

DROP TABLE IF EXISTS `aclaraciones`;

CREATE TABLE `aclaraciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `id_persona` int NOT NULL,
  `no_comprobacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `descripcion` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `director_evolucion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cargo_director` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_aclaracion` datetime DEFAULT NULL,
  `serie_certificado` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `secuencia_firma` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_firma` datetime DEFAULT NULL,
  `firma_electronica` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cadena_original` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `uuid` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `noOficio` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fechaSellado` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cadenaSello` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `xml` longblob,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nombre_archivo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tipo_archivo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_usuario_solicita` (`id_persona`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `aclaraciones` */

/*Table structure for table `activar_complementaria` */

DROP TABLE IF EXISTS `activar_complementaria`;

CREATE TABLE `activar_complementaria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `hecho` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6567 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `activar_complementaria` */

/*Table structure for table `bitacora` */

DROP TABLE IF EXISTS `bitacora`;

CREATE TABLE `bitacora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_c_bitacora` int DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE,
  CONSTRAINT `bitacora_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `bitacora` */

/*Table structure for table `buzon_notificacion` */

DROP TABLE IF EXISTS `buzon_notificacion`;

CREATE TABLE `buzon_notificacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `telefono_personal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono_alterno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `ciudad` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `colonia` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `calle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `codigo_postal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `referencia` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `correo_personal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_aceptacion` datetime DEFAULT NULL,
  `serie_certificado` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `secuencia_firma` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_firma` datetime DEFAULT NULL,
  `firma_electronica` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cadena_original` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19007 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `buzon_notificacion` */

/*Table structure for table `c_actividad_laboral` */

DROP TABLE IF EXISTS `c_actividad_laboral`;

CREATE TABLE `c_actividad_laboral` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_actividad_laboral` */

insert  into `c_actividad_laboral`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'PRI','PRIVADO','',NULL,'2021-05-26 08:53:22',NULL),(2,'PUB','PÚBLICO','',NULL,'2021-05-26 08:53:28',NULL),(3,'NIN','NINGUNO','',NULL,'2021-05-26 08:53:34',NULL),(4,'OTR','OTRO (ESPECIFIQUE)','',NULL,'2021-05-26 08:53:38',NULL);

/*Table structure for table `c_adquisicion_conforme` */

DROP TABLE IF EXISTS `c_adquisicion_conforme`;

CREATE TABLE `c_adquisicion_conforme` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_adquisicion_conforme` */

insert  into `c_adquisicion_conforme`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'ESCRITURA PÚBLICA','',NULL,'2021-05-26 13:27:22',NULL),(2,'SENTENCIA','',NULL,'2021-05-26 13:27:26',NULL),(3,'CONTRATO','',NULL,'2021-05-26 13:27:28',NULL);

/*Table structure for table `c_afores` */

DROP TABLE IF EXISTS `c_afores`;

CREATE TABLE `c_afores` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_afores` */

insert  into `c_afores`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Afores','',NULL,'2019-08-26 13:04:25',NULL),(2,'Fideicomisos','',NULL,'2019-08-26 13:04:25',NULL),(3,'Certificados de la tesoreria','',NULL,'2019-08-26 13:04:25',NULL),(4,'Prestamos a favor de un tercero','',NULL,'2019-08-26 13:04:25',NULL);

/*Table structure for table `c_ambito` */

DROP TABLE IF EXISTS `c_ambito`;

CREATE TABLE `c_ambito` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_ambito` */

insert  into `c_ambito`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'PUB','PÚBLICO','',NULL,'2021-05-26 09:12:50',NULL),(2,'PRV','PRIVADO','',NULL,'2021-05-26 09:13:00',NULL),(3,'OTR','OTRO (ESPECIFIQUE)','',NULL,'2021-05-26 09:13:03',NULL);

/*Table structure for table `c_bancaria` */

DROP TABLE IF EXISTS `c_bancaria`;

CREATE TABLE `c_bancaria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_bancaria` */

insert  into `c_bancaria`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Cuenta de nomina','',NULL,'2019-08-26 12:42:01',NULL),(2,'Cuenta de ahorro','',NULL,'2019-08-26 12:42:01',NULL),(3,'Cuenta de cheques','',NULL,'2019-08-26 12:42:01',NULL),(4,'Cuenta maestra','',NULL,'2019-08-26 12:42:01',NULL),(5,'Cuenta eje','',NULL,'2019-08-26 12:42:01',NULL),(6,'Deposito a plazos','',NULL,'2019-08-26 12:42:01',NULL);

/*Table structure for table `c_bien` */

DROP TABLE IF EXISTS `c_bien`;

CREATE TABLE `c_bien` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_bien` */

insert  into `c_bien`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'MUE','MUEBLE','',NULL,'2021-05-26 12:39:03',NULL),(2,'INM','INMUEBLE','',NULL,'2021-05-26 12:39:11',NULL),(3,'VEH','VEHICULO','',NULL,'2021-05-26 12:39:16',NULL);

/*Table structure for table `c_bitacora` */

DROP TABLE IF EXISTS `c_bitacora`;

CREATE TABLE `c_bitacora` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_bitacora` */

insert  into `c_bitacora`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Consulta','',NULL,'2019-09-02 12:59:33',NULL),(2,'Impresion','',NULL,'2019-09-02 12:59:39',NULL),(3,'Cambio en declaracion','',NULL,'2019-09-02 12:59:44',NULL);

/*Table structure for table `c_cargo_puesto` */

DROP TABLE IF EXISTS `c_cargo_puesto`;

CREATE TABLE `c_cargo_puesto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_c_declaracion` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_cargo_puesto` */

insert  into `c_cargo_puesto`(`id`,`id_c_declaracion`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,1,'MAGISTRADA PRESIDENTA','',NULL,'2025-06-23 15:10:08',NULL),(2,1,'MAGISTRADO','',NULL,'2025-06-23 15:10:08',NULL),(3,1,'JUEZ','',NULL,'2025-06-23 15:10:08',NULL),(4,1,'ENLACE B','',NULL,'2025-06-23 15:10:08',NULL),(5,1,'SECRETARIA GENERAL DE ACUERDOS','',NULL,'2025-06-23 15:10:08',NULL),(6,1,'SECRETARIO DE ESTUDIO Y CUENTA','',NULL,'2025-06-23 15:10:08',NULL),(7,1,'SECRETARIO PROYECTISTA','',NULL,'2025-06-23 15:10:08',NULL),(8,1,'SECRETARIO','',NULL,'2025-06-23 15:10:08',NULL),(9,1,'ACTUARIO Y NOTIFICADOR','',NULL,'2025-06-23 15:10:08',NULL),(10,1,'SECRETARIO AUXILIAR','',NULL,'2025-06-23 15:10:08',NULL),(11,1,'ANALISTA PROFESIONAL C','',NULL,'2025-06-23 15:10:08',NULL),(12,1,'ANALISTA PROFESIONAL D','',NULL,'2025-06-23 15:10:08',NULL),(13,1,'ANALISTA PROFESIONAL F','',NULL,'2025-06-23 15:10:08',NULL),(14,1,'TÉCNICO EN INFORMÁTICA','',NULL,'2025-06-23 15:10:08',NULL),(15,1,'AUXILIAR ADMINISTRATIVO B','',NULL,'2025-06-23 15:10:08',NULL),(16,1,'OFICINISTA','',NULL,'2025-06-23 15:10:08',NULL),(17,1,'CHOFER','',NULL,'2025-06-23 15:10:08',NULL),(18,1,'CONSERJE','',NULL,'2025-06-23 15:10:08',NULL);

/*Table structure for table `c_categoria` */

DROP TABLE IF EXISTS `c_categoria`;

CREATE TABLE `c_categoria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_c_declaracion` int DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `clave` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_categoria` */

/*Table structure for table `c_declaracion` */

DROP TABLE IF EXISTS `c_declaracion`;

CREATE TABLE `c_declaracion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_declaracion` */

insert  into `c_declaracion`(`id`,`descripcion`,`created_at`,`updated_at`,`deleted_at`) values (1,'Completa',NULL,'2020-10-22 14:28:07',NULL),(2,'Simplificada',NULL,'2020-10-22 10:12:41',NULL);

/*Table structure for table `c_dependencia` */

DROP TABLE IF EXISTS `c_dependencia`;

CREATE TABLE `c_dependencia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no` int DEFAULT NULL,
  `acronimo` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contacto` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `estadistica` bit(1) DEFAULT b'1',
  `gabinete_ampliado_0_legal_1` bit(1) DEFAULT b'0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_dependencia` */

insert  into `c_dependencia`(`id`,`no`,`acronimo`,`nombre`,`titular`,`contacto`,`logo`,`activo`,`estadistica`,`gabinete_ampliado_0_legal_1`,`created_at`,`updated_at`,`deleted_at`) values (1,1,'TJAECH','Tribunal de Justicia Administrativa del Estado de Chiapas','Mtra. Edna Maritza Morales Bautista','961 346 9030 Ext. 2525',NULL,1,'','\0',NULL,'2025-06-23 15:10:08',NULL);

/*Table structure for table `c_documento_obtenido` */

DROP TABLE IF EXISTS `c_documento_obtenido`;

CREATE TABLE `c_documento_obtenido` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_documento_obtenido` */

insert  into `c_documento_obtenido`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'BOLETA','',NULL,'2021-05-26 09:24:06',NULL),(2,'CERTIFICADO','',NULL,'2021-05-26 09:24:12',NULL),(3,'CONSTANCIA','',NULL,'2021-05-26 09:24:19',NULL),(4,'TITULO','',NULL,'2021-05-26 09:24:21',NULL);

/*Table structure for table `c_estado` */

DROP TABLE IF EXISTS `c_estado`;

CREATE TABLE `c_estado` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pais` int DEFAULT NULL,
  `clave` int DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_estado` */

insert  into `c_estado`(`id`,`id_pais`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,37,NULL,'Aguascalientes','',NULL,'2019-01-15 13:05:26',NULL),(2,37,NULL,'Durango','',NULL,'2019-01-15 13:05:26',NULL),(3,37,NULL,'Guanajuato','',NULL,'2019-01-15 13:05:26',NULL),(4,37,NULL,'Guerrero','',NULL,'2019-01-15 13:05:26',NULL),(5,37,NULL,'Hidalgo','',NULL,'2019-01-15 13:05:26',NULL),(6,37,NULL,'Jalisco','',NULL,'2019-01-15 13:05:26',NULL),(7,37,NULL,'México','',NULL,'2019-01-15 13:05:26',NULL),(8,37,NULL,'Michoacán','',NULL,'2019-01-15 13:05:26',NULL),(9,37,NULL,'Morelos','',NULL,'2019-01-15 13:05:26',NULL),(10,37,NULL,'Nayarit','',NULL,'2019-01-15 13:05:26',NULL),(11,37,NULL,'Nuevo León','',NULL,'2019-01-15 13:05:26',NULL),(12,37,NULL,'Baja California','',NULL,'2019-01-15 13:05:26',NULL),(13,37,NULL,'Oaxaca','',NULL,'2019-01-15 13:05:26',NULL),(14,37,NULL,'Puebla','',NULL,'2019-01-15 13:05:26',NULL),(15,37,NULL,'Querétaro','',NULL,'2019-01-15 13:05:26',NULL),(16,37,NULL,'Quintana Roo','',NULL,'2019-01-15 13:05:26',NULL),(17,37,NULL,'San Luis Potosí','',NULL,'2019-01-15 13:05:26',NULL),(18,37,NULL,'Sinaloa','',NULL,'2019-01-15 13:05:26',NULL),(19,37,NULL,'Sonora','',NULL,'2019-01-15 13:05:26',NULL),(20,37,NULL,'Tabasco','',NULL,'2019-01-15 13:05:26',NULL),(21,37,NULL,'Tamaulipas','',NULL,'2019-01-15 13:05:26',NULL),(22,37,NULL,'Tlaxcala','',NULL,'2019-01-15 13:05:26',NULL),(23,37,NULL,'Baja California Sur','',NULL,'2019-01-15 13:05:26',NULL),(24,37,NULL,'Veracruz','',NULL,'2019-01-15 13:05:26',NULL),(25,37,NULL,'Yucatán','',NULL,'2019-01-15 13:05:26',NULL),(26,37,NULL,'Zacatecas','',NULL,'2019-01-15 13:05:26',NULL),(27,37,NULL,'Campeche','',NULL,'2019-01-15 13:05:26',NULL),(28,37,NULL,'Coahuila','',NULL,'2019-01-15 13:05:26',NULL),(29,37,NULL,'Colima','',NULL,'2019-01-15 13:05:26',NULL),(30,37,NULL,'Chiapas','',NULL,'2019-01-15 13:05:26',NULL),(31,37,NULL,'Chihuahua','',NULL,'2019-01-15 13:05:26',NULL),(32,37,NULL,'Distrito Federal','',NULL,'2019-01-15 13:05:26',NULL),(33,148,NULL,'Bogotá','',NULL,'2019-01-15 13:05:26',NULL),(34,199,NULL,'Palermo','','2019-04-03 14:30:36','2019-04-03 14:30:36',NULL),(35,150,NULL,'La Habana','','2019-04-04 13:13:05','2019-04-04 13:13:05',NULL),(36,111,NULL,'Bolívar','','2019-04-08 08:33:46','2019-04-08 08:33:46',NULL),(37,107,NULL,'Alabama','','2019-04-12 14:14:20','2019-04-12 14:14:20',NULL),(38,164,NULL,'Badajoz','','2019-04-26 12:19:06','2019-04-26 12:19:06',NULL),(39,149,NULL,'San José','','2019-05-06 09:42:37','2019-05-06 09:42:37',NULL),(40,111,NULL,'Caracas','',NULL,'2020-01-28 11:45:41',NULL),(41,2,NULL,'Provincia Santa Fe','',NULL,'2020-03-09 10:26:58',NULL),(42,164,NULL,'Sevilla','',NULL,'2020-03-10 15:44:35',NULL),(43,183,NULL,'Quiché','',NULL,'2020-03-24 09:59:04',NULL),(44,150,NULL,'Santiago de Cuba','',NULL,'2020-03-25 11:52:37',NULL),(45,164,NULL,'Vizcaya','',NULL,'2020-05-20 15:06:01',NULL),(46,111,NULL,'Falcón','',NULL,'2020-06-12 10:41:30',NULL),(47,187,NULL,'Departamento de Yoro','',NULL,'2020-10-05 12:33:40',NULL),(48,187,NULL,'Tegucigalpa','',NULL,'2020-10-20 12:15:53',NULL),(49,142,NULL,'Berna','',NULL,'2020-12-08 13:35:40',NULL),(50,164,NULL,'León','',NULL,'2020-12-08 14:32:25',NULL),(51,187,NULL,'Francisco Morazan','',NULL,'2021-01-11 15:13:38',NULL),(52,111,NULL,'Zulia','',NULL,'2021-05-20 10:22:58',NULL),(53,154,NULL,'Baden Wuerttemberg','',NULL,'2021-05-25 09:21:01',NULL),(54,43,NULL,'Estelí','',NULL,'2021-05-31 12:16:07',NULL),(55,111,NULL,'Tachira','',NULL,'2023-02-27 12:07:05',NULL),(56,170,NULL,'Paris','',NULL,'2024-06-10 10:00:00',NULL),(57,150,NULL,'Camaguey','',NULL,'2024-11-12 11:59:24',NULL),(58,150,NULL,'Ciego de Avila','',NULL,'2024-11-26 15:03:52',NULL),(59,150,NULL,'Guantánamo','',NULL,'2024-12-18 12:31:30',NULL),(60,67,NULL,'Moscú','',NULL,'2025-01-21 11:08:43',NULL),(61,153,NULL,'Policka','',NULL,'2025-03-05 13:40:25',NULL);

/*Table structure for table `c_estado_civil` */

DROP TABLE IF EXISTS `c_estado_civil`;

CREATE TABLE `c_estado_civil` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_estado_civil` */

insert  into `c_estado_civil`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'SOL','SOLTERO (A)','',NULL,'2021-05-26 11:30:39',NULL),(2,'CAS','CASADO (A)','',NULL,'2021-05-26 11:30:48',NULL),(3,'DIV','DIVORCIADO (A)','',NULL,'2021-05-26 11:30:57',NULL),(4,'VIU','VIUDO (A)','',NULL,'2021-05-26 11:31:00',NULL),(5,'CON','CONCUBINA/CONCUBINARIO/UNIÓN LIBRE','',NULL,'2021-05-26 10:00:03',NULL),(6,'SCO','SOCIEDAD DE CONVIVENCIA','',NULL,'2021-05-26 10:00:39',NULL);

/*Table structure for table `c_estatus_academico` */

DROP TABLE IF EXISTS `c_estatus_academico`;

CREATE TABLE `c_estatus_academico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_estatus_academico` */

insert  into `c_estatus_academico`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'CURSANDO','',NULL,'2021-05-26 09:24:55',NULL),(2,'FINALIZADO','',NULL,'2021-05-26 09:25:00',NULL),(3,'TRUNCO','',NULL,'2021-05-26 09:25:03',NULL);

/*Table structure for table `c_estatus_aclaracion` */

DROP TABLE IF EXISTS `c_estatus_aclaracion`;

CREATE TABLE `c_estatus_aclaracion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_estatus_aclaracion` */

insert  into `c_estatus_aclaracion`(`id`,`nombre`,`created_at`,`updated_at`,`deleted_at`) values (1,'Enviada',NULL,'2019-09-02 11:49:23',NULL),(2,'En proceso',NULL,'2019-09-02 11:48:57',NULL),(3,'Atendida',NULL,'2019-09-02 11:49:16',NULL);

/*Table structure for table `c_estructura` */

DROP TABLE IF EXISTS `c_estructura`;

CREATE TABLE `c_estructura` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int NOT NULL,
  `subsecretaria` int DEFAULT NULL,
  `direccion` int DEFAULT NULL,
  `departamento` int DEFAULT NULL,
  `oficina` int DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_dependencia` (`id_dependencia`) USING BTREE,
  KEY `subsecretaria` (`subsecretaria`) USING BTREE,
  KEY `direccion` (`direccion`) USING BTREE,
  KEY `departamento` (`departamento`) USING BTREE,
  KEY `oficina` (`oficina`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_estructura` */

insert  into `c_estructura`(`id`,`id_dependencia`,`subsecretaria`,`direccion`,`departamento`,`oficina`,`nombre`,`titular`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,1,NULL,NULL,NULL,NULL,'PRESIDENCIA',NULL,1,'2025-06-23 16:25:48','2025-06-23 16:25:48',NULL),(2,1,NULL,NULL,NULL,NULL,'PONENCIA A',NULL,1,'2025-06-23 16:26:12','2025-06-23 16:26:12',NULL),(3,1,NULL,NULL,NULL,NULL,'PONENCIA B',NULL,1,'2025-06-23 16:26:22','2025-06-23 16:26:22',NULL),(4,1,NULL,NULL,NULL,NULL,'PONENCIA C',NULL,1,'2025-06-23 16:26:32','2025-06-23 16:26:32',NULL),(5,1,1,NULL,NULL,NULL,'UNIDAD DE APOYO ADMINISTRATIVO',NULL,1,'2025-06-23 16:27:28','2025-06-23 16:27:28',NULL),(6,1,1,NULL,NULL,NULL,'SECRETARIA GENERAL DE ACUERDOS Y DEL PLENO',NULL,1,'2025-06-23 16:27:58','2025-06-23 16:27:58',NULL),(7,1,1,NULL,NULL,NULL,'AREA JURIDICA CONTENCIOSA Y NORMATIVA',NULL,1,'2025-06-23 16:28:30','2025-06-23 16:28:30',NULL),(8,1,1,NULL,NULL,NULL,'INSTITUTO DE JUSTICIA ADMINISTRATIVA',NULL,1,'2025-06-23 16:28:51','2025-06-23 16:28:51',NULL),(9,1,1,NULL,NULL,NULL,'ORGANO INTERNO DE CONTROL',NULL,1,'2025-06-23 16:29:02','2025-06-23 16:29:02',NULL),(10,1,1,NULL,NULL,NULL,'AREA COORDINADORA DE ARCHIVOS',NULL,1,'2025-06-23 16:29:18','2025-06-23 16:29:18',NULL),(11,1,1,NULL,NULL,NULL,'UNIDAD DE TRANSPARENCIA',NULL,1,'2025-06-23 16:29:32','2025-06-23 16:29:32',NULL),(12,1,1,NULL,NULL,NULL,'AREA DE COMUNICACION SOCIAL',NULL,1,'2025-06-23 16:29:44','2025-06-23 16:29:44',NULL),(13,1,1,NULL,NULL,NULL,'CENTRO ESTATAL DE MECANISMOS ALTERNATIVOS DE SOLUCION DE CONTROVERSIAS EN MATERIA DE JUSTICIA ADMINISTRATIVA',NULL,1,'2025-06-23 16:30:26','2025-06-23 16:30:26',NULL),(14,1,1,NULL,NULL,NULL,'JUZGADO DE JURISDICCION ADMINISTRATIVA',NULL,1,'2025-06-23 16:30:46','2025-06-23 16:30:46',NULL),(15,1,1,NULL,NULL,NULL,'JUZGADO ESPECIALIZADO EN RESPONSABILIDAD ADMINISTRATIVA',NULL,1,'2025-06-23 16:31:14','2025-06-23 16:31:14',NULL),(16,1,1,NULL,NULL,NULL,'AREA DE DEFENSORIA DE OFICIO',NULL,1,'2025-06-23 16:31:28','2025-06-23 16:31:28',NULL),(17,1,1,5,NULL,NULL,'AREA DE RECURSOS FINANCIEROS',NULL,1,'2025-06-23 16:32:08','2025-06-23 16:32:08',NULL),(18,1,1,5,NULL,NULL,'AREA DE RECURSOS HUMANOS',NULL,1,'2025-06-23 16:32:19','2025-06-23 16:32:19',NULL),(19,1,1,5,NULL,NULL,'AREA DE PLANEACION',NULL,1,'2025-06-23 16:32:36','2025-06-23 16:32:36',NULL),(20,1,1,5,NULL,NULL,'AREA DE INFORMATICA',NULL,1,'2025-06-23 16:33:29','2025-06-23 16:33:29',NULL),(21,1,1,5,NULL,NULL,'AREA DE RECURSOS MATERIALES Y SERVICIOS GENERALES',NULL,1,'2025-06-23 16:33:52','2025-06-23 16:33:52',NULL);

/*Table structure for table `c_fondos_inversion` */

DROP TABLE IF EXISTS `c_fondos_inversion`;

CREATE TABLE `c_fondos_inversion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_fondos_inversion` */

insert  into `c_fondos_inversion`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Sociedades de inversion','',NULL,'2019-08-26 12:48:16',NULL),(2,'Inversiones financieras en el extranjero','',NULL,'2019-08-26 12:48:16',NULL);

/*Table structure for table `c_forma_adquisicion` */

DROP TABLE IF EXISTS `c_forma_adquisicion`;

CREATE TABLE `c_forma_adquisicion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(4) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_forma_adquisicion` */

insert  into `c_forma_adquisicion`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'CPV','COMPRAVENTA','',NULL,'2021-05-26 09:32:01',NULL),(2,'CSN','CESIÓN','',NULL,'2021-05-26 09:32:06',NULL),(3,'DNC','DONACIÓN','',NULL,'2021-05-26 09:32:10',NULL),(4,'HRN','HERENCIA','',NULL,'2021-05-26 09:32:13',NULL),(5,'PRM','PERMUTA','',NULL,'2021-05-26 09:32:19',NULL),(6,'RST','RIFA O SORTEO','',NULL,'2021-05-26 09:32:24',NULL),(7,'STC','SENTENCIA','',NULL,'2021-05-26 09:32:32',NULL);

/*Table structure for table `c_forma_apoyo` */

DROP TABLE IF EXISTS `c_forma_apoyo`;

CREATE TABLE `c_forma_apoyo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_forma_apoyo` */

insert  into `c_forma_apoyo`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (14,'MONETARIO','',NULL,'2021-05-26 09:34:05',NULL),(15,'ESPECIE','',NULL,'2021-05-26 09:34:11',NULL);

/*Table structure for table `c_forma_pago` */

DROP TABLE IF EXISTS `c_forma_pago`;

CREATE TABLE `c_forma_pago` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_forma_pago` */

insert  into `c_forma_pago`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'CRÉDITO','',NULL,'2021-05-26 09:33:03',NULL),(2,'CONTADO','',NULL,'2021-05-26 09:33:09',NULL),(3,'NO APLICA','',NULL,'2021-05-26 09:33:11',NULL);

/*Table structure for table `c_funciones_principales` */

DROP TABLE IF EXISTS `c_funciones_principales`;

CREATE TABLE `c_funciones_principales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_funciones_principales` */

insert  into `c_funciones_principales`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Administracion de bienes','',NULL,'2019-09-03 08:23:36',NULL),(2,'Administraicion de recursos humanos','',NULL,'2019-09-03 08:23:36',NULL),(3,'Areas tecnicas','',NULL,'2019-09-03 08:23:36',NULL),(4,'Atencion directa al publico','',NULL,'2019-09-03 08:23:36',NULL),(5,'Fuerza de seguridad e inteligencia','',NULL,'2019-09-03 08:23:36',NULL),(6,'Regulacion y politicas publicas','',NULL,'2019-09-03 08:23:36',NULL),(7,'Administracion financiera(recaudacion de ingresos, desembolso de fondos, presupuestos, contabilidad)','',NULL,'2019-09-03 08:23:36',NULL),(8,'Auditoria, control interno, fiscalizacion, vigilancia, interventorias, inspeccion','',NULL,'2019-09-03 08:23:36',NULL),(9,'Contratos, adquisiciones, servicios y obra publica','',NULL,'2019-09-03 08:23:36',NULL),(10,'Legislar a nivel federal, estatal y cabildo municipal','',NULL,'2019-09-03 08:23:36',NULL),(11,'Otorgamiento de permisos, beneficios, subsidios, concesiones, licencias, derechos de uso inmobiliario, recursos naturales o propiedad','',NULL,'2019-09-03 08:23:36',NULL),(12,'Procuracion de justicia(sentencias, ministerios publicos, fiscales, policias de investigacion, auxiliares, etc)','',NULL,'2019-09-03 08:23:36',NULL),(13,'Otro(especifique: servicio público)','',NULL,'2020-05-01 14:44:57',NULL);

/*Table structure for table `c_grado_academico` */

DROP TABLE IF EXISTS `c_grado_academico`;

CREATE TABLE `c_grado_academico` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_grado_academico` */

insert  into `c_grado_academico`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'PRI','PRIMARIA','',NULL,'2021-05-26 09:42:11',NULL),(2,'SEC','SECUNDARIA','',NULL,'2021-05-26 09:42:15',NULL),(3,'BCH','BACHILLERATO','',NULL,'2021-05-26 09:42:22',NULL),(4,'CTC','CARRERA TÉCNICA O COMERCIAL','',NULL,'2021-05-26 09:42:27',NULL),(5,'LIC','LICENCIATURA','',NULL,'2021-05-26 09:42:32',NULL),(6,'ESP','ESPECIALIDAD','',NULL,'2021-05-26 09:42:36',NULL),(7,'MAE','MAESTRÍA','',NULL,'2021-05-26 09:42:40',NULL),(8,'DOC','DOCTORADO','',NULL,'2021-05-26 09:42:42',NULL);

/*Table structure for table `c_moneda_metal` */

DROP TABLE IF EXISTS `c_moneda_metal`;

CREATE TABLE `c_moneda_metal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_moneda_metal` */

insert  into `c_moneda_metal`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Centenarios','',NULL,'2019-08-26 12:53:14',NULL),(2,'Divisas','',NULL,'2019-08-26 12:53:14',NULL),(3,'Moneda nacional','',NULL,'2019-08-26 12:53:14',NULL),(4,'Onzas troy','',NULL,'2019-08-26 12:53:14',NULL),(5,'Criptomonedas','',NULL,'2019-08-26 12:53:14',NULL);

/*Table structure for table `c_motivo_baja` */

DROP TABLE IF EXISTS `c_motivo_baja`;

CREATE TABLE `c_motivo_baja` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_motivo_baja` */

insert  into `c_motivo_baja`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'VNT','VENTA','',NULL,'2021-05-26 09:40:59',NULL),(2,'DNC','DONACIÓN','',NULL,'2021-05-26 09:41:06',NULL),(3,'SNT','SINIESTRO','',NULL,'2021-05-26 09:41:12',NULL),(4,'OTRO','OTRO(ESPECIFIQUE)','',NULL,'2021-05-26 09:41:21',NULL);

/*Table structure for table `c_motivo_baja_funcionario` */

DROP TABLE IF EXISTS `c_motivo_baja_funcionario`;

CREATE TABLE `c_motivo_baja_funcionario` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_motivo_baja_funcionario` */

insert  into `c_motivo_baja_funcionario`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Baja por renuncia voluntaria','',NULL,'2020-01-13 11:46:39',NULL),(2,'Baja por rescisión laboral en términos de Ley','',NULL,'2024-05-28 15:31:59',NULL),(3,'Baja por jubilación o pensión','',NULL,'2019-12-20 13:18:02',NULL),(4,'Baja por retiro voluntario administrativo del personal de base','',NULL,'2019-12-20 13:18:56',NULL),(5,'Baja por destitución del puesto e inhabilitación','',NULL,'2022-01-28 12:55:54',NULL),(6,'Baja por defunción','',NULL,'2019-12-20 13:19:09',NULL),(7,'Baja por Promoción / Recategorización','',NULL,'2022-01-28 12:56:02',NULL),(8,'Baja por término de contrato / Interinato','',NULL,'2022-01-28 12:56:08',NULL),(9,'Exservidor / Omiso','',NULL,'2020-01-28 12:25:58',NULL),(10,'Transferencia Externa de la Plaza','',NULL,'2020-02-07 13:53:57',NULL),(11,'Baja por cambio de adscripción','',NULL,'2020-03-06 14:47:15',NULL),(12,'Suspensión laboral (Licencia, prisión preventiva, arresto, litis laboral, etc)','',NULL,'2021-02-18 15:20:11',NULL),(13,'Baja por Resolución que emita la Autoridad competente','',NULL,'2022-05-27 13:20:26',NULL),(14,'Baja por Reestructuración Interna','',NULL,'2022-08-01 09:52:06',NULL),(15,'Baja por decreto de extinción publicado en el P.O.E.','',NULL,'2023-10-03 11:32:49',NULL),(16,'Incapacidad permanente fisica o mental debidamente comprobada','',NULL,'2023-11-08 11:19:16',NULL),(17,'Baja por autorización de comisión administrativa a otro ente público','',NULL,'2024-02-06 13:29:24',NULL);

/*Table structure for table `c_municipio` */

DROP TABLE IF EXISTS `c_municipio`;

CREATE TABLE `c_municipio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_estado` int DEFAULT NULL,
  `clave` int DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2468 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_municipio` */

insert  into `c_municipio`(`id`,`id_estado`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,30,NULL,'ACALA','',NULL,'2019-01-15 13:06:27',NULL),(2,30,NULL,'MITONTIC','',NULL,'2019-01-15 13:06:27',NULL),(3,30,NULL,'MOTOZINTLA','',NULL,'2019-01-15 13:06:27',NULL),(4,30,NULL,'NICOLAS RUIZ','',NULL,'2019-01-15 13:06:27',NULL),(5,30,NULL,'ANGEL ALBINO CORZO','',NULL,'2019-01-15 13:06:27',NULL),(6,30,NULL,'OCOSINGO','',NULL,'2019-01-15 13:06:27',NULL),(7,30,NULL,'OCOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(8,30,NULL,'OCOZOCOAUTLA DE ESPINOSA','',NULL,'2019-01-15 13:06:27',NULL),(9,30,NULL,'OSTUACAN','',NULL,'2019-01-15 13:06:27',NULL),(10,30,NULL,'OSUMACINTA','',NULL,'2019-01-15 13:06:27',NULL),(11,30,NULL,'OXCHUC','',NULL,'2019-01-15 13:06:27',NULL),(12,30,NULL,'PALENQUE','',NULL,'2019-01-15 13:06:27',NULL),(13,30,NULL,'PANTELHO','',NULL,'2019-01-15 13:06:27',NULL),(14,30,NULL,'PANTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(15,30,NULL,'PICHUCALCO','',NULL,'2019-01-15 13:06:27',NULL),(16,30,NULL,'PIJIJIAPAN','',NULL,'2019-01-15 13:06:27',NULL),(17,30,NULL,'PORVENIR, EL','',NULL,'2019-01-15 13:06:27',NULL),(18,30,NULL,'PUEBLO NUEVO SOLISTAHUACAN','',NULL,'2019-01-15 13:06:27',NULL),(19,30,NULL,'RAYON','',NULL,'2019-01-15 13:06:27',NULL),(20,30,NULL,'REFORMA','',NULL,'2019-01-15 13:06:27',NULL),(21,30,NULL,'ROSAS, LAS','',NULL,'2019-01-15 13:06:27',NULL),(22,30,NULL,'SABANILLA','',NULL,'2019-01-15 13:06:27',NULL),(23,30,NULL,'SALTO DE AGUA','',NULL,'2019-01-15 13:06:27',NULL),(24,30,NULL,'SAN CRISTOBAL DE LAS CASAS','',NULL,'2019-01-15 13:06:27',NULL),(25,30,NULL,'SAN FERNANDO','',NULL,'2019-01-15 13:06:27',NULL),(26,30,NULL,'ACAPETAHUA','',NULL,'2019-01-15 13:06:27',NULL),(27,30,NULL,'ARRIAGA','',NULL,'2019-01-15 13:06:27',NULL),(28,30,NULL,'SAN JUAN CANCUC','',NULL,'2019-01-15 13:06:27',NULL),(29,30,NULL,'SAN LUCAS','',NULL,'2019-01-15 13:06:27',NULL),(30,30,NULL,'SILTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(31,30,NULL,'SIMOJOVEL','',NULL,'2019-01-15 13:06:27',NULL),(32,30,NULL,'SITALA','',NULL,'2019-01-15 13:06:27',NULL),(33,30,NULL,'SOCOLTENANGO','',NULL,'2019-01-15 13:06:27',NULL),(34,30,NULL,'SOLOSUCHIAPA','',NULL,'2019-01-15 13:06:27',NULL),(35,30,NULL,'SOYALO','',NULL,'2019-01-15 13:06:27',NULL),(36,30,NULL,'SUCHIAPA','',NULL,'2019-01-15 13:06:27',NULL),(37,30,NULL,'SUCHIATE','',NULL,'2019-01-15 13:06:27',NULL),(38,30,NULL,'SUNUAPA','',NULL,'2019-01-15 13:06:27',NULL),(39,30,NULL,'TAPACHULA','',NULL,'2019-01-15 13:06:27',NULL),(40,30,NULL,'TAPALAPA','',NULL,'2019-01-15 13:06:27',NULL),(41,30,NULL,'TAPILULA','',NULL,'2019-01-15 13:06:27',NULL),(42,30,NULL,'TECPATAN','',NULL,'2019-01-15 13:06:27',NULL),(43,30,NULL,'TENEJAPA','',NULL,'2019-01-15 13:06:27',NULL),(44,30,NULL,'TEOPISCA','',NULL,'2019-01-15 13:06:27',NULL),(45,30,NULL,'TILA','',NULL,'2019-01-15 13:06:27',NULL),(46,30,NULL,'TONALA','',NULL,'2019-01-15 13:06:27',NULL),(47,30,NULL,'TOTOLAPA','',NULL,'2019-01-15 13:06:27',NULL),(48,30,NULL,'TRINITARIA, LA','',NULL,'2019-01-15 13:06:27',NULL),(49,30,NULL,'TUMBALA','',NULL,'2019-01-15 13:06:27',NULL),(50,30,NULL,'TUXTLA CHICO','',NULL,'2019-01-15 13:06:27',NULL),(51,30,NULL,'TUXTLA GUTIERREZ','',NULL,'2019-01-15 13:06:27',NULL),(52,30,NULL,'TUZANTAN','',NULL,'2019-01-15 13:06:27',NULL),(53,30,NULL,'TZIMOL','',NULL,'2019-01-15 13:06:27',NULL),(54,30,NULL,'UNION JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(55,30,NULL,'BEJUCAL DE OCAMPO','',NULL,'2019-01-15 13:06:27',NULL),(56,30,NULL,'BELLA VISTA','',NULL,'2019-01-15 13:06:27',NULL),(57,30,NULL,'VENUSTIANO CARRANZA','',NULL,'2019-01-15 13:06:27',NULL),(58,30,NULL,'VILLA COMALTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(59,30,NULL,'VILLA CORZO','',NULL,'2019-01-15 13:06:27',NULL),(60,30,NULL,'VILLAFLORES','',NULL,'2019-01-15 13:06:27',NULL),(61,30,NULL,'BERRIOZABAL','',NULL,'2019-01-15 13:06:27',NULL),(62,30,NULL,'YAJALON','',NULL,'2019-01-15 13:06:27',NULL),(63,30,NULL,'BOCHIL','',NULL,'2019-01-15 13:06:27',NULL),(64,30,NULL,'BOSQUE, EL','',NULL,'2019-01-15 13:06:27',NULL),(65,30,NULL,'ZINACANTAN','',NULL,'2019-01-15 13:06:27',NULL),(66,30,NULL,'CACAHOATAN','',NULL,'2019-01-15 13:06:27',NULL),(67,30,NULL,'CATAZAJA','',NULL,'2019-01-15 13:06:27',NULL),(68,30,NULL,'CHALCHIHUITAN','',NULL,'2019-01-15 13:06:27',NULL),(69,30,NULL,'CHAMULA','',NULL,'2019-01-15 13:06:27',NULL),(70,30,NULL,'CHANAL','',NULL,'2019-01-15 13:06:27',NULL),(71,30,NULL,'CHAPULTENANGO','',NULL,'2019-01-15 13:06:27',NULL),(72,30,NULL,'CHENALHO','',NULL,'2019-01-15 13:06:27',NULL),(73,30,NULL,'CHIAPA DE CORZO','',NULL,'2019-01-15 13:06:27',NULL),(74,30,NULL,'CHIAPILLA','',NULL,'2019-01-15 13:06:27',NULL),(75,30,NULL,'CHICOASEN','',NULL,'2019-01-15 13:06:27',NULL),(76,30,NULL,'CHICOMUSELO','',NULL,'2019-01-15 13:06:27',NULL),(77,30,NULL,'CHILON','',NULL,'2019-01-15 13:06:27',NULL),(78,30,NULL,'CINTALAPA','',NULL,'2019-01-15 13:06:27',NULL),(79,30,NULL,'COAPILLA','',NULL,'2019-01-15 13:06:27',NULL),(80,30,NULL,'COMITAN DE DOMINGUEZ','',NULL,'2019-01-15 13:06:27',NULL),(81,30,NULL,'CONCORDIA, LA','',NULL,'2019-01-15 13:06:27',NULL),(82,30,NULL,'COPAINALA','',NULL,'2019-01-15 13:06:27',NULL),(83,30,NULL,'ESCUINTLA','',NULL,'2019-01-15 13:06:27',NULL),(84,30,NULL,'FRANCISCO LEON','',NULL,'2019-01-15 13:06:27',NULL),(85,30,NULL,'FRONTERA COMALAPA','',NULL,'2019-01-15 13:06:27',NULL),(86,30,NULL,'FRONTERA HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(87,30,NULL,'GRANDEZA, LA','',NULL,'2019-01-15 13:06:27',NULL),(88,30,NULL,'ACACOYAGUA','',NULL,'2019-01-15 13:06:27',NULL),(89,30,NULL,'HUEHUETAN','',NULL,'2019-01-15 13:06:27',NULL),(90,30,NULL,'HUITIUPAN','',NULL,'2019-01-15 13:06:27',NULL),(91,30,NULL,'HUIXTAN','',NULL,'2019-01-15 13:06:27',NULL),(92,30,NULL,'HUIXTLA','',NULL,'2019-01-15 13:06:27',NULL),(93,30,NULL,'INDEPENDENCIA, LA','',NULL,'2019-01-15 13:06:27',NULL),(94,30,NULL,'IXHUATAN','',NULL,'2019-01-15 13:06:27',NULL),(95,30,NULL,'IXTACOMITAN','',NULL,'2019-01-15 13:06:27',NULL),(96,30,NULL,'IXTAPA','',NULL,'2019-01-15 13:06:27',NULL),(97,30,NULL,'IXTAPANGAJOYA','',NULL,'2019-01-15 13:06:27',NULL),(98,30,NULL,'ALTAMIRANO','',NULL,'2019-01-15 13:06:27',NULL),(99,30,NULL,'JIQUIPILAS','',NULL,'2019-01-15 13:06:27',NULL),(100,30,NULL,'JITOTOL','',NULL,'2019-01-15 13:06:27',NULL),(101,30,NULL,'JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(102,30,NULL,'LARRAINZAR','',NULL,'2019-01-15 13:06:27',NULL),(103,30,NULL,'LIBERTAD, LA','',NULL,'2019-01-15 13:06:27',NULL),(104,30,NULL,'AMATAN','',NULL,'2019-01-15 13:06:27',NULL),(105,30,NULL,'AMATENANGO DE LA FRONTERA','',NULL,'2019-01-15 13:06:27',NULL),(106,30,NULL,'AMATENANGO DEL VALLE','',NULL,'2019-01-15 13:06:27',NULL),(107,30,NULL,'MAPASTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(108,30,NULL,'MARGARITAS, LAS','',NULL,'2019-01-15 13:06:27',NULL),(109,30,NULL,'MAZAPA DE MADERO','',NULL,'2019-01-15 13:06:27',NULL),(110,30,NULL,'MAZATAN','',NULL,'2019-01-15 13:06:27',NULL),(111,30,NULL,'METAPA','',NULL,'2019-01-15 13:06:27',NULL),(112,30,NULL,'ALDAMA','',NULL,'2019-01-15 13:06:27',NULL),(113,30,NULL,'BENEMERITO DE LAS AMERICAS','',NULL,'2019-01-15 13:06:27',NULL),(114,30,NULL,'MARAVILLA TENEJAPA','',NULL,'2019-01-15 13:06:27',NULL),(115,30,NULL,'MARQUES DE COMILLAS','',NULL,'2019-01-15 13:06:27',NULL),(116,30,NULL,'MONTECRISTO DE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(117,30,NULL,'SAN ANDRES DURAZNAL','',NULL,'2019-01-15 13:06:27',NULL),(118,30,NULL,'SANTIAGO EL PINAR','',NULL,'2019-01-15 13:06:27',NULL),(119,1,NULL,'PABELLON DE ARTEAGA','',NULL,'2019-01-15 13:06:27',NULL),(120,1,NULL,'RINCON DE ROMOS','',NULL,'2019-01-15 13:06:27',NULL),(121,1,NULL,'SAN FRANCISCO DE LOS ROMO','',NULL,'2019-01-15 13:06:27',NULL),(122,1,NULL,'SAN JOSE DE GRACIA','',NULL,'2019-01-15 13:06:27',NULL),(123,1,NULL,'ASIENTOS','',NULL,'2019-01-15 13:06:27',NULL),(124,1,NULL,'TEPEZALA','',NULL,'2019-01-15 13:06:27',NULL),(125,1,NULL,'CALVILLO','',NULL,'2019-01-15 13:06:27',NULL),(126,1,NULL,'AGUASCALIENTES','',NULL,'2019-01-15 13:06:27',NULL),(127,1,NULL,'COSIO','',NULL,'2019-01-15 13:06:27',NULL),(128,1,NULL,'JESUS MARIA','',NULL,'2019-01-15 13:06:27',NULL),(129,1,NULL,'LLANO, EL','',NULL,'2019-01-15 13:06:27',NULL),(130,2,NULL,'NAZAS','',NULL,'2019-01-15 13:06:27',NULL),(131,2,NULL,'NOMBRE DE DIOS','',NULL,'2019-01-15 13:06:27',NULL),(132,2,NULL,'NUEVO IDEAL','',NULL,'2019-01-15 13:06:27',NULL),(133,2,NULL,'OCAMPO','',NULL,'2019-01-15 13:06:27',NULL),(134,2,NULL,'ORO, EL','',NULL,'2019-01-15 13:06:27',NULL),(135,2,NULL,'OTAEZ','',NULL,'2019-01-15 13:06:27',NULL),(136,2,NULL,'PANUCO DE CORONADO','',NULL,'2019-01-15 13:06:27',NULL),(137,2,NULL,'PE?ON BLANCO','',NULL,'2019-01-15 13:06:27',NULL),(138,2,NULL,'POANAS','',NULL,'2019-01-15 13:06:27',NULL),(139,2,NULL,'PUEBLO NUEVO','',NULL,'2019-01-15 13:06:27',NULL),(140,2,NULL,'RODEO','',NULL,'2019-01-15 13:06:27',NULL),(141,2,NULL,'SAN BERNARDO','',NULL,'2019-01-15 13:06:27',NULL),(142,2,NULL,'SAN DIMAS','',NULL,'2019-01-15 13:06:27',NULL),(143,2,NULL,'SAN JUAN DE GUADALUPE','',NULL,'2019-01-15 13:06:27',NULL),(144,2,NULL,'SAN JUAN DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(145,2,NULL,'SAN LUIS DEL CORDERO','',NULL,'2019-01-15 13:06:27',NULL),(146,2,NULL,'SAN PEDRO DEL GALLO','',NULL,'2019-01-15 13:06:27',NULL),(147,2,NULL,'SANTA CLARA','',NULL,'2019-01-15 13:06:27',NULL),(148,2,NULL,'SANTIAGO PAPASQUIARO','',NULL,'2019-01-15 13:06:27',NULL),(149,2,NULL,'SUCHIL','',NULL,'2019-01-15 13:06:27',NULL),(150,2,NULL,'TAMAZULA','',NULL,'2019-01-15 13:06:27',NULL),(151,2,NULL,'TEPEHUANES','',NULL,'2019-01-15 13:06:27',NULL),(152,2,NULL,'TLAHUALILO','',NULL,'2019-01-15 13:06:27',NULL),(153,2,NULL,'TOPIA','',NULL,'2019-01-15 13:06:27',NULL),(154,2,NULL,'VICENTE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(155,2,NULL,'CANATLAN','',NULL,'2019-01-15 13:06:27',NULL),(156,2,NULL,'CANELAS','',NULL,'2019-01-15 13:06:27',NULL),(157,2,NULL,'CONETO DE COMONFORT','',NULL,'2019-01-15 13:06:27',NULL),(158,2,NULL,'CUENCAME','',NULL,'2019-01-15 13:06:27',NULL),(159,2,NULL,'DURANGO','',NULL,'2019-01-15 13:06:27',NULL),(160,2,NULL,'GENERAL SIMON BOLIVAR','',NULL,'2019-01-15 13:06:27',NULL),(161,2,NULL,'GOMEZ PALACIO','',NULL,'2019-01-15 13:06:27',NULL),(162,2,NULL,'GUADALUPE VICTORIA','',NULL,'2019-01-15 13:06:27',NULL),(163,2,NULL,'GUANACEVI','',NULL,'2019-01-15 13:06:27',NULL),(164,2,NULL,'HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(165,2,NULL,'INDE','',NULL,'2019-01-15 13:06:27',NULL),(166,2,NULL,'LERDO','',NULL,'2019-01-15 13:06:27',NULL),(167,2,NULL,'MAPIMI','',NULL,'2019-01-15 13:06:27',NULL),(168,2,NULL,'MEZQUITAL','',NULL,'2019-01-15 13:06:27',NULL),(169,3,NULL,'MOROLEON','',NULL,'2019-01-15 13:06:27',NULL),(170,3,NULL,'OCAMPO','',NULL,'2019-01-15 13:06:27',NULL),(171,3,NULL,'ACAMBARO','',NULL,'2019-01-15 13:06:27',NULL),(172,3,NULL,'APASEO EL ALTO','',NULL,'2019-01-15 13:06:27',NULL),(173,3,NULL,'PENJAMO','',NULL,'2019-01-15 13:06:27',NULL),(174,3,NULL,'APASEO EL GRANDE','',NULL,'2019-01-15 13:06:27',NULL),(175,3,NULL,'PUEBLO NUEVO','',NULL,'2019-01-15 13:06:27',NULL),(176,3,NULL,'PURISIMA DEL RINCON','',NULL,'2019-01-15 13:06:27',NULL),(177,3,NULL,'ROMITA','',NULL,'2019-01-15 13:06:27',NULL),(178,3,NULL,'SALAMANCA','',NULL,'2019-01-15 13:06:27',NULL),(179,3,NULL,'SALVATIERRA','',NULL,'2019-01-15 13:06:27',NULL),(180,3,NULL,'SAN DIEGO DE LA UNION','',NULL,'2019-01-15 13:06:27',NULL),(181,3,NULL,'SAN FELIPE','',NULL,'2019-01-15 13:06:27',NULL),(182,3,NULL,'SAN FRANCISCO DEL RINCON','',NULL,'2019-01-15 13:06:27',NULL),(183,3,NULL,'SAN JOSE ITURBIDE','',NULL,'2019-01-15 13:06:27',NULL),(184,3,NULL,'SAN LUIS DE LA PAZ','',NULL,'2019-01-15 13:06:27',NULL),(185,3,NULL,'ATARJEA','',NULL,'2019-01-15 13:06:27',NULL),(186,3,NULL,'SANTA CATARINA','',NULL,'2019-01-15 13:06:27',NULL),(187,3,NULL,'SANTA CRUZ DE JUVENTINO ROSAS','',NULL,'2019-01-15 13:06:27',NULL),(188,3,NULL,'SANTIAGO MARAVATIO','',NULL,'2019-01-15 13:06:27',NULL),(189,3,NULL,'SILAO','',NULL,'2019-01-15 13:06:27',NULL),(190,3,NULL,'TARANDACUAO','',NULL,'2019-01-15 13:06:27',NULL),(191,3,NULL,'TARIMORO','',NULL,'2019-01-15 13:06:27',NULL),(192,3,NULL,'TIERRA BLANCA','',NULL,'2019-01-15 13:06:27',NULL),(193,3,NULL,'URIANGATO','',NULL,'2019-01-15 13:06:27',NULL),(194,3,NULL,'VALLE DE SANTIAGO','',NULL,'2019-01-15 13:06:27',NULL),(195,3,NULL,'VICTORIA','',NULL,'2019-01-15 13:06:27',NULL),(196,3,NULL,'VILLAGRAN','',NULL,'2019-01-15 13:06:27',NULL),(197,3,NULL,'XICHU','',NULL,'2019-01-15 13:06:27',NULL),(198,3,NULL,'YURIRIA','',NULL,'2019-01-15 13:06:27',NULL),(199,3,NULL,'CELAYA','',NULL,'2019-01-15 13:06:27',NULL),(200,3,NULL,'ABASOLO','',NULL,'2019-01-15 13:06:27',NULL),(201,3,NULL,'COMONFORT','',NULL,'2019-01-15 13:06:27',NULL),(202,3,NULL,'CORONEO','',NULL,'2019-01-15 13:06:27',NULL),(203,3,NULL,'CORTAZAR','',NULL,'2019-01-15 13:06:27',NULL),(204,3,NULL,'CUERAMARO','',NULL,'2019-01-15 13:06:27',NULL),(205,3,NULL,'DOCTOR MORA','',NULL,'2019-01-15 13:06:27',NULL),(206,3,NULL,'DOLORES HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(207,3,NULL,'GUANAJUATO','',NULL,'2019-01-15 13:06:27',NULL),(208,3,NULL,'HUANIMARO','',NULL,'2019-01-15 13:06:27',NULL),(209,3,NULL,'ALLENDE','',NULL,'2019-01-15 13:06:27',NULL),(210,3,NULL,'IRAPUATO','',NULL,'2019-01-15 13:06:27',NULL),(211,3,NULL,'JARAL DEL PROGRESO','',NULL,'2019-01-15 13:06:27',NULL),(212,3,NULL,'JERECUARO','',NULL,'2019-01-15 13:06:27',NULL),(213,3,NULL,'LEON','',NULL,'2019-01-15 13:06:27',NULL),(214,3,NULL,'MANUEL DOBLADO','',NULL,'2019-01-15 13:06:27',NULL),(215,4,NULL,'MOCHITLAN','',NULL,'2019-01-15 13:06:27',NULL),(216,4,NULL,'OLINALA','',NULL,'2019-01-15 13:06:27',NULL),(217,4,NULL,'OMETEPEC','',NULL,'2019-01-15 13:06:27',NULL),(218,4,NULL,'PEDRO ASCENCIO ALQUISIRAS','',NULL,'2019-01-15 13:06:27',NULL),(219,4,NULL,'PETATLAN','',NULL,'2019-01-15 13:06:27',NULL),(220,4,NULL,'PILCAYA','',NULL,'2019-01-15 13:06:27',NULL),(221,4,NULL,'APAXTLA','',NULL,'2019-01-15 13:06:27',NULL),(222,4,NULL,'PUNGARABATO','',NULL,'2019-01-15 13:06:27',NULL),(223,4,NULL,'QUECHULTENANGO','',NULL,'2019-01-15 13:06:27',NULL),(224,4,NULL,'ARCELIA','',NULL,'2019-01-15 13:06:27',NULL),(225,4,NULL,'SAN LUIS ACATLAN','',NULL,'2019-01-15 13:06:27',NULL),(226,4,NULL,'SAN MARCOS','',NULL,'2019-01-15 13:06:27',NULL),(227,4,NULL,'SAN MIGUEL TOTOLAPAN','',NULL,'2019-01-15 13:06:27',NULL),(228,4,NULL,'ACAPULCO DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(229,4,NULL,'ATENANGO DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(230,4,NULL,'ATLAMAJALCINGO DEL MONTE','',NULL,'2019-01-15 13:06:27',NULL),(231,4,NULL,'ATLIXTAC','',NULL,'2019-01-15 13:06:27',NULL),(232,4,NULL,'ACATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(233,4,NULL,'ATOYAC DE ALVAREZ','',NULL,'2019-01-15 13:06:27',NULL),(234,4,NULL,'TAXCO DE ALARCON','',NULL,'2019-01-15 13:06:27',NULL),(235,4,NULL,'TECOANAPA','',NULL,'2019-01-15 13:06:27',NULL),(236,4,NULL,'TECPAN DE GALEANA','',NULL,'2019-01-15 13:06:27',NULL),(237,4,NULL,'TELOLOAPAN','',NULL,'2019-01-15 13:06:27',NULL),(238,4,NULL,'AYUTLA DE LOS LIBRES','',NULL,'2019-01-15 13:06:27',NULL),(239,4,NULL,'TEPECOACUILCO DE TRUJANO','',NULL,'2019-01-15 13:06:27',NULL),(240,4,NULL,'AZOYU','',NULL,'2019-01-15 13:06:27',NULL),(241,4,NULL,'TETIPAC','',NULL,'2019-01-15 13:06:27',NULL),(242,4,NULL,'TIXTLA DE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(243,4,NULL,'TLACOACHISTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(244,4,NULL,'TLACOAPA','',NULL,'2019-01-15 13:06:27',NULL),(245,4,NULL,'TLALCHAPA','',NULL,'2019-01-15 13:06:27',NULL),(246,4,NULL,'TLALIXTAQUILLA DE MALDONADO','',NULL,'2019-01-15 13:06:27',NULL),(247,4,NULL,'TLAPA DE COMONFORT','',NULL,'2019-01-15 13:06:27',NULL),(248,4,NULL,'TLAPEHUALA','',NULL,'2019-01-15 13:06:27',NULL),(249,4,NULL,'UNION DE ISIDORO MONTES DE OCA, LA','',NULL,'2019-01-15 13:06:27',NULL),(250,4,NULL,'BENITO JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(251,4,NULL,'XALPATLAHUAC','',NULL,'2019-01-15 13:06:27',NULL),(252,4,NULL,'XOCHIHUEHUETLAN','',NULL,'2019-01-15 13:06:27',NULL),(253,4,NULL,'XOCHISTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(254,4,NULL,'ZAPOTITLAN TABLAS','',NULL,'2019-01-15 13:06:27',NULL),(255,4,NULL,'ZIRANDARO','',NULL,'2019-01-15 13:06:27',NULL),(256,4,NULL,'ZITLALA','',NULL,'2019-01-15 13:06:27',NULL),(257,4,NULL,'BUENAVISTA DE CUELLAR','',NULL,'2019-01-15 13:06:27',NULL),(258,4,NULL,'CHILAPA DE ALVAREZ','',NULL,'2019-01-15 13:06:27',NULL),(259,4,NULL,'CHILPANCINGO DE LOS BRAVO','',NULL,'2019-01-15 13:06:27',NULL),(260,4,NULL,'COAHUAYUTLA DE JOSE MARIA IZAZAGA','',NULL,'2019-01-15 13:06:27',NULL),(261,4,NULL,'COCULA','',NULL,'2019-01-15 13:06:27',NULL),(262,4,NULL,'COPALA','',NULL,'2019-01-15 13:06:27',NULL),(263,4,NULL,'COPALILLO','',NULL,'2019-01-15 13:06:27',NULL),(264,4,NULL,'COPANATOYAC','',NULL,'2019-01-15 13:06:27',NULL),(265,4,NULL,'AHUACUOTZINGO','',NULL,'2019-01-15 13:06:27',NULL),(266,4,NULL,'COYUCA DE BENITEZ','',NULL,'2019-01-15 13:06:27',NULL),(267,4,NULL,'COYUCA DE CATALAN','',NULL,'2019-01-15 13:06:27',NULL),(268,4,NULL,'CUAJINICUILAPA','',NULL,'2019-01-15 13:06:27',NULL),(269,4,NULL,'CUALAC','',NULL,'2019-01-15 13:06:27',NULL),(270,4,NULL,'CUAUTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(271,4,NULL,'CUETZALA DEL PROGRESO','',NULL,'2019-01-15 13:06:27',NULL),(272,4,NULL,'CUTZAMALA DE PINZON','',NULL,'2019-01-15 13:06:27',NULL),(273,4,NULL,'EDUARDO NERI','',NULL,'2019-01-15 13:06:27',NULL),(274,4,NULL,'AJUCHITLAN DEL PROGRESO','',NULL,'2019-01-15 13:06:27',NULL),(275,4,NULL,'FLORENCIO VILLARREAL','',NULL,'2019-01-15 13:06:27',NULL),(276,4,NULL,'GENERAL CANUTO A. NERI','',NULL,'2019-01-15 13:06:27',NULL),(277,4,NULL,'GENERAL HELIODORO CASTILLO','',NULL,'2019-01-15 13:06:27',NULL),(278,4,NULL,'ALCOZAUCA DE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(279,4,NULL,'HUAMUXTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(280,4,NULL,'HUITZUCO DE LOS FIGUEROA','',NULL,'2019-01-15 13:06:27',NULL),(281,4,NULL,'IGUALA DE LA INDEPENDENCIA','',NULL,'2019-01-15 13:06:27',NULL),(282,4,NULL,'IGUALAPA','',NULL,'2019-01-15 13:06:27',NULL),(283,4,NULL,'IXCATEOPAN DE CUAUHTEMOC','',NULL,'2019-01-15 13:06:27',NULL),(284,4,NULL,'ALPOYECA','',NULL,'2019-01-15 13:06:27',NULL),(285,4,NULL,'JOSE AZUETA','',NULL,'2019-01-15 13:06:27',NULL),(286,4,NULL,'JUAN R. ESCUDERO','',NULL,'2019-01-15 13:06:27',NULL),(287,4,NULL,'LEONARDO BRAVO','',NULL,'2019-01-15 13:06:27',NULL),(288,4,NULL,'MALINALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(289,4,NULL,'MARTIR DE CUILAPAN','',NULL,'2019-01-15 13:06:27',NULL),(290,4,NULL,'METLATONOC','',NULL,'2019-01-15 13:06:27',NULL),(291,4,NULL,'Marquelia','',NULL,'2019-01-15 13:06:27',NULL),(292,5,NULL,'MISION, LA','',NULL,'2019-01-15 13:06:27',NULL),(293,5,NULL,'MIXQUIAHUALA DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(294,5,NULL,'MOLANGO DE ESCAMILLA','',NULL,'2019-01-15 13:06:27',NULL),(295,5,NULL,'NICOLAS FLORES','',NULL,'2019-01-15 13:06:27',NULL),(296,5,NULL,'NOPALA DE VILLAGRAN','',NULL,'2019-01-15 13:06:27',NULL),(297,5,NULL,'OMITLAN DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(298,5,NULL,'PACHUCA DE SOTO','',NULL,'2019-01-15 13:06:27',NULL),(299,5,NULL,'PACULA','',NULL,'2019-01-15 13:06:27',NULL),(300,5,NULL,'APAN','',NULL,'2019-01-15 13:06:27',NULL),(301,5,NULL,'PISAFLORES','',NULL,'2019-01-15 13:06:27',NULL),(302,5,NULL,'PROGRESO DE OBREGON','',NULL,'2019-01-15 13:06:27',NULL),(303,5,NULL,'SAN AGUSTIN METZQUITITLAN','',NULL,'2019-01-15 13:06:27',NULL),(304,5,NULL,'SAN AGUSTIN TLAXIACA','',NULL,'2019-01-15 13:06:27',NULL),(305,5,NULL,'SAN BARTOLO TUTOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(306,5,NULL,'SAN FELIPE ORIZATLAN','',NULL,'2019-01-15 13:06:27',NULL),(307,5,NULL,'ARENAL, EL','',NULL,'2019-01-15 13:06:27',NULL),(308,5,NULL,'SAN SALVADOR','',NULL,'2019-01-15 13:06:27',NULL),(309,5,NULL,'ATITALAQUIA','',NULL,'2019-01-15 13:06:27',NULL),(310,5,NULL,'ATLAPEXCO','',NULL,'2019-01-15 13:06:27',NULL),(311,5,NULL,'ATOTONILCO DE TULA','',NULL,'2019-01-15 13:06:27',NULL),(312,5,NULL,'SANTIAGO DE ANAYA','',NULL,'2019-01-15 13:06:27',NULL),(313,5,NULL,'ATOTONILCO EL GRANDE','',NULL,'2019-01-15 13:06:27',NULL),(314,5,NULL,'SANTIAGO TULANTEPEC DE LUGO GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(315,5,NULL,'SINGUILUCAN','',NULL,'2019-01-15 13:06:27',NULL),(316,5,NULL,'TASQUILLO','',NULL,'2019-01-15 13:06:27',NULL),(317,5,NULL,'TECOZAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(318,5,NULL,'TENANGO DE DORIA','',NULL,'2019-01-15 13:06:27',NULL),(319,5,NULL,'TEPEAPULCO','',NULL,'2019-01-15 13:06:27',NULL),(320,5,NULL,'TEPEHUACAN DE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(321,5,NULL,'TEPEJI DEL RIO DE OCAMPO','',NULL,'2019-01-15 13:06:27',NULL),(322,5,NULL,'TEPETITLAN','',NULL,'2019-01-15 13:06:27',NULL),(323,5,NULL,'TETEPANGO','',NULL,'2019-01-15 13:06:27',NULL),(324,5,NULL,'ACATLAN','',NULL,'2019-01-15 13:06:27',NULL),(325,5,NULL,'TEZONTEPEC DE ALDAMA','',NULL,'2019-01-15 13:06:27',NULL),(326,5,NULL,'TIANGUISTENGO','',NULL,'2019-01-15 13:06:27',NULL),(327,5,NULL,'TIZAYUCA','',NULL,'2019-01-15 13:06:27',NULL),(328,5,NULL,'TLAHUELILPAN','',NULL,'2019-01-15 13:06:27',NULL),(329,5,NULL,'TLAHUILTEPA','',NULL,'2019-01-15 13:06:27',NULL),(330,5,NULL,'TLANALAPA','',NULL,'2019-01-15 13:06:27',NULL),(331,5,NULL,'TLANCHINOL','',NULL,'2019-01-15 13:06:27',NULL),(332,5,NULL,'TLAXCOAPAN','',NULL,'2019-01-15 13:06:27',NULL),(333,5,NULL,'TOLCAYUCA','',NULL,'2019-01-15 13:06:27',NULL),(334,5,NULL,'TULA DE ALLENDE','',NULL,'2019-01-15 13:06:27',NULL),(335,5,NULL,'TULANCINGO DE BRAVO','',NULL,'2019-01-15 13:06:27',NULL),(336,5,NULL,'VILLA DE TEZONTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(337,5,NULL,'XOCHIATIPAN','',NULL,'2019-01-15 13:06:27',NULL),(338,5,NULL,'XOCHICOATLAN','',NULL,'2019-01-15 13:06:27',NULL),(339,5,NULL,'YAHUALICA','',NULL,'2019-01-15 13:06:27',NULL),(340,5,NULL,'ZACUALTIPAN DE ANGELES','',NULL,'2019-01-15 13:06:27',NULL),(341,5,NULL,'ZAPOTLAN DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(342,5,NULL,'ZEMPOALA','',NULL,'2019-01-15 13:06:27',NULL),(343,5,NULL,'ZIMAPAN','',NULL,'2019-01-15 13:06:27',NULL),(344,5,NULL,'ACAXOCHITLAN','',NULL,'2019-01-15 13:06:27',NULL),(345,5,NULL,'CALNALI','',NULL,'2019-01-15 13:06:27',NULL),(346,5,NULL,'CARDONAL','',NULL,'2019-01-15 13:06:27',NULL),(347,5,NULL,'ACTOPAN','',NULL,'2019-01-15 13:06:27',NULL),(348,5,NULL,'CHAPANTONGO','',NULL,'2019-01-15 13:06:27',NULL),(349,5,NULL,'CHAPULHUACAN','',NULL,'2019-01-15 13:06:27',NULL),(350,5,NULL,'CHILCUAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(351,5,NULL,'AGUA BLANCA DE ITURBIDE','',NULL,'2019-01-15 13:06:27',NULL),(352,5,NULL,'CUAUTEPEC DE HINOJOSA','',NULL,'2019-01-15 13:06:27',NULL),(353,5,NULL,'AJACUBA','',NULL,'2019-01-15 13:06:27',NULL),(354,5,NULL,'ELOXOCHITLAN','',NULL,'2019-01-15 13:06:27',NULL),(355,5,NULL,'EMILIANO ZAPATA','',NULL,'2019-01-15 13:06:27',NULL),(356,5,NULL,'EPAZOYUCAN','',NULL,'2019-01-15 13:06:27',NULL),(357,5,NULL,'FRANCISCO I. MADERO','',NULL,'2019-01-15 13:06:27',NULL),(358,5,NULL,'ALFAJAYUCAN','',NULL,'2019-01-15 13:06:27',NULL),(359,5,NULL,'HUASCA DE OCAMPO','',NULL,'2019-01-15 13:06:27',NULL),(360,5,NULL,'HUAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(361,5,NULL,'HUAZALINGO','',NULL,'2019-01-15 13:06:27',NULL),(362,5,NULL,'HUEHUETLA','',NULL,'2019-01-15 13:06:27',NULL),(363,5,NULL,'HUEJUTLA DE REYES','',NULL,'2019-01-15 13:06:27',NULL),(364,5,NULL,'ALMOLOYA','',NULL,'2019-01-15 13:06:27',NULL),(365,5,NULL,'HUICHAPAN','',NULL,'2019-01-15 13:06:27',NULL),(366,5,NULL,'IXMIQUILPAN','',NULL,'2019-01-15 13:06:27',NULL),(367,5,NULL,'JACALA DE LEDEZMA','',NULL,'2019-01-15 13:06:27',NULL),(368,5,NULL,'JALTOCAN','',NULL,'2019-01-15 13:06:27',NULL),(369,5,NULL,'JUAREZ HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(370,5,NULL,'LOLOTLA','',NULL,'2019-01-15 13:06:27',NULL),(371,5,NULL,'METEPEC','',NULL,'2019-01-15 13:06:27',NULL),(372,5,NULL,'METZTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(373,5,NULL,'MINERAL DE LA REFORMA','',NULL,'2019-01-15 13:06:27',NULL),(374,5,NULL,'MINERAL DEL CHICO','',NULL,'2019-01-15 13:06:27',NULL),(375,5,NULL,'MINERAL DEL MONTE','',NULL,'2019-01-15 13:06:27',NULL),(376,6,NULL,'MIXTLAN','',NULL,'2019-01-15 13:06:27',NULL),(377,6,NULL,'AMECA','',NULL,'2019-01-15 13:06:27',NULL),(378,6,NULL,'OCOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(379,6,NULL,'OJUELOS DE JALISCO','',NULL,'2019-01-15 13:06:27',NULL),(380,6,NULL,'ANTONIO ESCOBEDO','',NULL,'2019-01-15 13:06:27',NULL),(381,6,NULL,'PIHUAMO','',NULL,'2019-01-15 13:06:27',NULL),(382,6,NULL,'PONCITLAN','',NULL,'2019-01-15 13:06:27',NULL),(383,6,NULL,'PUERTO VALLARTA','',NULL,'2019-01-15 13:06:27',NULL),(384,6,NULL,'QUITUPAN','',NULL,'2019-01-15 13:06:27',NULL),(385,6,NULL,'SALTO, EL','',NULL,'2019-01-15 13:06:27',NULL),(386,6,NULL,'ARANDAS','',NULL,'2019-01-15 13:06:27',NULL),(387,6,NULL,'SAN CRISTOBAL DE LA BARRANCA','',NULL,'2019-01-15 13:06:27',NULL),(388,6,NULL,'SAN DIEGO DE ALEJANDRIA','',NULL,'2019-01-15 13:06:27',NULL),(389,6,NULL,'ARENAL','',NULL,'2019-01-15 13:06:27',NULL),(390,6,NULL,'SAN GABRIEL','',NULL,'2019-01-15 13:06:27',NULL),(391,6,NULL,'SAN JUAN DE LOS LAGOS','',NULL,'2019-01-15 13:06:27',NULL),(392,6,NULL,'SAN JULIAN','',NULL,'2019-01-15 13:06:27',NULL),(393,6,NULL,'SAN MARCOS','',NULL,'2019-01-15 13:06:27',NULL),(394,6,NULL,'SAN MARTIN DE BOLA?OS','',NULL,'2019-01-15 13:06:27',NULL),(395,6,NULL,'SAN MARTIN HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(396,6,NULL,'SAN MIGUEL EL ALTO','',NULL,'2019-01-15 13:06:27',NULL),(397,6,NULL,'ATEMAJAC DE BRIZUELA','',NULL,'2019-01-15 13:06:27',NULL),(398,6,NULL,'ATENGO','',NULL,'2019-01-15 13:06:27',NULL),(399,6,NULL,'ATENGUILLO','',NULL,'2019-01-15 13:06:27',NULL),(400,6,NULL,'SAN SEBASTIAN DEL OESTE','',NULL,'2019-01-15 13:06:27',NULL),(401,6,NULL,'SANTA MARIA DE LOS ANGELES','',NULL,'2019-01-15 13:06:27',NULL),(402,6,NULL,'ATOTONILCO EL ALTO','',NULL,'2019-01-15 13:06:27',NULL),(403,6,NULL,'ATOYAC','',NULL,'2019-01-15 13:06:27',NULL),(404,6,NULL,'SAYULA','',NULL,'2019-01-15 13:06:27',NULL),(405,6,NULL,'ACATIC','',NULL,'2019-01-15 13:06:27',NULL),(406,6,NULL,'AUTLAN DE NAVARRO','',NULL,'2019-01-15 13:06:27',NULL),(407,6,NULL,'TALA','',NULL,'2019-01-15 13:06:27',NULL),(408,6,NULL,'TALPA DE ALLENDE','',NULL,'2019-01-15 13:06:27',NULL),(409,6,NULL,'TAMAZULA DE GORDIANO','',NULL,'2019-01-15 13:06:27',NULL),(410,6,NULL,'TAPALPA','',NULL,'2019-01-15 13:06:27',NULL),(411,6,NULL,'TECALITLAN','',NULL,'2019-01-15 13:06:27',NULL),(412,6,NULL,'TECHALUTA DE MONTENEGRO','',NULL,'2019-01-15 13:06:27',NULL),(413,6,NULL,'TECOLOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(414,6,NULL,'AYOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(415,6,NULL,'TENAMAXTLAN','',NULL,'2019-01-15 13:06:27',NULL),(416,6,NULL,'TEOCALTICHE','',NULL,'2019-01-15 13:06:27',NULL),(417,6,NULL,'TEOCUITATLAN DE CORONA','',NULL,'2019-01-15 13:06:27',NULL),(418,6,NULL,'AYUTLA','',NULL,'2019-01-15 13:06:27',NULL),(419,6,NULL,'TEPATITLAN DE MORELOS','',NULL,'2019-01-15 13:06:27',NULL),(420,6,NULL,'TEQUILA','',NULL,'2019-01-15 13:06:27',NULL),(421,6,NULL,'TEUCHITLAN','',NULL,'2019-01-15 13:06:27',NULL),(422,6,NULL,'TIZAPAN EL ALTO','',NULL,'2019-01-15 13:06:27',NULL),(423,6,NULL,'TLAJOMULCO DE ZU?IGA','',NULL,'2019-01-15 13:06:27',NULL),(424,6,NULL,'TLAQUEPAQUE','',NULL,'2019-01-15 13:06:27',NULL),(425,6,NULL,'TOLIMAN','',NULL,'2019-01-15 13:06:27',NULL),(426,6,NULL,'TOMATLAN','',NULL,'2019-01-15 13:06:27',NULL),(427,6,NULL,'TONALA','',NULL,'2019-01-15 13:06:27',NULL),(428,6,NULL,'TONAYA','',NULL,'2019-01-15 13:06:27',NULL),(429,6,NULL,'TONILA','',NULL,'2019-01-15 13:06:27',NULL),(430,6,NULL,'TOTATICHE','',NULL,'2019-01-15 13:06:27',NULL),(431,6,NULL,'TOTOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(432,6,NULL,'BARCA, LA','',NULL,'2019-01-15 13:06:27',NULL),(433,6,NULL,'TUXCACUESCO','',NULL,'2019-01-15 13:06:27',NULL),(434,6,NULL,'TUXCUECA','',NULL,'2019-01-15 13:06:27',NULL),(435,6,NULL,'TUXPAN','',NULL,'2019-01-15 13:06:27',NULL),(436,6,NULL,'UNION DE SAN ANTONIO','',NULL,'2019-01-15 13:06:27',NULL),(437,6,NULL,'UNION DE TULA','',NULL,'2019-01-15 13:06:27',NULL),(438,6,NULL,'VALLE DE GUADALUPE','',NULL,'2019-01-15 13:06:27',NULL),(439,6,NULL,'VALLE DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(440,6,NULL,'VILLA CORONA','',NULL,'2019-01-15 13:06:27',NULL),(441,6,NULL,'ACATLAN DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(442,6,NULL,'VILLA GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(443,6,NULL,'VILLA HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(444,6,NULL,'VILLA PURIFICACION','',NULL,'2019-01-15 13:06:27',NULL),(445,6,NULL,'YAHUALICA DE GONZALEZ GALLO','',NULL,'2019-01-15 13:06:27',NULL),(446,6,NULL,'ZACOALCO DE TORRES','',NULL,'2019-01-15 13:06:27',NULL),(447,6,NULL,'ZAPOPAN','',NULL,'2019-01-15 13:06:27',NULL),(448,6,NULL,'ZAPOTILTIC','',NULL,'2019-01-15 13:06:27',NULL),(449,6,NULL,'ZAPOTITLAN DE VADILLO','',NULL,'2019-01-15 13:06:27',NULL),(450,6,NULL,'BOLA?OS','',NULL,'2019-01-15 13:06:27',NULL),(451,6,NULL,'ZAPOTLAN DEL REY','',NULL,'2019-01-15 13:06:27',NULL),(452,6,NULL,'ZAPOTLANEJO','',NULL,'2019-01-15 13:06:27',NULL),(453,6,NULL,'CA?ADAS DE OBREGON','',NULL,'2019-01-15 13:06:27',NULL),(454,6,NULL,'CABO CORRIENTES','',NULL,'2019-01-15 13:06:27',NULL),(455,6,NULL,'CASIMIRO CASTILLO','',NULL,'2019-01-15 13:06:27',NULL),(456,6,NULL,'CHAPALA','',NULL,'2019-01-15 13:06:27',NULL),(457,6,NULL,'CHIMALTITAN','',NULL,'2019-01-15 13:06:27',NULL),(458,6,NULL,'CHIQUILISTLAN','',NULL,'2019-01-15 13:06:27',NULL),(459,6,NULL,'CIHUATLAN','',NULL,'2019-01-15 13:06:27',NULL),(460,6,NULL,'CIUDAD GUZMAN','',NULL,'2019-01-15 13:06:27',NULL),(461,6,NULL,'COCULA','',NULL,'2019-01-15 13:06:27',NULL),(462,6,NULL,'COLOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(463,6,NULL,'CONCEPCION DE BUENOS AIRES','',NULL,'2019-01-15 13:06:27',NULL),(464,6,NULL,'AHUALULCO DE MERCADO','',NULL,'2019-01-15 13:06:27',NULL),(465,6,NULL,'CUAUTITLAN DE GARCIA BARRAGAN','',NULL,'2019-01-15 13:06:27',NULL),(466,6,NULL,'CUAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(467,6,NULL,'CUQUIO','',NULL,'2019-01-15 13:06:27',NULL),(468,6,NULL,'DEGOLLADO','',NULL,'2019-01-15 13:06:27',NULL),(469,6,NULL,'EJUTLA','',NULL,'2019-01-15 13:06:27',NULL),(470,6,NULL,'ENCARNACION DE DIAZ','',NULL,'2019-01-15 13:06:27',NULL),(471,6,NULL,'ETZATLAN','',NULL,'2019-01-15 13:06:27',NULL),(472,6,NULL,'GOMEZ FARIAS','',NULL,'2019-01-15 13:06:27',NULL),(473,6,NULL,'GRULLO, EL','',NULL,'2019-01-15 13:06:27',NULL),(474,6,NULL,'GUACHINANGO','',NULL,'2019-01-15 13:06:27',NULL),(475,6,NULL,'GUADALAJARA','',NULL,'2019-01-15 13:06:27',NULL),(476,6,NULL,'HOSTOTIPAQUILLO','',NULL,'2019-01-15 13:06:27',NULL),(477,6,NULL,'HUEJUCAR','',NULL,'2019-01-15 13:06:27',NULL),(478,6,NULL,'HUEJUQUILLA EL ALTO','',NULL,'2019-01-15 13:06:27',NULL),(479,6,NULL,'HUERTA, LA','',NULL,'2019-01-15 13:06:27',NULL),(480,6,NULL,'IXTLAHUACAN DE LOS MEMBRILLOS','',NULL,'2019-01-15 13:06:27',NULL),(481,6,NULL,'IXTLAHUACAN DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(482,6,NULL,'JALOSTOTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(483,6,NULL,'JAMAY','',NULL,'2019-01-15 13:06:27',NULL),(484,6,NULL,'JESUS MARIA','',NULL,'2019-01-15 13:06:27',NULL),(485,6,NULL,'JILOTLAN DE LOS DOLORES','',NULL,'2019-01-15 13:06:27',NULL),(486,6,NULL,'JOCOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(487,6,NULL,'JUANACATLAN','',NULL,'2019-01-15 13:06:27',NULL),(488,6,NULL,'JUCHITLAN','',NULL,'2019-01-15 13:06:27',NULL),(489,6,NULL,'LAGOS DE MORENO','',NULL,'2019-01-15 13:06:27',NULL),(490,6,NULL,'AMACUECA','',NULL,'2019-01-15 13:06:27',NULL),(491,6,NULL,'LIMON, EL','',NULL,'2019-01-15 13:06:27',NULL),(492,6,NULL,'MAGDALENA','',NULL,'2019-01-15 13:06:27',NULL),(493,6,NULL,'MANUEL M. DIEGUEZ','',NULL,'2019-01-15 13:06:27',NULL),(494,6,NULL,'MANZANILLA DE LA PAZ, LA','',NULL,'2019-01-15 13:06:27',NULL),(495,6,NULL,'MASCOTA','',NULL,'2019-01-15 13:06:27',NULL),(496,6,NULL,'AMATITAN','',NULL,'2019-01-15 13:06:27',NULL),(497,6,NULL,'MAZAMITLA','',NULL,'2019-01-15 13:06:27',NULL),(498,6,NULL,'MEXTICACAN','',NULL,'2019-01-15 13:06:27',NULL),(499,6,NULL,'MEZQUITIC','',NULL,'2019-01-15 13:06:27',NULL),(500,6,NULL,'Santa Maria Del Oro','',NULL,'2019-01-15 13:06:27',NULL),(501,6,NULL,'San Juanito de Escobedo','',NULL,'2019-01-15 13:06:27',NULL),(502,7,NULL,'MORELOS','',NULL,'2019-01-15 13:06:27',NULL),(503,7,NULL,'AMECAMECA','',NULL,'2019-01-15 13:06:27',NULL),(504,7,NULL,'NAUCALPAN DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(505,7,NULL,'NEXTLALPAN','',NULL,'2019-01-15 13:06:27',NULL),(506,7,NULL,'NEZAHUALCOYOTL','',NULL,'2019-01-15 13:06:27',NULL),(507,7,NULL,'NICOLAS ROMERO','',NULL,'2019-01-15 13:06:27',NULL),(508,7,NULL,'NOPALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(509,7,NULL,'OCOYOACAC','',NULL,'2019-01-15 13:06:27',NULL),(510,7,NULL,'OCUILAN','',NULL,'2019-01-15 13:06:27',NULL),(511,7,NULL,'ORO, EL','',NULL,'2019-01-15 13:06:27',NULL),(512,7,NULL,'OTUMBA','',NULL,'2019-01-15 13:06:27',NULL),(513,7,NULL,'OTZOLOAPAN','',NULL,'2019-01-15 13:06:27',NULL),(514,7,NULL,'OTZOLOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(515,7,NULL,'OZUMBA','',NULL,'2019-01-15 13:06:27',NULL),(516,7,NULL,'PAPALOTLA','',NULL,'2019-01-15 13:06:27',NULL),(517,7,NULL,'PAZ, LA','',NULL,'2019-01-15 13:06:27',NULL),(518,7,NULL,'ACAMBAY','',NULL,'2019-01-15 13:06:27',NULL),(519,7,NULL,'APAXCO','',NULL,'2019-01-15 13:06:27',NULL),(520,7,NULL,'POLOTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(521,7,NULL,'RAYON','',NULL,'2019-01-15 13:06:27',NULL),(522,7,NULL,'SAN ANTONIO LA ISLA','',NULL,'2019-01-15 13:06:27',NULL),(523,7,NULL,'SAN FELIPE DEL PROGRESO','',NULL,'2019-01-15 13:06:27',NULL),(524,7,NULL,'SAN MARTIN DE LAS PIRAMIDES','',NULL,'2019-01-15 13:06:27',NULL),(525,7,NULL,'SAN MATEO ATENCO','',NULL,'2019-01-15 13:06:27',NULL),(526,7,NULL,'ATENCO','',NULL,'2019-01-15 13:06:27',NULL),(527,7,NULL,'SAN SIMON DE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(528,7,NULL,'ATIZAPAN','',NULL,'2019-01-15 13:06:27',NULL),(529,7,NULL,'ATIZAPAN DE ZARAGOZA','',NULL,'2019-01-15 13:06:27',NULL),(530,7,NULL,'ATLACOMULCO','',NULL,'2019-01-15 13:06:27',NULL),(531,7,NULL,'ATLAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(532,7,NULL,'SANTO TOMAS','',NULL,'2019-01-15 13:06:27',NULL),(533,7,NULL,'SOYANIQUILPAN DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(534,7,NULL,'SULTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(535,7,NULL,'AXAPUSCO','',NULL,'2019-01-15 13:06:27',NULL),(536,7,NULL,'TECAMAC','',NULL,'2019-01-15 13:06:27',NULL),(537,7,NULL,'AYAPANGO','',NULL,'2019-01-15 13:06:27',NULL),(538,7,NULL,'TEJUPILCO','',NULL,'2019-01-15 13:06:27',NULL),(539,7,NULL,'TEMAMATLA','',NULL,'2019-01-15 13:06:27',NULL),(540,7,NULL,'TEMASCALAPA','',NULL,'2019-01-15 13:06:27',NULL),(541,7,NULL,'TEMASCALCINGO','',NULL,'2019-01-15 13:06:27',NULL),(542,7,NULL,'TEMASCALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(543,7,NULL,'TEMOAYA','',NULL,'2019-01-15 13:06:27',NULL),(544,7,NULL,'TENANCINGO','',NULL,'2019-01-15 13:06:27',NULL),(545,7,NULL,'TENANGO DEL AIRE','',NULL,'2019-01-15 13:06:27',NULL),(546,7,NULL,'TENANGO DEL VALLE','',NULL,'2019-01-15 13:06:27',NULL),(547,7,NULL,'TEOLOYUCAN','',NULL,'2019-01-15 13:06:27',NULL),(548,7,NULL,'TEOTIHUACAN','',NULL,'2019-01-15 13:06:27',NULL),(549,7,NULL,'TEPETLAOXTOC','',NULL,'2019-01-15 13:06:27',NULL),(550,7,NULL,'TEPETLIXPA','',NULL,'2019-01-15 13:06:27',NULL),(551,7,NULL,'TEPOTZOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(552,7,NULL,'TEQUIXQUIAC','',NULL,'2019-01-15 13:06:27',NULL),(553,7,NULL,'TEXCALTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(554,7,NULL,'TEXCALYACAC','',NULL,'2019-01-15 13:06:27',NULL),(555,7,NULL,'TEXCOCO','',NULL,'2019-01-15 13:06:27',NULL),(556,7,NULL,'TEZOYUCA','',NULL,'2019-01-15 13:06:27',NULL),(557,7,NULL,'TIANGUISTENCO','',NULL,'2019-01-15 13:06:27',NULL),(558,7,NULL,'TIMILPAN','',NULL,'2019-01-15 13:06:27',NULL),(559,7,NULL,'TLALMANALCO','',NULL,'2019-01-15 13:06:27',NULL),(560,7,NULL,'TLALNEPANTLA DE BAZ','',NULL,'2019-01-15 13:06:27',NULL),(561,7,NULL,'TLATLAYA','',NULL,'2019-01-15 13:06:27',NULL),(562,7,NULL,'TOLUCA','',NULL,'2019-01-15 13:06:27',NULL),(563,7,NULL,'TONATICO','',NULL,'2019-01-15 13:06:27',NULL),(564,7,NULL,'TULTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(565,7,NULL,'TULTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(566,7,NULL,'VALLE DE BRAVO','',NULL,'2019-01-15 13:06:27',NULL),(567,7,NULL,'VALLE DE CHALCO SOLIDARIDAD','',NULL,'2019-01-15 13:06:27',NULL),(568,7,NULL,'VILLA DE ALLENDE','',NULL,'2019-01-15 13:06:27',NULL),(569,7,NULL,'VILLA DEL CARBON','',NULL,'2019-01-15 13:06:27',NULL),(570,7,NULL,'VILLA GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(571,7,NULL,'VILLA VICTORIA','',NULL,'2019-01-15 13:06:27',NULL),(572,7,NULL,'XALATLACO','',NULL,'2019-01-15 13:06:27',NULL),(573,7,NULL,'XONACATLAN','',NULL,'2019-01-15 13:06:27',NULL),(574,7,NULL,'ZACAZONAPAN','',NULL,'2019-01-15 13:06:27',NULL),(575,7,NULL,'ZACUALPAN','',NULL,'2019-01-15 13:06:27',NULL),(576,7,NULL,'ZINACANTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(577,7,NULL,'ZUMPAHUACAN','',NULL,'2019-01-15 13:06:27',NULL),(578,7,NULL,'ZUMPANGO','',NULL,'2019-01-15 13:06:27',NULL),(579,7,NULL,'CALIMAYA','',NULL,'2019-01-15 13:06:27',NULL),(580,7,NULL,'ACOLMAN','',NULL,'2019-01-15 13:06:27',NULL),(581,7,NULL,'CAPULHUAC','',NULL,'2019-01-15 13:06:27',NULL),(582,7,NULL,'CHALCO','',NULL,'2019-01-15 13:06:27',NULL),(583,7,NULL,'CHAPA DE MOTA','',NULL,'2019-01-15 13:06:27',NULL),(584,7,NULL,'CHAPULTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(585,7,NULL,'CHIAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(586,7,NULL,'CHICOLOAPAN','',NULL,'2019-01-15 13:06:27',NULL),(587,7,NULL,'CHICONCUAC','',NULL,'2019-01-15 13:06:27',NULL),(588,7,NULL,'ACULCO','',NULL,'2019-01-15 13:06:27',NULL),(589,7,NULL,'CHIMALHUACAN','',NULL,'2019-01-15 13:06:27',NULL),(590,7,NULL,'COACALCO DE BERRIOZABAL','',NULL,'2019-01-15 13:06:27',NULL),(591,7,NULL,'COATEPEC HARINAS','',NULL,'2019-01-15 13:06:27',NULL),(592,7,NULL,'COCOTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(593,7,NULL,'COYOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(594,7,NULL,'CUAUTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(595,7,NULL,'CUAUTITLAN IZCALLI','',NULL,'2019-01-15 13:06:27',NULL),(596,7,NULL,'DONATO GUERRA','',NULL,'2019-01-15 13:06:27',NULL),(597,7,NULL,'ECATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(598,7,NULL,'ECATZINGO','',NULL,'2019-01-15 13:06:27',NULL),(599,7,NULL,'HUEHUETOCA','',NULL,'2019-01-15 13:06:27',NULL),(600,7,NULL,'HUEYPOXTLA','',NULL,'2019-01-15 13:06:27',NULL),(601,7,NULL,'ALMOLOYA DE ALQUISIRAS','',NULL,'2019-01-15 13:06:27',NULL),(602,7,NULL,'HUIXQUILUCAN','',NULL,'2019-01-15 13:06:27',NULL),(603,7,NULL,'ALMOLOYA DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(604,7,NULL,'ALMOLOYA DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(605,7,NULL,'ISIDRO FABELA','',NULL,'2019-01-15 13:06:27',NULL),(606,7,NULL,'IXTAPALUCA','',NULL,'2019-01-15 13:06:27',NULL),(607,7,NULL,'IXTAPAN DE LA SAL','',NULL,'2019-01-15 13:06:27',NULL),(608,7,NULL,'IXTAPAN DEL ORO','',NULL,'2019-01-15 13:06:27',NULL),(609,7,NULL,'IXTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(610,7,NULL,'JALTENCO','',NULL,'2019-01-15 13:06:27',NULL),(611,7,NULL,'JILOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(612,7,NULL,'JILOTZINGO','',NULL,'2019-01-15 13:06:27',NULL),(613,7,NULL,'JIQUIPILCO','',NULL,'2019-01-15 13:06:27',NULL),(614,7,NULL,'JOCOTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(615,7,NULL,'JOQUICINGO','',NULL,'2019-01-15 13:06:27',NULL),(616,7,NULL,'JUCHITEPEC','',NULL,'2019-01-15 13:06:27',NULL),(617,7,NULL,'LERMA','',NULL,'2019-01-15 13:06:27',NULL),(618,7,NULL,'AMANALCO','',NULL,'2019-01-15 13:06:27',NULL),(619,7,NULL,'MALINALCO','',NULL,'2019-01-15 13:06:27',NULL),(620,7,NULL,'AMATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(621,7,NULL,'MELCHOR OCAMPO','',NULL,'2019-01-15 13:06:27',NULL),(622,7,NULL,'METEPEC','',NULL,'2019-01-15 13:06:27',NULL),(623,7,NULL,'MEXICALTZINGO','',NULL,'2019-01-15 13:06:27',NULL),(624,7,NULL,'San Jose del rincon','',NULL,'2019-01-15 13:06:27',NULL),(625,8,NULL,'MORELIA','',NULL,'2019-01-15 13:06:27',NULL),(626,8,NULL,'MORELOS','',NULL,'2019-01-15 13:06:27',NULL),(627,8,NULL,'MUGICA','',NULL,'2019-01-15 13:06:27',NULL),(628,8,NULL,'NAHUATZEN','',NULL,'2019-01-15 13:06:27',NULL),(629,8,NULL,'ANGAMACUTIRO','',NULL,'2019-01-15 13:06:27',NULL),(630,8,NULL,'NOCUPETARO','',NULL,'2019-01-15 13:06:27',NULL),(631,8,NULL,'ANGANGUEO','',NULL,'2019-01-15 13:06:27',NULL),(632,8,NULL,'NUEVO PARANGARICUTIRO','',NULL,'2019-01-15 13:06:27',NULL),(633,8,NULL,'NUEVO URECHO','',NULL,'2019-01-15 13:06:27',NULL),(634,8,NULL,'NUMARAN','',NULL,'2019-01-15 13:06:27',NULL),(635,8,NULL,'OCAMPO','',NULL,'2019-01-15 13:06:27',NULL),(636,8,NULL,'PAJACUARAN','',NULL,'2019-01-15 13:06:27',NULL),(637,8,NULL,'PANINDICUARO','',NULL,'2019-01-15 13:06:27',NULL),(638,8,NULL,'PARACHO','',NULL,'2019-01-15 13:06:27',NULL),(639,8,NULL,'PARACUARO','',NULL,'2019-01-15 13:06:27',NULL),(640,8,NULL,'PATZCUARO','',NULL,'2019-01-15 13:06:27',NULL),(641,8,NULL,'PENJAMILLO','',NULL,'2019-01-15 13:06:27',NULL),(642,8,NULL,'PERIBAN','',NULL,'2019-01-15 13:06:27',NULL),(643,8,NULL,'PIEDAD, LA','',NULL,'2019-01-15 13:06:27',NULL),(644,8,NULL,'APATZINGAN','',NULL,'2019-01-15 13:06:27',NULL),(645,8,NULL,'PUREPERO','',NULL,'2019-01-15 13:06:27',NULL),(646,8,NULL,'PURUANDIRO','',NULL,'2019-01-15 13:06:27',NULL),(647,8,NULL,'QUERENDARO','',NULL,'2019-01-15 13:06:27',NULL),(648,8,NULL,'QUIROGA','',NULL,'2019-01-15 13:06:27',NULL),(649,8,NULL,'REYES, LOS','',NULL,'2019-01-15 13:06:27',NULL),(650,8,NULL,'APORO','',NULL,'2019-01-15 13:06:27',NULL),(651,8,NULL,'SAHUAYO','',NULL,'2019-01-15 13:06:27',NULL),(652,8,NULL,'SALVADOR ESCALANTE','',NULL,'2019-01-15 13:06:27',NULL),(653,8,NULL,'AQUILA','',NULL,'2019-01-15 13:06:27',NULL),(654,8,NULL,'ARIO','',NULL,'2019-01-15 13:06:27',NULL),(655,8,NULL,'ARTEAGA','',NULL,'2019-01-15 13:06:27',NULL),(656,8,NULL,'SAN LUCAS','',NULL,'2019-01-15 13:06:27',NULL),(657,8,NULL,'SANTA ANA MAYA','',NULL,'2019-01-15 13:06:27',NULL),(658,8,NULL,'SENGUIO','',NULL,'2019-01-15 13:06:27',NULL),(659,8,NULL,'SUSUPUATO','',NULL,'2019-01-15 13:06:27',NULL),(660,8,NULL,'TACAMBARO','',NULL,'2019-01-15 13:06:27',NULL),(661,8,NULL,'TANCITARO','',NULL,'2019-01-15 13:06:27',NULL),(662,8,NULL,'TANGAMANDAPIO','',NULL,'2019-01-15 13:06:27',NULL),(663,8,NULL,'TANGANCICUARO','',NULL,'2019-01-15 13:06:27',NULL),(664,8,NULL,'TANHUATO','',NULL,'2019-01-15 13:06:27',NULL),(665,8,NULL,'TARETAN','',NULL,'2019-01-15 13:06:27',NULL),(666,8,NULL,'TARIMBARO','',NULL,'2019-01-15 13:06:27',NULL),(667,8,NULL,'TEPALCATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(668,8,NULL,'TINGAMBATO','',NULL,'2019-01-15 13:06:27',NULL),(669,8,NULL,'TINGUINDIN','',NULL,'2019-01-15 13:06:27',NULL),(670,8,NULL,'TIQUICHEO DE NICOLAS ROMERO','',NULL,'2019-01-15 13:06:27',NULL),(671,8,NULL,'TLALPUJAHUA','',NULL,'2019-01-15 13:06:27',NULL),(672,8,NULL,'TLAZAZALCA','',NULL,'2019-01-15 13:06:27',NULL),(673,8,NULL,'TOCUMBO','',NULL,'2019-01-15 13:06:27',NULL),(674,8,NULL,'TUMBISCATIO','',NULL,'2019-01-15 13:06:27',NULL),(675,8,NULL,'TURICATO','',NULL,'2019-01-15 13:06:27',NULL),(676,8,NULL,'TUXPAN','',NULL,'2019-01-15 13:06:27',NULL),(677,8,NULL,'TUZANTLA','',NULL,'2019-01-15 13:06:27',NULL),(678,8,NULL,'TZINTZUNTZAN','',NULL,'2019-01-15 13:06:27',NULL),(679,8,NULL,'TZITZIO','',NULL,'2019-01-15 13:06:27',NULL),(680,8,NULL,'URUAPAN','',NULL,'2019-01-15 13:06:27',NULL),(681,8,NULL,'VENUSTIANO CARRANZA','',NULL,'2019-01-15 13:06:27',NULL),(682,8,NULL,'VILLAMAR','',NULL,'2019-01-15 13:06:27',NULL),(683,8,NULL,'VISTA HERMOSA','',NULL,'2019-01-15 13:06:27',NULL),(684,8,NULL,'YURECUARO','',NULL,'2019-01-15 13:06:27',NULL),(685,8,NULL,'ZACAPU','',NULL,'2019-01-15 13:06:27',NULL),(686,8,NULL,'ZAMORA','',NULL,'2019-01-15 13:06:27',NULL),(687,8,NULL,'ZINAPARO','',NULL,'2019-01-15 13:06:27',NULL),(688,8,NULL,'ZINAPECUARO','',NULL,'2019-01-15 13:06:27',NULL),(689,8,NULL,'ZIRACUARETIRO','',NULL,'2019-01-15 13:06:27',NULL),(690,8,NULL,'ZITACUARO','',NULL,'2019-01-15 13:06:27',NULL),(691,8,NULL,'BRISE?AS','',NULL,'2019-01-15 13:06:27',NULL),(692,8,NULL,'BUENAVISTA','',NULL,'2019-01-15 13:06:27',NULL),(693,8,NULL,'CARACUARO','',NULL,'2019-01-15 13:06:27',NULL),(694,8,NULL,'CHARAPAN','',NULL,'2019-01-15 13:06:27',NULL),(695,8,NULL,'ACUITZIO','',NULL,'2019-01-15 13:06:27',NULL),(696,8,NULL,'CHARO','',NULL,'2019-01-15 13:06:27',NULL),(697,8,NULL,'CHAVINDA','',NULL,'2019-01-15 13:06:27',NULL),(698,8,NULL,'CHERAN','',NULL,'2019-01-15 13:06:27',NULL),(699,8,NULL,'CHILCHOTA','',NULL,'2019-01-15 13:06:27',NULL),(700,8,NULL,'CHINICUILA','',NULL,'2019-01-15 13:06:27',NULL),(701,8,NULL,'CHUCANDIRO','',NULL,'2019-01-15 13:06:27',NULL),(702,8,NULL,'CHURINTZIO','',NULL,'2019-01-15 13:06:27',NULL),(703,8,NULL,'CHURUMUCO','',NULL,'2019-01-15 13:06:27',NULL),(704,8,NULL,'COAHUAYANA','',NULL,'2019-01-15 13:06:27',NULL),(705,8,NULL,'COALCOMAN DE VAZQUEZ PALLARES','',NULL,'2019-01-15 13:06:27',NULL),(706,8,NULL,'COENEO','',NULL,'2019-01-15 13:06:27',NULL),(707,8,NULL,'COJUMATLAN DE REGULES','',NULL,'2019-01-15 13:06:27',NULL),(708,8,NULL,'AGUILILLA','',NULL,'2019-01-15 13:06:27',NULL),(709,8,NULL,'CONTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(710,8,NULL,'COPANDARO','',NULL,'2019-01-15 13:06:27',NULL),(711,8,NULL,'COTIJA','',NULL,'2019-01-15 13:06:27',NULL),(712,8,NULL,'CUITZEO','',NULL,'2019-01-15 13:06:27',NULL),(713,8,NULL,'ECUANDUREO','',NULL,'2019-01-15 13:06:27',NULL),(714,8,NULL,'EPITACIO HUERTA','',NULL,'2019-01-15 13:06:27',NULL),(715,8,NULL,'ERONGARICUARO','',NULL,'2019-01-15 13:06:27',NULL),(716,8,NULL,'GABRIEL ZAMORA','',NULL,'2019-01-15 13:06:27',NULL),(717,8,NULL,'HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(718,8,NULL,'HUACANA, LA','',NULL,'2019-01-15 13:06:27',NULL),(719,8,NULL,'HUANDACAREO','',NULL,'2019-01-15 13:06:27',NULL),(720,8,NULL,'HUANIQUEO','',NULL,'2019-01-15 13:06:27',NULL),(721,8,NULL,'HUETAMO','',NULL,'2019-01-15 13:06:27',NULL),(722,8,NULL,'HUIRAMBA','',NULL,'2019-01-15 13:06:27',NULL),(723,8,NULL,'INDAPARAPEO','',NULL,'2019-01-15 13:06:27',NULL),(724,8,NULL,'IRIMBO','',NULL,'2019-01-15 13:06:27',NULL),(725,8,NULL,'IXTLAN','',NULL,'2019-01-15 13:06:27',NULL),(726,8,NULL,'JACONA','',NULL,'2019-01-15 13:06:27',NULL),(727,8,NULL,'JIMENEZ','',NULL,'2019-01-15 13:06:27',NULL),(728,8,NULL,'JIQUILPAN','',NULL,'2019-01-15 13:06:27',NULL),(729,8,NULL,'JOSE SIXTO VERDUZCO','',NULL,'2019-01-15 13:06:27',NULL),(730,8,NULL,'JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(731,8,NULL,'ALVARO OBREGON','',NULL,'2019-01-15 13:06:27',NULL),(732,8,NULL,'JUNGAPEO','',NULL,'2019-01-15 13:06:27',NULL),(733,8,NULL,'LAGUNILLAS','',NULL,'2019-01-15 13:06:27',NULL),(734,8,NULL,'LAZARO CARDENAS','',NULL,'2019-01-15 13:06:27',NULL),(735,8,NULL,'MADERO','',NULL,'2019-01-15 13:06:27',NULL),(736,8,NULL,'MARAVATIO','',NULL,'2019-01-15 13:06:27',NULL),(737,8,NULL,'MARCOS CASTELLANOS','',NULL,'2019-01-15 13:06:27',NULL),(738,9,NULL,'OCUITUCO','',NULL,'2019-01-15 13:06:27',NULL),(739,9,NULL,'PUENTE DE IXTLA','',NULL,'2019-01-15 13:06:27',NULL),(740,9,NULL,'ATLATLAHUCAN','',NULL,'2019-01-15 13:06:27',NULL),(741,9,NULL,'AXOCHIAPAN','',NULL,'2019-01-15 13:06:27',NULL),(742,9,NULL,'AYALA','',NULL,'2019-01-15 13:06:27',NULL),(743,9,NULL,'TEMIXCO','',NULL,'2019-01-15 13:06:27',NULL),(744,9,NULL,'TEMOAC','',NULL,'2019-01-15 13:06:27',NULL),(745,9,NULL,'TEPALCINGO','',NULL,'2019-01-15 13:06:27',NULL),(746,9,NULL,'TEPOZTLAN','',NULL,'2019-01-15 13:06:27',NULL),(747,9,NULL,'TETECALA','',NULL,'2019-01-15 13:06:27',NULL),(748,9,NULL,'TETELA DEL VOLCAN','',NULL,'2019-01-15 13:06:27',NULL),(749,9,NULL,'TLALNEPANTLA','',NULL,'2019-01-15 13:06:27',NULL),(750,9,NULL,'TLALTIZAPAN','',NULL,'2019-01-15 13:06:27',NULL),(751,9,NULL,'TLAQUILTENANGO','',NULL,'2019-01-15 13:06:27',NULL),(752,9,NULL,'TLAYACAPAN','',NULL,'2019-01-15 13:06:27',NULL),(753,9,NULL,'TOTOLAPAN','',NULL,'2019-01-15 13:06:27',NULL),(754,9,NULL,'XOCHITEPEC','',NULL,'2019-01-15 13:06:27',NULL),(755,9,NULL,'YAUTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(756,9,NULL,'YECAPIXTLA','',NULL,'2019-01-15 13:06:27',NULL),(757,9,NULL,'ZACATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(758,9,NULL,'ZACUALPAN','',NULL,'2019-01-15 13:06:27',NULL),(759,9,NULL,'COATLAN DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(760,9,NULL,'CUAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(761,9,NULL,'CUERNAVACA','',NULL,'2019-01-15 13:06:27',NULL),(762,9,NULL,'EMILIANO ZAPATA','',NULL,'2019-01-15 13:06:27',NULL),(763,9,NULL,'HUITZILAC','',NULL,'2019-01-15 13:06:27',NULL),(764,9,NULL,'JANTETELCO','',NULL,'2019-01-15 13:06:27',NULL),(765,9,NULL,'JIUTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(766,9,NULL,'JOJUTLA','',NULL,'2019-01-15 13:06:27',NULL),(767,9,NULL,'JONACATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(768,9,NULL,'AMACUZAC','',NULL,'2019-01-15 13:06:27',NULL),(769,9,NULL,'MAZATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(770,9,NULL,'MIACATLAN','',NULL,'2019-01-15 13:06:27',NULL),(771,10,NULL,'NAYAR, EL','',NULL,'2019-01-15 13:06:27',NULL),(772,10,NULL,'ROSAMORADA','',NULL,'2019-01-15 13:06:27',NULL),(773,10,NULL,'RUIZ','',NULL,'2019-01-15 13:06:27',NULL),(774,10,NULL,'SAN BLAS','',NULL,'2019-01-15 13:06:27',NULL),(775,10,NULL,'ACAPONETA','',NULL,'2019-01-15 13:06:27',NULL),(776,10,NULL,'SAN PEDRO LAGUNILLAS','',NULL,'2019-01-15 13:06:27',NULL),(777,10,NULL,'SANTA MARIA DEL ORO','',NULL,'2019-01-15 13:06:27',NULL),(778,10,NULL,'SANTIAGO IXCUINTLA','',NULL,'2019-01-15 13:06:27',NULL),(779,10,NULL,'TECUALA','',NULL,'2019-01-15 13:06:27',NULL),(780,10,NULL,'TEPIC','',NULL,'2019-01-15 13:06:27',NULL),(781,10,NULL,'BAHIA DE BANDERAS','',NULL,'2019-01-15 13:06:27',NULL),(782,10,NULL,'TUXPAN','',NULL,'2019-01-15 13:06:27',NULL),(783,10,NULL,'XALISCO','',NULL,'2019-01-15 13:06:27',NULL),(784,10,NULL,'YESCA, LA','',NULL,'2019-01-15 13:06:27',NULL),(785,10,NULL,'COMPOSTELA','',NULL,'2019-01-15 13:06:27',NULL),(786,10,NULL,'AHUACATLAN','',NULL,'2019-01-15 13:06:27',NULL),(787,10,NULL,'HUAJICORI','',NULL,'2019-01-15 13:06:27',NULL),(788,10,NULL,'IXTLAN DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(789,10,NULL,'JALA','',NULL,'2019-01-15 13:06:27',NULL),(790,10,NULL,'AMATLAN DE CA?AS','',NULL,'2019-01-15 13:06:27',NULL),(791,11,NULL,'MONTEMORELOS','',NULL,'2019-01-15 13:06:27',NULL),(792,11,NULL,'MONTERREY','',NULL,'2019-01-15 13:06:27',NULL),(793,11,NULL,'ANAHUAC','',NULL,'2019-01-15 13:06:27',NULL),(794,11,NULL,'PARAS','',NULL,'2019-01-15 13:06:27',NULL),(795,11,NULL,'PESQUERIA','',NULL,'2019-01-15 13:06:27',NULL),(796,11,NULL,'RAMONES, LOS','',NULL,'2019-01-15 13:06:27',NULL),(797,11,NULL,'RAYONES','',NULL,'2019-01-15 13:06:27',NULL),(798,11,NULL,'APODACA','',NULL,'2019-01-15 13:06:27',NULL),(799,11,NULL,'SABINAS HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(800,11,NULL,'SALINAS VICTORIA','',NULL,'2019-01-15 13:06:27',NULL),(801,11,NULL,'ARAMBERRI','',NULL,'2019-01-15 13:06:27',NULL),(802,11,NULL,'SAN NICOLAS DE LOS GARZA','',NULL,'2019-01-15 13:06:27',NULL),(803,11,NULL,'SAN PEDRO GARZA GARCIA','',NULL,'2019-01-15 13:06:27',NULL),(804,11,NULL,'SANTA CATARINA','',NULL,'2019-01-15 13:06:27',NULL),(805,11,NULL,'SANTIAGO','',NULL,'2019-01-15 13:06:27',NULL),(806,11,NULL,'VALLECILLO','',NULL,'2019-01-15 13:06:27',NULL),(807,11,NULL,'VILLALDAMA','',NULL,'2019-01-15 13:06:27',NULL),(808,11,NULL,'BUSTAMANTE','',NULL,'2019-01-15 13:06:27',NULL),(809,11,NULL,'CADEREYTA JIMENEZ','',NULL,'2019-01-15 13:06:27',NULL),(810,11,NULL,'CARMEN','',NULL,'2019-01-15 13:06:27',NULL),(811,11,NULL,'CERRALVO','',NULL,'2019-01-15 13:06:27',NULL),(812,11,NULL,'CHINA','',NULL,'2019-01-15 13:06:27',NULL),(813,11,NULL,'CIENEGA DE FLORES','',NULL,'2019-01-15 13:06:27',NULL),(814,11,NULL,'AGUALEGUAS','',NULL,'2019-01-15 13:06:27',NULL),(815,11,NULL,'ABASOLO','',NULL,'2019-01-15 13:06:27',NULL),(816,11,NULL,'DOCTOR ARROYO','',NULL,'2019-01-15 13:06:27',NULL),(817,11,NULL,'DOCTOR COSS','',NULL,'2019-01-15 13:06:27',NULL),(818,11,NULL,'DOCTOR GONZALEZ','',NULL,'2019-01-15 13:06:27',NULL),(819,11,NULL,'GALEANA','',NULL,'2019-01-15 13:06:27',NULL),(820,11,NULL,'GARCIA','',NULL,'2019-01-15 13:06:27',NULL),(821,11,NULL,'GENERAL BRAVO','',NULL,'2019-01-15 13:06:27',NULL),(822,11,NULL,'GENERAL ESCOBEDO','',NULL,'2019-01-15 13:06:27',NULL),(823,11,NULL,'GENERAL TERAN','',NULL,'2019-01-15 13:06:27',NULL),(824,11,NULL,'GENERAL TREVI?O','',NULL,'2019-01-15 13:06:27',NULL),(825,11,NULL,'GENERAL ZARAGOZA','',NULL,'2019-01-15 13:06:27',NULL),(826,11,NULL,'GENERAL ZUAZUA','',NULL,'2019-01-15 13:06:27',NULL),(827,11,NULL,'GUADALUPE','',NULL,'2019-01-15 13:06:27',NULL),(828,11,NULL,'ALDAMAS, LOS','',NULL,'2019-01-15 13:06:27',NULL),(829,11,NULL,'HERRERAS, LOS','',NULL,'2019-01-15 13:06:27',NULL),(830,11,NULL,'HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(831,11,NULL,'HIGUERAS','',NULL,'2019-01-15 13:06:27',NULL),(832,11,NULL,'HUALAHUISES','',NULL,'2019-01-15 13:06:27',NULL),(833,11,NULL,'ALLENDE','',NULL,'2019-01-15 13:06:27',NULL),(834,11,NULL,'ITURBIDE','',NULL,'2019-01-15 13:06:27',NULL),(835,11,NULL,'JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(836,11,NULL,'LAMPAZOS DE NARANJO','',NULL,'2019-01-15 13:06:27',NULL),(837,11,NULL,'LINARES','',NULL,'2019-01-15 13:06:27',NULL),(838,11,NULL,'MARIN','',NULL,'2019-01-15 13:06:27',NULL),(839,11,NULL,'MELCHOR OCAMPO','',NULL,'2019-01-15 13:06:27',NULL),(840,11,NULL,'MIER Y NORIEGA','',NULL,'2019-01-15 13:06:27',NULL),(841,11,NULL,'MINA','',NULL,'2019-01-15 13:06:27',NULL),(842,12,NULL,'PLAYAS DE ROSARITO','',NULL,'2019-01-15 13:06:27',NULL),(843,12,NULL,'TECATE','',NULL,'2019-01-15 13:06:27',NULL),(844,12,NULL,'TIJUANA','',NULL,'2019-01-15 13:06:27',NULL),(845,12,NULL,'ENSENADA','',NULL,'2019-01-15 13:06:27',NULL),(846,12,NULL,'MEXICALI','',NULL,'2019-01-15 13:06:27',NULL),(847,13,NULL,'MIXISTLAN DE LA REFORMA','',NULL,'2019-01-15 13:06:27',NULL),(848,13,NULL,'MONJAS','',NULL,'2019-01-15 13:06:27',NULL),(849,13,NULL,'NATIVIDAD','',NULL,'2019-01-15 13:06:27',NULL),(850,13,NULL,'NAZARENO ETLA','',NULL,'2019-01-15 13:06:27',NULL),(851,13,NULL,'NEJAPA DE MADERO','',NULL,'2019-01-15 13:06:27',NULL),(852,13,NULL,'NUEVO ZOQUIAPAM','',NULL,'2019-01-15 13:06:27',NULL),(853,13,NULL,'OAXACA DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(854,13,NULL,'OCOTLAN DE MORELOS','',NULL,'2019-01-15 13:06:27',NULL),(855,13,NULL,'ANIMAS TRUJANO','',NULL,'2019-01-15 13:06:27',NULL),(856,13,NULL,'PE, LA','',NULL,'2019-01-15 13:06:27',NULL),(857,13,NULL,'PINOTEPA DE DON LUIS','',NULL,'2019-01-15 13:06:27',NULL),(858,13,NULL,'PLUMA HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(859,13,NULL,'PUTLA VILLA DE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(860,13,NULL,'REFORMA DE PINEDA','',NULL,'2019-01-15 13:06:27',NULL),(861,13,NULL,'REFORMA, LA','',NULL,'2019-01-15 13:06:27',NULL),(862,13,NULL,'REYES ETLA','',NULL,'2019-01-15 13:06:27',NULL),(863,13,NULL,'ROJAS DE CUAUHTEMOC','',NULL,'2019-01-15 13:06:27',NULL),(864,13,NULL,'SALINA CRUZ','',NULL,'2019-01-15 13:06:27',NULL),(865,13,NULL,'SAN AGUSTIN AMATENGO','',NULL,'2019-01-15 13:06:27',NULL),(866,13,NULL,'SAN AGUSTIN ATENANGO','',NULL,'2019-01-15 13:06:27',NULL),(867,13,NULL,'SAN AGUSTIN CHAYUCO','',NULL,'2019-01-15 13:06:27',NULL),(868,13,NULL,'SAN AGUSTIN DE LAS JUNTAS','',NULL,'2019-01-15 13:06:27',NULL),(869,13,NULL,'SAN AGUSTIN ETLA','',NULL,'2019-01-15 13:06:27',NULL),(870,13,NULL,'SAN AGUSTIN LOXICHA','',NULL,'2019-01-15 13:06:27',NULL),(871,13,NULL,'SAN AGUSTIN TLACOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(872,13,NULL,'SAN AGUSTIN YATARENI','',NULL,'2019-01-15 13:06:27',NULL),(873,13,NULL,'SAN ANDRES CABECERA NUEVA','',NULL,'2019-01-15 13:06:27',NULL),(874,13,NULL,'SAN ANDRES DINICUITI','',NULL,'2019-01-15 13:06:27',NULL),(875,13,NULL,'SAN ANDRES HUAXPALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(876,13,NULL,'SAN ANDRES HUAYAPAM','',NULL,'2019-01-15 13:06:27',NULL),(877,13,NULL,'SAN ANDRES IXTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(878,13,NULL,'SAN ANDRES LAGUNAS','',NULL,'2019-01-15 13:06:27',NULL),(879,13,NULL,'SAN ANDRES NUXIÑO','',NULL,'2019-01-15 13:06:27',NULL),(880,13,NULL,'SAN ANDRES PAXTLAN','',NULL,'2019-01-15 13:06:27',NULL),(881,13,NULL,'SAN ANDRES SINAXTLA','',NULL,'2019-01-15 13:06:27',NULL),(882,13,NULL,'SAN ANDRES SOLAGA','',NULL,'2019-01-15 13:06:27',NULL),(883,13,NULL,'SAN ANDRES TEOTILALPAM','',NULL,'2019-01-15 13:06:27',NULL),(884,13,NULL,'SAN ANDRES TEPETLAPA','',NULL,'2019-01-15 13:06:27',NULL),(885,13,NULL,'SAN ANDRES YAA','',NULL,'2019-01-15 13:06:27',NULL),(886,13,NULL,'SAN ANDRES ZABACHE','',NULL,'2019-01-15 13:06:27',NULL),(887,13,NULL,'SAN ANDRES ZAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(888,13,NULL,'SAN ANTONINO CASTILLO VELASCO','',NULL,'2019-01-15 13:06:27',NULL),(889,13,NULL,'SAN ANTONINO EL ALTO','',NULL,'2019-01-15 13:06:27',NULL),(890,13,NULL,'SAN ANTONINO MONTE VERDE','',NULL,'2019-01-15 13:06:27',NULL),(891,13,NULL,'SAN ANTONIO ACUTLA','',NULL,'2019-01-15 13:06:27',NULL),(892,13,NULL,'SAN ANTONIO DE LA CAL','',NULL,'2019-01-15 13:06:27',NULL),(893,13,NULL,'SAN ANTONIO HUITEPEC','',NULL,'2019-01-15 13:06:27',NULL),(894,13,NULL,'SAN ANTONIO NANAHUATIPAM','',NULL,'2019-01-15 13:06:27',NULL),(895,13,NULL,'SAN ANTONIO SINICAHUA','',NULL,'2019-01-15 13:06:27',NULL),(896,13,NULL,'SAN ANTONIO TEPETLAPA','',NULL,'2019-01-15 13:06:27',NULL),(897,13,NULL,'SAN BALTAZAR CHICHICAPAM','',NULL,'2019-01-15 13:06:27',NULL),(898,13,NULL,'SAN BALTAZAR LOXICHA','',NULL,'2019-01-15 13:06:27',NULL),(899,13,NULL,'SAN BALTAZAR YATZACHI EL BAJO','',NULL,'2019-01-15 13:06:27',NULL),(900,13,NULL,'SAN BARTOLO COYOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(901,13,NULL,'SAN BARTOLO SOYALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(902,13,NULL,'SAN BARTOLO YAUTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(903,13,NULL,'SAN BARTOLOME AYAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(904,13,NULL,'SAN BARTOLOME LOXICHA','',NULL,'2019-01-15 13:06:27',NULL),(905,13,NULL,'SAN BARTOLOME QUIALANA','',NULL,'2019-01-15 13:06:27',NULL),(906,13,NULL,'SAN BARTOLOME YUCUA?E','',NULL,'2019-01-15 13:06:27',NULL),(907,13,NULL,'SAN BARTOLOME ZOOGOCHO','',NULL,'2019-01-15 13:06:27',NULL),(908,13,NULL,'SAN BERNARDO MIXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(909,13,NULL,'SAN BLAS ATEMPA','',NULL,'2019-01-15 13:06:27',NULL),(910,13,NULL,'SAN CARLOS YAUTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(911,13,NULL,'SAN CRISTOBAL AMATLAN','',NULL,'2019-01-15 13:06:27',NULL),(912,13,NULL,'SAN CRISTOBAL AMOLTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(913,13,NULL,'SAN CRISTOBAL LACHIRIOAG','',NULL,'2019-01-15 13:06:27',NULL),(914,13,NULL,'SAN CRISTOBAL SUCHIXTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(915,13,NULL,'SAN DIONISIO DEL MAR','',NULL,'2019-01-15 13:06:27',NULL),(916,13,NULL,'SAN DIONISIO OCOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(917,13,NULL,'SAN DIONISIO OCOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(918,13,NULL,'SAN ESTEBAN ATATLAHUCA','',NULL,'2019-01-15 13:06:27',NULL),(919,13,NULL,'SAN FELIPE JALAPA DE DIAZ','',NULL,'2019-01-15 13:06:27',NULL),(920,13,NULL,'SAN FELIPE TEJALAPAM','',NULL,'2019-01-15 13:06:27',NULL),(921,13,NULL,'SAN FELIPE USILA','',NULL,'2019-01-15 13:06:27',NULL),(922,13,NULL,'SAN FRANCISCO CAHUACUA','',NULL,'2019-01-15 13:06:27',NULL),(923,13,NULL,'SAN FRANCISCO CAJONOS','',NULL,'2019-01-15 13:06:27',NULL),(924,13,NULL,'SAN FRANCISCO CHAPULAPA','',NULL,'2019-01-15 13:06:27',NULL),(925,13,NULL,'SAN FRANCISCO CHINDUA','',NULL,'2019-01-15 13:06:27',NULL),(926,13,NULL,'SAN FRANCISCO DEL MAR','',NULL,'2019-01-15 13:06:27',NULL),(927,13,NULL,'SAN FRANCISCO HUEHUETLAN','',NULL,'2019-01-15 13:06:27',NULL),(928,13,NULL,'SAN FRANCISCO IXHUATAN','',NULL,'2019-01-15 13:06:27',NULL),(929,13,NULL,'SAN FRANCISCO JALTEPETONGO','',NULL,'2019-01-15 13:06:27',NULL),(930,13,NULL,'SAN FRANCISCO LACHIGOLO','',NULL,'2019-01-15 13:06:27',NULL),(931,13,NULL,'SAN FRANCISCO LOGUECHE','',NULL,'2019-01-15 13:06:27',NULL),(932,13,NULL,'SAN FRANCISCO NUXAÑO','',NULL,'2019-01-15 13:06:27',NULL),(933,13,NULL,'SAN FRANCISCO OZOLOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(934,13,NULL,'SAN FRANCISCO SOLA','',NULL,'2019-01-15 13:06:27',NULL),(935,13,NULL,'SAN FRANCISCO TELIXTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(936,13,NULL,'SAN FRANCISCO TEOPAN','',NULL,'2019-01-15 13:06:27',NULL),(937,13,NULL,'SAN FRANCISCO TLAPANCINGO','',NULL,'2019-01-15 13:06:27',NULL),(938,13,NULL,'SAN GABRIEL MIXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(939,13,NULL,'SAN ILDEFONSO AMATLAN','',NULL,'2019-01-15 13:06:27',NULL),(940,13,NULL,'SAN ILDEFONSO SOLA','',NULL,'2019-01-15 13:06:27',NULL),(941,13,NULL,'SAN ILDEFONSO VILLA ALTA','',NULL,'2019-01-15 13:06:27',NULL),(942,13,NULL,'SAN JACINTO AMILPAS','',NULL,'2019-01-15 13:06:27',NULL),(943,13,NULL,'SAN JACINTO TLACOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(944,13,NULL,'SAN JERONIMO COATLAN','',NULL,'2019-01-15 13:06:27',NULL),(945,13,NULL,'SAN JERONIMO SILACAYOAPILLA','',NULL,'2019-01-15 13:06:27',NULL),(946,13,NULL,'SAN JERONIMO SOSOLA','',NULL,'2019-01-15 13:06:27',NULL),(947,13,NULL,'SAN JERONIMO TAVICHE','',NULL,'2019-01-15 13:06:27',NULL),(948,13,NULL,'SAN JERONIMO TECOATL','',NULL,'2019-01-15 13:06:27',NULL),(949,13,NULL,'SAN JERONIMO TLACOCHAHUAYA','',NULL,'2019-01-15 13:06:27',NULL),(950,13,NULL,'SAN JORGE NUCHITA','',NULL,'2019-01-15 13:06:27',NULL),(951,13,NULL,'SAN JOSE AYUQUILA','',NULL,'2019-01-15 13:06:27',NULL),(952,13,NULL,'SAN JOSE CHILTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(953,13,NULL,'SAN JOSE DEL PE?ASCO','',NULL,'2019-01-15 13:06:27',NULL),(954,13,NULL,'SAN JOSE DEL PROGRESO','',NULL,'2019-01-15 13:06:27',NULL),(955,13,NULL,'SAN JOSE ESTANCIA GRANDE','',NULL,'2019-01-15 13:06:27',NULL),(956,13,NULL,'SAN JOSE INDEPENDENCIA','',NULL,'2019-01-15 13:06:27',NULL),(957,13,NULL,'SAN JOSE LACHIGUIRI','',NULL,'2019-01-15 13:06:27',NULL),(958,13,NULL,'SAN JOSE TENANGO','',NULL,'2019-01-15 13:06:27',NULL),(959,13,NULL,'SAN JUAN ACHIUTLA','',NULL,'2019-01-15 13:06:27',NULL),(960,13,NULL,'SAN JUAN ATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(961,13,NULL,'SAN JUAN BAUTISTA ATATLAHUCA','',NULL,'2019-01-15 13:06:27',NULL),(962,13,NULL,'SAN JUAN BAUTISTA COIXTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(963,13,NULL,'SAN JUAN BAUTISTA CUICATLAN','',NULL,'2019-01-15 13:06:27',NULL),(964,13,NULL,'SAN JUAN BAUTISTA GUELACHE','',NULL,'2019-01-15 13:06:27',NULL),(965,13,NULL,'SAN JUAN BAUTISTA JAYACATLAN','',NULL,'2019-01-15 13:06:27',NULL),(966,13,NULL,'SAN JUAN BAUTISTA LO DE SOTO','',NULL,'2019-01-15 13:06:27',NULL),(967,13,NULL,'SAN JUAN BAUTISTA SUCHITEPEC','',NULL,'2019-01-15 13:06:27',NULL),(968,13,NULL,'SAN JUAN BAUTISTA TLACHICHILCO','',NULL,'2019-01-15 13:06:27',NULL),(969,13,NULL,'SAN JUAN BAUTISTA TLACOATZINTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(970,13,NULL,'SAN JUAN BAUTISTA TUXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(971,13,NULL,'SAN JUAN BAUTISTA VALLE NACIONAL','',NULL,'2019-01-15 13:06:27',NULL),(972,13,NULL,'SAN JUAN CACAHUATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(973,13,NULL,'SAN JUAN CHICOMEZUCHIL','',NULL,'2019-01-15 13:06:27',NULL),(974,13,NULL,'SAN JUAN CHILATECA','',NULL,'2019-01-15 13:06:27',NULL),(975,13,NULL,'SAN JUAN CIENEGUILLA','',NULL,'2019-01-15 13:06:27',NULL),(976,13,NULL,'SAN JUAN COATZOSPAM','',NULL,'2019-01-15 13:06:27',NULL),(977,13,NULL,'SAN JUAN COLORADO','',NULL,'2019-01-15 13:06:27',NULL),(978,13,NULL,'SAN JUAN COMALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(979,13,NULL,'SAN JUAN COTZOCON','',NULL,'2019-01-15 13:06:27',NULL),(980,13,NULL,'SAN JUAN DE LOS CUES','',NULL,'2019-01-15 13:06:27',NULL),(981,13,NULL,'SAN JUAN DEL ESTADO','',NULL,'2019-01-15 13:06:27',NULL),(982,13,NULL,'SAN JUAN DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(983,13,NULL,'SAN JUAN DIUXI','',NULL,'2019-01-15 13:06:27',NULL),(984,13,NULL,'SAN JUAN EVANGELISTA ANALCO','',NULL,'2019-01-15 13:06:27',NULL),(985,13,NULL,'SAN JUAN GUELAVIA','',NULL,'2019-01-15 13:06:27',NULL),(986,13,NULL,'SAN JUAN GUICHICOVI','',NULL,'2019-01-15 13:06:27',NULL),(987,13,NULL,'SAN JUAN IHUALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(988,13,NULL,'SAN JUAN JUQUILA MIXES','',NULL,'2019-01-15 13:06:27',NULL),(989,13,NULL,'SAN JUAN JUQUILA VIJANOS','',NULL,'2019-01-15 13:06:27',NULL),(990,13,NULL,'SAN JUAN LACHAO','',NULL,'2019-01-15 13:06:27',NULL),(991,13,NULL,'SAN JUAN LACHIGALLA','',NULL,'2019-01-15 13:06:27',NULL),(992,13,NULL,'SAN JUAN LAJARCIA','',NULL,'2019-01-15 13:06:27',NULL),(993,13,NULL,'SAN JUAN LALANA','',NULL,'2019-01-15 13:06:27',NULL),(994,13,NULL,'SAN JUAN MAZATLAN','',NULL,'2019-01-15 13:06:27',NULL),(995,13,NULL,'San Juan Mixtepec Juxtlahuaca','',NULL,'2019-01-15 13:06:27',NULL),(996,13,NULL,'San Juan Mixtepec Miahuatlan','',NULL,'2019-01-15 13:06:27',NULL),(997,13,NULL,'SAN JUAN ÑUMI','',NULL,'2019-01-15 13:06:27',NULL),(998,13,NULL,'SAN JUAN OZOLOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(999,13,NULL,'SAN JUAN PETLAPA','',NULL,'2019-01-15 13:06:27',NULL),(1000,13,NULL,'SAN JUAN QUIAHIJE','',NULL,'2019-01-15 13:06:27',NULL),(1001,13,NULL,'SAN JUAN QUIOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1002,13,NULL,'SAN JUAN SAYULTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1003,13,NULL,'SAN JUAN TABAA','',NULL,'2019-01-15 13:06:27',NULL),(1004,13,NULL,'SAN JUAN TAMAZOLA','',NULL,'2019-01-15 13:06:27',NULL),(1005,13,NULL,'SAN JUAN TEITA','',NULL,'2019-01-15 13:06:27',NULL),(1006,13,NULL,'SAN JUAN TEITIPAC','',NULL,'2019-01-15 13:06:27',NULL),(1007,13,NULL,'SAN JUAN TEPEUXILA','',NULL,'2019-01-15 13:06:27',NULL),(1008,13,NULL,'SAN JUAN TEPOSCOLULA','',NULL,'2019-01-15 13:06:27',NULL),(1009,13,NULL,'SAN JUAN YAEE','',NULL,'2019-01-15 13:06:27',NULL),(1010,13,NULL,'SAN JUAN YATZONA','',NULL,'2019-01-15 13:06:27',NULL),(1011,13,NULL,'SAN JUAN YUCUITA','',NULL,'2019-01-15 13:06:27',NULL),(1012,13,NULL,'SAN LORENZO','',NULL,'2019-01-15 13:06:27',NULL),(1013,13,NULL,'SAN LORENZO ALBARRADAS','',NULL,'2019-01-15 13:06:27',NULL),(1014,13,NULL,'SAN LORENZO CACAOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1015,13,NULL,'SAN LORENZO CUAUNECUILTITLA','',NULL,'2019-01-15 13:06:27',NULL),(1016,13,NULL,'SAN LORENZO TEXMELUCAN','',NULL,'2019-01-15 13:06:27',NULL),(1017,13,NULL,'SAN LORENZO VICTORIA','',NULL,'2019-01-15 13:06:27',NULL),(1018,13,NULL,'SAN LUCAS CAMOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1019,13,NULL,'SAN LUCAS OJITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1020,13,NULL,'SAN LUCAS QUIAVINI','',NULL,'2019-01-15 13:06:27',NULL),(1021,13,NULL,'SAN LUCAS ZOQUIAPAM','',NULL,'2019-01-15 13:06:27',NULL),(1022,13,NULL,'ASUNCION CACALOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1023,13,NULL,'SAN LUIS AMATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1024,13,NULL,'SAN MARCIAL OZOLOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1025,13,NULL,'SAN MARCOS ARTEAGA','',NULL,'2019-01-15 13:06:27',NULL),(1026,13,NULL,'ASUNCION CUYOTEPEJI','',NULL,'2019-01-15 13:06:27',NULL),(1027,13,NULL,'SAN MARTIN DE LOS CANSECOS','',NULL,'2019-01-15 13:06:27',NULL),(1028,13,NULL,'SAN MARTIN HUAMELULPAM','',NULL,'2019-01-15 13:06:27',NULL),(1029,13,NULL,'SAN MARTIN ITUNYOSO','',NULL,'2019-01-15 13:06:27',NULL),(1030,13,NULL,'SAN MARTIN LACHILA','',NULL,'2019-01-15 13:06:27',NULL),(1031,13,NULL,'SAN MARTIN PERAS','',NULL,'2019-01-15 13:06:27',NULL),(1032,13,NULL,'ASUNCION IXTALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1033,13,NULL,'SAN MARTIN TILCAJETE','',NULL,'2019-01-15 13:06:27',NULL),(1034,13,NULL,'SAN MARTIN TOXPALAN','',NULL,'2019-01-15 13:06:27',NULL),(1035,13,NULL,'SAN MARTIN ZACATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1036,13,NULL,'SAN MATEO CAJONOS','',NULL,'2019-01-15 13:06:27',NULL),(1037,13,NULL,'SAN MATEO DEL MAR','',NULL,'2019-01-15 13:06:27',NULL),(1038,13,NULL,'SAN MATEO ETLATONGO','',NULL,'2019-01-15 13:06:27',NULL),(1039,13,NULL,'SAN MATEO NEJAPAM','',NULL,'2019-01-15 13:06:27',NULL),(1040,13,NULL,'SAN MATEO PE?ASCO','',NULL,'2019-01-15 13:06:27',NULL),(1041,13,NULL,'ASUNCION NOCHIXTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1042,13,NULL,'SAN MATEO PI?AS','',NULL,'2019-01-15 13:06:27',NULL),(1043,13,NULL,'SAN MATEO RIO HONDO','',NULL,'2019-01-15 13:06:27',NULL),(1044,13,NULL,'SAN MATEO SINDIHUI','',NULL,'2019-01-15 13:06:27',NULL),(1045,13,NULL,'SAN MATEO TLAPILTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1046,13,NULL,'SAN MATEO YOLOXOCHITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1047,13,NULL,'SAN MELCHOR BETAZA','',NULL,'2019-01-15 13:06:27',NULL),(1048,13,NULL,'SAN MIGUEL ACHIUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1049,13,NULL,'SAN MIGUEL AHUEHUETITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1050,13,NULL,'SAN MIGUEL ALOAPAM','',NULL,'2019-01-15 13:06:27',NULL),(1051,13,NULL,'ASUNCION OCOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1052,13,NULL,'SAN MIGUEL AMATITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1053,13,NULL,'SAN MIGUEL AMATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1054,13,NULL,'SAN MIGUEL CHICAHUA','',NULL,'2019-01-15 13:06:27',NULL),(1055,13,NULL,'SAN MIGUEL CHIMALAPA','',NULL,'2019-01-15 13:06:27',NULL),(1056,13,NULL,'SAN MIGUEL COATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1057,13,NULL,'SAN MIGUEL DEL PUERTO','',NULL,'2019-01-15 13:06:27',NULL),(1058,13,NULL,'SAN MIGUEL DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(1059,13,NULL,'SAN MIGUEL EJUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1060,13,NULL,'ASUNCION TLACOLULITA','',NULL,'2019-01-15 13:06:27',NULL),(1061,13,NULL,'SAN MIGUEL EL GRANDE','',NULL,'2019-01-15 13:06:27',NULL),(1062,13,NULL,'SAN MIGUEL HUAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1063,13,NULL,'SAN MIGUEL MIXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1064,13,NULL,'SAN MIGUEL PANIXTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(1065,13,NULL,'SAN MIGUEL PERAS','',NULL,'2019-01-15 13:06:27',NULL),(1066,13,NULL,'SAN MIGUEL PIEDRAS','',NULL,'2019-01-15 13:06:27',NULL),(1067,13,NULL,'SAN MIGUEL QUETZALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1068,13,NULL,'SAN MIGUEL SANTA FLOR','',NULL,'2019-01-15 13:06:27',NULL),(1069,13,NULL,'SAN MIGUEL SOYALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1070,13,NULL,'SAN MIGUEL SUCHIXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1071,13,NULL,'SAN MIGUEL TECOMATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1072,13,NULL,'SAN MIGUEL TENANGO','',NULL,'2019-01-15 13:06:27',NULL),(1073,13,NULL,'SAN MIGUEL TEQUIXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1074,13,NULL,'SAN MIGUEL TILQUIAPAM','',NULL,'2019-01-15 13:06:27',NULL),(1075,13,NULL,'SAN MIGUEL TLACAMAMA','',NULL,'2019-01-15 13:06:27',NULL),(1076,13,NULL,'SAN MIGUEL TLACOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1077,13,NULL,'SAN MIGUEL TULANCINGO','',NULL,'2019-01-15 13:06:27',NULL),(1078,13,NULL,'SAN MIGUEL YOTAO','',NULL,'2019-01-15 13:06:27',NULL),(1079,13,NULL,'SAN NICOLAS','',NULL,'2019-01-15 13:06:27',NULL),(1080,13,NULL,'SAN NICOLAS HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(1081,13,NULL,'SAN PABLO COATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1082,13,NULL,'SAN PABLO CUATRO VENADOS','',NULL,'2019-01-15 13:06:27',NULL),(1083,13,NULL,'SAN PABLO ETLA','',NULL,'2019-01-15 13:06:27',NULL),(1084,13,NULL,'SAN PABLO HUITZO','',NULL,'2019-01-15 13:06:27',NULL),(1085,13,NULL,'SAN PABLO HUIXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1086,13,NULL,'SAN PABLO MACUILTIANGUIS','',NULL,'2019-01-15 13:06:27',NULL),(1087,13,NULL,'SAN PABLO TIJALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1088,13,NULL,'SAN PABLO VILLA DE MITLA','',NULL,'2019-01-15 13:06:27',NULL),(1089,13,NULL,'SAN PABLO YAGANIZA','',NULL,'2019-01-15 13:06:27',NULL),(1090,13,NULL,'SAN PEDRO AMUZGOS','',NULL,'2019-01-15 13:06:27',NULL),(1091,13,NULL,'SAN PEDRO APOSTOL','',NULL,'2019-01-15 13:06:27',NULL),(1092,13,NULL,'SAN PEDRO ATOYAC','',NULL,'2019-01-15 13:06:27',NULL),(1093,13,NULL,'SAN PEDRO CAJONOS','',NULL,'2019-01-15 13:06:27',NULL),(1094,13,NULL,'SAN PEDRO COMITANCILLO','',NULL,'2019-01-15 13:06:27',NULL),(1095,13,NULL,'SAN PEDRO COXCALTEPEC CANTAROS','',NULL,'2019-01-15 13:06:27',NULL),(1096,13,NULL,'SAN PEDRO EL ALTO','',NULL,'2019-01-15 13:06:27',NULL),(1097,13,NULL,'SAN PEDRO HUAMELULA','',NULL,'2019-01-15 13:06:27',NULL),(1098,13,NULL,'SAN PEDRO HUILOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1099,13,NULL,'SAN PEDRO IXCATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1100,13,NULL,'SAN PEDRO IXTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(1101,13,NULL,'SAN PEDRO JALTEPETONGO','',NULL,'2019-01-15 13:06:27',NULL),(1102,13,NULL,'SAN PEDRO JICAYAN','',NULL,'2019-01-15 13:06:27',NULL),(1103,13,NULL,'SAN PEDRO JOCOTIPAC','',NULL,'2019-01-15 13:06:27',NULL),(1104,13,NULL,'SAN PEDRO JUCHATENGO','',NULL,'2019-01-15 13:06:27',NULL),(1105,13,NULL,'SAN PEDRO MARTIR','',NULL,'2019-01-15 13:06:27',NULL),(1106,13,NULL,'SAN PEDRO MARTIR QUIECHAPA','',NULL,'2019-01-15 13:06:27',NULL),(1107,13,NULL,'SAN PEDRO MARTIR YUCUXACO','',NULL,'2019-01-15 13:06:27',NULL),(1108,13,NULL,'San Pedro Mixtepec-juquila','',NULL,'2019-01-15 13:06:27',NULL),(1109,13,NULL,'San Pedro Mixtepec-miahuatlan','',NULL,'2019-01-15 13:06:27',NULL),(1110,13,NULL,'SAN PEDRO MOLINOS','',NULL,'2019-01-15 13:06:27',NULL),(1111,13,NULL,'SAN PEDRO NOPALA','',NULL,'2019-01-15 13:06:27',NULL),(1112,13,NULL,'SAN PEDRO OCOPETATILLO','',NULL,'2019-01-15 13:06:27',NULL),(1113,13,NULL,'SAN PEDRO OCOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1114,13,NULL,'SAN PEDRO POCHUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1115,13,NULL,'SAN PEDRO QUIATONI','',NULL,'2019-01-15 13:06:27',NULL),(1116,13,NULL,'SAN PEDRO SOCHIAPAM','',NULL,'2019-01-15 13:06:27',NULL),(1117,13,NULL,'SAN PEDRO TAPANATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1118,13,NULL,'SAN PEDRO TAVICHE','',NULL,'2019-01-15 13:06:27',NULL),(1119,13,NULL,'SAN PEDRO TEOZACOALCO','',NULL,'2019-01-15 13:06:27',NULL),(1120,13,NULL,'SAN PEDRO TEUTILA','',NULL,'2019-01-15 13:06:27',NULL),(1121,13,NULL,'SAN PEDRO TIDAA','',NULL,'2019-01-15 13:06:27',NULL),(1122,13,NULL,'SAN PEDRO TOPILTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1123,13,NULL,'SAN PEDRO TOTOLAPA','',NULL,'2019-01-15 13:06:27',NULL),(1124,13,NULL,'SAN PEDRO Y SAN PABLO AYUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1125,13,NULL,'SAN PEDRO Y SAN PABLO TEPOSCOLULA','',NULL,'2019-01-15 13:06:27',NULL),(1126,13,NULL,'SAN PEDRO Y SAN PABLO TEQUIXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1127,13,NULL,'SAN PEDRO YANERI','',NULL,'2019-01-15 13:06:27',NULL),(1128,13,NULL,'SAN PEDRO YOLOX','',NULL,'2019-01-15 13:06:27',NULL),(1129,13,NULL,'SAN PEDRO YUCUNAMA','',NULL,'2019-01-15 13:06:27',NULL),(1130,13,NULL,'SAN RAYMUNDO JALPAN','',NULL,'2019-01-15 13:06:27',NULL),(1131,13,NULL,'SAN SEBASTIAN ABASOLO','',NULL,'2019-01-15 13:06:27',NULL),(1132,13,NULL,'SAN SEBASTIAN COATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1133,13,NULL,'SAN SEBASTIAN IXCAPA','',NULL,'2019-01-15 13:06:27',NULL),(1134,13,NULL,'SAN SEBASTIAN NICANANDUTA','',NULL,'2019-01-15 13:06:27',NULL),(1135,13,NULL,'SAN SEBASTIAN RIO HONDO','',NULL,'2019-01-15 13:06:27',NULL),(1136,13,NULL,'SAN SEBASTIAN TECOMAXTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(1137,13,NULL,'SAN SEBASTIAN TEITIPAC','',NULL,'2019-01-15 13:06:27',NULL),(1138,13,NULL,'SAN SEBASTIAN TUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1139,13,NULL,'SAN SIMON ALMOLONGAS','',NULL,'2019-01-15 13:06:27',NULL),(1140,13,NULL,'SAN SIMON ZAHUATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1141,13,NULL,'SAN VICENTE COATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1142,13,NULL,'SAN VICENTE LACHIXIO','',NULL,'2019-01-15 13:06:27',NULL),(1143,13,NULL,'SAN VICENTE NU?U','',NULL,'2019-01-15 13:06:27',NULL),(1144,13,NULL,'SANTA ANA','',NULL,'2019-01-15 13:06:27',NULL),(1145,13,NULL,'SANTA ANA ATEIXTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(1146,13,NULL,'SANTA ANA CUAUHTEMOC','',NULL,'2019-01-15 13:06:27',NULL),(1147,13,NULL,'SANTA ANA DEL VALLE','',NULL,'2019-01-15 13:06:27',NULL),(1148,13,NULL,'SANTA ANA TAVELA','',NULL,'2019-01-15 13:06:27',NULL),(1149,13,NULL,'SANTA ANA TLAPACOYAN','',NULL,'2019-01-15 13:06:27',NULL),(1150,13,NULL,'SANTA ANA YARENI','',NULL,'2019-01-15 13:06:27',NULL),(1151,13,NULL,'SANTA ANA ZEGACHE','',NULL,'2019-01-15 13:06:27',NULL),(1152,13,NULL,'SANTA CATALINA QUIERI','',NULL,'2019-01-15 13:06:27',NULL),(1153,13,NULL,'SANTA CATARINA CUIXTLA','',NULL,'2019-01-15 13:06:27',NULL),(1154,13,NULL,'SANTA CATARINA IXTEPEJI','',NULL,'2019-01-15 13:06:27',NULL),(1155,13,NULL,'SANTA CATARINA JUQUILA','',NULL,'2019-01-15 13:06:27',NULL),(1156,13,NULL,'SANTA CATARINA LACHATAO','',NULL,'2019-01-15 13:06:27',NULL),(1157,13,NULL,'SANTA CATARINA LOXICHA','',NULL,'2019-01-15 13:06:27',NULL),(1158,13,NULL,'SANTA CATARINA MECHOACAN','',NULL,'2019-01-15 13:06:27',NULL),(1159,13,NULL,'SANTA CATARINA MINAS','',NULL,'2019-01-15 13:06:27',NULL),(1160,13,NULL,'SANTA CATARINA QUIANE','',NULL,'2019-01-15 13:06:27',NULL),(1161,13,NULL,'SANTA CATARINA QUIOQUITANI','',NULL,'2019-01-15 13:06:27',NULL),(1162,13,NULL,'SANTA CATARINA TAYATA','',NULL,'2019-01-15 13:06:27',NULL),(1163,13,NULL,'SANTA CATARINA TICUA','',NULL,'2019-01-15 13:06:27',NULL),(1164,13,NULL,'SANTA CATARINA YOSONOTU','',NULL,'2019-01-15 13:06:27',NULL),(1165,13,NULL,'SANTA CATARINA ZAPOQUILA','',NULL,'2019-01-15 13:06:27',NULL),(1166,13,NULL,'SANTA CRUZ ACATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1167,13,NULL,'SANTA CRUZ AMILPAS','',NULL,'2019-01-15 13:06:27',NULL),(1168,13,NULL,'SANTA CRUZ DE BRAVO','',NULL,'2019-01-15 13:06:27',NULL),(1169,13,NULL,'SANTA CRUZ ITUNDUJIA','',NULL,'2019-01-15 13:06:27',NULL),(1170,13,NULL,'SANTA CRUZ MIXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1171,13,NULL,'SANTA CRUZ NUNDACO','',NULL,'2019-01-15 13:06:27',NULL),(1172,13,NULL,'SANTA CRUZ PAPALUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1173,13,NULL,'SANTA CRUZ TACACHE DE MINA','',NULL,'2019-01-15 13:06:27',NULL),(1174,13,NULL,'SANTA CRUZ TACAHUA','',NULL,'2019-01-15 13:06:27',NULL),(1175,13,NULL,'SANTA CRUZ TAYATA','',NULL,'2019-01-15 13:06:27',NULL),(1176,13,NULL,'SANTA CRUZ XITLA','',NULL,'2019-01-15 13:06:27',NULL),(1177,13,NULL,'SANTA CRUZ XOXOCOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1178,13,NULL,'SANTA CRUZ ZENZONTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1179,13,NULL,'SANTA GERTRUDIS','',NULL,'2019-01-15 13:06:27',NULL),(1180,13,NULL,'SANTA INES DE ZARAGOZA','',NULL,'2019-01-15 13:06:27',NULL),(1181,13,NULL,'SANTA INES DEL MONTE','',NULL,'2019-01-15 13:06:27',NULL),(1182,13,NULL,'SANTA INES YATZECHE','',NULL,'2019-01-15 13:06:27',NULL),(1183,13,NULL,'SANTA LUCIA DEL CAMINO','',NULL,'2019-01-15 13:06:27',NULL),(1184,13,NULL,'SANTA LUCIA MIAHUATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1185,13,NULL,'SANTA LUCIA MONTEVERDE','',NULL,'2019-01-15 13:06:27',NULL),(1186,13,NULL,'SANTA LUCIA OCOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1187,13,NULL,'SANTA MAGDALENA JICOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1188,13,NULL,'SANTA MARIA ALOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1189,13,NULL,'SANTA MARIA APAZCO','',NULL,'2019-01-15 13:06:27',NULL),(1190,13,NULL,'SANTA MARIA ATZOMPA','',NULL,'2019-01-15 13:06:27',NULL),(1191,13,NULL,'SANTA MARIA CAMOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1192,13,NULL,'SANTA MARIA CHACHOAPAM','',NULL,'2019-01-15 13:06:27',NULL),(1193,13,NULL,'SANTA MARIA CHILCHOTLA','',NULL,'2019-01-15 13:06:27',NULL),(1194,13,NULL,'SANTA MARIA CHIMALAPA','',NULL,'2019-01-15 13:06:27',NULL),(1195,13,NULL,'SANTA MARIA COLOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1196,13,NULL,'SANTA MARIA CORTIJO','',NULL,'2019-01-15 13:06:27',NULL),(1197,13,NULL,'SANTA MARIA COYOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1198,13,NULL,'SANTA MARIA DEL ROSARIO','',NULL,'2019-01-15 13:06:27',NULL),(1199,13,NULL,'SANTA MARIA DEL TULE','',NULL,'2019-01-15 13:06:27',NULL),(1200,13,NULL,'SANTA MARIA ECATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1201,13,NULL,'SANTA MARIA GUELACE','',NULL,'2019-01-15 13:06:27',NULL),(1202,13,NULL,'SANTA MARIA GUIENAGATI','',NULL,'2019-01-15 13:06:27',NULL),(1203,13,NULL,'SANTA MARIA HUATULCO','',NULL,'2019-01-15 13:06:27',NULL),(1204,13,NULL,'SANTA MARIA HUAZOLOTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1205,13,NULL,'SANTA MARIA IPALAPA','',NULL,'2019-01-15 13:06:27',NULL),(1206,13,NULL,'SANTA MARIA IXCATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1207,13,NULL,'SANTA MARIA JACATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1208,13,NULL,'SANTA MARIA JALAPA DEL MARQUES','',NULL,'2019-01-15 13:06:27',NULL),(1209,13,NULL,'SANTA MARIA JALTIANGUIS','',NULL,'2019-01-15 13:06:27',NULL),(1210,13,NULL,'SANTA MARIA LA ASUNCION','',NULL,'2019-01-15 13:06:27',NULL),(1211,13,NULL,'SANTA MARIA LACHIXIO','',NULL,'2019-01-15 13:06:27',NULL),(1212,13,NULL,'SANTA MARIA MIXTEQUILLA','',NULL,'2019-01-15 13:06:27',NULL),(1213,13,NULL,'SANTA MARIA NATIVITAS','',NULL,'2019-01-15 13:06:27',NULL),(1214,13,NULL,'SANTA MARIA NDUAYACO','',NULL,'2019-01-15 13:06:27',NULL),(1215,13,NULL,'SANTA MARIA OZOLOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1216,13,NULL,'SANTA MARIA PAPALO','',NULL,'2019-01-15 13:06:27',NULL),(1217,13,NULL,'SANTA MARIA PE?OLES','',NULL,'2019-01-15 13:06:27',NULL),(1218,13,NULL,'SANTA MARIA PETAPA','',NULL,'2019-01-15 13:06:27',NULL),(1219,13,NULL,'SANTA MARIA QUIEGOLANI','',NULL,'2019-01-15 13:06:27',NULL),(1220,13,NULL,'SANTA MARIA SOLA','',NULL,'2019-01-15 13:06:27',NULL),(1221,13,NULL,'SANTA MARIA TATALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1222,13,NULL,'SANTA MARIA TECOMAVACA','',NULL,'2019-01-15 13:06:27',NULL),(1223,13,NULL,'SANTA MARIA TEMAXCALAPA','',NULL,'2019-01-15 13:06:27',NULL),(1224,13,NULL,'SANTA MARIA TEMAXCALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1225,13,NULL,'SANTA MARIA TEOPOXCO','',NULL,'2019-01-15 13:06:27',NULL),(1226,13,NULL,'SANTA MARIA TEPANTLALI','',NULL,'2019-01-15 13:06:27',NULL),(1227,13,NULL,'SANTA MARIA TEXCATITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1228,13,NULL,'SANTA MARIA TLAHUITOLTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1229,13,NULL,'SANTA MARIA TLALIXTAC','',NULL,'2019-01-15 13:06:27',NULL),(1230,13,NULL,'SANTA MARIA TONAMECA','',NULL,'2019-01-15 13:06:27',NULL),(1231,13,NULL,'SANTA MARIA TOTOLAPILLA','',NULL,'2019-01-15 13:06:27',NULL),(1232,13,NULL,'SANTA MARIA XADANI','',NULL,'2019-01-15 13:06:27',NULL),(1233,13,NULL,'SANTA MARIA YALINA','',NULL,'2019-01-15 13:06:27',NULL),(1234,13,NULL,'SANTA MARIA YAVESIA','',NULL,'2019-01-15 13:06:27',NULL),(1235,13,NULL,'SANTA MARIA YOLOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1236,13,NULL,'SANTA MARIA YOSOYUA','',NULL,'2019-01-15 13:06:27',NULL),(1237,13,NULL,'SANTA MARIA YUCUHITI','',NULL,'2019-01-15 13:06:27',NULL),(1238,13,NULL,'SANTA MARIA ZACATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1239,13,NULL,'SANTA MARIA ZANIZA','',NULL,'2019-01-15 13:06:27',NULL),(1240,13,NULL,'SANTA MARIA ZOQUITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1241,13,NULL,'SANTIAGO AMOLTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1242,13,NULL,'SANTIAGO APOALA','',NULL,'2019-01-15 13:06:27',NULL),(1243,13,NULL,'SANTIAGO APOSTOL','',NULL,'2019-01-15 13:06:27',NULL),(1244,13,NULL,'SANTIAGO ASTATA','',NULL,'2019-01-15 13:06:27',NULL),(1245,13,NULL,'SANTIAGO ATITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1246,13,NULL,'SANTIAGO AYUQUILILLA','',NULL,'2019-01-15 13:06:27',NULL),(1247,13,NULL,'SANTIAGO CACALOXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1248,13,NULL,'SANTIAGO CAMOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1249,13,NULL,'SANTIAGO CHAZUMBA','',NULL,'2019-01-15 13:06:27',NULL),(1250,13,NULL,'SANTIAGO CHOAPAM','',NULL,'2019-01-15 13:06:27',NULL),(1251,13,NULL,'SANTIAGO COMALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1252,13,NULL,'SANTIAGO DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(1253,13,NULL,'SANTIAGO HUAJOLOTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1254,13,NULL,'SANTIAGO HUAUCLILLA','',NULL,'2019-01-15 13:06:27',NULL),(1255,13,NULL,'SANTIAGO IHUITLAN PLUMAS','',NULL,'2019-01-15 13:06:27',NULL),(1256,13,NULL,'SANTIAGO IXCUINTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1257,13,NULL,'SANTIAGO IXTAYUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1258,13,NULL,'SANTIAGO JAMILTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1259,13,NULL,'SANTIAGO JOCOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1260,13,NULL,'SANTIAGO JUXTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(1261,13,NULL,'SANTIAGO LACHIGUIRI','',NULL,'2019-01-15 13:06:27',NULL),(1262,13,NULL,'SANTIAGO LALOPA','',NULL,'2019-01-15 13:06:27',NULL),(1263,13,NULL,'SANTIAGO LAOLLAGA','',NULL,'2019-01-15 13:06:27',NULL),(1264,13,NULL,'SANTIAGO LAXOPA','',NULL,'2019-01-15 13:06:27',NULL),(1265,13,NULL,'SANTIAGO LLANO GRANDE','',NULL,'2019-01-15 13:06:27',NULL),(1266,13,NULL,'SANTIAGO MATATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1267,13,NULL,'SANTIAGO MILTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1268,13,NULL,'SANTIAGO MINAS','',NULL,'2019-01-15 13:06:27',NULL),(1269,13,NULL,'SANTIAGO NACALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1270,13,NULL,'SANTIAGO NEJAPILLA','',NULL,'2019-01-15 13:06:27',NULL),(1271,13,NULL,'SANTIAGO NILTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1272,13,NULL,'SANTIAGO NUNDICHE','',NULL,'2019-01-15 13:06:27',NULL),(1273,13,NULL,'SANTIAGO NUYOO','',NULL,'2019-01-15 13:06:27',NULL),(1274,13,NULL,'SANTIAGO PINOTEPA NACIONAL','',NULL,'2019-01-15 13:06:27',NULL),(1275,13,NULL,'SANTIAGO SUCHILQUITONGO','',NULL,'2019-01-15 13:06:27',NULL),(1276,13,NULL,'SANTIAGO TAMAZOLA','',NULL,'2019-01-15 13:06:27',NULL),(1277,13,NULL,'SANTIAGO TAPEXTLA','',NULL,'2019-01-15 13:06:27',NULL),(1278,13,NULL,'SANTIAGO TENANGO','',NULL,'2019-01-15 13:06:27',NULL),(1279,13,NULL,'SANTIAGO TEPETLAPA','',NULL,'2019-01-15 13:06:27',NULL),(1280,13,NULL,'SANTIAGO TETEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1281,13,NULL,'SANTIAGO TEXCALCINGO','',NULL,'2019-01-15 13:06:27',NULL),(1282,13,NULL,'SANTIAGO TEXTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1283,13,NULL,'SANTIAGO TILANTONGO','',NULL,'2019-01-15 13:06:27',NULL),(1284,13,NULL,'SANTIAGO TILLO','',NULL,'2019-01-15 13:06:27',NULL),(1285,13,NULL,'SANTIAGO TLAZOYALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1286,13,NULL,'SANTIAGO XANICA','',NULL,'2019-01-15 13:06:27',NULL),(1287,13,NULL,'SANTIAGO XIACUI','',NULL,'2019-01-15 13:06:27',NULL),(1288,13,NULL,'SANTIAGO YAITEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1289,13,NULL,'SANTIAGO YAVEO','',NULL,'2019-01-15 13:06:27',NULL),(1290,13,NULL,'SANTIAGO YOLOMECATL','',NULL,'2019-01-15 13:06:27',NULL),(1291,13,NULL,'SANTIAGO YOSONDUA','',NULL,'2019-01-15 13:06:27',NULL),(1292,13,NULL,'SANTIAGO YUCUYACHI','',NULL,'2019-01-15 13:06:27',NULL),(1293,13,NULL,'SANTIAGO ZACATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1294,13,NULL,'SANTIAGO ZOOCHILA','',NULL,'2019-01-15 13:06:27',NULL),(1295,13,NULL,'SANTO DOMINGO ALBARRADAS','',NULL,'2019-01-15 13:06:27',NULL),(1296,13,NULL,'SANTO DOMINGO ARMENTA','',NULL,'2019-01-15 13:06:27',NULL),(1297,13,NULL,'SANTO DOMINGO CHIHUITAN','',NULL,'2019-01-15 13:06:27',NULL),(1298,13,NULL,'SANTO DOMINGO DE MORELOS','',NULL,'2019-01-15 13:06:27',NULL),(1299,13,NULL,'SANTO DOMINGO INGENIO','',NULL,'2019-01-15 13:06:27',NULL),(1300,13,NULL,'SANTO DOMINGO IXCATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1301,13,NULL,'SANTO DOMINGO NUXAA','',NULL,'2019-01-15 13:06:27',NULL),(1302,13,NULL,'SANTO DOMINGO OZOLOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1303,13,NULL,'SANTO DOMINGO PETAPA','',NULL,'2019-01-15 13:06:27',NULL),(1304,13,NULL,'SANTO DOMINGO ROAYAGA','',NULL,'2019-01-15 13:06:27',NULL),(1305,13,NULL,'SANTO DOMINGO TEHUANTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1306,13,NULL,'SANTO DOMINGO TEOJOMULCO','',NULL,'2019-01-15 13:06:27',NULL),(1307,13,NULL,'SANTO DOMINGO TEPUXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1308,13,NULL,'SANTO DOMINGO TLATAYAPAM','',NULL,'2019-01-15 13:06:27',NULL),(1309,13,NULL,'SANTO DOMINGO TOMALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1310,13,NULL,'SANTO DOMINGO TONALA','',NULL,'2019-01-15 13:06:27',NULL),(1311,13,NULL,'SANTO DOMINGO TONALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1312,13,NULL,'SANTO DOMINGO XAGACIA','',NULL,'2019-01-15 13:06:27',NULL),(1313,13,NULL,'SANTO DOMINGO YANHUITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1314,13,NULL,'SANTO DOMINGO YODOHINO','',NULL,'2019-01-15 13:06:27',NULL),(1315,13,NULL,'SANTO DOMINGO ZANATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1316,13,NULL,'SANTO TOMAS JALIEZA','',NULL,'2019-01-15 13:06:27',NULL),(1317,13,NULL,'SANTO TOMAS MAZALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1318,13,NULL,'SANTO TOMAS OCOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1319,13,NULL,'SANTO TOMAS TAMAZULAPAN','',NULL,'2019-01-15 13:06:27',NULL),(1320,13,NULL,'SANTOS REYES NOPALA','',NULL,'2019-01-15 13:06:27',NULL),(1321,13,NULL,'SANTOS REYES PAPALO','',NULL,'2019-01-15 13:06:27',NULL),(1322,13,NULL,'SANTOS REYES TEPEJILLO','',NULL,'2019-01-15 13:06:27',NULL),(1323,13,NULL,'SANTOS REYES YUCUNA','',NULL,'2019-01-15 13:06:27',NULL),(1324,13,NULL,'SILACAYOAPAM','',NULL,'2019-01-15 13:06:27',NULL),(1325,13,NULL,'SITIO DE XITLAPEHUA','',NULL,'2019-01-15 13:06:27',NULL),(1326,13,NULL,'SOLEDAD ETLA','',NULL,'2019-01-15 13:06:27',NULL),(1327,13,NULL,'TAMAZULAPAM DEL ESPIRITU SANTO','',NULL,'2019-01-15 13:06:27',NULL),(1328,13,NULL,'TANETZE DE ZARAGOZA','',NULL,'2019-01-15 13:06:27',NULL),(1329,13,NULL,'TANICHE','',NULL,'2019-01-15 13:06:27',NULL),(1330,13,NULL,'TATALTEPEC DE VALDES','',NULL,'2019-01-15 13:06:27',NULL),(1331,13,NULL,'AYOQUEZCO DE ALDAMA','',NULL,'2019-01-15 13:06:27',NULL),(1332,13,NULL,'TEOCOCUILCO DE MARCOS PEREZ','',NULL,'2019-01-15 13:06:27',NULL),(1333,13,NULL,'AYOTZINTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1334,13,NULL,'TEOTITLAN DE FLORES MAGON','',NULL,'2019-01-15 13:06:27',NULL),(1335,13,NULL,'TEOTITLAN DEL VALLE','',NULL,'2019-01-15 13:06:27',NULL),(1336,13,NULL,'TEOTONGO','',NULL,'2019-01-15 13:06:27',NULL),(1337,13,NULL,'TEPELMEME VILLA DE MORELOS','',NULL,'2019-01-15 13:06:27',NULL),(1338,13,NULL,'TEZOATLAN DE SEGURA Y LUNA','',NULL,'2019-01-15 13:06:27',NULL),(1339,13,NULL,'TLACOLULA DE MATAMOROS','',NULL,'2019-01-15 13:06:27',NULL),(1340,13,NULL,'TLACOTEPEC PLUMAS','',NULL,'2019-01-15 13:06:27',NULL),(1341,13,NULL,'TLALIXTAC DE CABRERA','',NULL,'2019-01-15 13:06:27',NULL),(1342,13,NULL,'TOTONTEPEC VILLA DE MORELOS','',NULL,'2019-01-15 13:06:27',NULL),(1343,13,NULL,'TRINIDAD VISTA HERMOSA, LA','',NULL,'2019-01-15 13:06:27',NULL),(1344,13,NULL,'TRINIDAD ZAACHILA','',NULL,'2019-01-15 13:06:27',NULL),(1345,13,NULL,'BARRIO DE LA SOLEDAD, EL','',NULL,'2019-01-15 13:06:27',NULL),(1346,13,NULL,'UNION HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(1347,13,NULL,'VALERIO TRUJANO','',NULL,'2019-01-15 13:06:27',NULL),(1348,13,NULL,'VILLA DE CHILAPA DE DIAZ','',NULL,'2019-01-15 13:06:27',NULL),(1349,13,NULL,'VILLA DE ETLA','',NULL,'2019-01-15 13:06:27',NULL),(1350,13,NULL,'VILLA DE TAMAZULAPAM DEL PROGRESO','',NULL,'2019-01-15 13:06:27',NULL),(1351,13,NULL,'VILLA DE TUTUTEPEC DE MELCHOR OCAMPO','',NULL,'2019-01-15 13:06:27',NULL),(1352,13,NULL,'VILLA DE ZAACHILA','',NULL,'2019-01-15 13:06:27',NULL),(1353,13,NULL,'VILLA DIAZ ORDAZ','',NULL,'2019-01-15 13:06:27',NULL),(1354,13,NULL,'VILLA HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(1355,13,NULL,'VILLA SOLA DE VEGA','',NULL,'2019-01-15 13:06:27',NULL),(1356,13,NULL,'VILLA TALEA DE CASTRO','',NULL,'2019-01-15 13:06:27',NULL),(1357,13,NULL,'VILLA TEJUPAM DE LA UNION','',NULL,'2019-01-15 13:06:27',NULL),(1358,13,NULL,'YAXE','',NULL,'2019-01-15 13:06:27',NULL),(1359,13,NULL,'YOGANA','',NULL,'2019-01-15 13:06:27',NULL),(1360,13,NULL,'YUTANDUCHI DE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(1361,13,NULL,'ZAPOTITLAN DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(1362,13,NULL,'ZAPOTITLAN LAGUNAS','',NULL,'2019-01-15 13:06:27',NULL),(1363,13,NULL,'ZAPOTITLAN PALMAS','',NULL,'2019-01-15 13:06:27',NULL),(1364,13,NULL,'ACATLAN DE PEREZ FIGUEROA','',NULL,'2019-01-15 13:06:27',NULL),(1365,13,NULL,'ZIMATLAN DE ALVAREZ','',NULL,'2019-01-15 13:06:27',NULL),(1366,13,NULL,'CALIHUALA','',NULL,'2019-01-15 13:06:27',NULL),(1367,13,NULL,'CANDELARIA LOXICHA','',NULL,'2019-01-15 13:06:27',NULL),(1368,13,NULL,'CAPULALPAM DE MENDEZ','',NULL,'2019-01-15 13:06:27',NULL),(1369,13,NULL,'CHAHUITES','',NULL,'2019-01-15 13:06:27',NULL),(1370,13,NULL,'CHALCATONGO DE HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(1371,13,NULL,'CHIQUIHUITLAN DE BENITO JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(1372,13,NULL,'CIENEGA DE ZIMATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1373,13,NULL,'CIUDAD IXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1374,13,NULL,'COATECAS ALTAS','',NULL,'2019-01-15 13:06:27',NULL),(1375,13,NULL,'COICOYAN DE LAS FLORES','',NULL,'2019-01-15 13:06:27',NULL),(1376,13,NULL,'COMPAÑIA, LA','',NULL,'2019-01-15 13:06:27',NULL),(1377,13,NULL,'CONCEPCION BUENAVISTA','',NULL,'2019-01-15 13:06:27',NULL),(1378,13,NULL,'CONCEPCION PAPALO','',NULL,'2019-01-15 13:06:27',NULL),(1379,13,NULL,'CONSTANCIA DEL ROSARIO','',NULL,'2019-01-15 13:06:27',NULL),(1380,13,NULL,'COSOLAPA','',NULL,'2019-01-15 13:06:27',NULL),(1381,13,NULL,'COSOLTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1382,13,NULL,'CUILAPAM DE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(1383,13,NULL,'CUYAMECALCO VILLA DE ZARAGOZA','',NULL,'2019-01-15 13:06:27',NULL),(1384,13,NULL,'ELOXOCHITLAN DE FLORES MAGON','',NULL,'2019-01-15 13:06:27',NULL),(1385,13,NULL,'ESPINAL, EL','',NULL,'2019-01-15 13:06:27',NULL),(1386,13,NULL,'FRESNILLO DE TRUJANO','',NULL,'2019-01-15 13:06:27',NULL),(1387,13,NULL,'ABEJONES','',NULL,'2019-01-15 13:06:27',NULL),(1388,13,NULL,'GUADALUPE DE RAMIREZ','',NULL,'2019-01-15 13:06:27',NULL),(1389,13,NULL,'GUADALUPE ETLA','',NULL,'2019-01-15 13:06:27',NULL),(1390,13,NULL,'GUELATAO DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(1391,13,NULL,'GUEVEA DE HUMBOLDT','',NULL,'2019-01-15 13:06:27',NULL),(1392,13,NULL,'HEROICA CIUDAD DE EJUTLA DE CRESPO','',NULL,'2019-01-15 13:06:27',NULL),(1393,13,NULL,'HEROICA CIUDAD DE HUAJUAPAM DE LEON','',NULL,'2019-01-15 13:06:27',NULL),(1394,13,NULL,'HEROICA CIUDAD DE TLAXIACO','',NULL,'2019-01-15 13:06:27',NULL),(1395,13,NULL,'HUAUTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1396,13,NULL,'HUAUTLA DE JIMENEZ','',NULL,'2019-01-15 13:06:27',NULL),(1397,13,NULL,'IXPANTEPEC NIEVES','',NULL,'2019-01-15 13:06:27',NULL),(1398,13,NULL,'IXTLAN DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(1399,13,NULL,'JUCHITAN DE ZARAGOZA','',NULL,'2019-01-15 13:06:27',NULL),(1400,13,NULL,'LOMA BONITA','',NULL,'2019-01-15 13:06:27',NULL),(1401,13,NULL,'MAGDALENA APASCO','',NULL,'2019-01-15 13:06:27',NULL),(1402,13,NULL,'MAGDALENA JALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1403,13,NULL,'MAGDALENA MIXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1404,13,NULL,'MAGDALENA OCOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1405,13,NULL,'MAGDALENA PE?ASCO','',NULL,'2019-01-15 13:06:27',NULL),(1406,13,NULL,'MAGDALENA TEITIPAC','',NULL,'2019-01-15 13:06:27',NULL),(1407,13,NULL,'MAGDALENA TEQUISISTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1408,13,NULL,'MAGDALENA TLACOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1409,13,NULL,'MAGDALENA YODOCONO DE PORFIRIO DIAZ','',NULL,'2019-01-15 13:06:27',NULL),(1410,13,NULL,'MAGDALENA ZAHUATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1411,13,NULL,'MARISCALA DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(1412,13,NULL,'MARTIRES DE TACUBAYA','',NULL,'2019-01-15 13:06:27',NULL),(1413,13,NULL,'MATIAS ROMERO','',NULL,'2019-01-15 13:06:27',NULL),(1414,13,NULL,'MAZATLAN VILLA DE FLORES','',NULL,'2019-01-15 13:06:27',NULL),(1415,13,NULL,'MESONES HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(1416,13,NULL,'MIAHUATLAN DE PORFIRIO DIAZ','',NULL,'2019-01-15 13:06:27',NULL),(1417,14,NULL,'MIXTLA','',NULL,'2019-01-15 13:06:27',NULL),(1418,14,NULL,'MOLCAXAC','',NULL,'2019-01-15 13:06:27',NULL),(1419,14,NULL,'AMIXTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1420,14,NULL,'AMOZOC','',NULL,'2019-01-15 13:06:27',NULL),(1421,14,NULL,'NAUPAN','',NULL,'2019-01-15 13:06:27',NULL),(1422,14,NULL,'NAUZONTLA','',NULL,'2019-01-15 13:06:27',NULL),(1423,14,NULL,'NEALTICAN','',NULL,'2019-01-15 13:06:27',NULL),(1424,14,NULL,'NICOLAS BRAVO','',NULL,'2019-01-15 13:06:27',NULL),(1425,14,NULL,'NOPALUCAN','',NULL,'2019-01-15 13:06:27',NULL),(1426,14,NULL,'OCOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1427,14,NULL,'OCOYUCAN','',NULL,'2019-01-15 13:06:27',NULL),(1428,14,NULL,'OLINTLA','',NULL,'2019-01-15 13:06:27',NULL),(1429,14,NULL,'ORIENTAL','',NULL,'2019-01-15 13:06:27',NULL),(1430,14,NULL,'PAHUATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1431,14,NULL,'PALMAR DE BRAVO','',NULL,'2019-01-15 13:06:27',NULL),(1432,14,NULL,'PANTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1433,14,NULL,'PETLALCINGO','',NULL,'2019-01-15 13:06:27',NULL),(1434,14,NULL,'PIAXTLA','',NULL,'2019-01-15 13:06:27',NULL),(1435,14,NULL,'PUEBLA','',NULL,'2019-01-15 13:06:27',NULL),(1436,14,NULL,'QUECHOLAC','',NULL,'2019-01-15 13:06:27',NULL),(1437,14,NULL,'QUIMIXTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1438,14,NULL,'RAFAEL LARA GRAJALES','',NULL,'2019-01-15 13:06:27',NULL),(1439,14,NULL,'REYES DE JUAREZ, LOS','',NULL,'2019-01-15 13:06:27',NULL),(1440,14,NULL,'SAN ANDRES CHOLULA','',NULL,'2019-01-15 13:06:27',NULL),(1441,14,NULL,'SAN ANTONIO CAÑADA','',NULL,'2019-01-15 13:06:27',NULL),(1442,14,NULL,'AQUIXTLA','',NULL,'2019-01-15 13:06:27',NULL),(1443,14,NULL,'SAN DIEGO LA MESA TOCHIMILTZINGO','',NULL,'2019-01-15 13:06:27',NULL),(1444,14,NULL,'SAN FELIPE TEOTLALCINGO','',NULL,'2019-01-15 13:06:27',NULL),(1445,14,NULL,'SAN FELIPE TEPATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1446,14,NULL,'SAN GABRIEL CHILAC','',NULL,'2019-01-15 13:06:27',NULL),(1447,14,NULL,'SAN GREGORIO ATZOMPA','',NULL,'2019-01-15 13:06:27',NULL),(1448,14,NULL,'SAN JERONIMO TECUANIPAN','',NULL,'2019-01-15 13:06:27',NULL),(1449,14,NULL,'SAN JERONIMO XAYACATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1450,14,NULL,'SAN JOSE CHIAPA','',NULL,'2019-01-15 13:06:27',NULL),(1451,14,NULL,'SAN JOSE MIAHUATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1452,14,NULL,'SAN JUAN ATENCO','',NULL,'2019-01-15 13:06:27',NULL),(1453,14,NULL,'SAN JUAN ATZOMPA','',NULL,'2019-01-15 13:06:27',NULL),(1454,14,NULL,'SAN MARTIN TEXMELUCAN','',NULL,'2019-01-15 13:06:27',NULL),(1455,14,NULL,'SAN MARTIN TOTOLTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1456,14,NULL,'SAN MATIAS TLALANCALECA','',NULL,'2019-01-15 13:06:27',NULL),(1457,14,NULL,'SAN MIGUEL IXITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1458,14,NULL,'SAN MIGUEL XOXTLA','',NULL,'2019-01-15 13:06:27',NULL),(1459,14,NULL,'SAN NICOLAS BUENOS AIRES','',NULL,'2019-01-15 13:06:27',NULL),(1460,14,NULL,'SAN NICOLAS DE LOS RANCHOS','',NULL,'2019-01-15 13:06:27',NULL),(1461,14,NULL,'SAN PABLO ANICANO','',NULL,'2019-01-15 13:06:27',NULL),(1462,14,NULL,'ATEMPAN','',NULL,'2019-01-15 13:06:27',NULL),(1463,14,NULL,'SAN PEDRO CHOLULA','',NULL,'2019-01-15 13:06:27',NULL),(1464,14,NULL,'ATEXCAL','',NULL,'2019-01-15 13:06:27',NULL),(1465,14,NULL,'SAN PEDRO YELOIXTLAHUACA','',NULL,'2019-01-15 13:06:27',NULL),(1466,14,NULL,'SAN SALVADOR EL SECO','',NULL,'2019-01-15 13:06:27',NULL),(1467,14,NULL,'SAN SALVADOR EL VERDE','',NULL,'2019-01-15 13:06:27',NULL),(1468,14,NULL,'SAN SALVADOR HUIXCOLOTLA','',NULL,'2019-01-15 13:06:27',NULL),(1469,14,NULL,'SAN SEBASTIAN TLACOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1470,14,NULL,'SANTA CATARINA TLALTEMPAN','',NULL,'2019-01-15 13:06:27',NULL),(1471,14,NULL,'ACATENO','',NULL,'2019-01-15 13:06:27',NULL),(1472,14,NULL,'SANTA INES AHUATEMPAN','',NULL,'2019-01-15 13:06:27',NULL),(1473,14,NULL,'SANTA ISABEL CHOLULA','',NULL,'2019-01-15 13:06:27',NULL),(1474,14,NULL,'ATLEQUIZAYAN','',NULL,'2019-01-15 13:06:27',NULL),(1475,14,NULL,'ATLIXCO','',NULL,'2019-01-15 13:06:27',NULL),(1476,14,NULL,'SANTIAGO MIAHUATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1477,14,NULL,'ATOYATEMPAN','',NULL,'2019-01-15 13:06:27',NULL),(1478,14,NULL,'SANTO TOMAS HUEYOTLIPAN','',NULL,'2019-01-15 13:06:27',NULL),(1479,14,NULL,'ATZALA','',NULL,'2019-01-15 13:06:27',NULL),(1480,14,NULL,'ATZITZIHUACAN','',NULL,'2019-01-15 13:06:27',NULL),(1481,14,NULL,'ATZITZINTLA','',NULL,'2019-01-15 13:06:27',NULL),(1482,14,NULL,'SOLTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1483,14,NULL,'AXUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1484,14,NULL,'TECALI DE HERRERA','',NULL,'2019-01-15 13:06:27',NULL),(1485,14,NULL,'TECAMACHALCO','',NULL,'2019-01-15 13:06:27',NULL),(1486,14,NULL,'TECOMATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1487,14,NULL,'TEHUACAN','',NULL,'2019-01-15 13:06:27',NULL),(1488,14,NULL,'TEHUITZINGO','',NULL,'2019-01-15 13:06:27',NULL),(1489,14,NULL,'TENAMPULCO','',NULL,'2019-01-15 13:06:27',NULL),(1490,14,NULL,'AYOTOXCO DE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(1491,14,NULL,'TEOPANTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1492,14,NULL,'TEOTLALCO','',NULL,'2019-01-15 13:06:27',NULL),(1493,14,NULL,'TEPANCO DE LOPEZ','',NULL,'2019-01-15 13:06:27',NULL),(1494,14,NULL,'TEPANGO DE RODRIGUEZ','',NULL,'2019-01-15 13:06:27',NULL),(1495,14,NULL,'TEPATLAXCO DE HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(1496,14,NULL,'TEPEACA','',NULL,'2019-01-15 13:06:27',NULL),(1497,14,NULL,'TEPEMAXALCO','',NULL,'2019-01-15 13:06:27',NULL),(1498,14,NULL,'TEPEOJUMA','',NULL,'2019-01-15 13:06:27',NULL),(1499,14,NULL,'TEPETZINTLA','',NULL,'2019-01-15 13:06:27',NULL),(1500,14,NULL,'TEPEXCO','',NULL,'2019-01-15 13:06:27',NULL),(1501,14,NULL,'TEPEXI DE RODRIGUEZ','',NULL,'2019-01-15 13:06:27',NULL),(1502,14,NULL,'TEPEYAHUALCO','',NULL,'2019-01-15 13:06:27',NULL),(1503,14,NULL,'TEPEYAHUALCO DE CUAUHTEMOC','',NULL,'2019-01-15 13:06:27',NULL),(1504,14,NULL,'TETELA DE OCAMPO','',NULL,'2019-01-15 13:06:27',NULL),(1505,14,NULL,'TETELES DE AVILA CASTILLO','',NULL,'2019-01-15 13:06:27',NULL),(1506,14,NULL,'TEZIUTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1507,14,NULL,'TIANGUISMANALCO','',NULL,'2019-01-15 13:06:27',NULL),(1508,14,NULL,'TILAPA','',NULL,'2019-01-15 13:06:27',NULL),(1509,14,NULL,'TLACHICHUCA','',NULL,'2019-01-15 13:06:27',NULL),(1510,14,NULL,'TLACOTEPEC DE BENITO JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(1511,14,NULL,'TLACUILOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1512,14,NULL,'TLAHUAPAN','',NULL,'2019-01-15 13:06:27',NULL),(1513,14,NULL,'TLALTENANGO','',NULL,'2019-01-15 13:06:27',NULL),(1514,14,NULL,'TLANEPANTLA','',NULL,'2019-01-15 13:06:27',NULL),(1515,14,NULL,'TLAOLA','',NULL,'2019-01-15 13:06:27',NULL),(1516,14,NULL,'TLAPACOYA','',NULL,'2019-01-15 13:06:27',NULL),(1517,14,NULL,'TLAPANALA','',NULL,'2019-01-15 13:06:27',NULL),(1518,14,NULL,'TLATLAUQUITEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1519,14,NULL,'TLAXCO','',NULL,'2019-01-15 13:06:27',NULL),(1520,14,NULL,'TOCHIMILCO','',NULL,'2019-01-15 13:06:27',NULL),(1521,14,NULL,'TOCHTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1522,14,NULL,'ACATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1523,14,NULL,'TOTOLTEPEC DE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(1524,14,NULL,'TULCINGO','',NULL,'2019-01-15 13:06:27',NULL),(1525,14,NULL,'TUZAMAPAN DE GALEANA','',NULL,'2019-01-15 13:06:27',NULL),(1526,14,NULL,'TZICATLACOYAN','',NULL,'2019-01-15 13:06:27',NULL),(1527,14,NULL,'VENUSTIANO CARRANZA','',NULL,'2019-01-15 13:06:27',NULL),(1528,14,NULL,'VICENTE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(1529,14,NULL,'XAYACATLAN DE BRAVO','',NULL,'2019-01-15 13:06:27',NULL),(1530,14,NULL,'XICOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1531,14,NULL,'XICOTLAN','',NULL,'2019-01-15 13:06:27',NULL),(1532,14,NULL,'XIUTETELCO','',NULL,'2019-01-15 13:06:27',NULL),(1533,14,NULL,'XOCHIAPULCO','',NULL,'2019-01-15 13:06:27',NULL),(1534,14,NULL,'XOCHILTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1535,14,NULL,'XOCHITLAN DE VICENTE SUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(1536,14,NULL,'XOCHITLAN TODOS SANTOS','',NULL,'2019-01-15 13:06:27',NULL),(1537,14,NULL,'YAONAHUAC','',NULL,'2019-01-15 13:06:27',NULL),(1538,14,NULL,'YEHUALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1539,14,NULL,'ZACAPALA','',NULL,'2019-01-15 13:06:27',NULL),(1540,14,NULL,'ZACAPOAXTLA','',NULL,'2019-01-15 13:06:27',NULL),(1541,14,NULL,'ZACATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1542,14,NULL,'ZAPOTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1543,14,NULL,'ZAPOTITLAN DE MENDEZ','',NULL,'2019-01-15 13:06:27',NULL),(1544,14,NULL,'ZARAGOZA','',NULL,'2019-01-15 13:06:27',NULL),(1545,14,NULL,'ZAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1546,14,NULL,'ZIHUATEUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1547,14,NULL,'ZINACATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1548,14,NULL,'ZONGOZOTLA','',NULL,'2019-01-15 13:06:27',NULL),(1549,14,NULL,'ZOQUIAPAN','',NULL,'2019-01-15 13:06:27',NULL),(1550,14,NULL,'ZOQUITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1551,14,NULL,'ACATZINGO','',NULL,'2019-01-15 13:06:27',NULL),(1552,14,NULL,'CALPAN','',NULL,'2019-01-15 13:06:27',NULL),(1553,14,NULL,'CALTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1554,14,NULL,'CAMOCUAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1555,14,NULL,'CAÑADA MORELOS','',NULL,'2019-01-15 13:06:27',NULL),(1556,14,NULL,'ACTEOPAN','',NULL,'2019-01-15 13:06:27',NULL),(1557,14,NULL,'CAXHUACAN','',NULL,'2019-01-15 13:06:27',NULL),(1558,14,NULL,'CHALCHICOMULA DE SESMA','',NULL,'2019-01-15 13:06:27',NULL),(1559,14,NULL,'CHAPULCO','',NULL,'2019-01-15 13:06:27',NULL),(1560,14,NULL,'CHIAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1561,14,NULL,'CHIAUTZINGO','',NULL,'2019-01-15 13:06:27',NULL),(1562,14,NULL,'CHICHIQUILA','',NULL,'2019-01-15 13:06:27',NULL),(1563,14,NULL,'CHICONCUAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1564,14,NULL,'CHIETLA','',NULL,'2019-01-15 13:06:27',NULL),(1565,14,NULL,'CHIGMECATITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1566,14,NULL,'CHIGNAHUAPAN','',NULL,'2019-01-15 13:06:27',NULL),(1567,14,NULL,'CHIGNAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1568,14,NULL,'CHILA','',NULL,'2019-01-15 13:06:27',NULL),(1569,14,NULL,'CHILA DE LA SAL','',NULL,'2019-01-15 13:06:27',NULL),(1570,14,NULL,'CHILCHOTLA','',NULL,'2019-01-15 13:06:27',NULL),(1571,14,NULL,'CHINANTLA','',NULL,'2019-01-15 13:06:27',NULL),(1572,14,NULL,'COATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1573,14,NULL,'COATZINGO','',NULL,'2019-01-15 13:06:27',NULL),(1574,14,NULL,'COHETZALA','',NULL,'2019-01-15 13:06:27',NULL),(1575,14,NULL,'COHUECAN','',NULL,'2019-01-15 13:06:27',NULL),(1576,14,NULL,'AHUACATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1577,14,NULL,'CORONANGO','',NULL,'2019-01-15 13:06:27',NULL),(1578,14,NULL,'COXCATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1579,14,NULL,'COYOMEAPAN','',NULL,'2019-01-15 13:06:27',NULL),(1580,14,NULL,'COYOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1581,14,NULL,'CUAPIAXTLA DE MADERO','',NULL,'2019-01-15 13:06:27',NULL),(1582,14,NULL,'CUAUTEMPAN','',NULL,'2019-01-15 13:06:27',NULL),(1583,14,NULL,'CUAUTINCHAN','',NULL,'2019-01-15 13:06:27',NULL),(1584,14,NULL,'AHUATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1585,14,NULL,'CUAUTLANCINGO','',NULL,'2019-01-15 13:06:27',NULL),(1586,14,NULL,'CUAYUCA DE ANDRADE','',NULL,'2019-01-15 13:06:27',NULL),(1587,14,NULL,'CUETZALAN DEL PROGRESO','',NULL,'2019-01-15 13:06:27',NULL),(1588,14,NULL,'AHUAZOTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1589,14,NULL,'AHUEHUETITLA','',NULL,'2019-01-15 13:06:27',NULL),(1590,14,NULL,'CUYOACO','',NULL,'2019-01-15 13:06:27',NULL),(1591,14,NULL,'DOMINGO ARENAS','',NULL,'2019-01-15 13:06:27',NULL),(1592,14,NULL,'AJALPAN','',NULL,'2019-01-15 13:06:27',NULL),(1593,14,NULL,'ELOXOCHITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1594,14,NULL,'EPATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1595,14,NULL,'ESPERANZA','',NULL,'2019-01-15 13:06:27',NULL),(1596,14,NULL,'FRANCISCO Z. MENA','',NULL,'2019-01-15 13:06:27',NULL),(1597,14,NULL,'ALBINO ZERTUCHE','',NULL,'2019-01-15 13:06:27',NULL),(1598,14,NULL,'GENERAL FELIPE ANGELES','',NULL,'2019-01-15 13:06:27',NULL),(1599,14,NULL,'GUADALUPE','',NULL,'2019-01-15 13:06:27',NULL),(1600,14,NULL,'GUADALUPE VICTORIA','',NULL,'2019-01-15 13:06:27',NULL),(1601,14,NULL,'HERMENEGILDO GALEANA','',NULL,'2019-01-15 13:06:27',NULL),(1602,14,NULL,'ALJOJUCA','',NULL,'2019-01-15 13:06:27',NULL),(1603,14,NULL,'HONEY','',NULL,'2019-01-15 13:06:27',NULL),(1604,14,NULL,'HUAQUECHULA','',NULL,'2019-01-15 13:06:27',NULL),(1605,14,NULL,'HUATLATLAUCA','',NULL,'2019-01-15 13:06:27',NULL),(1606,14,NULL,'HUAUCHINANGO','',NULL,'2019-01-15 13:06:27',NULL),(1607,14,NULL,'HUEHUETLA','',NULL,'2019-01-15 13:06:27',NULL),(1608,14,NULL,'HUEHUETLAN EL CHICO','',NULL,'2019-01-15 13:06:27',NULL),(1609,14,NULL,'HUEHUETLAN EL GRANDE','',NULL,'2019-01-15 13:06:27',NULL),(1610,14,NULL,'HUEJOTZINGO','',NULL,'2019-01-15 13:06:27',NULL),(1611,14,NULL,'HUEYAPAN','',NULL,'2019-01-15 13:06:27',NULL),(1612,14,NULL,'HUEYTAMALCO','',NULL,'2019-01-15 13:06:27',NULL),(1613,14,NULL,'HUEYTLALPAN','',NULL,'2019-01-15 13:06:27',NULL),(1614,14,NULL,'HUITZILAN DE SERDAN','',NULL,'2019-01-15 13:06:27',NULL),(1615,14,NULL,'HUITZILTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1616,14,NULL,'IXCAMILPA DE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(1617,14,NULL,'IXCAQUIXTLA','',NULL,'2019-01-15 13:06:27',NULL),(1618,14,NULL,'IXTACAMAXTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1619,14,NULL,'IXTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1620,14,NULL,'IZUCAR DE MATAMOROS','',NULL,'2019-01-15 13:06:27',NULL),(1621,14,NULL,'ACAJETE','',NULL,'2019-01-15 13:06:27',NULL),(1622,14,NULL,'JALPAN','',NULL,'2019-01-15 13:06:27',NULL),(1623,14,NULL,'ALTEPEXI','',NULL,'2019-01-15 13:06:27',NULL),(1624,14,NULL,'JOLALPAN','',NULL,'2019-01-15 13:06:27',NULL),(1625,14,NULL,'JONOTLA','',NULL,'2019-01-15 13:06:27',NULL),(1626,14,NULL,'JOPALA','',NULL,'2019-01-15 13:06:27',NULL),(1627,14,NULL,'JUAN C. BONILLA','',NULL,'2019-01-15 13:06:27',NULL),(1628,14,NULL,'JUAN GALINDO','',NULL,'2019-01-15 13:06:27',NULL),(1629,14,NULL,'JUAN N. MENDEZ','',NULL,'2019-01-15 13:06:27',NULL),(1630,14,NULL,'LAFRAGUA','',NULL,'2019-01-15 13:06:27',NULL),(1631,14,NULL,'LIBRES','',NULL,'2019-01-15 13:06:27',NULL),(1632,14,NULL,'MAGDALENA TLATLAUQUITEPEC, LA','',NULL,'2019-01-15 13:06:27',NULL),(1633,14,NULL,'MAZAPILTEPEC DE JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(1634,15,NULL,'AMEALCO DE BONFIL','',NULL,'2019-01-15 13:06:27',NULL),(1635,15,NULL,'PEDRO ESCOBEDO','',NULL,'2019-01-15 13:06:27',NULL),(1636,15,NULL,'PEÑAMILLER','',NULL,'2019-01-15 13:06:27',NULL),(1637,15,NULL,'PINAL DE AMOLES','',NULL,'2019-01-15 13:06:27',NULL),(1638,15,NULL,'QUERETARO','',NULL,'2019-01-15 13:06:27',NULL),(1639,15,NULL,'SAN JOAQUIN','',NULL,'2019-01-15 13:06:27',NULL),(1640,15,NULL,'ARROYO SECO','',NULL,'2019-01-15 13:06:27',NULL),(1641,15,NULL,'SAN JUAN DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(1642,15,NULL,'TEQUISQUIAPAN','',NULL,'2019-01-15 13:06:27',NULL),(1643,15,NULL,'TOLIMAN','',NULL,'2019-01-15 13:06:27',NULL),(1644,15,NULL,'CADEREYTA DE MONTES','',NULL,'2019-01-15 13:06:27',NULL),(1645,15,NULL,'COLON','',NULL,'2019-01-15 13:06:27',NULL),(1646,15,NULL,'CORREGIDORA','',NULL,'2019-01-15 13:06:27',NULL),(1647,15,NULL,'EZEQUIEL MONTES','',NULL,'2019-01-15 13:06:27',NULL),(1648,15,NULL,'HUIMILPAN','',NULL,'2019-01-15 13:06:27',NULL),(1649,15,NULL,'JALPAN DE SERRA','',NULL,'2019-01-15 13:06:27',NULL),(1650,15,NULL,'LANDA DE MATAMOROS','',NULL,'2019-01-15 13:06:27',NULL),(1651,15,NULL,'MARQUES, EL','',NULL,'2019-01-15 13:06:27',NULL),(1652,16,NULL,'OTHON P. BLANCO','',NULL,'2019-01-15 13:06:27',NULL),(1653,16,NULL,'SOLIDARIDAD','',NULL,'2019-01-15 13:06:27',NULL),(1654,16,NULL,'BENITO JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(1655,16,NULL,'CHETUMAL','',NULL,'2019-01-15 13:06:27',NULL),(1656,16,NULL,'COZUMEL','',NULL,'2019-01-15 13:06:27',NULL),(1657,16,NULL,'FELIPE CARRILLO PUERTO','',NULL,'2019-01-15 13:06:27',NULL),(1658,16,NULL,'ISLA MUJERES','',NULL,'2019-01-15 13:06:27',NULL),(1659,16,NULL,'JOSE MARIA MORELOS','',NULL,'2019-01-15 13:06:27',NULL),(1660,16,NULL,'LAZARO CARDENAS','',NULL,'2019-01-15 13:06:27',NULL),(1661,17,NULL,'MOCTEZUMA','',NULL,'2019-01-15 13:06:27',NULL),(1662,17,NULL,'NARANJO, EL','',NULL,'2019-01-15 13:06:27',NULL),(1663,17,NULL,'RAYON','',NULL,'2019-01-15 13:06:27',NULL),(1664,17,NULL,'RIOVERDE','',NULL,'2019-01-15 13:06:27',NULL),(1665,17,NULL,'SALINAS','',NULL,'2019-01-15 13:06:27',NULL),(1666,17,NULL,'SAN ANTONIO','',NULL,'2019-01-15 13:06:27',NULL),(1667,17,NULL,'AQUISMON','',NULL,'2019-01-15 13:06:27',NULL),(1668,17,NULL,'SAN CIRO DE ACOSTA','',NULL,'2019-01-15 13:06:27',NULL),(1669,17,NULL,'ARMADILLO DE LOS INFANTE','',NULL,'2019-01-15 13:06:27',NULL),(1670,17,NULL,'SAN LUIS POTOSI','',NULL,'2019-01-15 13:06:27',NULL),(1671,17,NULL,'SAN MARTIN CHALCHICUAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1672,17,NULL,'SAN NICOLAS TOLENTINO','',NULL,'2019-01-15 13:06:27',NULL),(1673,17,NULL,'SAN VICENTE TANCUAYALAB','',NULL,'2019-01-15 13:06:27',NULL),(1674,17,NULL,'SANTA CATARINA','',NULL,'2019-01-15 13:06:27',NULL),(1675,17,NULL,'SANTA MARIA DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(1676,17,NULL,'SANTO DOMINGO','',NULL,'2019-01-15 13:06:27',NULL),(1677,17,NULL,'SOLEDAD DE GRACIANO SANCHEZ','',NULL,'2019-01-15 13:06:27',NULL),(1678,17,NULL,'TAMASOPO','',NULL,'2019-01-15 13:06:27',NULL),(1679,17,NULL,'TAMAZUNCHALE','',NULL,'2019-01-15 13:06:27',NULL),(1680,17,NULL,'TAMPACAN','',NULL,'2019-01-15 13:06:27',NULL),(1681,17,NULL,'TAMPAMOLON CORONA','',NULL,'2019-01-15 13:06:27',NULL),(1682,17,NULL,'TAMUIN','',NULL,'2019-01-15 13:06:27',NULL),(1683,17,NULL,'TANCANHUITZ DE SANTOS','',NULL,'2019-01-15 13:06:27',NULL),(1684,17,NULL,'AXTLA DE TERRAZAS','',NULL,'2019-01-15 13:06:27',NULL),(1685,17,NULL,'TANLAJAS','',NULL,'2019-01-15 13:06:27',NULL),(1686,17,NULL,'TANQUIAN DE ESCOBEDO','',NULL,'2019-01-15 13:06:27',NULL),(1687,17,NULL,'TIERRANUEVA','',NULL,'2019-01-15 13:06:27',NULL),(1688,17,NULL,'VANEGAS','',NULL,'2019-01-15 13:06:27',NULL),(1689,17,NULL,'VENADO','',NULL,'2019-01-15 13:06:27',NULL),(1690,17,NULL,'VILLA DE ARISTA','',NULL,'2019-01-15 13:06:27',NULL),(1691,17,NULL,'VILLA DE ARRIAGA','',NULL,'2019-01-15 13:06:27',NULL),(1692,17,NULL,'VILLA DE GUADALUPE','',NULL,'2019-01-15 13:06:27',NULL),(1693,17,NULL,'VILLA DE LA PAZ','',NULL,'2019-01-15 13:06:27',NULL),(1694,17,NULL,'VILLA DE RAMOS','',NULL,'2019-01-15 13:06:27',NULL),(1695,17,NULL,'VILLA DE REYES','',NULL,'2019-01-15 13:06:27',NULL),(1696,17,NULL,'VILLA HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(1697,17,NULL,'VILLA JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(1698,17,NULL,'XILITLA','',NULL,'2019-01-15 13:06:27',NULL),(1699,17,NULL,'ZARAGOZA','',NULL,'2019-01-15 13:06:27',NULL),(1700,17,NULL,'CARDENAS','',NULL,'2019-01-15 13:06:27',NULL),(1701,17,NULL,'CATORCE','',NULL,'2019-01-15 13:06:27',NULL),(1702,17,NULL,'CEDRAL','',NULL,'2019-01-15 13:06:27',NULL),(1703,17,NULL,'CERRITOS','',NULL,'2019-01-15 13:06:27',NULL),(1704,17,NULL,'CERRO DE SAN PEDRO','',NULL,'2019-01-15 13:06:27',NULL),(1705,17,NULL,'CHARCAS','',NULL,'2019-01-15 13:06:27',NULL),(1706,17,NULL,'CIUDAD DEL MAIZ','',NULL,'2019-01-15 13:06:27',NULL),(1707,17,NULL,'CIUDAD FERNANDEZ','',NULL,'2019-01-15 13:06:27',NULL),(1708,17,NULL,'CIUDAD VALLES','',NULL,'2019-01-15 13:06:27',NULL),(1709,17,NULL,'COXCATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1710,17,NULL,'AHUALULCO','',NULL,'2019-01-15 13:06:27',NULL),(1711,17,NULL,'EBANO','',NULL,'2019-01-15 13:06:27',NULL),(1712,17,NULL,'ALAQUINES','',NULL,'2019-01-15 13:06:27',NULL),(1713,17,NULL,'GUADALCAZAR','',NULL,'2019-01-15 13:06:27',NULL),(1714,17,NULL,'HUEHUETLAN','',NULL,'2019-01-15 13:06:27',NULL),(1715,17,NULL,'LAGUNILLAS','',NULL,'2019-01-15 13:06:27',NULL),(1716,17,NULL,'MATEHUALA','',NULL,'2019-01-15 13:06:27',NULL),(1717,17,NULL,'MATLAPA','',NULL,'2019-01-15 13:06:27',NULL),(1718,17,NULL,'MEXQUITIC DE CARMONA','',NULL,'2019-01-15 13:06:27',NULL),(1719,18,NULL,'MOCORITO','',NULL,'2019-01-15 13:06:27',NULL),(1720,18,NULL,'NAVOLATO','',NULL,'2019-01-15 13:06:27',NULL),(1721,18,NULL,'ANGOSTURA','',NULL,'2019-01-15 13:06:27',NULL),(1722,18,NULL,'ROSARIO','',NULL,'2019-01-15 13:06:27',NULL),(1723,18,NULL,'SALVADOR ALVARADO','',NULL,'2019-01-15 13:06:27',NULL),(1724,18,NULL,'SAN IGNACIO','',NULL,'2019-01-15 13:06:27',NULL),(1725,18,NULL,'SINALOA','',NULL,'2019-01-15 13:06:27',NULL),(1726,18,NULL,'BADIRAGUATO','',NULL,'2019-01-15 13:06:27',NULL),(1727,18,NULL,'CHOIX','',NULL,'2019-01-15 13:06:27',NULL),(1728,18,NULL,'CONCORDIA','',NULL,'2019-01-15 13:06:27',NULL),(1729,18,NULL,'AHOME','',NULL,'2019-01-15 13:06:27',NULL),(1730,18,NULL,'COSALA','',NULL,'2019-01-15 13:06:27',NULL),(1731,18,NULL,'CULIACAN','',NULL,'2019-01-15 13:06:27',NULL),(1732,18,NULL,'ELOTA','',NULL,'2019-01-15 13:06:27',NULL),(1733,18,NULL,'ESCUINAPA','',NULL,'2019-01-15 13:06:27',NULL),(1734,18,NULL,'FUERTE, EL','',NULL,'2019-01-15 13:06:27',NULL),(1735,18,NULL,'GUASAVE','',NULL,'2019-01-15 13:06:27',NULL),(1736,18,NULL,'MAZATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1737,19,NULL,'MOCTEZUMA','',NULL,'2019-01-15 13:06:27',NULL),(1738,19,NULL,'NACO','',NULL,'2019-01-15 13:06:27',NULL),(1739,19,NULL,'NACORI CHICO','',NULL,'2019-01-15 13:06:27',NULL),(1740,19,NULL,'NACOZARI DE GARCIA','',NULL,'2019-01-15 13:06:27',NULL),(1741,19,NULL,'NAVOJOA','',NULL,'2019-01-15 13:06:27',NULL),(1742,19,NULL,'NOGALES','',NULL,'2019-01-15 13:06:27',NULL),(1743,19,NULL,'ONAVAS','',NULL,'2019-01-15 13:06:27',NULL),(1744,19,NULL,'OPODEPE','',NULL,'2019-01-15 13:06:27',NULL),(1745,19,NULL,'OQUITOA','',NULL,'2019-01-15 13:06:27',NULL),(1746,19,NULL,'PITIQUITO','',NULL,'2019-01-15 13:06:27',NULL),(1747,19,NULL,'PUERTO PE?ASCO','',NULL,'2019-01-15 13:06:27',NULL),(1748,19,NULL,'QUIRIEGO','',NULL,'2019-01-15 13:06:27',NULL),(1749,19,NULL,'RAYON','',NULL,'2019-01-15 13:06:27',NULL),(1750,19,NULL,'ROSARIO','',NULL,'2019-01-15 13:06:27',NULL),(1751,19,NULL,'SAHUARIPA','',NULL,'2019-01-15 13:06:27',NULL),(1752,19,NULL,'SAN FELIPE DE JESUS','',NULL,'2019-01-15 13:06:27',NULL),(1753,19,NULL,'ARIVECHI','',NULL,'2019-01-15 13:06:27',NULL),(1754,19,NULL,'SAN JAVIER','',NULL,'2019-01-15 13:06:27',NULL),(1755,19,NULL,'ARIZPE','',NULL,'2019-01-15 13:06:27',NULL),(1756,19,NULL,'SAN LUIS RIO COLORADO','',NULL,'2019-01-15 13:06:27',NULL),(1757,19,NULL,'SAN MIGUEL DE HORCASITAS','',NULL,'2019-01-15 13:06:27',NULL),(1758,19,NULL,'SAN PEDRO DE LA CUEVA','',NULL,'2019-01-15 13:06:27',NULL),(1759,19,NULL,'ATIL','',NULL,'2019-01-15 13:06:27',NULL),(1760,19,NULL,'SANTA ANA','',NULL,'2019-01-15 13:06:27',NULL),(1761,19,NULL,'SANTA CRUZ','',NULL,'2019-01-15 13:06:27',NULL),(1762,19,NULL,'SARIC','',NULL,'2019-01-15 13:06:27',NULL),(1763,19,NULL,'SOYOPA','',NULL,'2019-01-15 13:06:27',NULL),(1764,19,NULL,'SUAQUI GRANDE','',NULL,'2019-01-15 13:06:27',NULL),(1765,19,NULL,'TEPACHE','',NULL,'2019-01-15 13:06:27',NULL),(1766,19,NULL,'BACADEHUACHI','',NULL,'2019-01-15 13:06:27',NULL),(1767,19,NULL,'BACANORA','',NULL,'2019-01-15 13:06:27',NULL),(1768,19,NULL,'BACERAC','',NULL,'2019-01-15 13:06:27',NULL),(1769,19,NULL,'BACOACHI','',NULL,'2019-01-15 13:06:27',NULL),(1770,19,NULL,'BACUM','',NULL,'2019-01-15 13:06:27',NULL),(1771,19,NULL,'BANAMICHI','',NULL,'2019-01-15 13:06:27',NULL),(1772,19,NULL,'TRINCHERAS','',NULL,'2019-01-15 13:06:27',NULL),(1773,19,NULL,'TUBUTAMA','',NULL,'2019-01-15 13:06:27',NULL),(1774,19,NULL,'BAVIACORA','',NULL,'2019-01-15 13:06:27',NULL),(1775,19,NULL,'BAVISPE','',NULL,'2019-01-15 13:06:27',NULL),(1776,19,NULL,'URES','',NULL,'2019-01-15 13:06:27',NULL),(1777,19,NULL,'VILLA HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(1778,19,NULL,'VILLA PESQUEIRA','',NULL,'2019-01-15 13:06:27',NULL),(1779,19,NULL,'BENJAMIN HILL','',NULL,'2019-01-15 13:06:27',NULL),(1780,19,NULL,'YECORA','',NULL,'2019-01-15 13:06:27',NULL),(1781,19,NULL,'CABORCA','',NULL,'2019-01-15 13:06:27',NULL),(1782,19,NULL,'CAJEME','',NULL,'2019-01-15 13:06:27',NULL),(1783,19,NULL,'CANANEA','',NULL,'2019-01-15 13:06:27',NULL),(1784,19,NULL,'CARBO','',NULL,'2019-01-15 13:06:27',NULL),(1785,19,NULL,'ACONCHI','',NULL,'2019-01-15 13:06:27',NULL),(1786,19,NULL,'AGUA PRIETA','',NULL,'2019-01-15 13:06:27',NULL),(1787,19,NULL,'COLORADA, LA','',NULL,'2019-01-15 13:06:27',NULL),(1788,19,NULL,'CUCURPE','',NULL,'2019-01-15 13:06:27',NULL),(1789,19,NULL,'CUMPAS','',NULL,'2019-01-15 13:06:27',NULL),(1790,19,NULL,'DIVISADEROS','',NULL,'2019-01-15 13:06:27',NULL),(1791,19,NULL,'EMPALME','',NULL,'2019-01-15 13:06:27',NULL),(1792,19,NULL,'ETCHOJOA','',NULL,'2019-01-15 13:06:27',NULL),(1793,19,NULL,'ALAMOS','',NULL,'2019-01-15 13:06:27',NULL),(1794,19,NULL,'FRONTERAS','',NULL,'2019-01-15 13:06:27',NULL),(1795,19,NULL,'GENERAL PLUTARCO ELIAS CALLES','',NULL,'2019-01-15 13:06:27',NULL),(1796,19,NULL,'GRANADOS','',NULL,'2019-01-15 13:06:27',NULL),(1797,19,NULL,'GUAYMAS','',NULL,'2019-01-15 13:06:27',NULL),(1798,19,NULL,'HERMOSILLO','',NULL,'2019-01-15 13:06:27',NULL),(1799,19,NULL,'HUACHINERA','',NULL,'2019-01-15 13:06:27',NULL),(1800,19,NULL,'HUASABAS','',NULL,'2019-01-15 13:06:27',NULL),(1801,19,NULL,'HUATABAMPO','',NULL,'2019-01-15 13:06:27',NULL),(1802,19,NULL,'HUEPAC','',NULL,'2019-01-15 13:06:27',NULL),(1803,19,NULL,'IMURIS','',NULL,'2019-01-15 13:06:27',NULL),(1804,19,NULL,'ALTAR','',NULL,'2019-01-15 13:06:27',NULL),(1805,19,NULL,'MAGDALENA','',NULL,'2019-01-15 13:06:27',NULL),(1806,19,NULL,'MAZATAN','',NULL,'2019-01-15 13:06:27',NULL),(1807,20,NULL,'NACAJUCA','',NULL,'2019-01-15 13:06:27',NULL),(1808,20,NULL,'PARAISO','',NULL,'2019-01-15 13:06:27',NULL),(1809,20,NULL,'TACOTALPA','',NULL,'2019-01-15 13:06:27',NULL),(1810,20,NULL,'TEAPA','',NULL,'2019-01-15 13:06:27',NULL),(1811,20,NULL,'TENOSIQUE','',NULL,'2019-01-15 13:06:27',NULL),(1812,20,NULL,'BALANCAN','',NULL,'2019-01-15 13:06:27',NULL),(1813,20,NULL,'VILLA HERMOSA','',NULL,'2019-01-15 13:06:27',NULL),(1814,20,NULL,'CARDENAS','',NULL,'2019-01-15 13:06:27',NULL),(1815,20,NULL,'CENTLA','',NULL,'2019-01-15 13:06:27',NULL),(1816,20,NULL,'CENTRO','',NULL,'2019-01-15 13:06:27',NULL),(1817,20,NULL,'COMALCALCO','',NULL,'2019-01-15 13:06:27',NULL),(1818,20,NULL,'CUNDUACAN','',NULL,'2019-01-15 13:06:27',NULL),(1819,20,NULL,'EMILIANO ZAPATA','',NULL,'2019-01-15 13:06:27',NULL),(1820,20,NULL,'HUIMANGUILLO','',NULL,'2019-01-15 13:06:27',NULL),(1821,20,NULL,'JALAPA','',NULL,'2019-01-15 13:06:27',NULL),(1822,20,NULL,'JALPA DE MENDEZ','',NULL,'2019-01-15 13:06:27',NULL),(1823,20,NULL,'JONUTA','',NULL,'2019-01-15 13:06:27',NULL),(1824,20,NULL,'MACUSPANA','',NULL,'2019-01-15 13:06:27',NULL),(1825,21,NULL,'MIQUIHUANA','',NULL,'2019-01-15 13:06:27',NULL),(1826,21,NULL,'NUEVO LAREDO','',NULL,'2019-01-15 13:06:27',NULL),(1827,21,NULL,'NUEVO MORELOS','',NULL,'2019-01-15 13:06:27',NULL),(1828,21,NULL,'OCAMPO','',NULL,'2019-01-15 13:06:27',NULL),(1829,21,NULL,'ANTIGUO MORELOS','',NULL,'2019-01-15 13:06:27',NULL),(1830,21,NULL,'PADILLA','',NULL,'2019-01-15 13:06:27',NULL),(1831,21,NULL,'PALMILLAS','',NULL,'2019-01-15 13:06:27',NULL),(1832,21,NULL,'REYNOSA','',NULL,'2019-01-15 13:06:27',NULL),(1833,21,NULL,'RIO BRAVO','',NULL,'2019-01-15 13:06:27',NULL),(1834,21,NULL,'SAN CARLOS','',NULL,'2019-01-15 13:06:27',NULL),(1835,21,NULL,'SAN FERNANDO','',NULL,'2019-01-15 13:06:27',NULL),(1836,21,NULL,'SAN NICOLAS','',NULL,'2019-01-15 13:06:27',NULL),(1837,21,NULL,'SOTO LA MARINA','',NULL,'2019-01-15 13:06:27',NULL),(1838,21,NULL,'TAMPICO','',NULL,'2019-01-15 13:06:27',NULL),(1839,21,NULL,'ABASOLO','',NULL,'2019-01-15 13:06:27',NULL),(1840,21,NULL,'TULA','',NULL,'2019-01-15 13:06:27',NULL),(1841,21,NULL,'VALLE HERMOSO','',NULL,'2019-01-15 13:06:27',NULL),(1842,21,NULL,'VICTORIA','',NULL,'2019-01-15 13:06:27',NULL),(1843,21,NULL,'VILLAGRAN','',NULL,'2019-01-15 13:06:27',NULL),(1844,21,NULL,'XICOTENCATL','',NULL,'2019-01-15 13:06:27',NULL),(1845,21,NULL,'BURGOS','',NULL,'2019-01-15 13:06:27',NULL),(1846,21,NULL,'BUSTAMANTE','',NULL,'2019-01-15 13:06:27',NULL),(1847,21,NULL,'CAMARGO','',NULL,'2019-01-15 13:06:27',NULL),(1848,21,NULL,'CASAS','',NULL,'2019-01-15 13:06:27',NULL),(1849,21,NULL,'CIUDAD MADERO','',NULL,'2019-01-15 13:06:27',NULL),(1850,21,NULL,'CRUILLAS','',NULL,'2019-01-15 13:06:27',NULL),(1851,21,NULL,'GOMEZ FARIAS','',NULL,'2019-01-15 13:06:27',NULL),(1852,21,NULL,'GONZALEZ','',NULL,'2019-01-15 13:06:27',NULL),(1853,21,NULL,'ALDAMA','',NULL,'2019-01-15 13:06:27',NULL),(1854,21,NULL,'GUEMEZ','',NULL,'2019-01-15 13:06:27',NULL),(1855,21,NULL,'GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(1856,21,NULL,'GUSTAVO DIAZ ORDAZ','',NULL,'2019-01-15 13:06:27',NULL),(1857,21,NULL,'HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(1858,21,NULL,'ALTAMIRA','',NULL,'2019-01-15 13:06:27',NULL),(1859,21,NULL,'JAUMAVE','',NULL,'2019-01-15 13:06:27',NULL),(1860,21,NULL,'JIMENEZ','',NULL,'2019-01-15 13:06:27',NULL),(1861,21,NULL,'LLERA','',NULL,'2019-01-15 13:06:27',NULL),(1862,21,NULL,'MAINERO','',NULL,'2019-01-15 13:06:27',NULL),(1863,21,NULL,'MANTE, EL','',NULL,'2019-01-15 13:06:27',NULL),(1864,21,NULL,'MATAMOROS','',NULL,'2019-01-15 13:06:27',NULL),(1865,21,NULL,'MENDEZ','',NULL,'2019-01-15 13:06:27',NULL),(1866,21,NULL,'MIER','',NULL,'2019-01-15 13:06:27',NULL),(1867,21,NULL,'MIGUEL ALEMAN','',NULL,'2019-01-15 13:06:27',NULL),(1868,22,NULL,'AMAXAC DE GUERRERO','',NULL,'2019-01-15 13:06:27',NULL),(1869,22,NULL,'MU?OZ DE DOMINGO ARENAS','',NULL,'2019-01-15 13:06:27',NULL),(1870,22,NULL,'NANACAMILPA DE MARIANO ARISTA','',NULL,'2019-01-15 13:06:27',NULL),(1871,22,NULL,'NATIVITAS','',NULL,'2019-01-15 13:06:27',NULL),(1872,22,NULL,'PANOTLA','',NULL,'2019-01-15 13:06:27',NULL),(1873,22,NULL,'PAPALOTLA DE XICOHTENCATL','',NULL,'2019-01-15 13:06:27',NULL),(1874,22,NULL,'APETATITLAN DE ANTONIO CARVAJAL','',NULL,'2019-01-15 13:06:27',NULL),(1875,22,NULL,'APIZACO','',NULL,'2019-01-15 13:06:27',NULL),(1876,22,NULL,'SAN DAMIAN TEXOLOC','',NULL,'2019-01-15 13:06:27',NULL),(1877,22,NULL,'SAN FRANCISCO TETLANOHCAN','',NULL,'2019-01-15 13:06:27',NULL),(1878,22,NULL,'SAN JERONIMO ZACUALPAN','',NULL,'2019-01-15 13:06:27',NULL),(1879,22,NULL,'SAN JOSE TEACALCO','',NULL,'2019-01-15 13:06:27',NULL),(1880,22,NULL,'SAN JUAN HUACTZINCO','',NULL,'2019-01-15 13:06:27',NULL),(1881,22,NULL,'SAN LORENZO AXOCOMANITLA','',NULL,'2019-01-15 13:06:27',NULL),(1882,22,NULL,'SAN LUCAS TECOPILCO','',NULL,'2019-01-15 13:06:27',NULL),(1883,22,NULL,'SAN PABLO DEL MONTE','',NULL,'2019-01-15 13:06:27',NULL),(1884,22,NULL,'SANCTORUM DE LAZARO CARDENAS','',NULL,'2019-01-15 13:06:27',NULL),(1885,22,NULL,'SANTA ANA NOPALUCAN','',NULL,'2019-01-15 13:06:27',NULL),(1886,22,NULL,'SANTA APOLONIA TEACALCO','',NULL,'2019-01-15 13:06:27',NULL),(1887,22,NULL,'SANTA CATARINA AYOMETLA','',NULL,'2019-01-15 13:06:27',NULL),(1888,22,NULL,'SANTA CRUZ QUILEHTLA','',NULL,'2019-01-15 13:06:27',NULL),(1889,22,NULL,'SANTA CRUZ TLAXCALA','',NULL,'2019-01-15 13:06:27',NULL),(1890,22,NULL,'ATLANGATEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1891,22,NULL,'SANTA ISABEL XILOXOXTLA','',NULL,'2019-01-15 13:06:27',NULL),(1892,22,NULL,'TENANCINGO','',NULL,'2019-01-15 13:06:27',NULL),(1893,22,NULL,'TEOLOCHOLCO','',NULL,'2019-01-15 13:06:27',NULL),(1894,22,NULL,'TEPETITLA DE LARDIZABAL','',NULL,'2019-01-15 13:06:27',NULL),(1895,22,NULL,'TEPEYANCO','',NULL,'2019-01-15 13:06:27',NULL),(1896,22,NULL,'TERRENATE','',NULL,'2019-01-15 13:06:27',NULL),(1897,22,NULL,'TETLA DE LA SOLIDARIDAD','',NULL,'2019-01-15 13:06:27',NULL),(1898,22,NULL,'TETLATLAHUCA','',NULL,'2019-01-15 13:06:27',NULL),(1899,22,NULL,'TLAXCALA','',NULL,'2019-01-15 13:06:27',NULL),(1900,22,NULL,'TLAXCO','',NULL,'2019-01-15 13:06:27',NULL),(1901,22,NULL,'TOCATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1902,22,NULL,'TOTOLAC','',NULL,'2019-01-15 13:06:27',NULL),(1903,22,NULL,'TZOMPANTEPEC','',NULL,'2019-01-15 13:06:27',NULL),(1904,22,NULL,'BENITO JUAREZ','',NULL,'2019-01-15 13:06:27',NULL),(1905,22,NULL,'XALOSTOC','',NULL,'2019-01-15 13:06:27',NULL),(1906,22,NULL,'XALTOCAN','',NULL,'2019-01-15 13:06:27',NULL),(1907,22,NULL,'XICOHTZINCO','',NULL,'2019-01-15 13:06:27',NULL),(1908,22,NULL,'YAUHQUEMECAN','',NULL,'2019-01-15 13:06:27',NULL),(1909,22,NULL,'ZACATELCO','',NULL,'2019-01-15 13:06:27',NULL),(1910,22,NULL,'ZITLALTEPEC DE TRINIDAD SANCHEZ SANTOS','',NULL,'2019-01-15 13:06:27',NULL),(1911,22,NULL,'CALPULALPAN','',NULL,'2019-01-15 13:06:27',NULL),(1912,22,NULL,'CARMEN TEQUEXQUITLA, EL','',NULL,'2019-01-15 13:06:27',NULL),(1913,22,NULL,'ACUAMANALA DE MIGUEL HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(1914,22,NULL,'CHIAUTEMPAN','',NULL,'2019-01-15 13:06:27',NULL),(1915,22,NULL,'CONTLA DE JUAN CUAMATZI','',NULL,'2019-01-15 13:06:27',NULL),(1916,22,NULL,'CUAPIAXTLA','',NULL,'2019-01-15 13:06:27',NULL),(1917,22,NULL,'CUAXOMULCO','',NULL,'2019-01-15 13:06:27',NULL),(1918,22,NULL,'EMILIANO ZAPATA','',NULL,'2019-01-15 13:06:27',NULL),(1919,22,NULL,'ESPA?ITA','',NULL,'2019-01-15 13:06:27',NULL),(1920,22,NULL,'HUAMANTLA','',NULL,'2019-01-15 13:06:27',NULL),(1921,22,NULL,'HUEYOTLIPAN','',NULL,'2019-01-15 13:06:27',NULL),(1922,22,NULL,'IXTACUIXTLA DE MARIANO MATAMOROS','',NULL,'2019-01-15 13:06:27',NULL),(1923,22,NULL,'IXTENCO','',NULL,'2019-01-15 13:06:27',NULL),(1924,22,NULL,'ALTZAYANCA','',NULL,'2019-01-15 13:06:27',NULL),(1925,22,NULL,'LAZARO CARDENAS','',NULL,'2019-01-15 13:06:27',NULL),(1926,22,NULL,'MAGDALENA TLALTELULCO, LA','',NULL,'2019-01-15 13:06:27',NULL),(1927,22,NULL,'MAZATECOCHCO DE JOSE MARIA MORELOS','',NULL,'2019-01-15 13:06:27',NULL),(1928,23,NULL,'MULEGE','',NULL,'2019-01-15 13:06:27',NULL),(1929,23,NULL,'PAZ, LA','',NULL,'2019-01-15 13:06:27',NULL),(1930,23,NULL,'CABOS, LOS','',NULL,'2019-01-15 13:06:27',NULL),(1931,23,NULL,'COMONDU','',NULL,'2019-01-15 13:06:27',NULL),(1932,23,NULL,'LORETO','',NULL,'2019-01-15 13:06:27',NULL),(1933,24,NULL,'MISANTLA','',NULL,'2019-01-15 13:06:27',NULL),(1934,24,NULL,'MIXTLA DE ALTAMIRANO','',NULL,'2019-01-15 13:06:27',NULL),(1935,24,NULL,'MOLOACAN','',NULL,'2019-01-15 13:06:27',NULL),(1936,24,NULL,'NANCHITAL DE LAZARO CARDENAS DEL RIO','',NULL,'2019-01-15 13:06:27',NULL),(1937,24,NULL,'NAOLINCO','',NULL,'2019-01-15 13:06:27',NULL),(1938,24,NULL,'NARANJAL','',NULL,'2019-01-15 13:06:27',NULL),(1939,24,NULL,'NAUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1940,24,NULL,'NOGALES','',NULL,'2019-01-15 13:06:27',NULL),(1941,24,NULL,'ANGEL R. CABADA','',NULL,'2019-01-15 13:06:27',NULL),(1942,24,NULL,'OLUTA','',NULL,'2019-01-15 13:06:27',NULL),(1943,24,NULL,'OMEALCA','',NULL,'2019-01-15 13:06:27',NULL),(1944,24,NULL,'ORIZABA','',NULL,'2019-01-15 13:06:27',NULL),(1945,24,NULL,'OTATITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1946,24,NULL,'OTEAPAN','',NULL,'2019-01-15 13:06:27',NULL),(1947,24,NULL,'ANTIGUA, LA','',NULL,'2019-01-15 13:06:27',NULL),(1948,24,NULL,'OZULUAMA','',NULL,'2019-01-15 13:06:27',NULL),(1949,24,NULL,'PAJAPAN','',NULL,'2019-01-15 13:06:27',NULL),(1950,24,NULL,'PANUCO','',NULL,'2019-01-15 13:06:27',NULL),(1951,24,NULL,'PAPANTLA','',NULL,'2019-01-15 13:06:27',NULL),(1952,24,NULL,'PASO DE OVEJAS','',NULL,'2019-01-15 13:06:27',NULL),(1953,24,NULL,'PASO DEL MACHO','',NULL,'2019-01-15 13:06:27',NULL),(1954,24,NULL,'PERLA, LA','',NULL,'2019-01-15 13:06:27',NULL),(1955,24,NULL,'PEROTE','',NULL,'2019-01-15 13:06:27',NULL),(1956,24,NULL,'PLATON SANCHEZ','',NULL,'2019-01-15 13:06:27',NULL),(1957,24,NULL,'PLAYA VICENTE','',NULL,'2019-01-15 13:06:27',NULL),(1958,24,NULL,'POZA RICA DE HIDALGO','',NULL,'2019-01-15 13:06:27',NULL),(1959,24,NULL,'PUEBLO VIEJO','',NULL,'2019-01-15 13:06:27',NULL),(1960,24,NULL,'PUENTE NACIONAL','',NULL,'2019-01-15 13:06:27',NULL),(1961,24,NULL,'APAZAPAN','',NULL,'2019-01-15 13:06:27',NULL),(1962,24,NULL,'RAFAEL DELGADO','',NULL,'2019-01-15 13:06:27',NULL),(1963,24,NULL,'RAFAEL LUCIO','',NULL,'2019-01-15 13:06:27',NULL),(1964,24,NULL,'REYES, LOS','',NULL,'2019-01-15 13:06:27',NULL),(1965,24,NULL,'RIO BLANCO','',NULL,'2019-01-15 13:06:27',NULL),(1966,24,NULL,'SALTABARRANCA','',NULL,'2019-01-15 13:06:27',NULL),(1967,24,NULL,'AQUILA','',NULL,'2019-01-15 13:06:27',NULL),(1968,24,NULL,'SAN ANDRES TENEJAPAN','',NULL,'2019-01-15 13:06:27',NULL),(1969,24,NULL,'SAN ANDRES TUXTLA','',NULL,'2019-01-15 13:06:27',NULL),(1970,24,NULL,'SAN JUAN EVANGELISTA','',NULL,'2019-01-15 13:06:27',NULL),(1971,24,NULL,'ASTACINGA','',NULL,'2019-01-15 13:06:27',NULL),(1972,24,NULL,'ATLAHUILCO','',NULL,'2019-01-15 13:06:27',NULL),(1973,24,NULL,'ATOYAC','',NULL,'2019-01-15 13:06:27',NULL),(1974,24,NULL,'SANTIAGO TUXTLA','',NULL,'2019-01-15 13:06:27',NULL),(1975,24,NULL,'ATZACAN','',NULL,'2019-01-15 13:06:27',NULL),(1976,24,NULL,'SAYULA DE ALEMAN','',NULL,'2019-01-15 13:06:27',NULL),(1977,24,NULL,'ATZALAN','',NULL,'2019-01-15 13:06:27',NULL),(1978,24,NULL,'SOCHIAPA','',NULL,'2019-01-15 13:06:27',NULL),(1979,24,NULL,'SOCONUSCO','',NULL,'2019-01-15 13:06:27',NULL),(1980,24,NULL,'SOLEDAD ATZOMPA','',NULL,'2019-01-15 13:06:27',NULL),(1981,24,NULL,'SOLEDAD DE DOBLADO','',NULL,'2019-01-15 13:06:27',NULL),(1982,24,NULL,'SOTEAPAN','',NULL,'2019-01-15 13:06:27',NULL),(1983,24,NULL,'TAMALIN','',NULL,'2019-01-15 13:06:27',NULL),(1984,24,NULL,'TAMIAHUA','',NULL,'2019-01-15 13:06:27',NULL),(1985,24,NULL,'TAMPICO ALTO','',NULL,'2019-01-15 13:06:27',NULL),(1986,24,NULL,'TANCOCO','',NULL,'2019-01-15 13:06:27',NULL),(1987,24,NULL,'TANTIMA','',NULL,'2019-01-15 13:06:27',NULL),(1988,24,NULL,'TANTOYUCA','',NULL,'2019-01-15 13:06:27',NULL),(1989,24,NULL,'AYAHUALULCO','',NULL,'2019-01-15 13:06:27',NULL),(1990,24,NULL,'TATATILA','',NULL,'2019-01-15 13:06:27',NULL),(1991,24,NULL,'TECOLUTLA','',NULL,'2019-01-15 13:06:27',NULL),(1992,24,NULL,'TEHUIPANGO','',NULL,'2019-01-15 13:06:27',NULL),(1993,24,NULL,'ACATLAN','',NULL,'2019-01-15 13:06:27',NULL),(1994,24,NULL,'TEMAPACHE','',NULL,'2019-01-15 13:06:27',NULL),(1995,24,NULL,'TEMPOAL','',NULL,'2019-01-15 13:06:27',NULL),(1996,24,NULL,'TENAMPA','',NULL,'2019-01-15 13:06:27',NULL),(1997,24,NULL,'TENOCHTITLAN','',NULL,'2019-01-15 13:06:27',NULL),(1998,24,NULL,'TEOCELO','',NULL,'2019-01-15 13:06:27',NULL),(1999,24,NULL,'TEPATLAXCO','',NULL,'2019-01-15 13:06:27',NULL),(2000,24,NULL,'TEPETLAN','',NULL,'2019-01-15 13:06:27',NULL),(2001,24,NULL,'TEPETZINTLA','',NULL,'2019-01-15 13:06:27',NULL),(2002,24,NULL,'TEQUILA','',NULL,'2019-01-15 13:06:28',NULL),(2003,24,NULL,'TEXCATEPEC','',NULL,'2019-01-15 13:06:28',NULL),(2004,24,NULL,'TEXHUACAN','',NULL,'2019-01-15 13:06:28',NULL),(2005,24,NULL,'TEXISTEPEC','',NULL,'2019-01-15 13:06:28',NULL),(2006,24,NULL,'TEZONAPA','',NULL,'2019-01-15 13:06:28',NULL),(2007,24,NULL,'TIERRA BLANCA','',NULL,'2019-01-15 13:06:28',NULL),(2008,24,NULL,'TIHUATLAN','',NULL,'2019-01-15 13:06:28',NULL),(2009,24,NULL,'TLACHICHILCO','',NULL,'2019-01-15 13:06:28',NULL),(2010,24,NULL,'TLACOJALPAN','',NULL,'2019-01-15 13:06:28',NULL),(2011,24,NULL,'TLACOLULAN','',NULL,'2019-01-15 13:06:28',NULL),(2012,24,NULL,'TLACOTALPAN','',NULL,'2019-01-15 13:06:28',NULL),(2013,24,NULL,'TLACOTEPEC DE MEJIA','',NULL,'2019-01-15 13:06:28',NULL),(2014,24,NULL,'TLALIXCOYAN','',NULL,'2019-01-15 13:06:28',NULL),(2015,24,NULL,'TLALNELHUAYOCAN','',NULL,'2019-01-15 13:06:28',NULL),(2016,24,NULL,'TLALTETELA','',NULL,'2019-01-15 13:06:28',NULL),(2017,24,NULL,'TLAPACOYAN','',NULL,'2019-01-15 13:06:28',NULL),(2018,24,NULL,'TLAQUILPAN','',NULL,'2019-01-15 13:06:28',NULL),(2019,24,NULL,'TLILAPAN','',NULL,'2019-01-15 13:06:28',NULL),(2020,24,NULL,'TOMATLAN','',NULL,'2019-01-15 13:06:28',NULL),(2021,24,NULL,'TONAYAN','',NULL,'2019-01-15 13:06:28',NULL),(2022,24,NULL,'BANDERILLA','',NULL,'2019-01-15 13:06:28',NULL),(2023,24,NULL,'TOTUTLA','',NULL,'2019-01-15 13:06:28',NULL),(2024,24,NULL,'TRES VALLES','',NULL,'2019-01-15 13:06:28',NULL),(2025,24,NULL,'TUXPAM','',NULL,'2019-01-15 13:06:28',NULL),(2026,24,NULL,'TUXTILLA','',NULL,'2019-01-15 13:06:28',NULL),(2027,24,NULL,'URSULO GALVAN','',NULL,'2019-01-15 13:06:28',NULL),(2028,24,NULL,'VEGA DE ALATORRE','',NULL,'2019-01-15 13:06:28',NULL),(2029,24,NULL,'VERACRUZ','',NULL,'2019-01-15 13:06:28',NULL),(2030,24,NULL,'VIGAS DE RAMIREZ, LAS','',NULL,'2019-01-15 13:06:28',NULL),(2031,24,NULL,'VILLA ALDAMA','',NULL,'2019-01-15 13:06:28',NULL),(2032,24,NULL,'BENITO JUAREZ','',NULL,'2019-01-15 13:06:28',NULL),(2033,24,NULL,'XALAPA','',NULL,'2019-01-15 13:06:28',NULL),(2034,24,NULL,'XICO','',NULL,'2019-01-15 13:06:28',NULL),(2035,24,NULL,'XOXOCOTLA','',NULL,'2019-01-15 13:06:28',NULL),(2036,24,NULL,'YANGA','',NULL,'2019-01-15 13:06:28',NULL),(2037,24,NULL,'BOCA DEL RIO','',NULL,'2019-01-15 13:06:28',NULL),(2038,24,NULL,'YECUATLAN','',NULL,'2019-01-15 13:06:28',NULL),(2039,24,NULL,'ZACUALPAN','',NULL,'2019-01-15 13:06:28',NULL),(2040,24,NULL,'ZARAGOZA','',NULL,'2019-01-15 13:06:28',NULL),(2041,24,NULL,'ZENTLA','',NULL,'2019-01-15 13:06:28',NULL),(2042,24,NULL,'ZONGOLICA','',NULL,'2019-01-15 13:06:28',NULL),(2043,24,NULL,'ZONTECOMATLAN','',NULL,'2019-01-15 13:06:28',NULL),(2044,24,NULL,'ZOZOCOLCO DE HIDALGO','',NULL,'2019-01-15 13:06:28',NULL),(2045,24,NULL,'CALCAHUALCO','',NULL,'2019-01-15 13:06:28',NULL),(2046,24,NULL,'ACAYUCAN','',NULL,'2019-01-15 13:06:28',NULL),(2047,24,NULL,'CAMARON DE TEJEDA','',NULL,'2019-01-15 13:06:28',NULL),(2048,24,NULL,'CAMERINO Z. MENDOZA','',NULL,'2019-01-15 13:06:28',NULL),(2049,24,NULL,'CARRILLO PUERTO','',NULL,'2019-01-15 13:06:28',NULL),(2050,24,NULL,'CASTILLO DE TEAYO','',NULL,'2019-01-15 13:06:28',NULL),(2051,24,NULL,'CATEMACO','',NULL,'2019-01-15 13:06:28',NULL),(2052,24,NULL,'CAZONES DE HERRERA','',NULL,'2019-01-15 13:06:28',NULL),(2053,24,NULL,'CERRO AZUL','',NULL,'2019-01-15 13:06:28',NULL),(2054,24,NULL,'CHACALTIANGUIS','',NULL,'2019-01-15 13:06:28',NULL),(2055,24,NULL,'ACTOPAN','',NULL,'2019-01-15 13:06:28',NULL),(2056,24,NULL,'CHALMA','',NULL,'2019-01-15 13:06:28',NULL),(2057,24,NULL,'ACULA','',NULL,'2019-01-15 13:06:28',NULL),(2058,24,NULL,'CHICONAMEL','',NULL,'2019-01-15 13:06:28',NULL),(2059,24,NULL,'CHICONQUIACO','',NULL,'2019-01-15 13:06:28',NULL),(2060,24,NULL,'CHICONTEPEC','',NULL,'2019-01-15 13:06:28',NULL),(2061,24,NULL,'ACULTZINGO','',NULL,'2019-01-15 13:06:28',NULL),(2062,24,NULL,'CHINAMECA','',NULL,'2019-01-15 13:06:28',NULL),(2063,24,NULL,'CHINAMPA DE GOROSTIZA','',NULL,'2019-01-15 13:06:28',NULL),(2064,24,NULL,'CHOAPAS, LAS','',NULL,'2019-01-15 13:06:28',NULL),(2065,24,NULL,'CHOCAMAN','',NULL,'2019-01-15 13:06:28',NULL),(2066,24,NULL,'CHONTLA','',NULL,'2019-01-15 13:06:28',NULL),(2067,24,NULL,'CHUMATLAN','',NULL,'2019-01-15 13:06:28',NULL),(2068,24,NULL,'AGUA DULCE','',NULL,'2019-01-15 13:06:28',NULL),(2069,24,NULL,'CITLALTEPETL','',NULL,'2019-01-15 13:06:28',NULL),(2070,24,NULL,'COACOATZINTLA','',NULL,'2019-01-15 13:06:28',NULL),(2071,24,NULL,'COAHUITLAN','',NULL,'2019-01-15 13:06:28',NULL),(2072,24,NULL,'COATEPEC','',NULL,'2019-01-15 13:06:28',NULL),(2073,24,NULL,'COATZACOALCOS','',NULL,'2019-01-15 13:06:28',NULL),(2074,24,NULL,'COATZINTLA','',NULL,'2019-01-15 13:06:28',NULL),(2075,24,NULL,'COETZALA','',NULL,'2019-01-15 13:06:28',NULL),(2076,24,NULL,'COLIPA','',NULL,'2019-01-15 13:06:28',NULL),(2077,24,NULL,'COMAPA','',NULL,'2019-01-15 13:06:28',NULL),(2078,24,NULL,'CORDOBA','',NULL,'2019-01-15 13:06:28',NULL),(2079,24,NULL,'COSAMALOAPAN','',NULL,'2019-01-15 13:06:28',NULL),(2080,24,NULL,'COSAUTLAN DE CARVAJAL','',NULL,'2019-01-15 13:06:28',NULL),(2081,24,NULL,'COSCOMATEPEC','',NULL,'2019-01-15 13:06:28',NULL),(2082,24,NULL,'COSOLEACAQUE','',NULL,'2019-01-15 13:06:28',NULL),(2083,24,NULL,'COTAXTLA','',NULL,'2019-01-15 13:06:28',NULL),(2084,24,NULL,'COXQUIHUI','',NULL,'2019-01-15 13:06:28',NULL),(2085,24,NULL,'COYUTLA','',NULL,'2019-01-15 13:06:28',NULL),(2086,24,NULL,'CUICHAPA','',NULL,'2019-01-15 13:06:28',NULL),(2087,24,NULL,'CUITLAHUAC','',NULL,'2019-01-15 13:06:28',NULL),(2088,24,NULL,'EMILIANO ZAPATA','',NULL,'2019-01-15 13:06:28',NULL),(2089,24,NULL,'ESPINAL','',NULL,'2019-01-15 13:06:28',NULL),(2090,24,NULL,'FILOMENO MATA','',NULL,'2019-01-15 13:06:28',NULL),(2091,24,NULL,'FORTIN','',NULL,'2019-01-15 13:06:28',NULL),(2092,24,NULL,'GUTIERREZ ZAMORA','',NULL,'2019-01-15 13:06:28',NULL),(2093,24,NULL,'HIDALGOTITLAN','',NULL,'2019-01-15 13:06:28',NULL),(2094,24,NULL,'HIGO, EL','',NULL,'2019-01-15 13:06:28',NULL),(2095,24,NULL,'HUATUSCO','',NULL,'2019-01-15 13:06:28',NULL),(2096,24,NULL,'HUAYACOCOTLA','',NULL,'2019-01-15 13:06:28',NULL),(2097,24,NULL,'HUEYAPAN DE OCAMPO','',NULL,'2019-01-15 13:06:28',NULL),(2098,24,NULL,'HUILOAPAN DE CUAUHTEMOC','',NULL,'2019-01-15 13:06:28',NULL),(2099,24,NULL,'IGNACIO DE LA LLAVE','',NULL,'2019-01-15 13:06:28',NULL),(2100,24,NULL,'ILAMATLAN','',NULL,'2019-01-15 13:06:28',NULL),(2101,24,NULL,'ISLA','',NULL,'2019-01-15 13:06:28',NULL),(2102,24,NULL,'IXCATEPEC','',NULL,'2019-01-15 13:06:28',NULL),(2103,24,NULL,'IXHUACAN DE LOS REYES','',NULL,'2019-01-15 13:06:28',NULL),(2104,24,NULL,'ALPATLAHUAC','',NULL,'2019-01-15 13:06:28',NULL),(2105,24,NULL,'IXHUATLAN DE MADERO','',NULL,'2019-01-15 13:06:28',NULL),(2106,24,NULL,'IXHUATLAN DEL CAFE','',NULL,'2019-01-15 13:06:28',NULL),(2107,24,NULL,'IXHUATLAN DEL SURESTE','',NULL,'2019-01-15 13:06:28',NULL),(2108,24,NULL,'IXHUATLANCILLO','',NULL,'2019-01-15 13:06:28',NULL),(2109,24,NULL,'IXMATLAHUACAN','',NULL,'2019-01-15 13:06:28',NULL),(2110,24,NULL,'IXTACZOQUITLAN','',NULL,'2019-01-15 13:06:28',NULL),(2111,24,NULL,'JALACINGO','',NULL,'2019-01-15 13:06:28',NULL),(2112,24,NULL,'JALCOMULCO','',NULL,'2019-01-15 13:06:28',NULL),(2113,24,NULL,'JALTIPAN','',NULL,'2019-01-15 13:06:28',NULL),(2114,24,NULL,'JAMAPA','',NULL,'2019-01-15 13:06:28',NULL),(2115,24,NULL,'JESUS CARRANZA','',NULL,'2019-01-15 13:06:28',NULL),(2116,24,NULL,'JILOTEPEC','',NULL,'2019-01-15 13:06:28',NULL),(2117,24,NULL,'ALTO LUCERO DE GUTIERREZ BARRIOS','',NULL,'2019-01-15 13:06:28',NULL),(2118,24,NULL,'ALTOTONGA','',NULL,'2019-01-15 13:06:28',NULL),(2119,24,NULL,'JOSE AZUETA','',NULL,'2019-01-15 13:06:28',NULL),(2120,24,NULL,'JUAN RODRIGUEZ CLARA','',NULL,'2019-01-15 13:06:28',NULL),(2121,24,NULL,'ALVARADO','',NULL,'2019-01-15 13:06:28',NULL),(2122,24,NULL,'JUCHIQUE DE FERRER','',NULL,'2019-01-15 13:06:28',NULL),(2123,24,NULL,'LANDERO Y COSS','',NULL,'2019-01-15 13:06:28',NULL),(2124,24,NULL,'LERDO DE TEJADA','',NULL,'2019-01-15 13:06:28',NULL),(2125,24,NULL,'ACAJETE','',NULL,'2019-01-15 13:06:28',NULL),(2126,24,NULL,'MAGDALENA','',NULL,'2019-01-15 13:06:28',NULL),(2127,24,NULL,'MALTRATA','',NULL,'2019-01-15 13:06:28',NULL),(2128,24,NULL,'MANLIO FABIO ALTAMIRANO','',NULL,'2019-01-15 13:06:28',NULL),(2129,24,NULL,'MARIANO ESCOBEDO','',NULL,'2019-01-15 13:06:28',NULL),(2130,24,NULL,'MARTINEZ DE LA TORRE','',NULL,'2019-01-15 13:06:28',NULL),(2131,24,NULL,'AMATITLAN','',NULL,'2019-01-15 13:06:28',NULL),(2132,24,NULL,'MECATLAN','',NULL,'2019-01-15 13:06:28',NULL),(2133,24,NULL,'MECAYAPAN','',NULL,'2019-01-15 13:06:28',NULL),(2134,24,NULL,'MEDELLIN','',NULL,'2019-01-15 13:06:28',NULL),(2135,24,NULL,'AMATLAN DE LOS REYES','',NULL,'2019-01-15 13:06:28',NULL),(2136,24,NULL,'MIAHUATLAN','',NULL,'2019-01-15 13:06:28',NULL),(2137,24,NULL,'AMATLAN TUXPAN','',NULL,'2019-01-15 13:06:28',NULL),(2138,24,NULL,'MINAS, LAS','',NULL,'2019-01-15 13:06:28',NULL),(2139,24,NULL,'MINATITLAN','',NULL,'2019-01-15 13:06:28',NULL),(2140,24,NULL,'Carlos A Carrillo','',NULL,'2019-01-15 13:06:28',NULL),(2141,24,NULL,'Naranjos Amatlan','',NULL,'2019-01-15 13:06:28',NULL),(2142,24,NULL,'Tatahuicapan de Juarez','',NULL,'2019-01-15 13:06:28',NULL),(2143,24,NULL,'Uxpanapa','',NULL,'2019-01-15 13:06:28',NULL),(2144,25,NULL,'MOCOCHA','',NULL,'2019-01-15 13:06:28',NULL),(2145,25,NULL,'MOTUL','',NULL,'2019-01-15 13:06:28',NULL),(2146,25,NULL,'MUNA','',NULL,'2019-01-15 13:06:28',NULL),(2147,25,NULL,'MUXUPIP','',NULL,'2019-01-15 13:06:28',NULL),(2148,25,NULL,'OPICHEN','',NULL,'2019-01-15 13:06:28',NULL),(2149,25,NULL,'OXKUTZCAB','',NULL,'2019-01-15 13:06:28',NULL),(2150,25,NULL,'PANABA','',NULL,'2019-01-15 13:06:28',NULL),(2151,25,NULL,'PETO','',NULL,'2019-01-15 13:06:28',NULL),(2152,25,NULL,'PROGRESO','',NULL,'2019-01-15 13:06:28',NULL),(2153,25,NULL,'QUINTANA ROO','',NULL,'2019-01-15 13:06:28',NULL),(2154,25,NULL,'RIO LAGARTOS','',NULL,'2019-01-15 13:06:28',NULL),(2155,25,NULL,'SACALUM','',NULL,'2019-01-15 13:06:28',NULL),(2156,25,NULL,'SAMAHIL','',NULL,'2019-01-15 13:06:28',NULL),(2157,25,NULL,'ACANCEH','',NULL,'2019-01-15 13:06:28',NULL),(2158,25,NULL,'SAN FELIPE','',NULL,'2019-01-15 13:06:28',NULL),(2159,25,NULL,'SANAHCAT','',NULL,'2019-01-15 13:06:28',NULL),(2160,25,NULL,'SANTA ELENA','',NULL,'2019-01-15 13:06:28',NULL),(2161,25,NULL,'SEYE','',NULL,'2019-01-15 13:06:28',NULL),(2162,25,NULL,'SINANCHE','',NULL,'2019-01-15 13:06:28',NULL),(2163,25,NULL,'SOTUTA','',NULL,'2019-01-15 13:06:28',NULL),(2164,25,NULL,'SUCILA','',NULL,'2019-01-15 13:06:28',NULL),(2165,25,NULL,'SUDZAL','',NULL,'2019-01-15 13:06:28',NULL),(2166,25,NULL,'SUMA','',NULL,'2019-01-15 13:06:28',NULL),(2167,25,NULL,'TAHDZIU','',NULL,'2019-01-15 13:06:28',NULL),(2168,25,NULL,'TAHMEK','',NULL,'2019-01-15 13:06:28',NULL),(2169,25,NULL,'TEABO','',NULL,'2019-01-15 13:06:28',NULL),(2170,25,NULL,'TECOH','',NULL,'2019-01-15 13:06:28',NULL),(2171,25,NULL,'TEKAL DE VENEGAS','',NULL,'2019-01-15 13:06:28',NULL),(2172,25,NULL,'TEKANTO','',NULL,'2019-01-15 13:06:28',NULL),(2173,25,NULL,'TEKAX','',NULL,'2019-01-15 13:06:28',NULL),(2174,25,NULL,'TEKIT','',NULL,'2019-01-15 13:06:28',NULL),(2175,25,NULL,'TEKOM','',NULL,'2019-01-15 13:06:28',NULL),(2176,25,NULL,'TELCHAC PUEBLO','',NULL,'2019-01-15 13:06:28',NULL),(2177,25,NULL,'TELCHAC PUERTO','',NULL,'2019-01-15 13:06:28',NULL),(2178,25,NULL,'TEMAX','',NULL,'2019-01-15 13:06:28',NULL),(2179,25,NULL,'TEMOZON','',NULL,'2019-01-15 13:06:28',NULL),(2180,25,NULL,'TEPAKAN','',NULL,'2019-01-15 13:06:28',NULL),(2181,25,NULL,'BACA','',NULL,'2019-01-15 13:06:28',NULL),(2182,25,NULL,'TETIZ','',NULL,'2019-01-15 13:06:28',NULL),(2183,25,NULL,'TEYA','',NULL,'2019-01-15 13:06:28',NULL),(2184,25,NULL,'TICUL','',NULL,'2019-01-15 13:06:28',NULL),(2185,25,NULL,'TIMUCUY','',NULL,'2019-01-15 13:06:28',NULL),(2186,25,NULL,'TINUM','',NULL,'2019-01-15 13:06:28',NULL),(2187,25,NULL,'TIXCACALCUPUL','',NULL,'2019-01-15 13:06:28',NULL),(2188,25,NULL,'TIXKOKOB','',NULL,'2019-01-15 13:06:28',NULL),(2189,25,NULL,'TIXMEHUAC','',NULL,'2019-01-15 13:06:28',NULL),(2190,25,NULL,'TIXPEHUAL','',NULL,'2019-01-15 13:06:28',NULL),(2191,25,NULL,'TIZIMIN','',NULL,'2019-01-15 13:06:28',NULL),(2192,25,NULL,'TUNKAS','',NULL,'2019-01-15 13:06:28',NULL),(2193,25,NULL,'TZUCACAB','',NULL,'2019-01-15 13:06:28',NULL),(2194,25,NULL,'UAYMA','',NULL,'2019-01-15 13:06:28',NULL),(2195,25,NULL,'UCU','',NULL,'2019-01-15 13:06:28',NULL),(2196,25,NULL,'VALLADOLID','',NULL,'2019-01-15 13:06:28',NULL),(2197,25,NULL,'XOCCHEL','',NULL,'2019-01-15 13:06:28',NULL),(2198,25,NULL,'YAXCABA','',NULL,'2019-01-15 13:06:28',NULL),(2199,25,NULL,'YAXKUKUL','',NULL,'2019-01-15 13:06:28',NULL),(2200,25,NULL,'YOBAIN','',NULL,'2019-01-15 13:06:28',NULL),(2201,25,NULL,'BOKOBA','',NULL,'2019-01-15 13:06:28',NULL),(2202,25,NULL,'BUCTZOTZ','',NULL,'2019-01-15 13:06:28',NULL),(2203,25,NULL,'CACALCHEN','',NULL,'2019-01-15 13:06:28',NULL),(2204,25,NULL,'CALOTMUL','',NULL,'2019-01-15 13:06:28',NULL),(2205,25,NULL,'CANSAHCAB','',NULL,'2019-01-15 13:06:28',NULL),(2206,25,NULL,'CANTAMAYEC','',NULL,'2019-01-15 13:06:28',NULL),(2207,25,NULL,'CELESTUN','',NULL,'2019-01-15 13:06:28',NULL),(2208,25,NULL,'CENOTILLO','',NULL,'2019-01-15 13:06:28',NULL),(2209,25,NULL,'CHACSINKIN','',NULL,'2019-01-15 13:06:28',NULL),(2210,25,NULL,'CHANKOM','',NULL,'2019-01-15 13:06:28',NULL),(2211,25,NULL,'CHAPAB','',NULL,'2019-01-15 13:06:28',NULL),(2212,25,NULL,'CHEMAX','',NULL,'2019-01-15 13:06:28',NULL),(2213,25,NULL,'CHICHIMILA','',NULL,'2019-01-15 13:06:28',NULL),(2214,25,NULL,'CHICXULUB PUEBLO','',NULL,'2019-01-15 13:06:28',NULL),(2215,25,NULL,'CHIKINDZONOT','',NULL,'2019-01-15 13:06:28',NULL),(2216,25,NULL,'CHOCHOLA','',NULL,'2019-01-15 13:06:28',NULL),(2217,25,NULL,'CHUMAYEL','',NULL,'2019-01-15 13:06:28',NULL),(2218,25,NULL,'CONKAL','',NULL,'2019-01-15 13:06:28',NULL),(2219,25,NULL,'CUNCUNUL','',NULL,'2019-01-15 13:06:28',NULL),(2220,25,NULL,'CUZAMA','',NULL,'2019-01-15 13:06:28',NULL),(2221,25,NULL,'DZAN','',NULL,'2019-01-15 13:06:28',NULL),(2222,25,NULL,'DZEMUL','',NULL,'2019-01-15 13:06:28',NULL),(2223,25,NULL,'DZIDZANTUN','',NULL,'2019-01-15 13:06:28',NULL),(2224,25,NULL,'DZILAM DE BRAVO','',NULL,'2019-01-15 13:06:28',NULL),(2225,25,NULL,'DZILAM GONZALEZ','',NULL,'2019-01-15 13:06:28',NULL),(2226,25,NULL,'DZITAS','',NULL,'2019-01-15 13:06:28',NULL),(2227,25,NULL,'DZONCAUICH','',NULL,'2019-01-15 13:06:28',NULL),(2228,25,NULL,'AKIL','',NULL,'2019-01-15 13:06:28',NULL),(2229,25,NULL,'ESPITA','',NULL,'2019-01-15 13:06:28',NULL),(2230,25,NULL,'HALACHO','',NULL,'2019-01-15 13:06:28',NULL),(2231,25,NULL,'HOCABA','',NULL,'2019-01-15 13:06:28',NULL),(2232,25,NULL,'HOCTUN','',NULL,'2019-01-15 13:06:28',NULL),(2233,25,NULL,'HOMUN','',NULL,'2019-01-15 13:06:28',NULL),(2234,25,NULL,'HUHI','',NULL,'2019-01-15 13:06:28',NULL),(2235,25,NULL,'HUNUCMA','',NULL,'2019-01-15 13:06:28',NULL),(2236,25,NULL,'IXIL','',NULL,'2019-01-15 13:06:28',NULL),(2237,25,NULL,'IZAMAL','',NULL,'2019-01-15 13:06:28',NULL),(2238,25,NULL,'KANASIN','',NULL,'2019-01-15 13:06:28',NULL),(2239,25,NULL,'KANTUNIL','',NULL,'2019-01-15 13:06:28',NULL),(2240,25,NULL,'KAUA','',NULL,'2019-01-15 13:06:28',NULL),(2241,25,NULL,'KINCHIL','',NULL,'2019-01-15 13:06:28',NULL),(2242,25,NULL,'KOPOMA','',NULL,'2019-01-15 13:06:28',NULL),(2243,25,NULL,'MAMA','',NULL,'2019-01-15 13:06:28',NULL),(2244,25,NULL,'MANI','',NULL,'2019-01-15 13:06:28',NULL),(2245,25,NULL,'MAXCANU','',NULL,'2019-01-15 13:06:28',NULL),(2246,25,NULL,'MAYAPAN','',NULL,'2019-01-15 13:06:28',NULL),(2247,25,NULL,'MERIDA','',NULL,'2019-01-15 13:06:28',NULL),(2248,25,NULL,'Uman','',NULL,'2019-01-15 13:06:28',NULL),(2249,25,NULL,'Abala','',NULL,'2019-01-15 13:06:28',NULL),(2250,26,NULL,'MOMAX','',NULL,'2019-01-15 13:06:28',NULL),(2251,26,NULL,'MONTE ESCOBEDO','',NULL,'2019-01-15 13:06:28',NULL),(2252,26,NULL,'MORELOS','',NULL,'2019-01-15 13:06:28',NULL),(2253,26,NULL,'MOYAHUA DE ESTRADA','',NULL,'2019-01-15 13:06:28',NULL),(2254,26,NULL,'NOCHISTLAN DE MEJIA','',NULL,'2019-01-15 13:06:28',NULL),(2255,26,NULL,'NORIA DE ANGELES','',NULL,'2019-01-15 13:06:28',NULL),(2256,26,NULL,'OJOCALIENTE','',NULL,'2019-01-15 13:06:28',NULL),(2257,26,NULL,'PANUCO','',NULL,'2019-01-15 13:06:28',NULL),(2258,26,NULL,'PINOS','',NULL,'2019-01-15 13:06:28',NULL),(2259,26,NULL,'RIO GRANDE','',NULL,'2019-01-15 13:06:28',NULL),(2260,26,NULL,'APOZOL','',NULL,'2019-01-15 13:06:28',NULL),(2261,26,NULL,'SAIN ALTO','',NULL,'2019-01-15 13:06:28',NULL),(2262,26,NULL,'APULCO','',NULL,'2019-01-15 13:06:28',NULL),(2263,26,NULL,'SALVADOR, EL','',NULL,'2019-01-15 13:06:28',NULL),(2264,26,NULL,'ATOLINGA','',NULL,'2019-01-15 13:06:28',NULL),(2265,26,NULL,'SOMBRERETE','',NULL,'2019-01-15 13:06:28',NULL),(2266,26,NULL,'SUSTICACAN','',NULL,'2019-01-15 13:06:28',NULL),(2267,26,NULL,'TABASCO','',NULL,'2019-01-15 13:06:28',NULL),(2268,26,NULL,'TEPECHITLAN','',NULL,'2019-01-15 13:06:28',NULL),(2269,26,NULL,'TEPETONGO','',NULL,'2019-01-15 13:06:28',NULL),(2270,26,NULL,'TEUL DE GONZALEZ ORTEGA','',NULL,'2019-01-15 13:06:28',NULL),(2271,26,NULL,'TLALTENANGO DE SANCHEZ ROMAN','',NULL,'2019-01-15 13:06:28',NULL),(2272,26,NULL,'TRINIDAD GARCIA DE LA CADENA','',NULL,'2019-01-15 13:06:28',NULL),(2273,26,NULL,'VALPARAISO','',NULL,'2019-01-15 13:06:28',NULL),(2274,26,NULL,'VETAGRANDE','',NULL,'2019-01-15 13:06:28',NULL),(2275,26,NULL,'VILLA DE COS','',NULL,'2019-01-15 13:06:28',NULL),(2276,26,NULL,'VILLA GARCIA','',NULL,'2019-01-15 13:06:28',NULL),(2277,26,NULL,'VILLA GONZALEZ ORTEGA','',NULL,'2019-01-15 13:06:28',NULL),(2278,26,NULL,'BENITO JUAREZ','',NULL,'2019-01-15 13:06:28',NULL),(2279,26,NULL,'VILLA HIDALGO','',NULL,'2019-01-15 13:06:28',NULL),(2280,26,NULL,'VILLANUEVA','',NULL,'2019-01-15 13:06:28',NULL),(2281,26,NULL,'ZACATECAS','',NULL,'2019-01-15 13:06:28',NULL),(2282,26,NULL,'CALERA','',NULL,'2019-01-15 13:06:28',NULL),(2283,26,NULL,'CAÑITAS DE FELIPE PESCADOR','',NULL,'2019-01-15 13:06:28',NULL),(2284,26,NULL,'CHALCHIHUITES','',NULL,'2019-01-15 13:06:28',NULL),(2285,26,NULL,'CONCEPCION DEL ORO','',NULL,'2019-01-15 13:06:28',NULL),(2286,26,NULL,'CUAUHTEMOC','',NULL,'2019-01-15 13:06:28',NULL),(2287,26,NULL,'FRANCISCO R. MURGUIA','',NULL,'2019-01-15 13:06:28',NULL),(2288,26,NULL,'FRESNILLO','',NULL,'2019-01-15 13:06:28',NULL),(2289,26,NULL,'GENARO CODINA','',NULL,'2019-01-15 13:06:28',NULL),(2290,26,NULL,'GENERAL ENRIQUE ESTRADA','',NULL,'2019-01-15 13:06:28',NULL),(2291,26,NULL,'GENERAL JOAQUIN AMARO','',NULL,'2019-01-15 13:06:28',NULL),(2292,26,NULL,'GENERAL PANFILO NATERA','',NULL,'2019-01-15 13:06:28',NULL),(2293,26,NULL,'GUADALUPE','',NULL,'2019-01-15 13:06:28',NULL),(2294,26,NULL,'HUANUSCO','',NULL,'2019-01-15 13:06:28',NULL),(2295,26,NULL,'JALPA','',NULL,'2019-01-15 13:06:28',NULL),(2296,26,NULL,'JEREZ','',NULL,'2019-01-15 13:06:28',NULL),(2297,26,NULL,'JIMENEZ DEL TEUL','',NULL,'2019-01-15 13:06:28',NULL),(2298,26,NULL,'JUAN ALDAMA','',NULL,'2019-01-15 13:06:28',NULL),(2299,26,NULL,'JUCHIPILA','',NULL,'2019-01-15 13:06:28',NULL),(2300,26,NULL,'LORETO','',NULL,'2019-01-15 13:06:28',NULL),(2301,26,NULL,'LUIS MOYA','',NULL,'2019-01-15 13:06:28',NULL),(2302,26,NULL,'MAZAPIL','',NULL,'2019-01-15 13:06:28',NULL),(2303,26,NULL,'MELCHOR OCAMPO','',NULL,'2019-01-15 13:06:28',NULL),(2304,26,NULL,'MEZQUITAL DEL ORO','',NULL,'2019-01-15 13:06:28',NULL),(2305,26,NULL,'MIGUEL AUZA','',NULL,'2019-01-15 13:06:28',NULL),(2306,26,NULL,'Trancoso','',NULL,'2019-01-15 13:06:28',NULL),(2307,26,NULL,'El Plateado de Joaquin Amaro','',NULL,'2019-01-15 13:06:28',NULL),(2308,27,NULL,'PALIZADA','',NULL,'2019-01-15 13:06:28',NULL),(2309,27,NULL,'TENABO','',NULL,'2019-01-15 13:06:28',NULL),(2310,27,NULL,'CALKINI','',NULL,'2019-01-15 13:06:28',NULL),(2311,27,NULL,'CAMPECHE','',NULL,'2019-01-15 13:06:28',NULL),(2312,27,NULL,'CARMEN','',NULL,'2019-01-15 13:06:28',NULL),(2313,27,NULL,'CHAMPOTON','',NULL,'2019-01-15 13:06:28',NULL),(2314,27,NULL,'ESCARCEGA','',NULL,'2019-01-15 13:06:28',NULL),(2315,27,NULL,'HECELCHAKAN','',NULL,'2019-01-15 13:06:28',NULL),(2316,27,NULL,'HOPELCHEN','',NULL,'2019-01-15 13:06:28',NULL),(2317,27,NULL,'CANDELARIA','',NULL,'2019-01-15 13:06:28',NULL),(2318,27,NULL,'CALAKMUL','',NULL,'2019-01-15 13:06:28',NULL),(2319,28,NULL,'MONCLOVA','',NULL,'2019-01-15 13:06:28',NULL),(2320,28,NULL,'MORELOS','',NULL,'2019-01-15 13:06:28',NULL),(2321,28,NULL,'MUZQUIZ','',NULL,'2019-01-15 13:06:28',NULL),(2322,28,NULL,'NADADORES','',NULL,'2019-01-15 13:06:28',NULL),(2323,28,NULL,'NAVA','',NULL,'2019-01-15 13:06:28',NULL),(2324,28,NULL,'OCAMPO','',NULL,'2019-01-15 13:06:28',NULL),(2325,28,NULL,'PARRAS','',NULL,'2019-01-15 13:06:28',NULL),(2326,28,NULL,'PIEDRAS NEGRAS','',NULL,'2019-01-15 13:06:28',NULL),(2327,28,NULL,'PROGRESO','',NULL,'2019-01-15 13:06:28',NULL),(2328,28,NULL,'RAMOS ARIZPE','',NULL,'2019-01-15 13:06:28',NULL),(2329,28,NULL,'SABINAS','',NULL,'2019-01-15 13:06:28',NULL),(2330,28,NULL,'SACRAMENTO','',NULL,'2019-01-15 13:06:28',NULL),(2331,28,NULL,'SALTILLO','',NULL,'2019-01-15 13:06:28',NULL),(2332,28,NULL,'SAN BUENAVENTURA','',NULL,'2019-01-15 13:06:28',NULL),(2333,28,NULL,'SAN JUAN DE SABINAS','',NULL,'2019-01-15 13:06:28',NULL),(2334,28,NULL,'ARTEAGA','',NULL,'2019-01-15 13:06:28',NULL),(2335,28,NULL,'SAN PEDRO','',NULL,'2019-01-15 13:06:28',NULL),(2336,28,NULL,'SIERRA MOJADA','',NULL,'2019-01-15 13:06:28',NULL),(2337,28,NULL,'TORREON','',NULL,'2019-01-15 13:06:28',NULL),(2338,28,NULL,'VIESCA','',NULL,'2019-01-15 13:06:28',NULL),(2339,28,NULL,'VILLA UNION','',NULL,'2019-01-15 13:06:28',NULL),(2340,28,NULL,'ZARAGOZA','',NULL,'2019-01-15 13:06:28',NULL),(2341,28,NULL,'CANDELA','',NULL,'2019-01-15 13:06:28',NULL),(2342,28,NULL,'ABASOLO','',NULL,'2019-01-15 13:06:28',NULL),(2343,28,NULL,'CASTAÑOS','',NULL,'2019-01-15 13:06:28',NULL),(2344,28,NULL,'ACUÑA','',NULL,'2019-01-15 13:06:28',NULL),(2345,28,NULL,'CUATROCIENEGAS','',NULL,'2019-01-15 13:06:28',NULL),(2346,28,NULL,'ESCOBEDO','',NULL,'2019-01-15 13:06:28',NULL),(2347,28,NULL,'FRANCISCO I. MADERO','',NULL,'2019-01-15 13:06:28',NULL),(2348,28,NULL,'FRONTERA','',NULL,'2019-01-15 13:06:28',NULL),(2349,28,NULL,'GENERAL CEPEDA','',NULL,'2019-01-15 13:06:28',NULL),(2350,28,NULL,'GUERRERO','',NULL,'2019-01-15 13:06:28',NULL),(2351,28,NULL,'HIDALGO','',NULL,'2019-01-15 13:06:28',NULL),(2352,28,NULL,'ALLENDE','',NULL,'2019-01-15 13:06:28',NULL),(2353,28,NULL,'JIMENEZ','',NULL,'2019-01-15 13:06:28',NULL),(2354,28,NULL,'JUAREZ','',NULL,'2019-01-15 13:06:28',NULL),(2355,28,NULL,'LAMADRID','',NULL,'2019-01-15 13:06:28',NULL),(2356,28,NULL,'MATAMOROS','',NULL,'2019-01-15 13:06:28',NULL),(2357,29,NULL,'ARMERIA','',NULL,'2019-01-15 13:06:28',NULL),(2358,29,NULL,'TECOMAN','',NULL,'2019-01-15 13:06:28',NULL),(2359,29,NULL,'VILLA DE ALVAREZ','',NULL,'2019-01-15 13:06:28',NULL),(2360,29,NULL,'COLIMA','',NULL,'2019-01-15 13:06:28',NULL),(2361,29,NULL,'COMALA','',NULL,'2019-01-15 13:06:28',NULL),(2362,29,NULL,'COQUIMATLAN','',NULL,'2019-01-15 13:06:28',NULL),(2363,29,NULL,'CUAUHTEMOC','',NULL,'2019-01-15 13:06:28',NULL),(2364,29,NULL,'IXTLAHUACAN','',NULL,'2019-01-15 13:06:28',NULL),(2365,29,NULL,'MANZANILLO','',NULL,'2019-01-15 13:06:28',NULL),(2366,29,NULL,'MINATITLAN','',NULL,'2019-01-15 13:06:28',NULL),(2367,31,NULL,'MORELOS','',NULL,'2019-01-15 13:06:28',NULL),(2368,31,NULL,'MORIS','',NULL,'2019-01-15 13:06:28',NULL),(2369,31,NULL,'NAMIQUIPA','',NULL,'2019-01-15 13:06:28',NULL),(2370,31,NULL,'NONOAVA','',NULL,'2019-01-15 13:06:28',NULL),(2371,31,NULL,'NUEVO CASAS GRANDES','',NULL,'2019-01-15 13:06:28',NULL),(2372,31,NULL,'OCAMPO','',NULL,'2019-01-15 13:06:28',NULL),(2373,31,NULL,'OJINAGA','',NULL,'2019-01-15 13:06:28',NULL),(2374,31,NULL,'PRAXEDIS G. GUERRERO','',NULL,'2019-01-15 13:06:28',NULL),(2375,31,NULL,'RIVA PALACIO','',NULL,'2019-01-15 13:06:28',NULL),(2376,31,NULL,'ROSALES','',NULL,'2019-01-15 13:06:28',NULL),(2377,31,NULL,'ROSARIO','',NULL,'2019-01-15 13:06:28',NULL),(2378,31,NULL,'AQUILES SERDAN','',NULL,'2019-01-15 13:06:28',NULL),(2379,31,NULL,'SAN FRANCISCO DE BORJA','',NULL,'2019-01-15 13:06:28',NULL),(2380,31,NULL,'SAN FRANCISCO DE CONCHOS','',NULL,'2019-01-15 13:06:28',NULL),(2381,31,NULL,'SAN FRANCISCO DEL ORO','',NULL,'2019-01-15 13:06:28',NULL),(2382,31,NULL,'ASCENSION','',NULL,'2019-01-15 13:06:28',NULL),(2383,31,NULL,'SANTA BARBARA','',NULL,'2019-01-15 13:06:28',NULL),(2384,31,NULL,'SANTA ISABEL','',NULL,'2019-01-15 13:06:28',NULL),(2385,31,NULL,'SATEVO','',NULL,'2019-01-15 13:06:28',NULL),(2386,31,NULL,'SAUCILLO','',NULL,'2019-01-15 13:06:28',NULL),(2387,31,NULL,'TEMOSACHI','',NULL,'2019-01-15 13:06:28',NULL),(2388,31,NULL,'BACHINIVA','',NULL,'2019-01-15 13:06:28',NULL),(2389,31,NULL,'BALLEZA','',NULL,'2019-01-15 13:06:28',NULL),(2390,31,NULL,'TULE, EL','',NULL,'2019-01-15 13:06:28',NULL),(2391,31,NULL,'BATOPILAS','',NULL,'2019-01-15 13:06:28',NULL),(2392,31,NULL,'URIQUE','',NULL,'2019-01-15 13:06:28',NULL),(2393,31,NULL,'URUACHI','',NULL,'2019-01-15 13:06:28',NULL),(2394,31,NULL,'VALLE DE ZARAGOZA','',NULL,'2019-01-15 13:06:28',NULL),(2395,31,NULL,'BOCOYNA','',NULL,'2019-01-15 13:06:28',NULL),(2396,31,NULL,'BUENAVENTURA','',NULL,'2019-01-15 13:06:28',NULL),(2397,31,NULL,'CAMARGO','',NULL,'2019-01-15 13:06:28',NULL),(2398,31,NULL,'CARICHI','',NULL,'2019-01-15 13:06:28',NULL),(2399,31,NULL,'CASAS GRANDES','',NULL,'2019-01-15 13:06:28',NULL),(2400,31,NULL,'CHIHUAHUA','',NULL,'2019-01-15 13:06:28',NULL),(2401,31,NULL,'CHINIPAS','',NULL,'2019-01-15 13:06:28',NULL),(2402,31,NULL,'CORONADO','',NULL,'2019-01-15 13:06:28',NULL),(2403,31,NULL,'COYAME','',NULL,'2019-01-15 13:06:28',NULL),(2404,31,NULL,'CRUZ, LA','',NULL,'2019-01-15 13:06:28',NULL),(2405,31,NULL,'CUAUHTEMOC','',NULL,'2019-01-15 13:06:28',NULL),(2406,31,NULL,'CUSIHUIRIACHI','',NULL,'2019-01-15 13:06:28',NULL),(2407,31,NULL,'DELICIAS','',NULL,'2019-01-15 13:06:28',NULL),(2408,31,NULL,'DOCTOR BELISARIO DOMINGUEZ','',NULL,'2019-01-15 13:06:28',NULL),(2409,31,NULL,'AHUMADA','',NULL,'2019-01-15 13:06:28',NULL),(2410,31,NULL,'GALEANA','',NULL,'2019-01-15 13:06:28',NULL),(2411,31,NULL,'GOMEZ FARIAS','',NULL,'2019-01-15 13:06:28',NULL),(2412,31,NULL,'GRAN MORELOS','',NULL,'2019-01-15 13:06:28',NULL),(2413,31,NULL,'ALDAMA','',NULL,'2019-01-15 13:06:28',NULL),(2414,31,NULL,'GUACHOCHI','',NULL,'2019-01-15 13:06:28',NULL),(2415,31,NULL,'GUADALUPE','',NULL,'2019-01-15 13:06:28',NULL),(2416,31,NULL,'GUADALUPE Y CALVO','',NULL,'2019-01-15 13:06:28',NULL),(2417,31,NULL,'GUAZAPARES','',NULL,'2019-01-15 13:06:28',NULL),(2418,31,NULL,'GUERRERO','',NULL,'2019-01-15 13:06:28',NULL),(2419,31,NULL,'HIDALGO DEL PARRAL','',NULL,'2019-01-15 13:06:28',NULL),(2420,31,NULL,'ALLENDE','',NULL,'2019-01-15 13:06:28',NULL),(2421,31,NULL,'HUEJOTITAN','',NULL,'2019-01-15 13:06:28',NULL),(2422,31,NULL,'IGNACIO ZARAGOZA','',NULL,'2019-01-15 13:06:28',NULL),(2423,31,NULL,'JANOS','',NULL,'2019-01-15 13:06:28',NULL),(2424,31,NULL,'JIMENEZ','',NULL,'2019-01-15 13:06:28',NULL),(2425,31,NULL,'JUAREZ','',NULL,'2019-01-15 13:06:28',NULL),(2426,31,NULL,'JULIMES','',NULL,'2019-01-15 13:06:28',NULL),(2427,31,NULL,'LOPEZ','',NULL,'2019-01-15 13:06:28',NULL),(2428,31,NULL,'MADERA','',NULL,'2019-01-15 13:06:28',NULL),(2429,31,NULL,'MAGUARICHI','',NULL,'2019-01-15 13:06:28',NULL),(2430,31,NULL,'MANUEL BENAVIDES','',NULL,'2019-01-15 13:06:28',NULL),(2431,31,NULL,'MATACHI','',NULL,'2019-01-15 13:06:28',NULL),(2432,31,NULL,'MATAMOROS','',NULL,'2019-01-15 13:06:28',NULL),(2433,31,NULL,'MEOQUI','',NULL,'2019-01-15 13:06:28',NULL),(2434,31,NULL,'Praxedis G Guerrero','',NULL,'2019-01-15 13:06:28',NULL),(2435,31,NULL,'Coyame Del Sotol','',NULL,'2019-01-15 13:06:28',NULL),(2436,31,NULL,'Santa Isabel (general Trias)','',NULL,'2019-01-15 13:06:28',NULL),(2437,31,NULL,'El Tule','',NULL,'2019-01-15 13:06:28',NULL),(2438,31,NULL,'La Cruz','',NULL,'2019-01-15 13:06:28',NULL),(2439,32,NULL,'AZCAPOTZALCO','',NULL,'2019-01-15 13:06:28',NULL),(2440,32,NULL,'TLAHUAC','',NULL,'2019-01-15 13:06:28',NULL),(2441,32,NULL,'TLALPAN','',NULL,'2019-01-15 13:06:28',NULL),(2442,32,NULL,'VENUSTIANO CARRANZA','',NULL,'2019-01-15 13:06:28',NULL),(2443,32,NULL,'BENITO JUAREZ','',NULL,'2019-01-15 13:06:28',NULL),(2444,32,NULL,'XOCHIMILCO','',NULL,'2019-01-15 13:06:28',NULL),(2445,32,NULL,'COYOACAN','',NULL,'2019-01-15 13:06:28',NULL),(2446,32,NULL,'CUAJIMALPA DE MORELOS','',NULL,'2019-01-15 13:06:28',NULL),(2447,32,NULL,'CUAUHTEMOC','',NULL,'2019-01-15 13:06:28',NULL),(2448,32,NULL,'GUSTAVO A. MADERO','',NULL,'2019-01-15 13:06:28',NULL),(2449,32,NULL,'IZTACALCO','',NULL,'2019-01-15 13:06:28',NULL),(2450,32,NULL,'IZTAPALAPA','',NULL,'2019-01-15 13:06:28',NULL),(2451,32,NULL,'ALVARO OBREGON','',NULL,'2019-01-15 13:06:28',NULL),(2452,32,NULL,'MAGDALENA CONTRERAS, LA','',NULL,'2019-01-15 13:06:28',NULL),(2453,32,NULL,'MIGUEL HIDALGO','',NULL,'2019-01-15 13:06:28',NULL),(2454,32,NULL,'MILPA ALTA','',NULL,'2019-01-15 13:06:28',NULL),(2455,30,NULL,'PARRAL','',NULL,'2020-03-09 10:23:24',NULL),(2456,30,NULL,'CAPITAN LUIS ANGEL VIDAL','',NULL,'2020-03-09 10:24:18',NULL),(2457,30,NULL,'MEZCALAPA','',NULL,'2020-03-09 10:28:39',NULL),(2458,30,NULL,'EMILIANO ZAPATA','','2020-05-05 23:00:00','2020-05-06 10:14:10',NULL),(2459,45,NULL,'BILBAO','',NULL,'2020-05-20 15:11:39',NULL),(2460,45,NULL,'BARACALDO','',NULL,'2020-05-20 15:12:24',NULL),(2461,45,NULL,'GUECHO','',NULL,'2020-05-20 15:12:48',NULL),(2462,45,NULL,'PORTUGALETE','',NULL,'2020-05-20 15:13:15',NULL),(2463,45,NULL,'MARQUINA-JEMÉIN','',NULL,'2020-05-20 15:16:09',NULL),(2464,48,NULL,'Francisco morazan','',NULL,'2020-10-20 12:17:25',NULL),(2465,49,NULL,'Burgdorf','',NULL,'2020-12-08 13:37:13',NULL),(2466,50,NULL,'Priaranza de la Valduerna','',NULL,'2020-12-08 14:32:35',NULL),(2467,55,NULL,'San Cristobal','',NULL,'2023-02-27 12:07:49',NULL);

/*Table structure for table `c_nivel_gobierno` */

DROP TABLE IF EXISTS `c_nivel_gobierno`;

CREATE TABLE `c_nivel_gobierno` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_nivel_gobierno` */

insert  into `c_nivel_gobierno`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'FEDERAL','',NULL,'2021-05-26 09:43:11',NULL),(2,'ESTATAL','',NULL,'2021-05-26 09:43:17',NULL),(3,'MUNICIPAL_ALCALDIA','',NULL,'2021-05-26 09:43:20',NULL);

/*Table structure for table `c_organizaciones_privadas` */

DROP TABLE IF EXISTS `c_organizaciones_privadas`;

CREATE TABLE `c_organizaciones_privadas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_organizaciones_privadas` */

insert  into `c_organizaciones_privadas`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Acciones','',NULL,'2019-08-26 12:51:17',NULL),(2,'Cajas de ahorro','',NULL,'2019-08-26 12:51:17',NULL);

/*Table structure for table `c_pais` */

DROP TABLE IF EXISTS `c_pais`;

CREATE TABLE `c_pais` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `clave` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nacionalidad` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=211 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_pais` */

insert  into `c_pais`(`id`,`nombre`,`clave`,`nacionalidad`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Andorra','AD',NULL,'',NULL,'2025-07-01 11:30:28',NULL),(2,'Argentina','AR',NULL,'',NULL,'2025-07-01 11:30:59',NULL),(3,'Kuwait','KW',NULL,'',NULL,'2025-07-01 11:32:45',NULL),(4,'Caimán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(5,'Kazajstán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(6,'Laos',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(7,'Líbano',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(8,'Santa Lucía',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(9,'Liechtenstein',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(10,'Sri Lanka',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(11,'Liberia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(12,'Lesotho',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(13,'Samoa Americana',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(14,'Lituania',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(15,'Luxemburgo',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(16,'Libia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(17,'Marruecos',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(18,'Mónaco',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(19,'Moldova',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(20,'Madagascar',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(21,'Marshall (Islas)',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(22,'Macedonia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(23,'Malí',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(24,'Austria',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(25,'Myanmar',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(26,'Mongolia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(27,'Macao',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(28,'Marianas del Norte (Islas)',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(29,'Martinica',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(30,'Mauritania',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(31,'Montserrat',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(32,'Malta',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(33,'Mauricio',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(34,'Maldivas',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(35,'Australia',NULL,'Australiano','',NULL,'2019-03-22 15:07:17',NULL),(36,'Malawi',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(37,'México','MX','Mexicana','',NULL,'2023-10-12 11:09:29',NULL),(38,'Malasia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(39,'Mozambique',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(40,'Namibia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(41,'Niger',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(42,'Nigeria',NULL,'Nigeriana','',NULL,'2019-03-22 15:10:30',NULL),(43,'Nicaragua',NULL,'Nicaragüense','',NULL,'2021-05-31 12:26:05',NULL),(44,'Países Bajos',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(45,'Noruega',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(46,'Aruba',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(47,'Nepal',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(48,'Naurú',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(49,'Nueva Zelanda',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(50,'Omán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(51,'Panamá',NULL,'Panameña','',NULL,'2019-03-22 15:10:36',NULL),(52,'Perú',NULL,'Peruana','',NULL,'2019-03-22 15:10:52',NULL),(53,'Polinesia Francesa',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(54,'Papúa y Nueva Guinea',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(55,'Filipinas',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(56,'Pakistán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(57,'Azerbaiyán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(58,'Polonia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(59,'Pitcairn',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(60,'Puerto Rico',NULL,'Puertorriqueña','',NULL,'2019-03-22 15:11:25',NULL),(61,'Portugal',NULL,'Portuguesa','',NULL,'2019-03-22 15:11:12',NULL),(62,'Palau',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(63,'Paraguay',NULL,'Paraguaya','',NULL,'2019-03-22 15:10:40',NULL),(64,'Qatar',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(65,'Reunión',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(66,'Rumania',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(67,'Rusia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(68,'Bosnia-Herzegovina',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(69,'Rwanda',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(70,'Arabia Saudita',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(71,'Salomón',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(72,'Seychelles',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(73,'Sudán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(74,'Suecia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(75,'Singapur',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(76,'Santa Elena',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(77,'Eslovenia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(78,'Eslovaquia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(79,'Barbados',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(80,'Sierra Leona',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(81,'San Marino',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(82,'Senegal',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(83,'Somalia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(84,'Surinam',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(85,'Santo Tomás y Príncipe',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(86,'El Salvador',NULL,'Salvadoreña','',NULL,'2019-03-22 15:09:18',NULL),(87,'Siria',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(88,'Swazilandia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(89,'Chad',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(90,'Bangladesh',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(91,'Togo',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(92,'Tailandia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(93,'Tayikistán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(94,'Tokelau',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(95,'Turkmenistán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(96,'Túnez',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(97,'Tonga',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(98,'Turquía',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(99,'Trinidad y Tobago',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(100,'Tuvalu',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(101,'Bélgica',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(102,'Taiwán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(103,'Tanzania',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(104,'Ucrania',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(105,'Uganda',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(106,'Reino Unido',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(107,'Estados Unidos',NULL,'Estadounidense','',NULL,'2019-03-22 15:08:58',NULL),(108,'Uruguay',NULL,'Uruguaya','',NULL,'2019-03-22 15:11:44',NULL),(109,'Uzbekistán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(110,'Vaticano',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(111,'Venezuela',NULL,'Venezolana','',NULL,'2019-03-22 15:11:55',NULL),(112,'Emiratos Árabes Unidos',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(113,'Burkina Faso',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(114,'Vírgenes Is. (Br.)',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(115,'Vírgenes Is. (Am.)',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(116,'Vietnam',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(117,'Vanuatu',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(118,'Samoa',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(119,'Yemen',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(120,'Yugoslavia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(121,'Sudáfrica',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(122,'Zambia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(123,'Zaire',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(124,'Bulgaria',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(125,'Zimbabwe',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(126,'Bahrayn',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(127,'Burundi',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(128,'Benín',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(129,'Bermudas',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(130,'Brunei Darussalam',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(131,'Bolivia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(132,'Brasil',NULL,'Brasileña','',NULL,'2019-03-22 15:07:38',NULL),(133,'Bahamas',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(134,'Afganistán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(135,'Bhután',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(136,'Botswana',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(137,'Belarús',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(138,'Belice',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(139,'Canadá',NULL,'Canadiense','',NULL,'2019-03-22 15:07:46',NULL),(140,'República Centroafricana',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(141,'Congo',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(142,'Suiza',NULL,'Suiza','',NULL,'2020-12-08 13:29:01',NULL),(143,'Costa de Marfil',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(144,'Chile',NULL,'Chilena','',NULL,'2019-03-22 15:08:48',NULL),(145,'Antigua y Barbuda',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(146,'Camerún',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(147,'China',NULL,'China','',NULL,'2019-03-22 15:07:53',NULL),(148,'Colombia',NULL,'Colombiana','',NULL,'2019-03-22 15:07:58',NULL),(149,'Costa Rica',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(150,'Cuba',NULL,'Cubana','',NULL,'2019-03-22 15:08:18',NULL),(151,'Cabo Verde',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(152,'Chipre',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(153,'República Checa',NULL,'Checa','',NULL,'2025-03-05 14:25:55',NULL),(154,'Alemania',NULL,'Alemana','',NULL,'2019-03-22 15:06:54',NULL),(155,'Djibouti',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(156,'Anguila',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(157,'Dinamarca',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(158,'Dominica',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(159,'Republica Dominicana',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(160,'Argelia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(161,'Ecuador',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(162,'Estonia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(163,'Egipto',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(164,'España',NULL,'Española','',NULL,'2019-04-25 14:32:41',NULL),(165,'Etiopía',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(166,'Finlandia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(167,'Albania',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(168,'Fidji',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(169,'Micronesia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(170,'Francia',NULL,'Francesa','',NULL,'2019-03-22 15:09:10',NULL),(171,'Gabón',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(172,'Gran Bretaña',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(173,'Granada',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(174,'Georgia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(175,'Guyana Francesa',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(176,'Ghana',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(177,'Gambia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(178,'Armenia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(179,'Guinea',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(180,'Guadalupe',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(181,'Guinea Ecuatorial',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(182,'Grecia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(183,'Guatemala',NULL,'Guatemalteca','',NULL,'2019-03-22 15:09:30',NULL),(184,'Guam',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(185,'Guinea Bissau',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(186,'Guyana',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(187,'Honduras',NULL,'Hondureña','',NULL,'2019-03-22 15:09:36',NULL),(188,'Croacia',NULL,'Croata','',NULL,'2019-03-22 15:08:14',NULL),(189,'Antillas Holandesas',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(190,'Haití',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(191,'Hungría',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(192,'Indonesia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(193,'Irlanda',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(194,'Israel',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(195,'India',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(196,'Irak',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(197,'Irán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(198,'Islandia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(199,'Italia',NULL,'Italiana','',NULL,'2019-03-22 15:09:43',NULL),(200,'Angola',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(201,'Jamaica',NULL,'Jamaiquina','',NULL,'2019-03-22 15:09:48',NULL),(202,'Jordania',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(203,'Japón',NULL,'Japonesa','',NULL,'2019-03-22 15:10:01',NULL),(204,'Kenia',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(205,'Kirguistán',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(206,'Camboya',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(207,'Kiribati',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(208,'Comores',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(209,'Corea del Norte',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL),(210,'Corea del Sur',NULL,NULL,'',NULL,'2019-01-15 12:04:59',NULL);

/*Table structure for table `c_poder_ente` */

DROP TABLE IF EXISTS `c_poder_ente`;

CREATE TABLE `c_poder_ente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_poder_ente` */

insert  into `c_poder_ente`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'EJECUTIVO','',NULL,'2021-05-26 09:10:37',NULL),(2,'LEGISLATIVO','',NULL,'2021-05-26 09:10:43',NULL),(3,'JUDICIAL','',NULL,'2021-05-26 09:11:14',NULL),(4,'ORGANO_AUTONOMO','',NULL,'2021-05-26 09:11:23',NULL);

/*Table structure for table `c_regimen_matrimonial` */

DROP TABLE IF EXISTS `c_regimen_matrimonial`;

CREATE TABLE `c_regimen_matrimonial` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_regimen_matrimonial` */

insert  into `c_regimen_matrimonial`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'SOC','SOCIEDAD CONYUGAL','',NULL,'2021-05-26 09:46:56',NULL),(2,'SBI','SEPARACIÓN DE BIENES','',NULL,'2021-05-26 09:47:02',NULL),(3,'OTR','OTRO','',NULL,'2021-05-26 09:47:06',NULL);

/*Table structure for table `c_relacion_declarante` */

DROP TABLE IF EXISTS `c_relacion_declarante`;

CREATE TABLE `c_relacion_declarante` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_relacion_declarante` */

insert  into `c_relacion_declarante`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'CÓNYUGE','',NULL,'2021-05-26 09:47:59',NULL),(2,'CONCUBINA_CONCUBINARIO_UNION_LIBRE','',NULL,'2021-05-26 09:48:07',NULL),(3,'SOCIEDAD_DE_CONVIVENCIA','',NULL,'2021-05-26 09:48:09',NULL);

/*Table structure for table `c_relacion_familiar` */

DROP TABLE IF EXISTS `c_relacion_familiar`;

CREATE TABLE `c_relacion_familiar` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_relacion_familiar` */

insert  into `c_relacion_familiar`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'ABU','Abuelo (a)','',NULL,'2021-10-13 13:46:27',NULL),(2,'AHI','Ahijado (a)','',NULL,'2021-10-13 13:46:27',NULL),(3,'CUN','Cuñado (a)','',NULL,'2021-10-13 13:46:27',NULL),(8,'HER','Hermano (a)','',NULL,'2021-10-13 13:46:27',NULL),(9,'HIJ','Hijo (a)','',NULL,'2021-10-13 13:46:27',NULL),(10,'MAD','Madre','',NULL,'2021-10-13 13:46:27',NULL),(11,'NIE','Nieto (a)','',NULL,'2021-10-13 13:46:27',NULL),(12,'NUE','Nuera','',NULL,'2021-10-13 13:46:27',NULL),(13,'PAD','Padre','',NULL,'2021-10-13 13:46:27',NULL),(14,'PRI','Primo (a)','',NULL,'2021-10-13 13:46:27',NULL),(15,'SOB','Sobrino (a)','',NULL,'2021-10-13 13:46:27',NULL),(16,'SUE','Suegro (a)','',NULL,'2021-10-13 13:46:27',NULL),(17,'TIOA','Tio (a)','',NULL,'2021-10-13 13:46:27',NULL),(18,'YER','Yerno','',NULL,'2021-10-13 13:46:27',NULL),(19,'BISA','Bisabuelo (a)','',NULL,'2021-10-13 13:46:27',NULL),(20,'BISN','Bisnieto (a)','',NULL,'2021-10-13 13:46:27',NULL),(21,'CONB','Concubina o concubinario','',NULL,'2021-10-13 13:46:27',NULL),(22,'CONC','Concuño','',NULL,'2021-10-13 13:46:27',NULL),(23,'CONY','Conyuge','',NULL,'2021-10-13 13:46:27',NULL),(24,'TATA','Tatarabuelo (a)','',NULL,'2021-10-13 13:46:27',NULL),(25,'TATN','Tataranieto (a)','',NULL,'2021-10-13 13:46:27',NULL),(26,'NIN','Ninguno','',NULL,'2021-10-13 13:46:28',NULL),(27,'OTRO','Otro (especifique)','',NULL,'2021-10-13 13:46:28',NULL),(28,NULL,'Declarante','',NULL,'2019-09-27 10:23:48',NULL);

/*Table structure for table `c_relacion_juridica` */

DROP TABLE IF EXISTS `c_relacion_juridica`;

CREATE TABLE `c_relacion_juridica` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_relacion_juridica` */

insert  into `c_relacion_juridica`(`id`,`nombre`,`created_at`,`updated_at`,`deleted_at`) values (1,'Base','2019-11-04 00:00:00','2019-11-04 10:24:51',NULL),(2,'Confianza','2019-11-04 00:00:00','2019-11-04 10:24:51',NULL),(3,'Eventuales','2019-11-04 00:00:00','2019-11-04 10:25:15',NULL),(4,'Interinos','2019-11-04 00:00:00','2019-11-04 10:25:15',NULL);

/*Table structure for table `c_sector_industria` */

DROP TABLE IF EXISTS `c_sector_industria`;

CREATE TABLE `c_sector_industria` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_sector_industria` */

insert  into `c_sector_industria`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'AGRI','AGRICULTURA','',NULL,'2021-05-26 09:48:54',NULL),(2,'MIN','MINERÍA','',NULL,'2021-05-26 09:49:03',NULL),(3,'EELECT','ENERGÍA ELÉCTRICA','',NULL,'2021-05-26 09:49:08',NULL),(4,'CONS','CONSTRUCCIÓN','',NULL,'2021-05-26 09:49:15',NULL),(5,'INDMANU','INDUSTRIA MANUFACTURERA','',NULL,'2021-05-26 09:49:23',NULL),(6,'CMAYOR','COMERCIO AL POR MAYOR','',NULL,'2021-05-26 09:49:29',NULL),(7,'CMENOR','COMERCIO AL POR MENOR','',NULL,'2021-05-26 09:49:34',NULL),(8,'TRANS','TRANSPORTE','',NULL,'2021-05-26 09:49:40',NULL),(9,'MEDIOM','MEDIOS MASIVOS','',NULL,'2021-05-26 09:49:53',NULL),(10,'SERVFIN','SERVICIOS FINANCIEROS','',NULL,'2021-05-26 09:49:59',NULL),(11,'SERVINM','SERVICIOS INMOBILIARIOS','',NULL,'2021-05-26 09:50:08',NULL),(12,'SERVPROF','SERVICIOS PROFESIONALES','',NULL,'2021-05-26 09:50:29',NULL),(13,'SERVCORP','SERVICIOS CORPORATIVOS','',NULL,'2021-05-26 09:50:34',NULL),(14,'SERVS','SERVICIOS DE SALUD','',NULL,'2021-05-26 09:50:40',NULL),(15,'SERVESPAR','SERVICIOS DE ESPARCIMIENTO','',NULL,'2021-05-26 09:50:46',NULL),(16,'SERVALOJ','SERVICIOS DE ALOJAMIENTO','',NULL,'2021-05-26 09:50:57',NULL),(17,'OTRO','OTRO (ESPECIFIQUE)','',NULL,'2021-05-26 09:51:08',NULL);

/*Table structure for table `c_seguros` */

DROP TABLE IF EXISTS `c_seguros`;

CREATE TABLE `c_seguros` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_seguros` */

insert  into `c_seguros`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Seguro de separacion individualizado','',NULL,'2019-08-26 12:58:33',NULL),(2,'Seguro de inversion','',NULL,'2019-08-26 12:58:33',NULL),(3,'Seguro de vida','',NULL,'2019-08-26 12:58:33',NULL);

/*Table structure for table `c_sub_tipo_inversion` */

DROP TABLE IF EXISTS `c_sub_tipo_inversion`;

CREATE TABLE `c_sub_tipo_inversion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_tipo_inversion` int DEFAULT NULL,
  `tipoInversion` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_sub_tipo_inversion` */

insert  into `c_sub_tipo_inversion`(`id`,`id_tipo_inversion`,`tipoInversion`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,1,'BANC','CNOM','CUENTA DE NÓMINA','',NULL,'2019-12-23 14:53:02',NULL),(2,1,'BANC','CAHO','CUENTA DE AHORRO','',NULL,'2019-12-23 14:53:02',NULL),(3,1,'BANC',' CCHE','CUENTA DE CHEQUES','',NULL,'2019-12-23 14:53:02',NULL),(4,1,'BANC','CMAS','CUENTA MAESTRA','',NULL,'2019-12-23 14:53:04',NULL),(5,1,'BANC','CEJE','CUENTA EJE','',NULL,'2019-12-23 14:53:04',NULL),(6,1,'BANC','DPLA','DEPÓSITO A PLAZOS','',NULL,'2019-12-23 14:53:05',NULL),(7,2,'FINV','SOIN','SOCIEDADES DE INVERSIÓN','',NULL,'2019-12-23 14:53:11',NULL),(8,2,'FINV','IFEX','INVERSIONES FINANCIERAS EN EL EXTRANJERO','',NULL,'2019-12-23 14:53:11',NULL),(9,3,'ORPM','ACCI','ACCIONES','',NULL,'2019-12-23 14:53:18',NULL),(10,3,'ORPM','CSAH','CAJAS DE AHORRO','',NULL,'2019-12-23 14:53:18',NULL),(11,4,'POMM','CENT','CENTENARIOS','',NULL,'2019-12-23 14:53:19',NULL),(12,4,'POMM','DIVS','DIVISAS','',NULL,'2019-12-23 14:53:20',NULL),(13,4,'POMM','MONN','MONEDA NACIONAL','',NULL,'2019-12-23 14:53:20',NULL),(14,4,'POMM','ONZT','ONZAS TROY','',NULL,'2019-12-23 14:53:21',NULL),(15,4,'POMM','CRIP','CRIPTOMONEDAS','',NULL,'2019-12-23 14:53:22',NULL),(16,5,'SEGR','SSIN','SEGURO DE SEPARACIÓN INDIVIDUALIZADO','',NULL,'2019-12-23 14:53:24',NULL),(17,5,'SEGR','SEGI','SEGURO DE INVERSIÓN','',NULL,'2019-12-23 14:53:25',NULL),(18,5,'SEGR','SEGV','SEGURO DE VIDA','',NULL,'2019-12-23 14:53:26',NULL),(19,6,'VBUR','ADER','ACCIONES Y DERIVADOS','',NULL,'2019-12-23 14:53:27',NULL),(20,6,'VBUR','ABAN','ACEPTACIONES BANCARIAS','',NULL,'2019-12-23 14:53:27',NULL),(21,6,'VBUR','BGUB','BONOS GUBERNAMENTALES','',NULL,'2019-12-23 14:53:28',NULL),(22,6,'VBUR','PCOM','PAPEL COMERCIAL','',NULL,'2019-12-23 14:53:29',NULL),(23,7,'AFOT','AFOR','AFORES','',NULL,'2019-12-23 14:53:31',NULL),(24,7,'AFOT','FIDE','FIDEICOMISOS','',NULL,'2019-12-23 14:53:31',NULL),(25,7,'AFOT','CTES','CERTIFICADOS DE LA TESORERÍA','',NULL,'2019-12-23 14:53:32',NULL),(26,7,'AFOT','PFTE','PRÉSTAMOS A FAVOR DE UN TERCERO','',NULL,'2019-12-23 14:53:33',NULL);

/*Table structure for table `c_tipo_adeudo` */

DROP TABLE IF EXISTS `c_tipo_adeudo`;

CREATE TABLE `c_tipo_adeudo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_adeudo` */

insert  into `c_tipo_adeudo`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'CHIP','CRÉDITO HIPOTECARIO','',NULL,'2021-05-26 12:09:18',NULL),(2,'CAUT','CRÉDITO AUTOMOTRIZ','',NULL,'2021-05-26 12:09:23',NULL),(3,'CPER','CRÉDITO PERSONAL','',NULL,'2021-05-26 12:09:31',NULL),(4,'TCRN','TARJETA DE CRÉDITO BANCARIA','',NULL,'2021-05-26 12:09:39',NULL),(5,'TCRD','TARJETA DE CRÉDITO DEPARTAMENTAL','',NULL,'2021-05-26 12:09:44',NULL),(6,'PRPE','PRÉSTAMO PERSONAL','',NULL,'2021-05-26 12:09:51',NULL),(7,'OTRO','OTROS (ESPECIFIQUE)','',NULL,'2021-05-26 12:09:54',NULL);

/*Table structure for table `c_tipo_apoyo` */

DROP TABLE IF EXISTS `c_tipo_apoyo`;

CREATE TABLE `c_tipo_apoyo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_apoyo` */

insert  into `c_tipo_apoyo`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'SUB','SUBSIDIO','',NULL,'2021-05-26 12:10:47',NULL),(2,'SER','SERVICIO','',NULL,'2021-05-26 12:10:50',NULL),(3,'OBRA','OBRA','',NULL,'2021-05-26 12:10:55',NULL),(4,'OTRO','OTRO (ESPECIFIQUE)','',NULL,'2021-05-26 12:10:58',NULL);

/*Table structure for table `c_tipo_beneficio` */

DROP TABLE IF EXISTS `c_tipo_beneficio`;

CREATE TABLE `c_tipo_beneficio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_beneficio` */

insert  into `c_tipo_beneficio`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'S','SORTEO','',NULL,'2021-05-26 12:11:20',NULL),(2,'C','CONCURSO','',NULL,'2021-05-26 12:11:24',NULL),(3,'D','DONACIÓN','',NULL,'2021-05-26 12:11:30',NULL),(4,'O','OTRO (ESPECIFICO)','',NULL,'2021-05-26 12:11:34',NULL);

/*Table structure for table `c_tipo_declaracion` */

DROP TABLE IF EXISTS `c_tipo_declaracion`;

CREATE TABLE `c_tipo_declaracion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `font` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_declaracion` */

insert  into `c_tipo_declaracion`(`id`,`nombre`,`color`,`font`,`descripcion`,`created_at`,`updated_at`,`deleted_at`) values (1,'Inicial','md-bg-teal-500','md-color-teal-500','Al ingresar a una nueva dependencia',NULL,'2024-10-04 12:04:06',NULL),(2,'Modificación','md-bg-orange-500','md-color-orange-500','Se realiza cada mayo',NULL,'2019-10-25 10:56:33',NULL),(3,'Conclusión','md-bg-purple-800','md-color-purple-800','Al concluir un encargo',NULL,'2022-04-22 13:24:46',NULL),(4,'Aviso de cambio de encargo','md-bg-cyan-800','md-color-cyan-800','Aviso de cambio de encargo en la misma dependencia',NULL,'2019-10-25 10:56:48',NULL),(5,'Aviso de reingreso','md-bg-pink-300','md-color-pink-300','Aviso  de reingreso a otra dependencia despues de presentar una conclusion',NULL,'2022-04-22 13:27:04',NULL),(6,'Conflicto de intereses','md-bg-brown-500','md-color-brown-500','Conflicto de intereses',NULL,'2022-04-22 13:24:32',NULL);

/*Table structure for table `c_tipo_entidad` */

DROP TABLE IF EXISTS `c_tipo_entidad`;

CREATE TABLE `c_tipo_entidad` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `pronombres` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_entidad` */

insert  into `c_tipo_entidad`(`id`,`nombre`,`pronombres`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Oficina del Gobernador','a la Oficina del Gobernador','',NULL,'2017-07-10 10:18:01',NULL),(2,'Dependencia','esa Dependencia','',NULL,'2017-07-10 10:18:01',NULL),(3,'Órgano Desconcentrado','ese Órgano Desconcentrado','',NULL,'2017-07-10 10:18:01',NULL),(4,'Organismo Público Descentralizado Sectorizado','ese Organismo Público Descentralizado Sectorizado ','',NULL,'2017-07-10 10:18:01',NULL),(5,'Organismo Público Descentralizado Desectorizado','ese Organismo Público Descentralizado Desectorizado','',NULL,'2017-07-10 10:18:01',NULL),(6,'Organismo Auxiliar del Ejecutivo','ese Organismo Auxiliar del Ejecutivo      ','',NULL,'2017-07-10 10:18:01',NULL),(7,'Empresa de Participación Estatal','esa Empresa de Participación Estatal','',NULL,'2017-07-10 10:18:01',NULL),(8,'Municipio','ese Municipio','',NULL,'2017-07-10 10:18:01',NULL),(9,'Organismo Autonomo','ese Organismo Autonomo','',NULL,'2017-07-10 10:18:01',NULL),(10,'Otros organismos','Otros organismos','',NULL,'2017-07-10 10:18:01',NULL);

/*Table structure for table `c_tipo_fideicomiso` */

DROP TABLE IF EXISTS `c_tipo_fideicomiso`;

CREATE TABLE `c_tipo_fideicomiso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_fideicomiso` */

insert  into `c_tipo_fideicomiso`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'PUBLICO','',NULL,'2021-05-26 12:40:29',NULL),(2,'PRIVADO','',NULL,'2021-05-26 12:40:35',NULL),(3,'MIXTO','',NULL,'2021-05-26 12:40:37',NULL);

/*Table structure for table `c_tipo_ingreso` */

DROP TABLE IF EXISTS `c_tipo_ingreso`;

CREATE TABLE `c_tipo_ingreso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_ingreso` */

insert  into `c_tipo_ingreso`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Arrendamiento','',NULL,'2019-08-29 12:14:50',NULL),(2,'Regalia','',NULL,'2019-08-29 12:14:50',NULL),(3,'Sorteos','',NULL,'2019-08-29 12:14:50',NULL),(4,'Concursos','',NULL,'2019-08-29 12:14:50',NULL),(5,'Donaciones','',NULL,'2019-08-29 12:14:50',NULL),(6,'Seguro de vida','',NULL,'2019-08-29 12:14:50',NULL),(7,'Otro empleo cargo o comision del servicio publico distinto al declarado','',NULL,'2020-02-27 12:40:31',NULL),(8,'Otro (especifique en Aclaraciones/Observaciones)','',NULL,'2021-01-13 13:10:34',NULL);

/*Table structure for table `c_tipo_inmueble` */

DROP TABLE IF EXISTS `c_tipo_inmueble`;

CREATE TABLE `c_tipo_inmueble` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_inmueble` */

insert  into `c_tipo_inmueble`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'CASA','CASA','',NULL,'2021-05-26 12:41:09',NULL),(2,'DPTO','DEPARTAMENTO','',NULL,'2021-05-26 12:41:13',NULL),(3,'EDIF','EDIFICIO','',NULL,'2021-05-26 12:41:18',NULL),(4,'LOCC','LOCAL COMERCIAL','',NULL,'2021-05-26 12:41:27',NULL),(5,'BODG','BODEGA','',NULL,'2021-05-26 12:41:37',NULL),(6,'PALC','PALCO','',NULL,'2021-05-26 12:41:42',NULL),(7,'RACH','RANCHO','',NULL,'2021-05-26 12:41:47',NULL),(8,'TERR','TERRENO','',NULL,'2021-05-26 12:41:53',NULL),(9,'OTRO','OTROS (ESPECIFIQUE)','',NULL,'2021-05-26 12:41:59',NULL);

/*Table structure for table `c_tipo_institucion` */

DROP TABLE IF EXISTS `c_tipo_institucion`;

CREATE TABLE `c_tipo_institucion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_institucion` */

insert  into `c_tipo_institucion`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,NULL,'Organizaciones religiosas','',NULL,'2019-12-23 11:43:20','2019-12-23 11:43:17'),(2,NULL,'Organizaciones gubernamentales','',NULL,'2019-12-23 11:43:26','2019-12-23 11:43:21'),(3,'OB','ORGANIZACIONES BENÉFICAS','',NULL,'2021-05-26 12:58:02',NULL),(4,'PP','PARTIDOS POLÍTICOS','',NULL,'2021-05-26 12:58:08',NULL),(5,'GS','GREMIOS/SINDICATOS','',NULL,'2021-05-26 12:58:15',NULL),(6,'OTRO','OTRO (ESPECIFIQUE)','',NULL,'2021-05-26 12:58:22',NULL),(7,'OSC','ORGANIZACIONES DE LA SOCIEDAD CIVIL','',NULL,'2021-05-26 12:58:29',NULL);

/*Table structure for table `c_tipo_instrumento_ganancia` */

DROP TABLE IF EXISTS `c_tipo_instrumento_ganancia`;

CREATE TABLE `c_tipo_instrumento_ganancia` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_instrumento_ganancia` */

insert  into `c_tipo_instrumento_ganancia`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'CAP','CAPITAL','',NULL,'2021-05-26 13:03:58',NULL),(2,'FIN','FONDOS DE INVERSIÓN','',NULL,'2021-05-26 13:04:06',NULL),(3,'OPR','ORGANIZACIONES PRIVADA','',NULL,'2021-05-26 13:04:13',NULL),(4,'SSI','SEGURO DE SEPARACIÓN INDIVIDUALIZADO','',NULL,'2021-05-26 13:04:19',NULL),(5,'VBU','VALORES BURSÁTILES','',NULL,'2021-05-26 13:04:29',NULL),(6,'BON','BONOS','',NULL,'2021-05-26 13:04:35',NULL),(7,'OTRO','OTRO(ESPECIFIQUE)','',NULL,'2021-05-26 13:04:38',NULL);

/*Table structure for table `c_tipo_inversion` */

DROP TABLE IF EXISTS `c_tipo_inversion`;

CREATE TABLE `c_tipo_inversion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_inversion` */

insert  into `c_tipo_inversion`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'BANC','BANCARIA','',NULL,'2021-05-26 13:05:06',NULL),(2,'FINV','FONDOS DE INVERSIÓN','',NULL,'2021-05-26 13:05:15',NULL),(3,'ORPM','ORGANIZACIONES PRIVADAS Y/O MERCANTILES','',NULL,'2021-05-26 13:05:20',NULL),(4,'POMM','POSESIÓN DE MONEDAS Y/O METALES','',NULL,'2021-05-26 13:05:25',NULL),(5,'SEGR','SEGUROS','',NULL,'2021-05-26 13:05:30',NULL),(6,'VBUR','VALORES BURSÁTILES','',NULL,'2021-05-26 13:05:34',NULL),(7,'AFOT','AFORES Y OTROS','',NULL,'2021-05-26 13:05:37',NULL);

/*Table structure for table `c_tipo_moneda` */

DROP TABLE IF EXISTS `c_tipo_moneda`;

CREATE TABLE `c_tipo_moneda` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `clave` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_moneda` */

insert  into `c_tipo_moneda`(`id`,`nombre`,`clave`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Pesos mexicanos',NULL,'',NULL,'2019-01-11 15:10:43',NULL),(2,'Dólar estadounidense',NULL,'',NULL,'2020-04-24 15:47:53',NULL),(3,'Euro',NULL,'',NULL,'2020-04-24 15:48:00',NULL),(4,'Yen japonés',NULL,'',NULL,'2020-04-24 15:48:06',NULL),(5,'Libra esterlina',NULL,'',NULL,'2020-04-24 15:48:12',NULL),(6,'Dólar australiano',NULL,'',NULL,'2020-04-24 15:48:18',NULL),(7,'Franco suizo',NULL,'',NULL,'2020-04-24 15:48:25',NULL),(8,'Dólar canadiense',NULL,'',NULL,'2020-04-24 15:48:32',NULL),(9,'Yuan chino',NULL,'',NULL,'2020-04-24 15:48:39',NULL),(10,'Dólar neozelandés',NULL,'',NULL,'2020-04-24 15:48:45',NULL);

/*Table structure for table `c_tipo_mueble` */

DROP TABLE IF EXISTS `c_tipo_mueble`;

CREATE TABLE `c_tipo_mueble` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_mueble` */

insert  into `c_tipo_mueble`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'MECA','MENAJE DE CASA (MUEBLES Y ACCESORIOS DE CASA)','',NULL,'2021-05-26 12:12:12',NULL),(2,'APAE',' 	APARATOS ELECTRÓNICOS Y ELECTRODOMÉSTICOS','',NULL,'2021-05-26 12:12:18',NULL),(3,'JOYA','JOYAS','',NULL,'2021-05-26 12:12:23',NULL),(4,'COLEC','COLECCIONES','',NULL,'2021-05-26 12:12:27',NULL),(5,'OBRA','OBRAS DE ARTE','',NULL,'2021-05-26 12:12:32',NULL),(6,'OTRO','OTROS (ESPECIFIQUE)','',NULL,'2021-05-26 12:12:35',NULL);

/*Table structure for table `c_tipo_notificacion` */

DROP TABLE IF EXISTS `c_tipo_notificacion`;

CREATE TABLE `c_tipo_notificacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_notificacion` */

insert  into `c_tipo_notificacion`(`id`,`nombre`,`descripcion`,`created_at`,`updated_at`,`deleted_at`) values (1,'Inicial por primera vez','INGRESO AL SERVICIO PÚBLICO POR PRIMERA VEZ',NULL,'2022-03-01 12:03:27',NULL),(2,'Inicial por reingreso','REINGRESO AL SERVICIO PÚBLICO',NULL,'2022-03-01 12:03:03',NULL),(3,'Modificación',NULL,NULL,'2020-12-16 12:54:46',NULL),(4,'Conclusión',NULL,NULL,'2020-12-16 12:54:53',NULL),(5,'Aviso de cambio de Puesto/Encargo',NULL,NULL,'2021-03-05 13:46:33','2021-03-05 13:46:29'),(6,'Aviso de reingreso antes de 60d',NULL,NULL,'2021-03-05 13:46:29','2021-03-05 13:46:25'),(7,'Inicial por primera vez no obligados',NULL,NULL,'2022-01-05 15:01:22',NULL);

/*Table structure for table `c_tipo_participacion` */

DROP TABLE IF EXISTS `c_tipo_participacion`;

CREATE TABLE `c_tipo_participacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_participacion` */

insert  into `c_tipo_participacion`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'SCIO','SOCIO','',NULL,'2021-05-26 13:08:24',NULL),(2,'ACCI','ACCIONISTA','',NULL,'2021-05-26 13:08:27',NULL),(3,'COMI','COMISARIO','',NULL,'2021-05-26 13:08:32',NULL),(4,'REPR','REPRESENTANTE','',NULL,'2021-05-26 13:08:36',NULL),(5,'APOD','APODERADO','',NULL,'2021-05-26 13:08:40',NULL),(6,'COLB','COLABORADOR','',NULL,'2021-05-26 13:08:44',NULL),(7,'BENE','BENEFICIARIO','',NULL,'2021-05-26 13:08:49',NULL),(8,'OTRO','OTROS (ESPECIFIQUE)','',NULL,'2021-05-26 13:08:51',NULL);

/*Table structure for table `c_tipo_participacion_fideicomiso` */

DROP TABLE IF EXISTS `c_tipo_participacion_fideicomiso`;

CREATE TABLE `c_tipo_participacion_fideicomiso` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_participacion_fideicomiso` */

insert  into `c_tipo_participacion_fideicomiso`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'FIDEICOMITENTE','',NULL,'2021-05-26 13:09:24',NULL),(2,'FIDUCIARIO','',NULL,'2021-05-26 13:09:30',NULL),(3,'FIDEICOMISARIO','',NULL,'2021-05-26 13:09:35',NULL),(4,'COMITE_TECNICO','',NULL,'2021-05-26 13:09:38',NULL);

/*Table structure for table `c_tipo_persona` */

DROP TABLE IF EXISTS `c_tipo_persona`;

CREATE TABLE `c_tipo_persona` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_persona` */

insert  into `c_tipo_persona`(`id`,`nombre`,`created_at`,`updated_at`,`deleted_at`) values (1,'FÍSICA','2019-11-04 00:00:00','2021-05-26 13:12:02',NULL),(2,'MORAL','2019-11-04 00:00:00','2021-05-26 13:12:09',NULL),(3,'NINGUNO',NULL,'2023-01-23 15:13:35',NULL);

/*Table structure for table `c_tipo_publicacion` */

DROP TABLE IF EXISTS `c_tipo_publicacion`;

CREATE TABLE `c_tipo_publicacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_publicacion` */

insert  into `c_tipo_publicacion`(`id`,`nombre`,`created_at`,`updated_at`,`deleted_at`) values (1,'Publica','2019-01-21 00:00:00','2019-01-21 20:50:10',NULL),(2,'No publica','2019-01-21 00:00:00','2019-01-21 20:50:13',NULL),(3,'Parcialmente publica','2019-01-21 00:00:00','2019-01-21 20:50:23',NULL);

/*Table structure for table `c_tipo_representacion` */

DROP TABLE IF EXISTS `c_tipo_representacion`;

CREATE TABLE `c_tipo_representacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_representacion` */

insert  into `c_tipo_representacion`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (14,'REPRESENTANTE','',NULL,'2021-05-26 13:18:40',NULL),(15,'REPRESENTADO','',NULL,'2021-05-26 13:18:42',NULL);

/*Table structure for table `c_tipo_vehiculo` */

DROP TABLE IF EXISTS `c_tipo_vehiculo`;

CREATE TABLE `c_tipo_vehiculo` (
  `id` int NOT NULL AUTO_INCREMENT,
  `clave` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_tipo_vehiculo` */

insert  into `c_tipo_vehiculo`(`id`,`clave`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'AUMOT','AUTOMÓVIL/MOTOCICLETA','',NULL,'2021-05-26 13:19:07',NULL),(2,'AERN','AERONAVE','',NULL,'2021-05-26 13:19:12',NULL),(3,'BARYA','BARCO/YATE','',NULL,'2021-05-26 13:19:17',NULL),(4,'OTRO','OTROS (ESPECIFIQUE)','',NULL,'2021-05-26 13:19:20',NULL);

/*Table structure for table `c_titular` */

DROP TABLE IF EXISTS `c_titular`;

CREATE TABLE `c_titular` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_titular` */

insert  into `c_titular`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Declarante','',NULL,'2019-01-11 14:37:52',NULL),(2,'Declarante y conyuge','',NULL,'2019-08-26 11:27:41',NULL),(3,'Declarante en copropiedad con terceros','',NULL,'2019-08-26 11:27:41',NULL),(4,'Declarante y concubina o concubinario','',NULL,'2019-08-26 11:27:41',NULL),(5,'Declarante y concubina o concubinario en copropiedad con terceros','',NULL,'2019-08-26 11:27:41',NULL),(6,'Conyuge','',NULL,'2019-08-26 11:27:41',NULL),(7,'Conyuge en copropiedad con terceros','',NULL,'2019-08-26 11:27:41',NULL),(8,'Concubina o concubinario','',NULL,'2019-08-26 11:27:41',NULL),(9,'Concubina y concubinario en copropiedad con terceros','',NULL,'2019-08-26 11:27:41',NULL),(10,'Conviviente','',NULL,'2019-08-26 11:31:32',NULL),(11,'Declarante y conviviente','',NULL,'2019-08-26 11:31:32',NULL),(12,'Declarante y conviviente en copropiedad con terceros','',NULL,'2019-08-26 11:31:32',NULL),(13,'Conviviente y dependiente economico','',NULL,'2019-08-26 11:31:32',NULL),(14,'Conviviente y dependiente economico en copropiedad con terceros','',NULL,'2019-08-26 11:31:32',NULL),(15,'Dependiente economico','',NULL,'2019-08-26 11:31:32',NULL),(16,'Declarante y dependiente economico','',NULL,'2019-08-26 11:31:32',NULL),(17,'Dependiente economico y terceros','',NULL,'2019-08-26 11:31:32',NULL),(18,'Declarante, conyuge y dependiente economico','',NULL,'2019-08-26 11:33:57',NULL),(19,'Declarante, concubina o concubinario y dependiente economico','',NULL,'2019-08-26 11:33:57',NULL),(20,'Conyuge y dependiente economico','',NULL,'2019-08-26 11:33:57',NULL),(21,'Concubina o concubinario y dependiente economico','',NULL,'2019-08-26 11:33:57',NULL),(22,'Conyuge, dependiente economico en copropiedad con terceros','',NULL,'2019-08-26 11:33:57',NULL),(23,'Concubina o concubinario y dependiente economico en copropiedad con terceros','',NULL,'2019-08-26 11:33:57',NULL),(24,'Declarante y conyuge en copropiedad con terceros','',NULL,'2019-08-26 11:35:49',NULL);

/*Table structure for table `c_titular_interes` */

DROP TABLE IF EXISTS `c_titular_interes`;

CREATE TABLE `c_titular_interes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_titular_interes` */

insert  into `c_titular_interes`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (5,'DECLARANTE','',NULL,'2021-05-26 13:17:09',NULL),(6,'PAREJA','',NULL,'2021-05-26 13:17:15',NULL),(7,'DEPENDIENTE_ECONOMICO','',NULL,'2021-05-26 13:17:48',NULL);

/*Table structure for table `c_valores_bursatiles` */

DROP TABLE IF EXISTS `c_valores_bursatiles`;

CREATE TABLE `c_valores_bursatiles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_valores_bursatiles` */

insert  into `c_valores_bursatiles`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Acciones y derivados','',NULL,'2019-08-26 13:02:55',NULL),(2,'Aceptaciones bancarias','',NULL,'2019-08-26 13:02:55',NULL),(3,'Bonos gubernamentales','',NULL,'2019-08-26 13:02:55',NULL),(4,'Papel comercial','',NULL,'2019-08-26 13:02:55',NULL);

/*Table structure for table `c_via` */

DROP TABLE IF EXISTS `c_via`;

CREATE TABLE `c_via` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `c_via` */

insert  into `c_via`(`id`,`nombre`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,'Avenida','',NULL,'2019-01-14 12:46:07',NULL),(2,'Calle','',NULL,'2019-01-14 12:46:07',NULL),(3,'Callejon','',NULL,'2019-01-14 12:46:07',NULL),(4,'Cerrada','',NULL,'2019-01-14 12:46:07',NULL),(5,'Calzada','',NULL,'2019-03-19 16:18:48',NULL),(6,'Boulevard','',NULL,'2019-03-20 11:46:11',NULL),(7,'Andador','','2019-03-20 15:56:10','2019-03-20 15:56:10',NULL),(8,'Sección','','2019-03-20 15:56:21','2019-03-20 15:56:21',NULL),(9,'Carretera','',NULL,'2019-03-21 14:02:35',NULL),(10,'Circuito','','2019-03-27 11:14:19','2019-03-27 11:14:19',NULL),(11,'Prolongación','','2019-03-28 11:38:25','2019-03-28 11:38:25',NULL),(12,'Privada','','2019-03-28 11:38:30','2019-03-28 11:38:30',NULL),(13,'Circunvalación','','2019-03-28 11:38:44','2019-03-28 11:38:44',NULL),(14,'Libramiento','','2019-04-03 09:35:40','2019-04-03 09:35:40',NULL);

/*Table structure for table `declaraciones` */

DROP TABLE IF EXISTS `declaraciones`;

CREATE TABLE `declaraciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `id_persona_aux` int DEFAULT NULL COMMENT 'Solo sirve para migracion',
  `curp_aux` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'solo sirve en la migracion',
  `id_declarachiapas` int DEFAULT NULL COMMENT 'Solo sirve para migracion',
  `id_tipo_declaracion` int NOT NULL,
  `id_c_declaracion` int DEFAULT NULL,
  `dependencia` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `id_tipo_publicacion` tinyint(1) DEFAULT NULL,
  `sec_01_01` tinyint(1) DEFAULT NULL,
  `sec_01_01_p` tinyint(1) DEFAULT NULL,
  `sec_01_02` tinyint(1) DEFAULT NULL,
  `sec_01_02_p` tinyint(1) DEFAULT NULL,
  `sec_01_03` tinyint(1) DEFAULT NULL,
  `sec_01_03_p` tinyint(1) DEFAULT NULL,
  `sec_01_03_ninguno` tinyint(1) DEFAULT '0',
  `sec_01_04` tinyint(1) DEFAULT NULL,
  `sec_01_04_p` tinyint(1) DEFAULT NULL,
  `sec_01_05` tinyint(1) DEFAULT NULL,
  `sec_01_05_p` tinyint(1) DEFAULT NULL,
  `sec_01_05_ninguno` tinyint(1) DEFAULT '0',
  `sec_01_06` tinyint(1) DEFAULT NULL,
  `sec_01_06_p` tinyint(1) DEFAULT NULL,
  `sec_01_06_ninguno` tinyint(1) DEFAULT '0',
  `sec_01_07` tinyint(1) DEFAULT NULL,
  `sec_01_07_p` tinyint(1) DEFAULT NULL,
  `sec_01_07_ninguno` tinyint(1) DEFAULT '0',
  `sec_01_08` tinyint(1) DEFAULT NULL,
  `sec_01_08_p` tinyint(1) DEFAULT NULL,
  `sec_01_09` tinyint(1) DEFAULT NULL,
  `sec_01_09_p` tinyint(1) DEFAULT NULL,
  `sec_01_10` tinyint(1) DEFAULT NULL,
  `sec_01_10_p` tinyint(1) DEFAULT NULL,
  `sec_01_10_ninguno` tinyint(1) DEFAULT '0',
  `sec_01_11` tinyint(1) DEFAULT NULL,
  `sec_01_11_p` tinyint(1) DEFAULT NULL,
  `sec_01_11_ninguno` tinyint(1) DEFAULT '0',
  `sec_01_12` tinyint(1) DEFAULT NULL,
  `sec_01_12_p` tinyint(1) DEFAULT NULL,
  `sec_01_12_ninguno` tinyint(1) DEFAULT '0',
  `sec_01_13` tinyint(1) DEFAULT NULL,
  `sec_01_13_p` tinyint(1) DEFAULT NULL,
  `sec_01_13_ninguno` tinyint(1) DEFAULT '0',
  `sec_01_14` tinyint(1) DEFAULT NULL,
  `sec_01_14_p` tinyint(1) DEFAULT NULL,
  `sec_01_14_ninguno` tinyint(1) DEFAULT '0',
  `sec_01_15` tinyint(1) DEFAULT NULL,
  `sec_01_15_p` tinyint(1) DEFAULT NULL,
  `sec_01_15_ninguno` tinyint(1) DEFAULT '0',
  `sec_02_01` tinyint(1) DEFAULT NULL,
  `sec_02_01_p` tinyint(1) DEFAULT NULL,
  `sec_02_01_ninguno` tinyint(1) DEFAULT '0',
  `sec_02_02` tinyint(1) DEFAULT NULL,
  `sec_02_02_p` tinyint(1) DEFAULT NULL,
  `sec_02_02_ninguno` tinyint(1) DEFAULT '0',
  `sec_02_03` tinyint(1) DEFAULT NULL,
  `sec_02_03_p` tinyint(1) DEFAULT NULL,
  `sec_02_03_ninguno` tinyint(1) DEFAULT '0',
  `sec_02_04` tinyint(1) DEFAULT NULL,
  `sec_02_04_p` tinyint(1) DEFAULT NULL,
  `sec_02_04_ninguno` tinyint(1) DEFAULT '0',
  `sec_02_05` tinyint(1) DEFAULT NULL,
  `sec_02_05_p` tinyint(1) DEFAULT NULL,
  `sec_02_05_ninguno` tinyint(1) DEFAULT '0',
  `sec_02_06` tinyint(1) DEFAULT NULL,
  `sec_02_06_p` tinyint(1) DEFAULT NULL,
  `sec_02_06_ninguno` tinyint(1) DEFAULT '0',
  `sec_02_07` tinyint(1) DEFAULT NULL,
  `sec_02_07_p` tinyint(1) DEFAULT NULL,
  `sec_02_07_ninguno` tinyint(1) DEFAULT '0',
  `sec_03_01` tinyint(1) DEFAULT NULL,
  `sec_03_01_p` tinyint(1) DEFAULT NULL,
  `sec_03_01_ninguno` tinyint(1) DEFAULT '0',
  `observaciones` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `es_extemporanea` tinyint(1) DEFAULT NULL,
  `vobo` bit(1) NOT NULL DEFAULT b'0',
  `serie_certificado` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `secuencia_firma` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_firma` datetime DEFAULT NULL,
  `firma_electronica` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cadena_original` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `uuid` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `noOficio` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fechaSellado` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cadenaSello` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `xml` longblob,
  `campo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sendPDN` bigint DEFAULT '0',
  `dateSendPDN` date DEFAULT NULL,
  `errorPDN` longtext CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `anio_anual` int DEFAULT NULL,
  `complementaria` bit(1) DEFAULT b'0',
  `comodin` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_tipo_declaracion` (`id_tipo_declaracion`) USING BTREE,
  KEY `id_tipo_publicacion` (`id_tipo_publicacion`) USING BTREE,
  KEY `id_persona` (`id_persona`) USING BTREE,
  KEY `id_persona_aux` (`id_persona_aux`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=652088 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `declaraciones` */

insert  into `declaraciones`(`id`,`id_persona`,`id_persona_aux`,`curp_aux`,`id_declarachiapas`,`id_tipo_declaracion`,`id_c_declaracion`,`dependencia`,`fecha_inicio`,`fecha_fin`,`id_tipo_publicacion`,`sec_01_01`,`sec_01_01_p`,`sec_01_02`,`sec_01_02_p`,`sec_01_03`,`sec_01_03_p`,`sec_01_03_ninguno`,`sec_01_04`,`sec_01_04_p`,`sec_01_05`,`sec_01_05_p`,`sec_01_05_ninguno`,`sec_01_06`,`sec_01_06_p`,`sec_01_06_ninguno`,`sec_01_07`,`sec_01_07_p`,`sec_01_07_ninguno`,`sec_01_08`,`sec_01_08_p`,`sec_01_09`,`sec_01_09_p`,`sec_01_10`,`sec_01_10_p`,`sec_01_10_ninguno`,`sec_01_11`,`sec_01_11_p`,`sec_01_11_ninguno`,`sec_01_12`,`sec_01_12_p`,`sec_01_12_ninguno`,`sec_01_13`,`sec_01_13_p`,`sec_01_13_ninguno`,`sec_01_14`,`sec_01_14_p`,`sec_01_14_ninguno`,`sec_01_15`,`sec_01_15_p`,`sec_01_15_ninguno`,`sec_02_01`,`sec_02_01_p`,`sec_02_01_ninguno`,`sec_02_02`,`sec_02_02_p`,`sec_02_02_ninguno`,`sec_02_03`,`sec_02_03_p`,`sec_02_03_ninguno`,`sec_02_04`,`sec_02_04_p`,`sec_02_04_ninguno`,`sec_02_05`,`sec_02_05_p`,`sec_02_05_ninguno`,`sec_02_06`,`sec_02_06_p`,`sec_02_06_ninguno`,`sec_02_07`,`sec_02_07_p`,`sec_02_07_ninguno`,`sec_03_01`,`sec_03_01_p`,`sec_03_01_ninguno`,`observaciones`,`es_extemporanea`,`vobo`,`serie_certificado`,`secuencia_firma`,`fecha_firma`,`firma_electronica`,`cadena_original`,`uuid`,`noOficio`,`fechaSellado`,`cadenaSello`,`xml`,`campo`,`sendPDN`,`dateSendPDN`,`errorPDN`,`created_at`,`updated_at`,`deleted_at`,`anio_anual`,`complementaria`,`comodin`) values (652078,107,NULL,'',NULL,1,1,'Tribunal de Justicia Administrativa del Estado de Chiapas','2025-07-01 12:13:04',NULL,NULL,NULL,NULL,1,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,'\0',NULL,NULL,'2025-07-02 13:16:45',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-07-01 12:13:04','2025-07-02 13:16:47',NULL,2025,'\0',NULL),(652079,64,NULL,'',NULL,1,1,'Tribunal de Justicia Administrativa del Estado de Chiapas','2025-07-01 01:02:51',NULL,NULL,1,NULL,1,NULL,1,NULL,0,1,NULL,1,NULL,0,1,NULL,1,1,NULL,0,1,NULL,1,NULL,1,NULL,0,1,NULL,0,1,NULL,1,1,NULL,0,1,NULL,0,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-07-01 13:02:51','2025-07-02 15:31:04',NULL,2025,'\0',NULL),(652080,65,NULL,'',NULL,1,1,'Tribunal de Justicia Administrativa del Estado de Chiapas','2025-07-02 10:00:00',NULL,NULL,1,NULL,1,NULL,1,NULL,0,1,NULL,1,NULL,0,1,NULL,1,1,NULL,1,1,NULL,1,NULL,1,NULL,1,1,NULL,1,1,NULL,1,0,NULL,0,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,NULL,NULL,0,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-07-02 10:00:00','2025-07-02 15:22:47',NULL,2025,'\0',NULL),(652081,30,NULL,'',NULL,1,1,'Tribunal de Justicia Administrativa del Estado de Chiapas','2025-07-02 11:56:17',NULL,NULL,1,NULL,1,NULL,1,NULL,0,1,NULL,1,NULL,0,1,NULL,0,1,NULL,0,1,NULL,1,NULL,1,NULL,1,1,NULL,0,1,NULL,1,NULL,NULL,0,1,NULL,0,1,NULL,1,1,NULL,0,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,0,1,NULL,0,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-07-02 11:56:17','2025-07-02 14:09:49',NULL,2025,'\0',NULL),(652082,5,NULL,'',NULL,1,1,'Tribunal de Justicia Administrativa del Estado de Chiapas','2025-07-02 12:06:00',NULL,NULL,1,NULL,1,NULL,1,NULL,0,1,NULL,1,NULL,0,1,NULL,1,1,NULL,1,1,NULL,1,NULL,1,NULL,1,1,NULL,0,1,NULL,1,1,NULL,1,1,NULL,0,1,NULL,0,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-07-02 12:06:00','2025-07-02 13:47:34',NULL,2025,'\0',NULL),(652083,42,NULL,'',NULL,1,1,'Tribunal de Justicia Administrativa del Estado de Chiapas','2025-07-02 12:14:39',NULL,NULL,1,NULL,1,NULL,1,NULL,0,1,NULL,1,NULL,0,1,NULL,0,1,NULL,0,1,NULL,1,NULL,1,NULL,1,1,NULL,0,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,NULL,NULL,0,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-07-02 12:14:39','2025-07-02 14:42:09',NULL,2025,'\0',NULL),(652084,72,NULL,'',NULL,1,1,'Tribunal de Justicia Administrativa del Estado de Chiapas','2025-07-02 12:21:59',NULL,NULL,1,NULL,1,NULL,1,NULL,0,1,NULL,1,NULL,0,1,NULL,1,1,NULL,0,1,NULL,1,NULL,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-07-02 12:21:59','2025-07-02 13:49:08',NULL,2025,'\0',NULL),(652085,44,NULL,'',NULL,1,1,'Tribunal de Justicia Administrativa del Estado de Chiapas','2025-07-02 12:40:00',NULL,NULL,1,NULL,1,NULL,1,NULL,0,1,NULL,1,NULL,0,1,NULL,0,1,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-07-02 12:40:00','2025-07-02 14:54:29',NULL,2025,'\0',NULL),(652086,106,NULL,'',NULL,1,1,'Tribunal de Justicia Administrativa del Estado de Chiapas','2025-07-02 01:10:39',NULL,NULL,1,NULL,1,NULL,1,NULL,0,1,NULL,1,NULL,0,1,NULL,1,1,NULL,1,1,NULL,1,NULL,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,1,NULL,1,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-07-02 13:10:39','2025-07-02 13:35:11',NULL,2025,'\0',NULL),(652087,78,NULL,'',NULL,1,1,'Tribunal de Justicia Administrativa del Estado de Chiapas','2025-07-02 01:18:38',NULL,NULL,1,NULL,1,NULL,1,NULL,0,1,NULL,1,NULL,0,1,NULL,0,1,NULL,1,1,NULL,1,NULL,1,NULL,0,1,NULL,0,1,NULL,0,0,NULL,0,1,NULL,1,1,NULL,1,1,NULL,0,1,NULL,0,1,NULL,0,1,NULL,0,1,NULL,0,1,NULL,0,1,NULL,0,1,NULL,0,NULL,NULL,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,'2025-07-02 13:18:38','2025-07-02 15:37:07',NULL,2025,'\0',NULL);

/*Table structure for table `domicilios` */

DROP TABLE IF EXISTS `domicilios`;

CREATE TABLE `domicilios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_pais` int DEFAULT NULL,
  `id_municipio` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `provincia` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `codigo_postal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `colonia` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `calle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `num_exterior` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `num_interior` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `curp_aux` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_municipio` (`id_municipio`) USING BTREE,
  KEY `id_pais` (`id_pais`) USING BTREE,
  KEY `id_estado` (`id_estado`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=397109 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `domicilios` */

insert  into `domicilios`(`id`,`id_pais`,`id_municipio`,`id_estado`,`provincia`,`codigo_postal`,`colonia`,`calle`,`num_exterior`,`num_interior`,`created_at`,`updated_at`,`deleted_at`,`curp_aux`) values (396984,37,51,30,NULL,'29025','FRAC. ATENAS','C. HOMERO','330','330','2025-06-24 09:52:05','2025-06-24 09:52:05',NULL,NULL),(396985,37,51,30,NULL,'29034','MONTEBELLO','C. LAGUNA ENSUEÑO','110','110','2025-06-24 10:07:05','2025-06-24 10:07:05',NULL,NULL),(396986,37,51,30,NULL,'29034','LA PIMIENTA','13 AV. NORTE ORIENTE','318','A','2025-06-24 15:20:13','2025-06-24 15:20:13',NULL,NULL),(396987,37,51,30,NULL,'29027','SAN JOSE CHAPULTEPEC','C. ANDADOR PERGOLA','538-A','SN','2025-06-24 15:24:43','2025-06-24 15:24:43',NULL,NULL),(396988,37,51,30,NULL,'29047','24 DE JUNIO','RIO OSUMACINTA MZ-29','320','320','2025-06-24 15:28:32','2025-06-24 15:28:32',NULL,NULL),(396989,37,51,30,NULL,'29047','24 DE JUNIO','RIO LAJAS','415','SN','2025-06-24 15:31:46','2025-06-24 15:31:46',NULL,NULL),(396990,37,51,30,NULL,'29060','XAMAIPAK','16 PONIENTE SUR','750','S/N','2025-06-24 15:32:21','2025-06-24 15:32:21',NULL,NULL),(396991,37,51,30,NULL,'29010','LA VICTORIA','C. DOCTOR RODULFO FIGUEROA','411','S/N','2025-06-24 15:36:39','2025-06-24 15:36:39',NULL,NULL),(396992,37,51,30,NULL,'29078','MAGISTERIAL','C. ENRIQUETA CAMARILLO','16','SN','2025-06-24 15:39:56','2025-06-24 15:39:56',NULL,NULL),(396993,37,51,30,NULL,'29044','INFONAVIT GRIJALVA 1','ANDADOR 7 MZ-15','43','S/N','2025-06-24 15:41:54','2025-06-24 15:41:54',NULL,NULL),(396994,37,51,30,NULL,'29096','FRAC. LA VICTORIA','AV. AMECA','262','SN','2025-06-24 15:45:09','2025-06-24 15:45:09',NULL,NULL),(396995,37,51,30,NULL,'29020','PLAN DE AYALA SUR','C. OAXACA','503','S/N','2025-06-24 15:46:05','2025-06-24 15:46:05',NULL,NULL),(396996,37,51,30,NULL,'29020','LA ESMERALDA','C. LA ESMERALDA','209','S/N','2025-06-24 15:46:36','2025-06-24 15:46:36',NULL,NULL),(396997,37,51,30,NULL,'29030','SAN PEDRO POPULAR MIRADOR','C. SAN GABRIEL','227','SN','2025-06-24 15:50:03','2025-06-24 15:50:03',NULL,NULL),(396998,37,73,30,NULL,'29165','JARDINES DEL GRIJALVA','AV. ENCINO','5132','S/N','2025-06-24 15:50:29','2025-06-24 15:50:29',NULL,NULL),(396999,37,24,30,NULL,'29290','LA ISLA','CALZADA MANUEL VELASCO SUAREZ','54','S/N','2025-06-24 15:53:48','2025-06-24 15:53:48',NULL,NULL),(397000,37,51,30,NULL,'29010','LA VICTORIA','C. DOCTOR RODULFO FIGUEROA','411','411','2025-06-24 15:54:40','2025-06-24 15:54:40',NULL,NULL),(397001,37,51,30,NULL,'29049','FRACC. SAN FERNANDO','C. TOPACIO','312','SN','2025-06-24 15:55:42','2025-06-24 15:55:42',NULL,NULL),(397002,37,51,30,NULL,'29019','CRUZ CON CASITA','AV. MALPASO','289','S/N','2025-06-24 15:56:43','2025-06-24 15:56:43',NULL,NULL),(397003,37,51,30,NULL,'29045','INSURGENTE','C. BUGAMBILIAS M-30 L-2','S/N','S/N','2025-06-24 15:58:23','2025-06-24 15:58:23',NULL,NULL),(397004,37,51,30,NULL,'29059','SOLIDARIDAD TERAN','C. PRIVADA 9 SUR ORIENTE MZ-02','12','S/N','2025-06-24 16:00:12','2025-06-24 16:00:12',NULL,NULL),(397006,37,51,30,NULL,'29014','VALLE DORADO','AV. ORO','115-B','SN','2025-06-24 16:01:11','2025-06-24 16:01:11',NULL,NULL),(397007,37,51,30,NULL,'29076','EMILIANO ZAPATA','C. JOSE MARAI MORELOS Y PAVON','968','968','2025-06-24 16:02:51','2025-06-24 16:02:51',NULL,NULL),(397008,37,51,30,NULL,'29096','LOS PAJAROS','C. CERRADA GAVIOTAS','169','S/N','2025-06-24 16:03:31','2025-06-24 16:03:31',NULL,NULL),(397009,37,51,30,NULL,'29057','SAN JOSE TERAN','AV. CENTRAL ORIENTE','279','S/N','2025-06-24 16:05:01','2025-06-24 16:05:01',NULL,NULL),(397010,37,51,30,NULL,'29096','FRACC. FSTSE','AV. FSTSE','320','SN','2025-06-24 16:06:33','2025-06-24 16:06:33',NULL,NULL),(397011,37,51,30,NULL,'29066','SAN FRANCISCO','8 PONIENTE SUR','1630','S/N','2025-06-24 16:07:38','2025-06-24 16:07:38',NULL,NULL),(397012,37,51,30,NULL,'29020','PLAN DE AYALA AMPLIACION NORTE','C. LAS TORRES','2','2','2025-06-24 16:08:02','2025-06-24 16:08:02',NULL,NULL),(397013,37,51,30,NULL,'29067','Xamaipak','Blvd Belisario Dominguez, Esquina 16 poniente.','1713','S/N','2025-06-24 16:08:33','2025-07-02 12:16:26',NULL,NULL),(397014,37,51,30,NULL,'29000','DEMOCRATICA','AV. TOPACIO MZ-43 L-3','3','SN','2025-06-24 16:13:36','2025-06-24 16:13:36',NULL,NULL),(397015,37,51,30,NULL,'29070','LA SALLE 3RA SECCION','AV. MONTPELLIER','185','185','2025-06-24 16:20:36','2025-06-24 16:20:36',NULL,NULL),(397016,37,51,30,NULL,'29066','LOS MILAGROS','5 PONIENTE SUR','850-B','S/','2025-06-24 16:21:31','2025-06-24 16:21:31',NULL,NULL),(397017,37,51,30,NULL,'29017','CAPULINES 1','AV. 6','7','SN','2025-06-24 16:23:45','2025-06-24 16:23:45',NULL,NULL),(397018,37,51,30,NULL,'29050','RESIDENCIAL BONANZAS','C. LANTANA','181','S/N','2025-06-24 16:25:10','2025-06-24 16:25:10',NULL,NULL),(397020,37,51,30,NULL,'29090','EL ROBLE','C. FRANCISCO I MADERO','660','660','2025-06-24 16:25:37','2025-06-24 16:25:37',NULL,NULL),(397021,37,73,30,NULL,'29160','BARRIO BENITO JUAREZ','AV. MIGUEL HIDALGO','147','SN','2025-06-24 16:27:39','2025-06-24 16:27:39',NULL,NULL),(397022,37,51,30,NULL,'29057','SAN JOSE TERAN','4 SUR PONIENTE','504','S/N','2025-06-24 16:28:46','2025-06-24 16:28:46',NULL,NULL),(397023,37,73,30,NULL,'29160','SANTO TOMAS','AV. CUAUHTEMOC','37','SN','2025-06-24 16:30:48','2025-06-24 16:30:48',NULL,NULL),(397024,37,51,30,NULL,'29066','FRAC. COLINAS DEL SUR','C. CERRADA RIO USUMACINTA','458','S/N','2025-06-24 16:31:20','2025-06-24 16:31:20',NULL,NULL),(397025,37,51,30,NULL,'29059','FRAC. EL DIAMANTE','AV. LA COYOTA','274','274','2025-06-24 16:32:50','2025-06-24 16:32:50',NULL,NULL),(397026,37,51,30,NULL,'29055','FRAC. BONANZA','AV. CEREZO','407','S/N','2025-06-24 16:32:59','2025-06-24 16:32:59',NULL,NULL),(397027,37,51,30,NULL,'29060','PENIPAK','19 PONIENTE SUR','439','SN','2025-06-24 16:33:43','2025-06-24 16:33:43',NULL,NULL),(397028,37,51,30,NULL,'29025','FRACC. CENTENARIO TUXTLAN','CALLE PALENQUE','386','SN','2025-06-24 16:36:24','2025-06-24 16:36:24',NULL,NULL),(397029,37,51,30,NULL,'29075','LA MODERNA','BOULEVARD LA SALLE','490','S/N','2025-06-24 16:36:25','2025-06-24 16:36:25',NULL,NULL),(397030,37,51,30,NULL,'29025','ATENAS','AV. TONINA','330','S/N','2025-06-24 16:36:38','2025-06-24 16:36:38',NULL,NULL),(397032,37,51,30,NULL,'29090','FRAC. SANTA ROSALIA','C. CIRCUITO MARGARITA','123','123','2025-06-24 16:38:05','2025-06-24 16:38:05',NULL,NULL),(397033,37,51,30,NULL,'29065','EL ZOQUE','NACAPITU','17','S/N','2025-06-24 16:38:30','2025-06-24 16:38:30',NULL,NULL),(397034,37,24,30,NULL,'29264','FATIMA','C. RIO GRIJALVA','6','SN','2025-06-24 16:40:48','2025-06-24 16:40:48',NULL,NULL),(397035,37,51,30,NULL,'29017','NATALIA VENEGAS','AV. MONTALAS BLANCAS','138','S/N','2025-06-24 16:41:21','2025-06-24 16:41:21',NULL,NULL),(397036,37,51,30,NULL,'29025','FRAC. ATENAS','AV. ANAXAGORAS','343','S/N','2025-06-24 16:42:42','2025-06-24 16:42:42',NULL,NULL),(397037,37,51,30,NULL,'29045','LAS TORRES','C. MARGARITAS 1','29','S/N','2025-06-24 16:43:46','2025-06-24 16:43:46',NULL,NULL),(397038,37,51,30,NULL,'29050','AMPLIACION TERAN','2 SUR ORIENTE','1176','SN','2025-06-24 16:43:57','2025-06-24 16:43:57',NULL,NULL),(397039,37,75,30,NULL,'29019','CRUZ CON CASITA','C. CHICOASEN','435','SN','2025-06-24 16:46:38','2025-06-24 16:46:38',NULL,NULL),(397040,37,51,30,NULL,'29050','TERAN','CERRADA LOS COMPADRES','452','SN','2025-06-24 16:46:47','2025-06-24 16:46:47',NULL,NULL),(397041,37,51,30,NULL,'29030','TIZATILLO','PRIVADA DE LA 9 NORTE PONIENTE','1661','S/N','2025-06-24 16:47:09','2025-06-24 16:47:09',NULL,NULL),(397042,37,51,30,NULL,'29049','SAN PEDRO PROGRESIVO','AV. NIDO DEL AGUILA MZ-39 L-18','83','83','2025-06-24 16:49:10','2025-06-24 16:49:10',NULL,NULL),(397043,37,51,30,NULL,'29017','CAPULINES','AV. 8 MZ-6','18','SN','2025-06-24 16:49:25','2025-06-24 16:49:25',NULL,NULL),(397044,37,51,30,NULL,'29000','CENTRO','1 SUR ORIENTE','915','S/N','2025-06-24 16:50:05','2025-06-24 16:50:05',NULL,NULL),(397045,37,80,30,NULL,'30069','BARRIO SANTA CECILIA','5 NORTE PONIENTE','78','S/N','2025-06-24 16:51:11','2025-06-24 16:51:11',NULL,NULL),(397046,37,73,30,NULL,'29160','BARRIO SAN JACINTO','AV. ZARAGOZA','347','SN','2025-06-24 16:53:54','2025-06-24 16:53:54',NULL,NULL),(397047,37,51,30,NULL,'29047','24 DE JUNIO','AV. RIO TULIJA','226','S/N','2025-06-24 16:56:48','2025-06-24 16:56:48',NULL,NULL),(397048,37,73,30,NULL,'29170','NARCISO MENDOZA','C. 15 DE SEPTIEMBRE','18','S/N','2025-06-24 17:00:51','2025-06-24 17:00:51',NULL,NULL),(397049,37,51,30,NULL,'29010','EL VALLE','C. FLAMBOYAN','35','S/N','2025-06-24 17:03:35','2025-06-24 17:03:35',NULL,NULL),(397050,37,51,30,NULL,'29066','SAN FRANCISCO','18 SUR PONIENTE','353','S/N','2025-06-25 10:17:37','2025-06-25 10:17:37',NULL,NULL),(397051,37,51,30,NULL,'29057','FRAC. SAN PATRICIO','AV. SAN SEBASTIAN MZ-3 LT-10','117','S/N','2025-06-25 10:22:28','2025-06-25 10:22:28',NULL,NULL),(397052,37,51,30,NULL,'29067','XAMAIPAK','C. COPAINALA','392','S/N','2025-06-25 10:22:33','2025-06-25 10:22:33',NULL,NULL),(397053,37,51,30,NULL,'29000','CENTRO','C. 7 AV. SUR OTE','557','S/N','2025-06-25 10:25:23','2025-06-25 10:25:23',NULL,NULL),(397054,37,51,30,NULL,'29077','BIENESTAR SOCIAL','AV. 16 DE SEPTIEMBRE','485','S/N','2025-06-25 10:27:45','2025-06-25 10:27:45',NULL,NULL),(397055,37,51,30,NULL,'29026','PARAISO OJO DE AGUA','RIO RIACHUELO','456','456','2025-06-25 11:14:51','2025-06-25 11:14:51',NULL,NULL),(397056,37,51,30,NULL,'29039','MIRAVALLE','AV. VELADEZ','1404','1404','2025-06-25 11:20:40','2025-06-25 11:20:40',NULL,NULL),(397057,37,51,30,NULL,'29078','LOS CHOFERES','CERRADA CENTRAL','232','232','2025-06-25 11:25:14','2025-06-25 11:25:14',NULL,NULL),(397058,37,51,30,NULL,'29080','LOMAS DEL VENADO','C. PRIVADA DE LA 8VA ORIENTE SUR','1925','1925','2025-06-25 11:30:28','2025-06-25 11:30:28',NULL,NULL),(397059,37,51,30,NULL,'29045','VIDA MEJOR','AV. LAUREL EDIFICIO A04 LOS POETAS V','1A','1A','2025-06-25 11:35:49','2025-06-25 11:35:49',NULL,NULL),(397060,37,51,30,NULL,'29017','FRAC. ESTRADA','AV. CENTRAL OTE','177','177','2025-06-25 11:40:49','2025-06-25 11:40:49',NULL,NULL),(397061,37,51,30,NULL,'29000','CENTRO','8 SUR PONIENTE','423','423','2025-06-25 11:49:46','2025-06-25 11:49:46',NULL,NULL),(397062,37,51,30,NULL,'29080','LOMAS DEL VENADO','C. 8 ORIENTE SUR PRIVADA','1925','1925','2025-06-25 11:54:11','2025-06-25 11:54:11',NULL,NULL),(397063,37,51,30,NULL,'29034','LA PIMIENTA','5 ORIENTE NORTE','1059','1059','2025-06-25 11:59:01','2025-06-25 11:59:01',NULL,NULL),(397065,37,51,30,NULL,'29049','SAN PEDRO PROGRESIVO','C. ANDADOR CERO DEL TRIUNFO MZ-31 L-15','543','543','2025-06-25 12:03:05','2025-06-25 12:03:05',NULL,NULL),(397066,37,51,30,NULL,'29020','PLAN AYALA','PRIVADA GUADALAJARA','10','10','2025-06-25 12:08:20','2025-06-25 12:08:20',NULL,NULL),(397067,37,51,30,NULL,'29044','FRAC. EL VERGEL','AV. FRESNO','251','251','2025-06-25 12:13:32','2025-06-25 12:13:32',NULL,NULL),(397068,37,51,30,NULL,'29037','BARRIO NIÑO DE ATOCHA','12 NORTE PINIENTE','920','920','2025-06-25 12:17:45','2025-06-25 12:17:45',NULL,NULL),(397069,37,51,30,NULL,'29019','FRAC. LAS FLORES','C. CLAVEL','2005','2005','2025-06-25 12:23:00','2025-06-25 12:23:00',NULL,NULL),(397070,37,51,30,NULL,'29078','MAGISTERIAL','AV. ENRIQUETA CAMARILLO','21','21','2025-06-25 12:27:54','2025-06-25 12:27:54',NULL,NULL),(397071,37,51,30,NULL,'29057','SAN JOSE TERAN','C. CALZADA CONASUPO','71','71','2025-06-25 12:36:01','2025-06-25 12:36:01',NULL,NULL),(397072,37,51,30,NULL,'29020','PLAN DE AYALA SUR','CALLE OAXACA','28','28','2025-06-25 12:40:24','2025-06-25 12:40:24',NULL,NULL),(397073,37,51,30,NULL,'29045','VIDA MEJOR','AV. JAIME SABINES','37','37','2025-06-25 12:44:35','2025-06-25 12:44:35',NULL,NULL),(397074,37,51,30,NULL,'29077','BIENESTAR SOCIAL','AV. REVOLUCION','959','959','2025-06-25 12:48:55','2025-06-25 12:48:55',NULL,NULL),(397075,37,51,30,NULL,'29000','SAN FRANCISCO','5 PONIENTE SUR','1556','1556','2025-06-25 12:53:10','2025-06-25 12:53:10',NULL,NULL),(397076,37,51,30,NULL,'29090','CAMINERA','C. UBILIO GARCIA','257','257','2025-06-25 12:56:44','2025-06-25 12:56:44',NULL,NULL),(397077,37,51,30,NULL,'29020','PLAN DE AYALA','CALZADA JUAN CRISPIN','53','53','2025-06-25 13:01:58','2025-06-25 13:01:58',NULL,NULL),(397078,37,51,30,NULL,'29050','TERAN','1 PONIENTE NORTE','418','418','2025-06-25 13:06:21','2025-06-25 13:06:21',NULL,NULL),(397080,37,61,30,NULL,'29000','LA LIBERTAD','AV. LAUREL ESQ PALMA VIAJERA','S/N','S/N','2025-06-25 13:13:10','2025-06-25 13:13:10',NULL,NULL),(397081,37,51,30,NULL,'29100','COPOYA','1 SUR ORIENTE','60','60','2025-06-25 13:18:02','2025-06-25 13:18:02',NULL,NULL),(397082,37,51,30,NULL,'29018','POTINASPAK','C. 21 NORTE PONIENTE','677','677','2025-06-25 13:22:02','2025-06-25 13:22:02',NULL,NULL),(397083,37,51,30,NULL,'29049','UNIDAD CHIAPANECA','C. FRAY MATIA DE CORDOBA','106','106','2025-06-25 13:27:46','2025-06-25 13:27:46',NULL,NULL),(397084,37,51,30,NULL,'29030','ALIANZA CAMPESINA','C. CLAVELES MZ-2 L-14','310','310','2025-06-25 13:32:04','2025-06-25 13:32:04',NULL,NULL),(397085,37,51,30,NULL,'29020','PLAN DE AYALA SUR','PRIVADA PRIMAVERA','305','305','2025-06-25 13:35:56','2025-06-25 13:35:56',NULL,NULL),(397086,37,51,30,NULL,'29050','SAN JOSE TERAN','3 NORTE PONIENTE','95','95','2025-06-25 13:40:31','2025-06-25 13:40:31',NULL,NULL),(397087,37,51,30,NULL,'29014','SANTA CLARA','C. SAN LUIS MZ-16 L-2','375','375','2025-06-25 13:44:48','2025-06-25 13:44:48',NULL,NULL),(397088,37,51,30,NULL,'29040','ELECTRICISTA','AV. PRESA PEÑITA','355','355','2025-06-25 13:48:54','2025-06-25 13:48:54',NULL,NULL),(397089,37,51,30,NULL,'29034','LA PIMIENTA','2 ORIENTE NORTE','1734','1734','2025-06-25 13:52:29','2025-06-25 13:52:29',NULL,NULL),(397090,37,51,30,NULL,'29018','LA CONDESA','C. ESCORPION MZ-6 L-10','10','10','2025-06-25 13:55:51','2025-06-25 13:55:51',NULL,NULL),(397091,37,51,30,NULL,'29020','ALBORADA','C. INVIERO','145','145','2025-06-25 13:59:52','2025-06-25 13:59:52',NULL,NULL),(397092,37,51,30,NULL,'29047','24 de junio','Avenida rio tulija','226',NULL,'2025-07-01 15:39:29','2025-07-01 15:39:29',NULL,NULL),(397093,37,51,30,NULL,'29010','fraccionamiento martha patricia','avenida flor de cacao','393',NULL,'2025-07-02 09:42:29','2025-07-02 09:42:29',NULL,NULL),(397094,37,51,30,NULL,'29018','LA CONDESA','ESCORPIÓN','10','10','2025-07-02 11:21:32','2025-07-02 11:21:32',NULL,NULL),(397095,37,51,30,NULL,'29034','La pimienta','Privada los tulipanes','1560',NULL,'2025-07-02 12:26:26','2025-07-02 12:26:26',NULL,NULL),(397096,37,51,30,NULL,'29034','La pimienta','Privada los tulipanes','1560',NULL,'2025-07-02 12:32:36','2025-07-02 12:32:36',NULL,NULL),(397097,37,51,30,NULL,'29059','Diamante','Av. la coyota','274','s/n','2025-07-02 13:16:59','2025-07-02 13:16:59',NULL,NULL),(397098,37,51,30,NULL,'29059','Diamante','Av. la coyota','274','s/n','2025-07-02 13:19:26','2025-07-02 13:19:26',NULL,NULL),(397099,37,51,30,NULL,'29018','LA CONDESA','ESCORPIÓN','10','10','2025-07-02 13:30:03','2025-07-02 13:30:03',NULL,NULL),(397100,37,51,30,NULL,'29059','Diamante','Av. la coyota','274','s/n','2025-07-02 13:38:06','2025-07-02 13:38:06',NULL,NULL),(397101,37,51,30,NULL,'29018','LA CONDESA','ESCORPIÓN','10','10','2025-07-02 13:38:15','2025-07-02 13:38:15',NULL,NULL),(397102,37,51,30,NULL,'29026','PARAISO OJO DE AGUA','RIO RIACHUELO','456','0','2025-07-02 13:44:53','2025-07-02 13:44:53',NULL,NULL),(397103,37,51,30,NULL,'29000','centro','octava sur poniente','423','ninguno','2025-07-02 13:47:29','2025-07-02 13:47:29',NULL,NULL),(397104,37,51,30,NULL,'29026','PARAISO OJO DE AGUA','RIO RIACHUELO','456','0','2025-07-02 13:48:26','2025-07-02 13:48:26',NULL,NULL),(397105,37,51,30,NULL,'29000','centro','8 SUR PONIENTE','423','ninguno','2025-07-02 14:04:35','2025-07-02 14:04:35',NULL,NULL),(397106,37,51,30,NULL,'29060','PENIPAK','19 poniente Sur','439','ninguno','2025-07-02 14:40:41','2025-07-02 14:40:41',NULL,NULL),(397107,37,51,30,NULL,'29060','PENIPAK','19 poniente Sur','439','ninguno','2025-07-02 14:45:16','2025-07-02 14:45:16',NULL,NULL),(397108,37,51,30,NULL,'29060','PENIPAK','19 poniente Sur','439','ninguno','2025-07-02 14:49:47','2025-07-02 14:49:47',NULL,NULL);

/*Table structure for table `notifica_altas_bajas` */

DROP TABLE IF EXISTS `notifica_altas_bajas`;

CREATE TABLE `notifica_altas_bajas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `mes` int DEFAULT NULL,
  `anio` int DEFAULT NULL,
  `altas` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `bajas` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `altas_otros` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `bajas_otros` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `serie_certificado` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `secuencia_firma` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_firma` datetime DEFAULT NULL,
  `firma_electronica` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `firmante` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `cadena_original` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `uuid` varbinary(150) DEFAULT NULL,
  `noOficio` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fechaSellado` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cadenaSello` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `xml` longblob,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2304 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `notifica_altas_bajas` */

/*Table structure for table `notificaciones` */

DROP TABLE IF EXISTS `notificaciones`;

CREATE TABLE `notificaciones` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_padron` int DEFAULT NULL,
  `memorandum` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_memo` date DEFAULT NULL,
  `asunto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `curp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `dependencia` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `adscripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_notificacion` int DEFAULT NULL,
  `anio_modificacion` int DEFAULT NULL,
  `id_encargo` int DEFAULT NULL,
  `encargo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_inicio_encargo` datetime DEFAULT NULL,
  `fecha_conclusion_encargo` datetime DEFAULT NULL,
  `director_responsable` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `firmante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `iniciales` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `firma` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `serie` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `secuencia` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_firma` datetime DEFAULT NULL,
  `cadena_firma` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `uuid` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cadenaSello` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fechaSellado` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `xml` longblob,
  `id_usuario` int DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13312 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `notificaciones` */

/*Table structure for table `padron` */

DROP TABLE IF EXISTS `padron`;

CREATE TABLE `padron` (
  `id` int NOT NULL AUTO_INCREMENT,
  `curp_aux` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_personal` int NOT NULL COMMENT 'id_persona',
  `id_estructura` int NOT NULL,
  `id_cargo_puesto` int NOT NULL,
  `id_relacion_juridica` int DEFAULT NULL,
  `cargo_puesto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_nivel_gobierno` int DEFAULT NULL,
  `id_poder_ente` int NOT NULL,
  `contrato_honorarios` tinyint(1) NOT NULL,
  `nivel_encargo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `id_domicilio` int NOT NULL,
  `telefono_laboral` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `correo_laboral` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `funciones_principales` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `otras_funciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `obligado` tinyint(1) DEFAULT '1',
  `f_captura_alta` date DEFAULT NULL,
  `id_usuario_alta` int NOT NULL,
  `f_captura_baja` date DEFAULT NULL,
  `id_usuario_baja` int DEFAULT NULL,
  `id_motivo_baja` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `nota` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `observaciones_sip` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `observaciones_encargo` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_estructura` (`id_estructura`) USING BTREE,
  KEY `id_usuario_alta` (`id_usuario_alta`) USING BTREE,
  KEY `id_usuario_baja` (`id_usuario_baja`) USING BTREE,
  KEY `id_cargo_puesto` (`id_cargo_puesto`) USING BTREE,
  KEY `id_nivel_gobierno` (`id_nivel_gobierno`) USING BTREE,
  KEY `id_poder_ente` (`id_poder_ente`) USING BTREE,
  KEY `id_domicilio` (`id_domicilio`) USING BTREE,
  KEY `id_personal` (`id_personal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `padron` */

insert  into `padron`(`id`,`curp_aux`,`id_personal`,`id_estructura`,`id_cargo_puesto`,`id_relacion_juridica`,`cargo_puesto`,`id_nivel_gobierno`,`id_poder_ente`,`contrato_honorarios`,`nivel_encargo`,`fecha_inicio`,`fecha_fin`,`id_domicilio`,`telefono_laboral`,`correo_laboral`,`funciones_principales`,`otras_funciones`,`observaciones`,`obligado`,`f_captura_alta`,`id_usuario_alta`,`f_captura_baja`,`id_usuario_baja`,`id_motivo_baja`,`created_at`,`updated_at`,`deleted_at`,`nota`,`observaciones_sip`,`observaciones_encargo`) values (1,NULL,1,1,1,2,NULL,2,4,0,'610102','2025-04-23',NULL,396984,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 09:52:05','2025-06-24 09:52:05',NULL,NULL,NULL,NULL),(2,NULL,2,1,12,2,NULL,2,4,0,'610514','2025-06-01',NULL,396985,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 10:07:05','2025-06-24 10:07:05',NULL,NULL,NULL,NULL),(3,NULL,3,2,6,2,NULL,2,4,0,'610402','2020-01-01',NULL,396986,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 15:20:13','2025-06-24 15:20:13',NULL,NULL,NULL,NULL),(4,NULL,4,15,15,2,NULL,2,4,0,'610602','2020-01-01',NULL,396987,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:24:43','2025-06-24 15:24:43',NULL,NULL,NULL,NULL),(5,NULL,5,5,16,2,NULL,2,4,0,'610603','2025-05-01',NULL,396988,NULL,NULL,'[\"3\"]','Desarrollo de informe, manuales y base de datos',NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:28:32','2025-07-02 12:17:49',NULL,NULL,NULL,NULL),(6,NULL,6,15,15,2,NULL,2,4,0,'610602','2020-01-01',NULL,396989,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:31:46','2025-06-24 15:31:46',NULL,NULL,NULL,NULL),(7,NULL,7,2,6,2,NULL,2,4,0,'610402','2025-05-16',NULL,396990,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 15:32:21','2025-06-24 15:32:21',NULL,NULL,NULL,NULL),(8,NULL,8,5,15,2,NULL,2,4,0,'610602','2023-02-16',NULL,396991,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:36:39','2025-06-24 15:36:39',NULL,NULL,NULL,NULL),(9,NULL,9,15,16,2,NULL,2,4,0,'610603','2020-01-01',NULL,396992,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:39:56','2025-06-24 15:39:56',NULL,NULL,NULL,NULL),(10,NULL,10,18,11,2,NULL,2,4,0,'610513','2025-06-16',NULL,396993,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:41:54','2025-06-24 15:41:54',NULL,NULL,NULL,NULL),(11,NULL,11,15,9,2,NULL,2,4,0,'610406','2020-01-01',NULL,396994,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:45:09','2025-06-24 15:45:09',NULL,NULL,NULL,NULL),(12,NULL,12,2,12,2,NULL,2,4,0,'610514','2025-05-01',NULL,396995,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 15:46:05','2025-06-24 15:46:05',NULL,NULL,NULL,NULL),(13,NULL,13,18,13,2,NULL,2,4,0,'610516','2025-05-16',NULL,396996,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:46:36','2025-06-24 15:46:36',NULL,NULL,NULL,NULL),(14,NULL,14,15,9,2,NULL,2,4,0,'610406','2020-01-01',NULL,396997,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:50:03','2025-06-24 15:50:03',NULL,NULL,NULL,NULL),(15,NULL,15,18,16,2,NULL,2,4,0,'610603','2023-03-01',NULL,396998,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:50:29','2025-06-24 15:50:29',NULL,NULL,NULL,NULL),(16,NULL,16,2,16,2,NULL,2,4,0,'610603','2021-01-01',NULL,396999,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 15:53:48','2025-06-24 15:53:48',NULL,NULL,NULL,NULL),(17,NULL,17,15,7,2,NULL,2,4,0,'610403','2020-02-01',NULL,397000,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:54:40','2025-06-24 15:54:40',NULL,NULL,NULL,NULL),(18,NULL,18,15,8,2,NULL,2,4,0,'610404','2020-01-01',NULL,397001,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:55:42','2025-06-24 15:55:42',NULL,NULL,NULL,NULL),(19,NULL,19,18,16,2,NULL,2,4,0,'610603','2023-01-01',NULL,397002,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 15:56:43','2025-06-24 15:56:43',NULL,NULL,NULL,NULL),(20,NULL,20,2,16,2,NULL,2,4,0,'610603','2020-02-01',NULL,397003,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 15:58:23','2025-06-24 15:58:23',NULL,NULL,NULL,NULL),(21,NULL,21,17,11,2,NULL,2,4,0,'610513','2020-01-01',NULL,397004,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:00:12','2025-06-24 16:00:12',NULL,NULL,NULL,NULL),(22,NULL,23,15,8,2,NULL,2,4,0,'610404','2020-02-16',NULL,397006,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:01:11','2025-06-24 16:01:11',NULL,NULL,NULL,NULL),(23,NULL,24,1,11,2,NULL,2,4,0,'610513','2024-08-16',NULL,397007,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:02:51','2025-06-25 11:13:36',NULL,NULL,NULL,NULL),(24,NULL,25,2,16,2,NULL,2,4,0,'610603','2021-05-16',NULL,397008,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 16:03:31','2025-06-24 16:03:31',NULL,NULL,NULL,NULL),(25,NULL,26,17,13,2,NULL,2,4,0,'610516','2022-06-16',NULL,397009,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:05:01','2025-06-24 16:05:01',NULL,NULL,NULL,NULL),(26,NULL,27,15,7,2,NULL,2,4,0,'610403','2020-01-01',NULL,397010,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:06:33','2025-06-24 16:06:33',NULL,NULL,NULL,NULL),(27,NULL,28,2,17,2,NULL,2,4,0,'610607','2025-05-01',NULL,397011,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 16:07:38','2025-06-24 16:07:38',NULL,NULL,NULL,NULL),(28,NULL,29,19,15,2,NULL,2,4,0,'610602','2022-04-16',NULL,397012,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:08:02','2025-06-25 09:54:39',NULL,NULL,NULL,NULL),(29,NULL,30,17,16,2,NULL,2,4,0,'610603','2020-01-01',NULL,397013,NULL,NULL,'[\"7\"]','Captura en el SIGHA, Cierres Contables.',NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:08:33','2025-07-02 12:16:26',NULL,NULL,NULL,NULL),(30,NULL,31,15,3,2,NULL,2,4,0,'610316','2020-01-27',NULL,397014,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:13:36','2025-06-24 16:13:36',NULL,NULL,NULL,NULL),(31,NULL,32,19,12,2,NULL,2,4,0,'610514','2020-01-01',NULL,397015,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:20:36','2025-06-25 09:54:33',NULL,NULL,NULL,NULL),(32,NULL,33,17,16,2,NULL,2,4,0,'610603','2022-06-01',NULL,397016,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:21:31','2025-06-24 16:21:31',NULL,NULL,NULL,NULL),(33,NULL,34,6,16,2,NULL,2,4,0,'610603','2020-01-01',NULL,397017,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:23:45','2025-06-24 16:23:45',NULL,NULL,NULL,NULL),(34,NULL,35,21,11,2,NULL,2,4,0,'610513','2025-05-16',NULL,397018,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:25:10','2025-06-24 16:25:10',NULL,NULL,NULL,NULL),(35,NULL,37,10,15,2,NULL,2,4,0,'610602','2021-02-16',NULL,397020,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:25:37','2025-06-25 09:54:27',NULL,NULL,NULL,NULL),(36,NULL,38,6,16,2,NULL,2,4,0,'610603','2020-02-16',NULL,397021,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:27:39','2025-06-24 16:27:39',NULL,NULL,NULL,NULL),(37,NULL,39,21,13,2,NULL,2,4,0,'610516','2025-05-16',NULL,397022,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:28:46','2025-06-24 16:28:46',NULL,NULL,NULL,NULL),(38,NULL,40,6,16,2,NULL,2,4,0,'610603','2024-03-01',NULL,397023,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:30:48','2025-06-24 16:30:48',NULL,NULL,NULL,NULL),(39,NULL,41,3,2,2,NULL,2,4,0,'610204','2025-04-23',NULL,397024,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 16:31:20','2025-06-24 16:31:20',NULL,NULL,NULL,NULL),(40,NULL,42,10,15,2,NULL,2,1,0,'610602','2022-06-01',NULL,397025,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:32:50','2025-06-25 09:54:17',NULL,NULL,NULL,NULL),(41,NULL,43,21,16,2,NULL,2,4,0,'610603','2025-06-16',NULL,397026,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:32:59','2025-06-24 16:32:59',NULL,NULL,NULL,NULL),(42,NULL,44,6,16,2,NULL,2,4,0,'610603','2020-01-01',NULL,397027,NULL,NULL,'[]','elaboracion de acuerdos, integracion de los siguientes expedientes: cuadernillo de amparo, Cuadernillo de Recurso de revision, asimismo de apelacion y recurso de responsabilidad administrativa entre otros; elaboración de cómputos, oficios',NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:33:43','2025-07-02 14:20:19',NULL,NULL,NULL,NULL),(43,NULL,45,6,9,2,NULL,2,4,0,'610406','2020-01-01',NULL,397028,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:36:24','2025-06-24 16:36:24',NULL,NULL,NULL,NULL),(44,NULL,46,21,15,2,NULL,2,4,0,'610602','2022-01-01',NULL,397029,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:36:25','2025-06-24 16:36:25',NULL,NULL,NULL,NULL),(45,NULL,47,3,6,2,NULL,2,4,0,'610402','2025-05-16',NULL,397030,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 16:36:38','2025-06-24 16:36:38',NULL,NULL,NULL,NULL),(46,NULL,49,10,12,2,NULL,2,4,0,'610514','2025-06-16',NULL,397032,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:38:05','2025-06-25 09:54:10',NULL,NULL,NULL,NULL),(47,NULL,50,21,18,2,NULL,2,4,0,'610608','2025-06-01',NULL,397033,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:38:30','2025-06-24 16:38:30',NULL,NULL,NULL,NULL),(48,NULL,51,6,5,2,NULL,2,4,0,'610401','2020-01-01',NULL,397034,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:40:48','2025-06-24 16:40:48',NULL,NULL,NULL,NULL),(49,NULL,52,20,11,2,NULL,2,4,0,'610513','2020-01-01',NULL,397035,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:41:21','2025-06-24 16:41:21',NULL,NULL,NULL,NULL),(50,NULL,53,3,6,2,NULL,2,4,0,'610402','2025-06-16',NULL,397036,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 16:42:42','2025-06-24 16:42:42',NULL,NULL,NULL,NULL),(51,NULL,54,20,14,2,NULL,2,4,0,'610525','2020-02-01',NULL,397037,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:43:46','2025-06-24 16:43:46',NULL,NULL,NULL,NULL),(52,NULL,55,4,16,2,NULL,2,4,0,'610603','2025-05-01',NULL,397038,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:43:57','2025-06-24 16:43:57',NULL,NULL,NULL,NULL),(53,NULL,56,4,16,2,NULL,2,4,0,'610603','2020-01-01',NULL,397039,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:46:38','2025-06-24 16:46:38',NULL,NULL,NULL,NULL),(54,NULL,57,20,14,2,NULL,2,4,0,'610525','2025-06-01',NULL,397040,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:46:47','2025-06-24 16:46:47',NULL,NULL,NULL,NULL),(55,NULL,58,3,16,2,NULL,2,4,0,'610603','2025-06-01',NULL,397041,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 16:47:09','2025-06-24 16:47:09',NULL,NULL,NULL,NULL),(56,NULL,59,16,12,2,NULL,2,4,0,'610514','2020-01-01',NULL,397042,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:49:10','2025-06-25 09:54:01',NULL,NULL,NULL,NULL),(57,NULL,60,4,6,2,NULL,2,4,0,'610402','2020-01-01',NULL,397043,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:49:25','2025-06-24 16:49:25',NULL,NULL,NULL,NULL),(58,NULL,61,11,12,2,NULL,2,4,0,'610514','2025-01-01',NULL,397044,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:50:05','2025-06-24 16:50:05',NULL,NULL,NULL,NULL),(59,NULL,62,3,16,2,NULL,2,4,0,'610603','2025-06-16',NULL,397045,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',2,NULL,NULL,NULL,'2025-06-24 16:51:11','2025-06-24 16:51:11',NULL,NULL,NULL,NULL),(60,NULL,63,4,6,2,NULL,2,4,0,'610402','2020-01-01',NULL,397046,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:53:54','2025-06-24 16:53:54',NULL,NULL,NULL,NULL),(61,NULL,64,9,12,2,NULL,2,4,0,'610514','2020-01-01',NULL,397047,NULL,NULL,'[\"8\"]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 16:56:48','2025-07-01 13:38:44',NULL,NULL,NULL,NULL),(62,NULL,65,9,16,2,NULL,2,4,0,'610603','2020-10-16',NULL,397048,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 17:00:51','2025-06-24 17:00:51',NULL,NULL,NULL,NULL),(63,NULL,66,12,12,2,NULL,2,4,0,'610514','2021-03-01',NULL,397049,NULL,NULL,'[]',NULL,NULL,1,'2025-06-24',3,NULL,NULL,NULL,'2025-06-24 17:03:35','2025-06-24 17:03:35',NULL,NULL,NULL,NULL),(64,NULL,67,12,16,2,NULL,2,4,0,'610603','2024-02-01',NULL,397050,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 10:17:37','2025-06-25 10:17:37',NULL,NULL,NULL,NULL),(65,NULL,68,4,2,2,NULL,2,4,0,'610204','2025-04-23',NULL,397051,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',2,NULL,NULL,NULL,'2025-06-25 10:22:28','2025-06-25 10:22:28',NULL,NULL,NULL,NULL),(66,NULL,69,16,11,2,NULL,2,4,0,'610513','2021-02-01',NULL,397052,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 10:22:33','2025-06-25 10:22:33',NULL,NULL,NULL,NULL),(67,NULL,70,16,12,2,NULL,2,4,0,'610514','2020-02-16',NULL,397053,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 10:25:23','2025-06-25 10:25:23',NULL,NULL,NULL,NULL),(68,NULL,71,16,12,2,NULL,2,4,0,'610514','2020-01-01',NULL,397054,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 10:27:45','2025-06-25 10:27:45',NULL,NULL,NULL,NULL),(69,NULL,72,15,15,2,NULL,2,4,0,'610602','2020-01-01',NULL,397055,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 11:14:51','2025-06-25 11:14:51',NULL,NULL,NULL,NULL),(70,NULL,73,15,15,2,NULL,2,4,0,'610602','2025-05-01',NULL,397056,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',2,NULL,NULL,NULL,'2025-06-25 11:20:40','2025-06-25 11:26:34',NULL,NULL,NULL,NULL),(71,NULL,74,15,15,2,NULL,2,4,0,'610602','2023-06-16',NULL,397057,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 11:25:14','2025-06-25 11:25:14',NULL,NULL,NULL,NULL),(72,NULL,75,15,15,2,NULL,2,4,0,'610602','2020-01-01',NULL,397058,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 11:30:28','2025-06-25 11:30:28',NULL,NULL,NULL,NULL),(73,NULL,76,15,15,2,NULL,2,4,0,'610602','2020-02-01',NULL,397059,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 11:35:49','2025-06-25 11:35:49',NULL,NULL,NULL,NULL),(74,NULL,77,15,15,2,NULL,2,4,0,'610602','2020-01-01',NULL,397060,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 11:40:49','2025-06-25 11:40:49',NULL,NULL,NULL,NULL),(75,NULL,78,15,15,2,NULL,2,4,0,'610602','2025-05-16',NULL,397061,NULL,NULL,'[\"13\"]','ninguna',NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 11:49:46','2025-07-02 13:35:08',NULL,NULL,NULL,NULL),(76,NULL,79,15,15,2,NULL,2,4,0,'610602','2024-08-01',NULL,397062,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 11:54:11','2025-06-25 11:54:11',NULL,NULL,NULL,NULL),(77,NULL,80,15,15,2,NULL,2,4,0,'610602','2025-06-16',NULL,397063,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 11:59:01','2025-06-25 11:59:01',NULL,NULL,NULL,NULL),(78,NULL,82,15,15,2,NULL,2,4,0,'610602','2020-01-01',NULL,397065,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 12:03:05','2025-06-25 12:03:05',NULL,NULL,NULL,NULL),(79,NULL,83,15,15,2,NULL,2,4,0,'610602','2023-04-01',NULL,397066,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 12:08:20','2025-06-25 12:08:20',NULL,NULL,NULL,NULL),(80,NULL,84,15,15,2,NULL,2,4,0,'610602','2020-01-01',NULL,397067,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 12:13:32','2025-06-25 12:13:32',NULL,NULL,NULL,NULL),(81,NULL,85,15,15,2,NULL,2,4,0,'610602','2025-02-01',NULL,397068,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 12:17:45','2025-06-25 12:17:45',NULL,NULL,NULL,NULL),(82,NULL,86,14,7,2,NULL,2,4,0,'610403','2020-02-01',NULL,397069,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 12:23:00','2025-06-25 12:23:00',NULL,NULL,NULL,NULL),(83,NULL,87,14,8,2,NULL,2,4,0,'610404','2025-05-01',NULL,397070,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 12:27:54','2025-06-25 12:27:54',NULL,NULL,NULL,NULL),(84,NULL,88,14,8,2,NULL,2,4,0,'610404','2020-02-01',NULL,397071,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 12:36:01','2025-06-25 12:36:01',NULL,NULL,NULL,NULL),(85,NULL,89,14,9,2,NULL,2,4,0,'610406','2020-01-01',NULL,397072,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 12:40:24','2025-06-25 12:40:24',NULL,NULL,NULL,NULL),(86,NULL,90,14,9,2,NULL,2,4,0,'610406','2024-01-01',NULL,397073,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 12:44:35','2025-06-25 12:44:35',NULL,NULL,NULL,NULL),(87,NULL,91,14,16,2,NULL,2,4,0,'610603','2020-01-01',NULL,397074,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 12:48:55','2025-06-25 12:48:55',NULL,NULL,NULL,NULL),(88,NULL,92,14,15,2,NULL,2,4,0,'610602','2023-02-16',NULL,397075,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 12:53:10','2025-06-25 12:53:10',NULL,NULL,NULL,NULL),(89,NULL,93,14,15,2,NULL,2,4,0,'610602','2020-09-16',NULL,397076,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 12:56:44','2025-06-25 12:56:44',NULL,NULL,NULL,NULL),(90,NULL,94,14,15,2,NULL,2,1,0,'610602','2025-05-01',NULL,397077,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:01:58','2025-06-25 13:01:58',NULL,NULL,NULL,NULL),(91,NULL,95,14,15,2,NULL,2,4,0,'610602','2025-05-01',NULL,397078,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:06:21','2025-06-25 13:06:21',NULL,NULL,NULL,NULL),(92,NULL,97,14,15,2,NULL,2,4,0,'610602','2021-09-16',NULL,397080,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:13:10','2025-06-25 13:13:10',NULL,NULL,NULL,NULL),(93,NULL,98,14,15,2,NULL,2,4,0,'610602','2023-01-01',NULL,397081,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:18:02','2025-06-25 13:18:02',NULL,NULL,NULL,NULL),(94,NULL,99,14,15,2,NULL,2,4,0,'610602','2020-02-16',NULL,397082,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:22:02','2025-06-25 13:22:02',NULL,NULL,NULL,NULL),(95,NULL,100,14,15,2,NULL,2,4,0,'610602','2020-01-01',NULL,397083,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:27:46','2025-06-25 13:27:46',NULL,NULL,NULL,NULL),(96,NULL,101,14,15,2,NULL,2,4,0,'610602','2020-01-01',NULL,397084,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:32:04','2025-06-25 13:32:04',NULL,NULL,NULL,NULL),(97,NULL,102,14,15,2,NULL,2,4,0,'610602','2025-05-01',NULL,397085,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:35:56','2025-06-25 13:35:56',NULL,NULL,NULL,NULL),(98,NULL,103,14,15,2,NULL,2,4,0,'610602','2020-11-01',NULL,397086,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:40:31','2025-06-25 13:40:31',NULL,NULL,NULL,NULL),(99,NULL,104,14,15,2,NULL,2,4,0,'610602','2025-05-01',NULL,397087,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:44:48','2025-06-25 13:44:48',NULL,NULL,NULL,NULL),(100,NULL,105,14,15,2,NULL,2,4,0,'610602','2025-06-16',NULL,397088,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:48:54','2025-06-25 13:48:54',NULL,NULL,NULL,NULL),(101,NULL,106,14,15,2,NULL,2,4,0,'610602','2023-03-01',NULL,397089,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:52:29','2025-06-25 13:52:29',NULL,NULL,NULL,NULL),(102,NULL,107,14,15,2,NULL,2,4,0,'610602','2020-11-16',NULL,397090,NULL,NULL,'[\"1\",\"2\",\"3\",\"5\"]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:55:51','2025-07-01 12:42:40',NULL,NULL,NULL,NULL),(103,NULL,108,5,4,2,NULL,2,4,0,'610322','2020-02-01',NULL,397091,NULL,NULL,'[]',NULL,NULL,1,'2025-06-25',3,NULL,NULL,NULL,'2025-06-25 13:59:52','2025-06-25 13:59:52',NULL,NULL,NULL,NULL);

/*Table structure for table `padron_otros_empleos` */

DROP TABLE IF EXISTS `padron_otros_empleos`;

CREATE TABLE `padron_otros_empleos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_personal` int NOT NULL,
  `id_estructura` int NOT NULL,
  `id_cargo_puesto` int NOT NULL,
  `id_relacion_juridica` int DEFAULT NULL,
  `cargo_puesto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_nivel_gobierno` int NOT NULL,
  `id_poder_ente` int NOT NULL,
  `contrato_honorarios` tinyint(1) NOT NULL,
  `nivel_encargo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT '0',
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date DEFAULT NULL,
  `id_domicilio` int NOT NULL,
  `telefono_laboral` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `correo_laboral` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `funciones_principales` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `otras_funciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `obligado` tinyint(1) DEFAULT '1',
  `f_captura_alta` date DEFAULT NULL,
  `id_usuario_alta` int NOT NULL,
  `f_captura_baja` date DEFAULT NULL,
  `id_usuario_baja` int DEFAULT NULL,
  `id_motivo_baja` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_estructura` (`id_estructura`) USING BTREE,
  KEY `id_usuario_alta` (`id_usuario_alta`) USING BTREE,
  KEY `id_usuario_baja` (`id_usuario_baja`) USING BTREE,
  KEY `id_cargo_puesto` (`id_cargo_puesto`) USING BTREE,
  KEY `id_nivel_gobierno` (`id_nivel_gobierno`) USING BTREE,
  KEY `id_poder_ente` (`id_poder_ente`) USING BTREE,
  KEY `id_domicilio` (`id_domicilio`) USING BTREE,
  KEY `id_personal` (`id_personal`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `padron_otros_empleos` */

/*Table structure for table `personal` */

DROP TABLE IF EXISTS `personal`;

CREATE TABLE `personal` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona_ax` int DEFAULT NULL COMMENT 'Solo en migracion',
  `id_sexo` tinyint(1) DEFAULT NULL,
  `foto` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT 'default.png',
  `nombre` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellido1` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `apellido2` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_nacionalidad` int NOT NULL,
  `id_pais_nacimiento` int NOT NULL,
  `id_estado_nacimiento` int NOT NULL,
  `curp` varchar(18) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `rfc` varchar(13) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `homoclave` varchar(3) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `numero_identificacion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `correo_personal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono_particular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `telefono_celular` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_estado_civil` int DEFAULT NULL,
  `id_regimen_matrimonial` int DEFAULT NULL,
  `otro_regimen_matrimonial` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `id_ult_declaracion` int DEFAULT NULL,
  `id_ult_tipo_declaracion` int DEFAULT NULL,
  `ult_fecha_declaracion` datetime DEFAULT NULL,
  `id_obl_declaracion` int DEFAULT NULL,
  `id_obl_tipo_declaracion` int DEFAULT NULL,
  `obl_fecha_declaracion` datetime DEFAULT NULL,
  `codigo_activacion` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `buzon_notificacion` bit(1) DEFAULT b'0',
  `flag` bit(1) DEFAULT b'0',
  `id_declaracion_mayo` int DEFAULT NULL,
  `id_tipo_declaracion_mayo` int DEFAULT NULL,
  `fecha_declaracion_mayo` datetime DEFAULT NULL,
  `anio_anual` int DEFAULT NULL,
  `modulo` bit(1) DEFAULT b'0',
  `observaciones_personal` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci,
  `id_ultimo_tipo_real` int DEFAULT NULL COMMENT 'tipo real de la tabla declaracion',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_nacionalidad` (`id_nacionalidad`) USING BTREE,
  KEY `id_estado_nacimiento` (`id_estado_nacimiento`) USING BTREE,
  KEY `id_estado_civil` (`id_estado_civil`) USING BTREE,
  KEY `id_regimen_matrimonial` (`id_regimen_matrimonial`) USING BTREE,
  KEY `id_persona_ax` (`id_persona_ax`) USING BTREE,
  KEY `id_ult_declaracion` (`id_ult_declaracion`) USING BTREE,
  KEY `id_ult_tipo_declaracion` (`id_ult_tipo_declaracion`) USING BTREE,
  KEY `id_pais_nacimiento` (`id_pais_nacimiento`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `personal` */

insert  into `personal`(`id`,`id_persona_ax`,`id_sexo`,`foto`,`nombre`,`apellido1`,`apellido2`,`id_nacionalidad`,`id_pais_nacimiento`,`id_estado_nacimiento`,`curp`,`rfc`,`homoclave`,`fecha_nacimiento`,`numero_identificacion`,`correo_personal`,`telefono_particular`,`telefono_celular`,`id_estado_civil`,`id_regimen_matrimonial`,`otro_regimen_matrimonial`,`id_ult_declaracion`,`id_ult_tipo_declaracion`,`ult_fecha_declaracion`,`id_obl_declaracion`,`id_obl_tipo_declaracion`,`obl_fecha_declaracion`,`codigo_activacion`,`created_at`,`updated_at`,`deleted_at`,`buzon_notificacion`,`flag`,`id_declaracion_mayo`,`id_tipo_declaracion_mayo`,`fecha_declaracion_mayo`,`anio_anual`,`modulo`,`observaciones_personal`,`id_ultimo_tipo_real`) values (1,NULL,NULL,'default.png','EDNA MARITZA','MORALES','BAUTISTA',37,37,30,'MOBE861103MCSRTD00','MOBE861103','H45','1986-11-03',NULL,'morales.edn@gmail.com','9611508190','9611508190',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 09:52:05','2025-06-24 09:52:05',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(2,NULL,NULL,'default.png','MONICA CATALINA','CISNEROS','RAMOS',37,37,30,'CIRM800417MCSSMN05','CIRM800417','MG6','1980-04-17',NULL,'monicis80@gmail.com','9616686078','9616686078',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 10:07:05','2025-06-24 10:07:05',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(3,NULL,NULL,'default.png','OCIEL','PEREZ','ESTRADA',37,37,30,'PEEO680702HCSRSC06','PEEO680702','6Q5','1968-07-02',NULL,'ociel100@hotmail.com','9612406376','9612406376',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:20:13','2025-06-24 15:20:13',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(4,NULL,NULL,'default.png','CINTHIA MAGALLY','MORENO','ESPINOSA',37,37,30,'MOEC930707MCSRSN01','MOEC930707','AZ7','1993-07-07',NULL,'lic.cinthiamoreno@gmail.com','9611366312','9611366312',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:24:43','2025-06-24 15:24:43',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(5,NULL,NULL,'default.png','GABRIEL','AGUIAR','CRUZ',37,37,30,'AUCG920315HCSGRB02','AUCG920315','FP3','1992-03-15',NULL,'tjaec.gabriel@gmail.com','9612049152','9612049152',1,NULL,NULL,652082,1,NULL,652082,1,NULL,'ErRhGE1F','2025-06-24 15:28:32','2025-07-02 12:06:00',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,1),(6,NULL,NULL,'default.png','OTILA GUADALUPE','SANTIAGO','VELAZQUEZ',37,37,30,'SAVO851217MCSNLT04','SAVO851217','T19','1985-12-17',NULL,'alito_1609@hotmail.com','9611848888','9611848888',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:31:46','2025-06-24 15:31:46',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(7,NULL,NULL,'default.png','ALFREDO','ACUÑA','PACHECO',37,37,30,'AUPA841018HCSCCL04','AUPA841018','I42','1984-10-18',NULL,'alfredoacupa@gmail.com','5537077837','5537077837',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:32:21','2025-06-24 15:32:21',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(8,NULL,NULL,'default.png','MIRIAN LISSETT','TRUJILLO','RAMOS',37,37,30,'TURM911023MCSRMR19','TURM911023','9N4','1991-10-23',NULL,'mirianlissett@hotmail.com','8126120669','8126120669',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:36:39','2025-06-24 15:36:39',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(9,NULL,NULL,'default.png','IRMA CAROLINA','IBARRA','GONZALEZ',37,37,30,'IAGI940115MCSBNR01','IAGI940115','HK1','1994-01-15',NULL,'gici_94@hotmail.com','9611376036','9611376036',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:39:55','2025-06-24 15:39:55',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(10,NULL,NULL,'default.png','RAUL ERNESTO','TRUJILLO','AGUILAR',37,37,30,'TUAR860821HCSRGL05','TUAR860821','792','1986-08-21',NULL,'r.trujilloa@gmail.com','9616550304','9616550304',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:41:54','2025-06-24 15:41:54',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(11,NULL,NULL,'default.png','JOSE MANUEL','LIRA','DOMINGUEZ',37,37,30,'LIDM790319HCSRMN08','LIDM790319','E95','1979-03-19',NULL,'lira_2018@outlook.com','9613662544','9613662544',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:45:09','2025-06-24 15:45:09',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(12,NULL,NULL,'default.png','SELENE GUADALUPE','ZEPEDA','GARCIA',37,37,30,'ZEGS891022MCSPRL05','ZEGS891022','846','1989-10-22',NULL,'selenegzepedagarcia@gmail.com','9612368560','9612368560',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:46:05','2025-06-24 15:46:05',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(13,NULL,NULL,'default.png','JUAN','MORALES','VALDEZ',37,37,30,'MOVJ621120HCSRLN10','MOVJ621120','LN1','1962-11-20',NULL,'juanmorales2407@gmail.com','9191274641','9191274641',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:46:36','2025-06-25 14:36:31',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(14,NULL,NULL,'default.png','MONTSERRATH','SOLIS','ARELLANO',37,37,30,'SOAM960703MCSLRN05','SOAM960703','HJ8','1996-07-03',NULL,'montserrathsa@gmail.com','9613701586','9613701586',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:50:03','2025-06-25 15:28:31',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(15,NULL,NULL,'default.png','CRISOGONO','ZAVALA','ARIAS',37,37,30,'ZAAC741211HCSVRR09','ZAAC741211','PF7','1974-12-11',NULL,'crisza7@hotmail.com','9611012770','9611012770',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:50:28','2025-06-24 15:50:28',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(16,NULL,NULL,'default.png','ALMA LILIA','HERNANDEZ','JUAREZ',37,37,30,'HEJA791113MCSRRL08','HEJA791113','9A3','1979-11-13',NULL,'alhax@hotmail.com','9671159149','9671159149',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:53:48','2025-06-24 15:53:48',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(17,NULL,NULL,'default.png','HUMBERTO','ZEBADUA','CHAVARRIA',37,37,31,'ZECH910318HCHBHM02','ZECH910318','GJ9','1991-03-18',NULL,'zeba_9000@hotmail.com','8683089145','8683089145',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:54:40','2025-06-25 11:04:45',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(18,NULL,NULL,'default.png','ELODIA DEL CARMEN','RAMIREZ','Y ESCOBEDO',37,37,30,'RAEE721014MCSMSL07','RAEE721014','F3A','1972-10-14',NULL,'raee_72@hotmail.com','9616552954','9616552954',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:55:42','2025-06-24 15:55:42',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(19,NULL,NULL,'default.png','GRETA JAZMIN','NUÑEZ','HERNANDEZ',37,37,7,'NUHG960719MDFXRR02','NUHG960719','B7A','1996-07-19',NULL,'gretajazmin@live.com.mx','9611984321','9611984321',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:56:43','2025-06-24 15:56:43',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(20,NULL,NULL,'default.png','MARIA DEL LUCERO','HERNANDEZ','SOLIS',37,37,30,'HESL891026MCSRLC08','HESL891026','954','1989-10-26',NULL,'lucero_hernandez2018@hotmail.com','9613210314','9613210314',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 15:58:23','2025-06-24 15:58:23',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(21,NULL,NULL,'default.png','JOSE EUSTAQUIO','GOMEZ','TRUJILLO',37,37,30,'GOTE660920HCSMRS03','GOTE660920','GB7','1966-09-20',NULL,'jgomezocvpalenque@gmail.com','9612481464','9612481464',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:00:12','2025-06-24 16:00:12',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(23,NULL,NULL,'default.png','HUGO ENRIQUE','CAMACHO','GUTIERREZ',37,37,30,'CAGH850607HCSMTG05','CAGH850607','6I6','1985-06-07',NULL,'henry_cmc_gtz@hotmail.com','9611056544','9611056544',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:01:11','2025-06-24 16:01:11',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(24,NULL,NULL,'default.png','ONIKA','GONZALEZ','VILLANUEVA',37,37,30,'GOVO751127MCSNLN09','GOVO751127','KR6','1975-11-27',NULL,'oni_k@hotmail.com','9616542062','9616542062',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:02:51','2025-06-24 16:02:51',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(25,NULL,NULL,'default.png','ANA PAOLA','GRAJALES','GUZMAN',37,37,30,'GAGA941109MCSRZN07','GAGA941109','EP9','1994-11-09',NULL,'paolagrajales64@gmail.com','9612479059','9612479059',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:03:31','2025-06-24 16:03:31',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(26,NULL,NULL,'default.png','MANUELA','CASTILLEJOS','MARTINEZ',37,37,30,'CAMM980904MCSSRN07','CAMM980904','FJ9','1998-09-04',NULL,'manecm04@gmail.com','9617744174','9617744174',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:05:01','2025-06-24 16:05:01',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(27,NULL,NULL,'default.png','BELEN','ANGEL','ESTRADA',37,37,30,'AEEB811029MCSNSL07','AEEB811029','9L6','1981-10-29',NULL,'ronyset29@gmail.com','9612655499','9612655499',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:06:33','2025-06-24 16:06:33',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(28,NULL,NULL,'default.png','CESAR IGNACIO','LAZOS','BALCAZAR',37,37,30,'LABC800410HCSZLS05','LABC800410','4S9','1980-04-10',NULL,'clazosblacazar@gmail.com','9615996880','9615996880',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:07:38','2025-06-24 16:07:38',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(29,NULL,NULL,'default.png','JONATHAN DE JESUS','PECHA','TOALA',37,37,30,'PETJ990728HCSCLN00','PETJ990728','738','1999-07-28',NULL,'pechatoalajonathan@gmail.com','9614482543','9614482543',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:08:02','2025-06-24 16:08:02',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(30,NULL,NULL,'default.png','NANCY CAROLINA','GOMEZ','LOPEZ',37,37,30,'GOLN960719MCSMPN07','GOLN960719','QJ9','1996-07-19',NULL,'nancycarolina50@gmail.com','9611503919','9611503919',1,NULL,NULL,652081,1,NULL,652081,1,NULL,'g9FM99wn','2025-06-24 16:08:33','2025-07-02 11:56:17',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,1),(31,NULL,NULL,'default.png','ELMAR MARIO','GUIRAO','MALDONADO',37,37,30,'GUME680912HCSRLL07','GUME680912','CG6','1968-09-12',NULL,'andariego38@hotmail.com','9611890947','9611890947',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:13:36','2025-06-24 16:13:36',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(32,NULL,NULL,'default.png','FERNANDO','CASTELLANOS','COUTIÑO',37,37,30,'CACF880104HCSSTR01','CACF880104','FA0','1988-01-04',NULL,'castellanoscf@gmail.com','9616587033','9616587033',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:20:36','2025-06-24 16:20:36',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(33,NULL,NULL,'default.png','WILLIAM EZEQUIEL','GOMEZ','GOMEZ',37,37,30,'GOGW971202HCSMML02','GOGW971202','PZ3','1997-12-02',NULL,'williamgog0212@gmail.com','9191684357','9191684357',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:21:31','2025-06-24 16:21:31',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(34,NULL,NULL,'default.png','ELSSIE IVONNE','PALACIOS','ROQUE',37,37,30,'PARE900701MCSLQL02','PARE900701','419','1990-07-01',NULL,'ivonne_palac@hotmail.com','9614796035','9614796035',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:23:45','2025-06-24 16:23:45',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(35,NULL,NULL,'default.png','EDGAR GERARDO','ALCAZAR','CANCINO',37,37,30,'AACE781021HCSLND05','AACE781021','6X3','1978-10-21',NULL,'eralcazar@hotmail.com','9614385723','9614385723',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:25:10','2025-06-24 16:25:10',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(37,NULL,NULL,'default.png','ALDO','ESTRADA','NURICUMBO',37,37,30,'EANA960509HCSSRL06','EANA960509','9F6','1996-05-09',NULL,'dragonn117@hotmail.com','9612348809','9612348809',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:25:37','2025-06-24 16:25:37',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(38,NULL,NULL,'default.png','NAYRA GUADALUPE','PEREZ','HERNANDEZ',37,37,30,'PEHN861203MCSRRY05','PEHN861203','N60','1986-12-03',NULL,'aryang86@hotmail.com','9613742983','9613742983',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:27:39','2025-06-24 16:27:39',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(39,NULL,NULL,'default.png','AIDEE','TOVILLA','BUSTOS',37,37,30,'TOVA911018MCSVSD07','TOVA911018','V47','1991-10-18',NULL,'bioquimicaaidee@gmail.com','9612297779','9612297779',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:28:46','2025-06-24 16:28:46',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(40,NULL,NULL,'default.png','NOHEMI GUADALUPE','NUÑEZ','ROBLES',37,37,30,'NURN970621MCSXBH05','NURN970621','RP8','1997-06-21',NULL,'noheminr13@gmail.com','9612021563','9612021563',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:30:48','2025-06-24 16:30:48',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(41,NULL,NULL,'default.png','JOSE RAMON','CANCINO','IBARRA',37,37,30,'CAIR570605HCSNBM05','CAIR570605','NR9','1957-06-05',NULL,'cancinoibarra@hotmail.com','9611992659','9611992659',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:31:20','2025-06-24 16:31:20',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(42,NULL,NULL,'default.png','NANCY LORENA','DOMINGUEZ','AGUILAR',37,37,30,'DOAN920826MCSMGN05','DOAN920826','E55','1992-08-26',NULL,'nancyldguezlar@gmail.com','9611131442','9611131442',2,2,NULL,652083,1,NULL,652083,1,NULL,'eWnKQm0f','2025-06-24 16:32:50','2025-07-02 12:14:39',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,1),(43,NULL,NULL,'default.png','AYLIN SHUNSEY','DOMINGUEZ','MARTINEZ',37,37,30,'DOMA950621MCSMRY02','DOMA950621','RF4','1995-06-21',NULL,'aylinshun@gmail.com','9612531967','9612531967',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:32:59','2025-06-24 16:32:59',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(44,NULL,NULL,'default.png','CARLOS IVAN','LOPEZ','RAMOS',37,37,30,'LORC841021HCSPMR08','LORC841021','635','1984-10-21',NULL,'ivan5000@hotmail.es','9613367062','9613367062',2,1,NULL,652085,1,NULL,652085,1,NULL,'qGlkkDwW','2025-06-24 16:33:43','2025-07-02 12:40:00',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,1),(45,NULL,NULL,'default.png','XOCHITL KARINA','GONZALEZ','HERRERA',37,37,30,'GOHX821121MCSNRC08','GOHX821121','AY4','1982-11-21',NULL,'xochitl829@hotmail.com','9612181040','9612181040',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:36:24','2025-06-24 16:36:24',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(46,NULL,NULL,'default.png','SARA ELENA','ZAPATA','MARROQUIN',37,37,30,'ZAMS001129MCSPRRA1','ZAMS001129','H88','2000-11-29',NULL,'saraelenazm29@gmail.com','9613030711','9613030711',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:36:25','2025-06-24 16:36:25',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(47,NULL,NULL,'default.png','CRISTINA MARGARITA','CERVANTES','OROZCO',37,37,30,'CEOC740215MCSRRR09','CEOC740215','TT0','1974-02-15',NULL,'cristinacervantes_2@hotmail.com','9617017744','9617017744',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:36:38','2025-06-24 16:36:38',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(49,NULL,NULL,'default.png','JULIO CESAR','RIZO','CASTELLANOS',37,37,7,'RICJ800403HDFZSL04','RICJ800403','H49','1980-04-03',NULL,'jrizzo80@gmail.com','9621683762','9621683762',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:38:05','2025-06-24 16:38:05',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(50,NULL,NULL,'default.png','JORGE','CUESTA','LOPEZ',37,37,30,'CULJ640521HCSSPR09','CULJ640521','1Y3','1964-05-21',NULL,'nacapitu@hotmail.com','9616072972','9616072972',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:38:30','2025-06-24 16:38:30',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(51,NULL,NULL,'default.png','LUIS ALEJANDRO','URBINA','LOPEZ',37,37,30,'UILL940324HCSRPS03','UILL940324','IF8','1994-03-24',NULL,'luis_240394@hotmail.es','9671276477','9671276477',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:40:48','2025-06-24 16:40:48',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(52,NULL,NULL,'default.png','LUIS ENRIQUE','ALVAREZ','GONZALEZ',37,37,30,'AAGL870111HCSLNS08','AAGL870111','3U8','1987-01-11',NULL,'luenalgo@gmail.com','9631371261','9631371261',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:41:21','2025-06-24 16:41:21',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(53,NULL,NULL,'default.png','JOSE LUIS','VICENTE','GARCIA',37,37,32,'VIGL770517HDFCRS04','VIGL770517','HV5','1977-05-17',NULL,'jlvg77@gmail.com','9615790951','9615790951',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:42:42','2025-06-24 16:42:42',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(54,NULL,NULL,'default.png','MARTHA LORENA','CIGARROA','MATIAS',37,37,30,'CIMM840117MCSGTR00','CIMM840117','IDA','1984-01-17',NULL,'mar_lore91@hotmail.com','9611562250','9611562250',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:43:46','2025-06-24 16:43:46',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(55,NULL,NULL,'default.png','HERNAN','ALFONZO','LEON',37,37,30,'AOLH630217HCSLNR01','AOLH630217','FA4','1963-02-17',NULL,'halfonzo1729@gmail.com','9615792775','9615792775',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:43:57','2025-06-24 16:43:57',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(56,NULL,NULL,'default.png','AMAYRANI GUADALUPE','FONSECA','RUIZ',37,37,30,'FORA960804MCSNZM00','FORA960804','DA0','1996-08-04',NULL,'amayrani_fonseca96@hotmail.com','9615807837','9615807837',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:46:38','2025-06-24 16:46:38',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(57,NULL,NULL,'default.png','MONICA','RUIZ','GORDILLO',37,37,30,'RUGM830825MCSZRN04','RUGM830825','941','1983-08-25',NULL,'monnyruizg@gmail.com','9612690021','9612690021',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:46:47','2025-06-24 16:46:47',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(58,NULL,NULL,'default.png','DANIEL','DOMINGUEZ','JIMENEZ',37,37,30,'DOJD890305HCSMMN04','DOJD890305','F18','1989-03-05',NULL,'dracula16a@hotmail.com','9614461567','9614461567',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:47:09','2025-06-24 16:47:09',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(59,NULL,NULL,'default.png','NAYELY MONTSERRAT','NACIFF','VALDEZ',37,37,30,'NAVN890708MCSCLY08','NAVN890708','8P3','1989-07-08',NULL,'nay_naciff@hotmail.com','9631362492','9631362492',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:49:10','2025-06-24 16:49:10',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(60,NULL,NULL,'default.png','EUGENIA CANDELARIA','MORENO','CASTILLO',37,37,30,'MOCE750203MCSRSG07','MOCE750203','3M7','1975-02-03',NULL,'eugenia.castillo.ta@gmail.com','9616931851','9616931851',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:49:25','2025-06-24 16:49:25',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(61,NULL,NULL,'default.png','CLAUDIA GUADALUPE','CASTELLANOS','GALDAMEZ',37,37,30,'CAGC701228MCSSLL08','CAGC701228','QTA','1970-12-28',NULL,'claucastellanos@hotmail.com','9612674835','9612674835',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:50:05','2025-06-24 16:50:05',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(62,NULL,NULL,'default.png','EDEN','HERNANDEZ','HERNANDEZ',37,37,20,'HEHE611007HTCRRD03','HEHE611007','BS9','1961-10-07',NULL,'edenhernandez137@gmail.com','9616602522','9616602522',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:51:11','2025-06-24 16:51:11',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(63,NULL,NULL,'default.png','MARIA DEL CARMEN','SERRANO','CORZO',37,37,30,'SECC760427MCSRRR05','SECC760427','874','1976-04-27',NULL,'karameloav@hotmail.com','9612337752','9612337752',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 16:53:54','2025-06-24 16:53:54',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(64,NULL,NULL,'default.png','PAOLA','SANCHEZ','RIVERA',37,37,30,'SARP850807MCSNVL02','SARP850807','E89','1985-08-07',NULL,'girlpao1207@gmail.com','9616524248','9616524248',1,NULL,NULL,652079,1,NULL,652079,1,NULL,'cTf5Hlqt','2025-06-24 16:56:48','2025-07-01 13:02:51',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,1),(65,NULL,NULL,'default.png','FELIPE DE JESUS','RIOS','GOMEZ',37,37,30,'RIGF970421HCSSML09','RIGF970421','DB2','1997-04-21',NULL,'felipergomez97@gmail.com','9615483001','9615483001',1,NULL,NULL,652080,1,NULL,652080,1,NULL,'nzYOuyxQ','2025-06-24 17:00:51','2025-07-02 10:00:00',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,1),(66,NULL,NULL,'default.png','ANGEL GABRIEL','COBAXIN','RAMOS',37,37,30,'CORA950712HCSBMN09','CORA950712','VE2','1995-07-12',NULL,'acobax@gmail.com','9613214890','9613214890',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-24 17:03:35','2025-06-24 17:03:35',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(67,NULL,NULL,'default.png','KATHIA DANIELA','PEREZ','BUCIO',37,37,24,'PEBK941021MVZRCT05','PEBK941021','QQ4','1994-10-21',NULL,'KATHIABUCIO@OUTLOOK.COM','9612906038','9612906038',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 10:17:37','2025-06-25 10:17:37',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(68,NULL,NULL,'default.png','RENATO ALFONSO','CORTAZAR','REYES',37,37,32,'CORR910925HDFRYN02','CORR910925','C60','1991-09-25',NULL,'cortazar@gmail.com','5554546691','5554546691',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 10:22:28','2025-06-25 11:27:06',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(69,NULL,NULL,'default.png','OSCAR EDUARDO','TREJO','CRUZ',37,37,30,'TECO890830HCSRRS05','TECO890830','512','1989-08-30',NULL,'otrejo2112@gmail.com','9612762049','9612762049',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 10:22:33','2025-06-25 10:22:33',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(70,NULL,NULL,'default.png','GUILLERMO IVAN','GALDAMEZ','TOLEDO',37,37,30,'GATG790927HCSLLL09','GATG790927','2M5','1979-09-27',NULL,'guillermo.ivan.79@gmail.com','9612639811','9612639811',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 10:25:23','2025-06-25 10:25:23',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(71,NULL,NULL,'default.png','JANETH GUADALUPE','ESPINOSA','SARMIENTO',37,37,30,'EISJ761101MCSSRN05','EISJ761101','GM6','1976-11-01',NULL,'janeth_esar@hotmail.com','9611775529','9611775529',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 10:27:45','2025-06-25 10:27:45',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(72,NULL,NULL,'default.png','ERIKA DEL CARMEN','CHAVARRIA','CRUZ',37,37,30,'CACE750716MCSHRR03','CACE750716','810','1975-07-16',NULL,'cace2@hotmail.com','9622422727','9622422727',1,NULL,NULL,652084,1,NULL,652084,1,NULL,'q2DBJ6TV','2025-06-25 11:14:51','2025-07-02 12:21:59',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,1),(73,NULL,NULL,'default.png','JOSE GUADALUPE','ZAVALA','LORENZANA',37,37,30,'ZALG651218HCSVRD06','ZALG651218','M39','1965-12-18',NULL,'josegpezavala@live.com.ar','9611988811','9611988811',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 11:20:40','2025-06-25 11:26:34',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(74,NULL,NULL,'default.png','CARLOS MIGUEL','MARTINEZ','CASTAÑON',37,37,30,'MACC000319HCSRSRA4','MACC000319','3E5','2000-03-19',NULL,'carlosmmc6@gmail.com','9611750882','9611750882',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 11:25:14','2025-06-25 11:25:14',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(75,NULL,NULL,'default.png','YLIANA','CAMACHO','SALINAS',37,37,30,'CASY771020MCSMLL03','CASY771020','MLA','1977-10-20',NULL,'ylicasa77@hotmail.com','9612698852','9612698852',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 11:30:28','2025-06-25 15:27:54',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(76,NULL,NULL,'default.png','TANIA SOFIA','SANCHEZ','GOMEZ',37,37,13,'SAGT971022MOCNMN00','SAGT971022','QN3','1997-10-22',NULL,'taniasofia.work@gmail.com','9661283403','9661283403',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 11:35:49','2025-06-25 11:35:49',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(77,NULL,NULL,'default.png','EHINER','GONZALEZ','MOLINA',37,37,30,'GOME771106HCSNLH05','GOME771106','DC2','1977-11-06',NULL,'ehinerglz@gmail.com','9612107408','9612107408',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 11:40:49','2025-06-25 15:27:42',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(78,NULL,NULL,'default.png','MARIA JOSE','CHAMBE','MARIN',37,37,30,'CAMJ900808MCSHRS03','CAMJ900808','TZ3','1990-08-08',NULL,'MAJOCHAMBE@HOTMAIL.COM','9612010296','9612010296',2,2,NULL,652087,1,NULL,652087,1,NULL,'nLJFpZZ4','2025-06-25 11:49:46','2025-07-02 13:21:45',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,1),(79,NULL,NULL,'default.png','ALEJANDRO','VASQUEZ','CUEVAS',37,37,13,'VXCA010112HOCSVLA3','VACA010112','Q20','2001-01-12',NULL,'alejandro_vacu2001@outlook.com','9711320356','9711320356',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 11:54:11','2025-06-25 15:27:30',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(80,NULL,NULL,'default.png','LIZBETH STEPHANIA','MARTINEZ','GONZALEZ',37,37,30,'MAGL920707MCSRNZ07','MAGL920707','T4A','1992-07-07',NULL,'gonzalezenlace@gmail.com','9611867123','9611867123',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 11:59:01','2025-06-25 11:59:01',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(82,NULL,NULL,'default.png','ROMULO HUMBERTO','MORALES','CASTRO',37,37,30,'MOCR720706HCSRSM06','MOCR720706','HL7','1972-07-06',NULL,'rhmc1972@hotmail.com','9613275683','9613275683',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 12:03:05','2025-06-25 12:03:05',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(83,NULL,NULL,'default.png','JOAN','MENDEZ','PINEDA',37,37,30,'MEPJ960706HCSNNN00','MEPJ960706','JM6','1996-07-06',NULL,'joan_mp06@hotmail.com','9614258537','9614258537',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 12:08:20','2025-06-25 15:27:12',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(84,NULL,NULL,'default.png','JOSE ALBERTO','AGUILAR','HERNANDEZ',37,37,30,'AUHA840307HCSGRL02','AUHA840307','UV4','1984-03-07',NULL,'colochcotz7@gmail.com','9612332990','9612332990',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 12:13:32','2025-06-25 12:13:32',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(85,NULL,NULL,'default.png','DIANA ELIZABETH','DOMINGUEZ','HERNANDEZ',37,37,30,'DOHD890807MCSMRN09','DOHD890807','DV2','1989-08-07',NULL,'elizadh2301@gmail.com','9614578101','9614578101',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 12:17:45','2025-06-25 12:17:45',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(86,NULL,NULL,'default.png','CRISTY ANAHI','GUTIERREZ','VAZQUEZ',37,37,30,'GUVC930724MCSTZR03','GUVC930724','P22','1993-07-24',NULL,'anahigutierrezv@hotmail.com','9671286013','9671286013',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 12:23:00','2025-06-25 12:23:00',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(87,NULL,NULL,'default.png','MANUEL DE JESUS','HERNANDEZ','LOPEZ',37,37,30,'HELM801207HCSRPN04','HELM801207','UK8','1980-12-07',NULL,'manuel07hernandez07@gmail.com','9611070170','9611070170',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 12:27:54','2025-06-25 12:27:54',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(88,NULL,NULL,'default.png','GERARDO','DIAZ','ZEPEDA',37,37,30,'DIZG710618HCSZPR03','DIZG710618','9J5','1971-06-18',NULL,'gezep8@gmail.com','9613428720','9613428720',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 12:36:01','2025-06-25 12:36:01',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(89,NULL,NULL,'default.png','IVONNE ESMERALDA','MENDOZA','MENDOZA',37,37,30,'MEMI610425MCSNNV01','MEMI610425','J15','1961-04-25',NULL,'ivonneemm@hotmail.com','9611801705','9611801705',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 12:40:24','2025-06-25 12:40:24',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(90,NULL,NULL,'default.png','MIXAEL','TOLEDO','PIMENTEL',37,37,30,'TOPM780517HCSLMX00','TOPM780517','NF0','1978-05-17',NULL,'mixael19@hotmail.com','9611684651','9611684651',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 12:44:35','2025-06-25 12:44:35',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(91,NULL,NULL,'default.png','LOURDES EUGENIA','MAGDALENO','RODRIGUEZ',37,37,30,'MARL930808MCSGDR06','MARL930808','B96','1993-08-08',NULL,'magdaleno9308@hotmail.com','9614527902','9614527902',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 12:48:55','2025-06-25 12:48:55',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(92,NULL,NULL,'default.png','FRANCISCO','JIMENEZ','MOLINA',37,37,30,'JIMF920721HCSMLR05','JIMF920721','7J0','1992-07-21',NULL,'franc.710@hotmail.com','9611911783','9611911783',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 12:53:10','2025-06-25 12:53:10',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(93,NULL,NULL,'default.png','DIANA LAURA','VELASCO','VIDAL',37,37,30,'VEVD971214MCSLDN02','VEVD971214','T84','1997-12-14',NULL,'laura.vidaal@hotmail.com','9611997364','9611997364',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 12:56:44','2025-06-25 12:56:44',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(94,NULL,NULL,'default.png','NIRIAN ARELI','CHAVEZ','RAMIREZ',37,37,30,'CARN010831MCSHMRA0','CARN010831','4NA','2001-08-31',NULL,'nirianchavez3130@gmail.com','9651003709','9651003709',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 13:01:58','2025-06-25 13:01:58',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(95,NULL,NULL,'default.png','ELIZABETH','UTRILLA','FERNANDEZ',37,37,30,'UIFE750413MCSHMRA0','UIFE750413','V10','1975-04-13',NULL,'elizabethuf13@gmail.com','9616687422','9616687422',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 13:06:21','2025-06-25 13:06:21',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(97,NULL,NULL,'default.png','LUCYTANIA','VALENCIA','ALBORES',37,37,30,'VAAL810806MCSLLC03','VAAL810806','R75','1981-08-06',NULL,'lucytaniavalencia@gmail.com','9611315983','9611315983',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 13:13:10','2025-06-25 15:28:42',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(98,NULL,NULL,'default.png','CHRISTIAN GUADALUPE','ESCOBAR','JIMENEZ',37,37,30,'EOJC920128MCSSMH06','EOJC920128','LU8','1992-01-28',NULL,'chris_0192@hotmail.com','9613644773','9613644773',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 13:18:02','2025-06-25 13:18:02',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(99,NULL,NULL,'default.png','ANA SILVIA','SANTIAGO','GORDILLO',37,37,30,'SAGA750131MCSNRN09','SAGA750131','BG2','1975-01-31',NULL,'anasilviasantiago@hotmail.com','9611784131','9611784131',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 13:22:02','2025-06-25 13:22:02',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(100,NULL,NULL,'default.png','PAOLA KARINA','MORALES','PADILLA',37,37,30,'MOPP940609MCSRDL09','MOPP940609','T28','1994-06-09',NULL,'mpadilla.tja@gmail.com','9612314261','9612314261',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 13:27:46','2025-06-25 13:27:46',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(101,NULL,NULL,'default.png','JOSE MANUEL','RUIZ','SOTO',37,37,30,'RUSM900131HCSZTN06','RUSM900131','MU9','1990-01-31',NULL,'josemanuelrsoto1@gmail.com','9616078683','9616078683',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 13:32:04','2025-06-25 13:32:04',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(102,NULL,NULL,'default.png','JORGE LUIS','GORDILLO','DEL AGUILA',37,37,30,'GOAJ691219HCSRGR04','GOAJ691219','TC3','1969-12-19',NULL,'gordilloaguilar1212@gmail.com','9611353219','9611353219',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 13:35:56','2025-06-25 13:35:56',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(103,NULL,NULL,'default.png','JOSE LIN','VAZQUEZ','SOL',37,37,30,'VASL840120HCSZLN03','VASL840120','KE3','1984-01-20',NULL,'joselinvazquezsol@gmail.com','9613560874','9613560874',1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 13:40:31','2025-06-25 13:40:31',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(104,NULL,NULL,'default.png','DANIEL DE JESUS','VELASCO','CARPIO',37,37,30,'VECD950623HCSLRN05','VECD950623','U39','1995-06-23',NULL,'daniel_j25@hotmail.com','9631235291','9631235291',2,2,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 13:44:48','2025-06-25 13:44:48',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(105,NULL,NULL,'default.png','JOSE EDUARDO','LOPEZ','TON',37,37,30,'LOTE950320HCSPND08','LOTE950320','HM0','1995-03-20',NULL,'j_eduardolt20@outlook.com','9673645891','9673645891',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 13:48:54','2025-06-25 13:48:54',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL),(106,NULL,NULL,'default.png','LILIANA LIZETH','GONZALEZ','AGUILAR',37,37,30,'GOAL001024MCSNGLA8','GOAL001024','QB4','2000-10-24',NULL,'liliana1024gonzalez@gmail.com','9612048638','9612048638',1,NULL,NULL,652086,1,NULL,652086,1,NULL,'5henT4P7','2025-06-25 13:52:29','2025-07-02 13:10:39',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,1),(107,NULL,NULL,'default.png','JOSE FERNANDO','VALDES','NANDUCA',37,37,30,'VANF961224HCSLNR02','VANF961224','J74','1996-12-24',NULL,'valdesnasdanduca@gmail.com','9612988595','9612988595',1,NULL,NULL,652078,1,NULL,652078,1,NULL,'VhH5s4uF','2025-06-25 13:55:51','2025-07-01 12:13:04',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,1),(108,NULL,NULL,'default.png','OSCAR MARIO','ORANTES','COUTIÑO',37,37,30,'OACO701025HCSRTS07','OACO701025','NR4','1970-10-25',NULL,'oscarmorantes10@hotmail.com','9613366163','9613366163',2,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'','2025-06-25 13:59:52','2025-06-25 13:59:52',NULL,'\0','\0',NULL,NULL,NULL,NULL,'\0',NULL,NULL);

/*Table structure for table `role_user` */

DROP TABLE IF EXISTS `role_user`;

CREATE TABLE `role_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int unsigned NOT NULL,
  `role_id` int unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `role_user` */

insert  into `role_user`(`id`,`user_id`,`role_id`,`created_at`,`updated_at`,`deleted_at`) values (1,1,1,'2018-08-24 04:00:00','2019-01-21 15:11:34',NULL),(2,2,3,NULL,'2025-06-23 15:44:26',NULL),(3,3,3,NULL,'2025-06-23 15:49:11',NULL),(4,4,3,NULL,'2025-06-25 14:13:34',NULL),(5,5,6,NULL,'2025-06-27 11:19:17',NULL),(6,6,3,NULL,'2025-06-27 14:08:11',NULL),(7,7,4,NULL,'2025-07-01 12:02:00',NULL),(8,8,4,NULL,'2025-07-01 13:00:18',NULL),(9,9,4,NULL,'2025-07-02 09:58:57',NULL),(10,10,4,NULL,'2025-07-02 11:55:39',NULL),(11,11,4,NULL,'2025-07-02 12:04:51',NULL),(12,12,4,NULL,'2025-07-02 12:13:47',NULL),(13,13,4,NULL,'2025-07-02 12:21:01',NULL),(14,14,4,NULL,'2025-07-02 12:38:40',NULL),(15,15,4,NULL,'2025-07-02 13:09:38',NULL),(16,16,4,NULL,'2025-07-02 13:17:28',NULL);

/*Table structure for table `roles` */

DROP TABLE IF EXISTS `roles`;

CREATE TABLE `roles` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `display_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `sip` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `roles` */

insert  into `roles`(`id`,`name`,`display_name`,`description`,`created_at`,`updated_at`,`deleted_at`,`sip`) values (1,'admin','Administrador DeclaraChiapas','Administrador DeclaraChiapas','2018-08-29 04:00:00','2019-01-14 16:50:18',NULL,'\0'),(2,'dp-adm','Administrador de Dependencia','Administrador de Dependencias','2018-08-29 04:00:00','2019-01-16 17:50:44',NULL,'\0'),(3,'dp-rh','Recursos Humanos','Recursos Humanos de Dependencias','2018-08-29 04:00:00','2021-03-19 12:52:39',NULL,''),(4,'declarante','Declarante','Declarante','2019-01-22 06:00:00','2019-01-22 20:04:21',NULL,'\0'),(5,'dp-rh-capturista','Capturista Recursos Humanos','Capturista Recursos Humanos','2019-02-13 00:00:00','2019-02-13 15:12:36',NULL,'\0'),(6,'admin-soporte','Administrador del SIP Web','Persona que dara atencion a usuarios','2019-03-29 00:00:00','2019-12-17 11:48:13',NULL,'\0'),(7,'firmante','Firmante','Firmar las altas y bajas que se envian a la SHYFP',NULL,'2019-06-26 11:03:40',NULL,'\0'),(8,'contralor','Organos Internos de Control','Persona que revisara los faltantes a declarar',NULL,'2021-03-19 12:52:42',NULL,''),(9,'abogado','Area de Abogados','Area de Abogados',NULL,'2021-04-09 12:12:53',NULL,''),(10,'responsabilidades','Responsabilidades','Responsabilidades',NULL,'2022-06-27 14:24:34',NULL,'');

/*Table structure for table `sec_01_01` */

DROP TABLE IF EXISTS `sec_01_01`;

CREATE TABLE `sec_01_01` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `foto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT 'default.png',
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_nacionalidad` int DEFAULT NULL,
  `numero_identificacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `id_estado` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `rfc` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `homoclave` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `correo_institucional` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `correo_personal` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono_particular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono_celular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_estado_civil` int DEFAULT NULL,
  `id_regimen_matrimonial` int DEFAULT NULL,
  `otro_regimen_matrimonial` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_nacionalidad` (`id_nacionalidad`) USING BTREE,
  KEY `id_estado_civil` (`id_estado_civil`) USING BTREE,
  KEY `id_regimen_matrimonial` (`id_regimen_matrimonial`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=520982 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_01` */

insert  into `sec_01_01`(`id`,`id_declaracion`,`foto`,`nombre`,`apellido1`,`apellido2`,`id_nacionalidad`,`numero_identificacion`,`id_pais`,`id_estado`,`curp`,`rfc`,`homoclave`,`correo_institucional`,`correo_personal`,`telefono_particular`,`telefono_celular`,`id_estado_civil`,`id_regimen_matrimonial`,`otro_regimen_matrimonial`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (520972,652078,'default.png','JOSE FERNANDO','VALDES','NANDUCA',37,NULL,37,NULL,'VANF961224HCSLNR02','VANF961224','J74',NULL,'valdesnasdanduca@gmail.com','9612988595','9612988595',1,NULL,NULL,NULL,'2025-07-01 12:13:04','2025-07-01 12:13:04',NULL),(520973,652079,'default.png','PAOLA','SANCHEZ','RIVERA',37,NULL,37,'30','SARP850807MCSNVL02','SARP850807','E89','girlpao1207@gmail.com','girlpao1207@gmail.com','9616524248','9616524248',1,NULL,NULL,NULL,'2025-07-01 13:02:51','2025-07-01 13:18:11',NULL),(520974,652080,'default.png','FELIPE DE JESUS','RIOS','GOMEZ',37,NULL,37,'30','RIGF970421HCSSML09','RIGF970421','DB2','unidadaa@tachiapas.gob.mx','felipergomez97@gmail.com','9615483001','9615483001',1,NULL,NULL,'se precisa que los datos expuestos son personales','2025-07-02 10:00:00','2025-07-02 12:38:54',NULL),(520975,652081,'default.png','NANCY CAROLINA','GOMEZ','LOPEZ',37,NULL,37,'30','GOLN960719MCSMPN07','GOLN960719','QJ9','contable1@tjaech.gob.mx','nancycarolina50@gmail.com','9611503919','9611503919',1,NULL,NULL,'Sin aclaraciones y/o observaciones.','2025-07-02 11:56:17','2025-07-02 12:03:01',NULL),(520976,652082,'default.png','GABRIEL','AGUIAR','CRUZ',37,NULL,37,'30','AUCG920315HCSGRB02','AUCG920315','FP3','tjaec.gabriel@gmail.com','tjaec.gabriel@gmail.com','9612049152','9612049152',1,NULL,NULL,'Gabriel Aguiar','2025-07-02 12:06:00','2025-07-02 12:09:02',NULL),(520977,652083,'default.png','NANCY LORENA','DOMINGUEZ','AGUILAR',37,NULL,37,'30','DOAN920826MCSMGN05','DOAN920826','E55','coordinacion.archivo@tjaech.gob.mx','nancyldguezlar@gmail.com','9611131442','9611131442',2,2,NULL,'sin observaciones','2025-07-02 12:14:39','2025-07-02 12:18:24',NULL),(520978,652084,'default.png','ERIKA DEL CARMEN','CHAVARRIA','CRUZ',37,NULL,37,'30','CACE750716MCSHRR03','CACE750716','810',NULL,'cace2@hotmail.com','9622422727','9622422727',1,NULL,NULL,'SIN OBSERVACIONES','2025-07-02 12:21:59','2025-07-02 12:23:09',NULL),(520979,652085,'default.png','CARLOS IVAN','LOPEZ','RAMOS',37,NULL,37,'30','LORC841021HCSPMR08','LORC841021','635',NULL,'ivan5000@hotmail.es','9613367062','9613367062',2,1,NULL,NULL,'2025-07-02 12:40:00','2025-07-02 12:50:43',NULL),(520980,652086,'default.png','LILIANA LIZETH','GONZALEZ','AGUILAR',37,NULL,37,'30','GOAL001024MCSNGLA8','GOAL001024','QB4','jjurisdiccion@tjaech.gob.mx','liliana1024gonzalez@gmail.com','9612048638','9612048638',1,NULL,NULL,'Sin observaciones','2025-07-02 13:10:39','2025-07-02 13:12:01',NULL),(520981,652087,'default.png','MARIA JOSE','CHAMBE','MARIN',37,NULL,37,'30','CAMJ900808MCSHRS03','CAMJ900808','TZ3','juzgado.resp@tjaech.gob.mx','MAJOCHAMBE@HOTMAIL.COM','9612010296','9612010296',2,2,NULL,'ninguna observacion','2025-07-02 13:18:38','2025-07-02 13:21:45',NULL);

/*Table structure for table `sec_01_02` */

DROP TABLE IF EXISTS `sec_01_02`;

CREATE TABLE `sec_01_02` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `id_municipio` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `codigo_postal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `colonia` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `calle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `num_exterior` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `num_interior` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=498120 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_02` */

insert  into `sec_01_02`(`id`,`id_declaracion`,`id_pais`,`id_municipio`,`id_estado`,`codigo_postal`,`colonia`,`calle`,`num_exterior`,`num_interior`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (498110,652079,37,51,30,'29047','24 de junio','Avenida rio tulija','226',NULL,NULL,'2025-07-01 13:19:51','2025-07-01 13:19:51',NULL),(498111,652078,37,51,30,'29018','LA CONDESA','ESCORPIÓN','10','10','prueba de comentario domicilio','2025-07-01 14:01:45','2025-07-01 14:01:45',NULL),(498112,652080,37,73,30,'29170','Narciso Mendoza','15 de septiembre','manzana 11','casa 18','se precisa que los datos corresponden a mi domicilio particular','2025-07-02 10:10:28','2025-07-02 12:39:33',NULL),(498113,652081,37,51,30,'29034','La pimienta','Privada los tulipanes','1560',NULL,'Sin aclaraciones y/o observaciones.','2025-07-02 12:08:03','2025-07-02 12:08:03',NULL),(498114,652082,37,51,30,'29047','24 de junio','Rio Usumacinta','320','320','Gabriel Aguiar','2025-07-02 12:11:07','2025-07-02 12:11:07',NULL),(498115,652083,37,51,30,'29059','Diamante','Av. la coyota','274','s/n','sin observaciones','2025-07-02 12:20:55','2025-07-02 12:20:55',NULL),(498116,652085,37,51,30,'29060','Xamaipak','19 poniente Sur','439','ninguno',NULL,'2025-07-02 12:52:38','2025-07-02 12:52:38',NULL),(498117,652084,37,51,30,'29026','PARAISO OJO DE AGUA','RIO RIACHUELO','456','0','SIN OBSERVACIONES','2025-07-02 13:09:31','2025-07-02 13:09:31',NULL),(498118,652086,37,51,30,'29034','barrio la pimienta','segunda oriente norte','1734','sin numero','Sin observaciones','2025-07-02 13:13:09','2025-07-02 13:13:09',NULL),(498119,652087,37,51,30,'29000','centro','octava sur poniente','423','ninguno','ninguna observacion','2025-07-02 13:25:16','2025-07-02 13:25:16',NULL);

/*Table structure for table `sec_01_03` */

DROP TABLE IF EXISTS `sec_01_03`;

CREATE TABLE `sec_01_03` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `id_grado_academico` int NOT NULL,
  `institucion_educativa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_pais` int NOT NULL,
  `carrera` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_estatus_academico` int NOT NULL,
  `id_documento_obtenido` int NOT NULL,
  `fecha_obtencion_documento` date DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_grado_academico` (`id_grado_academico`) USING BTREE,
  KEY `id_municipio` (`id_pais`) USING BTREE,
  KEY `id_estatus_academico` (`id_estatus_academico`) USING BTREE,
  KEY `id_documento_obtenido` (`id_documento_obtenido`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1270038 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_03` */

insert  into `sec_01_03`(`id`,`id_declaracion`,`id_grado_academico`,`institucion_educativa`,`id_pais`,`carrera`,`id_estatus_academico`,`id_documento_obtenido`,`fecha_obtencion_documento`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (1270020,652079,8,'Instituto Nacional de Estudios Fiscales',37,'Derecho Fiscal',2,4,'2022-08-30',NULL,'2025-07-01 13:23:31','2025-07-01 13:23:31',NULL),(1270021,652079,7,'Universidad del Valle de México',37,'Derecho Fiscal',2,4,'2010-08-08',NULL,'2025-07-01 13:24:45','2025-07-01 13:24:45',NULL),(1270022,652079,5,'Universidad del Valle de México',37,'Derecho',2,4,'2008-01-13',NULL,'2025-07-01 13:25:59','2025-07-01 13:25:59',NULL),(1270023,652079,3,'Colegio de Bachilleres plantel 13',37,'ciencias sociales',2,2,'2003-07-04',NULL,'2025-07-01 13:27:36','2025-07-01 13:27:36',NULL),(1270024,652079,2,'Joaquín Miguel Gutiérrez',37,'Mecanografía',2,2,'2000-07-05',NULL,'2025-07-01 13:28:47','2025-07-01 13:28:47',NULL),(1270025,652080,5,'Universidad Pablo Guardado Chávez',37,'licenciatura en derecho',2,4,'2023-03-20','se precisa que los datos corresponden a mi preparación profesional','2025-07-02 11:03:23','2025-07-02 12:40:22',NULL),(1270026,652081,5,'Universidad Autónoma de Chiapas',37,'Licenciatura en Contaduria',2,2,'2021-06-17','Sin aclaraciones y/o observaciones.','2025-07-02 12:10:45','2025-07-02 12:10:45',NULL),(1270027,652082,5,'Instituto Tecnológico de Tuxtla Gutiérrez',37,'Ing. en Gestión Empresarial',2,3,'2016-07-08','Gabriel Aguiar','2025-07-02 12:13:46','2025-07-02 12:13:46',NULL),(1270028,652084,5,'INSTITUTO SUPERIORES DEL ESTADO DE CHIAPAS',37,'LICENCIATURA EN DERECHO',2,3,'2000-07-11',NULL,'2025-07-02 12:29:43','2025-07-02 12:29:43',NULL),(1270029,652085,5,'Universidad Autónoma de Chiapas',37,'derecho',2,4,'2014-05-30',NULL,'2025-07-02 13:04:17','2025-07-02 13:04:17',NULL),(1270030,652085,3,'Cbetis 092',37,'turismo',2,2,'2005-06-30',NULL,'2025-07-02 13:08:44','2025-07-02 13:08:44',NULL),(1270031,652086,3,'Colegio de Bachilleres de Chiapas',37,NULL,2,2,'2019-06-05','Sin observaciones','2025-07-02 13:16:24','2025-07-02 13:16:24',NULL),(1270032,652086,5,'Universidad Valle del Grijalva',37,'Derecho',2,4,'2022-11-20','Sin observaciones','2025-07-02 13:18:26','2025-07-02 13:18:26',NULL),(1270033,652087,5,'universidad del valle de mexico',37,'derecho',2,4,'2013-11-15','ninguna observacion','2025-07-02 13:33:03','2025-07-02 13:33:03',NULL),(1270034,652083,1,'Rubén M. Rincón',37,'Educación básica',2,2,'2004-07-15','sin observaciones','2025-07-02 13:47:44','2025-07-02 13:47:44',NULL),(1270035,652083,2,'Francisco González Bocanegra',37,'Educación Media',2,2,'2007-07-15','sin observaciones','2025-07-02 13:49:31','2025-07-02 13:49:31',NULL),(1270036,652083,3,'Colegio de Bachilleres de Chiapas 019',37,'Educación Media Superior',2,2,'2010-07-15','sin observaciones','2025-07-02 13:51:23','2025-07-02 13:51:23',NULL),(1270037,652083,5,'Universidad Pedagógica Nacional 071',37,'Educación Superior',2,2,'2015-07-15','sin observaciones','2025-07-02 13:53:01','2025-07-02 13:53:01',NULL);

/*Table structure for table `sec_01_04` */

DROP TABLE IF EXISTS `sec_01_04`;

CREATE TABLE `sec_01_04` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `id_padron` int NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_padron` (`id_padron`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=520982 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_04` */

insert  into `sec_01_04`(`id`,`id_declaracion`,`id_padron`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (520972,652078,102,'PRUEBA DE LLENADO DE DATOS DEL EMPLEO','2025-07-01 12:13:04','2025-07-01 12:41:08',NULL),(520973,652079,61,'fecha de inicio es 14 de marzo de 2025 con el cargo de oficinista, asimismo se hace la aclaración que con fecha 01 de mayo de 2025, se realizó el cambio de cargo y area, por lo que a la fecha estoy con la categoría de analista profesional \"D\" adscrita al órgano interno de control.','2025-07-01 13:02:51','2025-07-02 15:30:39',NULL),(520974,652080,62,NULL,'2025-07-02 10:00:00','2025-07-02 10:00:00',NULL),(520975,652081,29,'Sin aclaraciones y/o observaciones.','2025-07-02 11:56:17','2025-07-02 12:16:46',NULL),(520976,652082,5,'Gabriel Aguiar','2025-07-02 12:06:00','2025-07-02 12:18:02',NULL),(520977,652083,40,NULL,'2025-07-02 12:14:39','2025-07-02 12:14:39',NULL),(520978,652084,69,NULL,'2025-07-02 12:21:59','2025-07-02 12:21:59',NULL),(520979,652085,42,NULL,'2025-07-02 12:40:00','2025-07-02 12:40:00',NULL),(520980,652086,101,NULL,'2025-07-02 13:10:39','2025-07-02 13:10:39',NULL),(520981,652087,75,'ninguna observacion','2025-07-02 13:18:38','2025-07-02 13:35:08',NULL);

/*Table structure for table `sec_01_04_otros_empleos` */

DROP TABLE IF EXISTS `sec_01_04_otros_empleos`;

CREATE TABLE `sec_01_04_otros_empleos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_sec_01_04` int NOT NULL,
  `id_nivel_gobierno` int NOT NULL,
  `id_poder_ente` int NOT NULL,
  `id_dependencia` int NOT NULL,
  `nombre_ente_publico` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `area_adscripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_cargo_puesto` int NOT NULL,
  `cargo_puesto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `contrato_honorarios` tinyint(1) NOT NULL,
  `nivel_encargo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_inicio` date NOT NULL,
  `id_domicilio` int NOT NULL,
  `telefono_laboral` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `funciones_principales` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `otra_funcion` varchar(250) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_sec_01_04` (`id_sec_01_04`) USING BTREE,
  KEY `id_domicilio` (`id_domicilio`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=48239 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_04_otros_empleos` */

/*Table structure for table `sec_01_05` */

DROP TABLE IF EXISTS `sec_01_05`;

CREATE TABLE `sec_01_05` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `id_ambito` int NOT NULL,
  `otro_ambito` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_nivel_gobierno` int DEFAULT NULL,
  `id_poder_ente` int DEFAULT NULL,
  `nombre_ente` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_sector_industria` int DEFAULT NULL,
  `otro_sector` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc_ente` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `area_adscripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `cargo_puesto` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_ingreso` date NOT NULL,
  `fecha_salida` date NOT NULL,
  `funciones_principales` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_pais` int DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `otras_funciones` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_ambito` (`id_ambito`) USING BTREE,
  KEY `id_nivel_gobierno` (`id_nivel_gobierno`) USING BTREE,
  KEY `id_poder_ente` (`id_poder_ente`) USING BTREE,
  KEY `id_sector_industria` (`id_sector_industria`) USING BTREE,
  KEY `id_cargo_puesto` (`cargo_puesto`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=310941 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_05` */

insert  into `sec_01_05`(`id`,`id_declaracion`,`id_ambito`,`otro_ambito`,`id_nivel_gobierno`,`id_poder_ente`,`nombre_ente`,`id_sector_industria`,`otro_sector`,`rfc_ente`,`area_adscripcion`,`cargo_puesto`,`fecha_ingreso`,`fecha_salida`,`funciones_principales`,`id_pais`,`observaciones`,`created_at`,`updated_at`,`deleted_at`,`otras_funciones`) values (310923,652079,1,NULL,2,3,'Tribunal Administrativo del Poder Judicial del Estado de Chiapas',NULL,NULL,NULL,'Juzgado de Jurisdicción Administrativa','Oficinista','2020-01-01','2025-03-14','[\"13\"]',37,'Con motivo a la reforma constitucional de 14 de marzo de 2025 se extinguió el Tribunal Adminsitrativo del Poder Judicial y se creó como organismo autónomo. Por lo que en base al articulo noveno transitorio los recursos humanos pasan a formar parte del nuevo organo.','2025-07-01 13:58:43','2025-07-01 13:58:43',NULL,'Realizar acuerdos'),(310924,652079,1,NULL,2,4,'Tribunal de Justicia Administrativa del Estado de Chiapas',NULL,NULL,NULL,'área de transparencia','jefe de area','2018-01-16','2019-12-18','[\"13\"]',37,NULL,'2025-07-01 15:28:22','2025-07-01 15:28:22',NULL,'Analizar solicitudes de transparencia'),(310925,652079,1,NULL,2,4,'Comisión Estatal de los Derechos Humanos',NULL,NULL,NULL,'Visitaduría de Migrantes','Secretaría Tecnica','2014-12-01','2018-01-15','[\"13\"]',37,NULL,'2025-07-01 15:30:51','2025-07-01 15:30:51',NULL,'Elaboración de recomendaciones'),(310926,652079,1,NULL,1,1,'Servicio de Administración y Enajenación de Bienes (SAE)',NULL,NULL,NULL,'Bienes Asegurados','Supervisor de bienes asegurados','2011-10-15','2013-03-14','[\"13\"]',37,NULL,'2025-07-01 15:33:24','2025-07-01 15:33:24',NULL,'Elaboración de inventarios'),(310927,652079,1,NULL,1,1,'Casa de la Cultura Juridica de la Suprema Corte de Justicia de la Nación sede Tuxtla',NULL,NULL,NULL,'Archivo','Catalogadora','2010-01-01','2011-09-30','[\"13\"]',37,NULL,'2025-07-01 15:35:51','2025-07-01 15:35:51',NULL,'catalogadora de expedientes históricos'),(310928,652081,1,NULL,2,3,'TRIBUNAL ADMINISTRATIVO DEL PODER JUDICIAL DEL ESTADO DE CHIAPAS',NULL,NULL,NULL,'ÁREA DE RECUEROS FINANCIEROS','OFICINISTA','2018-12-19','2025-03-14','[\"7\"]',37,'Sin aclaraciones y/o observaciones.','2025-07-02 12:20:28','2025-07-02 12:20:28',NULL,NULL),(310929,652080,1,NULL,2,3,'Tribunal Administrativo del Poder Judicial del Estado de Chiapas',NULL,NULL,NULL,'Juzgado de Jurisdicción Administrativa','Auxiliar Administrativo B','2020-10-16','2025-03-14','[\"13\"]',37,'se precisa que de conformidad con el transitorio noveno de la constitución política del estado libre y soberano de Chiapas, en los que se contemplan que los derechos de los trabajadores serán respetados.','2025-07-02 12:21:16','2025-07-02 12:21:16',NULL,'cuidado de expedientes y atención al público'),(310930,652081,1,NULL,2,4,'TRIBUNAL DE JUSTICIA ADMINISTRATIVA DEL ESTADO DE CHIAPAS',NULL,NULL,NULL,'AREA DE RECURSOS FINANCIEROS','OFICINISTA','2017-07-16','2018-12-18','[\"7\"]',37,'Sin aclaraciones y/o observaciones.','2025-07-02 12:22:05','2025-07-02 12:22:05',NULL,NULL),(310931,652082,1,NULL,2,2,'Auditoría Superior del Estado',NULL,NULL,NULL,'Coordinación de Desarrollo Institucional','Auxiliar Admon. \"A\"','2023-06-30','2025-01-07','[\"3\"]',37,'Gabriel Aguiar','2025-07-02 12:24:00','2025-07-02 12:24:00',NULL,NULL),(310932,652082,1,NULL,2,1,'Secretaría de Salud',6,NULL,'ITS040421HY','DIPRIS','Administrativo','2021-11-01','2021-04-01','[\"3\"]',37,'Gabriel Aguiar','2025-07-02 12:31:20','2025-07-02 12:31:20',NULL,NULL),(310933,652082,2,NULL,NULL,NULL,'DENSO MÉXICO',5,NULL,'DME 960701JX','Producción','Supervisor de Producción','2017-06-05','2021-12-09','[]',37,'Gabriel Aguiar','2025-07-02 12:33:40','2025-07-02 12:33:40',NULL,NULL),(310934,652084,1,NULL,2,2,'H. CONGRESO DEL ESTADO',NULL,NULL,NULL,'CÁMARA DE DIPUTADOS','AUXILIAR ADMINISTRATIVO','2000-09-01','2013-03-13','[\"13\"]',37,'SIN OBSERVACIONES','2025-07-02 12:43:01','2025-07-02 12:43:01',NULL,'ADMINISTRATIVAS'),(310935,652084,1,NULL,2,1,'TRIBUNAL DE JUSTICIA ADMINISTRATIVA PARA EL ESTADO DE CHIAPAS',NULL,NULL,NULL,'SALA','AUXILIAR ADMINISTRATIVO','2019-01-01','2019-12-10','[\"13\"]',37,'SIN OBSERVACIONES','2025-07-02 12:45:25','2025-07-02 12:45:25',NULL,'ADMINISTRATIVAS'),(310936,652084,1,NULL,2,3,'TRIBUNAL ADMINISTRATIVO DEL PODER JUDICIAL DEL ESTADO DE CHIAPAS',NULL,NULL,NULL,'SALA PONENCIA C','OFICINISTA','2020-01-01','2025-03-14','[\"13\"]',37,'SIN OBSERVACIONES','2025-07-02 12:47:11','2025-07-02 12:47:11',NULL,'AUXULIAR DE SECRETARIO DE ESTUDIO Y CUENTA'),(310937,652083,1,NULL,2,4,'Secretaría de educación',NULL,NULL,NULL,'Dirección','Docente','2020-07-01','2021-07-01','[\"3\"]',37,'sin observaciones','2025-07-02 13:10:59','2025-07-02 13:10:59',NULL,NULL),(310938,652086,1,NULL,2,1,'Tribunal Administrativo del Poder Judicial del Estado de Chiapas, hoy Tribunal de Justicia Administrativa del Estado de Chiapas',NULL,NULL,NULL,'Juzgado de Jurisdicción Administrativa','Auxiliar Administrativo \"B\"','2023-02-16','2025-07-02','[\"12\"]',37,'Sin observaciones','2025-07-02 13:25:42','2025-07-02 13:25:42',NULL,NULL),(310939,652087,1,NULL,2,4,'tribunal electoral del estado de chiapas',NULL,NULL,NULL,'secretaría general','analista b','2021-05-03','2024-12-13','[\"13\"]',37,'ninguna observacion','2025-07-02 13:37:54','2025-07-02 13:37:54',NULL,'ninguna'),(310940,652085,1,NULL,2,4,'Tribunal de Justicia Administrativa del Estado de Chiapas',NULL,NULL,NULL,'Secretaría General de Acuerdos y del Pleno','oficinista','2018-03-05','2025-03-15','[\"13\"]',37,NULL,'2025-07-02 14:29:25','2025-07-02 14:29:25',NULL,'elaboracion de acuerdos, integracion de los siguientes expedientes: cuadernillo de amparo, Cuadernillo de Recurso de revision, asimismo de apelacion y recurso de responsabilidad administrativa entre otros; elaboración de cómputos, oficios');

/*Table structure for table `sec_01_06` */

DROP TABLE IF EXISTS `sec_01_06`;

CREATE TABLE `sec_01_06` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `id_relacion_declarante` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_nacionalidad` int DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `dependiente_economico` bit(1) DEFAULT b'0',
  `habita_con_declarante` bit(1) DEFAULT b'0',
  `id_pais_residencia` int DEFAULT NULL,
  `id_domicilio` int NOT NULL,
  `tiene_actividad_laboral` bit(1) DEFAULT b'0',
  `id_ambito` int DEFAULT NULL,
  `id_nivel_gobierno` int DEFAULT NULL,
  `id_poder_ente` int DEFAULT NULL,
  `nombre_ente` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `area_adscripcion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `funciones_principales` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `cargo_puesto` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salario_mensual` double DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `rfc_empresa` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_sector_industria` int DEFAULT NULL,
  `otro_sector` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `es_proveedor_contratista` bit(1) DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `otras_funciones` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_relacion_familiar` (`id_relacion_declarante`) USING BTREE,
  KEY `id_domicilio` (`id_domicilio`) USING BTREE,
  KEY `id_sector_industria` (`id_nivel_gobierno`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22542 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_06` */

insert  into `sec_01_06`(`id`,`id_declaracion`,`id_relacion_declarante`,`nombre`,`apellido1`,`apellido2`,`id_nacionalidad`,`curp`,`rfc`,`fecha_nacimiento`,`dependiente_economico`,`habita_con_declarante`,`id_pais_residencia`,`id_domicilio`,`tiene_actividad_laboral`,`id_ambito`,`id_nivel_gobierno`,`id_poder_ente`,`nombre_ente`,`area_adscripcion`,`funciones_principales`,`cargo_puesto`,`salario_mensual`,`fecha_ingreso`,`rfc_empresa`,`id_sector_industria`,`otro_sector`,`es_proveedor_contratista`,`observaciones`,`created_at`,`updated_at`,`deleted_at`,`otras_funciones`) values (22537,652078,1,'EMILIA','PEREZ','DIAZ',37,'VANF961224HCSLNR02','VANF961224J74','1995-09-11','','\0',37,397094,'',2,NULL,NULL,'PROMOTORA COMERCIAL TORRES BATIZ','ÁREA TÉCNICA',NULL,'OPERADOR DE EQUIPOS MULTIFUNCIONALES',10000,'2025-07-02','AAAAAAAAAAAAA',1,NULL,'','PRUEBA PARA MONEDA PAREJA','2025-07-02 11:21:32','2025-07-02 11:21:32',NULL,NULL),(22538,652081,1,'OSVALDO','SANCHEZ','DIAZ',37,'SADO950925RT655555','SADO950925RT6','1995-09-25','\0','',37,397095,'',2,NULL,NULL,'NOTARIA NO. 20','AREA JURIDICA',NULL,'ABOGADO',25000,'2023-07-15','NOLM960818GT6',12,NULL,'\0','Sin aclaraciones y/o observaciones.','2025-07-02 12:26:26','2025-07-02 12:26:26',NULL,NULL),(22539,652083,1,'Marco Antonio','Medina','Marroquín',37,'MEMM870216HCSDRR00','MEMM870216J88','1987-02-16','\0','',37,397100,'',3,NULL,NULL,'Contratista','Dirección',NULL,'Construcción',16000,'2011-04-16',NULL,NULL,NULL,'\0','sin observaciones','2025-07-02 13:38:06','2025-07-02 14:42:05',NULL,NULL),(22540,652087,1,'avril','ramirez','esparza',37,'raea910610mdfmsv08','mtg850101qx1','2025-07-02','\0','\0',37,397103,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0','ninguna observacion','2025-07-02 13:47:29','2025-07-02 13:47:29',NULL,NULL),(22541,652085,1,'Dolores','Juarez','Cipriano',37,'JUCD800204MCSRPL03','JUCD800204','2025-02-04','\0','\0',37,397106,'',1,2,1,'SECRETARÍA DE FINANZAS','DEPARTAMENTO DE PROYECTOS INSTITUCIONALES','[\"13\"]','JEFE DE DEPARTAMENTO',29000,'2025-07-01',NULL,NULL,NULL,'\0',NULL,'2025-07-02 14:40:41','2025-07-02 14:54:22',NULL,'FUNCIONES ADMINISTRATIVAS');

/*Table structure for table `sec_01_07` */

DROP TABLE IF EXISTS `sec_01_07`;

CREATE TABLE `sec_01_07` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apellido2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `rfc` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_relacion_familiar` int NOT NULL,
  `otro_relacion` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_nacionalidad` int NOT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `habita_con_declarante` bit(1) DEFAULT b'0',
  `id_pais_residencia` int DEFAULT NULL,
  `id_domicilio` int NOT NULL,
  `tiene_actividad_laboral` bit(1) DEFAULT b'0',
  `id_ambito` int DEFAULT NULL,
  `id_nivel_gobierno` int DEFAULT NULL,
  `id_poder_ente` int DEFAULT NULL,
  `nombre_ente` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `area_adscripcion` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `funciones_principales` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `cargo_puesto` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `salario_mensual` double DEFAULT NULL,
  `fecha_ingreso` date DEFAULT NULL,
  `rfc_empresa` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_sector_industria` int DEFAULT NULL,
  `otro_sector` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `es_proveedor_contratista` bit(1) DEFAULT b'0',
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=56263 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_07` */

insert  into `sec_01_07`(`id`,`id_declaracion`,`nombre`,`apellido1`,`apellido2`,`fecha_nacimiento`,`rfc`,`id_relacion_familiar`,`otro_relacion`,`id_nacionalidad`,`curp`,`habita_con_declarante`,`id_pais_residencia`,`id_domicilio`,`tiene_actividad_laboral`,`id_ambito`,`id_nivel_gobierno`,`id_poder_ente`,`nombre_ente`,`area_adscripcion`,`funciones_principales`,`cargo_puesto`,`salario_mensual`,`fecha_ingreso`,`rfc_empresa`,`id_sector_industria`,`otro_sector`,`es_proveedor_contratista`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (56253,652079,'Evelyn','Rivera','Sánchez','2021-08-13',NULL,9,NULL,37,'CARE210813MCSNVVA7','\0',37,397092,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0','Es menor de edad aún no cuenta con RFC','2025-07-01 15:39:29','2025-07-01 15:39:29',NULL),(56254,652081,'ROHEE','SANCHEZ','GOMEZ','2021-10-26','SAGR211026000',9,NULL,37,'SAGR21102600000000','',37,397096,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0','Sin aclaraciones y/o observaciones.','2025-07-02 12:32:36','2025-07-02 12:32:36',NULL),(56255,652083,'Israel','Medina','Domínguez','2018-04-25','s/n',9,NULL,37,'MEDI180425HCSDMSA7','',37,397097,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0','sin observaciones','2025-07-02 13:16:59','2025-07-02 13:16:59',NULL),(56256,652083,'Gretel','Medina','Domínguez','2023-02-03','s/n',9,NULL,37,'MEDG230203MCSDMRA1','',37,397098,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0','sin observaciones','2025-07-02 13:19:26','2025-07-02 13:19:26',NULL),(56257,652078,'JOSE FERNANDO','VALDES','NANDUCA','1979-06-30','VANF961224J74',9,NULL,132,NULL,'',37,397099,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,'2025-07-02 13:30:03','2025-07-02 13:30:03',NULL),(56258,652078,'JOSE FERNANDO','VALDES','NANDUCA','1979-06-30','VANF961224J74',9,NULL,37,'VAHM770929HCSLRR08','',37,397101,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,'2025-07-02 13:38:15','2025-07-02 13:38:15',NULL),(56259,652084,'GRETTA','TORRES','CHAVARRÍA','2001-06-08',NULL,9,NULL,37,'TOCG010608MCSRHRA6','',37,397102,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,'2025-07-02 13:44:53','2025-07-02 13:44:53',NULL),(56260,652084,'ERICK DE JESÚS','CHAVARRÍA','CRUZ','2007-04-24',NULL,9,NULL,37,'CACE070424HCSHRRA6','',37,397104,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0','SIN OBSERVACIONES','2025-07-02 13:48:26','2025-07-02 13:48:26',NULL),(56261,652085,'José Manuel','López','Juarez','2025-07-18','LOJM181018',9,NULL,37,'LOJM181018HCSPRNA6','\0',37,397107,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,'2025-07-02 14:45:16','2025-07-02 14:45:16',NULL),(56262,652085,'Maricarmen','López','Juarez','2021-12-11','LOJM211211',9,NULL,37,'LOJM211211MCSPRPA9','\0',37,397108,'\0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'\0',NULL,'2025-07-02 14:49:47','2025-07-02 14:49:47',NULL);

/*Table structure for table `sec_01_08` */

DROP TABLE IF EXISTS `sec_01_08`;

CREATE TABLE `sec_01_08` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `I_remuneracion` double DEFAULT NULL,
  `II_otros_ingresos` double DEFAULT NULL,
  `II_1_actividad_industrial` double DEFAULT NULL,
  `razon_social` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tipo_negocio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `II_2_actividad_financiera` double DEFAULT NULL,
  `id_tipo_instrumento_ganancia` int DEFAULT NULL,
  `otro_instrumento_ganancia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `II_3_servicios_profesionales` double DEFAULT NULL,
  `servicio_prestado` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `II_4_enajenacion_bienes` double DEFAULT NULL,
  `id_bien` int DEFAULT NULL,
  `II_5_otros_ingresos` double DEFAULT NULL,
  `id_tipo_ingreso` int DEFAULT NULL,
  `otro_tipo_ingreso` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `A_ingresos` double DEFAULT NULL,
  `B_ingresos` double DEFAULT NULL,
  `C_total_ingresos` double DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=608640 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_08` */

insert  into `sec_01_08`(`id`,`id_declaracion`,`I_remuneracion`,`II_otros_ingresos`,`II_1_actividad_industrial`,`razon_social`,`tipo_negocio`,`II_2_actividad_financiera`,`id_tipo_instrumento_ganancia`,`otro_instrumento_ganancia`,`II_3_servicios_profesionales`,`servicio_prestado`,`II_4_enajenacion_bienes`,`id_bien`,`II_5_otros_ingresos`,`id_tipo_ingreso`,`otro_tipo_ingreso`,`A_ingresos`,`B_ingresos`,`C_total_ingresos`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (608632,652079,7821,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7821,NULL,7821,NULL,'2025-07-02 09:17:30','2025-07-02 09:17:30',NULL),(608633,652081,555000,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,555000,650000,1205000,'Sin aclaraciones y/o observaciones.','2025-07-02 12:33:36','2025-07-02 12:33:36',NULL),(608634,652080,222000,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,222000,NULL,222000,'se precisa que fue el ingreso del 2024','2025-07-02 12:37:30','2025-07-02 12:37:30',NULL),(608635,652082,156243,0,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,156243,0,156243,'Gabriel Aguiar','2025-07-02 12:44:11','2025-07-02 12:44:11',NULL),(608636,652084,7800,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,7800,NULL,7800,'NO PERMITE ESCRIBIR EN EL APARTADO II OTROS INGRESOS','2025-07-02 13:18:15','2025-07-02 13:18:15',NULL),(608637,652086,14200,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14200,NULL,14200,'Sin observaciones','2025-07-02 13:31:03','2025-07-02 13:31:03',NULL),(608638,652087,14000,0,0,NULL,NULL,0,NULL,NULL,0,NULL,NULL,NULL,0,NULL,NULL,14000,0,14000,'ninguna observacion','2025-07-02 13:51:59','2025-07-02 13:51:59',NULL),(608639,652083,14286,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,14286,16000,30286,'sin observaciones','2025-07-02 14:32:54','2025-07-02 14:32:54',NULL);

/*Table structure for table `sec_01_09` */

DROP TABLE IF EXISTS `sec_01_09`;

CREATE TABLE `sec_01_09` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `se_desempeno` bit(1) DEFAULT b'0',
  `fecha_inicio` date DEFAULT NULL,
  `fecha_conclusion` date DEFAULT NULL,
  `I_remuneracion_neta` double DEFAULT NULL,
  `II_otros_ingresos` double DEFAULT NULL,
  `II_1_actividad_industrial` double DEFAULT NULL,
  `razon_social` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tipo_negocio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `II_2_actividad_financiera` double DEFAULT NULL,
  `id_tipo_instrumento_ganancia` int DEFAULT NULL,
  `otro_instrumento_ganancia` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `II_3_servicios_profesionales` double DEFAULT NULL,
  `servicio_prestado` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `II_4_enajenacion_bienes` double DEFAULT NULL,
  `id_bien` int DEFAULT NULL,
  `II_5_otros_ingresos` double DEFAULT NULL,
  `id_tipo_ingreso` int DEFAULT NULL,
  `otro_tipo_ingreso` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `A_ingresos` double DEFAULT NULL,
  `B_ingresos` double DEFAULT NULL,
  `C_total_ingresos` double DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=147124 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_09` */

insert  into `sec_01_09`(`id`,`id_declaracion`,`se_desempeno`,`fecha_inicio`,`fecha_conclusion`,`I_remuneracion_neta`,`II_otros_ingresos`,`II_1_actividad_industrial`,`razon_social`,`tipo_negocio`,`II_2_actividad_financiera`,`id_tipo_instrumento_ganancia`,`otro_instrumento_ganancia`,`II_3_servicios_profesionales`,`servicio_prestado`,`II_4_enajenacion_bienes`,`id_bien`,`II_5_otros_ingresos`,`id_tipo_ingreso`,`otro_tipo_ingreso`,`A_ingresos`,`B_ingresos`,`C_total_ingresos`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (147116,652079,'\0','2020-01-01','2025-03-14',235303,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,235303,NULL,235303,NULL,'2025-07-02 09:31:55','2025-07-02 09:31:55',NULL),(147117,652080,'\0','2020-10-16','2025-03-14',222000,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,222000,NULL,222000,'se precisa que fueron los ingresos del año 2024','2025-07-02 12:47:48','2025-07-02 12:47:48',NULL),(147118,652082,'\0','2023-06-30','2025-01-07',5300,0,0,NULL,NULL,0,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,5300,0,5300,'Gabriel Aguiar','2025-07-02 12:54:13','2025-07-02 12:54:13',NULL),(147119,652081,'\0','2024-01-01','2024-12-31',420000,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,420000,NULL,420000,'Sin aclaraciones y/o observaciones.','2025-07-02 13:07:34','2025-07-02 13:07:34',NULL),(147120,652084,'\0','2020-01-01','2025-03-14',235303,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,235303,NULL,235303,'SIN OBSERVACIONES','2025-07-02 13:21:52','2025-07-02 13:21:52',NULL),(147121,652086,'\0','2023-02-16','2025-03-14',144000,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,144000,NULL,144000,'Sin observaciones','2025-07-02 13:33:04','2025-07-02 13:33:04',NULL),(147122,652087,'\0','0000-00-00','2025-07-02',15000,0,0,NULL,NULL,0,NULL,NULL,0,NULL,0,NULL,0,NULL,NULL,15000,0,15000,'ninguna observacion','2025-07-02 13:56:57','2025-07-02 13:56:57',NULL),(147123,652083,'',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2025-07-02 14:23:06','2025-07-02 14:23:06',NULL);

/*Table structure for table `sec_01_10` */

DROP TABLE IF EXISTS `sec_01_10`;

CREATE TABLE `sec_01_10` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `id_tipo_inmueble` int NOT NULL,
  `otro_inmueble` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_titular` int NOT NULL,
  `porcentaje` int DEFAULT NULL,
  `superficie_terreno` double DEFAULT NULL,
  `superficie_construccion` double DEFAULT NULL,
  `id_relacion_familiar` int NOT NULL,
  `otro_relacion` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre_terceros` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_tercero` int DEFAULT NULL,
  `rfc_tercero` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_transmisor` int DEFAULT NULL,
  `id_forma_adquisicion` int NOT NULL,
  `id_forma_pago` int NOT NULL,
  `razon_social` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `valor_adquisicion` double DEFAULT NULL,
  `id_tipo_moneda` int NOT NULL,
  `fecha_adquisicion` date DEFAULT NULL,
  `registro_publico` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_adquisicion_conforme` int NOT NULL,
  `id_domicilio` int NOT NULL,
  `id_motivo_baja` int DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `otro_baja` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_tipo_persona_tercero` (`id_tipo_persona_tercero`) USING BTREE,
  KEY `id_tipo_persona_transmisor` (`id_tipo_persona_transmisor`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33482 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_10` */

insert  into `sec_01_10`(`id`,`id_declaracion`,`id_tipo_inmueble`,`otro_inmueble`,`id_titular`,`porcentaje`,`superficie_terreno`,`superficie_construccion`,`id_relacion_familiar`,`otro_relacion`,`nombre_terceros`,`id_tipo_persona_tercero`,`rfc_tercero`,`id_tipo_persona_transmisor`,`id_forma_adquisicion`,`id_forma_pago`,`razon_social`,`rfc`,`valor_adquisicion`,`id_tipo_moneda`,`fecha_adquisicion`,`registro_publico`,`id_adquisicion_conforme`,`id_domicilio`,`id_motivo_baja`,`observaciones`,`otro_baja`,`created_at`,`updated_at`,`deleted_at`) values (33480,652079,1,NULL,1,125000,1949,128,26,NULL,NULL,3,NULL,2,1,1,'trasgo arquitectura y construcciones sociedad anónima de capital variable.','xxxxx',1850000,1,'2020-01-17','0146134021',3,397093,NULL,NULL,NULL,'2025-07-02 09:42:29','2025-07-02 09:42:29',NULL),(33481,652087,1,NULL,1,10000000,50,30,27,NULL,'no existe',3,'no existe',3,4,3,'ninguno','ninguno',0,1,'2025-07-02','dfewo o o',1,397105,4,'ninguna observacion','ninguno','2025-07-02 14:04:35','2025-07-02 14:04:35',NULL);

/*Table structure for table `sec_01_11` */

DROP TABLE IF EXISTS `sec_01_11`;

CREATE TABLE `sec_01_11` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `id_tipo_vehiculo` int NOT NULL,
  `otro_vehiculo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_titular` int NOT NULL,
  `nombre_vendedor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_relacion_familiar` int NOT NULL,
  `otro_relacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `marca` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modelo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `numero_serie` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `anio` int DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `nombre_terceros` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_tercero` int DEFAULT NULL,
  `rfc_tercero` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_transmisor` int DEFAULT NULL,
  `id_forma_adquisicion` int NOT NULL,
  `id_forma_pago` int NOT NULL,
  `valor_adquisicion` double DEFAULT NULL,
  `id_tipo_moneda` int NOT NULL,
  `fecha_adquisicion` date DEFAULT NULL,
  `id_motivo_baja` int DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_tipo_persona_tercero` (`id_tipo_persona_tercero`) USING BTREE,
  KEY `id_tipo_persona_transmisor` (`id_tipo_persona_transmisor`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=31273 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_11` */

insert  into `sec_01_11`(`id`,`id_declaracion`,`id_tipo_vehiculo`,`otro_vehiculo`,`id_titular`,`nombre_vendedor`,`rfc`,`id_relacion_familiar`,`otro_relacion`,`marca`,`modelo`,`numero_serie`,`anio`,`id_pais`,`id_estado`,`nombre_terceros`,`id_tipo_persona_tercero`,`rfc_tercero`,`id_tipo_persona_transmisor`,`id_forma_adquisicion`,`id_forma_pago`,`valor_adquisicion`,`id_tipo_moneda`,`fecha_adquisicion`,`id_motivo_baja`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (31267,652079,1,NULL,1,'gps motors sociedad anónima de capital variable','gmo031107s15',26,NULL,'mitsubishi','asx','ee012728',2014,37,30,NULL,3,NULL,2,1,2,319900,1,'2014-04-22',NULL,NULL,'2025-07-02 09:46:41','2025-07-02 09:46:41',NULL),(31268,652082,1,NULL,1,'NO TENGO DATOS','NO TENGO DATOS',13,NULL,'Ford','Mustang','1FAFP42X31F258153',2001,37,30,NULL,3,NULL,3,2,2,220000,1,'2024-09-18',1,'Gabriel Aguiar','2025-07-02 13:03:59','2025-07-02 13:03:59',NULL),(31269,652081,1,NULL,1,'GABRIEL MORENO ALBORES','ALMG000000',26,NULL,'CHEVROLET','ATOS','SFRSFDFDSS',2005,37,30,'--',3,'---',1,1,2,60000,1,'2022-02-17',NULL,'Sin aclaraciones y/o observaciones.','2025-07-02 13:22:10','2025-07-02 13:22:10',NULL),(31270,652087,1,NULL,1,'ninguno','ninguno',27,'ninguna','jetta','2024','dejaudnysy',2024,37,30,'no existe',3,'no existe',3,4,3,0,1,'2025-07-02',4,NULL,'2025-07-02 14:07:32','2025-07-02 14:07:32',NULL),(31271,652083,1,NULL,1,'TOYOTA MOTOR SALES DE MÉXICO, S. DE R.L. DE C.V.','TMS010508RX0',26,NULL,'Toyota','Avanza 4 puertas','MHKMF5CF8LK014739',2020,37,30,'sin observaciones',3,'sin observacion',2,1,1,300000,1,'2021-07-15',NULL,'sin observaciones','2025-07-02 14:12:15','2025-07-02 14:18:36','2025-07-02 14:18:36'),(31272,652083,1,NULL,1,'TOYOTA','TMS010508RX0',26,NULL,'TOYOTA','AVANZA 4 PUERTAS','MHKMF5CF8LK014739',2020,37,30,'s/n',3,'s/n',2,1,1,300000,1,'2021-09-15',4,'No le he dado de baja al vehículo pero el campo no me deja guardar','2025-07-02 14:17:39','2025-07-02 14:17:39',NULL);

/*Table structure for table `sec_01_12` */

DROP TABLE IF EXISTS `sec_01_12`;

CREATE TABLE `sec_01_12` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `id_titular` int NOT NULL,
  `id_tipo_mueble` int NOT NULL,
  `otro_tipo_mueble` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_relacion_familiar` int NOT NULL,
  `otro_relacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre_terceros` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_tercero` int DEFAULT NULL,
  `rfc_tercero` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_transmisor` int DEFAULT NULL,
  `nombre_vendedor` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_forma_adquisicion` int NOT NULL,
  `id_forma_pago` int NOT NULL,
  `valor_adquisicion` double DEFAULT NULL,
  `id_tipo_moneda` int NOT NULL,
  `fecha_adquisicion` date DEFAULT NULL,
  `id_motivo_baja` int DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_tipo_persona_tercero` (`id_tipo_persona_tercero`) USING BTREE,
  KEY `id_tipo_persona_transmisor` (`id_tipo_persona_transmisor`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17413 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_12` */

insert  into `sec_01_12`(`id`,`id_declaracion`,`id_titular`,`id_tipo_mueble`,`otro_tipo_mueble`,`id_relacion_familiar`,`otro_relacion`,`nombre_terceros`,`id_tipo_persona_tercero`,`rfc_tercero`,`id_tipo_persona_transmisor`,`nombre_vendedor`,`rfc`,`descripcion`,`id_forma_adquisicion`,`id_forma_pago`,`valor_adquisicion`,`id_tipo_moneda`,`fecha_adquisicion`,`id_motivo_baja`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (17412,652087,1,1,NULL,1,NULL,'no existe',3,'no existe',3,'ninguna','ninguno','noexiste',2,3,0,1,'2025-07-02',4,'ninguna observacion','2025-07-02 14:10:58','2025-07-02 14:10:58',NULL);

/*Table structure for table `sec_01_13` */

DROP TABLE IF EXISTS `sec_01_13`;

CREATE TABLE `sec_01_13` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `id_tipo_inversion` int DEFAULT NULL,
  `id_sub_tipo_inversion` int NOT NULL,
  `id_titular` int DEFAULT NULL,
  `nombre_terceros` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_tercero` int DEFAULT NULL,
  `rfc_tercero` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_bancaria` int DEFAULT NULL,
  `id_fondo_inversion` int DEFAULT NULL,
  `id_organizacion_privada` int DEFAULT NULL,
  `id_moneda_metal` int DEFAULT NULL,
  `id_seguro` int DEFAULT NULL,
  `id_valor_bursatil` int DEFAULT NULL,
  `id_afore` int DEFAULT NULL,
  `numero_cuenta` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `institucion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `saldo_a_fecha` double DEFAULT NULL,
  `id_tipo_moneda` int DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_tipo_persona_tercero` (`id_tipo_persona_tercero`) USING BTREE,
  KEY `id_sub_tipo_inversion` (`id_sub_tipo_inversion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40256 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_13` */

insert  into `sec_01_13`(`id`,`id_declaracion`,`id_tipo_inversion`,`id_sub_tipo_inversion`,`id_titular`,`nombre_terceros`,`id_tipo_persona_tercero`,`rfc_tercero`,`id_bancaria`,`id_fondo_inversion`,`id_organizacion_privada`,`id_moneda_metal`,`id_seguro`,`id_valor_bursatil`,`id_afore`,`numero_cuenta`,`id_pais`,`institucion`,`rfc`,`saldo_a_fecha`,`id_tipo_moneda`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (40254,652078,1,2,8,'asdasd',1,'aaaaaaaaaaaaa',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'aaa',167,'adsfgadfnatefaezbfwf','aaaaaaaaaaaaaa',100000,6,'aaaaaaaaaaaaaaa','2025-07-02 15:02:25','2025-07-02 15:02:25',NULL),(40255,652079,1,2,1,NULL,3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'6557753139',37,'hsbc México Sociedad Anónima','HMI950125KG8',48398,1,'ES UNA CUENTA DE AHORRO FLEXIBLE','2025-07-02 15:24:32','2025-07-02 15:24:32',NULL);

/*Table structure for table `sec_01_14` */

DROP TABLE IF EXISTS `sec_01_14`;

CREATE TABLE `sec_01_14` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `id_titular` int NOT NULL,
  `id_tipo_adeudo` int NOT NULL,
  `otro_tipo_adeudo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `numero_cuenta` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_adquisicion` date DEFAULT NULL,
  `monto_original` double DEFAULT NULL,
  `id_tipo_moneda` int NOT NULL,
  `saldo_insoluto` double DEFAULT NULL,
  `nombre_terceros` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_tercero` int DEFAULT NULL,
  `rfc_tercero` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_otorgante` int DEFAULT NULL,
  `id_pais` int NOT NULL,
  `institucion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_tipo_persona_tercero` (`id_tipo_persona_tercero`) USING BTREE,
  KEY `id_tipo_persona_otorgante` (`id_tipo_persona_otorgante`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37204 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_14` */

insert  into `sec_01_14`(`id`,`id_declaracion`,`id_titular`,`id_tipo_adeudo`,`otro_tipo_adeudo`,`numero_cuenta`,`fecha_adquisicion`,`monto_original`,`id_tipo_moneda`,`saldo_insoluto`,`nombre_terceros`,`id_tipo_persona_tercero`,`rfc_tercero`,`id_tipo_persona_otorgante`,`id_pais`,`institucion`,`rfc`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (37201,652079,1,1,NULL,'01700561430110100','2020-01-01',1850000,1,1000000,NULL,3,NULL,2,37,'citibanamex','bnm840515Vb1',NULL,'2025-07-02 10:56:43','2025-07-02 10:56:43',NULL),(37202,652082,13,3,NULL,'125320022','2025-02-01',20000,3,20000,NULL,3,NULL,2,37,'CREDÍ MAX','12579622','Gabriel Aguiar','2025-07-02 13:12:44','2025-07-02 13:12:44',NULL),(37203,652081,1,6,NULL,'558455555','2024-03-31',20000,1,7500,NULL,3,NULL,2,37,'SANTANDER SA DE CV','SAJDHSJS4444','Sin aclaraciones y/o observaciones.','2025-07-02 13:31:59','2025-07-02 13:31:59',NULL);

/*Table structure for table `sec_01_15` */

DROP TABLE IF EXISTS `sec_01_15`;

CREATE TABLE `sec_01_15` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `id_tipo_bien` int NOT NULL,
  `id_tipo_inmueble` int DEFAULT NULL,
  `otro_tipo_inmueble` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_domicilio_inmueble` int DEFAULT NULL,
  `id_tipo_vehiculo` int DEFAULT NULL,
  `otro_tipo_vehiculo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `marca` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `modelo` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `anio` int DEFAULT NULL,
  `numero_serie` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `nombre_dueno` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_titular` int DEFAULT NULL,
  `rfc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_relacion_familiar` int DEFAULT NULL,
  `otro_relacion` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1174 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_01_15` */

insert  into `sec_01_15`(`id`,`id_declaracion`,`id_tipo_bien`,`id_tipo_inmueble`,`otro_tipo_inmueble`,`id_domicilio_inmueble`,`id_tipo_vehiculo`,`otro_tipo_vehiculo`,`marca`,`modelo`,`anio`,`numero_serie`,`id_pais`,`id_estado`,`nombre_dueno`,`id_tipo_persona_titular`,`rfc`,`id_relacion_familiar`,`otro_relacion`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (1173,652082,3,NULL,NULL,NULL,1,NULL,'FORD','MUSTANG',2001,'1FAFP42X31F258153',37,NULL,'Gabriel Aguiar Cruz',3,'AUCG920315',27,'Propio','Gabriel Aguiar','2025-07-02 13:35:09','2025-07-02 13:35:09',NULL);

/*Table structure for table `sec_02_01` */

DROP TABLE IF EXISTS `sec_02_01`;

CREATE TABLE `sec_02_01` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_personal` int NOT NULL,
  `id_titular_interes` int NOT NULL,
  `nombre_empresa` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `porcentaje` int DEFAULT NULL,
  `id_tipo_participacion` int NOT NULL,
  `otro_participacion` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `recibe_remuneracion` bit(1) DEFAULT b'0',
  `monto_mensual_neto` double DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `id_sector_industria` int DEFAULT NULL,
  `otro_sector_industria` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_personal` (`id_personal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1323 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_01` */

insert  into `sec_02_01`(`id`,`id_declaracion`,`id_personal`,`id_titular_interes`,`nombre_empresa`,`rfc`,`porcentaje`,`id_tipo_participacion`,`otro_participacion`,`recibe_remuneracion`,`monto_mensual_neto`,`id_pais`,`id_estado`,`id_sector_industria`,`otro_sector_industria`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (1321,652081,30,5,'LA CHIAPANEQUITA SA DE CV','GOLN960719QJ9',50,5,NULL,'',15000,37,30,6,NULL,'Sin aclaraciones y/o observaciones.','2025-07-02 14:02:04','2025-07-02 14:02:04',NULL),(1322,652087,78,5,'majo ac','CAMJ900808',10000000,1,NULL,'',1002500,37,30,7,NULL,'ninguna observacion','2025-07-02 14:20:51','2025-07-02 14:20:51',NULL);

/*Table structure for table `sec_02_01_dec` */

DROP TABLE IF EXISTS `sec_02_01_dec`;

CREATE TABLE `sec_02_01_dec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_sec_02_01` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_sec_02_01` (`id_sec_02_01`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_01_dec` */

/*Table structure for table `sec_02_02` */

DROP TABLE IF EXISTS `sec_02_02`;

CREATE TABLE `sec_02_02` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_personal` int NOT NULL,
  `id_titular_interes` int NOT NULL,
  `id_tipo_institucion` int NOT NULL,
  `otro_institucion` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre_institucion` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `puesto_rol` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `recibe_remuneracion` bit(1) DEFAULT b'0',
  `monto_mensual_neto` double DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_personal` (`id_personal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=529 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_02` */

insert  into `sec_02_02`(`id`,`id_declaracion`,`id_personal`,`id_titular_interes`,`id_tipo_institucion`,`otro_institucion`,`nombre_institucion`,`rfc`,`puesto_rol`,`fecha_inicio`,`recibe_remuneracion`,`monto_mensual_neto`,`id_pais`,`id_estado`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (528,652087,78,5,5,NULL,'majo a c','CAMJ900808','representante','2025-06-30','',1151851502,37,30,'ninguna observacion','2025-07-02 14:22:40','2025-07-02 14:22:40',NULL);

/*Table structure for table `sec_02_02_dec` */

DROP TABLE IF EXISTS `sec_02_02_dec`;

CREATE TABLE `sec_02_02_dec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_sec_02_02` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_sec_02_02` (`id_sec_02_02`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_02_dec` */

/*Table structure for table `sec_02_03` */

DROP TABLE IF EXISTS `sec_02_03`;

CREATE TABLE `sec_02_03` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_personal` int NOT NULL,
  `id_relacion_familiar` int NOT NULL,
  `otro_relacion` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre_programa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre_institucion` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_nivel_gobierno` int NOT NULL,
  `id_tipo_apoyo` int NOT NULL,
  `otro_apoyo` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_forma_apoyo` int NOT NULL,
  `monto_apoyo` double DEFAULT NULL,
  `descripcion_apoyo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_personal` (`id_personal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=841 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_03` */

insert  into `sec_02_03`(`id`,`id_declaracion`,`id_personal`,`id_relacion_familiar`,`otro_relacion`,`nombre_programa`,`nombre_institucion`,`id_nivel_gobierno`,`id_tipo_apoyo`,`otro_apoyo`,`id_forma_apoyo`,`monto_apoyo`,`descripcion_apoyo`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (840,652087,78,28,NULL,'apoyo mujeres','gobierno',2,1,NULL,14,1500,'1500','ninguna observacion','2025-07-02 14:24:58','2025-07-02 14:24:58',NULL);

/*Table structure for table `sec_02_03_dec` */

DROP TABLE IF EXISTS `sec_02_03_dec`;

CREATE TABLE `sec_02_03_dec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_sec_02_03` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_sec_02_03` (`id_sec_02_03`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_03_dec` */

/*Table structure for table `sec_02_04` */

DROP TABLE IF EXISTS `sec_02_04`;

CREATE TABLE `sec_02_04` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_personal` int NOT NULL,
  `id_titular_interes` int NOT NULL,
  `fecha_representacion` date DEFAULT NULL,
  `id_tipo_representacion` int NOT NULL,
  `nombre_razon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_persona_representante` int DEFAULT NULL,
  `recibe_remuneracion` bit(1) NOT NULL DEFAULT b'0',
  `monto_mensual` double NOT NULL,
  `id_pais` int NOT NULL,
  `id_estado` int NOT NULL,
  `id_sector_industria` int NOT NULL,
  `otro_sector_industria` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_personal` (`id_personal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_04` */

insert  into `sec_02_04`(`id`,`id_declaracion`,`id_personal`,`id_titular_interes`,`fecha_representacion`,`id_tipo_representacion`,`nombre_razon`,`rfc`,`id_persona_representante`,`recibe_remuneracion`,`monto_mensual`,`id_pais`,`id_estado`,`id_sector_industria`,`otro_sector_industria`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (220,652087,78,5,'2025-06-30',14,'jpose antonio','CAMJ900808',2,'',15200,37,30,7,NULL,'ninguna observacion','2025-07-02 14:26:14','2025-07-02 14:26:14',NULL);

/*Table structure for table `sec_02_04_dec` */

DROP TABLE IF EXISTS `sec_02_04_dec`;

CREATE TABLE `sec_02_04_dec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_sec_02_04` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_sec_02_04` (`id_sec_02_04`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_04_dec` */

/*Table structure for table `sec_02_05` */

DROP TABLE IF EXISTS `sec_02_05`;

CREATE TABLE `sec_02_05` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_personal` int NOT NULL,
  `realiza_actividad` bit(1) NOT NULL DEFAULT b'0',
  `id_titular_interes` int NOT NULL,
  `nombre_empresa` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc_empresa` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre_cliente` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc_cliente` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_cliente` int DEFAULT NULL,
  `id_sector_industria` int NOT NULL,
  `otro_sector_industria` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `monto_mensual` double NOT NULL,
  `id_pais` int NOT NULL,
  `id_estado` int NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_personal` (`id_personal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_05` */

insert  into `sec_02_05`(`id`,`id_declaracion`,`id_personal`,`realiza_actividad`,`id_titular_interes`,`nombre_empresa`,`rfc_empresa`,`nombre_cliente`,`rfc_cliente`,`id_tipo_persona_cliente`,`id_sector_industria`,`otro_sector_industria`,`monto_mensual`,`id_pais`,`id_estado`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (274,652087,78,'\0',5,'empresa','ajhdyewmn4151','persona','sdd151',3,1,NULL,1500,37,30,'ninguna observacion','2025-07-02 14:27:49','2025-07-02 14:27:49',NULL);

/*Table structure for table `sec_02_05_dec` */

DROP TABLE IF EXISTS `sec_02_05_dec`;

CREATE TABLE `sec_02_05_dec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_sec_02_05` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_sec_02_05` (`id_sec_02_05`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_05_dec` */

/*Table structure for table `sec_02_06` */

DROP TABLE IF EXISTS `sec_02_06`;

CREATE TABLE `sec_02_06` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_personal` int NOT NULL,
  `id_tipo_beneficio` int NOT NULL,
  `otro_beneficio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_relacion_familiar` int NOT NULL,
  `otro_relacion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre_otorgante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_otorgante` int DEFAULT NULL,
  `rfc` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_forma_apoyo` int NOT NULL,
  `descripcion_beneficio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `monto_beneficio` double NOT NULL,
  `id_tipo_moneda` int NOT NULL,
  `id_sector_industria` int NOT NULL,
  `otro_sector_industria` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_personal` (`id_personal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=118 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_06` */

insert  into `sec_02_06`(`id`,`id_declaracion`,`id_personal`,`id_tipo_beneficio`,`otro_beneficio`,`id_relacion_familiar`,`otro_relacion`,`nombre_otorgante`,`id_tipo_persona_otorgante`,`rfc`,`id_forma_apoyo`,`descripcion_beneficio`,`monto_beneficio`,`id_tipo_moneda`,`id_sector_industria`,`otro_sector_industria`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (117,652087,78,2,NULL,28,NULL,'concurso',3,'mtg850101qx1',14,'dinero',8562030320,1,1,NULL,'ninguna observacion','2025-07-02 14:30:14','2025-07-02 14:30:14',NULL);

/*Table structure for table `sec_02_06_dec` */

DROP TABLE IF EXISTS `sec_02_06_dec`;

CREATE TABLE `sec_02_06_dec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_sec_02_06` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_sec_02_06` (`id_sec_02_06`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_06_dec` */

/*Table structure for table `sec_02_07` */

DROP TABLE IF EXISTS `sec_02_07`;

CREATE TABLE `sec_02_07` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_personal` int NOT NULL,
  `id_titular_interes` int NOT NULL,
  `id_tipo_fideicomiso` int NOT NULL,
  `id_tipo_participacion_fideicomiso` int NOT NULL,
  `rfc_fideicomiso` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre_fideicomitente` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_fideicomitente` int DEFAULT NULL,
  `rfc_fideicomitente` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre_fiduciario` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc_fiduciario` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre_fideicomisario` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_tipo_persona_fideicomisario` int DEFAULT NULL,
  `rfc_fideicomisario` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_sector_industria` int NOT NULL,
  `otro_sector_industria` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_pais` int NOT NULL,
  `observaciones` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_personal` (`id_personal`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_07` */

insert  into `sec_02_07`(`id`,`id_declaracion`,`id_personal`,`id_titular_interes`,`id_tipo_fideicomiso`,`id_tipo_participacion_fideicomiso`,`rfc_fideicomiso`,`nombre_fideicomitente`,`id_tipo_persona_fideicomitente`,`rfc_fideicomitente`,`nombre_fiduciario`,`rfc_fiduciario`,`nombre_fideicomisario`,`id_tipo_persona_fideicomisario`,`rfc_fideicomisario`,`id_sector_industria`,`otro_sector_industria`,`id_pais`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (23,652081,30,5,2,4,'JUA7268493','LA ESCUELA SA DE CV',1,'JUA7268492','COMITE SA DE CV','COM95086901','COMITE 2 SA DE CV',1,'COM95086900',1,NULL,37,'Sin aclaraciones y/o observaciones.','2025-07-02 14:08:32','2025-07-02 14:08:32',NULL),(24,652087,78,7,1,4,'25864645ed','maria jose',2,'56650.','jose','25625','maria',2,'85648561352',1,NULL,37,'ninguna','2025-07-02 14:32:36','2025-07-02 14:32:36',NULL);

/*Table structure for table `sec_02_07_dec` */

DROP TABLE IF EXISTS `sec_02_07_dec`;

CREATE TABLE `sec_02_07_dec` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int DEFAULT NULL,
  `id_sec_02_07` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_declaracion` (`id_declaracion`) USING BTREE,
  KEY `id_sec_02_07` (`id_sec_02_07`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_02_07_dec` */

/*Table structure for table `sec_03_01` */

DROP TABLE IF EXISTS `sec_03_01`;

CREATE TABLE `sec_03_01` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_declaracion` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `tipo_archivo` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `observaciones` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=113565 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `sec_03_01` */

insert  into `sec_03_01`(`id`,`id_declaracion`,`nombre`,`tipo_archivo`,`observaciones`,`created_at`,`updated_at`,`deleted_at`) values (113562,652079,NULL,NULL,'no me encuentro obligada a presentar la declaración','2025-07-02 11:00:11','2025-07-02 11:00:11',NULL),(113563,652081,'20250702__1751486970_BUZÓN TRIBUTARIO.pdf','pdf','Sin aclaraciones y/o observaciones.','2025-07-02 14:09:30','2025-07-02 14:09:49',NULL),(113564,652087,'20250702__1751488526_CURP_CAMJ900808MCSHRS03.pdf','pdf',NULL,'2025-07-02 14:35:26','2025-07-02 14:35:26',NULL);

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int unsigned DEFAULT NULL,
  `ip_address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `payload` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;

/*Data for the table `sessions` */

insert  into `sessions`(`id`,`user_id`,`ip_address`,`user_agent`,`payload`,`last_activity`) values ('CMO2soXZ63puy8sxxlcabBernVmIfuCjQ73EFAOk',10,'192.168.1.99','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo5OntzOjY6Il90b2tlbiI7czo0MDoiUWxqaTMxT3JuREVZdXRIU1hXUGU2SFJQejlpSTRYN1BvaXhrRVZGeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xOTIuMTY4LjEuMTIxL0RlY2xhcmFDaGlhcGFzL3B1YmxpY28vbWktZGVjbGFyYWNpb24vaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjEwO3M6NDoiY3VycCI7czoxODoiR09MTjk2MDcxOU1DU01QTjA3IjtzOjE0OiJpZF9kZWNsYXJhY2lvbiI7aTo2NTIwODE7czoxOToiaWRfZGVjbGFyYWNpb25fdGlwbyI7aToxO3M6MTY6ImlkX2NfZGVjbGFyYWNpb24iO2k6MTtzOjIwOiJnYmxfdGlwb19kZWNsYXJhY2lvbiI7czo2NDoiRGVjbGFyYWNpw7NuIFBhdHJpbW9uaWFsIGRlIDxzcGFuIGNsYXNzPSIiIHN0eWxlPSIiPiAyMDI1PC9zcGFuPiI7fQ==',1751487846),('8pAyySCzhTQgY1jyuwAYZ8hqA65oa7ywfVtj49mW',11,'192.168.1.98','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo5OntzOjY6Il90b2tlbiI7czo0MDoib1hDVjVFamZCMVFQeWloV1dCZWFwVm9BVlhlT3BJeVVUa2hvSndxMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NjM6Imh0dHA6Ly8xOTIuMTY4LjEuMTIxL0RlY2xhcmFDaGlhcGFzL3B1YmxpY28vbWktZGVjbGFyYWNpb24vaG9tZSI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjExO3M6NDoiY3VycCI7czoxODoiQVVDRzkyMDMxNUhDU0dSQjAyIjtzOjE0OiJpZF9kZWNsYXJhY2lvbiI7aTo2NTIwODI7czoxOToiaWRfZGVjbGFyYWNpb25fdGlwbyI7aToxO3M6MTY6ImlkX2NfZGVjbGFyYWNpb24iO2k6MTtzOjIwOiJnYmxfdGlwb19kZWNsYXJhY2lvbiI7czo2NDoiRGVjbGFyYWNpw7NuIFBhdHJpbW9uaWFsIGRlIDxzcGFuIGNsYXNzPSIiIHN0eWxlPSIiPiAyMDI1PC9zcGFuPiI7fQ==',1751485656),('FHz1vl3aLZzbNgUXKQc5YpVUO1ZnsKudZdmbT0NZ',14,'192.168.1.131','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTo5OntzOjY6Il90b2tlbiI7czo0MDoiZFl2SDc2RFFnRW0xTlFUUnBYVW5DYWpnSTN0U3VGbnd4cDhRbEsxWCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzQ6Imh0dHA6Ly8xOTIuMTY4LjEuMTIxL0RlY2xhcmFDaGlhcGFzL3B1YmxpY28vbWktZGVjbGFyYWNpb24vaW5ncmVzb3MvY3JlYXRlIjt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTQ7czo0OiJjdXJwIjtzOjE4OiJMT1JDODQxMDIxSENTUE1SMDgiO3M6MTQ6ImlkX2RlY2xhcmFjaW9uIjtpOjY1MjA4NTtzOjE5OiJpZF9kZWNsYXJhY2lvbl90aXBvIjtpOjE7czoxNjoiaWRfY19kZWNsYXJhY2lvbiI7aToxO3M6MjA6ImdibF90aXBvX2RlY2xhcmFjaW9uIjtzOjY0OiJEZWNsYXJhY2nDs24gUGF0cmltb25pYWwgZGUgPHNwYW4gY2xhc3M9IiIgc3R5bGU9IiI+IDIwMjU8L3NwYW4+Ijt9',1751489676),('JpCOsxX9p2vsIPVKeoKISAHkPJI6pWmJsCsodtOY',7,'192.168.1.190','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0','YTo5OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiTFNMUHVYdllsT2Q0ZXhmSjVSbHJHNEJ3RU9FamZhRDRiM2JjRFdPaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NzA6Imh0dHA6Ly8xOTIuMTY4LjEuMTIxL0RlY2xhcmFDaGlhcGFzL3B1YmxpY28vbWktZGVjbGFyYWNpb24vaW52ZXJzaW9uZXMiO31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aTo3O3M6NDoiY3VycCI7czoxODoiVkFORjk2MTIyNEhDU0xOUjAyIjtzOjIwOiJnYmxfdGlwb19kZWNsYXJhY2lvbiI7czo4ODoiRGVjbGFyYWNpw7NuIFBhdHJpbW9uaWFsIGRlIDxzcGFuIGNsYXNzPSJtZC1jb2xvci10ZWFsLTUwMCIgc3R5bGU9IiI+SW5pY2lhbCAyMDI1PC9zcGFuPiI7czoxNDoiaWRfZGVjbGFyYWNpb24iO2k6NjUyMDc4O3M6MTk6ImlkX2RlY2xhcmFjaW9uX3RpcG8iO2k6MTtzOjE2OiJpZF9jX2RlY2xhcmFjaW9uIjtpOjE7fQ==',1751492035),('vAJ5SIIkvOJSADw0ghePklEt5V8mv15LgKSieqUP',NULL,'192.168.1.108','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTozOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiOU8ySzNxNkgxclllWWVHd2pPRFhFS1oxTXd0MXJGS1JkUFFJMVVkSiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xOTIuMTY4LjEuMTIxL0RlY2xhcmFDaGlhcGFzL3B1YmxpY28vbG9naW4iO319',1751485862),('pjcHsWsAH9TaQZJ8Ug5WAaLcOb0zRBXy9VK5BrA3',NULL,'192.168.1.150','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTozOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiRGtsbjh1QnlhS3VnYm85NndudjVQWFlWSDZucWdQNzN3UHlzQ01GZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xOTIuMTY4LjEuMTIxL0RlY2xhcmFDaGlhcGFzL3B1YmxpY28vbG9naW4iO319',1751488953),('21tMfyZv4oAYMaJjriO4Qbcv2OKfHwNb3uxxERqS',9,'192.168.1.89','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','YTo5OntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiTEw4Sks3QjdkWWRFb1BpNlN0MHpoYXY4TnprN2luTklRMktGVVNhSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Nzc6Imh0dHA6Ly8xOTIuMTY4LjEuMTIxL0RlY2xhcmFDaGlhcGFzL3B1YmxpY28vbWktZGVjbGFyYWNpb24vaW52ZXJzaW9uZXMvY3JlYXRlIjt9czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6OTtzOjQ6ImN1cnAiO3M6MTg6IlJJR0Y5NzA0MjFIQ1NTTUwwOSI7czoyMDoiZ2JsX3RpcG9fZGVjbGFyYWNpb24iO3M6ODg6IkRlY2xhcmFjacOzbiBQYXRyaW1vbmlhbCBkZSA8c3BhbiBjbGFzcz0ibWQtY29sb3ItdGVhbC01MDAiIHN0eWxlPSIiPkluaWNpYWwgMjAyNTwvc3Bhbj4iO3M6MTQ6ImlkX2RlY2xhcmFjaW9uIjtpOjY1MjA4MDtzOjE5OiJpZF9kZWNsYXJhY2lvbl90aXBvIjtpOjE7czoxNjoiaWRfY19kZWNsYXJhY2lvbiI7aToxO30=',1751491610),('hSKpeguPaLWbL2Bi3JoJDEvj9F8g11WcInKVbgL2',NULL,'192.168.1.89','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/122.0.0.0 Safari/537.36','YTo0OntzOjY6Il90b2tlbiI7czo0MDoiWlhnbFhQR2Q5MW9ISGZRVmZCU0k0b1dDemRDUmNzS2JUWU5kMmZxMSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czo3MDoiaHR0cDovLzE5Mi4xNjguMS4xMjEvRGVjbGFyYUNoaWFwYXMvcHVibGljby9taS1kZWNsYXJhY2lvbi9pbnZlcnNpb25lcyI7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjQ5OiJodHRwOi8vMTkyLjE2OC4xLjEyMS9EZWNsYXJhQ2hpYXBhcy9wdWJsaWNvL2xvZ2luIjt9fQ==',1751492572),('Pr4RqNHVrDXP3buINUNfaYxAm2aVnMX7TVuWDjuB',NULL,'192.168.1.52','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36 Edg/138.0.0.0','YTozOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiSGl6bW84b3hnbnFOOWtsTUg4cGlSUUNnVXV5cXM3TWZIdkFOSVE2dSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xOTIuMTY4LjEuMTIxL0RlY2xhcmFDaGlhcGFzL3B1YmxpY28vbG9naW4iO319',1751491873),('g7p09ROospnA01buanx2WiNx6TcNYPzu3ELmtsX8',NULL,'192.168.1.111','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36','YTozOntzOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjY6Il90b2tlbiI7czo0MDoiWWtTdjQ4UEpJSXB3QlRtdWtnSkhYQlJkUFkza3g0ek0yblNMNGhkbCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NDk6Imh0dHA6Ly8xOTIuMTY4LjEuMTIxL0RlY2xhcmFDaGlhcGFzL3B1YmxpY28vbG9naW4iO319',1751492276);

/*Table structure for table `tbl_declarantesfaltantes_2020` */

DROP TABLE IF EXISTS `tbl_declarantesfaltantes_2020`;

CREATE TABLE `tbl_declarantesfaltantes_2020` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `tbl_declarantesfaltantes_2020` */

/*Table structure for table `tbl_declarantesfaltantes_2021` */

DROP TABLE IF EXISTS `tbl_declarantesfaltantes_2021`;

CREATE TABLE `tbl_declarantesfaltantes_2021` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1210 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `tbl_declarantesfaltantes_2021` */

/*Table structure for table `tbl_declarantesfaltantes_2021_2` */

DROP TABLE IF EXISTS `tbl_declarantesfaltantes_2021_2`;

CREATE TABLE `tbl_declarantesfaltantes_2021_2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=273 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `tbl_declarantesfaltantes_2021_2` */

/*Table structure for table `tbl_declarantesfaltantes_2022` */

DROP TABLE IF EXISTS `tbl_declarantesfaltantes_2022`;

CREATE TABLE `tbl_declarantesfaltantes_2022` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18218 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_declarantesfaltantes_2022` */

/*Table structure for table `tbl_declarantesfaltantes_2022_2` */

DROP TABLE IF EXISTS `tbl_declarantesfaltantes_2022_2`;

CREATE TABLE `tbl_declarantesfaltantes_2022_2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9661 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_declarantesfaltantes_2022_2` */

/*Table structure for table `tbl_declarantesfaltantes_2023` */

DROP TABLE IF EXISTS `tbl_declarantesfaltantes_2023`;

CREATE TABLE `tbl_declarantesfaltantes_2023` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9780 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_declarantesfaltantes_2023` */

/*Table structure for table `tbl_declarantesfaltantes_2024` */

DROP TABLE IF EXISTS `tbl_declarantesfaltantes_2024`;

CREATE TABLE `tbl_declarantesfaltantes_2024` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18486 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_declarantesfaltantes_2024` */

/*Table structure for table `tbl_declarantesfaltantes_2024_2` */

DROP TABLE IF EXISTS `tbl_declarantesfaltantes_2024_2`;

CREATE TABLE `tbl_declarantesfaltantes_2024_2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9371 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_declarantesfaltantes_2024_2` */

/*Table structure for table `tbl_declarantesfaltantes_2024_3` */

DROP TABLE IF EXISTS `tbl_declarantesfaltantes_2024_3`;

CREATE TABLE `tbl_declarantesfaltantes_2024_3` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=9175 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_declarantesfaltantes_2024_3` */

/*Table structure for table `tbl_declarantesfaltantes_2025` */

DROP TABLE IF EXISTS `tbl_declarantesfaltantes_2025`;

CREATE TABLE `tbl_declarantesfaltantes_2025` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `correo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=136916 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_declarantesfaltantes_2025` */

/*Table structure for table `tbl_dependencias_2020` */

DROP TABLE IF EXISTS `tbl_dependencias_2020`;

CREATE TABLE `tbl_dependencias_2020` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contacto` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `estadistica` bit(1) DEFAULT b'1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_dependencias_2020` */

/*Table structure for table `tbl_dependencias_2021` */

DROP TABLE IF EXISTS `tbl_dependencias_2021`;

CREATE TABLE `tbl_dependencias_2021` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contacto` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `estadistica` bit(1) DEFAULT b'1',
  `gabinete_ampliado_0_legal_1` bit(1) DEFAULT b'0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `tbl_dependencias_2021` */

/*Table structure for table `tbl_dependencias_2022` */

DROP TABLE IF EXISTS `tbl_dependencias_2022`;

CREATE TABLE `tbl_dependencias_2022` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contacto` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `estadistica` bit(1) DEFAULT b'1',
  `gabinete_ampliado_0_legal_1` bit(1) DEFAULT b'0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_dependencias_2022` */

/*Table structure for table `tbl_dependencias_2023` */

DROP TABLE IF EXISTS `tbl_dependencias_2023`;

CREATE TABLE `tbl_dependencias_2023` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contacto` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `estadistica` bit(1) DEFAULT b'1',
  `gabinete_ampliado_0_legal_1` bit(1) DEFAULT b'0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_dependencias_2023` */

/*Table structure for table `tbl_dependencias_2024` */

DROP TABLE IF EXISTS `tbl_dependencias_2024`;

CREATE TABLE `tbl_dependencias_2024` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no` int DEFAULT NULL,
  `acronimo` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contacto` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `estadistica` bit(1) DEFAULT b'1',
  `gabinete_ampliado_0_legal_1` bit(1) DEFAULT b'0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_dependencias_2024` */

/*Table structure for table `tbl_dependencias_2025` */

DROP TABLE IF EXISTS `tbl_dependencias_2025`;

CREATE TABLE `tbl_dependencias_2025` (
  `id` int NOT NULL AUTO_INCREMENT,
  `no` int DEFAULT NULL,
  `acronimo` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `titular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contacto` text CHARACTER SET utf8 COLLATE utf8_general_ci,
  `logo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `estadistica` bit(1) DEFAULT b'1',
  `gabinete_ampliado_0_legal_1` bit(1) DEFAULT b'0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_dependencias_2025` */

/*Table structure for table `tbl_estadistica_cortes` */

DROP TABLE IF EXISTS `tbl_estadistica_cortes`;

CREATE TABLE `tbl_estadistica_cortes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `archivo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `id_usuario` int NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `anio` int DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_usuario` (`id_usuario`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=663 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_estadistica_cortes` */

/*Table structure for table `tbl_totales_mayo_2020` */

DROP TABLE IF EXISTS `tbl_totales_mayo_2020`;

CREATE TABLE `tbl_totales_mayo_2020` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `tbl_totales_mayo_2020` */

/*Table structure for table `tbl_totales_mayo_2021` */

DROP TABLE IF EXISTS `tbl_totales_mayo_2021`;

CREATE TABLE `tbl_totales_mayo_2021` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `tbl_totales_mayo_2021` */

/*Table structure for table `tbl_totales_mayo_2021_2` */

DROP TABLE IF EXISTS `tbl_totales_mayo_2021_2`;

CREATE TABLE `tbl_totales_mayo_2021_2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `tbl_totales_mayo_2021_2` */

/*Table structure for table `tbl_totales_mayo_2022` */

DROP TABLE IF EXISTS `tbl_totales_mayo_2022`;

CREATE TABLE `tbl_totales_mayo_2022` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totales_mayo_2022` */

/*Table structure for table `tbl_totales_mayo_2022_2` */

DROP TABLE IF EXISTS `tbl_totales_mayo_2022_2`;

CREATE TABLE `tbl_totales_mayo_2022_2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totales_mayo_2022_2` */

/*Table structure for table `tbl_totales_mayo_2023` */

DROP TABLE IF EXISTS `tbl_totales_mayo_2023`;

CREATE TABLE `tbl_totales_mayo_2023` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totales_mayo_2023` */

/*Table structure for table `tbl_totales_mayo_2024` */

DROP TABLE IF EXISTS `tbl_totales_mayo_2024`;

CREATE TABLE `tbl_totales_mayo_2024` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totales_mayo_2024` */

/*Table structure for table `tbl_totales_mayo_2024_2` */

DROP TABLE IF EXISTS `tbl_totales_mayo_2024_2`;

CREATE TABLE `tbl_totales_mayo_2024_2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totales_mayo_2024_2` */

/*Table structure for table `tbl_totales_mayo_2024_3` */

DROP TABLE IF EXISTS `tbl_totales_mayo_2024_3`;

CREATE TABLE `tbl_totales_mayo_2024_3` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totales_mayo_2024_3` */

/*Table structure for table `tbl_totales_mayo_2025` */

DROP TABLE IF EXISTS `tbl_totales_mayo_2025`;

CREATE TABLE `tbl_totales_mayo_2025` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totales_mayo_2025` */

/*Table structure for table `tbl_totalpresentadosmayo_2020` */

DROP TABLE IF EXISTS `tbl_totalpresentadosmayo_2020`;

CREATE TABLE `tbl_totalpresentadosmayo_2020` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_dependencia` (`id_dependencia`) USING BTREE,
  KEY `id_dependencia_2` (`id_dependencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7575 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `tbl_totalpresentadosmayo_2020` */

/*Table structure for table `tbl_totalpresentadosmayo_2021` */

DROP TABLE IF EXISTS `tbl_totalpresentadosmayo_2021`;

CREATE TABLE `tbl_totalpresentadosmayo_2021` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_dependencia` (`id_dependencia`) USING BTREE,
  KEY `id_dependencia_2` (`id_dependencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22403 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `tbl_totalpresentadosmayo_2021` */

/*Table structure for table `tbl_totalpresentadosmayo_2021_2` */

DROP TABLE IF EXISTS `tbl_totalpresentadosmayo_2021_2`;

CREATE TABLE `tbl_totalpresentadosmayo_2021_2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_dependencia` (`id_dependencia`) USING BTREE,
  KEY `id_dependencia_2` (`id_dependencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21815 DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

/*Data for the table `tbl_totalpresentadosmayo_2021_2` */

/*Table structure for table `tbl_totalpresentadosmayo_2022` */

DROP TABLE IF EXISTS `tbl_totalpresentadosmayo_2022`;

CREATE TABLE `tbl_totalpresentadosmayo_2022` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_dependencia` (`id_dependencia`) USING BTREE,
  KEY `id_dependencia_2` (`id_dependencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=87021 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totalpresentadosmayo_2022` */

/*Table structure for table `tbl_totalpresentadosmayo_2022_2` */

DROP TABLE IF EXISTS `tbl_totalpresentadosmayo_2022_2`;

CREATE TABLE `tbl_totalpresentadosmayo_2022_2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_dependencia` (`id_dependencia`) USING BTREE,
  KEY `id_dependencia_2` (`id_dependencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=88226 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totalpresentadosmayo_2022_2` */

/*Table structure for table `tbl_totalpresentadosmayo_2023` */

DROP TABLE IF EXISTS `tbl_totalpresentadosmayo_2023`;

CREATE TABLE `tbl_totalpresentadosmayo_2023` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_dependencia` (`id_dependencia`) USING BTREE,
  KEY `id_dependencia_2` (`id_dependencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=99400 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totalpresentadosmayo_2023` */

/*Table structure for table `tbl_totalpresentadosmayo_2024` */

DROP TABLE IF EXISTS `tbl_totalpresentadosmayo_2024`;

CREATE TABLE `tbl_totalpresentadosmayo_2024` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_dependencia` (`id_dependencia`) USING BTREE,
  KEY `id_dependencia_2` (`id_dependencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=131074 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totalpresentadosmayo_2024` */

/*Table structure for table `tbl_totalpresentadosmayo_2024_2` */

DROP TABLE IF EXISTS `tbl_totalpresentadosmayo_2024_2`;

CREATE TABLE `tbl_totalpresentadosmayo_2024_2` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_dependencia` (`id_dependencia`) USING BTREE,
  KEY `id_dependencia_2` (`id_dependencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93357 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totalpresentadosmayo_2024_2` */

/*Table structure for table `tbl_totalpresentadosmayo_2024_3` */

DROP TABLE IF EXISTS `tbl_totalpresentadosmayo_2024_3`;

CREATE TABLE `tbl_totalpresentadosmayo_2024_3` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_dependencia` (`id_dependencia`) USING BTREE,
  KEY `id_dependencia_2` (`id_dependencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93680 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totalpresentadosmayo_2024_3` */

/*Table structure for table `tbl_totalpresentadosmayo_2025` */

DROP TABLE IF EXISTS `tbl_totalpresentadosmayo_2025`;

CREATE TABLE `tbl_totalpresentadosmayo_2025` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_dependencia` int DEFAULT NULL,
  `declarante` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `total` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `curp` varchar(18) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_dependencia` (`id_dependencia`) USING BTREE,
  KEY `id_dependencia_2` (`id_dependencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=18907 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `tbl_totalpresentadosmayo_2025` */

/*Table structure for table `traspaso` */

DROP TABLE IF EXISTS `traspaso`;

CREATE TABLE `traspaso` (
  `id_persona` int DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `apellido1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `apellido2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sexo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_sexo` int DEFAULT NULL,
  `Nacionalidad` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_nacionalidad` int DEFAULT NULL,
  `id_pais_nacimiento` int DEFAULT NULL,
  `estado de nacimiento` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_estado_nacimiento` int DEFAULT NULL,
  `curp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `homoclave` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `correo_personal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono_particular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono_celular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `estado_civil` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_estado_civil` int DEFAULT NULL,
  `regimen_matrimonial` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_regimen_matrimonial` int DEFAULT NULL,
  `id_padron` int DEFAULT NULL,
  `Relacion juridica` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_relacion_juridica` int DEFAULT NULL,
  `adscripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_estructura` int DEFAULT NULL,
  `cargo_puesto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_cargo_puesto` int DEFAULT NULL,
  `Nivel_gobierno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_nivel_gobierno` int DEFAULT NULL,
  `poder_ente` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_poder_ente` int DEFAULT NULL,
  `contrato_honorarios` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nivel_encargo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `pais` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `telefono_laboral` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `correo_laboral` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_domicilio` int DEFAULT NULL,
  `estado` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `municipio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_municipio` int DEFAULT NULL,
  `calle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `num_exterior` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `num_interior` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `colonia` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `codigo_postal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `traspaso` */

/*Table structure for table `traspaso_estatal` */

DROP TABLE IF EXISTS `traspaso_estatal`;

CREATE TABLE `traspaso_estatal` (
  `id_persona` int DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `apellido1` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `apellido2` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `sexo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_sexo` int DEFAULT NULL,
  `Nacionalidad` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_nacionalidad` int DEFAULT NULL,
  `id_pais_nacimiento` int DEFAULT NULL,
  `estado de nacimiento` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_estado_nacimiento` int DEFAULT NULL,
  `curp` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `rfc` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `homoclave` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `correo_personal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono_particular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `telefono_celular` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `estado_civil` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_estado_civil` int DEFAULT NULL,
  `regimen_matrimonial` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_regimen_matrimonial` int DEFAULT NULL,
  `id_padron` int DEFAULT NULL,
  `Relacion juridica` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_relacion_juridica` int DEFAULT NULL,
  `adscripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_estructura` int DEFAULT NULL,
  `cargo_puesto` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_cargo_puesto` int DEFAULT NULL,
  `Nivel_gobierno` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_nivel_gobierno` int DEFAULT NULL,
  `poder_ente` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_poder_ente` int DEFAULT NULL,
  `contrato_honorarios` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nivel_encargo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `fecha_inicio` date DEFAULT NULL,
  `fecha_fin` date DEFAULT NULL,
  `pais` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_pais` int DEFAULT NULL,
  `telefono_laboral` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `correo_laboral` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_domicilio` int DEFAULT NULL,
  `estado` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `municipio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `id_municipio` int DEFAULT NULL,
  `calle` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `num_exterior` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `num_interior` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `colonia` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `codigo_postal` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `traspaso_estatal` */

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_persona` int DEFAULT NULL,
  `id_dependencia` int DEFAULT NULL,
  `id_estructura` int DEFAULT NULL,
  `curp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `iniciales` varchar(15) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `nickname` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `id_dependencia` (`id_dependencia`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

/*Data for the table `users` */

insert  into `users`(`id`,`id_persona`,`id_dependencia`,`id_estructura`,`curp`,`nombre`,`iniciales`,`nickname`,`password`,`remember_token`,`activo`,`created_at`,`updated_at`,`deleted_at`) values (1,NULL,1,NULL,'VANF961224HCSLNR02','JOSE FERNANDO VALDES NANDUCA',NULL,'administrador','$2y$10$fMWqdIKDsLbBkUwdxi9H.uA2vD9kfyBJR7F2agEexqlBkdPH4nD9m','8puiBuvwHPFqtKQNTCM7wslfDeVFazOtXoZOTyNSAaGPl5Uv9z6tQmLa8kqN',1,NULL,'2025-07-01 11:37:48',NULL),(2,NULL,1,NULL,NULL,'crisogono zavala arias',NULL,'zavala','$2y$10$e0WDz2AdJzOe7tPoKc0phu9gVGZ9m0zEx1aRmYvgaBitSA6a0V1Ei','mzM4Jzke3LRraF0k4vwNlActd8STJu4UqDgLRS6nI6BJrJ57RRxmdK5Nhj7c',1,'2025-06-23 15:44:26','2025-06-30 10:26:29',NULL),(3,NULL,1,NULL,NULL,'GRETA JAZMÍN NÚÑEZ HERNÁNDEZ',NULL,'greta','$2y$10$yI1Pqgj4qzmXf/25OHPnCet857oICOwfYn8i618vRgGxei6WZ5dUG','tQB8YRinJEjaFiEaearsDczFdXK4oeVRQtwRt5sTYgMKMEhlculNpOfhDdr5',1,'2025-06-23 15:49:11','2025-06-25 11:19:50',NULL),(4,NULL,1,NULL,NULL,'Raúl Ernesto Trujillo Aguilar',NULL,'Trujillo','$2y$10$LD1xjRQjvKacEl1vN9nSk.adw0A8WcnU6L9aKvvUPSC/Yte1s8DBK','LegR12a3jsIbyAmymXAzxG8wdHJz0eHk1neCeVSbOgdKUcLkVoVKhSfx86sw',1,'2025-06-25 14:13:34','2025-06-25 16:15:54',NULL),(5,NULL,1,NULL,NULL,'Jose Fernando Valdes Nanduca',NULL,'tjaech-oic','$2y$10$UUS5hnCoWowu0pEPMmIW0.biQfdKwPIkYtAHO.GteYB22TGKpwfh.','kV2EbqHyG6Kjb8Ub9ufJFxFk750ryArMbCBskZyQDyIV7c5GebpEUeghf4UK',1,'2025-06-27 11:19:17','2025-06-27 14:25:58',NULL),(6,NULL,1,NULL,NULL,'Jose Fernando Valdes Nanduca',NULL,'tjaech-rh','$2y$10$yjGT1O/uFYqzMrodC96S0uxf5VA0u4C/rccrJsixKf.OqosqfSy5C','MU4h3Wj79g0JHgH954oKapitMUpv6LbBkTHfjGDiOx0VdobJJP8D2whwZD99',1,'2025-06-27 14:08:11','2025-07-01 14:01:02',NULL),(7,107,NULL,14,'VANF961224HCSLNR02','JOSE FERNANDO',NULL,'valdes','$2y$10$Q7ntdm4pNJhvhK1uLfAUqOfs5/h.HYiGohU7ehCIZdrhj.6BYnt/2','VpREm8gBrBj3dQnt6K2cjBaPBEMWrmXS11jjk3rUkF88o7Z2DkSCFLuIiJPM',1,'2025-07-01 12:02:00','2025-07-02 11:52:35',NULL),(8,64,NULL,9,'SARP850807MCSNVL02','Paola',NULL,'Paosanriver','$2y$10$a/rkK14eu3U63HYQHr9eluRpEIX39tE69awM2jmPOB6F/muImX4A2','295Ocoszf8RlN0FJHZAgUVfkh3ok56nyCWO9esITc9XqaFZOF9E48jk9a8cZ',1,'2025-07-01 13:00:18','2025-07-02 15:31:12',NULL),(9,65,NULL,9,'RIGF970421HCSSML09','Felipe de Jesus',NULL,'FELIPE','$2y$10$KjFTWYPaQIl4Xjq.cD7gve1Hmmf6PETRBA.2YZ8GmIy0CdZ4wSeZG','317yOKN4rUv2iQXooQC97nAZCCNgAdXAiqp4knxWTowEf50CZjJs7Kg0GqV9',1,'2025-07-02 09:58:57','2025-07-02 13:34:31',NULL),(10,30,NULL,17,'GOLN960719MCSMPN07','NANCY CAROLINA',NULL,'NANCYCG','$2y$10$d0GNV0JJLsjD4Bv7w2YLou6S4DeuESSYsUZlHttaSJ5xH6QW5efnu',NULL,1,'2025-07-02 11:55:39','2025-07-02 11:55:39',NULL),(11,5,NULL,5,'AUCG920315HCSGRB02','Gabriel',NULL,'GabrielA','$2y$10$UFryrrFhmvGOAxy4g5HNDOsMmQzOKkB4PltxOUpm/Mczl8Tt1/E6m',NULL,1,'2025-07-02 12:04:51','2025-07-02 12:04:51',NULL),(12,42,NULL,10,'DOAN920826MCSMGN05','Nancy Lorena',NULL,'nancyd','$2y$10$RbiXpKCf3i3kOtGjXbd.CuKl6UV0V4.KbEbYbcRC8zVJDUqo5SI5K','bzJ5YhnF0K9Rk3NSmXTh0dESzr6KhmfDGGMyxINQds6gXtiGSutFA1e1T3ki',1,'2025-07-02 12:13:47','2025-07-02 14:42:32',NULL),(13,72,NULL,15,'CACE750716MCSHRR03','ERIKA DEL CARMEN',NULL,'erikachc','$2y$10$Puh.wXFCeqNOVeDjkxa2e.pv3Ue/NMgrTUfVodByTq9oY4cmmqFEu','Tkk6zBEin14ig2jHbxod8b8HWNrZ2L4SpThnuhuLcEfI9LMdFnMa41Dau0Xb',1,'2025-07-02 12:21:01','2025-07-02 13:51:02',NULL),(14,44,NULL,6,'LORC841021HCSPMR08','Carlos Ivan',NULL,'CarlosL','$2y$10$TwzFTeqqxtT9xR5A01JIL.wnwT6VM5J49M.pLyM.6xsBQq9Bszge.',NULL,1,'2025-07-02 12:38:40','2025-07-02 12:38:40',NULL),(15,106,NULL,14,'GOAL001024MCSNGLA8','Liliana Lizeth',NULL,'lilianagon','$2y$10$UmMpwVMpsFDo20W8QR8iO.IRHtAwtSiVxRurGgZRTLotTvhg8duHe','7IOgm16Uu5BKNekARGA6jfg6i0kihInsilMPfbFkqi7HGbfyUy77PphXm9Zo',1,'2025-07-02 13:09:38','2025-07-02 13:36:17',NULL),(16,78,NULL,15,'CAMJ900808MCSHRS03','MARIA JOSE',NULL,'maria-jose-ch','$2y$10$63TaFU7nu3EKKJ3GVNVIM.kohfZ2xpDxr1do1xjCYa1AxLDkPFX7i','SHRYAq9KMoSBh1L6HLmIszkjPuLHIFXNAJSnqDWhU1TxP1h9bG0UQjeuobvz',1,'2025-07-02 13:17:28','2025-07-02 15:37:40',NULL);

/* Procedure structure for procedure `activar_complementa` */

/*!50003 DROP PROCEDURE IF EXISTS  `activar_complementa` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `activar_complementa`()
BEGIN
/*Funcion que permite a los que deben declaracion presentarla*/
DECLARE done BOOLEAN DEFAULT FALSE;
DECLARE p_id_persona INT(11);
DECLARE p_curp VARCHAR(18);
DECLARE cantidad INT DEFAULT 0;
DECLARE p_modulo BOOLEAN DEFAULT FALSE;
DECLARE cursor_1 CURSOR FOR  select personal.id,personal.curp,personal.modulo from `personal`
 inner join `activar_complementaria` on `personal`.`curp` = `activar_complementaria`.`curp`    
 and `personal`.`deleted_at` is null;
   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;               
   
    OPEN cursor_1;
     cursor_1_loop: LOOP
FETCH cursor_1 INTO p_id_persona,p_curp,p_modulo;
      IF done THEN LEAVE cursor_1_loop; END IF;
                 
																  /*actualizar registro*/																
																	UPDATE personal SET modulo=1
																	WHERE personal.id=p_id_persona;
																	/**/
																	UPDATE activar_complementaria SET hecho=1
																	WHERE activar_complementaria.curp=p_curp;
																	/*registros actualizados*/
																	SET cantidad = cantidad + 1;														
               
       END LOOP cursor_1_loop;
    CLOSE cursor_1;
    select cantidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `actualizar_ultima_declaracion` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizar_ultima_declaracion` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usR_vPn`@`172.16.1.1` PROCEDURE `actualizar_ultima_declaracion`()
BEGIN
DECLARE done BOOLEAN DEFAULT FALSE;
DECLARE p_id_persona INT(11);
DECLARE p_curp VARCHAR(18);
DECLARE p_id_dec INT(11);
DECLARE p_id_tipo INT(1);
DECLARE p_fecha_fin DATE;
DECLARE cantidad INT DEFAULT 0;
DECLARE fecha_final DATE;
DECLARE contar INT;
DECLARE id_padron INT;
/*Consulto la ultima declaracion que tenga cada persona y que sea 1,2,3,4,5*/
DECLARE cursor_1 CURSOR FOR select personal.id as idPer,personal.curp,declaraciones.id as idDec,declaraciones.id_tipo_declaracion,declaraciones.fecha_fin
from personal
inner join declaraciones on declaraciones.id_persona=personal.id
where personal.deleted_at is null
and declaraciones.id=(select MAX(decmaximo.id) as maximo from declaraciones as decmaximo where decmaximo.id_persona=personal.id and decmaximo.id_tipo_declaracion<6)
and declaraciones.fecha_fin is not null
and declaraciones.deleted_at is null;
   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
        -- UPDATE personal SET id_obl_declaracion=NULL, id_obl_tipo_declaracion=NULL,obl_fecha_declaracion=NULL;
       
   
    OPEN cursor_1;
     cursor_1_loop: LOOP
FETCH cursor_1 INTO p_id_persona,p_curp,p_id_dec,p_id_tipo,p_fecha_fin;
      IF done THEN LEAVE cursor_1_loop; END IF;
                 
     
/* consulto el ultimo registro no eliminado de padron que sea de educacion federalizada*/
select count(padron.id),padron.id INTO contar,id_padron from padron
inner join c_estructura on padron.id_estructura=c_estructura.id
where padron.id=(select MAX(paron.id) as maximo from padron as paron where paron.id_personal=padron.id_personal and paron.deleted_at is null)
and padron.id_personal=p_id_persona and c_estructura.id_dependencia=36;
/*si encuentra un registro entra*/
if(contar=1) THEN
/*si lo encontro consulto la fecha fin */
select fecha_fin INTO fecha_final from padron where id=id_padron;
/*si la fecha fin es nulo no esta dado de baja*/
if(fecha_final is null) then
/*actualizo*/
if(p_id_tipo=4) THEN
set p_id_tipo=2;
end if;
if(p_id_tipo=5) THEN
set p_id_tipo=1;
end if;
UPDATE personal SET id_ult_declaracion=p_id_dec, id_ult_tipo_declaracion=p_id_tipo,ult_fecha_declaracion=p_fecha_fin
WHERE personal.id=p_id_persona;
SET cantidad = cantidad + 1;
end if;
end if;    
               
       END LOOP cursor_1_loop;
    CLOSE cursor_1;
    select cantidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `actualizar_ultima_declaracion_mayo` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizar_ultima_declaracion_mayo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `actualizar_ultima_declaracion_mayo`()
BEGIN
DECLARE done BOOLEAN DEFAULT FALSE;
DECLARE p_id_persona INT(11);
DECLARE p_curp VARCHAR(18);
DECLARE p_id_dec INT(11);
DECLARE p_id_tipo INT(1);
DECLARE p_fecha_fin DATE;
DECLARE p_id_obl_tipo_declaracion INT(11);
DECLARE p_obl_fecha_declaracion DATE;
DECLARE cantidad INT DEFAULT 0;
DECLARE fecha_final DATE;
DECLARE contar INT;
DECLARE id_padron INT;
/*
agrega el valor en la tabla persona en los campos mayo, para mantener esos campos actualizados para que en la estadistica consulte los presentados
*/
/*Consulto la ultima declaracion que tenga cada persona y que sea 1,2,3,4,5*/
DECLARE cursor_1 CURSOR FOR select personal.id as idPer,personal.curp,declaraciones.id as idDec,declaraciones.id_tipo_declaracion,declaraciones.fecha_fin
from personal
inner join declaraciones on declaraciones.id_persona=personal.id
where personal.deleted_at is null
and declaraciones.fecha_fin is not null 
and declaraciones.deleted_at is null
and declaraciones.id=(select MAX(decmaximo.id) as maximo from declaraciones as decmaximo where decmaximo.id_persona=personal.id and decmaximo.id_tipo_declaracion=2 and decmaximo.deleted_at is null);
   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
        -- UPDATE personal SET id_obl_declaracion=NULL, id_obl_tipo_declaracion=NULL,obl_fecha_declaracion=NULL;
       
   
    OPEN cursor_1;
     cursor_1_loop: LOOP
FETCH cursor_1 INTO p_id_persona,p_curp,p_id_dec,p_id_tipo,p_fecha_fin;
      IF done THEN LEAVE cursor_1_loop; END IF;
                 
     
				/*actualizo*/
								
												       
											
													
																/*	if(p_id_obl_tipo_declaracion is null && p_obl_fecha_declaracion is null) THEN*/
																		/*solo actualiza cuando no tenga valores previos en obl*/
																		/*actualizo obl en personal si no esta dado de baja en padron con su ultima declaracion*/
																			UPDATE personal SET id_declaracion_mayo=p_id_dec, id_tipo_declaracion_mayo=p_id_tipo,fecha_declaracion_mayo =p_fecha_fin,anio_anual=YEAR(p_fecha_fin)
																			WHERE personal.id=p_id_persona;
																			
																			SET cantidad = cantidad + 1;
																														    
	
               
       END LOOP cursor_1_loop;
    CLOSE cursor_1;
    select cantidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `actualizar_ultima_declaracion_obligado_reingreso` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizar_ultima_declaracion_obligado_reingreso` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `actualizar_ultima_declaracion_obligado_reingreso`()
BEGIN
DECLARE done BOOLEAN DEFAULT FALSE;
DECLARE p_id_persona INT(11);
DECLARE p_curp VARCHAR(18);
DECLARE p_id_dec INT(11);
DECLARE p_id_tipo INT(1);
DECLARE p_fecha_fin DATE;
DECLARE p_id_obl_tipo_declaracion INT(11);
DECLARE p_obl_fecha_declaracion DATE;
DECLARE cantidad INT DEFAULT 0;
DECLARE fecha_final DATE;
DECLARE contar INT;
DECLARE id_padron INT;
/*
agrega el valor en la tabla persona en los campos de obligado, pone 1 en todos los 5 (reingreso), cuando este sea su ultima tipo de declaracion, esto
para que se considere en la estadistica
*/
/*Consulto la ultima declaracion que tenga cada persona y que sea 1,2,3,4,5*/
DECLARE cursor_1 CURSOR FOR select personal.id as idPer,personal.curp,declaraciones.id as idDec,declaraciones.id_tipo_declaracion,declaraciones.fecha_fin,personal.id_obl_tipo_declaracion,personal.obl_fecha_declaracion
from personal
inner join declaraciones on declaraciones.id_persona=personal.id
where personal.deleted_at is null
and declaraciones.id=(select MAX(decmaximo.id) as maximo from declaraciones as decmaximo where decmaximo.id_persona=personal.id and decmaximo.id_tipo_declaracion<6 and decmaximo.deleted_at is null) and declaraciones.fecha_fin is not null and declaraciones.deleted_at is null;
   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
        -- UPDATE personal SET id_obl_declaracion=NULL, id_obl_tipo_declaracion=NULL,obl_fecha_declaracion=NULL;
       
   
    OPEN cursor_1;
     cursor_1_loop: LOOP
FETCH cursor_1 INTO p_id_persona,p_curp,p_id_dec,p_id_tipo,p_fecha_fin,p_id_obl_tipo_declaracion,p_obl_fecha_declaracion;
      IF done THEN LEAVE cursor_1_loop; END IF;
                 
     
/* consulto el ultimo registro no eliminado de padron */
select count(padron.id),padron.id INTO contar,id_padron from padron
inner join c_estructura on padron.id_estructura=c_estructura.id
where padron.id=(select MAX(paron.id) as maximo from padron as paron where paron.id_personal=padron.id_personal and paron.deleted_at is null)
and padron.id_personal=p_id_persona;
/*and c_estructura.id_dependencia=28;*/
/*si encuentra un registro entra*/
if(contar=1) THEN
	/*si lo encontro consulto la fecha fin de padron*/
	select fecha_fin INTO fecha_final from padron where id=id_padron;
	/*si la fecha fin es nulo no esta dado de baja y entra*/
	if(fecha_final is null) then
				/*actualizo*/
			
				if(p_id_tipo=5) THEN
					set p_id_tipo=1;			
												if(p_fecha_fin is not null) THEN	            
											
														if(YEAR(p_fecha_fin)<YEAR(CURRENT_DATE)) THEN
																/*	if(p_id_obl_tipo_declaracion is null && p_obl_fecha_declaracion is null) THEN*/
																		/*solo actualiza cuando no tenga valores previos en obl*/
																		/*actualizo obl en personal si no esta dado de baja en padron con su ultima declaracion*/
																			UPDATE personal SET id_obl_declaracion=p_id_dec, id_obl_tipo_declaracion=p_id_tipo,obl_fecha_declaracion=p_fecha_fin
																			WHERE personal.id=p_id_persona;
																			
																			SET cantidad = cantidad + 1;
																/*	end if;*/
														end if;
														
												end if;
		
        	end if;
		end if;
end if;    
               
       END LOOP cursor_1_loop;
    CLOSE cursor_1;
    select cantidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `actualizar_ultima_declaracion_variante_obligado` */

/*!50003 DROP PROCEDURE IF EXISTS  `actualizar_ultima_declaracion_variante_obligado` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `actualizar_ultima_declaracion_variante_obligado`()
BEGIN
DECLARE done BOOLEAN DEFAULT FALSE;
DECLARE p_id_persona INT(11);
DECLARE p_curp VARCHAR(18);
DECLARE p_id_dec INT(11);
DECLARE p_id_tipo INT(1);
DECLARE p_fecha_fin DATE;
DECLARE p_id_obl_tipo_declaracion INT(11);
DECLARE p_obl_fecha_declaracion DATE;
DECLARE cantidad INT DEFAULT 0;
DECLARE fecha_final DATE;
DECLARE contar INT;
DECLARE id_padron INT;
/*
Tiene la finalidad de poner en obl quines tengan un 4 o 5 del año pasado y tengan nullo en personal
y nullo en fecha_fin en padron
*/
/*Consulto la ultima declaracion que tenga cada persona y que sea 1,2,3,4,5*/
DECLARE cursor_1 CURSOR FOR select personal.id as idPer,personal.curp,declaraciones.id as idDec,declaraciones.id_tipo_declaracion,declaraciones.fecha_fin,personal.id_obl_tipo_declaracion,personal.obl_fecha_declaracion
from personal
inner join declaraciones on declaraciones.id_persona=personal.id
where personal.deleted_at is null
and declaraciones.id=(select MAX(decmaximo.id) as maximo from declaraciones as decmaximo where decmaximo.id_persona=personal.id and decmaximo.id_tipo_declaracion<6 and decmaximo.deleted_at is null) and declaraciones.fecha_fin is not null and declaraciones.deleted_at is null;
   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
        -- UPDATE personal SET id_obl_declaracion=NULL, id_obl_tipo_declaracion=NULL,obl_fecha_declaracion=NULL;
       
   
    OPEN cursor_1;
     cursor_1_loop: LOOP
FETCH cursor_1 INTO p_id_persona,p_curp,p_id_dec,p_id_tipo,p_fecha_fin,p_id_obl_tipo_declaracion,p_obl_fecha_declaracion;
      IF done THEN LEAVE cursor_1_loop; END IF;
                 
     
/* consulto el ultimo registro no eliminado de padron */
select count(padron.id),padron.id INTO contar,id_padron from padron
inner join c_estructura on padron.id_estructura=c_estructura.id
where padron.id=(select MAX(paron.id) as maximo from padron as paron where paron.id_personal=padron.id_personal and paron.deleted_at is null)
and padron.id_personal=p_id_persona;
/*and c_estructura.id_dependencia=28;*/
/*si encuentra un registro entra*/
if(contar=1) THEN
	/*si lo encontro consulto la fecha fin de padron*/
	select fecha_fin INTO fecha_final from padron where id=id_padron;
	/*si la fecha fin es nulo no esta dado de baja y entra*/
	if(fecha_final is null) then
				/*actualizo*/
				if(p_id_tipo=4) THEN
					set p_id_tipo=2;
				end if;
				if(p_id_tipo=5) THEN
					set p_id_tipo=1;
				end if;
				
								            
									
												if(YEAR(p_fecha_fin)<YEAR(CURRENT_DATE)) THEN
															if(p_id_obl_tipo_declaracion is null && p_obl_fecha_declaracion is null) THEN
																/*solo actualiza cuando no tenga valores previos en obl*/
																/*actualizo obl en personal si no esta dado de baja en padron con su ultima declaracion*/
																	UPDATE personal SET id_obl_declaracion=p_id_dec, id_obl_tipo_declaracion=p_id_tipo,obl_fecha_declaracion=p_fecha_fin
																	WHERE personal.id=p_id_persona;
																	
																	SET cantidad = cantidad + 1;
															end if;
								    		end if;
		
		end if;
end if;    
               
       END LOOP cursor_1_loop;
    CLOSE cursor_1;
    select cantidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `llenar_tablas` */

/*!50003 DROP PROCEDURE IF EXISTS  `llenar_tablas` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_dEcLaRachIapAs`@`172.16.0.200` PROCEDURE `llenar_tablas`()
BEGIN
	
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_declarantesfaltantes_2020;
/* Lista de todos los que faltan por declarar */
 INSERT INTO tbl_declarantesfaltantes_2020 (id_dependencia,declarante,curp)
 select  c_dependencia.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `c_dependencia` on `c_estructura`.`id_dependencia` = `c_dependencia`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR(CURRENT_DATE)) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 order by c_dependencia.id,NombreDeclarante;
 
  /* Lista de decalrantes con declaracion abierta */
 INSERT INTO tbl_declarantesfaltantes_2020 (id_dependencia,declarante,curp)
 select  c_dependencia.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `c_dependencia` on `c_estructura`.`id_dependencia` = `c_dependencia`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where personal.obl_fecha_declaracion is null 
 and `personal`.`id_obl_tipo_declaracion` = 2
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 order by c_dependencia.id,NombreDeclarante;
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_totales_mayo_2020;
/* Totales mayo (concentrado de faltantes por dependencia)  */
 INSERT INTO tbl_totales_mayo_2020 (id_dependencia,nombre,total)
 select c_estructura.id_dependencia,c_dependencia.nombre, COUNT(c_dependencia.id) as Max_Sub_Total from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `c_dependencia` on `c_estructura`.`id_dependencia` = `c_dependencia`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR(CURRENT_DATE)) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 group by c_dependencia.id,c_dependencia.nombre;
 
 
 /*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_totalpresentadosmayo_2020;
 /* Total Presentado (concentrado de presentados por dependencia) */
INSERT INTO tbl_totalpresentadosmayo_2020 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on declaraciones.id_persona=personal.id
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join c_dependencia on c_dependencia.id=c_estructura.id_dependencia
where personal.obl_fecha_declaracion is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_obl_tipo_declaracion=2
and personal.obl_fecha_declaracion>'2020-04-30'
group by NombreDeclarante,c_estructura.id_dependencia;
END */$$
DELIMITER ;

/* Procedure structure for procedure `llenar_tablas_2021` */

/*!50003 DROP PROCEDURE IF EXISTS  `llenar_tablas_2021` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_dEcLaRachIapAs`@`172.16.0.200` PROCEDURE `llenar_tablas_2021`()
BEGIN
	
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_declarantesfaltantes_2021;
/* Lista de todos los que faltan por declarar */
 INSERT INTO tbl_declarantesfaltantes_2021 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2021.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2021` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2021`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2021-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2021`.`activo` =1
 and `tbl_dependencias_2021`.`estadistica` =1
 and `tbl_dependencias_2021`.`deleted_at` is null
 order by tbl_dependencias_2021.id,NombreDeclarante;
 
  /* Lista de decalrantes con declaracion abierta */
 INSERT INTO tbl_declarantesfaltantes_2021 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2021.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2021` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2021`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where personal.obl_fecha_declaracion is null 
 and `personal`.`id_obl_tipo_declaracion` = 2
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2021`.`activo` =1
 and `tbl_dependencias_2021`.`estadistica` =1
 and `tbl_dependencias_2021`.`deleted_at` is null
 order by tbl_dependencias_2021.id,NombreDeclarante;
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_totales_mayo_2021;
/* Totales mayo (concentrado de faltantes por dependencia)  */
 INSERT INTO tbl_totales_mayo_2021 (id_dependencia,nombre,total)
 select c_estructura.id_dependencia,tbl_dependencias_2021.nombre, COUNT(tbl_dependencias_2021.id) as Max_Sub_Total from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2021` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2021`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2021-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2021`.`activo` =1
 and `tbl_dependencias_2021`.`estadistica` =1
 and `tbl_dependencias_2021`.`deleted_at` is null
 group by tbl_dependencias_2021.id,tbl_dependencias_2021.nombre;
 
 
 /*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_totalpresentadosmayo_2021;
 /* Total Presentado (concentrado de presentados por dependencia) */
INSERT INTO tbl_totalpresentadosmayo_2021 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on declaraciones.id_persona=personal.id
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2021 on tbl_dependencias_2021.id=c_estructura.id_dependencia
where personal.obl_fecha_declaracion is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_obl_tipo_declaracion=2
and personal.obl_fecha_declaracion>'2021-04-30'
and `tbl_dependencias_2021`.`activo` =1
and `tbl_dependencias_2021`.`estadistica` =1
and `tbl_dependencias_2021`.`deleted_at` is null
and `padron`.`fecha_fin` is null
group by NombreDeclarante,c_estructura.id_dependencia;
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2021 where declarante like '%RUTILIO CRUZ ESCANDON CADENAS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2021 (id_dependencia,declarante,total) values(1,"RUTILIO CRUZ ESCANDON CADENAS",2);
	END;
END IF;
update tbl_declarantesfaltantes_2021 set deleted_at=NOW() where declarante='RUTILIO CRUZ ESCANDON CADENAS';
END */$$
DELIMITER ;

/* Procedure structure for procedure `llenar_tablas_2021_ext` */

/*!50003 DROP PROCEDURE IF EXISTS  `llenar_tablas_2021_ext` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `llenar_tablas_2021_ext`()
BEGIN
	
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_declarantesfaltantes_2021_2;
/* Lista de todos los que faltan por declarar */
 INSERT INTO tbl_declarantesfaltantes_2021_2 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2021.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2021` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2021`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2021-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2021`.`activo` =1
 and `tbl_dependencias_2021`.`estadistica` =1
 and `tbl_dependencias_2021`.`deleted_at` is null
 order by tbl_dependencias_2021.id,NombreDeclarante;
 
  /* Lista de decalrantes con declaracion abierta */
 INSERT INTO tbl_declarantesfaltantes_2021_2 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2021.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2021` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2021`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where personal.obl_fecha_declaracion is null 
 and `personal`.`id_obl_tipo_declaracion` = 2
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2021`.`activo` =1
 and `tbl_dependencias_2021`.`estadistica` =1
 and `tbl_dependencias_2021`.`deleted_at` is null
 order by tbl_dependencias_2021.id,NombreDeclarante;
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_totales_mayo_2021_2;
/* Totales mayo (concentrado de faltantes por dependencia)  */
 INSERT INTO tbl_totales_mayo_2021_2 (id_dependencia,nombre,total)
 select c_estructura.id_dependencia,tbl_dependencias_2021.nombre, COUNT(tbl_dependencias_2021.id) as Max_Sub_Total from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2021` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2021`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2021-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2021`.`activo` =1
 and `tbl_dependencias_2021`.`estadistica` =1
 and `tbl_dependencias_2021`.`deleted_at` is null
 group by tbl_dependencias_2021.id,tbl_dependencias_2021.nombre;
 
 
 /*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_totalpresentadosmayo_2021_2;
 /* Total Presentado (concentrado de presentados por dependencia) */
INSERT INTO tbl_totalpresentadosmayo_2021_2 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on declaraciones.id_persona=personal.id
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2021 on tbl_dependencias_2021.id=c_estructura.id_dependencia
where personal.obl_fecha_declaracion is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_obl_tipo_declaracion=2
and personal.obl_fecha_declaracion>'2021-04-30'
and `tbl_dependencias_2021`.`activo` =1
and `tbl_dependencias_2021`.`estadistica` =1
and `tbl_dependencias_2021`.`deleted_at` is null
and `padron`.`fecha_fin` is null
group by NombreDeclarante,c_estructura.id_dependencia;
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2021_2 where declarante like '%RUTILIO CRUZ ESCANDON CADENAS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2021_2 (id_dependencia,declarante,total) values(1,"RUTILIO CRUZ ESCANDON CADENAS",2);
	END;
END IF;
update tbl_declarantesfaltantes_2021_2 set deleted_at=NOW() where declarante='RUTILIO CRUZ ESCANDON CADENAS';
END */$$
DELIMITER ;

/* Procedure structure for procedure `llenar_tablas_2022` */

/*!50003 DROP PROCEDURE IF EXISTS  `llenar_tablas_2022` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `llenar_tablas_2022`()
BEGIN
	
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_declarantesfaltantes_2022;
/* Lista de todos los que faltan por declarar */
 INSERT INTO tbl_declarantesfaltantes_2022 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2022.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2022` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2022`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2022-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2022`.`activo` =1
 and `tbl_dependencias_2022`.`estadistica` =1
 and `tbl_dependencias_2022`.`deleted_at` is null
 order by tbl_dependencias_2022.id,NombreDeclarante;
 
  /* Lista de decalrantes con declaracion abierta */
 INSERT INTO tbl_declarantesfaltantes_2022 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2022.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2022` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2022`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where personal.obl_fecha_declaracion is null 
 and `personal`.`id_obl_tipo_declaracion` = 2
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2022`.`activo` =1
 and `tbl_dependencias_2022`.`estadistica` =1
 and `tbl_dependencias_2022`.`deleted_at` is null
 order by tbl_dependencias_2022.id,NombreDeclarante;
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_totales_mayo_2022;
/* Totales mayo (concentrado de faltantes por dependencia)  */
 INSERT INTO tbl_totales_mayo_2022 (id_dependencia,nombre,total)
 select c_estructura.id_dependencia,tbl_dependencias_2022.nombre, COUNT(tbl_dependencias_2022.id) as Max_Sub_Total from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2022` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2022`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2022-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2022`.`activo` =1
 and `tbl_dependencias_2022`.`estadistica` =1
 and `tbl_dependencias_2022`.`deleted_at` is null
 group by tbl_dependencias_2022.id,tbl_dependencias_2022.nombre;
 
 
 /*Se elimina el contenido de la tabla*/
 
TRUNCATE TABLE tbl_totalpresentadosmayo_2022;
 /* Total Presentado (concentrado de presentados por dependencia) */
INSERT INTO tbl_totalpresentadosmayo_2022 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on personal.id_declaracion_mayo=declaraciones.id
/*inner join declaraciones on declaraciones.id_persona=personal.id*/
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2022 on tbl_dependencias_2022.id=c_estructura.id_dependencia
where personal.fecha_declaracion_mayo is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_tipo_declaracion_mayo=2
and personal.fecha_declaracion_mayo>'2022-03-31'
and `tbl_dependencias_2022`.`activo` =1
and `tbl_dependencias_2022`.`estadistica` =1
and `tbl_dependencias_2022`.`deleted_at` is null
/*and `padron`.`fecha_fin` is null*/
group by NombreDeclarante,c_estructura.id_dependencia;
/*
TRUNCATE TABLE tbl_totalpresentadosmayo_2022;
INSERT INTO tbl_totalpresentadosmayo_2022 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on personal.id_obl_declaracion=declaraciones.id
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2022 on tbl_dependencias_2022.id=c_estructura.id_dependencia
where personal.obl_fecha_declaracion is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_obl_tipo_declaracion=2
and personal.obl_fecha_declaracion>'2022-03-31'
and `tbl_dependencias_2022`.`activo` =1
and `tbl_dependencias_2022`.`estadistica` =1
and `tbl_dependencias_2022`.`deleted_at` is null
group by NombreDeclarante,c_estructura.id_dependencia;
*/
/*las lineas de abajo agregan que ya declaro en la estadistica*/
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2022 where declarante like '%LILIANA ANGELL GONZÁLEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2022 (id_dependencia,declarante,total) values(4,"LILIANA ANGELL GONZÁLEZ",2);
	END;
END IF;
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2022 where declarante like '%RUTILIO CRUZ ESCANDON CADENAS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2022 (id_dependencia,declarante,total) values(1,"RUTILIO CRUZ ESCANDON CADENAS",2);
	END;
END IF;
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2022 where declarante like '%VANESSA LUNA GONZALEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2022 (id_dependencia,declarante,total) values(4,"VANESSA LUNA GONZALEZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2022 set deleted_at=NOW() where declarante='VANESSA LUNA GONZALEZ';
update tbl_declarantesfaltantes_2022 set deleted_at=NOW() where declarante='LILIANA ANGELL GONZÁLEZ';
update tbl_declarantesfaltantes_2022 set deleted_at=NOW() where declarante='RUTILIO CRUZ ESCANDON CADENAS';
END */$$
DELIMITER ;

/* Procedure structure for procedure `llenar_tablas_2022_ext` */

/*!50003 DROP PROCEDURE IF EXISTS  `llenar_tablas_2022_ext` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `llenar_tablas_2022_ext`()
BEGIN
	
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_declarantesfaltantes_2022_2;
/* Lista de todos los que faltan por declarar */
 INSERT INTO tbl_declarantesfaltantes_2022_2 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2022.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2022` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2022`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2022-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2022`.`activo` =1
 and `tbl_dependencias_2022`.`estadistica` =1
 and `tbl_dependencias_2022`.`deleted_at` is null
 order by tbl_dependencias_2022.id,NombreDeclarante;
 
  /* Lista de decalrantes con declaracion abierta */
 INSERT INTO tbl_declarantesfaltantes_2022_2 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2022.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2022` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2022`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where personal.obl_fecha_declaracion is null 
 and `personal`.`id_obl_tipo_declaracion` = 2
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2022`.`activo` =1
 and `tbl_dependencias_2022`.`estadistica` =1
 and `tbl_dependencias_2022`.`deleted_at` is null
 order by tbl_dependencias_2022.id,NombreDeclarante;
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_totales_mayo_2022_2;
/* Totales mayo (concentrado de faltantes por dependencia)  */
 INSERT INTO tbl_totales_mayo_2022_2 (id_dependencia,nombre,total)
 select c_estructura.id_dependencia,tbl_dependencias_2022.nombre, COUNT(tbl_dependencias_2022.id) as Max_Sub_Total from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2022` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2022`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2022-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2022`.`activo` =1
 and `tbl_dependencias_2022`.`estadistica` =1
 and `tbl_dependencias_2022`.`deleted_at` is null
 group by tbl_dependencias_2022.id,tbl_dependencias_2022.nombre;
 
 
 /*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_totalpresentadosmayo_2022_2;
 /* Total Presentado (concentrado de presentados por dependencia) */
INSERT INTO tbl_totalpresentadosmayo_2022_2 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on personal.id_declaracion_mayo=declaraciones.id
/*inner join declaraciones on declaraciones.id_persona=personal.id*/
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2022 on tbl_dependencias_2022.id=c_estructura.id_dependencia
where personal.fecha_declaracion_mayo is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_tipo_declaracion_mayo=2
and personal.fecha_declaracion_mayo>'2022-03-31'
and `tbl_dependencias_2022`.`activo` =1
and `tbl_dependencias_2022`.`estadistica` =1
and `tbl_dependencias_2022`.`deleted_at` is null
/*and `padron`.`fecha_fin` is null*/
group by NombreDeclarante,c_estructura.id_dependencia;
/*las lineas de abajo agregan que ya declaro en la estadistica*/
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2022 where declarante like '%LILIANA ANGELL GONZÁLEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2022 (id_dependencia,declarante,total) values(4,"LILIANA ANGELL GONZÁLEZ",2);
	END;
END IF;
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2022 where declarante like '%RUTILIO CRUZ ESCANDON CADENAS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2022 (id_dependencia,declarante,total) values(1,"RUTILIO CRUZ ESCANDON CADENAS",2);
	END;
END IF;
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2022 where declarante like '%VANESSA LUNA GONZALEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2022 (id_dependencia,declarante,total) values(4,"VANESSA LUNA GONZALEZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2022 set deleted_at=NOW() where declarante='VANESSA LUNA GONZALEZ';
update tbl_declarantesfaltantes_2022 set deleted_at=NOW() where declarante='LILIANA ANGELL GONZÁLEZ';
update tbl_declarantesfaltantes_2022 set deleted_at=NOW() where declarante='RUTILIO CRUZ ESCANDON CADENAS';
END */$$
DELIMITER ;

/* Procedure structure for procedure `llenar_tablas_2023` */

/*!50003 DROP PROCEDURE IF EXISTS  `llenar_tablas_2023` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `llenar_tablas_2023`()
BEGIN
	
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_declarantesfaltantes_2023;
/* Lista de todos los que faltan por declarar */
 INSERT INTO tbl_declarantesfaltantes_2023 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2023.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2023` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2023`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2023-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2023`.`activo` =1
 and `tbl_dependencias_2023`.`estadistica` =1
 and `tbl_dependencias_2023`.`deleted_at` is null
 order by tbl_dependencias_2023.id,NombreDeclarante, personal.curp;
 
  /* Lista de decalrantes con declaracion abierta */
 INSERT INTO tbl_declarantesfaltantes_2023 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2023.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2023` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2023`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where personal.obl_fecha_declaracion is null 
 and `personal`.`id_obl_tipo_declaracion` = 2
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2023`.`activo` =1
 and `tbl_dependencias_2023`.`estadistica` =1
 and `tbl_dependencias_2023`.`deleted_at` is null
 order by tbl_dependencias_2023.id,NombreDeclarante, personal.curp;
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_totales_mayo_2023;
/* Totales mayo (concentrado de faltantes por dependencia)  */
 INSERT INTO tbl_totales_mayo_2023 (id_dependencia,nombre,total)
 select c_estructura.id_dependencia,tbl_dependencias_2023.nombre, COUNT(tbl_dependencias_2023.id) as Max_Sub_Total from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2023` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2023`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2023-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2023`.`activo` =1
 and `tbl_dependencias_2023`.`estadistica` =1
 and `tbl_dependencias_2023`.`deleted_at` is null
 group by tbl_dependencias_2023.id,tbl_dependencias_2023.nombre;
 
 
 /*Se elimina el contenido de la tabla*/
 
TRUNCATE TABLE tbl_totalpresentadosmayo_2023;
 /* Total Presentado (concentrado de presentados por dependencia) */
INSERT INTO tbl_totalpresentadosmayo_2023 (id_dependencia,declarante,total,curp)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal, personal.curp
from personal
inner join declaraciones on personal.id_declaracion_mayo=declaraciones.id
/*inner join declaraciones on declaraciones.id_persona=personal.id*/
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2023 on tbl_dependencias_2023.id=c_estructura.id_dependencia
where personal.fecha_declaracion_mayo is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_tipo_declaracion_mayo=2
and personal.fecha_declaracion_mayo>='2023-01-16'
and `tbl_dependencias_2023`.`activo` =1
and `tbl_dependencias_2023`.`estadistica` =1
and `tbl_dependencias_2023`.`deleted_at` is null
/*and `padron`.`fecha_fin` is null*/
group by NombreDeclarante,c_estructura.id_dependencia, personal.curp;
/*
TRUNCATE TABLE tbl_totalpresentadosmayo_2023;
INSERT INTO tbl_totalpresentadosmayo_2023 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on personal.id_obl_declaracion=declaraciones.id
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2023 on tbl_dependencias_2023.id=c_estructura.id_dependencia
where personal.obl_fecha_declaracion is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_obl_tipo_declaracion=2
and personal.obl_fecha_declaracion>'2023-03-31'
and `tbl_dependencias_2023`.`activo` =1
and `tbl_dependencias_2023`.`estadistica` =1
and `tbl_dependencias_2023`.`deleted_at` is null
group by NombreDeclarante,c_estructura.id_dependencia;
*/
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2023 where declarante like '%LILIANA ANGELL GONZÁLEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2023 (id_dependencia,declarante,total) values(4,"LILIANA ANGELL GONZÁLEZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2023 set deleted_at=NOW() where declarante='LILIANA ANGELL GONZÁLEZ';
/*******************************************************************************/
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2023 where declarante like '%RODOLFO JIMENEZ SANTOS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2023 (id_dependencia,declarante,total) values(4,"RODOLFO JIMENEZ SANTOS",2);
	END;
END IF;
update tbl_declarantesfaltantes_2023 set deleted_at=NOW() where declarante='RODOLFO JIMENEZ SANTOS';
/*******************************************************************************/
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2023 where declarante like '%ANA MELINA ZARATE VALENCIA%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2023 (id_dependencia,declarante,total) values(4,"ANA MELINA ZARATE VALENCIA",2);
	END;
END IF;
update tbl_declarantesfaltantes_2023 set deleted_at=NOW() where declarante='ANA MELINA ZARATE VALENCIA';
/*******************************************************************************/
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2023 where declarante like '%NADIA LOPEZ DIAZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2023 (id_dependencia,declarante,total) values(4,"NADIA LOPEZ DIAZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2023 set deleted_at=NOW() where declarante='NADIA LOPEZ DIAZ';
/*******************************************************************************/
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2023 where declarante like '%SANDRA DEL CARMEN DOMINGUEZ LOPEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2023 (id_dependencia,declarante,total) values(4,"SANDRA DEL CARMEN DOMINGUEZ LOPEZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2023 set deleted_at=NOW() where declarante='SANDRA DEL CARMEN DOMINGUEZ LOPEZ';
/*******************************************************************************/
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2023 where declarante like '%JOEL PEREIRA HERNANDEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2023 (id_dependencia,declarante,total) values(4,"JOEL PEREIRA HERNANDEZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2023 set deleted_at=NOW() where declarante='JOEL PEREIRA HERNANDEZ';
/*******************************************************************************/
/*******************************************************************************/
IF EXISTS(select * from tbl_declarantesfaltantes_2023 where declarante like '%ABRAHAM VELASCO HERNANDEZ%' and id_dependencia=14) THEN
	BEGIN
				update tbl_declarantesfaltantes_2023 set id_dependencia=40 where declarante='ABRAHAM VELASCO HERNANDEZ'and id_dependencia=14;
	END;
END IF;
IF EXISTS(select * from tbl_totalpresentadosmayo_2023 where declarante like '%ABRAHAM VELASCO HERNANDEZ%' and id_dependencia=14) THEN
	BEGIN
				update tbl_totalpresentadosmayo_2023 set id_dependencia=40 where declarante='ABRAHAM VELASCO HERNANDEZ'and id_dependencia=14;
	END;
END IF;
/*******************************************************************************/
/*******************************************************************************/
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2023 where declarante like '%RUTILIO CRUZ ESCANDON CADENAS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2023 (id_dependencia,declarante,total) values(1,"RUTILIO CRUZ ESCANDON CADENAS",2);
	END;
END IF;
update tbl_declarantesfaltantes_2023 set deleted_at=NOW() where declarante='RUTILIO CRUZ ESCANDON CADENAS';
/*******************************************************************************/
/*las lineas de abajo agregan que ya declaro en la estadistica*/
/*
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2023 where declarante like '%LILIANA ANGELL GONZÁLEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2023 (id_dependencia,declarante,total) values(4,"LILIANA ANGELL GONZÁLEZ",2);
	END;
END IF;
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2023 where declarante like '%RUTILIO CRUZ ESCANDON CADENAS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2023 (id_dependencia,declarante,total) values(1,"RUTILIO CRUZ ESCANDON CADENAS",2);
	END;
END IF;
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2023 where declarante like '%VANESSA LUNA GONZALEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2023 (id_dependencia,declarante,total) values(4,"VANESSA LUNA GONZALEZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2023 set deleted_at=NOW() where declarante='VANESSA LUNA GONZALEZ';
update tbl_declarantesfaltantes_2023 set deleted_at=NOW() where declarante='LILIANA ANGELL GONZÁLEZ';
update tbl_declarantesfaltantes_2023 set deleted_at=NOW() where declarante='RUTILIO CRUZ ESCANDON CADENAS';
*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `llenar_tablas_2023_ext` */

/*!50003 DROP PROCEDURE IF EXISTS  `llenar_tablas_2023_ext` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `llenar_tablas_2023_ext`()
BEGIN
	
TRUNCATE TABLE tbl_declarantesfaltantes_2023_2;
 INSERT INTO tbl_declarantesfaltantes_2023_2 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2023.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2023` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2023`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2023-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2023`.`activo` =1
 and `tbl_dependencias_2023`.`estadistica` =1
 and `tbl_dependencias_2023`.`deleted_at` is null
 order by tbl_dependencias_2023.id,NombreDeclarante;
 
  
 INSERT INTO tbl_declarantesfaltantes_2023_2 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2023.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2023` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2023`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where personal.obl_fecha_declaracion is null 
 and `personal`.`id_obl_tipo_declaracion` = 2
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2023`.`activo` =1
 and `tbl_dependencias_2023`.`estadistica` =1
 and `tbl_dependencias_2023`.`deleted_at` is null
 order by tbl_dependencias_2023.id,NombreDeclarante;
TRUNCATE TABLE tbl_totales_mayo_2023_2;
 INSERT INTO tbl_totales_mayo_2023_2 (id_dependencia,nombre,total)
 select c_estructura.id_dependencia,tbl_dependencias_2023.nombre, COUNT(tbl_dependencias_2023.id) as Max_Sub_Total from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2023` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2023`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2023-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2023`.`activo` =1
 and `tbl_dependencias_2023`.`estadistica` =1
 and `tbl_dependencias_2023`.`deleted_at` is null
 group by tbl_dependencias_2023.id,tbl_dependencias_2023.nombre;
 
 
 
TRUNCATE TABLE tbl_totalpresentadosmayo_2023_2;
 
INSERT INTO tbl_totalpresentadosmayo_2023_2 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on personal.id_obl_declaracion=declaraciones.id
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2023 on tbl_dependencias_2023.id=c_estructura.id_dependencia
where personal.obl_fecha_declaracion is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_obl_tipo_declaracion=2
and personal.obl_fecha_declaracion>'2023-04-30'
and `tbl_dependencias_2023`.`activo` =1
and `tbl_dependencias_2023`.`estadistica` =1
and `tbl_dependencias_2023`.`deleted_at` is null
group by NombreDeclarante,c_estructura.id_dependencia;
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2023_2 where declarante like '%RUTILIO CRUZ ESCANDON CADENAS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2023_2 (id_dependencia,declarante,total) values(1,"RUTILIO CRUZ ESCANDON CADENAS",2);
	END;
END IF;
update tbl_declarantesfaltantes_2023_2 set deleted_at=NOW() where declarante='RUTILIO CRUZ ESCANDON CADENAS';
END */$$
DELIMITER ;

/* Procedure structure for procedure `llenar_tablas_2024` */

/*!50003 DROP PROCEDURE IF EXISTS  `llenar_tablas_2024` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `llenar_tablas_2024`()
BEGIN
	
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_declarantesfaltantes_2024;
/* Lista de todos los que faltan por declarar */
 INSERT INTO tbl_declarantesfaltantes_2024 (id_dependencia,declarante,curp,correo)
 select  tbl_dependencias_2024.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp, personal.correo_personal
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2024` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2024`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2024-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2024`.`activo` =1
 and `tbl_dependencias_2024`.`estadistica` =1
 and `tbl_dependencias_2024`.`deleted_at` is null
 order by tbl_dependencias_2024.id,NombreDeclarante, personal.curp;
 
  /* Lista de decalrantes con declaracion abierta */
 INSERT INTO tbl_declarantesfaltantes_2024 (id_dependencia,declarante,curp,correo)
 select  tbl_dependencias_2024.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp, personal.correo_personal
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2024` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2024`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where personal.obl_fecha_declaracion is null 
 and `personal`.`id_obl_tipo_declaracion` = 2
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2024`.`activo` =1
 and `tbl_dependencias_2024`.`estadistica` =1
 and `tbl_dependencias_2024`.`deleted_at` is null
 order by tbl_dependencias_2024.id,NombreDeclarante, personal.curp;
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_totales_mayo_2024;
/* Totales mayo (concentrado de faltantes por dependencia)  */
 INSERT INTO tbl_totales_mayo_2024 (id_dependencia,nombre,total)
 select c_estructura.id_dependencia,tbl_dependencias_2024.nombre, COUNT(tbl_dependencias_2024.id) as Max_Sub_Total from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2024` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2024`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2024-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2024`.`activo` =1
 and `tbl_dependencias_2024`.`estadistica` =1
 and `tbl_dependencias_2024`.`deleted_at` is null
 group by tbl_dependencias_2024.id,tbl_dependencias_2024.nombre;
 
 
 /*Se elimina el contenido de la tabla*/
 
TRUNCATE TABLE tbl_totalpresentadosmayo_2024;
 /* Total Presentado (concentrado de presentados por dependencia) */
INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total,curp)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal, personal.curp
from personal
inner join declaraciones on personal.id_declaracion_mayo=declaraciones.id
/*inner join declaraciones on declaraciones.id_persona=personal.id*/
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2024 on tbl_dependencias_2024.id=c_estructura.id_dependencia
where personal.fecha_declaracion_mayo is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_tipo_declaracion_mayo=2
and personal.fecha_declaracion_mayo>='2024-01-15'
and `tbl_dependencias_2024`.`activo` =1
and `tbl_dependencias_2024`.`estadistica` =1
and `tbl_dependencias_2024`.`deleted_at` is null
/*and `padron`.`fecha_fin` is null*/
group by NombreDeclarante,c_estructura.id_dependencia, personal.curp;
/*
TRUNCATE TABLE tbl_totalpresentadosmayo_2024;
INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on personal.id_obl_declaracion=declaraciones.id
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2024 on tbl_dependencias_2024.id=c_estructura.id_dependencia
where personal.obl_fecha_declaracion is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_obl_tipo_declaracion=2
and personal.obl_fecha_declaracion>'2024-03-31'
and `tbl_dependencias_2024`.`activo` =1
and `tbl_dependencias_2024`.`estadistica` =1
and `tbl_dependencias_2024`.`deleted_at` is null
group by NombreDeclarante,c_estructura.id_dependencia;
*/
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%JOSE ARTURO FLORES CARREON%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"JOSE ARTURO FLORES CARREON",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='JOSE ARTURO FLORES CARREON';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%JORGE GONZALEZ FERRO%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"JORGE GONZALEZ FERRO",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='JORGE GONZALEZ FERRO';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%LILIANA SANTIAGO MONTOYA%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"LILIANA SANTIAGO MONTOYA",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='LILIANA SANTIAGO MONTOYA';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%MARCOS THAN ESPONDA%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"MARCOS THAN ESPONDA",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='MARCOS THAN ESPONDA';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%MIGUEL ALEJANDRO PEREZ ALVARADO%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"MIGUEL ALEJANDRO PEREZ ALVARADO",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='MIGUEL ALEJANDRO PEREZ ALVARADO';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%RUTILIO CRUZ ESCANDON CADENAS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(1,"RUTILIO CRUZ ESCANDON CADENAS",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='RUTILIO CRUZ ESCANDON CADENAS';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%NOEMI LUNA JIMENEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(1,"NOEMI LUNA JIMENEZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='NOEMI LUNA JIMENEZ';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%MARIA ONEYDA CHAMBE LEON%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(1,"MARIA ONEYDA CHAMBE LEON",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='MARIA ONEYDA CHAMBE LEON';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%DAFNE EVELYN TOBON CARRIEDO%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(1,"DAFNE EVELYN TOBON CARRIEDO",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='DAFNE EVELYN TOBON CARRIEDO';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%ANGELICA MACIAS DE LA CRUZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(1,"ANGELICA MACIAS DE LA CRUZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='ANGELICA MACIAS DE LA CRUZ';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%MONICA ELIZABETH LOPEZ ROMERO%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(1,"MONICA ELIZABETH LOPEZ ROMERO",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='MONICA ELIZABETH LOPEZ ROMERO';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%CARLOS IVAN MORENO MATUZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(1,"CARLOS IVAN MORENO MATUZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='CARLOS IVAN MORENO MATUZ';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%RUBEN SANCHEZ PALOMEQUE%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(1,"RUBEN SANCHEZ PALOMEQUE",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='RUBEN SANCHEZ PALOMEQUE';
/*las lineas de abajo agregan que ya declaro en la estadistica
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%LILIANA ANGELL GONZÁLEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"LILIANA ANGELL GONZÁLEZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='LILIANA ANGELL GONZÁLEZ';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%RODOLFO JIMENEZ SANTOS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"RODOLFO JIMENEZ SANTOS",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='RODOLFO JIMENEZ SANTOS';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%ANA MELINA ZARATE VALENCIA%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"ANA MELINA ZARATE VALENCIA",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='ANA MELINA ZARATE VALENCIA';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%NADIA LOPEZ DIAZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"NADIA LOPEZ DIAZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='NADIA LOPEZ DIAZ';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%SANDRA DEL CARMEN DOMINGUEZ LOPEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"SANDRA DEL CARMEN DOMINGUEZ LOPEZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='SANDRA DEL CARMEN DOMINGUEZ LOPEZ';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%JOEL PEREIRA HERNANDEZ%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"JOEL PEREIRA HERNANDEZ",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='JOEL PEREIRA HERNANDEZ';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%RUTILIO CRUZ ESCANDON CADENAS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(1,"RUTILIO CRUZ ESCANDON CADENAS",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='RUTILIO CRUZ ESCANDON CADENAS';
*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `llenar_tablas_2024_3` */

/*!50003 DROP PROCEDURE IF EXISTS  `llenar_tablas_2024_3` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `llenar_tablas_2024_3`()
BEGIN
	
TRUNCATE TABLE tbl_declarantesfaltantes_2024_3;
 INSERT INTO tbl_declarantesfaltantes_2024_3 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2024.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2024` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2024`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2024-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2024`.`activo` =1
 and `tbl_dependencias_2024`.`estadistica` =1
 and `tbl_dependencias_2024`.`deleted_at` is null
 order by tbl_dependencias_2024.id,NombreDeclarante;
 
  
 INSERT INTO tbl_declarantesfaltantes_2024_3 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2024.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2024` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2024`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where personal.obl_fecha_declaracion is null 
 and `personal`.`id_obl_tipo_declaracion` = 2
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2024`.`activo` =1
 and `tbl_dependencias_2024`.`estadistica` =1
 and `tbl_dependencias_2024`.`deleted_at` is null
 order by tbl_dependencias_2024.id,NombreDeclarante;
TRUNCATE TABLE tbl_totales_mayo_2024_3;
 INSERT INTO tbl_totales_mayo_2024_3 (id_dependencia,nombre,total)
 select c_estructura.id_dependencia,tbl_dependencias_2024.nombre, COUNT(tbl_dependencias_2024.id) as Max_Sub_Total from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2024` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2024`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2024-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2024`.`activo` =1
 and `tbl_dependencias_2024`.`estadistica` =1
 and `tbl_dependencias_2024`.`deleted_at` is null
 group by tbl_dependencias_2024.id,tbl_dependencias_2024.nombre;
 
 
 
TRUNCATE TABLE tbl_totalpresentadosmayo_2024_3;
 
INSERT INTO tbl_totalpresentadosmayo_2024_3 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on personal.id_obl_declaracion=declaraciones.id
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2024 on tbl_dependencias_2024.id=c_estructura.id_dependencia
where personal.obl_fecha_declaracion is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_obl_tipo_declaracion=2
and personal.obl_fecha_declaracion>'2024-01-15'
and `tbl_dependencias_2024`.`activo` =1
and `tbl_dependencias_2024`.`estadistica` =1
and `tbl_dependencias_2024`.`deleted_at` is null
group by NombreDeclarante,c_estructura.id_dependencia;
/*
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024_2 where declarante like '%RUTILIO CRUZ ESCANDON CADENAS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024_2 (id_dependencia,declarante,total) values(1,"RUTILIO CRUZ ESCANDON CADENAS",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024_2 set deleted_at=NOW() where declarante='RUTILIO CRUZ ESCANDON CADENAS';
*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `llenar_tablas_2024_ext` */

/*!50003 DROP PROCEDURE IF EXISTS  `llenar_tablas_2024_ext` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `llenar_tablas_2024_ext`()
BEGIN
	
TRUNCATE TABLE tbl_declarantesfaltantes_2024_2;
 INSERT INTO tbl_declarantesfaltantes_2024_2 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2024.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2024` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2024`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2024-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2024`.`activo` =1
 and `tbl_dependencias_2024`.`estadistica` =1
 and `tbl_dependencias_2024`.`deleted_at` is null
 order by tbl_dependencias_2024.id,NombreDeclarante;
 
  
 INSERT INTO tbl_declarantesfaltantes_2024_2 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2024.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2024` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2024`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where personal.obl_fecha_declaracion is null 
 and `personal`.`id_obl_tipo_declaracion` = 2
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2024`.`activo` =1
 and `tbl_dependencias_2024`.`estadistica` =1
 and `tbl_dependencias_2024`.`deleted_at` is null
 order by tbl_dependencias_2024.id,NombreDeclarante;
TRUNCATE TABLE tbl_totales_mayo_2024_2;
 INSERT INTO tbl_totales_mayo_2024_2 (id_dependencia,nombre,total)
 select c_estructura.id_dependencia,tbl_dependencias_2024.nombre, COUNT(tbl_dependencias_2024.id) as Max_Sub_Total from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2024` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2024`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2024-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2024`.`activo` =1
 and `tbl_dependencias_2024`.`estadistica` =1
 and `tbl_dependencias_2024`.`deleted_at` is null
 group by tbl_dependencias_2024.id,tbl_dependencias_2024.nombre;
 
 
 
TRUNCATE TABLE tbl_totalpresentadosmayo_2024_2;
 
INSERT INTO tbl_totalpresentadosmayo_2024_2 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on personal.id_obl_declaracion=declaraciones.id
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2024 on tbl_dependencias_2024.id=c_estructura.id_dependencia
where personal.obl_fecha_declaracion is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_obl_tipo_declaracion=2
and personal.obl_fecha_declaracion>'2024-01-15'
and `tbl_dependencias_2024`.`activo` =1
and `tbl_dependencias_2024`.`estadistica` =1
and `tbl_dependencias_2024`.`deleted_at` is null
group by NombreDeclarante,c_estructura.id_dependencia;
/*
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024_2 where declarante like '%RUTILIO CRUZ ESCANDON CADENAS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024_2 (id_dependencia,declarante,total) values(1,"RUTILIO CRUZ ESCANDON CADENAS",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024_2 set deleted_at=NOW() where declarante='RUTILIO CRUZ ESCANDON CADENAS';
*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `llenar_tablas_2025` */

/*!50003 DROP PROCEDURE IF EXISTS  `llenar_tablas_2025` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `llenar_tablas_2025`()
BEGIN
	
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_declarantesfaltantes_2025;
/* Lista de todos los que faltan por declarar */
 INSERT INTO tbl_declarantesfaltantes_2025 (id_dependencia,declarante,curp,correo)
 select  tbl_dependencias_2025.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp, personal.correo_personal
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2025` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2025`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2025-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2025`.`activo` =1
 and `tbl_dependencias_2025`.`estadistica` =1
 and `tbl_dependencias_2025`.`deleted_at` is null
 order by tbl_dependencias_2025.id,NombreDeclarante, personal.curp;
 
  /* Lista de decalrantes con declaracion abierta */
 INSERT INTO tbl_declarantesfaltantes_2025 (id_dependencia,declarante,curp,correo)
 select  tbl_dependencias_2025.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp, personal.correo_personal
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2025` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2025`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where personal.obl_fecha_declaracion is null 
 and `personal`.`id_obl_tipo_declaracion` = 2
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2025`.`activo` =1
 and `tbl_dependencias_2025`.`estadistica` =1
 and `tbl_dependencias_2025`.`deleted_at` is null
 order by tbl_dependencias_2025.id,NombreDeclarante, personal.curp;
/*Se elimina el contenido de la tabla*/
TRUNCATE TABLE tbl_totales_mayo_2025;
/* Totales mayo (concentrado de faltantes por dependencia)  */
 INSERT INTO tbl_totales_mayo_2025 (id_dependencia,nombre,total)
 select c_estructura.id_dependencia,tbl_dependencias_2025.nombre, COUNT(tbl_dependencias_2025.id) as Max_Sub_Total from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2025` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2025`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2025-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2025`.`activo` =1
 and `tbl_dependencias_2025`.`estadistica` =1
 and `tbl_dependencias_2025`.`deleted_at` is null
 group by tbl_dependencias_2025.id,tbl_dependencias_2025.nombre;
 
 
 /*Se elimina el contenido de la tabla*/
 
TRUNCATE TABLE tbl_totalpresentadosmayo_2025;
 /* Total Presentado (concentrado de presentados por dependencia) */
INSERT INTO tbl_totalpresentadosmayo_2025 (id_dependencia,declarante,total,curp)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal, personal.curp
from personal
inner join declaraciones on personal.id_declaracion_mayo=declaraciones.id
/*inner join declaraciones on declaraciones.id_persona=personal.id*/
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2025 on tbl_dependencias_2025.id=c_estructura.id_dependencia
where personal.fecha_declaracion_mayo is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_tipo_declaracion_mayo=2
and personal.fecha_declaracion_mayo>='2025-01-15'
and `tbl_dependencias_2025`.`activo` =1
and `tbl_dependencias_2025`.`estadistica` =1
and `tbl_dependencias_2025`.`deleted_at` is null
/*and `padron`.`fecha_fin` is null*/
group by NombreDeclarante,c_estructura.id_dependencia, personal.curp;
/*
TRUNCATE TABLE tbl_totalpresentadosmayo_2024;
INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on personal.id_obl_declaracion=declaraciones.id
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2024 on tbl_dependencias_2024.id=c_estructura.id_dependencia
where personal.obl_fecha_declaracion is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_obl_tipo_declaracion=2
and personal.obl_fecha_declaracion>'2024-03-31'
and `tbl_dependencias_2024`.`activo` =1
and `tbl_dependencias_2024`.`estadistica` =1
and `tbl_dependencias_2024`.`deleted_at` is null
group by NombreDeclarante,c_estructura.id_dependencia;
*/
/*
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%JOSE ARTURO FLORES CARREON%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"JOSE ARTURO FLORES CARREON",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='JOSE ARTURO FLORES CARREON';
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024 where declarante like '%JORGE GONZALEZ FERRO%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024 (id_dependencia,declarante,total) values(4,"JORGE GONZALEZ FERRO",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024 set deleted_at=NOW() where declarante='JORGE GONZALEZ FERRO';
*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `llenar_tablas_2025_ext` */

/*!50003 DROP PROCEDURE IF EXISTS  `llenar_tablas_2025_ext` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `llenar_tablas_2025_ext`()
BEGIN
	
TRUNCATE TABLE tbl_declarantesfaltantes_2025_2;
 INSERT INTO tbl_declarantesfaltantes_2025_2 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2025.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2025` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2025`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2025-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2025`.`activo` =1
 and `tbl_dependencias_2025`.`estadistica` =1
 and `tbl_dependencias_2025`.`deleted_at` is null
 order by tbl_dependencias_2025.id,NombreDeclarante;
 
  
 INSERT INTO tbl_declarantesfaltantes_2025_2 (id_dependencia,declarante,curp)
 select  tbl_dependencias_2025.id,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante, personal.curp
 from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2025` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2025`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where personal.obl_fecha_declaracion is null 
 and `personal`.`id_obl_tipo_declaracion` = 2
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2025`.`activo` =1
 and `tbl_dependencias_2025`.`estadistica` =1
 and `tbl_dependencias_2025`.`deleted_at` is null
 order by tbl_dependencias_2025.id,NombreDeclarante;
TRUNCATE TABLE tbl_totales_mayo_2025_2;
 INSERT INTO tbl_totales_mayo_2025_2 (id_dependencia,nombre,total)
 select c_estructura.id_dependencia,tbl_dependencias_2025.nombre, COUNT(tbl_dependencias_2025.id) as Max_Sub_Total from `padron` 
 inner join `c_estructura` on `padron`.`id_estructura` = `c_estructura`.`id` 
 inner join `tbl_dependencias_2025` on `c_estructura`.`id_dependencia` = `tbl_dependencias_2025`.`id`
 inner join `personal` on `padron`.`id_personal` = `personal`.`id` 
 where YEAR(personal.obl_fecha_declaracion)<(YEAR('2025-12-31')) 
 and `personal`.`id_obl_tipo_declaracion` < 3 
 and `personal`.`deleted_at` is null
 and `padron`.`deleted_at` is null 
 and `padron`.`fecha_fin` is null
 and `tbl_dependencias_2025`.`activo` =1
 and `tbl_dependencias_2025`.`estadistica` =1
 and `tbl_dependencias_2025`.`deleted_at` is null
 group by tbl_dependencias_2025.id,tbl_dependencias_2025.nombre;
 
 
 
TRUNCATE TABLE tbl_totalpresentadosmayo_2025_2;
 
INSERT INTO tbl_totalpresentadosmayo_2025_2 (id_dependencia,declarante,total)
select c_estructura.id_dependencia,CONCAT_WS(' ',personal.nombre, personal.apellido1, personal.apellido2) as NombreDeclarante,COUNT(*) as subtotal
from personal
inner join declaraciones on personal.id_obl_declaracion=declaraciones.id
inner join sec_01_04 on sec_01_04.id_declaracion=declaraciones.id
inner join padron on padron.id=sec_01_04.id_padron
inner join c_estructura on c_estructura.id=padron.id_estructura
inner join tbl_dependencias_2025 on tbl_dependencias_2025.id=c_estructura.id_dependencia
where personal.obl_fecha_declaracion is not null
and `personal`.`deleted_at` is null
and `padron`.`deleted_at` is null 
and personal.id_obl_tipo_declaracion=2
and personal.obl_fecha_declaracion>'2025-01-15'
and `tbl_dependencias_2025`.`activo` =1
and `tbl_dependencias_2025`.`estadistica` =1
and `tbl_dependencias_2025`.`deleted_at` is null
group by NombreDeclarante,c_estructura.id_dependencia;
/*
IF NOT EXISTS(select * from tbl_totalpresentadosmayo_2024_2 where declarante like '%RUTILIO CRUZ ESCANDON CADENAS%') THEN
	BEGIN
				INSERT INTO tbl_totalpresentadosmayo_2024_2 (id_dependencia,declarante,total) values(1,"RUTILIO CRUZ ESCANDON CADENAS",2);
	END;
END IF;
update tbl_declarantesfaltantes_2024_2 set deleted_at=NOW() where declarante='RUTILIO CRUZ ESCANDON CADENAS';
*/
END */$$
DELIMITER ;

/* Procedure structure for procedure `recorrido` */

/*!50003 DROP PROCEDURE IF EXISTS  `recorrido` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usr_declarachiapas`@`172.16.9.47` PROCEDURE `recorrido`()
BEGIN
/*PROCEDIMIENTO PARA ACTUALIZAR LOS CAMPOS DE OBLIGADOS A PRESENTAR EN MAYO DEL AÑO EN CURSO
CREADO: 10-MARZO-2020
ACTUALIZACIONES
11-MARZO-2020
*/
DECLARE done BOOLEAN DEFAULT FALSE;
	
DECLARE p_id_persona INT(11);
DECLARE p_curp VARCHAR(18);
DECLARE p_id_dec INT(11);
DECLARE p_id_tipo INT(1);
DECLARE p_fecha_fin DATE;
DECLARE cantidad INT DEFAULT 0;
DECLARE fecha_final DATE;
DECLARE contar INT;
DECLARE id_padron INT;
/*Consulto la ultima que tenga que sea 1,2 ó 3*/
DECLARE cursor_1 CURSOR FOR select personal.id as idPer,personal.curp,declaraciones.id as idDec,declaraciones.id_tipo_declaracion,declaraciones.fecha_fin 
from personal inner join declaraciones on declaraciones.id_persona=personal.id
where personal.deleted_at is null
and declaraciones.id=(select MAX(decmaximo.id) as maximo from declaraciones as decmaximo where decmaximo.id_persona=personal.id and decmaximo.id_tipo_declaracion<4)
and declaraciones.fecha_fin is not null
and declaraciones.deleted_at is null;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
        UPDATE personal SET id_obl_declaracion=NULL, id_obl_tipo_declaracion=NULL,obl_fecha_declaracion=NULL;
        
   
    OPEN cursor_1;
     cursor_1_loop: LOOP
			FETCH cursor_1 INTO p_id_persona,p_curp,p_id_dec,p_id_tipo,p_fecha_fin;
      IF done THEN LEAVE cursor_1_loop; END IF;
                  
      /*Si la fecha en que la envio su incial o anual es del año pasado si le toca declarar*/
      if(p_id_tipo<3 && YEAR(p_fecha_fin)=YEAR(CURDATE())-1) then
				/*verifico si esta dado de baja*/			
						/* consulto el ultimo registro no eliminado de padron */
						select count(id),id INTO contar,id_padron from padron 
						where padron.id=(select MAX(paron.id) as maximo from padron as paron where paron.id_personal=padron.id_personal and paron.deleted_at is null)
						and padron.id_personal=p_id_persona;
						/*si encuentra un registro entra*/
						if(contar=1) THEN
								/*si lo encontro consulto la fecha fin */
								select fecha_fin INTO fecha_final from padron where id=id_padron;
									/*si la fecha fin es nulo no esta dado de baja por lo tanto le toca declarar anual*/
									if(fecha_final is null) then
										/*actualizo*/
										UPDATE personal SET id_obl_declaracion=p_id_dec, id_obl_tipo_declaracion=p_id_tipo,obl_fecha_declaracion=p_fecha_fin
										WHERE personal.id=p_id_persona;
										SET cantidad = cantidad + 1;
									end if;
															
						end if;     
			
			end if;
                
       END LOOP cursor_1_loop;
    CLOSE cursor_1;
    select cantidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `recorrido_mayo` */

/*!50003 DROP PROCEDURE IF EXISTS  `recorrido_mayo` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_dEcLaRachIapAs`@`172.16.0.200` PROCEDURE `recorrido_mayo`()
BEGIN
DECLARE done BOOLEAN DEFAULT FALSE;
DECLARE p_id_persona INT(11);
DECLARE p_curp VARCHAR(18);
DECLARE p_id_dec INT(11);
DECLARE p_id_tipo INT(1);
DECLARE p_fecha_fin DATE;
DECLARE cantidad INT DEFAULT 0;
DECLARE fecha_final DATE;
DECLARE contar INT;
DECLARE id_padron INT;
/*Consulto la ultima que tenga que sea 1,2 ó 3*/
DECLARE cursor_1 CURSOR FOR select personal.id as idPer,personal.curp,declaraciones.id as idDec,declaraciones.id_tipo_declaracion,declaraciones.fecha_fin
from personal inner join declaraciones on declaraciones.id_persona=personal.id
where personal.deleted_at is null
and declaraciones.id=(select MAX(decmaximo.id) as maximo from declaraciones as decmaximo where decmaximo.id_persona=personal.id and decmaximo.id_tipo_declaracion<4)
and declaraciones.fecha_fin is not null
and declaraciones.deleted_at is null;
   
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done=TRUE;
        -- UPDATE personal SET id_obl_declaracion=NULL, id_obl_tipo_declaracion=NULL,obl_fecha_declaracion=NULL;
       
   
    OPEN cursor_1;
     cursor_1_loop: LOOP
FETCH cursor_1 INTO p_id_persona,p_curp,p_id_dec,p_id_tipo,p_fecha_fin;
      IF done THEN LEAVE cursor_1_loop; END IF;
                 
      /*Si la fecha en que la envio su incial o anual es del año pasado si le toca declarar*/
      if(p_id_tipo<3 && YEAR(p_fecha_fin)=YEAR(CURDATE())-1) then
/*verifico si esta dado de baja*/
/* consulto el ultimo registro no eliminado de padron */
select count(id),id INTO contar,id_padron from padron
where padron.id=(select MAX(paron.id) as maximo from padron as paron where paron.id_personal=padron.id_personal and paron.deleted_at is null)
and padron.id_personal=p_id_persona;
/*si encuentra un registro entra*/
if(contar=1) THEN
/*si lo encontro consulto la fecha fin */
select fecha_fin INTO fecha_final from padron where id=id_padron;
/*si la fecha fin es nulo no esta dado de baja por lo tanto le toca declarar anual*/
if(fecha_final is null) then
/*actualizo*/
UPDATE personal SET id_obl_declaracion=p_id_dec, id_obl_tipo_declaracion=p_id_tipo,obl_fecha_declaracion=p_fecha_fin
WHERE personal.id=p_id_persona;
SET cantidad = cantidad + 1;
end if;
end if;    
end if;
               
       END LOOP cursor_1_loop;
    CLOSE cursor_1;
    select cantidad;
END */$$
DELIMITER ;

/* Procedure structure for procedure `respaldo_grafica` */

/*!50003 DROP PROCEDURE IF EXISTS  `respaldo_grafica` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_dEcLaRachIapAs`@`172.16.0.200` PROCEDURE `respaldo_grafica`()
BEGIN
SET @fecha=CURDATE() + 0;
SET @hora=CURTIME() + 0;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_totales_mayo_2020.csv'); 
                        
SET @`qry` = CONCAT("SELECT * FROM tbl_totales_mayo_2020 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_declarantesfaltantes_2020.csv');
SET @`qry` = CONCAT("SELECT * FROM tbl_declarantesfaltantes_2020 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_totalpresentadosmayo_2020.csv');
SET @`qry` = CONCAT("SELECT * FROM tbl_totalpresentadosmayo_2020 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `respaldo_grafica_2021` */

/*!50003 DROP PROCEDURE IF EXISTS  `respaldo_grafica_2021` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_dEcLaRachIapAs`@`172.16.0.200` PROCEDURE `respaldo_grafica_2021`()
BEGIN
SET @fecha=CURDATE() + 0;
SET @hora=CURTIME() + 0;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_totales_mayo_2021.csv'); 
                        
SET @`qry` = CONCAT("SELECT * FROM tbl_totales_mayo_2021 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_declarantesfaltantes_2021.csv');
SET @`qry` = CONCAT("SELECT * FROM tbl_declarantesfaltantes_2021 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_totalpresentadosmayo_2021.csv');
SET @`qry` = CONCAT("SELECT * FROM tbl_totalpresentadosmayo_2021 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `respaldo_grafica_2022` */

/*!50003 DROP PROCEDURE IF EXISTS  `respaldo_grafica_2022` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `respaldo_grafica_2022`()
BEGIN
SET @fecha=CURDATE() + 0;
SET @hora=CURTIME() + 0;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_totales_mayo_2022.csv'); 
                        
SET @`qry` = CONCAT("SELECT * FROM tbl_totales_mayo_2022 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_declarantesfaltantes_2022.csv');
SET @`qry` = CONCAT("SELECT * FROM tbl_declarantesfaltantes_2022 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_totalpresentadosmayo_2022.csv');
SET @`qry` = CONCAT("SELECT * FROM tbl_totalpresentadosmayo_2022 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `respaldo_grafica_2023` */

/*!50003 DROP PROCEDURE IF EXISTS  `respaldo_grafica_2023` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `respaldo_grafica_2023`()
BEGIN
SET @fecha=CURDATE() + 0;
SET @hora=CURTIME() + 0;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_totales_mayo_2023.csv'); 
                        
SET @`qry` = CONCAT("SELECT * FROM tbl_totales_mayo_2023 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_declarantesfaltantes_2023.csv');
SET @`qry` = CONCAT("SELECT * FROM tbl_declarantesfaltantes_2023 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_totalpresentadosmayo_2023.csv');
SET @`qry` = CONCAT("SELECT * FROM tbl_totalpresentadosmayo_2023 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `respaldo_grafica_2024` */

/*!50003 DROP PROCEDURE IF EXISTS  `respaldo_grafica_2024` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `respaldo_grafica_2024`()
BEGIN
SET @fecha=CURDATE() + 0;
SET @hora=CURTIME() + 0;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_totales_mayo_2024.csv'); 
                        
SET @`qry` = CONCAT("SELECT * FROM tbl_totales_mayo_2024 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_declarantesfaltantes_2024.csv');
SET @`qry` = CONCAT("SELECT * FROM tbl_declarantesfaltantes_2024 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_totalpresentadosmayo_2024.csv');
SET @`qry` = CONCAT("SELECT * FROM tbl_totalpresentadosmayo_2024 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
END */$$
DELIMITER ;

/* Procedure structure for procedure `respaldo_grafica_2025` */

/*!50003 DROP PROCEDURE IF EXISTS  `respaldo_grafica_2025` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`usRbd_uInformatica`@`%` PROCEDURE `respaldo_grafica_2025`()
BEGIN
SET @fecha=CURDATE() + 0;
SET @hora=CURTIME() + 0;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_totales_mayo_2025.csv'); 
                        
SET @`qry` = CONCAT("SELECT * FROM tbl_totales_mayo_2025 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_declarantesfaltantes_2025.csv');
SET @`qry` = CONCAT("SELECT * FROM tbl_declarantesfaltantes_2025 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
SET @`outfull` := CONCAT('/var/lib/mysql-files/',@fecha,@hora , '_tbl_totalpresentadosmayo_2025.csv');
SET @`qry` = CONCAT("SELECT * FROM tbl_totalpresentadosmayo_2025 INTO OUTFILE '",@outfull,"' FIELDS ENCLOSED BY '\"' TERMINATED BY ';' ESCAPED BY '\"'","  LINES TERMINATED BY '
';");
                     
PREPARE `stmt` FROM @`qry`;
SET @`qry` := NULL;
EXECUTE `stmt`;
DEALLOCATE PREPARE `stmt`;
END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
