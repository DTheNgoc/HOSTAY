-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th9 05, 2025 lúc 04:07 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `hostay_data`
--

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_voucher_status` ()   BEGIN
  -- Update status to 'expired' if the current date is greater than expire_date
  UPDATE 
    voucher 
  SET 
    status = 'expired' 
  WHERE 
    expire_date < NOW() 
    AND status != 'expired';
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `checkin`
--

CREATE TABLE `checkin` (
  `checkin_id` int(10) UNSIGNED NOT NULL,
  `first_indentity_card` text DEFAULT NULL,
  `second_indentity_card` text DEFAULT NULL,
  `checkin_code` varchar(20) DEFAULT NULL,
  `checkin_date` datetime DEFAULT NULL,
  `create_at` datetime DEFAULT current_timestamp(),
  `checkin_user` varchar(20) DEFAULT NULL,
  `bill_id` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'uncheck',
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `checkin`
--

INSERT INTO `checkin` (`checkin_id`, `first_indentity_card`, `second_indentity_card`, `checkin_code`, `checkin_date`, `create_at`, `checkin_user`, `bill_id`, `status`, `description`) VALUES
(3, '/hostay/admin/images/identity_card/1756973499_83545.jpg', '/hostay/admin/images/identity_card/1756973499_81355.png', 'ysRvl714', '2025-09-04 00:00:00', '2025-09-04 15:11:39', 'test1', '714', 'checked', '');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `checkout`
--

CREATE TABLE `checkout` (
  `id` int(11) NOT NULL,
  `bill_id` int(11) DEFAULT NULL,
  `checkout_by_user` varchar(20) DEFAULT NULL,
  `checkout_date` date DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `id` int(11) NOT NULL,
  `fullname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(20) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `personal_id` varchar(20) DEFAULT NULL,
  `role` enum('Bảo vệ','Lễ tân','Phục vụ') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`id`, `fullname`, `phone`, `email`, `address`, `personal_id`, `role`) VALUES
(19, 'Giang Dai KA', '0123456789', 'giang111@gmail.com', 'Cần Thơ', '9876543210', 'Phục vụ'),
(20, 'Truong Giang Gia', '0833170320', 'giang131@gmail.com', '43 Đ. Mậu Thân, Xuân Khánh, Ninh Kiều, Cần Thơ, Vi', '98765432101', 'Phục vụ'),
(21, 'Trung Giang', '0123456788', 'giangtrung@gmail.com', '43 Đ. Mậu Thân, Xuân Khánh, Ninh Kiều, Cần Thơ, Vi', '9876543210', 'Phục vụ'),
(22, 'Ti Ti Ti', '1234567891', 'titititi@gmail.com', '25G Đ. Mậu Thân, Xuân Khánh, Ninh Kiều, Cần Thơ, V', '98765432101', 'Phục vụ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblbill`
--

CREATE TABLE `tblbill` (
  `bill_id` int(10) UNSIGNED NOT NULL,
  `bill_room_id` int(10) UNSIGNED NOT NULL,
  `bill_customer_id` int(10) UNSIGNED NOT NULL,
  `bill_created_at` datetime NOT NULL,
  `bill_fullname` varchar(100) NOT NULL,
  `bill_email` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bill_phone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `bill_start_date` datetime NOT NULL,
  `bill_end_date` datetime NOT NULL,
  `bill_number_adult` int(10) UNSIGNED DEFAULT 0,
  `bill_number_children` int(10) UNSIGNED DEFAULT 0,
  `bill_number_room` int(10) UNSIGNED DEFAULT 1,
  `bill_notes` text DEFAULT NULL,
  `bill_static` int(10) UNSIGNED DEFAULT 0,
  `bill_is_paid` tinyint(1) DEFAULT 0,
  `bill_cancel` tinyint(1) UNSIGNED DEFAULT 0,
  `bill_voucher_code` varchar(20) DEFAULT NULL,
  `bill_personal_id` varchar(20) DEFAULT NULL,
  `bill_checkin_code` varchar(20) DEFAULT NULL,
  `bill_staff_name` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tblbill`
--

INSERT INTO `tblbill` (`bill_id`, `bill_room_id`, `bill_customer_id`, `bill_created_at`, `bill_fullname`, `bill_email`, `bill_phone`, `bill_start_date`, `bill_end_date`, `bill_number_adult`, `bill_number_children`, `bill_number_room`, `bill_notes`, `bill_static`, `bill_is_paid`, `bill_cancel`, `bill_voucher_code`, `bill_personal_id`, `bill_checkin_code`, `bill_staff_name`) VALUES
(714, 51, 51, '2025-09-04 00:00:00', 'Truong Giang', 'test1@gmail.com', '0833170320', '2025-09-04 00:00:00', '2025-09-05 00:00:00', 2, 0, 1, 'a', 6, 1, 0, '', '012345678910', 'ysRvl714', 'Truong Giang');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblbillstatic`
--

CREATE TABLE `tblbillstatic` (
  `billstatic_id` int(10) UNSIGNED NOT NULL,
  `billstatic_name` varchar(45) NOT NULL,
  `billstatic_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tblbillstatic`
--

INSERT INTO `tblbillstatic` (`billstatic_id`, `billstatic_name`, `billstatic_notes`) VALUES
(1, 'Chờ xử lý', 'Đơn đăng ký đã tạo thành công và chờ người quản lý xem xét.\r\n'),
(2, 'Thành công - chờ nhận phòng', 'Đơn đặt phòng đã được duyệt và chờ người đăng ký nhận phòng'),
(3, 'Bị hủy', 'Đơn đặt phòng bị hủy vì một lý do nào đó'),
(4, 'Đã nhận phòng', NULL),
(5, 'Đã trả phòng', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblcontact`
--

CREATE TABLE `tblcontact` (
  `contact_id` int(10) UNSIGNED NOT NULL,
  `contact_fullname` varchar(100) NOT NULL,
  `contact_email` varchar(100) NOT NULL,
  `contact_subject` varchar(200) NOT NULL,
  `contact_notes` text NOT NULL,
  `contact_seen` tinyint(1) UNSIGNED DEFAULT 0,
  `contact_created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tblcontact`
--

INSERT INTO `tblcontact` (`contact_id`, `contact_fullname`, `contact_email`, `contact_subject`, `contact_notes`, `contact_seen`, `contact_created_at`) VALUES
(7, 'Truong Giang', 'giang12@gmail.com', 'ok', '11', 1, '2025-01-10 00:00:00'),
(8, 'Truong Giang', 'giang12@gmail.com', 'ok', '11', 1, '2025-01-10 00:00:00'),
(9, 'Truong Giang', 'giang1@gmail.com', 'ok', 'room ok', 1, '2025-02-01 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblroom`
--

CREATE TABLE `tblroom` (
  `room_id` int(10) UNSIGNED NOT NULL,
  `room_number_people` int(10) UNSIGNED DEFAULT NULL,
  `room_number_bed` int(10) UNSIGNED DEFAULT NULL,
  `room_quality` float DEFAULT NULL,
  `room_bed_type` varchar(100) DEFAULT NULL,
  `room_price` decimal(18,2) NOT NULL,
  `room_detail` text DEFAULT NULL,
  `room_area` float NOT NULL,
  `room_static` int(10) UNSIGNED DEFAULT 0,
  `room_image` text CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `room_address` varchar(200) NOT NULL,
  `room_hotel_name` varchar(100) NOT NULL,
  `room_type_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tblroom`
--

INSERT INTO `tblroom` (`room_id`, `room_number_people`, `room_number_bed`, `room_quality`, `room_bed_type`, `room_price`, `room_detail`, `room_area`, `room_static`, `room_image`, `room_address`, `room_hotel_name`, `room_type_id`) VALUES
(17, 2, 1, 3, 'Giường đôi lớn', 270000.00, 'Homestay nằm ở vị trí thuận lợi, gần các điểm du lịch nổi tiếng của Cần Thơ như siêu thị Go, chợ nổi Cái Răng, Cầu Cần Thơ, Bến Ninh Kiều,… Bạn có thể dễ dàng di chuyển đến các địa điểm này bằng xe máy hoặc taxi.\r\n</br></br>\r\nVì sao nên chọn phòng Homestay Fini:\r\n</br></br>\r\nTrải nghiệm độc đáo: Khám phá Cần Thơ theo cách riêng của bạn.\r\nTiết kiệm chi phí: Giá cả hợp lý, phù hợp với nhiều đối tượng khách hàng.\r\nDịch vụ chuyên nghiệp: Đội ngũ nhân viên nhiệt tình, chu đáo luôn sẵn sàng hỗ trợ bạn..', 25, 1, '/hostay/public/images/1757042535_31287.jpg', '25G Đ. Mậu Thân, Xuân Khánh, Ninh Kiều, Cần Thơ, Việt Nam', 'Queen home', 3),
(47, 1, 1, 4, 'Giường đơn nhỏ', 270000.00, 'Căn phòng nhỏ nhắn nhưng tràn đầy sức sống với những gam màu pastel nhẹ nhàng như xanh mint, hồng baby. Chiếc giường đơn được trang trí bằng những chiếc gối ôm hình thú đáng yêu, cùng với tấm rèm cửa mỏng manh. Một góc nhỏ của căn phòng được dành riêng cho việc đọc sách, với chiếc ghế bành êm ái và kệ sách chứa đầy những cuốn truyện tranh Nhật Bản.', 20, 3, '/hostay/public/images/1736438687_19477.jpg', '43 Đ. Mậu Thân, Xuân Khánh, Ninh Kiều, Cần Thơ, Việt Nam', 'Local', 1),
(48, 2, 1, 4, 'Giường đơn lớn', 300000.00, 'Không chỉ có máy chiếu, phòng Cinema của chúng tôi còn được trang bị đầy đủ các tiện ích hiện đại khác như hệ thống âm thanh vòm, máy pha cà phê, tủ lạnh mini... Bạn có thể tự do chuẩn bị đồ ăn nhẹ và thức uống để thưởng thức cùng với bộ phim yêu thích. Ngoài ra, chúng tôi còn cung cấp dịch vụ đặt vé xem phim online, giúp bạn dễ dàng tìm kiếm và đặt vé cho các bộ phim đang chiếu', 25, 1, '/hostay/public/images/1736438988_97750.jpg', '43 Đ. Mậu Thân, Xuân Khánh, Ninh Kiều, Cần Thơ, Việt Nam', 'Cinema', 2),
(49, 2, 1, 4, 'Giường đơn lớn', 370000.00, 'Hãy biến kỳ nghỉ của bạn trở thành một hành trình đáng nhớ với không gian độc đáo và tiện nghi của phòng Video Game. Đừng bỏ lỡ cơ hội trải nghiệm không gian nghỉ dưỡng đậm chất gaming tại trung tâm Cần Thơ. Đặt phòng ngay để bắt đầu cuộc phiêu lưu của bạn!', 25, 2, '/hostay/public/images/1736439204_34076.jpg', '43 Đ. Mậu Thân, Xuân Khánh, Ninh Kiều, Cần Thơ, Việt Nam', 'Gaming time', 2),
(50, 2, 1, 4, 'Giường đơn nhỏ', 270000.00, 'Bạn muốn tìm kiếm một nơi để thư giãn và lấy lại năng lượng? Homestay của chúng tôi sẽ là lựa chọn hoàn hảo. Căn phòng được thiết kế theo phong cách tối giản, với gam màu xanh lá chủ đạo, kết hợp cùng các vật liệu tự nhiên như gỗ, mây tre đan. Mỗi góc nhỏ trong phòng đều mang đến một cảm giác mới lạ và độc đáo', 20, 2, '/hostay/public/images/1736495219_89587.jpg', '43 Đ. Mậu Thân, Xuân Khánh, Ninh Kiều, Cần Thơ, Việt Nam', 'Green Grass', 1),
(51, 2, 1, 4, 'Giường đơn lớn', 270000.00, 'Mời bạn đến với homestay của chúng tôi để trải nghiệm cảm giác thư thái, gần gũi với thiên nhiên. Căn phòng được bao phủ bởi màu xanh lá tươi mát, mang đến một không gian yên bình và thư giãn. Với cửa sổ lớn, bạn có thể ngắm nhìn những hàng cây xanh mát và hít thở không khí trong lành. Nội thất phòng được làm từ gỗ và mây tre đan, tạo nên một không gian ấm cúng và gần gũi. Hãy để chúng tôi mang đến cho bạn những giây phút nghỉ ngơi tuyệt vời nhất', 20, 1, '/hostay/public/images/1736495380_54981.jpg', '25G Đ. Mậu Thân, Xuân Khánh, Ninh Kiều, Cần Thơ, Việt Nam', 'Sleepy', 2),
(54, 2, 1, 4, 'Giường đơn nhỏ', 270000.00, 'nothing here', 25, 1, '/hostay/public/images/1757080747_12093.jpg', '43 Đ. Mậu Thân, Xuân Khánh, Ninh Kiều, Cần Thơ, Việt Nam', 'Warm', 1),
(55, 2, 1, 4, 'Giường đôi nhỏ', 270000.00, 'nothing here', 25, 3, '/hostay/public/images/1757080945_37150.jpg', '43 Đ. Mậu Thân, Xuân Khánh, Ninh Kiều, Cần Thơ, Việt Nam', 'King home', 1);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tblroomtype`
--

CREATE TABLE `tblroomtype` (
  `roomtype_id` int(10) UNSIGNED NOT NULL,
  `roomtype_name` varchar(45) NOT NULL,
  `roomtype_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tblroomtype`
--

INSERT INTO `tblroomtype` (`roomtype_id`, `roomtype_name`, `roomtype_notes`) VALUES
(1, 'Standard', 'Phòng ngủ thông thường'),
(2, 'Superior', NULL),
(3, 'Deluxe', NULL),
(4, 'Suite', NULL),
(5, 'Villa', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `tbluser`
--

CREATE TABLE `tbluser` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `user_name` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_password` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_fullname` varchar(100) NOT NULL,
  `user_email` varchar(45) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `user_phone` varchar(20) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `user_permission` int(10) UNSIGNED DEFAULT 0,
  `user_created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Đang đổ dữ liệu cho bảng `tbluser`
--

INSERT INTO `tbluser` (`user_id`, `user_name`, `user_password`, `user_fullname`, `user_email`, `user_phone`, `user_permission`, `user_created_at`) VALUES
(15, 'admin', '25d55ad283aa400af464c76d713c07ad', 'Admin', 'Truong Giang@gmail.com', '0833170321', 5, '2023-11-20 00:00:00'),
(16, 'admin2', '25d55ad283aa400af464c76d713c07ad', 'Admin 2', 'nguyelt2002@gmail.com', '0337212815', 5, '2023-12-01 00:00:00'),
(47, 'maimoka', '25f9e794323b453885f5181f1b624d0b', 'Truong Giang', 'giang1@gmail.com', '0833170320', 0, '2025-01-08 00:00:00'),
(48, 'giang1', '25f9e794323b453885f5181f1b624d0b', 'Ho Vo Truong Giang', 'giang1@gmail.com', '0123312345', 0, '2025-02-01 00:00:00'),
(50, 'giangtruonggiang', '4428c6c474502e61151877825bb41961', 'Giang Truong Giang', 'gianggiang111@gmail.com', '0123456788', 0, '2025-02-01 00:00:00'),
(51, 'test1', '25f9e794323b453885f5181f1b624d0b', 'Truong Giang', 'test1@gmail.com', NULL, 0, '2025-09-04 00:00:00');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `voucher`
--

CREATE TABLE `voucher` (
  `voucher_id` int(10) UNSIGNED NOT NULL,
  `voucher_code` varchar(20) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `expire_date` datetime DEFAULT NULL,
  `percent` int(11) DEFAULT NULL,
  `discount_limit` bigint(20) DEFAULT 0,
  `min_order_value` bigint(20) DEFAULT 0,
  `usage_limit` int(11) DEFAULT NULL,
  `usage_count` int(11) DEFAULT 0,
  `status` enum('active','expired','used') DEFAULT 'active',
  `create_at` datetime DEFAULT current_timestamp(),
  `user_id` int(11) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`checkin_id`);

--
-- Chỉ mục cho bảng `checkout`
--
ALTER TABLE `checkout`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `tblbill`
--
ALTER TABLE `tblbill`
  ADD PRIMARY KEY (`bill_id`);

--
-- Chỉ mục cho bảng `tblbillstatic`
--
ALTER TABLE `tblbillstatic`
  ADD PRIMARY KEY (`billstatic_id`);

--
-- Chỉ mục cho bảng `tblcontact`
--
ALTER TABLE `tblcontact`
  ADD PRIMARY KEY (`contact_id`);

--
-- Chỉ mục cho bảng `tblroom`
--
ALTER TABLE `tblroom`
  ADD PRIMARY KEY (`room_id`);

--
-- Chỉ mục cho bảng `tblroomtype`
--
ALTER TABLE `tblroomtype`
  ADD PRIMARY KEY (`roomtype_id`);

--
-- Chỉ mục cho bảng `tbluser`
--
ALTER TABLE `tbluser`
  ADD PRIMARY KEY (`user_id`);

--
-- Chỉ mục cho bảng `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `checkin`
--
ALTER TABLE `checkin`
  MODIFY `checkin_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT cho bảng `checkout`
--
ALTER TABLE `checkout`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `employee`
--
ALTER TABLE `employee`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT cho bảng `tblbill`
--
ALTER TABLE `tblbill`
  MODIFY `bill_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=715;

--
-- AUTO_INCREMENT cho bảng `tblbillstatic`
--
ALTER TABLE `tblbillstatic`
  MODIFY `billstatic_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tblcontact`
--
ALTER TABLE `tblcontact`
  MODIFY `contact_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT cho bảng `tblroom`
--
ALTER TABLE `tblroom`
  MODIFY `room_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT cho bảng `tblroomtype`
--
ALTER TABLE `tblroomtype`
  MODIFY `roomtype_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT cho bảng `tbluser`
--
ALTER TABLE `tbluser`
  MODIFY `user_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT cho bảng `voucher`
--
ALTER TABLE `voucher`
  MODIFY `voucher_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
