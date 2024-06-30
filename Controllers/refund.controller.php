<?php

require_once "../Models/Refund.php";
require_once "../Models/Configuration.php";
date_default_timezone_set("America/Lima");

if(isset($_POST["action"])){

    $refund = new Refund();
    $config = new Configuration();

    switch($_POST["action"]){

        case "listRefundsAll": 
             
                echo json_encode($refund->listRefundsAll());
            break;
        case "listRefundsTrefund": 
            
                $dataObtained = [
                    "tipo_devolucion" =>  $_POST ["tipo_devolucion"], 
                    "fechaInicio"   =>  $_POST["fechaInicio"], 
                    "fechaFin"      =>  $_POST["fechaFin"]
                ];
                echo json_encode($refund->listRefunds($dataObtained));
            break;

        case "listRefundsNExpedientes": 

                $dataObtained = [
                    "tipo_devolucion" =>  $_POST ["tipo_devolucion"], 
                    "fechaInicio"   =>  $_POST["fechaInicio"], 
                    "fechaFin"      =>  $_POST["fechaFin"],
                    "n_expediente" =>  $_POST["n_expediente"],
                ];
                echo json_encode($refund->listRefundsNExpedientes($dataObtained));
            
            break;

        case "listRefundsById": 

                $iddevolucion = $_POST["iddevolucion"];

                echo json_encode($refund->listRefundsById($iddevolucion));
            break;

        case "addRefund": 
                
                $today = date("dmYhis");
                $nom_img = "noImage.jpg";

                $dataConfig = [
                    "clave" => $_POST["clave"],
                    "valor" => $_POST["valor"]
                ];

                $dataObtained = [
                        "n_expediente"      =>  $_POST["n_expediente"],
                        "idseparacion"      =>  $_POST["idseparacion"],
                        "idcontrato"        =>  $_POST["idcontrato"],
                        "tipo_devolucion"   =>  $_POST["tipo_devolucion"],
                        "detalle"           =>  $_POST["detalle"],
                        "porcentaje_penalidad"  =>  $_POST["porcentaje_penalidad"],
                        "monto_devolucion"      =>  $_POST ["monto_devolucion"],
                        "tipo_cambio"           =>  $_POST["tipo_cambio"],
                        "modalidad_pago"        =>  $_POST["modalidad_pago"],
                        "entidad_bancaria"  =>  $_POST["entidad_bancaria"],
                        "nro_operacion"     =>  $_POST["nro_operacion"],
                        "imagen"            =>  $nom_img,
                        "idusuario"         =>  1
                        // "idusuario"     =>  $_POST["idusuario"]
                ];

                if(isset($_FILES["imagen"]) && $_FILES["imagen"]["size"] > 0){

                    $nom_img = sha1($today) . ".jpg";
                    $ruta = "../media/constancias_dev/". $nom_img;

                    if(move_uploaded_file($_FILES["imagen"]["tmp_name"], $ruta)){
                        $dataObtained["imagen"] = $nom_img;
                    }
                }

                $data = $refund->addRefund($dataObtained);

                if($data){
                    $config->upsetConfig($dataConfig);
                }
                echo json_encode($data);
            break;

        case "setRefund": 

                $today = date("dmYhis");
                $nom_img = "noImage.jpg";
                
                $dataObtained = [
                        "iddevolucion"      =>  $_POST["iddevolucion"],
                        "n_expediente"      =>  $_POST["n_expediente"],
                        "idseparacion"      =>  $_POST["idseparacion"],
                        "idcontrato"        =>  $_POST["idcontrato"],
                        "tipo_devolucion"   =>  $_POST["tipo_devolucion"],
                        "detalle"           =>  $_POST["detalle"],
                        "porcentaje_penalidad"  =>  $_POST["porcentaje_penalidad"],
                        "monto_devolucion"      =>  $_POST ["monto_devolucion"],
                        "tipo_cambio"           =>  $_POST["tipo_cambio"],
                        "modalidad_pago"        =>  $_POST["modalidad_pago"],
                        "entidad_bancaria"  =>  $_POST["entidad_bancaria"],
                        "nro_operacion"     =>  $_POST["nro_operacion"],
                        "imagen"            =>  $nom_img,
                        "idusuario"         =>  1
                        // "idusuario"     =>  $_POST["idusuario"]
                ];

                if(isset($_FILES["imagen"]) && $_FILES["imagen"]["size"] > 0){

                    $nom_img = sha1($today) . ".jpg";
                    $ruta = "../media/constancias_dev/". $nom_img;

                    if(move_uploaded_file($_FILES["imagen"]["tmp_name"], $ruta)){
                        $dataObtained["imagen"] = $nom_img;
                    }
                }else{

                    $data = $refund->listRefundsById($_POST["iddevolucion"]);

                    if($data){
                        $dataObtained["imagen"] = $data["imagen"];
                    }
                }

                echo json_encode($refund->setRefund($dataObtained));
            break;

        case "inactiveRefound": 

                $dataObtained = [

                    "iddevolucion"  =>  $_POST["iddevolucion"],
                    "idusuario"     => 1
                ];

                echo json_encode($refund->inactiveRefund($dataObtained));
            break;
    }
}