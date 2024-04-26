<?php

require_once "../Models/Client.php";

if(isset($_POST["action"])){

    $client = new Client();

    switch($_POST["action"]){

        case "listClientById":
            
            $idcliente = $_POST["idcliente"];

            echo json_encode($client->getClientById($idcliente));
            
            break;
        case "listClientDnro": 
            
                $dataObtained = [
                    "tipo_persona"     =>  $_POST["tipo_persona"],
                    "documento_nro"     =>  $_POST["documento_nro"]
                ];

                echo json_encode($client->listClientsDnro($dataObtained));
            
            break;

        case "listClienTperson": 

            $tipo_persona =$_POST["tipo_persona"];

            echo json_encode($client->listClientsTperson($tipo_persona));
            break;

        //PERSONA NATURALES
        case "addClientNatural": 
            
                $dataObtained = [

                    "tipo_persona"    => $_POST["tipo_persona"],
                    "nombres"         => $_POST["nombres"],
                    "apellidos"       => $_POST["apellidos"],
                    "documento_tipo"  => $_POST["documento_tipo"],
                    "documento_nro"   => $_POST["documento_nro"],
                    "estado_civil"    => $_POST["estado_civil"],
                    "iddistrito"      => $_POST["iddistrito"],
                    "direccion"       => $_POST["direccion"],
                    "nacionalidad"    => $_POST["nacionalidad"],
                    "idusuario"       => 1
                    
                ];

                echo json_encode($client->addClientNatural($dataObtained));
            
            break;

        case "setClientNatural": 
            
                $dataObtained = [

                    "idcliente"       => $_POST["idcliente"],
                    "nombres"         => $_POST["nombres"],
                    "apellidos"       => $_POST["apellidos"],
                    "documento_tipo"  => $_POST["documento_tipo"],
                    "documento_nro"   => $_POST["documento_nro"],
                    "estado_civil"    => $_POST["estado_civil"],
                    "iddistrito"      => $_POST["iddistrito"],
                    "direccion"       => $_POST["direccion"],
                    "idusuario"       => $_POST["idusuario"]
                    
                ];
                
                echo json_encode($client->setClientNatural($dataObtained));

            break;
            
        
        
        //PERSONAS JURÍDICAS
        case "addLegalClient": 

            $dataObtained = [
                "tipo_persona"     =>  $_POST["tipo_persona"],
                "razon_social"     =>  $_POST["razon_social"],
                "documento_tipo"   =>  $_POST["documento_tipo"],
                "documento_nro"    =>  $_POST["documento_nro"],
                "representante_legal"          =>  $_POST["representante_legal"],
                "documento_t_representante"    =>  $_POST["documento_t_representante"],
                "documento_nro_representante"  =>  $_POST["documento_nro_representante"],
                "partida_elect"    =>  $_POST["partida_elect"],
                "iddistrito"       =>  $_POST["iddistrito"],
                "direccion"        =>  $_POST["direccion"],
                "idusuario"        =>  1
            ];
    
            echo json_encode($client->addLegalClient($dataObtained));

        break;
        case "setLegalClient": 

            $dataObtained = [
                "idcliente"        =>  $_POST["idcliente"],
                "tipo_persona"     =>  $_POST["tipo_persona"],
                "razon_social"     =>  $_POST["razon_social"],
                "documento_tipo"   =>  $_POST["documento_tipo"],
                "documento_nro"    =>  $_POST["documento_nro"],
                "representante_legal"          =>  $_POST["representante_legal"],
                "documento_t_representante"    =>  $_POST["documento_t_representante"],
                "documento_nro_representante"  =>  $_POST["documento_nro_representante"],
                "partida_elect"    =>  $_POST["partida_elect"],
                "iddistrito"       =>  $_POST["iddistrito"],
                "direccion"        =>  $_POST["direccion"],
                "idusuario"        =>  1
            ];
    
            echo json_encode($client->setLegalClient($dataObtained));
        
        break;
        case "inactiveClient": 
            
                $idcliente = $_POST["idcliente"];

                echo json_encode($client->inactiveClient($idcliente));

            break;
    }
}
?>