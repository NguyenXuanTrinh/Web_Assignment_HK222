-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 28, 2023 at 01:48 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0
CREATE DATABASE IF NOT EXISTS assignmentweb;
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `assignmentweb`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--
DROP DATABASE assignmentweb;
CREATE DATABASE assignmentweb;
USE assignmentweb;

CREATE TABLE `admin` (
  `admin_id` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`admin_id`, `email`, `password`, `name`, `updated_at`) VALUES
(1, 'huydeptrai@gmail.com', '02112002Sn!', 'huyhmo', '2023-04-16 01:16:07'),
(2, 'trinhdeptrai@gmail.com','Trinh333333!','TrinhDT', '2023-04-17 01:16:07');
-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `category_id` int(11) NOT NULL,
  `category_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`category_id`, `category_name`) VALUES
(1, 'Trà sữa'),
(2, 'Đồ uống '),
(3, 'Bánh'),
(4, 'Bún/Phở'),
(5, 'Cơm'),
(6, 'Đồ ăn nhanh');

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL default 0,
  `username` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `message` varchar(2000) NOT NULL,
  `status` int(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `username`, `email`, `message`, `status`, `created_at`) VALUES
(1, 'Huy', 'huydeptrai@gmail.com', 'Hi, Đồ ăn rất ngon ạ.', 0, '2023-4-20 14:21:58'),
(2, 'Trinh', 'trinhdeptrai@gmail.com', 'Giao hàng rất nhanh ạ', 0, '2023-4-20 14:22:35'),
(3, 'Thao', 'mycrush@gmail.com', 'Hàng chất lượng như hình ạ', 0, '2023-4-20 14:29:18'),
(4, 'Bao', 'thanhthien@gmail.com', 'ăn ngon xứng với giá tiền', 0, '2023-4-20 14:49:39');

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL default 1,
  `user_id` int(11) NOT NULL default 12,
  `payment_method` varchar(50) NOT NULL DEFAULT 'Tiền mặt khi nhận hàng',
  `payment` bigint(20) NOT NULL,
  `address_receiver` varchar(50) NOT NULL,
  `phone_receiver` varchar(50) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `status` enum('Đang xử lý','Đang giao','Đã giao') NOT NULL DEFAULT 'Đang xử lý',
  `name_receiver` varchar(50) NOT NULL DEFAULT 'Đang xử lý'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `order_id` int(11) NOT NULL default 1,
  `product_id` int(11) NOT NULL default 0,
  `quantity_item` bigint(20) NOT NULL DEFAULT 1,
  `price` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `post_id` int(11) NOT NULL,
  `title` varchar(250) NOT NULL,
  `content` text DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `image` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`post_id`, `title`, `content`, `updated_at`, `image`) VALUES
(1, 'SIÊU SALE SẬP SÀN', 'Rinh ngay deal hời,Mừng ngày lễ 1/5 nhiều voucher giảm giá để quý khách có ngày lễ vui vẻ. Chương trình bắt đầu từ 1/4 đến hết tháng', '2023-04-07 10:51:25', 'https://images.unsplash.com/photo-1607082349566-187342175e2f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80'),
(2, 'GIẢM GIÁ SẬP SÀN', 'Nhân ngày sinh nhật của chúng tôi, chúng tôi xin gửi đến bạn giá tốt nhất cho các đơn hàng bằng các voucher. Chương trình chỉ được áp dụng trong ngày hôm nay, hãy nhanh tay đạt hàng nào', '2023-04-07 11:11:19', 'https://plus.unsplash.com/premium_photo-1670509045675-af9f249b1bbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1135&q=80'),
(3, 'MÓN MỚI SIÊU NGON', 'Nếu bạn đang phân vân không biết ăn gì, hãy để chúng tôi gửi đến bạn món shushi siêu ngon của chúng tôi, còn chần chừ gì mà không thưởng thức thử em nó ngày nào.', '2022-12-07 11:13:45', 'https://images.pexels.com/photos/248444/pexels-photo-248444.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
(4, 'BLACKFRIDAY - NGÀY MUA SẮM CỦA NĂM', 'Sau một ngày mua sắm thì bạn cần bổ sung năng lượng cho cuộc chơi của mình, đừng lo đã có chúng tôi', '2022-12-07 11:13:50', 'https://images.pexels.com/photos/5625070/pexels-photo-5625070.jpeg'),
(5, 'NƯỚC NGON TUYỆT VỜI - NHÀ MỜI CHỈ TỪ 19K', 'Cầu được ước thấy! Món ghiền của bạn mỗi ngày, nay Nhà ưu đãi chỉ từ 19K', '2022-12-07 11:14:45', 'https://plus.unsplash.com/premium_photo-1670509045675-af9f249b1bbe?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1135&q=80');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `product_id` int(11) NOT NULL default 11,
  `name` varchar(50) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `images` varchar(100) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` bigint(20) NOT NULL,
  `price_sale` bigint(20) DEFAULT NULL,
  `timestamp` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`product_id`, `name`, `category_id`, `description`, `images`, `quantity`, `price`, `price_sale`, `timestamp`) VALUES
(1, 'Trà sữa Đài Loan', 1, 'Trà sữa Đài Loan về cơ bản cũng chỉ có trà và sữa. Thế nhưng có một điểm khác biệt hoàn toàn so với những loại trà sữa khác. Đó là trà sữa Đài Loan có hạt trân châu (boba), thế nên loại trà này còn được gọi là trà sữa trân châu.', 'tsdailoan.jpg', 1, 39000, 25000, '2023-01-08 15:29:11'),
(2, 'Trà sữa Thái xanh', 1, 'Trà sữa Thái xanh có màu xanh tươi, tạo cảm giác mát mẻ thanh lọc khi uống, mà thật vị trà Thái xanh có mùi thơm sảng khoái, kích thích các giác quan, đem đến sự tươi tỉnh khi dùng.', 'tsthaixanh.jpg', 25, 29000, NULL, '2023-04-20 16:25:12'),
(3, 'Trà sữa Hồng Kông', 1, 'Một trong những nét nổi bật nhất trong văn hoá ẩm thực đường phố của Hong Kong đó chính là trà sữa (yeet lai cha). Loại trà đen hay hồng trà đậm đà kết hợp với sữa đặc không đường là một phần không thể thiếu của rất nhiều người Hong Kong từ hơn 6 thập kỷ qua.', 'tshongkong.jpg', 20, 35000, NULL, '2023-04-20 16:25:18'),
(4, 'Trà sữa truyền thống', 1, 'Trà sữa truyền thống là sự kết hợp giữa 3 nguyên liệu cơ bản gồm trà, sữa và các loại topping. Nói về trà sữa thì cũng có rất nhiều hương vị với các cách pha chế khác nhau. Chúng ta có thể nhắc đến những hương vị như: trà sữa trân châu đường đen, trà sữa matcha, … ', 'tstruyenthong.png', 20, 29000, NULL, '2023-04-20 16:25:46'),
(5, 'Nước ép táo', 2, 'Nước ép táo chứa nhiều vitamin và khoáng chất có giá trị dinh dưỡng cao với sức khỏe chúng ta. Vì thế không nghi ngờ gì khi các chị em luôn ưu tiên cho nước ép táo vào thực đơn của mình.', 'eptao.jpg', 10, 25000, NULL, '2023-04-20 13:32:18'),
(6, 'Trà chanh', 2, 'Vào những ngày hè nóng bức, nếu có một ly trà chanh chua ngọt, thanh mát để giải nhiệt thì còn gì bằng đúng không nào? ', 'trachanh.jpg', 1, 35000, NULL, '2023-04-20 13:32:22'),
(7, 'Bánh donut ', 3, 'Bánh donut là một loại bánh ngọt được rán hoặc nướng, dùng như món tráng miệng hay món ăn vặt đều được. Đây là một loại bánh rất phổ biến ở các nước phương Tây, nó được tạo hình trông như chiếc nhẫn vì có hình tròn và lỗ nhỏ ở giữa.', 'donut.jpg', 1, 15000, NULL, '2023-04-20 13:32:23'),
(8, 'Mochi', 3, ' Bánh mochi（餅）là món bánh truyền thống của Nhật Bản. Rất khó để có thể định nghĩa được chúng vì loại bánh này được người Nhật làm hết sức công phu nên nó vô cùng đa dạng cả về hình thức cũng như mùi vị.', 'mochi.jpg', 1, 19000, NULL, '2023-04-20 13:32:24'),
(9, 'Bún bò huế', 4, 'Bún bò Huế được mệnh danh là 1 trong 50 món ăn ngon nhất thế giới. Để có được một tô bún bò chuẩn vị đặc sản Huế thơm ngon cần khá nhiều nguyên liệu, tưởng chừng cầu kỳ nhưng lại rất dễ làm. ', 'bunbo.jpg', 1, 55000, NULL, '2023-04-20 13:32:24'),
(10, 'Phở bò', 4, 'Phở là món ăn nổi tiếng của Việt Nam được nhiều người yêu thích, sẽ càng ngon hơn khi tự nấu ở nhà cho gia đình thưởng thức. Vị bò thơm ngọt nhiều dưỡng chất, bánh phở dai dai cùng với nước dùng đậm đà, hoà huyện với hương thơm của các loai rau thơm ăn kèm.', 'phobo.jpg', 0, 59000, NULL, '2023-04-20 13:32:26'),
(11, 'Cơm gà', 5, 'Cơm gà ri nướng là món ăn được chế biến từ cơm và thịt gà. Một số loại cơm được sử dụng như cơm trắng, cơm rang và thịt gà thường được chọn là đùi gà hoặc gà miếng.', 'comga.jpg', 3, 59000, NULL, '2023-04-20 13:32:26'),
(12, 'Cơm tấm Ngô Quyền', 5, 'Cơm tấm là một món ăn đặc sản của Sài Gòn, qua mùa giãn cách này có lẽ bạn đã rất nhớ hương vị thơm ngon đậm đà trong từng miếng sườn nướng nóng hổi.', 'comtam.jpg', 4, 59000, NULL, '2023-04-20 13:32:26'),
(13, 'Gà rán', 6, '“Jollibee - Gà Giòn Vui Vẻ - Triệu người yêu” được trang Eater đánh giá là “Chuỗi cửa hàng gà rán ngon nhất nước Mỹ”; “Thật sự mềm thịt, mọng nước và thấm đều gia vị” là những mỹ từ My London dành cho món gà này. ', 'garan.png', 10, 59000, NULL, '2023-04-20 13:32:26'),
(14, 'Mì ý', 6, 'Mì ý được biết đến là món ăn nổi tiếng trong nền văn hóa ẩm thực phương Tây. Những sợi mì vàng tươi, mềm thơm phủ nước sốt sánh mịn làm bùng nổ vị giác của bất cứ ai từng nếm thử.', 'myy.jpg', 15, 59000, NULL, '2023-04-20 13:32:26');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL default 10,
  `product_id` int(11) NOT NULL default 11,
  `user_id` int(11) NOT NULL default 12,
  `title` varchar(50) NOT NULL DEFAULT '',
  `content` text ,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` int(11) NOT NULL default 12,
  `email` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  `avatar` varchar(50) DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `email`, `password`, `name`, `avatar`, `phone`, `address`, `updated_at`) VALUES
(31, 'huy.thai0211@gmail.com', 'Huy02112002!', 'Huyhmo', NULL, '0123456789', 'Kí túc xá Khu A ĐHQG', '2023-01-27 03:01:57'),
(34, 'trinhdeptrai@gmail.com', 'Trinh333333!', 'TrinhDT', NULL, '0948756258', 'Cam Lộ Quảng Trị', '2023-01-27 03:05:41'),
(35, 'helpzeros@gmail.com', 'Zeros123456!', 'Zeros', NULL, '0123456788', 'Nguyễn Tri Phương Quận 10 Hồ Chí Minh', '2023-01-27 03:05:41');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`admin_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`category_id`);

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `FK_order_user` (`user_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`order_id`,`product_id`),
  ADD KEY `FK_order_item_product` (`product_id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`post_id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `FK_product_category` (`category_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `FK__product` (`product_id`),
  ADD KEY `FK__user` (`user_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--


ALTER TABLE `admin`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `post_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_order_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `order_item`
--

ALTER TABLE `order_item`
  ADD CONSTRAINT `FK_order_item_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK_order_item_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE;
--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_product_category` FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK__product` FOREIGN KEY (`product_id`) REFERENCES `product` (`product_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `FK__user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
