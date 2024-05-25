<?php

require_once "../Models/Separation.php";

if(isset($_POST["action"])){

    $separation = new Separation();

    switch($_POST["action"]){

        case "listSeparations": 

                echo json_encode($separation->listSeparations());
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
                $nom_img = null;

                $dataObtained = [
                    "n_expediente"  => $_POST["n_expediente"],
                    "idactivo"      => $_POST["idactivo"],
                    "idcliente"     => $_POST["idcliente"],
                    "idconyugue"    => $_POST["idconyugue"],
                    "separacion_monto" => $_POST["separacion_monto"],
                    "imagen"        => $nom_img,
                    "idusuario"     => 1
                    // "idusuario"     => $_POST["idusuario"]
                ];

                if(isset($_FILES["imagen"]) && $_FILES["imagen"]["size"] > 0){

                    $nom_img = sha1($today) . "jpg";
                    $url = "../media/constancias_sep".$nom_img;

                    if(move_uploaded_file($_FILES["imagen"]["tmp_name"],$url)){
                        $dataObtained["imagen"] = $nom_img;
                    }

                }else{

                    $dataObtained["imagen"] = $nom_img;
                }

                echo json_encode($separation->addSeparation($dataObtained));
                
            break;

        case "setSeparation": 
                $dataObtained = [
                    "idseparacion"  => $_POST["idseparacion"],
                    "n_expediente"  => $_POST["n_expediente"],
                    "idactivo"      => $_POST["idactivo"],
                    "idcliente"     => $_POST["idcliente"],
                    "idconyugue"    => $_POST["idconyugue"],
                    "separacion_monto" => $_POST["separacion_monto"],
                    "imagen"        => $_POST["imagen"],
                    "idusuario"     => 1
                    // "idusuario"     => $_POST["idusuario"]
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