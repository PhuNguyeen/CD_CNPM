-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2021 lúc 02:41 AM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 7.3.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
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

CREATE TABLE `bill` (
  `billID` varchar(50) NOT NULL,
  `total` float NOT NULL,
  `address` varchar(255) NOT NULL,
  `date` datetime NOT NULL,
  `note` varchar(255) DEFAULT NULL,
  `billConfirm` tinyint(3) UNSIGNED ZEROFILL NOT NULL,
  `userID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `billdetail`
--

CREATE TABLE `billdetail` (
  `billdetailID` int(11) NOT NULL,
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
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `categoryID` int(11) NOT NULL,
  `categoryAvatar` varchar(50) DEFAULT NULL,
  `categoryName` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`categoryID`, `categoryAvatar`, `categoryName`) VALUES
(1, 'smartphone.png', 'Điện thoại'),
(2, 'tablet.png', 'Tablet'),
(3, 'smart_watch.png', 'Watch');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `color`
--

CREATE TABLE `color` (
  `colorID` int(11) NOT NULL,
  `colorName` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `manufacturer` (
  `manufacturerID` int(11) NOT NULL,
  `manufacturerName` varchar(255) NOT NULL,
  `manufacturerAvatar` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `manufacturer`
--

INSERT INTO `manufacturer` (`manufacturerID`, `manufacturerName`, `manufacturerAvatar`) VALUES
(1, 'Apple', NULL),
(2, 'Samsung', NULL),
(3, 'Xiaomi', NULL),
(4, 'Oppo', NULL),
(5, 'Nokia', NULL),
(6, 'Realme', NULL),
(7, 'Vsmart', NULL),
(8, 'Asus', NULL),
(9, 'OnePlus', NULL),
(10, 'POCO', NULL),
(11, 'Vivo', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product`
--

CREATE TABLE `product` (
  `productID` int(11) NOT NULL,
  `productName` varchar(255) NOT NULL,
  `productImage` int(11) NOT NULL,
  `productDescription` text NOT NULL,
  `categoryID` int(11) NOT NULL,
  `manufacturerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`productID`, `productName`, `productImage`, `productDescription`, `categoryID`, `manufacturerID`) VALUES
(1, 'iPhone 12 Pro Max', 6, 'Mạnh mẽ, siêu nhanh với chip A14, RAM 6GB, mạng 5G tốc độ cao\nRực rỡ, sắc nét, độ sáng cao - Màn hình OLED cao cấp, Super Retina XDR hỗ trợ HDR10, Dolby Vision\nChụp ảnh siêu đỉnh - Night Mode , thuật toán Deep Fusion, Smart HDR 3, camera LiDar\nBền bỉ v', 1, 1),
(2, 'Samsung Galaxy Z Fold3 5G', 5, 'Thiết kế độc đáo tiện lợi, khẳng định đẳng cấp - Thiết kế gập mở, chất liệu cao cấp, bản lề chắc chắn\r\nMàn hình kép ấn tượng - Màn hình chính 7.9\" và màn hình phụ: 6.23\", 120Hz chuyển động mượt mà\r\nHệ thống camera siêu ấn tượng - Bộ 3 ống kính camera 12MP', 1, 2),
(3, 'Samsung Galaxy Z Fold2 5G', 6, 'Màn hình gập độc đáo, hiển thị liền mạch - Dynamic AMOLED 2X, tần số quét 120Hz, hỗ trợ HDR, Dolby Vision.\r\nHiệu năng vượt trội, kết nối siêu tốc - Snadragon 856 hỗ trợ 5G, RAM 12GB\r\nChụp ảnh, quay video vượt trội - Bộ 3 camera 12MP đỉnh cao, hỗ trợ chụp ', 1, 2),
(4, 'iPad 10.2 2021 4G 256GB', 5, 'Hiệu năng ổn định - Apple A13 Bionic 6 nhân mạnh mẽ\r\nTrải nghiệm hiển thị chất lượng - Màn hình Retina 10.2 inch, hỗ trợ True Tone\r\nSử dụng thoải mái suốt cả ngày - Pin 32.4 Wh (~8600 mAh) sử dụng lâu dài\r\nGiữ trọn mọi khoảnh khắc - Camera trước 12MP và s', 2, 1),
(5, 'Samsung Galaxy Tab S7 FE', 5, 'Máy tính bảng Samsung Galaxy Tab S7 FE – Nhỏ gọn, tiện dụng\r\nTiếp nối thành công của dòng Tab 7, Samsung đang chuẩn bị để cho ra mắt sản phẩm mới mang tên Galaxy Tab S7 FE. Đây được coi là phiên bản rút gọn của Galaxy Tab S7 Plus Lite với sự cắt giảm về h', 2, 2),
(6, 'Xiaomi Pad 5', 5, 'Thiết kế mỏng nhẹ, tinh tế - Thiết kế vuông vức, chỉ dày khoảng 7mm và nặng 500g\r\nTrải nghiệm không gian không giới hạn - Màn hình 11\" IPS LCD, độ phân giải 2K, hỗ trợ HDR10 và 120Hz\r\nHiệu năng vượt trội, thoải mái làm việc - Trang bị chip Snapdragon 860 ', 2, 3),
(7, 'iPad Pro 11 2020 WiFi 128GB', 5, 'Viền màn hình siêu mỏng, hiển thị chất lượng - Tấm nền Liquid Retina 11 inch, tần số quét 120Hz\r\nHiệu năng mạnh mẽ như máy tính - Vi xử lý A12Z Bionic, RAM 6GB\r\nBắt trọn khoảnh khắc nhanh chóng, nâng tầm trải nghiệm AR - Camera kép 12MP + 10MP, cảm biến L', 2, 1),
(8, 'Apple iPad Pro 11 2021 M1 WiFi 128GB', 3, 'Đỉnh cao công nghệ màn hình - Màn hình Liquid Retina, tần số quét 120Hz, True- Tone\r\nHiệu năng như máy tính - Vi xử lý M1, 8GB RAM\r\nChụp ảnh chất lượng, hỗ trợ AR tiên tiến - Camera kép 12MP, cảm biến LiDAR cao cấp\r\nKết nối tốc độ cao - Wifi 6.siêu tốc, s', 2, 1),
(9, 'Samsung Galaxy Tab A7 (2020)', 5, '\r\nSamsung Galaxy Tab A7 10.4 (2020) - Con chip mạnh mẽ, thiết kế mới lạ\r\nHiện nay, ngoài điện thoại di động hay laptop thì những chiếc tablet cũng là thiết bị được rất nhiều người sử dụng và ưa chuộng. Tablet thường sở hữu những tính năng có thể xem như m', 2, 2),
(10, 'Xiaomi Mi Pad 5 Pro', 5, 'Xiaomi Mi Pad 5 Pro – Tablet cấu hình ổn định, giả cả phải chăng\r\nSau Mi Pad 4, hãng điện tử Xiaomi tiếp tục nghiên cứu và cho ra mắt phiên bản kế nhiệm là Xiaomi Mi Pad 5 và gần đây nhất là Mi Pad 5 Pro. Máy tính bảng này sở hữu thiết kế độc đáo cùng hiệ', 2, 3),
(11, 'Apple Watch Series 7 41mm (GPS) Viền nhôm dây cao su ', 5, 'Chức năng màn hình luôn bật giữ cho chức năng xem giờ luôn hoạt động,tiết kiệm pin hơn\r\nThoải mái sử dụng ở hồ bơi hay ngoài trời với chuẩn kháng bụi IP6X ,chống nước đến 50m\r\nĐo nhịp tim,oxy trong máu,theo dõi giấc ngủ cùng nhiều tính năng sức khoẻ tích hợp sẵn\r\nTrải nghiệm âm nhạc với bộ nhớ trong 32GB cùng khả năng kết nối tai nghe bluetooth\r\nCổng sạc Type C,sạc nhanh 45 phút cho 80% pin\r\nHỗ trợ Esim cho phép nghe gọi ngay trên đồng hồ', 3, 1),
(12, 'Đồng hồ thông minh Samsung Galaxy Watch 3 viền thép 41mm', 5, 'Thời lượng pin dài 2 ngày sử dụng,sạc đầy trong 2 giờ\r\nĐiều khiển từ xa các thiết bị như TV,máy lạnh,camera\r\nTheo dõi giấc ngủ,SpO2,VO2\r\nĐịnh vị GPS chính xác,tự động gửi cảnh báo khi người dùng té ngã\r\nMặt kính chống trầy Gorilla Glass,màn hình Amoled', 3, 2),
(13, 'Samsung Galaxy Watch 4', 5, 'Thiết kế cổ điển,màn hình Amoled 1.19 inch hiển thị sắc nét\r\nTheo dõi sức khoẻ với chức năng đo nhịp tim,oxy trong máu.....\r\nPin dùng trong 1.5 ngày,sạc đầy trong 2 giờ\r\nChứng nhận độ bền chuẩn quân đội MIL-STD-810G', 3, 2),
(14, 'Đồng hồ thông minh Xiaomi Mi Watch Lite', 5, '- Nhận cuộc gọi và thông báo từ điện thoại\r\n- Tích hợp GPS bên trong đồng hồ giúp định vị chính xác mà không cần điện thoại\r\n- Khả năng chống nước chuẩn 5ATM giúp hạn chế nước vào khi đi mưa, rửa tay\r\n- Thời gian sử dụng pin lên đến 9 ngày với chế độ sử dụng thông thường,10 giờ khi bật GPS liên tục\r\n- Chăm sóc sức khoẻ và tập luyện tốt hơn với 11 chế độ luyện tập, đo nhịp tim, theo dõi giấc ngủ,...', 3, 3),
(15, 'Đồng hồ thông minh Oppo Watch 41mm dây silicone', 3, '\r\nĐồng hồ thông minh OPPO Watch - Smartwatch đầu tiên của thương hiệu OPPO\r\nOPPO Watch là mẫu đồng hồ thông minh OPPO với thiết kế khá giống Apple Watch. Đồng hồ sở hữu nhiều tính năng theo dõi sức khỏe cùng viên pin cho thời gian sử dụng ấn tượng.\r\n\r\nSmartwatch màn hình 1.91 inch, mặt kính cong\r\nOPPO Watch với thiết kế màn hyperboloid 1.91 inch cùng tỉ lệ màn hình 72.76% cùng mật độ điểm ảnh 326ppi và sự hỗ trợ đầy đủ 100% gam màu DCI-P3 cho hình ảnh sắc nét. Mặt đồng hồ thiết kế hình vuông cùng hệ thống các nút bấm bên cạnh phải. Phần mặt kính trên OPPO Watch được thiết kế cong cho các thao tác vuốt thoải mái.', 3, 4),
(16, 'Apple Watch Series 6 40mm (4G) Viền Nhôm Dây Cao Su', 5, 'Apple Watch Series 6 40mm (4G) – Thiết kế tinh tế, hỗ trợ nhiều tính năng thông minh\r\nVừa mới đây Apple vừa cho ra mắt chiếc đồng hồ thông minh với nhiều tính năng nổi bật và nhiều thay đổi về ngoại hình. Apple Watch Series 6 40mm (4G) hứa hẹn là một trong những chiếc đồng hồ thông minh sẽ gây ra cơn sốt trên thị trường hiện nay. Nếu bạn đang băn khoăn không biết nên chọn mua chiếc đồng hồ thông minh nào để sử dụng thì hãy chọn mua ngay Apple Watch Series 6 40mm (4G).\r\n\r\nKhung kim loại cứng cáp, màn hình Always-On Retina 1.57 inches\r\nĐồng hồ Apple Watch Series 6 40mm (4G) sở hữu thiết kế không khác gì với những người đàn anh trước đây là mấy với phần khung kim loại cứng cáp vẫn được giữ nguyên, tuy nhiên thiết kế có phần chính xác và tỉ mỉ hơn. Từ đó mang lại cho chiếc đồng hồ thông minh này trông vừa vặn và cân đối toát được vẻ tinh tế và sang trọng vốn có.\r\n\r\nĐồng hồ có kích thước 40 x 34 x 10.4 mm và trọng lượng chỉ nặng 39.7g kết hợp cùng với phần dây đeo cao su cho người dùng dễ dàng đeo thoải mái trên tay.', 3, 1),
(17, 'Xiaomi Redmi Note 10 5G', 0, '\r\nĐánh giá Xiaomi Redmi Note 10 5G – Smartphone tầm trung, hiệu năng cao cấp\r\nThuộc phân khúc tầm trung nhưng Redmi Note 10 5G lại sở hữu cấu hình cũng như các tính năng không hề thua kém bất kỳ dòng smartphone cao cấp nào, là một mẫu smartphone có kết nối 5G trong một tầm giá hấp dẫn ở thời điểm hiện tại.\r\n\r\nThiết kế sang thời trang với khung nhựa cao cấp, màu sắc thời trang\r\nXiaomi Redmi Note 10 phiên bản 5G sở hữu một thiết kế bắt mắt và thu hút với phần khung được làm từ nhựa cứng cáp kết hợp với mặt lưng kính sáng bóng, sang trọng. Thiết kế nguyên khối với kích thước 161.8 x 75.3 x 8.9 mm, trọng lượng 190g gọn nhẹ, bỏ túi dễ dàng.', 1, 3),
(18, 'iPhone 13', 5, 'Đánh giá iPhone 13 - Flagship được mong chờ năm 2021\r\nCuối năm 2020, bộ 4 iPhone 12 đã được ra mắt với nhiều cái tiến. Sau đó, mọi sự quan tâm lại đổ dồn vào sản phẩm tiếp theo – iPhone 13. Vậy iP 13 sẽ có những gì, hãy tìm hiểu ngay sau đây.\r\n\r\nThiết kế với nhiều đột phá\r\nVề kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE).\r\n\r\nThì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max', 1, 1),
(19, 'iPhone 13 Pro Max', 5, 'Điện thoại iPhone 13 phiên bản Pro Max chắc chắn sẽ là chiếc smartphone cao cấp được quan tâm nhiều nhất trong năm 2021. Dòng iPhone 13 series vừa được ra mắt vào tháng 9 năm nay với 4 phiên bản: iPhone 13, 13 mini, 13 Pro và 13 Pro Max.\r\n\r\nĐánh giá iPhone 13 Pro Max – Hiệu năng vô đối, camera cực đỉnh\r\niPhone 12 ra mắt cách đây chưa lâu, thì những tin đồn mới nhất về iPhone 13 Pro Max đã khiến bao tín đồ công nghệ ngóng chờ. Cụm camera được nâng cấp, màu sắc mới, đặc biệt là màn hình 120Hz với phần notch được làm nhỏ gọn hơn chính là những điểm làm cho thu hút mọi sự chú ý trong năm nay.\r\n\r\nThiết kế cạnh phẳng sang trọng, nhiều màu sắc nổi bật\r\nDòng iPhone 12 được Apple áp dụng ngôn ngữ thiết kế tương tự iPhone 12 năm ngoái với phần cạnh viền máy được dát phẳng sang trọng cùng bốn góc được làm bo cong nhẹ, đây có thể được xem là một thiết kế hoài cổ từ dòng iPhone 5 trước đó. Vì thế mà iPhone 13 Pro Max nói riêng, cũng như dòng điện thoại iPhone 13 nói chung, cũng sẽ đi theo ngôn ngữ thiết kế này.\r\n\r\nĐiểm thay đổi lớn trên 13 Pro Max có thể là phần nhô của cụm camera. Trong khi đó mặt trước của thiết bị được phủ một lớp Ceramic Shield, loại vật liệu cứng hơn bất kỳ loại kính điện thoại thông minh nào hiện có trên thị trường, giúp bảo vệ màn hình iPhone hiệu quả.', 1, 1),
(20, 'Xiaomi Mi 11 Lite 5G', 5, 'Không gian hiển thị thoải mái, chuyển động mượt - Màn hình tràn viền 6,55 inch, tần số quét 90Hz, HDR10+\r\nHiệu năng mạnh mẽ, ổn định - Chip Snapdragon 780G trên 5nm, 128GB bộ nhớ và 8GB RAM\r\nCamera chụp ảnh ấn tượng - Cụm 3 camera sau 64MP, chụp đêm rõ nét\r\nSạc nhanh, trải nghiệm suốt ngày dài - Dung lượng pin 4250 mAh và hỗ trợ sạc nhanh 33W', 1, 3),
(21, 'OPPO Reno6 5G', 3, 'Thiết kế ấn tượng, màu sắc cá tính - Thiết kế tràn viền, mỏng nhẹ chỉ 182g\r\nTăng tốc kết nối, dẫn đầu xu hướng - Dimensity 900 5G (6 nm) mạnh mẽ, kết nối 5G siêu nhanh\r\nChuyên gia nhiếp ảnh chân dung - Bộ 3 camera lên tới 64 MP, sắc nét, ấn tượng\r\nMàn hình lớn, sắc nét với tốc độ làm mới cao - Màn hình AMOLED 6.43 inch Full HD, 90Hz\r\nDung lượng pin lớn, công nghệ sạc nhanh hiện đại - Viên pin 4300mAh, sạc nhanh 65W', 1, 4),
(22, 'Vsmart Aris Pro', 5, 'Trải nghiệm màn hình tràn viền trọn vẹn - Tấm nền AMOLED, camera ẩn trong màn hình\r\nThiết kế sang chảnh - Mặt lưng chế tác 3D tinh xảo, chuyển màu khi tương tác\r\nĐáp ứng mọi nhu cầu chụp ảnh - Bộ 3 camera 48MP chuyên nghiệp\r\nHiệu năng đỉnh, xử lý mượt mà - Snapdragon 730 8 nhân, RAM 6GB', 1, 7),
(23, 'OnePlus 8T 5G', 5, 'Đánh giá OnePlus 8T 5G - Hiệu năng mạnh mẽ, sạc siêu nhanh\r\nOnePlus 8T 5G là chiếc flagship mới nhất của OnePlus. Máy gây ấn tượng với người dùng không chỉ bởi cấu hình mạnh mẽ mà còn là tốc độ sạc siêu nhanh. Chắc chắn đây là mẫu điện thoại mà rất nhiều người mong muốn có thể sở hữu.\r\n\r\nThiết kế cực sang, chuẩn smartphone cao cấp\r\nOnePlus 8T 5G là chiếc smartphone sở hữu thiết kế cực sang trọng và trẻ trung mang chuẩn phong cách smartphone cao cấp. Mặt lưng của máy được hoàn thiện bằng kính cường lực Corning Gorilla Glass giúp hạn chế được hỏng hóc do va đập hoặc rơi trong quá trình sử dụng.', 1, 9);

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
  `ramromID` int(11) NOT NULL,
  `ramdetail` int(11) NOT NULL,
  `romDetail` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `reviews` (
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
  `price` int(11) NOT NULL,
  `screen` text NOT NULL,
  `fontCamera` text NOT NULL,
  `rearCamera` text NOT NULL,
  `cpu` text NOT NULL,
  `simSlot` text NOT NULL,
  `battery` text NOT NULL,
  `design` text NOT NULL,
  `especially` text NOT NULL,
  `productID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `specifications`
--

INSERT INTO `specifications` (`specificationsID`, `price`, `screen`, `fontCamera`, `rearCamera`, `cpu`, `simSlot`, `battery`, `design`, `especially`, `productID`) VALUES
(1, 39000000, 'Không gập màn: 159.2 x 128.2 x 6.9 mm Gập màn: 159', 'Camera chính: 10 MP, f/2.2, 26mm (wide), 1.22µm Ca', 'Camera chính: 12 MP, f/1.8, 26mm (wide), 1/1.76\", ', 'Octa-core (1x3.09 GHz Kryo 585 & 3x2.42 GHz Kryo 5', 'Nano-SIM', 'Li-Po 4500 mAh Sạc nhanh 25W Sạc nhanh không dây 1', 'Màn hình gập', 'Hỗ trợ 5G, Sạc không dây, Bảo mật vân tay', 3),
(2, 43990000, 'Màn hình chính 7.9\" và màn hình phụ: 6.23\", 120Hz ', 'Camera ẩn dưới màn hình: 4MP, f/1.8', 'Camera góc rộng: 12 MP, f/1.8, 26mm, Dual Pixel PD', 'Snapdragon 888 5G (5 nm), 1 nhân 2.84 GHz, 3 nhân ', '2 SIM (nano‑SIM và eSIM)', 'Li-Po 4400 mAh', 'Khi gập:158.2 x 67.1 x 16mm Khi mở:158.2 x 128.1 x', 'Hỗ trợ 5G, Kháng nước, kháng bụi, Sạc không dây, N', 2),
(3, 37500000, 'Kích thước màn hình	6.7 inches\r\nCông nghệ màn hình	IPS LCD\r\nĐộ phân giải màn hình	1080 x 2400 pixels (FullHD+)\r\nTính năng màn hình	Tần số quét 90Hz, kính cường lực Corning Gorilla Glass 3', '12 MP, f/2.2, 23mm (wide), 1/3.6\" SL 3D, (depth/bi', '12 MP, f/1.6, 26mm (wide), 1.4µm, dual pixel PDAF,', 'Apple A14 Bionic (5 nm)', '2 SIM (nano‑SIM và eSIM)', 'Li-Ion, sạc nhanh 20W, sạc không dây 15W, USB Powe', 'Tai thỏ', 'Hỗ trợ 5G, Kháng nước, kháng bụi, Sạc không dây, N', 1),
(4, 5100000, 'Đường kính mặt	41mm\r\nCông nghệ màn hình	Màn hình luôn bật\r\nRetina\r\nChất liệu mặt	Kính cường lực', 'Không có', 'Không có', '\r\n	WatchOS', 'Không có', 'Thời lượng pin	18 giờ sử dụng\r\nThời gian sạc	45 phút sạc 80%\r\nCổng sạc	USB-C', 'Chống nước	IP6X (Bơi,chống bụi)\r\nHãng sản xuất	Apple Chính hãng', 'Tính năng khác	- Đo điện tâm đồ ECG\r\n- Nghe nhạc trên Apple Music\r\n- Các tính năng luyện tập thể dục\r\n- Thay đổi mặt đồng hồ', 11),
(5, 24990000, 'Kích thước màn hình: 6.1 inches\r\nCông nghệ màn hình: OLED\r\nĐộ phân giải màn hình: 2532 x 1170 pixels\r\nTính năng màn hình: Màn hình super Retina XDR, OLED, 460 ppi, HDR display, công nghệ True Tone Wide color (P3), Haptic Touch, Lớp phủ oleophobic chống bám vân tay\r\nKiểu màn hình: Tai thỏ', 'Camera trước: 12MP, f/2.2', 'Camera sau: Camera góc rộng: 12MP, f/1.6\r\nCamera góc siêu rộng: 12MP, ƒ/2.4', 'Apple A15\r\n', '2 SIM (nano‑SIM và eSIM)', 'Pin: 3,095mAh\r\nCông nghệ sạc: Sạc nhanh 20W, Sạc không dây, Sạc ngược không dây 15W, Sạc pin nhanh, Tiết kiệm pin\r\nCổng sạc: Lightning', 'Kích thước: 146,7 x 71,5 x 7,65mm\r\nTrọng lượng: 174g\r\nChất liệu mặt lưng: Kính\r\nChất liệu khung viền: Kim loại', 'Hỗ trợ 5G, Kháng nước, kháng bụi, Sạc không dây, Nhận diện khuôn mặt', 18),
(6, 33990000, 'Kích thước màn hình: 6.7 inches\r\nCông nghệ màn hình: OLED\r\nĐộ phân giải màn hình: 2778 x 1284 pixel\r\nTính năng màn hình: 120Hz, Super Retina XDR với ProMotion 6.1‑inch, OLED, 458 pp, HDR display, True Tone, Wide color (P3), Haptic Touch\r\nKiểu màn hình: Tai thỏ', '12MP, ƒ/2.2', 'Camera góc rộng: 12MP, ƒ/1.5\r\nCamera góc siêu rộng: 12MP, ƒ/1.8\r\nCamera tele : 12MP, /2.8', 'Apple A15\r\nGPU: GPU 5 nhân', '2 SIM (nano‑SIM và eSIM)', 'Pin: 4,325mAh\r\nCông nghệ sạc Sạc nhanh 20W, Sạc không dây, Sạc ngược không dây 15W, Sạc pin nhanh, Tiết kiệm pin\r\n', 'Kích thước: 160.8 x 78.1 x 7.65mm\r\nTrọng lượng: 240g\r\nChất liệu mặt lưng: Kính\r\nChất liệu khung viền: Kim loại', 'Các loại cảm biến: Cảm biến ánh sáng, Cảm biến áp kế, Cảm biến gia tốc, Cảm biến tiệm cận, Con quay hồi chuyển\r\nTính năng đặc biệt: Hỗ trợ 5G, Kháng nước, kháng bụi, Sạc không dây, Nhận diện khuôn mặt', 19),
(7, 8990000, 'Kích thước màn hình: 6.55 inches\r\nCông nghệ màn hình: AMOLED\r\nĐộ phân giải màn hình: 1080 x 2400 pixels (FullHD+)\r\nTính năng màn hình: Tần số quét 90Hz\r\nHiển thị 1 tỷ màu\r\nHỗ trợ HDR10+\r\nKính cường lực Gorrila Glass 6', '20 MP, f/2.5', 'Camera chính: 64 MP, f/1.8\r\nCamera góc rộng: 8 MP, f/2.2, 119˚\r\nCamera cận cảnh: 5 MP, f/2.4', 'Snapdragon 780G (5 nm)\r\nLoại CPU: 8 nhân (1x2.4 GHz Kryo 670 & 3x2.2 GHz Kryo 670 & 4x1.90 GHz Kryo 670)\r\nGPU: Adreno 642', '2 SIM (Nano-SIM)', 'Pin: Li-Po 4250 mAh\r\nCông nghệ sạc:Sạc nhanh 33W\r\nQucik Charge 4.0\r\nPower Delivery 3.0\r\nCổng sạc: USB Type-C', 'Kích thước: 160.5 x 75.7 x 6.8 mm\r\nTrọng lượng: 159 g\r\nChất liệu mặt lưng: Kính\r\nChất liệu khung viền: Nhựa', 'Cảm biến vân tay: Cảm biến vân tay cạnh bên\r\nCác loại cảm biến: Cảm biến ánh sáng, Cảm biến áp kế, Cảm biến gia tốc, Cảm biến tiệm cận, Con quay hồi chuyển, La bàn\r\nTính năng đặc biệt: Hỗ trợ 5G, Bảo mật vân tay', 20),
(8, 12490000, 'Kích thước màn hình: 6.43 inches\r\nCông nghệ màn hình: AMOLED\r\nĐộ phân giải màn hình: 1080 x 2400 pixels (FullHD+)\r\nTính năng màn hình: Tần số quét 90Hz, 430nits, Corning Gorilla Glass 5', '32 MP, f/2.4', 'Camera góc rộng: 64 MP, f/1.7, PDAF\r\nCamera góc siêu rộng: 8 MP, f/2.2\r\nCamera macro: 2 MP, f/2.4', 'MT6877 Dimensity 900 5G (6 nm)\r\nLoại CPU 2x2.4 GHz Cortex-A78 & 6x2.0 GHz Cortex-A55\r\nGPU PowerVR GM9446', '2 SIM (Nano-SIM)', 'Li-P0 4300 mAh\r\nCông nghệ sạc Sạc nhanh 65W\r\nCổng sạc USB Type-C', 'Kích thước: 156.8 x 72.1 x 7.59 mm\r\nTrọng lượng: 182 g\r\nChất liệu mặt lưng: Kim loại\r\nChất liệu khung viền: Kính', 'Cảm biến vân tay: Cảm biến vân tay trong màn hình\r\nCác loại cảm biến: Cảm biến ánh sáng, Cảm biến áp kế, Cảm biến gia tốc, Con quay hồi chuyển, La bàn\r\nTính năng đặc biệt: Hỗ trợ 5G', 21),
(9, 5490000, 'Độ phân giải màn hình 1080 x 1620 pixels (FullHD+)', 'Camera ẩn dưới màn hình 20MP, công nghệ xử lý hình ảnh AI VCam Kristal', ' 64MP + 8MP + 8MP + 2MP', 'Qualcomm SDM730 Snapdragon 730 (8 nm)\r\nLoại CPU Octa-core (2x2.2 GHz Kryo 470 Gold & 6x1.8 GHz Kryo 470 Silver)\r\nGPU Adreno 618', '2 SIM (Nano-SIM)', '4,000mAh, hỗ trợ sạc nhanh Quick Charge 3.0 18W', 'Đang cập nhật', 'Đang cập nhật', 22),
(10, 15490000, '\r\nKích thước màn hình 6.55 inches\r\nCông nghệ màn hình AMOLED\r\nĐộ phân giải màn hình 1080 x 2400 pixels (FullHD+)\r\nTính năng màn hình Tần số quét 120Hz, kính cường lực Corning Gorilla Glass 5', ' 16 MP', 'Chính 48 MP & Phụ 16 MP, 5 MP, 2 MP', ' Snapdragon 865\r\nLoại CPU 1 nhân 2.84 GHz, 3 nhân 2.42 GHz & 4 nhân 1.8 GHz\r\nGPU Adreno 6', ' 2 SIM (Nano-SIM)', '\r\nPin 4500 mAh\r\nCông nghệ sạc Sạc theo máy 18W, sạc nhanh tối đa 65W\r\nCổng sạc USB Type-C', 'Kiểu màn hình Đục lỗ (Nốt ruồi)', 'Cảm biến vân tay Cảm biến vân tay trong màn hình\r\nCác loại cảm biến Cảm biến ánh sáng, Cảm biến áp kế, Cảm biến gia tốc, Cảm biến tiệm cận, Con quay hồi chuyển\r\nTính năng đặc biệt Hỗ trợ 5G, Kháng nước, kháng bụi, Nhận diện khuôn mặt, Bảo mật vân tay', 23),
(11, 9990000, 'Kích thước màn hình 10.2 inches\r\nCông nghệ màn hình Liquid Retina\r\nTính năng màn hình Tấm nền IPS, công nghệ True Tone, 500 nits', '12MP góc siêu rộng 122 độ', 'Camera góc siêu rộng 8MP', 'A13 Bionic\r\nGPU Apple GPU 4 nhân', 'Không có', 'Công nghệ sạc Sạc nhanh 20W\r\nCổng sạc Lightning', 'Kích thước 250.6 x 174.1 x 7.5 mm\r\nTrọng lượng 498g', '\r\nCác loại cảm biến Cảm biến ánh sáng, Cảm biến áp kế, Cảm biến tiệm cận, Con quay hồi chuyển', 4),
(12, 16200000, 'Kích thước màn hình 11 inches\r\nĐộ phân giải màn hình 2560 x 1600 pixel (2K)', '8 MP góc rộng,khẩu độ f/2.0', ' 13 MP góc rộng,khẩu độ f/2.0\r\n5 MP góc siêu rộng f/2.2', 'Chipset Qualcomm SM8250 Snapdragon 865+ (7 nm+)\r\nLoại CPU Tám nhân Kryo 585\r\n1 nhân 3.09 GHz\r\n3 nhân 2.42 GHz\r\n4 nhân 1.8 GHz\r\nGPU Adreno 650', ' Nano-SIM', ' Pin Li-Po 8000 mAh\r\nSạc nhanh 45W', 'Kích thước 253.8 x 165.3 x 6.3 mm\r\nTrọng lượng 500 g', '', 5),
(13, 8990000, 'Kích thước màn hình 11 inches\r\nCông nghệ màn hình IPS LCD\r\nĐộ phân giải màn hình 2560 x 1600 pixels (2K)\r\nTính năng màn hình 120Hz, HDR10, Dolby Vision', '8 MP, f/2.0', '13 MP, f/2.0', 'Chipset Qualcomm Snapdragon 860 (7 nm)\r\nLoại CPU Octa-core (1x2.96 GHz Kryo 485 Gold & 3x2.42 GHz Kryo 485 Gold & 4x1.78 GHz Kryo 485 Silver)\r\nGPU Adreno 640', 'Đang câp nhạt', 'Pin Li-Po 8720 mAh\r\nCông nghệ sạc Sạc nhanh 33W\r\nCổng sạc USB Type-C', 'Chất liệu mặt lưng Nhựa\r\nChất liệu khung viền Kim loại', 'Cảm biến vân tay Không\r\nCác loại cảm biến Cảm biến ánh sáng, Cảm biến gia tốc, Cảm biến tiệm cận, La bàn', 6),
(14, 22990000, 'Kích thước màn hình 11 inches\r\nCông nghệ màn hình IPS LCD\r\nĐộ phân giải màn hình 2048 x 2732 pixels\r\nTính năng màn hình Tần số quét 120Hz\r\nTỉ lệ tương phản 1000000:1\r\nĐộ sáng 600 nit\r\nDải màu P3\r\nCông nghệ True-Tone', '12MP góc siêu rộng 122 độ', '12MP góc rộng\r\n10MP góc siêu rộng', 'Chipset Apple M1 8 nhân\r\nLoại CPU 8 nhân CPU\r\nGPU 8 nhân GPU', 'không có', 'Pin 7538mAh\r\nCông nghệ sạc Sạc nhanh 18W\r\nCổng sạc USB Type-C', 'Kích thước 247.6 x 178.5 x 5.9 mm\r\nTrọng lượng 466 g\r\nChất liệu mặt lưng Kim loại\r\nChất liệu khung viền Kim loại', 'Các loại cảm biến Cảm biến ánh sáng, Cảm biến áp kế, Cảm biến gia tốc, Cảm biến tiệm cận, Con quay hồi chuyển, La bàn', 8),
(15, 21000000, 'Kích thước màn hình 11 inches\r\nĐộ phân giải màn hình 1668 x 2388 pixel\r\nTính năng màn hình Tầng số quét 120Hz\r\nĐộ sáng 600 nits', ' 7 MP khẩu độ f/2.2', '12 MP góc rộng,khẩu độ f/1.8\r\n10 MP góc siêu rộng, f/2.4', 'Chipset Apple A12Z Bionic\r\nLoại CPU 4 nhân 2.5GHz\r\n4 nhân 1.6GHz\r\nGPU Apple GPU', 'Không có', ' Khoảng 7600 mAh\r\nCông nghệ sạc Sạc nhanh 18W\r\nSạc ngược cho thiết bị khác\r\nCổng sạc USB Type-C', 'Kích thước Dài 247.6 mm - Ngang 178.5 mm - Dày 5.9 mm\r\nTrọng lượng 471 g (Wi-Fi)\r\nChất liệu mặt lưng Kim loại\r\nChất liệu khung viền Kim loại', 'Các loại cảm biến Cảm biến ánh sáng, Con quay hồi chuyển', 7),
(16, 7550000, 'Kích thước màn hình 10.4 inches\r\nCông nghệ màn hình TFT LCD\r\nĐộ phân giải màn hình 1200 x 2000 pixels', ' 5 MP', '8 MP, AF', 'Chipset Qualcomm SM6115 Snapdragon 662 (11 nm)\r\nLoại CPU 4 nhân 2 GHz\r\n4 nhân 1.8 GHz\r\nGPU Adreno 610', ' Nano-SIM', 'Pin Li-Po 7040 mAh\r\nCông nghệ sạc Sạc 10W\r\nCổng sạc USB Type-C', '\r\nKích thước Dài 247.6 mm - Ngang 157.4 mm - Dày 7 mm\r\nTrọng lượng 477gr\r\nChất liệu mặt lưng Kim loại', 'Các loại cảm biến Cảm biến ánh sáng, Con quay hồi chuyển', 9),
(17, 5400000, 'Đường kính mặt	45 mm\r\nĐộ phân giải	360 x 360 pixels\r\nKích thước màn hình	1.4 inch\r\nCông nghệ màn hình	SUPER AMOLED\r\nChất liệu mặt	Kính cường lực Gorrilla Glass Dx+', 'Không có', 'không có', 'Tizen OS', 'Không có', 'Thời lượng pin	2 ngày\r\nThời gian sạc	2 giờ\r\nCổng sạc	Đế sạc nam châm', 'Chất liệu viền	Thép\r\nChất liệu dây	Da\r\nBề rộng dây	20 - 22mm\r\nCó thể thay dây	Có', 'Tính năng	Chế độ luyện tập, Có định vị GPS, Hiển thị thông báo điện thoại, Kết nối tai nghe, Màn hình luôn hiển thị, Nghe gọi trên đồng hồ, Phát nhạc trên đồng hồ, Theo dõi giấc ngủ, Tính lượng calories tiêu thụ, Tính quãng đường chạy, Tùy chỉnh mặt đồng hồ, Đếm bước chân, Điều khiển chơi nhạc, Đo nhịp tim, Đo nồng độ oxy trong máu', 12),
(18, 6590000, 'Đường kính mặt	44mm\r\nĐộ phân giải	450 x 450 pixels\r\nKích thước màn hình	1.4 inches\r\nCông nghệ màn hình	Super AMOLED\r\nAlways on Display (màn hình luôn bật)\r\nChất liệu mặt	Corning Gorilla Glass DX', 'Không có', 'Không có', '	WearOS', 'Không có', 'Thời lượng pin	1.5 ngày\r\nThời gian sạc	2 giờ\r\nCổng sạc	Sạc không dây', 'Chất liệu viền	Nhôm\r\nChất liệu dây	Silicone\r\nCó thể thay dây	Có', 'Tính năng	Đo oxy trong máu\r\nĐo nhịp tim\r\nTheo dõi lượng cơ bắp,mỡ cơ thể\r\n90 bài tập thể thao', 13),
(19, 0, 'Độ phân giải	448 x 368 pixels\r\nKích thước màn hình	1.78 inch\r\nCông nghệ màn hình	Retina LTPO OLED, 16 triệu màu,mặt lưng kính Sapphire, 3D Touch, độ sáng 1000 nits', 'Không có', 'Không có', 'WatchOS', 'Không có', '	- Thời lượng pin 18 giờ\r\n- Sạc đầy trong 1.5 giờ', 'Kích thước	40 x 34 x 10.4 mm\r\nTrọng lượng	39.', 'Tính năng	Thay đổi mặt đồng hồ\r\n- Tự động điều chỉnh độ sáng màn hình theo môi trường\r\n- Xem tin nhắn, thông báo, điều khiển phát nhạc trên điện', 14),
(20, 1190000, 'Đường kính mặt	41mm\r\nĐộ phân giải	320x320 pixel\r\nKích thước màn hình	1.4 inch\r\nCông nghệ màn hình	TFT LCD\r\nChất liệu mặt	Kính cường lực', 'Không có', 'Không có', 'Đang cập nhật', 'Không có', 'Thời lượng pin	9 ngày ở chế độ thông thường\r\n10 giờ ở chế độ GPS\r\nCổng sạc	Sạc châm', 'Chất liệu viền	Nhôm\r\nChất liệu dây	Silicone\r\nCó thể thay dây	Có', 'Tính năng	Thay đổi mặt đồng hồ\r\n- Tự động điều chỉnh độ sáng màn hình theo môi trường\r\n- Xem tin nhắn, thông báo, điều khiển phát nhạc trên điện', 15),
(21, 4950000, 'Kích thước màn hình	6.5 inches\r\nCông nghệ màn hình	IPS LCD\r\nĐộ phân giải màn hình	1080 x 2400 pixels (FullHD+)\r\nTính năng màn hình	Tần số quét 90Hz, kính cường lực Corning Gorilla Glass 3', '	8 MP', 'Camera chính: 48 MP\r\nCamera cận cảnh: 2 MP\r\nCamera xóa phông: 2 MP', 'Chipset	Dimensity 700 5G (7 nm)\r\nLoại CPU	8 nhân (4x2.2 GHz Cortex-A76 & 4x2.0 GHz Cortex-A55)\r\nGPU	Mali-G57 MC2', '2 SIM (Nano-SIM)', 'Pin	Li-Po 5000 mAh\r\nCông nghệ sạc	Sạc nhanh 18W\r\nCổng sạc	USB Type-C', 'Kích thước	161.8 x 75.3 x 8.9 mm\r\nTrọng lượng	190 g\r\nChất liệu mặt lưng	Nhựa\r\nChất liệu khung viền	Nhựa', 'Cảm biến vân tay	Cảm biến vân tay cạnh bên\r\nCác loại cảm biến	Cảm biến ánh sáng, Cảm biến áp kế, Cảm biến gia tốc, Cảm biến tiệm cận, Con quay hồi chuyển, La bàn\r\nTính năng đặc biệt	Hỗ trợ 5G, Bảo mật vân tay', 17),
(22, 11900000, 'Độ phân giải	448 x 368 pixels\r\nKích thước màn hình	1.78 inch\r\nCông nghệ màn hình	Retina LTPO OLED, 16 triệu màu,mặt lưng kính Sapphire, 3D Touch, độ sáng 1000 nits', 'Không có', 'Không có', 'WatchOS', 'Không có', '- Thời lượng pin 18 giờ\r\n- Sạc đầy trong 1.5 giờ', 'Kích thước	40 x 34 x 10.4 mm\r\nTrọng lượng	39.', 'Tính năng khác	- Đo điện tâm đồ ECG\r\n- Nghe nhạc trên Apple Music\r\n- Các tính năng luyện tập thể dục\r\n- Thay đổi mặt đồng hồ', 16),
(23, 17990000, 'Kích thước màn hình	11 inches\r\nCông nghệ màn hình	IPS LCD\r\nĐộ phân giải màn hình	2560 x 1600 pixels (2K)\r\nTính năng màn hình	120Hz, HDR10, Dolby Vision', '8 MP', 'Chính 50 MP & Phụ 5 MP', 'Chipset	Snapdragon 870 8 nhân\r\nLoại CPU	1 nhân 3.2 GHz, 3 nhân 2.42 GHz & 4 nhân 1.8 GHz\r\nGPU	Adreno 650', 'Nano-SIM', 'Pin	8600 mAh\r\nCông nghệ sạc	Sạc pin nhanh, hỗ trợ tối đa 67W\r\nCổng sạc	USB Type-C', 'Kích thước	254.7 x 166.3 x 6.9 mm\r\nTrọng lượng	515 g\r\nChất liệu mặt lưng	Kim loại\r\nChất liệu khung viền	Kim loại', 'Dâng cập nhật', 10);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specifications_has_color`
--

CREATE TABLE `specifications_has_color` (
  `specificationsID` int(11) NOT NULL,
  `colorID` int(11) NOT NULL,
  `priceColor` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `specifications_has_color`
--

INSERT INTO `specifications_has_color` (`specificationsID`, `colorID`, `priceColor`) VALUES
(1, 1, 510000),
(1, 2, 500000),
(1, 3, 500000),
(1, 4, 300000),
(1, 6, 500000),
(1, 9, 500000),
(2, 2, 500000),
(2, 3, 500000),
(3, 2, 500000),
(3, 3, 500000),
(3, 4, 300000),
(4, 2, 500000),
(4, 3, 500000),
(4, 4, 300000),
(5, 2, 500000),
(5, 3, 500000),
(5, 9, 500000),
(6, 2, 500000),
(6, 3, 500000),
(6, 10, 500000),
(7, 3, 500000),
(7, 5, 500000),
(7, 9, 500000),
(8, 2, 500000),
(8, 3, 500000),
(8, 6, 500000),
(9, 1, 510000),
(9, 2, 500000),
(9, 3, 500000),
(10, 4, 300000),
(10, 5, 500000),
(10, 6, 500000),
(11, 7, 500000),
(11, 9, 500000),
(11, 10, 500000),
(12, 2, 500000),
(12, 6, 500000),
(13, 9, 500000),
(13, 10, 500000),
(14, 2, 500000),
(14, 3, 500000),
(15, 1, 510000),
(15, 2, 500000),
(16, 3, 500000),
(16, 4, 300000),
(17, 1, 510000),
(17, 4, 300000),
(18, 5, 500000),
(18, 7, 500000),
(19, 7, 500000),
(19, 9, 500000),
(20, 1, 510000),
(20, 8, 500000),
(20, 10, 500000),
(21, 3, 500000),
(21, 7, 500000),
(22, 2, 500000),
(22, 3, 500000),
(23, 2, 500000),
(23, 3, 500000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `specifications_has_ramrom`
--

CREATE TABLE `specifications_has_ramrom` (
  `specificationsID` int(11) NOT NULL,
  `ramRomID` int(11) NOT NULL,
  `priceRamRom` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `specifications_has_ramrom`
--

INSERT INTO `specifications_has_ramrom` (`specificationsID`, `ramRomID`, `priceRamRom`) VALUES
(1, 1, 500000),
(1, 6, 520000),
(1, 7, 540000),
(1, 12, 560000),
(1, 14, 560000),
(2, 1, 500000),
(2, 6, 520000),
(2, 7, 540000),
(2, 12, 560000),
(3, 1, 500000),
(3, 6, 520000),
(3, 7, 540000),
(3, 12, 560000),
(5, 1, 500000),
(5, 6, 520000),
(5, 7, 540000),
(5, 12, 560000),
(6, 1, 500000),
(6, 6, 520000),
(6, 7, 540000),
(6, 12, 560000),
(7, 1, 500000),
(7, 6, 520000),
(7, 7, 540000),
(7, 12, 560000),
(8, 1, 500000),
(8, 6, 520000),
(8, 7, 540000),
(8, 12, 560000),
(9, 1, 500000),
(9, 6, 520000),
(9, 7, 540000),
(9, 12, 560000),
(10, 1, 500000),
(10, 6, 520000),
(10, 7, 540000),
(10, 8, 560000),
(10, 12, 560000),
(11, 1, 500000),
(11, 6, 520000),
(11, 7, 540000),
(11, 12, 560000),
(12, 1, 500000),
(12, 6, 520000),
(12, 7, 540000),
(12, 12, 560000),
(13, 1, 500000),
(13, 6, 520000),
(13, 7, 540000),
(13, 12, 560000),
(14, 1, 500000),
(14, 6, 520000),
(14, 7, 540000),
(14, 12, 560000),
(15, 1, 500000),
(15, 6, 520000),
(15, 7, 540000),
(15, 12, 560000),
(16, 1, 500000),
(16, 6, 520000),
(16, 7, 540000),
(16, 12, 560000),
(21, 1, 500000),
(21, 6, 520000),
(21, 8, 560000),
(21, 12, 560000),
(23, 1, 500000),
(23, 6, 520000),
(23, 7, 540000),
(23, 12, 560000);

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
(0, 'Nguyễn Văn An', '84987191143', 'an123', 'akjzakj@gmail.com', '', 1),
(3, 'Lê Quang Thọ1', '0973271990', 'tho123a', 'thole@gmail.com', '', 0),
(4, 'Lê Quang Thọ2', '0973271298', 'tho123b', 'thole@gmail.com', '', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

CREATE TABLE `voucher` (
  `voucherID` int(11) NOT NULL,
  `beginDate` datetime NOT NULL,
  `endDate` datetime NOT NULL,
  `voucherValue` varchar(50) NOT NULL,
  `voucherImage` int(11) NOT NULL,
  `quantily` int(11) NOT NULL,
  `maxValue` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `voucher`
--

INSERT INTO `voucher` (`voucherID`, `beginDate`, `endDate`, `voucherValue`, `voucherImage`, `quantily`, `maxValue`) VALUES
(1, '2021-10-21 21:30:51', '2021-12-01 21:30:51', '0,5', 0, 10, 5000000),
(2, '2021-10-21 21:30:51', '2021-11-30 21:30:51', '0,2', 0, 5, 2000000);

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
  ADD PRIMARY KEY (`billdetailID`,`specificationsID`,`billID`),
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
  ADD PRIMARY KEY (`productID`,`categoryID`,`manufacturerID`),
  ADD KEY `fk_Product_Category1` (`categoryID`),
  ADD KEY `fk_Product_Manufacturer1` (`manufacturerID`);

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
  ADD PRIMARY KEY (`ramromID`);

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
  ADD PRIMARY KEY (`specificationsID`,`productID`),
  ADD KEY `fk_specifications_Product1` (`productID`);

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
-- AUTO_INCREMENT cho bảng `billdetail`
--
ALTER TABLE `billdetail`
  MODIFY `billdetailID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `category`
--
ALTER TABLE `category`
  MODIFY `categoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `color`
--
ALTER TABLE `color`
  MODIFY `colorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT cho bảng `manufacturer`
--
ALTER TABLE `manufacturer`
  MODIFY `manufacturerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT cho bảng `ramrom`
--
ALTER TABLE `ramrom`
  MODIFY `ramromID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `specifications`
--
ALTER TABLE `specifications`
  MODIFY `specificationsID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucherID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

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


--
-- Siêu dữ liệu
--
USE `phpmyadmin`;

--
-- Siêu dữ liệu cho bảng bill
--

--
-- Siêu dữ liệu cho bảng billdetail
--

--
-- Siêu dữ liệu cho bảng cart
--

--
-- Siêu dữ liệu cho bảng category
--

--
-- Siêu dữ liệu cho bảng color
--

--
-- Siêu dữ liệu cho bảng manufacturer
--

--
-- Đang đổ dữ liệu cho bảng `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'db_app', 'manufacturer', '{\"CREATE_TIME\":\"2021-10-25 00:55:49\",\"col_order\":[0,2,1],\"col_visib\":[1,1,1]}', '2021-10-29 09:45:32');

--
-- Siêu dữ liệu cho bảng product
--

--
-- Đang đổ dữ liệu cho bảng `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'db_app', 'product', '{\"sorted_col\":\"`product`.`categoryID` ASC\"}', '2021-10-29 19:23:16');

--
-- Siêu dữ liệu cho bảng product_has_voucher
--

--
-- Siêu dữ liệu cho bảng ramrom
--

--
-- Siêu dữ liệu cho bảng reviews
--

--
-- Siêu dữ liệu cho bảng specifications
--

--
-- Đang đổ dữ liệu cho bảng `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'db_app', 'specifications', '{\"sorted_col\":\"`specifications`.`productID` ASC\"}', '2021-10-29 19:32:15');

--
-- Siêu dữ liệu cho bảng specifications_has_color
--

--
-- Đang đổ dữ liệu cho bảng `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'db_app', 'specifications_has_color', '{\"sorted_col\":\"`specifications_has_color`.`colorID` ASC\"}', '2021-10-30 00:37:17');

--
-- Siêu dữ liệu cho bảng specifications_has_ramrom
--

--
-- Đang đổ dữ liệu cho bảng `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'db_app', 'specifications_has_ramrom', '{\"sorted_col\":\"`ramRomID` ASC\"}', '2021-10-30 00:31:11');

--
-- Siêu dữ liệu cho bảng user
--

--
-- Siêu dữ liệu cho bảng voucher
--

--
-- Siêu dữ liệu cho cơ sở dữ liệu db_app
--

--
-- Đang đổ dữ liệu cho bảng `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_descr`) VALUES
('db_app', 'db_1');

SET @LAST_PAGE = LAST_INSERT_ID();

--
-- Đang đổ dữ liệu cho bảng `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('db_app', 'bill', @LAST_PAGE, 848, 47),
('db_app', 'billdetail', @LAST_PAGE, 1348, 111),
('db_app', 'cart', @LAST_PAGE, 792, 314),
('db_app', 'category', @LAST_PAGE, 567, 691),
('db_app', 'color', @LAST_PAGE, 1566, 546),
('db_app', 'manufacturer', @LAST_PAGE, 562, 553),
('db_app', 'product', @LAST_PAGE, 176, 343),
('db_app', 'product_has_voucher', @LAST_PAGE, 148, 565),
('db_app', 'ramrom', @LAST_PAGE, 1626, 696),
('db_app', 'reviews', @LAST_PAGE, 417, 206),
('db_app', 'specifications', @LAST_PAGE, 1025, 489),
('db_app', 'specifications_has_color', @LAST_PAGE, 1274, 382),
('db_app', 'specifications_has_ramrom', @LAST_PAGE, 1314, 682),
('db_app', 'user', @LAST_PAGE, 277, 49),
('db_app', 'voucher', @LAST_PAGE, 278, 697);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
