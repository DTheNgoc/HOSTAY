<?php
session_start();
if (isset($_SESSION["admin"])) {
    unset($_SESSION["admin"]);
}
header("location:/hostay/admin/login.php");
exit;
?>