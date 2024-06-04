<?php

require_once "../Models/Represent.php";

if(isset($_POST["action"])){

    $represent = new Represent();

    switch($_POST["action"]){

        case "listRepresentsId": 
                $idrepresentante = $_POST["idrepresentante"];

                echo json_encode($represent->getRepresentsId($idrepresentante));
            break;
        
        case "listRepresentsIdAdress":
            $idsede = $_POST["idsede"];

            echo json_encode($represent->getRepresentsIdAdress($idsede));
            break;
    }
}
?>