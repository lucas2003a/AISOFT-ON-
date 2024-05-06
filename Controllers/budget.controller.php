<?php

require_once "../Models/Budget.php";

if(isset($_POST["action"])){

    $budget = new Budget();

    switch($_POST["action"]){

        case "listBudgets": 
            
            echo json_encode($budget->listBudgets());
            break;

        case "searchBudget": 
            
                $codigo = $_POST["codigo"];

                echo json_encode($budget->searchBudget($codigo));
            break;

        case "getBudgetById": 
            
                $idpresupuesto = $_POST["idpresupuesto"];

                echo json_encode($budget->getBudgetById($idpresupuesto));
            break;

        case "addBudget": 
            
                $dataObtained = [
                    "codigo"        => $_POST["codigo"],
                    "modelo"        => $_POST["modelo"],
                    "idusuario"     => 1
                    /* "idusuario"     => $_POST["idusuario"] */
                ];
                
                echo json_encode($budget->addBudget($dataObtained));
            break;

        case "setBudget": 
            
                $dataObtained = [
                    "idpresupuesto" => $_POST["idpresupuesto"],
                    "codigo"        => $_POST["codigo"],
                    "modelo"        => $_POST["modelo"],
                    "idusuario"     => 1
                    /* "idusuario"     => $_POST["idusuario"] */
                ];

                echo json_encode($budget->setBudget($dataObtained));
            break;

        case "inactiveBudget": 

                $idpresupuesto = $_POST["idpresupuesto"];

                echo json_encode($budget->inactiveBudget($idpresupuesto));
            break;
    }
}
?>