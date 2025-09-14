<!-- ======= Footer ======= -->
<section class="section-footer">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-md-4">
                <div class="widget-a">
                    <div class="w-header-a">
                        <h3 class="w-title-a text-brand">Kiyo-Home</h3>
                    </div>
                    <div class="w-body-a">
                        <p class="w-text-a color-text-a">
                            Kiyo-Home kỳ vọng trở thành homestay lưu trú số 1 cho khách
                            du lịch tại Cần Thơ trong 5 năm tới.
                        </p>
                    </div>
                    <div class="w-footer-a">
                        <ul class="list-unstyled">
                            <li class="color-a">
                                <span class="color-text-a">Phone .</span> +84 833 170 320
                            </li>
                            <li class="color-a">
                                <span class="color-text-a">Email .</span> kiyohome111@gmail.com
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 section-md-t3">
                <div class="widget-a">
                    <div class="w-header-a">
                        <h3 class="w-title-a text-brand">Chỉ Mục</h3>
                    </div>
                    <div class="w-body-a">
                        <div class="w-body-a">
                            <ul class="list-unstyled">
                                <li class="item-list-a">
                                    <i class="bi bi-chevron-right"></i> <a href="#uu-dai">Ưu đãi</a>
                                </li>
                                <li class="item-list-a">
                                    <i class="bi bi-chevron-right"></i> <a href="#moi-nhat">Mới nhất</a>
                                </li>
                                <li class="item-list-a">
                                    <i class="bi bi-chevron-right"></i> <a href="#dia-diem">Địa điểm phổ biến</a>
                                </li>
                                <li class="item-list-a">
                                    <i class="bi bi-chevron-right"></i> <a href="#danh-gia">Đánh giá</a>
                                </li>
                                <li class="item-list-a">
                                    <i class="bi bi-chevron-right"></i> <a href="#albums">Albums</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-12 col-md-4 section-md-t3">
                <div class="widget-a">
                    <div class="w-header-a">
                        <h3 class="w-title-a text-brand">Menu</h3>
                    </div>
                    <div class="w-body-a">
                        <ul class="list-unstyled">
                            <li class="item-list-a">
                                <i class="bi bi-chevron-right"></i> <a href="#">Trang chủ</a>
                            </li>
                            <li class="item-list-a">
                                <i class="bi bi-chevron-right"></i> <a href="about.php">Giới thiệu</a>
                            </li>
                            <li class="item-list-a">
                                <i class="bi bi-chevron-right"></i> <a href="rooms.php">Đặt phòng</a>
                            </li>
                            <li class="item-list-a">
                                <i class="bi bi-chevron-right"></i> <a href="contact.php">Liên hệ</a>
                            </li>
                            <?php
                            if (isset($_SESSION["user"])) {
                            ?>
                                <li class="item-list-a">
                                    <i class="bi bi-chevron-right"></i> <a href="profiles.php">Thông tin cá nhân</a>
                                </li>
                            <?php
                            }
                            ?>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <nav class="nav-footer">
                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <a href="#">Trang chủ</a>
                        </li>
                        <li class="list-inline-item">
                            <a href="about.php">Giới thiệu</a>
                        </li>
                        <li class="list-inline-item">
                            <a href="rooms.php">Đặt phòng</a>
                        </li>
                        <li class="list-inline-item">
                            <a href="contact.php">Liên hệ</a>
                        </li>
                    </ul>
                </nav>
                <div class="socials-a">
                    <ul class="list-inline">
                        <li class="list-inline-item">
                            <a href="#">
                                <i class="bi bi-facebook" aria-hidden="true"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <i class="bi bi-twitter" aria-hidden="true"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <i class="bi bi-instagram" aria-hidden="true"></i>
                            </a>
                        </li>
                        <li class="list-inline-item">
                            <a href="#">
                                <i class="bi bi-linkedin" aria-hidden="true"></i>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</footer><!-- End  Footer -->

<div id="preloader"></div>
<a href="#"
    class="back-to-top d-flex align-items-center justify-content-center">
    <i class="bi bi-arrow-up-short"></i>
</a>

<!-- Vendor JS Files -->
<script src="../assets/vendor/swiper/swiper-bundle.min.js"></script>
<!-- Template Main JS File -->
<script src="../assets/js/views_main.js"></script>
<script src="/hostay/assets/js/validation.js"></script>
</body>

</html>