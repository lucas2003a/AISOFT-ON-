<?php

require_once "../Models/Separation.php";

if(isset($_POST["action"])){

    $separation = new Separation();

    switch($_POST["action"]){

        case "listSeparationsTPersona": 

                $dataObtained = [
                    "tipoPersona"   =>['tipoPersona'],
                    "fechaInicio"   =>['fechaInicio'],
                    "fechaFin"      =>['fechaFin']
                ];

                echo json_encode($separation->listSeparationsTPersona($dataObtained));

            break;

        case "listSeparationsNExpediente":
            $dataObtained = [
                "tipoPersona"   =>['tipoPersona'],
                "fechaInicio"   =>['fechaInicio'],
                "fechaFin"      =>['fechaFin'],
                "n_expediente"  =>['n_expediente']
            ];

            echo json_encode($separation->listSeparationsNExpediente($dataObtained));
        case "listSeparationsById": 
            
                $idseparacion = $_POST["idseparacion"];

                echo json_encode($separation->listSeparationById($idseparacion));
            break;

        case "listByIdAsset": 

            $idactivo = $_POST["idactivo"];

            echo json_encode($separation->listByIdAsset($idactivo));

            break;
        case "addSeparation": 
                $dataObtained = [
                    "n_expediente"  =>["n_expediente"],
                    "idactivo"      =>["idactivo"],
                    "idcliente"     =>["idcliente"],
                    "idconyugue"    =>["idconyugue"],
                    "separacion_monto" =>["separacion_monto"],
                    "imagen"        =>["imagen"],
                    "idusuario"     =>["idusuario"]
                ];

                echo json_encode($separation->addSeparation($dataObtained));
                
            break;

        case "setSeparation": 
                $dataObtained = [
                    "idseparacion"  =>["idseparacion"],
                    "n_expediente"  =>["n_expediente"],
                    "idactivo"      =>["idactivo"],
                    "idcliente"     =>["idcliente"],
                    "idconyugue"    =>["idconyugue"],
                    "separacion_monto" =>["separacion_monto"],
                    "imagen"        =>["imagen"],
                    "idusuario"     =>["idusuario"]
                ];

                echo json_encode($separation->setSeparation($dataObtained));

            break;

        case "inactiveSeparation": 
                $dataObtained = [

                    "idseparacion"  =>  $_POST["idseparacion"],
                    "idusuario"     => 1
                ];

                echo json_encode($separation->inactiveSeparation($dataObtained));
            break; 
        case "listNewClients": 

            echo json_encode($separation->listNewClients());
            
            break;
    };
}
?>