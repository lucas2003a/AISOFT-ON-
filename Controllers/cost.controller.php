<?php

require_once "../Models/Cost.php";

if(isset($_POST["action"])){

    $cost = new Cost();

    switch($_POST["action"]){

        case "listCategory": 
            
            echo json_encode($cost->listCostsByCategory());
            break;
        
        case "listSubcategory": 
            
            $idcategoria_costo = $_POST["idcategoria_costo"];

            echo json_encode($cost->listCostsBySubcategory($idcategoria_costo));
            break;

        // DETALLE DE COSTOS ///////////////////////////////////////////////////////
        case "listDetailCostIdBudget": 
            
                $idpresupuesto = $_POST["idpresupuesto"];

                echo json_encode($cost->listDetailCostIdBudget($idpresupuesto));
            break;

        case "addDetailCost": 
            
                $dataObtained = [
                    "idpresupuesto"         => $_POST["idpresupuesto"],
                    "idsubacategoria_costo" => $_POST["idsubacategoria_costo"],
                    "idtipo_material"       => $_POST["idtipo_material"],
                    "detalle"               => $_POST["detalle"],
                    "cantidad"              => $_POST["cantidad"],
                    "precio_unitario"       => $_POST["precio_unitario"],
                    "idusuario"             => $_POST["idusuario"]
                ];

                echo json_encode($cost->addDetailCost($dataObtained));
            break;

        case "setDetailCost": 
            
                $dataObtained = [
                    "iddetalle_costo"       => $_POST["iddetalle_costo"],
                    "idpresupuesto"         => $_POST["idpresupuesto"],
                    "idsubacategoria_costo" => $_POST["idsubacategoria_costo"],
                    "idtipo_material"       => $_POST["idtipo_material"],
                    "detalle"               => $_POST["detalle"],
                    "cantidad"              => $_POST["cantidad"],
                    "precio_unitario"       => $_POST["precio_unitario"],
                    "idusuario"             => $_POST["idusuario"]
                ];

                echo json_encode($cost->setDetailCost($dataObtained));
            break;

        case "inactiveDetailCost": 
            
                $iddetalle_costo = $_POST["iddetalle_costo"];
                
                echo json_encode($cost->inactiveDetailCost($iddetalle_costo));
            break;

        //              REPORTES        //////////////////

        case "resumeBudgetCategory": 
            
                $idpresupuesto = $_POST["idpresupuesto"];

                echo json_encode($cost->resumeBudgetCategory($idpresupuesto));
            break;

        case "resumeBudgetSubategory": 
            
                $idpresupuesto = $_POST["idpresupuesto"];

                echo json_encode($cost->resumeBudgetCategory($idpresupuesto));
            break;

    }
}
?>