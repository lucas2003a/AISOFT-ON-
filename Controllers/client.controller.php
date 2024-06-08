<?php

require_once "../Models/Client.php";

if (isset($_POST["action"])) {

    $client = new Client();

    switch ($_POST["action"]) {

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

            $tipo_persona = $_POST["tipo_persona"];

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
                "tipo_persona"    => $_POST["tipo_persona"],
                "idpersona"       => $_POST["idpersona"],
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

            echo json_encode($client->setClientNatural($dataObtained));

            break;



            //PERSONAS JURÍDICAS
        case "addLegalClient":

            $dataObtained = [
                "tipo_persona"     =>  $_POST["tipo_persona"],
                "razon_social"     =>  $_POST["razon_social"],
                "documento_tipo"   =>  $_POST["documento_tipo"],
                "documento_nro"    =>  $_POST["documento_nro"],
                "iddistrito"       =>  $_POST["iddistrito"],
                "direccion"        =>  $_POST["direccion"],
                "idusuario"        =>  1
            ];

            echo json_encode($client->addLegalClient($dataObtained));

            break;
        case "setLegalClient":

            $dataObtained = [
                "idcliente" => $_POST["idcliente"],
                "tipo_persona"      => $_POST["tipo_persona"],
                "idpersona_juridica" => $_POST["idpersona_juridica"],
                "razon_social"      => $_POST["razon_social"],
                "documento_tipo"    => $_POST["documento_tipo"],
                "documento_nro"     => $_POST["documento_nro"],
                "iddistrito"        => $_POST["iddistrito"],
                "direccion"         => $_POST["direccion"],
                "idusuario"         => 1,
            ];

            echo json_encode($client->setLegalClient($dataObtained));

            break;

            //REPRESENTANTES

        case "getRepresents":

            $idpersona_juridica = $_POST["idpersona_juridica"];

            echo json_encode($client->getRepresents($idpersona_juridica));

            break;

        case "addRepresents":

            $dataObtained = [
                "idpersona_juridica"    => $_POST["idpersona_juridica"],
                "representante_legal"    => $_POST["representante_legal"],
                "documento_tipo"        => $_POST["documento_tipo"],
                "documento_nro"         => $_POST["documento_nro"],
                "cargo"                 => $_POST["cargo"],
                "partida_elect"         => $_POST["partida_elect"],
                "estado"                => $_POST["estado"]
            ];

            echo json_encode($client->addRepresents($dataObtained));

            break;

        case "setRepresents":

            $dataObtained = [

                "idrepresentante"       => $_POST["idrepresentante"],
                "idpersona_juridica"    => $_POST["idpersona_juridica"],
                "representante_legal"   => $_POST["representante_legal"],
                "documento_tipo"        => $_POST["documento_tipo"],
                "documento_nro" => $_POST["documento_nro"],
                "cargo"         => $_POST["cargo"],
                "partida_elect" => $_POST["partida_elect"],
                "estado"        => $_POST["estado"]
            ];

            echo json_encode($client->setRepresents($dataObtained));
            break;

        case "inactiveRepresents":

            $idrepresentante = $_POST["idrepresentante"];

            echo json_encode($client->inactiveRepresents($idrepresentante));

            break;

        case "listClientsOnlyNperson":

            echo json_encode($client->listClientsOnlyNperson());
            break;

        case "inactiveClient":

            $dataObtained = [

                "idcliente"     =>  $_POST["idcliente"],
                "idusuario"     =>  1
            ];

            echo json_encode($client->inactiveClient($dataObtained));

            break;

            //CLIENTES EN VENTA REALIZADA

        case "listClientsForSale":

            echo json_encode($client->getClientsForSale());
            break;

        case "listClientsForSaleDN":

            $documento_nro = $_POST["documento_nro"];

            echo json_encode($client->getClientsForSaleDN($documento_nro));

            break;
        case "getClientsForSaleId":

            $idcliente = $_POST["idcliente"];

            echo json_encode($client->getClientsForSaleId($idcliente));
            break;
    }
}
