<?php

require_once "../../Models/ubigeo/Distrito.php";

if(isset($_POST["action"])){

    $dist = new Distrito();

    switch($_POST["action"]){

        case "list": 
            
            $idprovincia = $_POST["idprovincia"];

            echo json_encode($dist->list_districts($idprovincia));
        break;

        case "getUbigeo": 
            
            $iddistrito = $_POST["iddistrito"];

            echo json_encode($dist->getUbigeo($iddistrito));
        break;
        
        case "listUbigeoFull": 

            $dataUbigeo = [
                "distrito"      => $_POST["distrito"],
                "provincia"     => $_POST["provincia"],
                "departamento"  => $_POST["departamento"]
            ];

            echo json_encode($dist->getUbigeoFull($dataUbigeo));
        break;

    }
}
?>