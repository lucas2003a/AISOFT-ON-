<?php 
session_start();
require_once "../Models/Permission.php";

if (isset($_POST["action"])) {
    
    $permission = new Permission();

    switch($_POST["action"]){

        case "listPermission":

            $idrol = $_POST["idrol"];

            echo json_encode($permission->getPermissionByRol());
            
            break;
    }
}
?>