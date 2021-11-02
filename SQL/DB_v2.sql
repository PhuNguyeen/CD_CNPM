-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 21, 2021 lúc 06:03 PM
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

CREATE TABLE IF NOT EXISTS `category` (
  `categoryID` int(11) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(255) NOT NULL,
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`categoryID`, `categoryName`) VALUES
(1, 'Điện thoại'),
(2, 'Tablet'),
(3, 'Watch');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE IF NOT EXISTS `color` (
  `colorID` int(11) NOT NULL AUTO_INCREMENT,
  `colorName` varchar(100) NOT NULL,
  PRIMARY KEY (`colorID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `color`
--

INSERT INTO `color` (`colorID`, `colorName`) VALUES
(1, 'Đỏ '),
(2, 'Đen'),
(3, 'Trắng'),
(4, 'Vàng'),
(5, 'Cam'),
(6, 'Hồng'),
(7, 'Xám'),
(8, 'Bạc'),
(9, 'Xanh dương'),
(10, 'Vàng Đồng');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufacturer`
--

CREATE TABLE IF NOT EXISTS `manufacturer` (
  `manufacturerID` int(11) NOT NULL AUTO_INCREMENT,
  `manufacturerName` varchar(255) NOT NULL,
  PRIMARY KEY (`manufacturerID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturerID`, `manufacturerName`) VALUES
(1, 'Apple'),
(2, 'Samsung'),
(3, 'Xiaomi'),
(4, 'Oppo'),
(5, 'Nokia'),
(6, 'Realme'),
(7, 'Vsmart'),
(8, 'Asus'),
(9, 'OnePlus'),
(10, 'POCO'),
(11, 'Vivo');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE IF NOT EXISTS `product` (
  `productID` int(11) NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) NOT NULL,
  `productImage` int(11) NOT NULL,
  `productDescription` varchar(255) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `manufacturerID` int(11) NOT NULL,
  `specificationsID` int(11) NOT NULL,
  PRIMARY KEY (`productID`,`categoryID`,`manufacturerID`,`specificationsID`),
  KEY `fk_Product_Category1` (`categoryID`),
  KEY `fk_Product_Manufacturer1` (`manufacturerID`),
  KEY `fk_Product_Specifications1` (`specificationsID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`productID`, `productName`, `productImage`, `productDescription`, `categoryID`, `manufacturerID`, `specificationsID`) VALUES
(1, 'iPhone 12 Pro Max', 6, 'Mạnh mẽ, siêu nhanh với chip A14, RAM 6GB, mạng 5G tốc độ cao\r\nRực rỡ, sắc nét, độ sáng cao - Màn hình OLED cao cấp, Super Retina XDR hỗ trợ HDR10, Dolby Vision\r\nChụp ảnh siêu đỉnh - Night Mode , thuật toán Deep Fusion, Smart HDR 3, camera LiDar\r\nBền bỉ v', 1, 1, 3),
(2, 'Samsung Galaxy Z Fold3 5G', 5, 'Thiết kế độc đáo tiện lợi, khẳng định đẳng cấp - Thiết kế gập mở, chất liệu cao cấp, bản lề chắc chắn\r\nMàn hình kép ấn tượng - Màn hình chính 7.9\" và màn hình phụ: 6.23\", 120Hz chuyển động mượt mà\r\nHệ thống camera siêu ấn tượng - Bộ 3 ống kính camera 12MP', 1, 2, 2),
(3, 'Samsung Galaxy Z Fold2 5G', 6, 'Màn hình gập độc đáo, hiển thị liền mạch - Dynamic AMOLED 2X, tần số quét 120Hz, hỗ trợ HDR, Dolby Vision.\r\nHiệu năng vượt trội, kết nối siêu tốc - Snadragon 856 hỗ trợ 5G, RAM 12GB\r\nChụp ảnh, quay video vượt trội - Bộ 3 camera 12MP đỉnh cao, hỗ trợ chụp ', 1, 2, 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_has_voucher`
--

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

CREATE TABLE IF NOT EXISTS `ramrom` (
  `ramromID` int(11) NOT NULL AUTO_INCREMENT,
  `ramdetail` int(11) NOT NULL,
  `romDetail` int(11) NOT NULL,
  PRIMARY KEY (`ramromID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `ramrom`
--

INSERT INTO `ramrom` (`ramromID`, `ramdetail`, `romDetail`) VALUES
(1, 4, 128),
(2, 6, 128),
(3, 16, 128),
(4, 32, 128),
(5, 64, 128),
(6, 8, 256),
(7, 16, 256),
(8, 32, 256),
(9, 64, 512),
(10, 32, 512),
(11, 16, 256),
(12, 16, 512),
(13, 8, 512),
(14, 32, 1024),
(15, 64, 1024);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

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
  PRIMARY KEY (`specificationsID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `specifications`
--

INSERT INTO `specifications` (`specificationsID`, `price`, `screen`, `fontCamera`, `rearCamera`, `cpu`, `simSlot`, `battery`, `design`, `especially`) VALUES
(1, 39000000, 'Không gập màn: 159.2 x 128.2 x 6.9 mm Gập màn: 159', 'Camera chính: 10 MP, f/2.2, 26mm (wide), 1.22µm Ca', 'Camera chính: 12 MP, f/1.8, 26mm (wide), 1/1.76\", ', 'Octa-core (1x3.09 GHz Kryo 585 & 3x2.42 GHz Kryo 5', 'Nano-SIM', 'Li-Po 4500 mAh Sạc nhanh 25W Sạc nhanh không dây 1', 'Màn hình gập', 'Hỗ trợ 5G, Sạc không dây, Bảo mật vân tay'),
(2, 43990000, 'Màn hình chính 7.9\" và màn hình phụ: 6.23\", 120Hz ', 'Camera ẩn dưới màn hình: 4MP, f/1.8', 'Camera góc rộng: 12 MP, f/1.8, 26mm, Dual Pixel PD', 'Snapdragon 888 5G (5 nm), 1 nhân 2.84 GHz, 3 nhân ', '2 SIM (nano‑SIM và eSIM)', 'Li-Po 4400 mAh', 'Khi gập:158.2 x 67.1 x 16mm Khi mở:158.2 x 128.1 x', 'Hỗ trợ 5G, Kháng nước, kháng bụi, Sạc không dây, N'),
(3, 37500000, '6.7 inches', '12 MP, f/2.2, 23mm (wide), 1/3.6\" SL 3D, (depth/bi', '12 MP, f/1.6, 26mm (wide), 1.4µm, dual pixel PDAF,', 'Apple A14 Bionic (5 nm)', '2 SIM (nano‑SIM và eSIM)', 'Li-Ion, sạc nhanh 20W, sạc không dây 15W, USB Powe', 'Tai thỏ', 'Hỗ trợ 5G, Kháng nước, kháng bụi, Sạc không dây, N');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specifications_has_color`
--

CREATE TABLE IF NOT EXISTS `specifications_has_color` (
  `specificationsID` int(11) NOT NULL,
  `colorID` int(11) NOT NULL,
  PRIMARY KEY (`specificationsID`,`colorID`),
  KEY `fk_Specifications_has_Color_Color1` (`colorID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specifications_has_ramrom`
--

CREATE TABLE IF NOT EXISTS `specifications_has_ramrom` (
  `specificationsID` int(11) NOT NULL,
  `ramRomID` int(11) NOT NULL,
  PRIMARY KEY (`specificationsID`,`ramRomID`),
  KEY `fk_Specifications_has_RamRom_RamRom1` (`ramRomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `userName` varchar(50) NOT NULL,
  `userPhone` varchar(12) NOT NULL,
  `userPass` varchar(16) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userAvatar` varchar(50) NOT NULL,
  `userRole` tinyint(4) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`userID`, `userName`, `userPhone`, `userPass`, `userEmail`, `userAvatar`, `userRole`) VALUES
(0, 'Nguyễn Văn An', '0987191143', 'an123', 'akjzakj@gmail.com', '', 1),
(1, 'Nguyễn Đức Phú', '0971618116', 'phu123', 'phunguyen@gmail.com', '', 1),
(2, 'Lê Quang Thọ', '0973271208', 'tho123', 'thole@gmail.com', '', 1),
(3, 'Lê Quang Thọ1', '0973271990', 'tho123a', 'thole@gmail.com', '', 0),
(4, 'Lê Quang Thọ2', '0973271298', 'tho123b', 'thole@gmail.com', '', 0),
(5, 'Lê Quang Thọ3', '0973271288', 'tho123c', 'thole@gmail.com', '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

CREATE TABLE IF NOT EXISTS `voucher` (
  `voucherID` int(11) NOT NULL AUTO_INCREMENT,
  `beginDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `voucherValue` varchar(50) NOT NULL,
  `voucherImage` int(11) NOT NULL,
  `quantily` int(11) NOT NULL,
  `maxValue` int(11) NOT NULL,
  PRIMARY KEY (`voucherID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `voucher`
--

INSERT INTO `voucher` (`voucherID`, `beginDate`, `endDate`, `voucherValue`, `voucherImage`, `quantily`, `maxValue`) VALUES
(1, '2021-10-21 21:30:51', '2021-12-01 21:30:51', '0,5', 0, 10, 5000000),
(2, '2021-10-21 21:30:51', '2021-11-30 21:30:51', '0,2', 0, 5, 2000000);

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
  ADD CONSTRAINT `fk_Product_Manufacturer1` FOREIGN KEY (`manufacturerID`) REFERENCES `manufacturer` (`manufacturerID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Product_Specifications1` FOREIGN KEY (`specificationsID`) REFERENCES `specifications` (`specificationsID`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
