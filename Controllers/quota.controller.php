<?php

require_once "../Models/quota.php";

if(isset($_POST["action"])){

    $quota = new Quota();

    switch($_POST["action"]){

        case "listQuotasIdcontrato": 
            
                $idcontrato =  $_POST["idcontrato"];

                echo json_encode($quota->listQuotasIdcontract($idcontrato));
            break;
        
        case "getQuotaId": 

                $idcuota = $_POST["idcuota"];

                echo json_encode($quota->getQuotaId($idcuota));
            break;

        case "getQuotasState": 
                $dataObtained = [
                    "idcontrato" => $_POST["idcontrato"],
                    "estado" => $_POST["estado"]
                ];

                echo json_encode($quota->getQuotasState($dataObtained));
            break;
        
        case "getQuotasStateDate": 
            $dataObtained = [
                "idcontrato" => $_POST["idcontrato"],
                "estado" => $_POST["estado"],
                "fecha_vencimiento" => $_POST["fecha_vencimiento"]
            ];

            echo json_encode($quota->getQuotasStateDate($dataObtained));
            break;
    }
}