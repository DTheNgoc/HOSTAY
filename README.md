# 🏡 Website Homestay Kiyo-Home

---

## 📖 Giới thiệu
Website **Kiyo-Home** được phát triển nhằm hỗ trợ việc **quản lý homestay và đặt phòng trực tuyến**, mang lại sự tiện lợi cho khách du lịch cũng như quản trị viên.  
Người dùng có thể tìm kiếm phòng, đặt phòng, check-in online và quản lý thông tin cá nhân; trong khi quản trị viên dễ dàng quản lý phòng, nhân viên, khách hàng và hóa đơn.  

---

## 🎥 Demo Video
👉 [Xem video demo tại đây](https://drive.google.com/file/d/1w3Zd8ozCZBlTPoGJimpV_KGEw7yGOpPP/view?usp=sharing)

---

## ✨ Chức năng chính
### Đối với khách hàng
- Đăng ký, đăng nhập và quản lý tài khoản cá nhân.  
- Xem danh sách phòng, chi tiết phòng và giá cả.  
- Đặt phòng trực tuyến nhanh chóng.  
- **Check-in online** bằng cách tải ảnh CCCD.  
- Quản lý đơn đặt phòng, hủy phòng, gửi phản hồi.  

### Đối với quản trị viên
- Quản lý phòng (thêm, sửa, xóa, thay đổi trạng thái).  
- Quản lý nhân viên và phân quyền.  
- Quản lý đơn đặt phòng và xác nhận check-in.  
- Quản lý tài khoản người dùng.  
- Theo dõi và quản lý hóa đơn.  

---

## 🛠️ Công nghệ sử dụng
- **Frontend**: HTML, CSS, JavaScript, Bootstrap 5  
- **Backend**: PHP thuần  
- **Database**: MySQL (phpMyAdmin, XAMPP)  

---

## 📂 Cấu trúc thư mục
### hostay/
- │── index.php # File khởi động
- │── controllers/ # Xử lý logic
- │── models/ # Kết nối & truy vấn CSDL
- │── views/ # Giao diện hiển thị
- │── assets/ # CSS, JS, hình ảnh
- │── database/ # File .sql

---

## 🚀 Hướng dẫn cài đặt
1. Cài đặt [XAMPP](https://www.apachefriends.org/download.html).  
2. Copy thư mục `hostay` vào `htdocs`.  
3. Import file `hostay_data.sql` vào MySQL qua phpMyAdmin.  
4. Chạy Apache và MySQL từ XAMPP.  
5. Truy cập tại: [http://localhost/hostay/](http://localhost/hostay/)  

---

## 📌 Kết quả & Hướng phát triển
- ✅ Hoàn thành hệ thống đặt phòng, quản lý phòng, check-in online.  
- ✅ Hệ thống hoạt động ổn định, giao diện thân thiện.  
- ⚠️ Hạn chế: chưa tích hợp thanh toán tự động, chưa có chatbox hỗ trợ trực tuyến.  
- 🔮 Hướng phát triển: nâng cấp lên framework Laravel, bổ sung thanh toán VNPay/MoMo, tích hợp AI chatbot, phát triển ứng dụng mobile.  

---

## 📄 Giấy phép
Dự án được thực hiện cho mục đích học tập, nghiên cứu, **không dùng cho thương mại**.

