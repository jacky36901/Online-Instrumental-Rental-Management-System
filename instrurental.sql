-- phpMyAdmin SQL Dump
-- version 3.3.9
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Nov 18, 2020 at 11:02 AM
-- Server version: 5.5.8
-- PHP Version: 5.3.5

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `instrurental`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_brand`
--

CREATE TABLE IF NOT EXISTS `tbl_brand` (
  `bcode` varchar(20) NOT NULL,
  `bname` varchar(20) NOT NULL,
  `bdesc` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`bcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_brand`
--

INSERT INTO `tbl_brand` (`bcode`, `bname`, `bdesc`) VALUES
('B101', 'Yamaha', 'Yamaha Music India Pvt. Ltd. is part of the Yamaha Corporation worldwide group of companies and offers full line of Yamaha musical instruments, Pro audio and Audio Visual equipments to India market.'),
('B102', 'Roland', 'Roland is best known for manufacturing, marketing, importing and exporting of electronic musical instruments, electronic equipment and software'),
('B103', 'Fender', 'The Fender Musical Instruments Corporation (FMIC, or simply Fender) is an American manufacturer of stringed instruments and amplifiers.'),
('B104', 'Keilworth', 'Keilworth is German brand that has been producing saxophones since 1925, Keilworth horns are known for their bold and distinctive sound, durability and consistent performance.'),
('B105', 'DW', 'Drum Workshop(or DW Drums) is an American drum kit and hardware manufacturing company based in Oxnard, California. Current products by DW include drum kits, snare drums, hardware and bass pedals.'),
('B106', 'Korg', 'Korg Inc is a Japanese multinational corporation that manufactures electronic musical instruments, audio processors and guitar pedals, recording equipment, and electronic tuners.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_cart`
--

CREATE TABLE IF NOT EXISTS `tbl_cart` (
  `cid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `ino` varchar(50) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tbl_cart`
--


-- --------------------------------------------------------

--
-- Table structure for table `tbl_catagory`
--

CREATE TABLE IF NOT EXISTS `tbl_catagory` (
  `ccode` varchar(20) NOT NULL,
  `cname` varchar(20) NOT NULL,
  `cdesc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`ccode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_catagory`
--

INSERT INTO `tbl_catagory` (`ccode`, `cname`, `cdesc`) VALUES
('C101', 'Acoustic', 'Acoustic Instruments. Category of Instruments that are unplugged.'),
('C102', 'Electric', 'Electric Instruments. Category of Instruments that are plugged.');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_item`
--

CREATE TABLE IF NOT EXISTS `tbl_item` (
  `icode` varchar(20) NOT NULL,
  `iname` varchar(20) NOT NULL,
  `idesc` varchar(200) NOT NULL,
  `ccode` varchar(20) NOT NULL,
  `bcode` varchar(20) NOT NULL,
  `vcode` varchar(20) NOT NULL,
  `amt` int(11) NOT NULL,
  PRIMARY KEY (`icode`),
  KEY `bcode` (`bcode`),
  KEY `ccode` (`ccode`),
  KEY `vcode` (`vcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_item`
--

INSERT INTO `tbl_item` (`icode`, `iname`, `idesc`, `ccode`, `bcode`, `vcode`, `amt`) VALUES
('IN101', 'ModX 6', 'Electronic Synthesizer', 'C102', 'B101', 'V101', 500),
('IN102', 'Stratocaster', 'Electric Guitar', 'C102', 'B103', 'V102', 350),
('IN103', 'ST 3103', 'Saxophone', 'C101', 'B104', 'V103', 600),
('IN104', 'Design Series 5', 'Drum Kit', 'C101', 'B105', 'V104', 1000),
('IN105', 'MX 88', 'Electronic Synthesizer', 'C102', 'B101', 'V101', 1000),
('IN106', 'PA 1000', 'Professional Arranger', 'C102', 'B106', 'V101', 500),
('IN107', 'V3 Series ', 'Acoustic Violin', 'C101', 'B101', 'V105', 600),
('IN108', 'Squier SA-150', 'Acoustic Guitar', 'C101', 'B103', 'V102', 600);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_itemchild`
--

CREATE TABLE IF NOT EXISTS `tbl_itemchild` (
  `icid` int(11) NOT NULL AUTO_INCREMENT,
  `icode` varchar(20) NOT NULL,
  `ino` varchar(20) NOT NULL,
  `color` varchar(20) DEFAULT NULL,
  `condn` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`icid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;

--
-- Dumping data for table `tbl_itemchild`
--

INSERT INTO `tbl_itemchild` (`icid`, `icode`, `ino`, `color`, `condn`) VALUES
(1, 'IN105', 'IC1051', 'Blue', 'Great'),
(2, 'IN101', 'IC1011', 'Black', 'Great\r\n'),
(3, 'IN103', 'IC1031', 'White', 'Great'),
(4, 'IN104', 'IC1041', 'White', 'Great'),
(5, 'IN106', 'IC1061', 'grey', 'Great'),
(6, 'IN107', 'IC1071', 'Brown', 'Great'),
(7, 'IN108', 'IC1081', 'Natural', 'Great'),
(8, 'IN102', 'IC1021', 'Metallic Green', 'Great'),
(16, 'IN105', 'IC1052', 'Black', 'Great'),
(17, 'IN108', 'IC1082', 'Black', 'Good');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login`
--

CREATE TABLE IF NOT EXISTS `tbl_login` (
  `uid` int(11) NOT NULL,
  `uname` varchar(30) NOT NULL,
  `upass` varchar(20) NOT NULL,
  `utype` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_login`
--

INSERT INTO `tbl_login` (`uid`, `uname`, `upass`, `utype`) VALUES
(3, 'dipin@gmail.com', 'dipin', 'user'),
(4, 'elton.d.aruja@gmail.com', '12345', 'user'),
(101, 'staff@gmail.com', 'staff', 'staff'),
(102, 'raj@gmail.com', '12345', 'staff'),
(0, 'admin', 'admin', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderc`
--

CREATE TABLE IF NOT EXISTS `tbl_orderc` (
  `ocid` int(11) NOT NULL AUTO_INCREMENT,
  `oid` int(11) NOT NULL,
  `ino` varchar(20) NOT NULL,
  `qty` int(11) NOT NULL,
  PRIMARY KEY (`ocid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tbl_orderc`
--

INSERT INTO `tbl_orderc` (`ocid`, `oid`, `ino`, `qty`) VALUES
(1, 1, 'IC1011', 1),
(2, 1, 'IC1041', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_orderm`
--

CREATE TABLE IF NOT EXISTS `tbl_orderm` (
  `oid` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `tqty` int(11) NOT NULL,
  `trent` int(11) NOT NULL,
  `ostatus` varchar(20) NOT NULL,
  `pstatus` varchar(20) NOT NULL,
  PRIMARY KEY (`oid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `tbl_orderm`
--

INSERT INTO `tbl_orderm` (`oid`, `uid`, `tqty`, `trent`, `ostatus`, `pstatus`) VALUES
(1, 3, 2, 3000, 'pending', 'pending');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_register`
--

CREATE TABLE IF NOT EXISTS `tbl_register` (
  `rid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `adr` varchar(100) NOT NULL,
  `phn` varchar(13) NOT NULL,
  `em` varchar(50) NOT NULL,
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `tbl_register`
--

INSERT INTO `tbl_register` (`rid`, `name`, `adr`, `phn`, `em`) VALUES
(3, 'Dipin', 'Kochi    ', '9865324175', 'dipin@gmail.com'),
(4, 'Elton D Aruja', 'Emil Dale', '6282685510', 'elton.d.aruja@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_staff`
--

CREATE TABLE IF NOT EXISTS `tbl_staff` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `sname` varchar(50) NOT NULL,
  `sadr` varchar(300) NOT NULL,
  `sphn` varchar(12) NOT NULL,
  `sem` varchar(50) NOT NULL,
  PRIMARY KEY (`sid`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=104 ;

--
-- Dumping data for table `tbl_staff`
--

INSERT INTO `tbl_staff` (`sid`, `sname`, `sadr`, `sphn`, `sem`) VALUES
(102, 'Raj', 'Aluva', '9895788271', 'raj@gmail.com'),
(101, 'staff', '  kochi  ', '9895788271', 'staff@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_variety`
--

CREATE TABLE IF NOT EXISTS `tbl_variety` (
  `vcode` varchar(20) NOT NULL,
  `vname` varchar(20) NOT NULL,
  `vdesc` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`vcode`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tbl_variety`
--

INSERT INTO `tbl_variety` (`vcode`, `vname`, `vdesc`) VALUES
('V101', 'Pianos', 'Variety of Pianos and Keyboards.'),
('V102', 'Guitars', 'Variety Of Guitars ranging from Acoustic, Electric, to Bass Guitars'),
('V103', 'Woodwind', 'Variety of Woodwind Instruments such as Flutes, Saxophones, etc.'),
('V104', 'Percussion', 'Variety of Percussive Instruments Ranging from drum kits, Cymbals and Ethnic Percussions'),
('V105', 'Strings', 'Variety of Stringed Instruments such as Violins, Cellos, etc.');
