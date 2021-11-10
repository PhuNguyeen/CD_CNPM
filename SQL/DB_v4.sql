-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 24, 2021 lúc 07:59 PM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `db_app`
--
CREATE DATABASE IF NOT EXISTS `db_app` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_app`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

DROP TABLE IF EXISTS `bill`;
CREATE TABLE IF NOT EXISTS `bill` (
  `billID` varchar(50) NOT NULL,
  `total` float NOT NULL,
  `address` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `billConfirm` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `userID` int(11) NOT NULL,
  PRIMARY KEY (`billID`,`userID`),
  KEY `fk_Bill_User1` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
--

DROP TABLE IF EXISTS `billdetail`;
CREATE TABLE IF NOT EXISTS `billdetail` (
  `billdetailID` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `quantily` int(11) NOT NULL,
  `specificationsID` int(11) NOT NULL,
  `billID` varchar(50) NOT NULL,
  PRIMARY KEY (`billdetailID`,`specificationsID`,`billID`),
  KEY `fk_BillDetail_Specifications1` (`specificationsID`),
  KEY `fk_BillDetail_Bill1` (`billID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `userID` int(11) NOT NULL,
  `specificationsID` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  PRIMARY KEY (`userID`,`specificationsID`),
  KEY `fk_Cart_Specifications1` (`specificationsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryAvatar` varchar(50) DEFAULT NULL,
  `categoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

DROP TABLE IF EXISTS `color`;
CREATE TABLE IF NOT EXISTS `color` (
  `colorID` int(11) NOT NULL AUTO_INCREMENT,
  `colorName` varchar(100) NOT NULL,
  PRIMARY KEY (`colorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturerID` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturerAvatar` varchar(50) DEFAULT NULL,
  `manufacturerName` varchar(255) NOT NULL,
  PRIMARY KEY (`manufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) NOT NULL,
  `productImage` int(11) NOT NULL,
  `productDescription` varchar(255) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `manufacturerID` int(11) NOT NULL,
  PRIMARY KEY (`productID`,`categoryID`,`manufacturerID`),
  KEY `fk_Product_Category1` (`categoryID`),
  KEY `fk_Product_Manufacturer1` (`manufacturerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_has_voucher`
--

DROP TABLE IF EXISTS `product_has_voucher`;
CREATE TABLE IF NOT EXISTS `product_has_voucher` (
  `productID` int(11) NOT NULL,
  `voucherID` int(11) NOT NULL,
  PRIMARY KEY (`productID`,`voucherID`),
  KEY `fk_Product_has_Voucher_Voucher1` (`voucherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ramrom`
--

DROP TABLE IF EXISTS `ramrom`;
CREATE TABLE IF NOT EXISTS `ramrom` (
  `ramromID` int(11) NOT NULL AUTO_INCREMENT,
  `ramdetail` int(11) NOT NULL,
  `romDetail` int(11) NOT NULL,
  PRIMARY KEY (`ramromID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

DROP TABLE IF EXISTS `reviews`;
CREATE TABLE IF NOT EXISTS `reviews` (
  `Reviewscol` int(11) NOT NULL,
  `reviewContent` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `rate` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`userID`,`productID`),
  KEY `fk_Reviews_Product1` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specifications`
--

DROP TABLE IF EXISTS `specifications`;
CREATE TABLE IF NOT EXISTS `specifications` (
  `specificationsID` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `screen` varchar(50) NOT NULL,
  `fontCamera` varchar(50) NOT NULL,
  `rearCamera` varchar(50) NOT NULL,
  `cpu` varchar(50) NOT NULL,
  `simSlot` varchar(50) NOT NULL,
  `battery` varchar(50) NOT NULL,
  `design` varchar(50) NOT NULL,
  `especially` varchar(50) NOT NULL,
  `productID` int(11) NOT NULL,
  PRIMARY KEY (`specificationsID`,`productID`),
  KEY `fk_specifications_Product1` (`productID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specifications_has_color`
--

DROP TABLE IF EXISTS `specifications_has_color`;
CREATE TABLE IF NOT EXISTS `specifications_has_color` (
  `specificationsID` int(11) NOT NULL,
  `colorID` int(11) NOT NULL,
  `priceColor` int(11) NOT NULL,
  PRIMARY KEY (`specificationsID`,`colorID`),
  KEY `fk_Specifications_has_Color_Color1` (`colorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specifications_has_ramrom`
--

DROP TABLE IF EXISTS `specifications_has_ramrom`;
CREATE TABLE IF NOT EXISTS `specifications_has_ramrom` (
  `specificationsID` int(11) NOT NULL,
  `ramRomID` int(11) NOT NULL,
  `priceRamRom` int(11) NOT NULL,
  PRIMARY KEY (`specificationsID`,`ramRomID`),
  KEY `fk_Specifications_has_RamRom_RamRom1` (`ramRomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `userPhone` varchar(12) NOT NULL,
  `userPass` varchar(100) NOT NULL,
  `userEmail` varchar(50) NULL,
  `userAvatar` varchar(50) NOT NULL,
  `userRole` tinyint(4) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

DROP TABLE IF EXISTS `voucher`;
CREATE TABLE IF NOT EXISTS `voucher` (
  `voucherID` int(11) NOT NULL AUTO_INCREMENT,
  `beginDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `voucherValue` varchar(50) NOT NULL,
  `voucherImage` int(11) NOT NULL,
  `quantily` int(11) NOT NULL,
  `maxValue` int(11) NOT NULL,
  PRIMARY KEY (`voucherID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `bill`
--
ALTER TABLE `bill`
  ADD CONSTRAINT `fk_Bill_User1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD CONSTRAINT `fk_BillDetail_Bill1` FOREIGN KEY (`billID`) REFERENCES `bill` (`billID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_BillDetail_Specifications1` FOREIGN KEY (`specificationsID`) REFERENCES `specifications` (`specificationsID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_Cart_Specifications1` FOREIGN KEY (`specificationsID`) REFERENCES `specifications` (`specificationsID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Cart_User1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_Product_Category1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Product_Manufacturer1` FOREIGN KEY (`manufacturerID`) REFERENCES `manufacturer` (`manufacturerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `product_has_voucher`
--
ALTER TABLE `product_has_voucher`
  ADD CONSTRAINT `fk_Product_has_Voucher_Product1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Product_has_Voucher_Voucher1` FOREIGN KEY (`voucherID`) REFERENCES `voucher` (`voucherID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD CONSTRAINT `fk_Reviews_Product1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Reviews_User1` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `specifications`
--
ALTER TABLE `specifications`
  ADD CONSTRAINT `specifications_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`productID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `specifications_has_color`
--
ALTER TABLE `specifications_has_color`
  ADD CONSTRAINT `fk_Specifications_has_Color_Color1` FOREIGN KEY (`colorID`) REFERENCES `color` (`colorID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Specifications_has_Color_Specifications1` FOREIGN KEY (`specificationsID`) REFERENCES `specifications` (`specificationsID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Các ràng buộc cho bảng `specifications_has_ramrom`
--
ALTER TABLE `specifications_has_ramrom`
  ADD CONSTRAINT `fk_Specifications_has_RamRom_RamRom1` FOREIGN KEY (`ramRomID`) REFERENCES `ramrom` (`ramromID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Specifications_has_RamRom_Specifications1` FOREIGN KEY (`specificationsID`) REFERENCES `specifications` (`specificationsID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
