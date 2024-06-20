<?php

require_once "../Models/Configuration.php";

if(isset($_POST["action"])){

    $configuration = new Configuration();

    switch($_POST["action"]){
        
        case "listConfig":
            
            $clave = $_POST["clave"];
            
            echo json_encode($configuration->listConfig($clave));
            break;

        case "upsetConfig": 

            $dataObtained = [
                "clave" => $_POST["clave"],
                "valor" => $_POST["valor"]
            ];

            echo json_encode($configuration->upsetConfig($dataObtained));
            break;
    }
}
?>