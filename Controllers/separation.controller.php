<?php

require_once "../Models/Separation.php";

if(isset($_POST["action"])){

    $separation = new Separation();

    switch($_POST["action"]){

        case "listSeparationsAll": 

            echo json_encode($separation->listSeparations());

            break;

        case "listSeparaction": 

            $idactivo = $_POST["idactivo"];

            echo json_encode($separation->listByIdAsset($idactivo));

            break;
        case "listNewClients": 

            echo json_encode($separation->listNewClients());
            
            break;
    };
}
?>