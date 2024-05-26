<?php

require_once "../Models/Refund.php";

if(isset($_POST["action"])){

    $refund = new Refund();

    switch($_POST["action"]){

        case "listRefundsAll": 
            
                echo json_encode($refund->listRefundsAll());
            break;
        case "listRefunds": 
            
                $dataObtainded = [
                    "tipo_persona" =>   ["tipo_persona"], 
                    "fechaInicio"   =>  ["fechaInicio"], 
                    "fechaFin"      =>  ["fechaFin"]
                ];
                echo json_encode($refund->listRefunds($dataObtainded));
            break;

        case "listRefundsNExpedientes": 

                $dataObtainded = [
                    "tipo_persona" =>   ["tipo_persona"], 
                    "fechaInicio"   =>  ["fechaInicio"], 
                    "fechaFin"      =>  ["fechaFin"],
                    "n_expedientes" =>  ["n_expedientes"],
                ];
                echo json_encode($refund->listRefunds($dataObtainded));
            
            break;

        case "listRefundsById": 

                $iddevolucion = $_POST["iddevolucion"];

                echo json_encode($refund->listRefundsById($iddevolucion));
            break;

        case "addRefund": 
                
                $dataObtainded = [
                        "n_expediente"  =>   ["n_expediente"],
                        "idseparacion"  =>   ["idseparacion"],
                        "detalle"       =>   ["detalle"],
                        "monto_devolucion" =>   ["monto_devolucion"],
                        "imagen"        =>  [ "imagen"],
                        "idusuario"     =>  ["idusuario"]
                ];

                echo json_encode($refund->addRefund($dataObtainded));
            break;

        case "setRefund": 
                
                $dataObtainded = [
                        "iddevolucion"  =>   ["iddevolucion"],
                        "n_expediente"  =>   ["n_expediente"],
                        "idseparacion"  =>   ["idseparacion"],
                        "detalle"       =>   ["detalle"],
                        "monto_devolucion" =>   ["monto_devolucion"],
                        "imagen"        =>  [ "imagen"],
                        "idusuario"     =>  ["idusuario"]
                ];

                echo json_encode($refund->setRefund($dataObtainded));
            break;

        case "inactiveRefound": 

                $dataObtainded = [

                    "iddevolucion"  =>  $_POST["iddevolucion"],
                    "idusuario"     => 1
                ];

                echo json_encode($refund->inactiveRefund($dataObtainded));
            break;
    }
}