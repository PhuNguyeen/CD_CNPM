-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th10 30, 2021 lúc 07:44 PM
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
(8, 'Apple iPad Pro 11 2021 M1 WiFi 128GB', 5, 'Đỉnh cao công nghệ màn hình - Màn hình Liquid Retina, tần số quét 120Hz, True- Tone\r\nHiệu năng như máy tính - Vi xử lý M1, 8GB RAM\r\nChụp ảnh chất lượng, hỗ trợ AR tiên tiến - Camera kép 12MP, cảm biến LiDAR cao cấp\r\nKết nối tốc độ cao - Wifi 6.siêu tốc, s', 2, 1),
(9, 'Samsung Galaxy Tab A7 (2020)', 5, '\r\nSamsung Galaxy Tab A7 10.4 (2020) - Con chip mạnh mẽ, thiết kế mới lạ\r\nHiện nay, ngoài điện thoại di động hay laptop thì những chiếc tablet cũng là thiết bị được rất nhiều người sử dụng và ưa chuộng. Tablet thường sở hữu những tính năng có thể xem như m', 2, 2),
(10, 'Xiaomi Mi Pad 5 Pro', 5, 'Xiaomi Mi Pad 5 Pro – Tablet cấu hình ổn định, giả cả phải chăng\r\nSau Mi Pad 4, hãng điện tử Xiaomi tiếp tục nghiên cứu và cho ra mắt phiên bản kế nhiệm là Xiaomi Mi Pad 5 và gần đây nhất là Mi Pad 5 Pro. Máy tính bảng này sở hữu thiết kế độc đáo cùng hiệ', 2, 3),
(11, 'Apple Watch Series 7 41mm (GPS) Viền nhôm dây cao su ', 5, 'Chức năng màn hình luôn bật giữ cho chức năng xem giờ luôn hoạt động,tiết kiệm pin hơn\r\nThoải mái sử dụng ở hồ bơi hay ngoài trời với chuẩn kháng bụi IP6X ,chống nước đến 50m\r\nĐo nhịp tim,oxy trong máu,theo dõi giấc ngủ cùng nhiều tính năng sức khoẻ tích hợp sẵn\r\nTrải nghiệm âm nhạc với bộ nhớ trong 32GB cùng khả năng kết nối tai nghe bluetooth\r\nCổng sạc Type C,sạc nhanh 45 phút cho 80% pin\r\nHỗ trợ Esim cho phép nghe gọi ngay trên đồng hồ', 3, 1),
(12, 'Đồng hồ thông minh Samsung Galaxy Watch 3 viền thép 41mm', 5, 'Thời lượng pin dài 2 ngày sử dụng,sạc đầy trong 2 giờ\r\nĐiều khiển từ xa các thiết bị như TV,máy lạnh,camera\r\nTheo dõi giấc ngủ,SpO2,VO2\r\nĐịnh vị GPS chính xác,tự động gửi cảnh báo khi người dùng té ngã\r\nMặt kính chống trầy Gorilla Glass,màn hình Amoled', 3, 2),
(13, 'Samsung Galaxy Watch 4', 5, 'Thiết kế cổ điển,màn hình Amoled 1.19 inch hiển thị sắc nét\r\nTheo dõi sức khoẻ với chức năng đo nhịp tim,oxy trong máu.....\r\nPin dùng trong 1.5 ngày,sạc đầy trong 2 giờ\r\nChứng nhận độ bền chuẩn quân đội MIL-STD-810G', 3, 2),
(14, 'Đồng hồ thông minh Xiaomi Mi Watch Lite', 5, '- Nhận cuộc gọi và thông báo từ điện thoại\r\n- Tích hợp GPS bên trong đồng hồ giúp định vị chính xác mà không cần điện thoại\r\n- Khả năng chống nước chuẩn 5ATM giúp hạn chế nước vào khi đi mưa, rửa tay\r\n- Thời gian sử dụng pin lên đến 9 ngày với chế độ sử dụng thông thường,10 giờ khi bật GPS liên tục\r\n- Chăm sóc sức khoẻ và tập luyện tốt hơn với 11 chế độ luyện tập, đo nhịp tim, theo dõi giấc ngủ,...', 3, 3),
(15, 'Đồng hồ thông minh Oppo Watch 41mm dây silicone', 5, '\r\nĐồng hồ thông minh OPPO Watch - Smartwatch đầu tiên của thương hiệu OPPO\r\nOPPO Watch là mẫu đồng hồ thông minh OPPO với thiết kế khá giống Apple Watch. Đồng hồ sở hữu nhiều tính năng theo dõi sức khỏe cùng viên pin cho thời gian sử dụng ấn tượng.\r\n\r\nSmartwatch màn hình 1.91 inch, mặt kính cong\r\nOPPO Watch với thiết kế màn hyperboloid 1.91 inch cùng tỉ lệ màn hình 72.76% cùng mật độ điểm ảnh 326ppi và sự hỗ trợ đầy đủ 100% gam màu DCI-P3 cho hình ảnh sắc nét. Mặt đồng hồ thiết kế hình vuông cùng hệ thống các nút bấm bên cạnh phải. Phần mặt kính trên OPPO Watch được thiết kế cong cho các thao tác vuốt thoải mái.', 3, 4),
(16, 'Apple Watch Series 6 40mm (4G) Viền Nhôm Dây Cao Su', 5, 'Apple Watch Series 6 40mm (4G) – Thiết kế tinh tế, hỗ trợ nhiều tính năng thông minh\r\nVừa mới đây Apple vừa cho ra mắt chiếc đồng hồ thông minh với nhiều tính năng nổi bật và nhiều thay đổi về ngoại hình. Apple Watch Series 6 40mm (4G) hứa hẹn là một trong những chiếc đồng hồ thông minh sẽ gây ra cơn sốt trên thị trường hiện nay. Nếu bạn đang băn khoăn không biết nên chọn mua chiếc đồng hồ thông minh nào để sử dụng thì hãy chọn mua ngay Apple Watch Series 6 40mm (4G).\r\n\r\nKhung kim loại cứng cáp, màn hình Always-On Retina 1.57 inches\r\nĐồng hồ Apple Watch Series 6 40mm (4G) sở hữu thiết kế không khác gì với những người đàn anh trước đây là mấy với phần khung kim loại cứng cáp vẫn được giữ nguyên, tuy nhiên thiết kế có phần chính xác và tỉ mỉ hơn. Từ đó mang lại cho chiếc đồng hồ thông minh này trông vừa vặn và cân đối toát được vẻ tinh tế và sang trọng vốn có.\r\n\r\nĐồng hồ có kích thước 40 x 34 x 10.4 mm và trọng lượng chỉ nặng 39.7g kết hợp cùng với phần dây đeo cao su cho người dùng dễ dàng đeo thoải mái trên tay.', 3, 1),
(17, 'Xiaomi Redmi Note 10 5G', 5, '\r\nĐánh giá Xiaomi Redmi Note 10 5G – Smartphone tầm trung, hiệu năng cao cấp\r\nThuộc phân khúc tầm trung nhưng Redmi Note 10 5G lại sở hữu cấu hình cũng như các tính năng không hề thua kém bất kỳ dòng smartphone cao cấp nào, là một mẫu smartphone có kết nối 5G trong một tầm giá hấp dẫn ở thời điểm hiện tại.\r\n\r\nThiết kế sang thời trang với khung nhựa cao cấp, màu sắc thời trang\r\nXiaomi Redmi Note 10 phiên bản 5G sở hữu một thiết kế bắt mắt và thu hút với phần khung được làm từ nhựa cứng cáp kết hợp với mặt lưng kính sáng bóng, sang trọng. Thiết kế nguyên khối với kích thước 161.8 x 75.3 x 8.9 mm, trọng lượng 190g gọn nhẹ, bỏ túi dễ dàng.', 1, 3),
(18, 'iPhone 13', 5, 'Đánh giá iPhone 13 - Flagship được mong chờ năm 2021\r\nCuối năm 2020, bộ 4 iPhone 12 đã được ra mắt với nhiều cái tiến. Sau đó, mọi sự quan tâm lại đổ dồn vào sản phẩm tiếp theo – iPhone 13. Vậy iP 13 sẽ có những gì, hãy tìm hiểu ngay sau đây.\r\n\r\nThiết kế với nhiều đột phá\r\nVề kích thước, iPhone 13 sẽ có 4 phiên bản khác nhau và kích thước không đổi so với series iPhone 12 hiện tại. Nếu iPhone 12 có sự thay đổi trong thiết kế từ góc cạnh bo tròn (Thiết kế được duy trì từ thời iPhone 6 đến iPhone 11 Pro Max) sang thiết kế vuông vắn (đã từng có mặt trên iPhone 4 đến iPhone 5S, SE).\r\n\r\nThì trên điện thoại iPhone 13 vẫn được duy trì một thiết kế tương tự. Máy vẫn có phiên bản khung viền thép, một số phiên bản khung nhôm cùng mặt lưng kính. Tương tự năm ngoái, Apple cũng sẽ cho ra mắt 4 phiên bản là iPhone 13, 13 mini, 13 Pro và 13 Pro Max', 1, 1),
(19, 'iPhone 13 Pro Max', 5, 'Điện thoại iPhone 13 phiên bản Pro Max chắc chắn sẽ là chiếc smartphone cao cấp được quan tâm nhiều nhất trong năm 2021. Dòng iPhone 13 series vừa được ra mắt vào tháng 9 năm nay với 4 phiên bản: iPhone 13, 13 mini, 13 Pro và 13 Pro Max.\r\n\r\nĐánh giá iPhone 13 Pro Max – Hiệu năng vô đối, camera cực đỉnh\r\niPhone 12 ra mắt cách đây chưa lâu, thì những tin đồn mới nhất về iPhone 13 Pro Max đã khiến bao tín đồ công nghệ ngóng chờ. Cụm camera được nâng cấp, màu sắc mới, đặc biệt là màn hình 120Hz với phần notch được làm nhỏ gọn hơn chính là những điểm làm cho thu hút mọi sự chú ý trong năm nay.\r\n\r\nThiết kế cạnh phẳng sang trọng, nhiều màu sắc nổi bật\r\nDòng iPhone 12 được Apple áp dụng ngôn ngữ thiết kế tương tự iPhone 12 năm ngoái với phần cạnh viền máy được dát phẳng sang trọng cùng bốn góc được làm bo cong nhẹ, đây có thể được xem là một thiết kế hoài cổ từ dòng iPhone 5 trước đó. Vì thế mà iPhone 13 Pro Max nói riêng, cũng như dòng điện thoại iPhone 13 nói chung, cũng sẽ đi theo ngôn ngữ thiết kế này.\r\n\r\nĐiểm thay đổi lớn trên 13 Pro Max có thể là phần nhô của cụm camera. Trong khi đó mặt trước của thiết bị được phủ một lớp Ceramic Shield, loại vật liệu cứng hơn bất kỳ loại kính điện thoại thông minh nào hiện có trên thị trường, giúp bảo vệ màn hình iPhone hiệu quả.', 1, 1),
(20, 'Xiaomi Mi 11 Lite 5G', 5, 'Không gian hiển thị thoải mái, chuyển động mượt - Màn hình tràn viền 6,55 inch, tần số quét 90Hz, HDR10+\r\nHiệu năng mạnh mẽ, ổn định - Chip Snapdragon 780G trên 5nm, 128GB bộ nhớ và 8GB RAM\r\nCamera chụp ảnh ấn tượng - Cụm 3 camera sau 64MP, chụp đêm rõ nét\r\nSạc nhanh, trải nghiệm suốt ngày dài - Dung lượng pin 4250 mAh và hỗ trợ sạc nhanh 33W', 1, 3),
(21, 'OPPO Reno6 5G', 5, 'Thiết kế ấn tượng, màu sắc cá tính - Thiết kế tràn viền, mỏng nhẹ chỉ 182g\r\nTăng tốc kết nối, dẫn đầu xu hướng - Dimensity 900 5G (6 nm) mạnh mẽ, kết nối 5G siêu nhanh\r\nChuyên gia nhiếp ảnh chân dung - Bộ 3 camera lên tới 64 MP, sắc nét, ấn tượng\r\nMàn hình lớn, sắc nét với tốc độ làm mới cao - Màn hình AMOLED 6.43 inch Full HD, 90Hz\r\nDung lượng pin lớn, công nghệ sạc nhanh hiện đại - Viên pin 4300mAh, sạc nhanh 65W', 1, 4),
(22, 'Vsmart Aris Pro', 5, 'Trải nghiệm màn hình tràn viền trọn vẹn - Tấm nền AMOLED, camera ẩn trong màn hình\r\nThiết kế sang chảnh - Mặt lưng chế tác 3D tinh xảo, chuyển màu khi tương tác\r\nĐáp ứng mọi nhu cầu chụp ảnh - Bộ 3 camera 48MP chuyên nghiệp\r\nHiệu năng đỉnh, xử lý mượt mà - Snapdragon 730 8 nhân, RAM 6GB', 1, 7),
(23, 'OnePlus 8T 5G', 5, 'Đánh giá OnePlus 8T 5G - Hiệu năng mạnh mẽ, sạc siêu nhanh\r\nOnePlus 8T 5G là chiếc flagship mới nhất của OnePlus. Máy gây ấn tượng với người dùng không chỉ bởi cấu hình mạnh mẽ mà còn là tốc độ sạc siêu nhanh. Chắc chắn đây là mẫu điện thoại mà rất nhiều người mong muốn có thể sở hữu.\r\n\r\nThiết kế cực sang, chuẩn smartphone cao cấp\r\nOnePlus 8T 5G là chiếc smartphone sở hữu thiết kế cực sang trọng và trẻ trung mang chuẩn phong cách smartphone cao cấp. Mặt lưng của máy được hoàn thiện bằng kính cường lực Corning Gorilla Glass giúp hạn chế được hỏng hóc do va đập hoặc rơi trong quá trình sử dụng.', 1, 9);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`productID`,`categoryID`,`manufacturerID`),
  ADD KEY `fk_Product_Category1` (`categoryID`),
  ADD KEY `fk_Product_Manufacturer1` (`manufacturerID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `product`
--
ALTER TABLE `product`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `fk_Product_Category1` FOREIGN KEY (`categoryID`) REFERENCES `category` (`categoryID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_Product_Manufacturer1` FOREIGN KEY (`manufacturerID`) REFERENCES `manufacturer` (`manufacturerID`) ON DELETE NO ACTION ON UPDATE NO ACTION;


--
-- Siêu dữ liệu
--
USE `phpmyadmin`;

--
-- Siêu dữ liệu cho bảng product
--

--
-- Đang đổ dữ liệu cho bảng `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'db_app', 'product', '{\"sorted_col\":\"`product`.`productID` ASC\"}', '2021-10-30 17:43:12');

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
