<?php

require_once "../Models/quota.php";
date_default_timezone_set("America/Lima");

if(isset($_POST["action"])){

    $quota = new Quota();

    switch($_POST["action"]){

        case "listQuotasIdcontrato": 
            
                $today = date("Y-m-d");

                $idcontrato =  $_POST["idcontrato"];

                $data = $quota->listQuotasIdcontract($idcontrato);

                foreach($data as $result){
                    if($result["fecha_vencimiento"] < $today){
                        $dataSend = [
                            "idcuota" => $result["idcuota"],
                            "estado" =>"VENCIDO"
                        ];

                        $quota->updateQuotasState($dataSend);
                    }
                }

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
        
        case "addQuota":
            $dataObtained = [
                "idcontrato" => $_POST["idcontrato"],
                "monto_cuota" => $_POST["monto_cuota"],
                "fecha_vencimiento" => $_POST["fecha_vencimiento"],
                "idusuario" => 1
                // "idusuario" => $_POST["idusuario"]
                ];

                echo json_encode($quota->addQuota($dataObtained));
            break;

        case "setQuota": 

            $today = date("dmY");
            $nom_img = sha1($today) . "jpg.";
            $url = "../media/pagos/" . $nom_img;

            $dataObtained = [
                "idcuota"       =>  $_POST["idcuota"],
                "fecha_pago"    =>  $_POST["fecha_pago"], 
                "monto_pago"    =>  $_POST["monto_pago"],
                "detalles"      =>  $_POST["detalles"],
                "tipo_pago"     =>  $_POST["tipo_pago"],
                "entidad_bancaria"  =>  $_POST["entidad_bancaria"],
                "imagen"        =>  $nom_img,
                "idusuario"     =>  1
                // "idusuario"     =>  $_POST["idusuario"]
            ];

            if(move_uploaded_file($_FILES["imagen"]["tmp_name"],$url)){
                $dataObtained["imagen"] = $nom_img;
            }

            echo json_encode($quota->setQuota($dataObtained));
            break;

        case "cancelQuota":
            $dataObtained = [
                "idcuota" => $_POST["idcuota"],
                "idusuario" => 1
                // "idusuario" => $_POST["idusuario"]
            ];

            echo json_encode($quota->cancelQuota($dataObtained));   
            break;

        case "inactiveQuota":
            $dataObtained = [
                "idcuota" => $_POST["idcuota"],
                "idusuario" => 1
                // "idusuario" => $_POST["idusuario"]
            ];

            echo json_encode($quota->inactiveQuota($dataObtained));
            break;
    }
}