<?php 

require_once "../Models/Rol.php";

if(isset($_POST["action"])){

    $rol = new Rol();

    switch($_POST["action"]){
        case "getRols":
            echo json_encode($rol->getRols());
            break;
    }
}
?>