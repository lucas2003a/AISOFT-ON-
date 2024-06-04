<?php

require_once "../Models/Contract.php";

if(isset($_POST["action"])){

    $contract = new Contract();

    switch($_POST["action"]){

        case "listContractsAll": 
            echo json_encode($contracts = $contract->listContracts());
            break;
            
        case "listContractByType": 
            $type = $_POST["tipo_contrato"];

            echo json_encode($contract->listContractByType($type));
            break;

        case "listContractsByTypeDate": 

                $dataObtained = [
                    "tipo_contrato" => $_POST["tipo_contrato"],
                    "fecha_inicio" => $_POST["fecha_inicio"],
                    "fecha_fin" => $_POST["fecha_fin"]
                ];

                echo json_encode($contract->listContractsByTypeDate($dataObtained));

                break;

        case "listContractsByTypeDateNexpediente": 

                $dataObtained = [
                    "tipo_contrato" => $_POST["tipo_contrato"],
                    "fecha_inicio" => $_POST["fecha_inicio"],
                    "fecha_fin" => $_POST["fecha_fin"],
                    "n_expediente" => $_POST["n_expediente"]
                ];

                echo json_encode($contract->listContractsByTypeDateNexpediente($dataObtained));

                break;

        case "existContract": 

                $idseparacion = $_POST["idseparacion"];

                echo json_encode($contract->existContract($idseparacion));
            break;

        case "listContractId": 

                $idcontrato = $_POST["idcontrato"];

                echo json_encode($contract->listContractId($idcontrato));

            break;

        case "addContract": 
            
                $dataObtained = [

                    "n_expediente"                 => $_POST["n_expediente"],
                    "tipo_contrato"                => $_POST["tipo_contrato"],
                    "idseparacion"  => $_POST["idseparacion"],
                    "idrepresentante_primario" => $_POST["idrepresentante_primario"],
                    "idrepresentante_secundario"       => $_POST["idrepresentante_secundario"],
                    "idcliente"            => $_POST["idcliente"],
                    "idconyugue"          => $_POST["idconyugue"],
                    "idactivo"    => $_POST["idactivo"],
                    "tipo_cambio"    => $_POST["tipo_cambio"],
                    "estado"    => $_POST["estado"],
                    "fecha_contrato"    => $_POST["fecha_contrato"],
                    "precio_venta"    => $_POST["precio_venta"],
                    "det_contrato"    => $_POST["det_contrato"],
                    "archivo"    => $_POST["archivo"],
                    "idusuario"         => 1
                    // "idusuario"         => $_POST["idusuario"]
                ];
                
                echo json_encode($contract->addContract($dataObtained));
            break;

        case "setContract": 
            
                $dataObtained = [

                    "idcontrato"                => $_POST["idcontrato"],
                    "n_expediente"                 => $_POST["n_expediente"],
                    "tipo_contrato"                => $_POST["tipo_contrato"],
                    "idseparacion"  => $_POST["idseparacion"],
                    "idrepresentante_primario" => $_POST["idrepresentante_primario"],
                    "idrepresentante_secundario"       => $_POST["idrepresentante_secundario"],
                    "idcliente"            => $_POST["idcliente"],
                    "idconyugue"          => $_POST["idconyugue"],
                    "idactivo"    => $_POST["idactivo"],
                    "tipo_cambio"    => $_POST["tipo_cambio"],
                    "estado"    => $_POST["estado"],
                    "fecha_contrato"    => $_POST["fecha_contrato"],
                    "precio_venta"    => $_POST["precio_venta"],
                    "det_contrato"    => $_POST["det_contrato"],
                    "archivo"    => $_POST["archivo"],
                    "idusuario"         => 1
                    // "idusuario"         => $_POST["idusuario"]
                ];

                echo json_encode($contract->setContract($dataObtained));

            break;
        
        case "inactiveContract": 

                $idcontratoo = [

                    "idcontrato"    =>  $_POST["idcontrato"],
                    "idusuario"     =>  0
                ];

                echo json_encode($contract->inactiveContract($idcontrato));
                
                break;
                
            case "existsContractIdContract": 
                $idcontrato = $_POST["idcontrato"];
        
                echo json_encode($contract->existsContractIdContract($idcontrato));

                break;

        /********************************************  DETALLES DE CONTRATO ************************************************************/
        
        case "listDetContract": 
            
                $idcontrato = $_POST["idcontrato"];

                echo json_encode($contract->listDetContract($idcontrato));

            break;

        case "listDetContractById": 

                $iddetalle_contrato = $_POST["iddetalle_contrato"];

                echo json_encode($contract->listDetContractById($iddetalle_contrato));

                break;
            break;

        case "addDetContract": 
            
                $dataObtained = [

                    "idrepresentante"      => $_POST["idrepresentante"],
                    "idcontrato"     => $_POST["idcontrato"]
                ];

                echo json_encode($contract->addDetContract($dataObtained));
            
            break;
        
        case "setDetContract": 
            
                $dataObtained = [

                    "iddetalle_contrato"      => $_POST["iddetalle_contrato"],
                    "idrepresentante"      => $_POST["idrepresentante"],
                    "idcontrato"     => $_POST["idcontrato"]
                ];

                echo json_encode($contract->setDetContract($dataObtained));

            break;

        case "inactiveDetCont": 
            
                $iddetalle_contrato = $_POST["iddetalle_contrato"];

                echo json_encode($contract->inactiveDetCont($iddetalle_contrato));

            break;

    }
}
?>