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

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`categoryID`, `categoryAvatar`, `categoryName`) VALUES
(1, NULL, 'Điện thoại'),
(2, NULL, 'Tablet'),
(3, NULL, 'Watch');

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

--
-- Đang đổ dữ liệu cho bảng `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturerID`, `manufacturerAvatar`, `manufacturerName`) VALUES
(1, NULL, 'Apple'),
(2, NULL, 'Samsung'),
(3, NULL, 'Xiaomi'),
(4, NULL, 'Oppo'),
(5, NULL, 'Nokia'),
(6, NULL, 'Realme'),
(7, NULL, 'Vsmart'),
(8, NULL, 'Asus'),
(9, NULL, 'OnePlus'),
(10, NULL, 'POCO'),
(11, NULL, 'Vivo');

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`productID`, `productName`, `productImage`, `productDescription`, `categoryID`, `manufacturerID`) VALUES
(1, 'iPhone 12 Pro Max', 6, 'Mạnh mẽ, siêu nhanh với chip A14, RAM 6GB, mạng 5G tốc độ cao\nRực rỡ, sắc nét, độ sáng cao - Màn hình OLED cao cấp, Super Retina XDR hỗ trợ HDR10, Dolby Vision\nChụp ảnh siêu đỉnh - Night Mode , thuật toán Deep Fusion, Smart HDR 3, camera LiDar\nBền bỉ v', 1, 1),
(2, 'Samsung Galaxy Z Fold3 5G', 5, 'Thiết kế độc đáo tiện lợi, khẳng định đẳng cấp - Thiết kế gập mở, chất liệu cao cấp, bản lề chắc chắn\r\nMàn hình kép ấn tượng - Màn hình chính 7.9\" và màn hình phụ: 6.23\", 120Hz chuyển động mượt mà\r\nHệ thống camera siêu ấn tượng - Bộ 3 ống kính camera 12MP', 1, 2),
(3, 'Samsung Galaxy Z Fold2 5G', 6, 'Màn hình gập độc đáo, hiển thị liền mạch - Dynamic AMOLED 2X, tần số quét 120Hz, hỗ trợ HDR, Dolby Vision.\r\nHiệu năng vượt trội, kết nối siêu tốc - Snadragon 856 hỗ trợ 5G, RAM 12GB\r\nChụp ảnh, quay video vượt trội - Bộ 3 camera 12MP đỉnh cao, hỗ trợ chụp ', 1, 2);

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

--
-- Đang đổ dữ liệu cho bảng `specifications`
--

INSERT INTO `specifications` (`specificationsID`, `price`, `screen`, `fontCamera`, `rearCamera`, `cpu`, `simSlot`, `battery`, `design`, `especially`, `productID`) VALUES
(1, 39000000, 'Không gập màn: 159.2 x 128.2 x 6.9 mm Gập màn: 159', 'Camera chính: 10 MP, f/2.2, 26mm (wide), 1.22µm Ca', 'Camera chính: 12 MP, f/1.8, 26mm (wide), 1/1.76\", ', 'Octa-core (1x3.09 GHz Kryo 585 & 3x2.42 GHz Kryo 5', 'Nano-SIM', 'Li-Po 4500 mAh Sạc nhanh 25W Sạc nhanh không dây 1', 'Màn hình gập', 'Hỗ trợ 5G, Sạc không dây, Bảo mật vân tay', 3),
(2, 43990000, 'Màn hình chính 7.9\" và màn hình phụ: 6.23\", 120Hz ', 'Camera ẩn dưới màn hình: 4MP, f/1.8', 'Camera góc rộng: 12 MP, f/1.8, 26mm, Dual Pixel PD', 'Snapdragon 888 5G (5 nm), 1 nhân 2.84 GHz, 3 nhân ', '2 SIM (nano‑SIM và eSIM)', 'Li-Po 4400 mAh', 'Khi gập:158.2 x 67.1 x 16mm Khi mở:158.2 x 128.1 x', 'Hỗ trợ 5G, Kháng nước, kháng bụi, Sạc không dây, N', 2),
(3, 37500000, '6.7 inches', '12 MP, f/2.2, 23mm (wide), 1/3.6\" SL 3D, (depth/bi', '12 MP, f/1.6, 26mm (wide), 1.4µm, dual pixel PDAF,', 'Apple A14 Bionic (5 nm)', '2 SIM (nano‑SIM và eSIM)', 'Li-Ion, sạc nhanh 20W, sạc không dây 15W, USB Powe', 'Tai thỏ', 'Hỗ trợ 5G, Kháng nước, kháng bụi, Sạc không dây, N', 1);

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`userID`, `userName`, `userPhone`, `userPass`, `userEmail`, `userAvatar`, `userRole`) VALUES
(0, 'Nguyễn Văn An', '0987191143', 'an123', NULL, '', 1),
(1, 'Nguyễn Đức Phú', '0971618116', 'phu123', NULL, '', 1),
(2, 'Lê Quang Thọ', '0973271208', 'tho123', NULL, '', 1),
(3, 'Lê Quang Thọ1', '0973271990', 'tho123a', NULL, '', 0),
(4, 'Lê Quang Thọ2', '0973271298', 'tho123b', NULL, '', 0),
(5, 'Lê Quang Thọ3', '0973271288', 'tho123c', NULL, '', 0);

--
-- Đang đổ dữ liệu cho bảng `voucher`
--

INSERT INTO `voucher` (`voucherID`, `beginDate`, `endDate`, `voucherValue`, `voucherImage`, `quantily`, `maxValue`) VALUES
(1, '2021-10-21 21:30:51', '2021-12-01 21:30:51', '0,5', 0, 10, 5000000),
(2, '2021-10-21 21:30:51', '2021-11-30 21:30:51', '0,2', 0, 5, 2000000);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
