<?php

require_once "../Models/Material.php";

if(isset($_POST["action"])){

    $material = new Material();

    switch($_POST["action"]){

        case "listMaterials": 
            
                $idmarca = $_POST["idmarca"];

            echo json_encode($material->listMaterials($idmarca));
            break;
    }
}
?>