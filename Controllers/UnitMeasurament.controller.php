<?php

require_once "../Models/UnitMeasurament.php";

if(isset($_POST["action"])){

    $unit = new UniteMeasurament();

    switch($_POST["action"]){

        case "listUnits": 
            
            echo json_encode($unit->listUnitMeasuraments());
            break;
    }
}
?>