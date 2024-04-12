<?php

require_once "../Models/Asset.php";

if(isset($_POST["action"])){

    $asset = new Asset();

    switch($_POST["action"]){

        case "listAssetProjectId": 

                $idPObtained = $_POST["idproyecto"];

                echo json_encode($asset->listAssetProjectId($idPObtained));
            break;
        
        case "
        
        
        
        
        ": 
            
                $dataObtained = [
                    "idproyecto"    =>  $_POST["idproyecto"],
                    "sublote"        =>  $_POST["sublote"]
                ];

                echo json_encode($asset->listAssetPASublote($dataObtained));
            break;

        case "listAssetId":
            
                $idactivo = $_POST["idactivo"];

                echo json_encode($asset->listAssetId($idactivo));

            break;
        
        case "addAsset": 

            $today = date("dmYhis");
            $nom_img = null;
            
                $dataObtained = [
                    "idproyecto"    => $_POST["idproyecto"],
                    "tipo_activo"   => $_POST["tipo_activo"],
                    "imagen"        => $nom_img, //se tiene que modificar el proceso de subir una imagen
                    "estado"        => $_POST["estado"],
                    "sublote"       => $_POST["sublote"],
                    "direccion"     => $_POST["direccion"],
                    "moneda_venta"  => $_POST["moneda_venta"],
                    "area_terreno"  => $_POST["area_terreno"],
                    "zcomunes_porcent"  => $_POST["zcomunes_porcent"],
                    "partida_elect"     => $_POST["partida_elect"],
                    "latitud"       => $_POST["latitud"],
                    "longitud"      => $_POST["longitud"],
                    "perimetro"     => $_POST["perimetro"],
                    "det_casa"      => $_POST["det_casa"],
                    "precio_venta"  => $_POST["precio_venta"],
                    "idusuario"     => 1
                    /* "idusuario"     => $_POST["idusuario"] */
                ];

                if(isset($_FILES["imagen"]) && $_FILES["imagen"]["size"] > 0){

                    $nom_img = sha1($today) . "jpg";
                    $ruta_img = "../media/lotes/" . $nom_img;

                    if(move_uploaded_file($_FILES["imagen"]["tmp_name"], $ruta_img)){

                        $dataObtained["imagen"] = $nom_img;
                    }
                }else{

                    $dataObtained["imagen"] = $nom_img;
                }

                echo json_encode($asset->addAsset($dataObtained));
            break;

        case "setAsset": 

                $today = date("dmYhis");
                $nom_img = null;
            
                $dataObtained = [
                    "idactivo"      => $_POST["idactivo"],
                    "idproyecto"    => $_POST["idproyecto"],
                    "tipo_activo"   => $_POST["tipo_activo"],
                    "imagen"        => $nom_img, //se tiene que modificar el proceso de subir una imagen
                    "estado"        => $_POST["estado"],
                    "sublote"       => $_POST["sublote"],
                    "direccion"     => $_POST["direccion"],
                    "moneda_venta"  => $_POST["moneda_venta"],
                    "area_terreno"  => $_POST["area_terreno"],
                    "zcomunes_porcent"  => $_POST["zcomunes_porcent"],
                    "partida_elect"     => $_POST["partida_elect"],
                    "latitud"       => $_POST["latitud"],
                    "longitud"      => $_POST["longitud"],
                    "perimetro"     => $_POST["perimetro"],
                    "det_casa"      => $_POST["det_casa"],
                    "precio_venta"  => $_POST["precio_venta"],
                    "idusuario"     => 1
                    /* "idusuario"     => $_POST["idusuario"] */
                ];
                
                if(isset($_FILES["imagen"]) && $_FILES["imagen"]["size"] > 0){

                    $nom_img = sha1($today) . ".jpg";

                    $ruta_img = "../media/lotes/" . $nom_img;

                    if(move_uploaded_file($_FILES["imagen"]["tmp_name"], $ruta_img)){

                        $dataObtained["imagen"] = $nom_img;
                    }

                }else{

                    $result = $asset->listAssetId($dataObtained["idactivo"]);

                    $dataObtained["imagen"] = $result["imagen"];
                }

                echo json_encode($asset->setAsset($dataObtained));

            break;
            
        case "inactiveAsset": 
            
                $idactivo = $_POST["idactivo"];
            
                echo json_encode($asset->inactiveAsset($idactivo));

            break;

        case "restoreAsset": 
            
                $idactivo = $_POST["idactivo"];

                echo json_encode($asset->restoreAsset($idactivo));
            
            break;
    }
}
?>