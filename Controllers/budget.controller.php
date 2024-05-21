<?php

require_once "../Models/Budget.php";

if (isset($_POST["action"])) {

    $budget = new Budget();

    switch ($_POST["action"]) {

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

            $dataObtained = [

                "idpresupuesto"     =>  $_POST["idpresupuesto"],
                "idusuario"         =>  1
            ];

            echo json_encode($budget->inactiveBudget($dataObtained));
            break;

        case "listBudgetsAsset":

            echo json_encode($budget->listBudgetsAsset());
            break;
    }
}

if(isset($_GET["action"])){
    $budget = new Budget();

    switch ($_GET["action"]) {

        case "countBudgets": 
            $idpresupuesto = $_GET["idpresupuesto"];

            $idExist = $budget->countBudgets($idpresupuesto);

            // $response = $idExist ? "No se puede eliminar el presupuesto" : "El presupuesto se ha eliminado correctamente";

            // echo json_encode($response);
            echo json_encode($budget->countBudgets($idpresupuesto));
        break;
    }
}
