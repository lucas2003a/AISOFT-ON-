<?php

require_once "../Models/Separation.php";
require_once "../Models/Configuration.php";

if(isset($_POST["action"])){

    $separation = new Separation();
    $config = new Configuration();

    switch($_POST["action"]){

        case "listSeparations": 

                echo json_encode($separation->listSeparations());
            break;


        case "listSeparationsAll": 

                echo json_encode($separation->listSeparationsAll());
            break;
        case "listSeparationsTPersona": 

                $dataObtained = [
                    "tipoPersona"   => $_POST['tipoPersona'],
                    "fechaInicio"   => $_POST['fechaInicio'],
                    "fechaFin"      => $_POST['fechaFin']
                ];

                echo json_encode($separation->listSeparationsTPersona($dataObtained));

            break;

        case "listSeparationsCampoCriterio":
            $dataObtained = [
                "tipoPersona"   =>  $_POST['tipoPersona'],
                "fechaInicio"   =>  $_POST['fechaInicio'],
                "fechaFin"      =>  $_POST['fechaFin'],
                "campoCriterio"  =>  $_POST['campoCriterio']
            ];

            echo json_encode($separation->listSeparationsNExpediente($dataObtained));
            break;

        case "listSeparationById": 
            
                $idseparacion = $_POST["idseparacion"];

                echo json_encode($separation->listSeparationById($idseparacion));
            break;

        case "listByIdAsset": 

            $idactivo = $_POST["idactivo"];

            echo json_encode($separation->listByIdAsset($idactivo));

            break;
        case "addSeparation": 
                $today = date("dhmYhis");
                $nom_img = "noImage.jpg";

                $dataConfig = [
                    "clave" => $_POST["clave"],
                    "valor" => $_POST["valor"]
                ];

                $dataObtained = [
                    "n_expediente"  => $_POST["n_expediente"],
                    "idactivo"      => $_POST["idactivo"],
                    "idcliente"     => $_POST["idcliente"],
                    "idconyugue"    => $_POST["idconyugue"],
                    "tipo_cambio"   => $_POST["tipo_cambio"],
                    "moneda_venta"  => $_POST["moneda_venta"],
                    "separacion_monto"  => $_POST["separacion_monto"],
                    "fecha_pago"        => $_POST["fecha_pago"],
                    "imagen"            => $nom_img,
                    "detalle"           => $_POST["detalle"],
                    "modalidad_pago"    => $_POST["modalidad_pago"],
                    "entidad_bancaria"  => $_POST["entidad_bancaria"],
                    "nro_operacion"     => $_POST["nro_operacion"],
                    "idusuario"         => 1
                    // "idusuario"     => $_POST["idusuario"]
                ];

                if(isset($_FILES["imagen"]) && $_FILES["imagen"]["size"] > 0){

                    $nom_img = sha1($today) . ".jpg";
                    $url = "../media/constancias_sep/".$nom_img;

                    if(move_uploaded_file($_FILES["imagen"]["tmp_name"],$url)){
                        $dataObtained["imagen"] = $nom_img;
                    }

                }else{

                    $dataObtained["imagen"] = $nom_img;
                }

                $data = $separation->addSeparation($dataObtained);
                
                if($data){

                    $config->upsetConfig($dataConfig);
                    echo json_encode($data);
                }
                
            break;

        case "setSeparation": 
                $today = date("dmYhis");
                $nom_img = "noImage.jpg";

                $dataObtained = [
                    "idseparacion"  => $_POST["idseparacion"],
                    "n_expediente"  => $_POST["n_expediente"],
                    "idactivo"      => $_POST["idactivo"],
                    "idcliente"     => $_POST["idcliente"],
                    "idconyugue"    => $_POST["idconyugue"],
                    "tipo_cambio"   => $_POST["tipo_cambio"],
                    "moneda_venta"  => $_POST["moneda_venta"],
                    "separacion_monto"  => $_POST["separacion_monto"],
                    "fecha_pago"        => $_POST["fecha_pago"],
                    "imagen"            => $nom_img,
                    "detalle"           => $_POST["detalle"],
                    "modalidad_pago"    => $_POST["modalidad_pago"],
                    "entidad_bancaria"  => $_POST["entidad_bancaria"],
                    "nro_operacion"     => $_POST["nro_operacion"],
                    "idusuario"         => 1
                    // "idusuario"     => $_POST["idusuario"]
                ];

                if(isset($_FILES["imagen"]) && $_FILES["imagen"]["size"] > 0){
                    $nom_img = sha1($today). ".jpg";
                    $url = "../media/constancias_sep/".$nom_img;

                    if(move_uploaded_file($_FILES["imagen"]["tmp_name"],$url)){
                        $dataObtained["imagen"] = $nom_img;
                    }
                }else{

                    $idseparacion = $_POST["idseparacion"];
                    $data = $separation->listSeparationById($idseparacion);

                    if($data){
                        $dataObtained["imagen"] = $data["imagen"];
                    }
                }

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