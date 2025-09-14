<?php
session_start();
if(!isset($_SESSION["admin"])) {
    header("location:/hostay/admin/login.php");
} else {
    if(!isset($_SESSION["admin"]["permission"]) || $_SESSION["admin"]["permission"] < 1) {
        header("location:/hostay/admin/login.php?err=permis");
    } else {
        if(!isset($_GET["id"]) || $_GET["id"] <= 0 || !is_numeric($_GET["id"])) {
            header("location:/hostay/admin/employee.php?err=value");
        } else {
            if($_SESSION["admin"]["id"] != $_GET["id"]) {
                require_once("../app/models/EmployeeModel.php");
                $employeeModel = new EmployeeModel();
                $user = $employeeModel->getEmployeeById($_GET["id"]);
                if($user != null){
                    
                        $result = $employeeModel->delEmployee($user);

                        if($result) {
                            header("location:/hostay/admin/employee.php?suc=del");
                        } else {
                            header("location:/hostay/admin/employee.php?err=del");
                        }
                    
                } else {
                    header("location:/hostay/admin/employee.php?err=noexist");
                }
            } else {
                header("location:/hostay/admin/employee.php?err=notok");
            }
        }
    }
}
?>