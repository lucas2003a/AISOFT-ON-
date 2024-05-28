<?php

require_once "../Models/quota.php";

if(isset($_POST["action"])){

    $quota = new Quota();

    switch($_POST["action"]){

        case "listQuotasIdcontrato": 
            
                $dataObtained = [
                    "idcontrato" => $_POST["idcontrato"]
                ];

                echo json_encode($quota->listQuotasIdcontract($dataObtained));
            break;
    }
}