<?php

require_once "../Models/Refund.php";

if(isset($_POST["action"])){

    $refund = new Refund();

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

                $dataObtained = [
                        "n_expediente"  =>  $_POST["n_expediente"],
                        "idseparacion"  =>  $_POST["idseparacion"],
                        "tipo_devolucion" =>  $_POST["tipo_devolucion"],
                        "detalle"       =>  $_POST["detalle"],
                        "porcentaje_penalidad" =>  $_POST["porcentaje_penalidad"],
                        "monto_devolucion" =>  $_POST ["monto_devolucion"],
                        "imagen"        =>  $nom_img,
                        "idusuario"     =>  1
                        // "idusuario"     =>  $_POST["idusuario"]
                ];

                if(isset($_FILES["imagen"]) && $_FILES["imagen"]["size"] > 0){

                    $nom_img = sha1($today) . ".jpg";
                    $ruta = "../media/constancias_dev/". $nom_img;

                    if(move_uploaded_file($_FILES["imagen"]["tmp_name"], $ruta)){
                        $dataObtained["imagen"] = $nom_img;
                    }
                }

                echo json_encode($refund->addRefund($dataObtained));
            break;

        case "setRefund": 

                $today = date("dmYhis");
                $nom_img = "noImage.jpg";
                
                $dataObtained = [
                        "iddevolucion"  =>  $_POST["iddevolucion"],
                        "n_expediente"  =>  $_POST["n_expediente"],
                        "idseparacion"  =>  $_POST["idseparacion"],
                        "tipo_devolucion" =>  $_POST["tipo_devolucion"],
                        "detalle"       =>  $_POST["detalle"],
                        "porcentaje_penalidad" =>  $_POST["porcentaje_penalidad"],
                        "monto_devolucion" =>  $_POST ["monto_devolucion"],
                        "imagen"        =>  $nom_img,
                        "idusuario"     =>  1
                        // "idusuario"     =>  $_POST["idusuario"]
                ];

                if(isset($_FILES["imagen"]) && $_FILES["imagen"]["size"] > 0){

                    $nom_img = sha1($today) . ".jpg";
                    $ruta = "../media/constancias_dev/". $nom_img;

                    if(move_uploaded_file($_FILES["imagen"]["tmp_name"], $ruta)){
                        $dataObtained["imagen"] = $nom_img;
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