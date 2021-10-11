-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 11, 2021 lúc 01:55 PM
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
-- Cơ sở dữ liệu: `mydb`
--
CREATE DATABASE IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

USE `mydb`;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `bill`
--

CREATE TABLE `bill` (
  `billID` varchar(50) NOT NULL,
  `total` float NOT NULL,
  `address` varchar(255) NOT NULL,
  `date` varchar(255) NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `billConfirm` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
--

CREATE TABLE `billdetail` (
  `billDetailID` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantily` int(11) NOT NULL,
  `specificationsID` int(11) NOT NULL,
  `billID` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `cart`
--

CREATE TABLE `cart` (
  `userID` int(11) NOT NULL,
  `specificationsID` int(11) NOT NULL,
  `Cartcol` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `categoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE `color` (
  `colorID` int(11) NOT NULL,
  `specificationsID` int(11) NOT NULL,
  `colorName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `manufacturer`
--

CREATE TABLE `manufacturer` (
  `manufacturerID` int(11) NOT NULL,
  `manufacturerName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productImage` int(11) NOT NULL,
  `productDescription` varchar(255) NOT NULL,
  `categoryID` int(11) NOT NULL,
  `manufacturerID` int(11) NOT NULL,
  `specificationsID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userPhone` varchar(12) NOT NULL,
  `userPass` varchar(16) NOT NULL,
  `userEmail` varchar(50) NOT NULL,
  `userAvatar` varchar(50) NOT NULL,
  `userRole` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`userID`, `userName`, `userPhone`, `userPass`, `userEmail`, `userAvatar`, `userRole`) VALUES
(0, 'Nguyễn Văn An', '0987191143', 'an123', 'akjzakj@gmail.com', '', 1),
(1, 'Nguyễn Đức Phú', '0971618116', 'phu123', 'phunguyen@gmail.com', '', 1),
(2, 'Lê Quang Thọ', '0973271208', 'tho123', 'thole@gmail.com', '', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

CREATE TABLE `voucher` (
  `voucherID` int(11) NOT NULL,
  `beginDate` datetime NOT NULL,
  `endDate` double NOT NULL,
  `voucherValue` varchar(50) NOT NULL,
  `voucherImage` int(11) NOT NULL,
  `quantily` int(11) NOT NULL,
  `maxValue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_has_voucher`
--

CREATE TABLE `product_has_voucher` (
  `productID` int(11) NOT NULL,
  `voucherID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `ramrom`
--

CREATE TABLE `ramrom` (
  `ramRomID` int(11) NOT NULL,
  `ramRomdetail` int(11) NOT NULL,
  `romDetail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `reviews`
--

CREATE TABLE `reviews` (
  `Reviewscol` int(11) NOT NULL,
  `reviewContent` varchar(45) NOT NULL,
  `date` datetime NOT NULL,
  `rate` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specifications`
--

CREATE TABLE `specifications` (
  `specificationsID` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `screen` varchar(50) NOT NULL,
  `fontCamera` varchar(50) NOT NULL,
  `rearCamera` varchar(50) NOT NULL,
  `cpu` varchar(50) NOT NULL,
  `simSlot` varchar(50) NOT NULL,
  `battery` varchar(50) NOT NULL,
  `design` varchar(50) NOT NULL,
  `especially` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specifications_has_color`
--

CREATE TABLE `specifications_has_color` (
  `specificationsID` int(11) NOT NULL,
  `colorID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specifications_has_ramrom`
--

CREATE TABLE `specifications_has_ramrom` (
  `specificationsID` int(11) NOT NULL,
  `ramRomID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `bill`
--
ALTER TABLE `bill`
  ADD PRIMARY KEY (`billID`,`userID`),
  ADD KEY `fk_Bill_User1` (`userID`);

--
-- Chỉ mục cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  ADD PRIMARY KEY (`billDetailID`,`specificationsID`,`billID`),
  ADD KEY `fk_BillDetail_Specifications1` (`specificationsID`),
  ADD KEY `fk_BillDetail_Bill1` (`billID`);

--
-- Chỉ mục cho bảng `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`userID`,`specificationsID`),
  ADD KEY `fk_Cart_Specifications1` (`specificationsID`);

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryID`);

--
-- Chỉ mục cho bảng `color`
--
ALTER TABLE `color`
  ADD PRIMARY KEY (`colorID`);

--
-- Chỉ mục cho bảng `manufacturer`
--
ALTER TABLE `manufacturer`
  ADD PRIMARY KEY (`manufacturerID`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`,`categoryID`,`manufacturerID`,`specificationsID`),
  ADD KEY `fk_Product_Category1` (`categoryID`),
  ADD KEY `fk_Product_Manufacturer1` (`manufacturerID`),
  ADD KEY `fk_Product_Specifications1` (`specificationsID`);

--
-- Chỉ mục cho bảng `product_has_voucher`
--
ALTER TABLE `product_has_voucher`
  ADD PRIMARY KEY (`productID`,`voucherID`),
  ADD KEY `fk_Product_has_Voucher_Voucher1` (`voucherID`);

--
-- Chỉ mục cho bảng `ramrom`
--
ALTER TABLE `ramrom`
  ADD PRIMARY KEY (`ramRomID`);

--
-- Chỉ mục cho bảng `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`userID`,`productID`),
  ADD KEY `fk_Reviews_Product1` (`productID`);

--
-- Chỉ mục cho bảng `specifications`
--
ALTER TABLE `specifications`
  ADD PRIMARY KEY (`specificationsID`);

--
-- Chỉ mục cho bảng `specifications_has_color`
--
ALTER TABLE `specifications_has_color`
  ADD PRIMARY KEY (`specificationsID`,`colorID`),
  ADD KEY `fk_Specifications_has_Color_Color1` (`colorID`);

--
-- Chỉ mục cho bảng `specifications_has_ramrom`
--
ALTER TABLE `specifications_has_ramrom`
  ADD PRIMARY KEY (`specificationsID`,`ramRomID`),
  ADD KEY `fk_Specifications_has_RamRom_RamRom1` (`ramRomID`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`);

--
-- Chỉ mục cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucherID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `billdetailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `color`
--
ALTER TABLE `color`
  MODIFY `colorID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `manufacturerID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `ramrom`
--
ALTER TABLE `ramrom`
  MODIFY `ramromID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `specifications`
--
ALTER TABLE `specifications`
  MODIFY `specificationsID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucherID` int(11) NOT NULL AUTO_INCREMENT;


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
  ADD CONSTRAINT `fk_Specifications_has_RamRom_RamRom1` FOREIGN KEY (`ramRomID`) REFERENCES `ramrom` (`ramRomID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Specifications_has_RamRom_Specifications1` FOREIGN KEY (`specificationsID`) REFERENCES `specifications` (`specificationsID`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
