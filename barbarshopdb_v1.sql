SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `barbershopdb`
--

CREATE DATABASE IF NOT EXISTS `barbershopdb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `barbershopdb`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_parameters`
--

CREATE TABLE `tb_parameters` (
  `PARAM_ID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `PARAM_DAYS_WORK` varchar(120) NOT NULL,
  `PARAM_WORKLOAD_INIT` time NOT NULL,
  `PARAM_WORKLOAD_FINISH` time NOT NULL,
  `PARAM_NAME_PLACE` varchar(120) NOT NULL,
  `PARAM_LAST_UPDATED` varchar(160) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_service`
--

CREATE TABLE `tb_service` (
  `SERVICE_ID` int(11) NOT NULL,
  `SERVICE_NAME` varchar(100) NOT NULL,
  `SERVICE_PRICE` double NOT NULL,
  `SERVICE_CREATED` datetime DEFAULT current_timestamp(),
  `SERVICE_UPDATED` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_user`
--

CREATE TABLE `tb_user` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `USER_CPF` varchar(11),
  `USER_NAME` varchar(120) NOT NULL,
  `USER_EMAIL` varchar(160) NOT NULL,
  `USER_PASSWORD` varchar(255) NOT NULL,
  `USER_PHONE` varchar(10) NOT NULL,
  `USER_TYPE` char(1) NOT NULL,
  `USER_DATE_CREATED` datetime NOT NULL DEFAULT current_timestamp(),
   UNIQUE (`USER_CPF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Estrutura da tabela `tb_scheduling`
--

CREATE TABLE `tb_scheduling` (
  `SKD_ID` bigint(20) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `BARBER_ID` int(11),
  `CUSTOMER_ID` int(11) NOT NULL,
  `SKD_DATE` date NOT NULL,
  `SKD_TIME` time NOT NULL,
  `SERVICE_ID` int(11) NOT NULL,
  `SKD_STATUS` varchar(20) NOT NULL DEFAULT 'Á FAZER',
  
  CONSTRAINT `FK_BARBER_USER` FOREIGN KEY (`BARBER_ID`) REFERENCES `tb_user` (`USER_ID`),
  CONSTRAINT `FK_CUSTOMERUSER` FOREIGN KEY (`CUSTOMER_ID`) REFERENCES `tb_user` (`USER_ID`),
  CONSTRAINT FK_SERVICE_ID FOREIGN KEY (SERVICE_ID) REFERENCES tb_service (SERVICE_ID)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;