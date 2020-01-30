-- MySQL dump 10.13  Distrib 5.7.25, for Linux (x86_64)
--
-- Host: localhost    Database: neptuno
-- ------------------------------------------------------
-- Server version	5.7.14-google-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `neptuno`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `neptuno` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `neptuno`;

--
-- Table structure for table `Clientes`
--

DROP TABLE IF EXISTS `Clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Clientes` (
  `IdCliente` char(5) NOT NULL,
  `Nombre` varchar(60) NOT NULL,
  `Direccion` varchar(60) NOT NULL,
  `RucDNI` varchar(11) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Clientes`
--

LOCK TABLES `Clientes` WRITE;
/*!40000 ALTER TABLE `Clientes` DISABLE KEYS */;
INSERT INTO `Clientes` VALUES ('C0001','CORONEL CASTILLO ERIC GUSTAVO','AV lAS PALEMERAS 234 LOS OLIVOS','10567892456','987-6789'),('C0002','VALENCIA MORALES PEDRO HUGO',' AV LA PAZ 567 MAGDALENA','10567892456','987-6789'),('C0003','MARCELO VILLALOBOS RICARDO','CALLE RISO PATRON 456 LINCE','10567892456','987-6789'),('C0004','ROMERO CASTILLO CARLOS ALBERTO','AV TACNA 234 LIMA','10567892456','987-6789'),('C0005','ARANDA LUNA ALAN ALBERTO','AV AREQUIPA 678 SAN ISIDRO','10567892456','987-6789'),('C0006','AYALA PAZ JORGE LUIS','JR LAS ARTES 890 SAN BORJA','11999966733','987-6789'),('C0007','CHAVEZ CANALES EDGAR RAFAEL','AV PARADO 342 MIRAFLORES','11999966733','987-6789'),('C0008','FLORES CHAFLOQUE ROSA LIZET','AV JAVIER PRADO 456 LA MOLINA','11999966733','987-6789'),('C0009','FLORES SHUTE CRISTIAN RAFAEL','AV UNIVERSITARIA 234 LOS OLIVOS','11999966733','966-23854'),('C0010','GONZALES GARCIA GABRIEL ALEJANDRO','LA COSTANERA 231 SAN MIGUEL','11999966733','966-23854'),('C0011','LAY VALLEJOS JUAN CARLOS','AV AREANALES 567 LINCE','11999966733','966-23854'),('C0012','MONTALVO SOTO DEYSI LIDIA','AV BENAVIDES 123 SURCO','11999966733','966-23854'),('C0013','RICALDE RAMIREZ ROSARIO ESMERALDA','AV ANGAMOS 345 MIRAFLORES','11999966733','991-23546'),('C0014','RODRIGUEZ RAMOS ENRIQUE MANUEL','JR MERINO 123 LINCE','11999966733','991-23546'),('C0015','ROJAS OSCANOA FELIX NINO','AV ABANCAY 456 LIMA','11999966733','991-23546'),('C0016','TEJADA DEL AGUILA TANIA LORENA','JR PERU 456 PUEBLO LIBRE','11999966733','991-23546'),('C0017','VALDEVIESO LEYVA ROXANA','JR PESET 576 SURCO','11999966733','567-8907'),('C0018','VALENTIN COTRINA JUAN DIEGO','AV LA FONTANA 234 LA MOLINA','11999966733','991-23546'),('C0019','YAURICASA BAUTISTA YESABETH','AV UNIVERISTARIA 998 MAGDALENA','11999966733','991-23546'),('C0020','ZEGARRA GARCIA FERNANDO MOISES','JR JUNIN 456 SAN ISIDRO','11999966733','991-23546');
/*!40000 ALTER TABLE `Clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Compras`
--

DROP TABLE IF EXISTS `Compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Compras` (
  `idCompra` int(11) NOT NULL,
  `idProveedor` char(5) NOT NULL,
  `idEmpleado` char(5) NOT NULL,
  `TipoDoc` varchar(20) NOT NULL,
  `NroDoc` varchar(7) NOT NULL,
  `Fecha` date NOT NULL,
  `SubTotal` decimal(8,2) NOT NULL,
  `Igv` decimal(8,2) NOT NULL,
  `Total` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idCompra`),
  KEY `fk_compras_proveedores` (`idProveedor`),
  CONSTRAINT `fk_compras_proveedores` FOREIGN KEY (`idProveedor`) REFERENCES `Proveedores` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Compras`
--

LOCK TABLES `Compras` WRITE;
/*!40000 ALTER TABLE `Compras` DISABLE KEYS */;
/*!40000 ALTER TABLE `Compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Control`
--

DROP TABLE IF EXISTS `Control`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Control` (
  `Parametro` varchar(20) NOT NULL,
  `Valor` int(11) NOT NULL,
  PRIMARY KEY (`Parametro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Control`
--

LOCK TABLES `Control` WRITE;
/*!40000 ALTER TABLE `Control` DISABLE KEYS */;
INSERT INTO `Control` VALUES ('Clientes',1),('Compras',1),('Empleados',1),('Lineas',1),('Productos',1),('Proveedores',1),('Ventas',1);
/*!40000 ALTER TABLE `Control` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetalleCompra`
--

DROP TABLE IF EXISTS `DetalleCompra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DetalleCompra` (
  `idCompra` int(11) NOT NULL,
  `idProducto` char(5) NOT NULL,
  `PrecioCompra` decimal(8,2) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  KEY `fk_detallecompras_compras` (`idCompra`),
  KEY `fk_detallecompras_productos` (`idProducto`),
  CONSTRAINT `fk_detallecompras_compras` FOREIGN KEY (`idCompra`) REFERENCES `Compras` (`idCompra`),
  CONSTRAINT `fk_detallecompras_productos` FOREIGN KEY (`idProducto`) REFERENCES `Productos` (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetalleCompra`
--

LOCK TABLES `DetalleCompra` WRITE;
/*!40000 ALTER TABLE `DetalleCompra` DISABLE KEYS */;
/*!40000 ALTER TABLE `DetalleCompra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DetalleVenta`
--

DROP TABLE IF EXISTS `DetalleVenta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DetalleVenta` (
  `idVenta` int(11) NOT NULL,
  `idProducto` char(5) NOT NULL,
  `Precio` decimal(8,2) NOT NULL,
  `Cantidad` int(11) NOT NULL,
  `Importe` decimal(8,2) NOT NULL,
  KEY `fk_detalleventas_ventas` (`idVenta`),
  KEY `fk_detalleventas_productos` (`idProducto`),
  CONSTRAINT `fk_detalleventas_productos` FOREIGN KEY (`idProducto`) REFERENCES `Productos` (`IdProducto`),
  CONSTRAINT `fk_detalleventas_ventas` FOREIGN KEY (`idVenta`) REFERENCES `Ventas` (`idVenta`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DetalleVenta`
--

LOCK TABLES `DetalleVenta` WRITE;
/*!40000 ALTER TABLE `DetalleVenta` DISABLE KEYS */;
/*!40000 ALTER TABLE `DetalleVenta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Empleados`
--

DROP TABLE IF EXISTS `Empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Empleados` (
  `IdEmpleado` char(5) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  `Apellidos` varchar(25) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Usuario` varchar(20) NOT NULL,
  `Clave` varchar(20) NOT NULL,
  PRIMARY KEY (`IdEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Empleados`
--

LOCK TABLES `Empleados` WRITE;
/*!40000 ALTER TABLE `Empleados` DISABLE KEYS */;
INSERT INTO `Empleados` VALUES ('E0001','Luisa','Davolio','luisa@gmail.com','luisita','gatita'),('E0002','Manolo','Gonzales','manolo@hotmail.com','manolito','jugador'),('E0003','Fanny','Chaira','fanny@gmail.com','fannycita','caramelito'),('E0004','Roberto','Vidales','robert@hotmail.com','robertito','astuto'),('E0005','Michelle','Vargas','mishelle@hotmail.com','michelita','tigresa');
/*!40000 ALTER TABLE `Empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Lineas`
--

DROP TABLE IF EXISTS `Lineas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Lineas` (
  `idlinea` int(11) NOT NULL,
  `Nombre` varchar(20) NOT NULL,
  PRIMARY KEY (`idlinea`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Lineas`
--

LOCK TABLES `Lineas` WRITE;
/*!40000 ALTER TABLE `Lineas` DISABLE KEYS */;
INSERT INTO `Lineas` VALUES (1,'ZAPATOS DE BEBES'),(2,'ZAPATO DE CABALLEROS'),(3,'ZAPATOS NIÑOS'),(4,'ROPA DE DAMAS'),(5,'ROPA DE CABELLEROS'),(6,'ROPA DE SEÑORITAS'),(7,'ROPA DE NIÑOS'),(8,'ROPA DE NIÑAS');
/*!40000 ALTER TABLE `Lineas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Productos`
--

DROP TABLE IF EXISTS `Productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Productos` (
  `IdProducto` char(5) NOT NULL,
  `Descripcion` varchar(50) NOT NULL,
  `IdLinea` int(11) NOT NULL,
  `PrecioCompra` decimal(8,2) NOT NULL,
  `PrecioVenta` decimal(8,2) NOT NULL,
  `Stock` int(11) NOT NULL,
  PRIMARY KEY (`IdProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Productos`
--

LOCK TABLES `Productos` WRITE;
/*!40000 ALTER TABLE `Productos` DISABLE KEYS */;
INSERT INTO `Productos` VALUES ('A0001','Baby Class Calzado para bebe tallas 4 a 8',1,35.00,45.00,200),('A0002','Baby Line Calzado para bebe',1,40.00,50.00,170),('A0003','Baby Magoo Calzado para bebe',1,50.00,60.00,567),('A0004','Baby sandalia Sandalia',1,35.00,45.00,367),('A0005','Balint Calzado para varon',2,150.00,170.00,876),('A0006','Blucher Calzado para varon',2,240.00,280.00,267),('A0007','Clucher 5 Calzado para varon',2,180.00,200.00,546),('A0008','Ingland Calzado para varon',2,230.00,260.00,489),('A0009','Steeper Clasico Calzado de montaña',3,280.00,310.00,678),('A0010','Steeper Plus Calzado de montaña',3,220.00,250.00,345),('A0011','Steeper Light Calzado liviabno de montaña',3,160.00,180.00,765),('A0012','Casaca Bomber para dama',4,330.00,350.00,398),('A0013','Casaca Corta para dama',4,260.00,280.00,845),('A0014','Casaca de gamuza para dama',4,240.00,260.00,967),('A0015','Casaca jean para dama',4,190.00,210.00,587),('A0016','Casaca Sybilla para dama',4,230.00,250.00,845),('A0017','Casaca cuero para varon',5,180.00,200.00,634),('A0018','Casaca para varon de cuero de carnero',5,270.00,290.00,867),('A0019','Casaca cuero clasica para varon',5,260.00,280.00,934),('A0020','Casaca corta para varon',5,190.00,210.00,345),('A0021','Casaca larga para varon',5,450.00,480.00,786),('A0022','Sacon para varon',5,390.00,410.00,956),('A0023','Abrigo Split para varon',5,190.00,210.00,378),('A0024','Saco larga para varon',5,280.00,300.00,888);
/*!40000 ALTER TABLE `Productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Proveedores`
--

DROP TABLE IF EXISTS `Proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Proveedores` (
  `idProveedor` char(5) NOT NULL,
  `RazonSocial` varchar(60) NOT NULL,
  `Direccion` varchar(60) NOT NULL,
  `Ruc` varchar(11) NOT NULL,
  `Telefono` varchar(15) NOT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Proveedores`
--

LOCK TABLES `Proveedores` WRITE;
/*!40000 ALTER TABLE `Proveedores` DISABLE KEYS */;
INSERT INTO `Proveedores` VALUES ('P0001','DISTRIBUIDORA IMPERIAL','AV lAS PALEMERAS 234 LOS OLIVOS ','10567892456','987-6789'),('P0002','IMPORTACIONES NEPTUNO SAC','AV PERU 123 SMP ','10566542456','999-6789'),('P0003','TIENDAS GAMARRA','AV GRAU 234 LIMA','10567895554','234-6789'),('P0004','JOSE LUIS GALAN','AV PARDO 456 MIRAFLORES ','10567892456','453-6789'),('P0005','DISTRIBUIDORA EL 9CITO','AV TUPAC AMARU 110 ','10567895432','234-6789');
/*!40000 ALTER TABLE `Proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ventas`
--

DROP TABLE IF EXISTS `Ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ventas` (
  `idVenta` int(11) NOT NULL,
  `idCliente` char(5) NOT NULL,
  `idEmpleado` char(5) NOT NULL,
  `TipoDoc` varchar(10) NOT NULL,
  `NroDoc` varchar(7) NOT NULL,
  `Fecha` date NOT NULL,
  `Total` decimal(8,2) NOT NULL,
  PRIMARY KEY (`idVenta`),
  KEY `fk_ventas_clientes` (`idCliente`),
  CONSTRAINT `fk_ventas_clientes` FOREIGN KEY (`idCliente`) REFERENCES `Clientes` (`IdCliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ventas`
--

LOCK TABLES `Ventas` WRITE;
/*!40000 ALTER TABLE `Ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-29 14:30:54
