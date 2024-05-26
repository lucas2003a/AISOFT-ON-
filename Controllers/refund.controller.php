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
                    "tipo_persona" =>  $_POST ["tipo_persona"], 
                    "fechaInicio"   =>  $_POST["fechaInicio"], 
                    "fechaFin"      =>  $_POST["fechaFin"]
                ];
                echo json_encode($refund->listRefunds($dataObtainded));
            break;

        case "listRefundsNExpedientes": 

                $dataObtainded = [
                    "tipo_persona" =>  $_POST ["tipo_persona"], 
                    "fechaInicio"   =>  $_POST["fechaInicio"], 
                    "fechaFin"      =>  $_POST["fechaFin"],
                    "n_expedientes" =>  $_POST["n_expedientes"],
                ];
                echo json_encode($refund->listRefunds($dataObtainded));
            
            break;

        case "listRefundsById": 

                $iddevolucion = $_POST["iddevolucion"];

                echo json_encode($refund->listRefundsById($iddevolucion));
            break;

        case "addRefund": 
                
                $today = date("dmYhis");
                $nom_img = "noImage.jpg";

                $dataObtainded = [
                        "n_expediente"  =>  $_POST["n_expediente"],
                        "idseparacion"  =>  $_POST["idseparacion"],
                        "tipo_separacion" =>  $_POST["tipo_separacion"],
                        "detalle"       =>  $_POST["detalle"],
                        "monto_devolucion" =>  $_POST ["monto_devolucion"],
                        "imagen"        =>  $_POST[ "imagen"],
                        "idusuario"     =>  1
                        // "idusuario"     =>  $_POST["idusuario"]
                ];

                if(isset($_FILES["imgen"]) && $_FILE["imagen"]["size"] > 0){

                    $nom_img = sha1($today) . ".jpg";
                    $ruta = "../media/constancias_dev/". $nom_img;

                    if(move_uploaded_file($_FILES["imagen"]["tmp_name"], $ruta)){
                        $dataObtainded["imagen"] = $nom_img;
                    }
                }

                echo json_encode($refund->addRefund($dataObtainded));
            break;

        case "setRefund": 

                $today = date("dmYhis");
                $nom_img = "noImage.jpg";
                
                $dataObtainded = [
                        "iddevolucion"  =>  $_POST["iddevolucion"],
                        "n_expediente"  =>  $_POST["n_expediente"],
                        "idseparacion"  =>  $_POST["idseparacion"],
                        "tipo_separacion" =>  $_POST["tipo_separacion"],
                        "detalle"       =>  $_POST["detalle"],
                        "monto_devolucion" =>  $_POST ["monto_devolucion"],
                        "imagen"        =>  $_POST[ "imagen"],
                        "idusuario"     =>  1
                        // "idusuario"     =>  $_POST["idusuario"]
                ];

                if(isset($_FILES["imgen"]) && $_FILE["imagen"]["size"] > 0){

                    $nom_img = sha1($today) . ".jpg";
                    $ruta = "../media/constancias_dev/". $nom_img;

                    if(move_uploaded_file($_FILES["imagen"]["tmp_name"], $ruta)){
                        $dataObtainded["imagen"] = $nom_img;
                    }
                }

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