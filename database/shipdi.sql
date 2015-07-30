-- phpMyAdmin SQL Dump
-- version 4.0.10deb1
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Jul 30, 2015 at 04:48 PM
-- Server version: 5.5.43-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `shipdi`
--

-- --------------------------------------------------------

--
-- Table structure for table `author`
--

CREATE TABLE IF NOT EXISTS `author` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `firstname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `surname` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `biograpy` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `author`
--

INSERT INTO `author` (`id`, `firstname`, `surname`, `biograpy`) VALUES
(1, 'Thức', 'Nguyễn Thế', 'Đã là chuyên gia php tuyệt vời'),
(2, 'Quang', 'Nguyễn Văn', 'Đã là Thạc sỹ Quá trình thiết bị'),
(3, 'Đạt', 'Nguyễn Thành', 'Là kỹ sư lập trình Apple'),
(4, 'Thọ ', 'Đoàn Văn', 'Là chuyên gia của Viettel ');

-- --------------------------------------------------------

--
-- Table structure for table `auth_assignment`
--

CREATE TABLE IF NOT EXISTS `auth_assignment` (
  `item_name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `user_id` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_assignment`
--

INSERT INTO `auth_assignment` (`item_name`, `user_id`, `created_at`) VALUES
('sysadmin', '2', 1437582562),
('user', '1', 1438177748);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item`
--

CREATE TABLE IF NOT EXISTS `auth_item` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `rule_name` varchar(64) COLLATE utf8_unicode_ci DEFAULT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `idx-auth_item-type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item`
--

INSERT INTO `auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`) VALUES
('/*', 2, 'Cho phép truy cập tất cả', NULL, NULL, 1437581681, 1437581681),
('/admin/*', 2, 'Cho phép truy cập vào phần điều khiển của admin ', NULL, NULL, 1437581715, 1437581715),
('/book/*', 2, 'Quyền xem các sách đã xuất bản', NULL, NULL, 1437615702, 1437615702),
('permission_admin', 2, 'Người có quyền admin ', NULL, NULL, 1437581823, 1437581823),
('Quyen_giam_doc', 2, 'a. Xuất báo cáo về sự thay đổi dòng tiền, số lượng đơn/ngày (Đồ thị đường, thống kê %,...).\r\nb. Xuất báo cáo kết quả hoạt động KD...\r\nc. Tạo thêm tài khoản mặc định dựa trên các loại có sẵn.\r\nd. Có thể can thiệp sâu (Vai trò cao nhất).', NULL, NULL, 1437709207, 1437709250),
('Quyen_NV_ke_toan', 2, 'a. Kiểm soát được dòng tiền COD, tiền ship (Cập nhật realtime).\r\nb. Thu tiền trực tiếp từ ship, check tình trạng đã nhận đơn hàng...\r\nc. In hóa đơn\r\nd. Quản lí trả lương cho mọi nhân viên.\r\ne. Chấm công (Hệ thống tự động dựa trên mã NV theo ca làm việc).', NULL, NULL, 1437709405, 1437709405),
('Quyen_NV_nhan_hang', 2, 'a. Sau khi đơn hàng được nhập, thông tin đơn sẽ nhảy vào TK quản trị viên online, QTV in hóa đơn, đồng ý cho dữ liệu vào TK NV nhận hàng.\r\nb. NV này tới shop, nhận và check tình trạng nhận hàng ngay trên TK = điện thoại di động.\r\nc. Trạng thái đơn hàng đc cập nhật (2->3 hoặc 7 (có lí do: Không có hàng, hủy trc khi nhận, ...)).', NULL, NULL, 1437709656, 1437709656),
('Quyen_NV_online', 2, 'a. Sắp xếp ca cho shipper\r\nb. Thay đổi số lượng shipper/ca\r\nc. Thay đổi các khu vực (Phận chia theo quận)\r\nd. In xuất hóa đơn, check tình trạng của shipper và NV nhận hàng.', NULL, NULL, 1437709462, 1437709462),
('Quyen_NV_quan_ly_nhan_luc', 2, 'a. Tạo TK shipper, NV nhận hàng dựa trên form sẵn.\r\nb. Kiểm tra tình trạng làm việc.\r\nc. Gửi dữ liệu về các NV này cho NV online', NULL, NULL, 1437709306, 1437709365),
('Quyen_shipper', 2, 'a. Sau khi NV nhận hàng check thành công, hệ thống tự động đưa dữ liệu đơn hàng về TK shipper, phân chia theo quận.\r\nb. NV online tùy chỉnh được các khu vực phân chia (VD chia HN thành 3 vùng theo quận, 4 vùng,...)\r\nc. Cân đối giữa số lượng đơn/ca của các ship (VD ca 1 có 3 shipper S1, S2, S3, nếu chia theo quận thì S1 20 đơn, S2 8 đơn, S3 12 đơn thì hệ thống phải chuyển một số đơn từ S1 cho S2 để cân đối năng suất).\r\nd. Check tình trạng giao thành công đơn hàng/reship/chuyển hoàn và kèm lí do (Nhập ngay trên điện thoại).\r\ne. Dữ liệu tiền ship, COD, trạng thái đc cập nhật về hệ thống.', NULL, NULL, 1437709563, 1437709588),
('Quyen_shop', 2, 'a. Nhập đơn hàng: SDT, địa chỉ, ghi chú\r\n i. Từ TK shop\r\n  1. Địa chỉ shop đã mặc định (Ô nguồn đã điền sẵn, có thể thay đổi thủ công trong TH shop muốn nhận hàng tại điểm khác).\r\n  2. Địa chỉ nơi KH nhận hàng: Chứa số nhà, đường, QUẬN, HN.\r\n  3. Hình thức thu tiền ship, COD\r\n  4. Chọn mức khối lượng (Mặc định là nhẹ)\r\n  5. Chọn mức kích thước (Mặc định là nhỏ)\r\n  6. Thời gian giao hàng (Các gói giao hàng, mặc định là trong ngày)\r\n  7. Giá cước: Từ 1, 2, 3, 4 quy đổi ra giá theo bảng giá cho sẵn.\r\n ii. Từ TK nhân viên quản trị\r\nb. Kiểm tra trạng thái đơn hàng (thông qua mã vận đơn): (Các trạng thái 5 6 7 phải có lí do, trạng thái 3 có thời gia ước tính còn lại).\r\n i. Nhập thành công\r\n ii. Chờ lấy hàng\r\n iii. Đang giao hàng\r\n iv. Giao thành công\r\n v. Reship 1/2/3/4\r\n vi. Chuyển hoàn \r\n vii. Hủy\r\nc. Kiểm tra COD (Đã thanh toán, chưa thanh toán,...), theo realtime, theo giai đoạn.\r\nd. Quản lí đơn hàng đã chuyển.', NULL, NULL, 1437709752, 1437709826),
('sysadmin', 1, 'Là người quản trị hệ thống ', NULL, NULL, 1437581773, 1437581773),
('user', 1, 'Là người có quyền dùng những gì được quy định cho người dùng bình thường', NULL, NULL, 1437581957, 1437581957);

-- --------------------------------------------------------

--
-- Table structure for table `auth_item_child`
--

CREATE TABLE IF NOT EXISTS `auth_item_child` (
  `parent` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `child` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `auth_item_child`
--

INSERT INTO `auth_item_child` (`parent`, `child`) VALUES
('sysadmin', '/*'),
('sysadmin', '/admin/*'),
('user', '/book/*'),
('sysadmin', 'permission_admin');

-- --------------------------------------------------------

--
-- Table structure for table `auth_rule`
--

CREATE TABLE IF NOT EXISTS `auth_rule` (
  `name` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `data` text COLLATE utf8_unicode_ci,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book`
--

CREATE TABLE IF NOT EXISTS `book` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `description` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  `author_id` int(11) DEFAULT NULL,
  `isbn` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `book`
--

INSERT INTO `book` (`id`, `title`, `description`, `author_id`, `isbn`) VALUES
(2, 'Ngày hôm nay thật tuyệt', 'Nó làm cho tôi cảm thấy yêu đời hơn', 1, NULL),
(3, 'Những điều thú vị trong cuộc sống', 'Là được cảm thấy khỏe mạnh trong người', 4, NULL),
(5, 'Thêm một vấn đề mới bạn cần phải làm sao', 'Cứ thoải mái đi mà', 1, NULL),
(6, 'Tôi sẽ làm được', 'Phải cố gắng hết sức ', 3, NULL),
(7, 'Co toi day', 'Ban o dau', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `charge`
--

CREATE TABLE IF NOT EXISTS `charge` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `charge`
--

INSERT INTO `charge` (`id`, `type`, `content`) VALUES
(1, 'A', '1000000'),
(2, 'B', '1500000'),
(3, 'C', '2000000'),
(4, 'D', '2500000');

-- --------------------------------------------------------

--
-- Table structure for table `formlevy`
--

CREATE TABLE IF NOT EXISTS `formlevy` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `formlevy`
--

INSERT INTO `formlevy` (`id`, `type`, `content`) VALUES
(2, 'Khánh hàng trả phí', 'Tiền ship '),
(3, 'Shop trả phí', 'Cả tiền Ship và tiền COD');

-- --------------------------------------------------------

--
-- Table structure for table `migration`
--

CREATE TABLE IF NOT EXISTS `migration` (
  `version` varchar(180) COLLATE utf8_unicode_ci NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `migration`
--

INSERT INTO `migration` (`version`, `apply_time`) VALUES
('m000000_000000_base', 1437577202),
('m150112_135159_create_users_table', 1437577315),
('m150722_155829_create_rbac_table', 1437581046);

-- --------------------------------------------------------

--
-- Table structure for table `order`
--

CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `phonenumber` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `locationx` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `locationy` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `charges_id` int(11) NOT NULL,
  `shop_id` int(11) NOT NULL,
  `weight_id` int(11) NOT NULL,
  `size_id` int(11) NOT NULL,
  `timeorder_id` int(11) NOT NULL,
  `levy_id` int(11) NOT NULL,
  `statusorder_id` int(11) NOT NULL,
  `note` text COLLATE utf8_unicode_ci,
  `cod_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `charges_id` (`charges_id`),
  KEY `shop_id` (`shop_id`),
  KEY `weight_id` (`weight_id`),
  KEY `size_id` (`size_id`),
  KEY `timeorder_id` (`timeorder_id`),
  KEY `levy_id` (`levy_id`),
  KEY `statusorder_id` (`statusorder_id`),
  KEY `cod_id` (`cod_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=5 ;

--
-- Dumping data for table `order`
--

INSERT INTO `order` (`id`, `phonenumber`, `address`, `locationx`, `locationy`, `charges_id`, `shop_id`, `weight_id`, `size_id`, `timeorder_id`, `levy_id`, `statusorder_id`, `note`, `cod_id`) VALUES
(1, '09878765463', '83 Hai Bà Trưng, Cửa Nam, Đống Đa, Hà Nội, Việt Nam', '21.027556', '105.841634', 1, 1, 1, 1, 1, 2, 1, 'dia chi shop', 1),
(3, '09878765463', '179 Ngõ 200 Vĩnh Hưng, Vĩnh Hưng, Hai Bà Trưng, Hà Nội, Việt Nam', '20.9902783', '105.88018699999998', 1, 1, 1, 1, 1, 2, 1, 'don hang so 1', 1),
(4, '01674773695', '36 Hàng Bông, Hàng Gai, Hoàn Kiếm, Hà Nội, Việt Nam', '21.030887', '105.84826599999997', 1, 1, 1, 1, 1, 2, 1, 'Don hang so 2', 1);

-- --------------------------------------------------------

--
-- Table structure for table `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `address` varchar(2048) COLLATE utf8_unicode_ci NOT NULL,
  `locationx` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `locationy` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `shop`
--

INSERT INTO `shop` (`id`, `name`, `address`, `locationx`, `locationy`) VALUES
(1, 'Cửa hàng thời trang Mạnh Thắng', '29 vĩnh hưng, hoàng mai, hà nội', '20.4545656', '105.99993432423'),
(2, 'Công ty giày thượng đình hà nội', '280 Nguyễn Trãi Hà Nội', '21.5454366', '106.2342543636');

-- --------------------------------------------------------

--
-- Table structure for table `size`
--

CREATE TABLE IF NOT EXISTS `size` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(8) COLLATE utf8_unicode_ci NOT NULL,
  `length` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `width` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `height` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `size`
--

INSERT INTO `size` (`id`, `type`, `length`, `width`, `height`) VALUES
(1, 'Nhỏ', 'Nhỏ hơn 10cm', 'Nhỏ hơn 10cm', 'Nhỏ hơn 10cm'),
(2, 'Vừa ', 'Lớn hơn 10 cm và bé hơn 20cm', 'Lớn hơn 10 cm và bé hơn 20cm', 'Lớn hơn 10 cm và bé hơn 20cm'),
(3, 'To', 'Lớn hơn 20 cm', 'Lớn hơn 20 cm', 'Lớn hơn 20 cm');

-- --------------------------------------------------------

--
-- Table structure for table `statuscod`
--

CREATE TABLE IF NOT EXISTS `statuscod` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `statuscod`
--

INSERT INTO `statuscod` (`id`, `type`, `content`) VALUES
(1, 'chỗ này để nhập', 'Giửa khách hàng và Shop đã tự thanh toán với nhau '),
(2, 'Thu hộ Shop ', 'Shipdi phải thu hộ cho Shop ');

-- --------------------------------------------------------

--
-- Table structure for table `statusorder`
--

CREATE TABLE IF NOT EXISTS `statusorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(1024) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=8 ;

--
-- Dumping data for table `statusorder`
--

INSERT INTO `statusorder` (`id`, `type`, `content`) VALUES
(1, 'Nhập thành công ', 'Đây là trạng thái nhập đơn hàng thành công.'),
(2, 'Chờ lấy hàng', 'Đây là trạng thái đang chờ lấy hàng từ shop.'),
(3, 'Đang giao hàng', 'Đã lấy hàng thành công và đang giao hàng cho khách'),
(4, 'Giao thành công', 'Đã giao hàng thành công cho khách hàng '),
(5, 'Reship', 'Giao lại hàng '),
(6, 'Chuyển hoàn', 'Khách trả lại hàng '),
(7, 'Hủy ', 'Hủy việc giao hàng ');

-- --------------------------------------------------------

--
-- Table structure for table `timeorder`
--

CREATE TABLE IF NOT EXISTS `timeorder` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Dumping data for table `timeorder`
--

INSERT INTO `timeorder` (`id`, `type`, `content`) VALUES
(1, '9h ~ 12h', 'Là thời gian giao hàng trong ngày '),
(2, '13h ~ 15h', 'Là thời gian ngày tiếp theo tính từ lúc nhận hàng '),
(3, 'Trong tuần', 'Thời gian giao hàng trong tuần đó ');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `displayname` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `role` smallint(6) NOT NULL DEFAULT '10',
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `auth_key`, `displayname`, `password_hash`, `password_reset_token`, `email`, `role`, `status`, `created_at`, `updated_at`) VALUES
(1, 'thuccoi', '8s9csE3IKVwqqB_QgJU6EIwot6qUimfd', 'Nguyễn Thế Thức', '$2y$13$E6.C3kPEz1ZgR1/EcaRrceJ9NllT2EP6wHY8uW1g88cG3NPJpIfGK', NULL, 'thucfami@gmail.com', 10, 10, 1437580137, 1437618474),
(2, 'admin', 'l5-iH1rNUgaXQAGWrShGcq7d6RyZC7wT', 'Quản trị viên', '$2y$13$Avm7.JDQZZuhd9AOb4xDu.bBZ/OeEUIjHr4VgaIEBGPusX.Q2OADy', NULL, 'nguoithaogonutthat@gmail.com', 10, 10, 1437580274, 1437580274);

-- --------------------------------------------------------

--
-- Table structure for table `weight`
--

CREATE TABLE IF NOT EXISTS `weight` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `content` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `weight`
--

INSERT INTO `weight` (`id`, `type`, `content`) VALUES
(1, 'Nhẹ', 'Từ 0kg ~ 3kg'),
(2, 'Vừa', 'Từ 3.1 kg ~ 4kg'),
(3, 'Nặng vừa phải', 'Từ 4.1 kg ~ 5kg'),
(4, 'Nặng', 'Từ 5.1 kg ~ 6 kg'),
(5, 'Rất nặng', 'Từ 6.1 kg ~ 7 kg');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_assignment`
--
ALTER TABLE `auth_assignment`
  ADD CONSTRAINT `auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `auth_item`
--
ALTER TABLE `auth_item`
  ADD CONSTRAINT `auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `auth_item_child`
--
ALTER TABLE `auth_item_child`
  ADD CONSTRAINT `auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `FK_BOOK_AUTHOR` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

--
-- Constraints for table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`charges_id`) REFERENCES `charge` (`id`),
  ADD CONSTRAINT `order_ibfk_2` FOREIGN KEY (`shop_id`) REFERENCES `shop` (`id`),
  ADD CONSTRAINT `order_ibfk_3` FOREIGN KEY (`weight_id`) REFERENCES `weight` (`id`),
  ADD CONSTRAINT `order_ibfk_4` FOREIGN KEY (`size_id`) REFERENCES `size` (`id`),
  ADD CONSTRAINT `order_ibfk_5` FOREIGN KEY (`timeorder_id`) REFERENCES `timeorder` (`id`),
  ADD CONSTRAINT `order_ibfk_6` FOREIGN KEY (`levy_id`) REFERENCES `formlevy` (`id`),
  ADD CONSTRAINT `order_ibfk_7` FOREIGN KEY (`statusorder_id`) REFERENCES `statusorder` (`id`),
  ADD CONSTRAINT `order_ibfk_8` FOREIGN KEY (`cod_id`) REFERENCES `statuscod` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
