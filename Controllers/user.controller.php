<?php

session_start();
require_once "../Models/User.php";
require_once "../Models/Permission.php";
require_once "../Models/Configuration.php";

date_default_timezone_set("America/Lima");

if (isset($_POST["action"])) {

    $user = new User();
    $permission = new Permission();
    $config = new Configuration();

    switch ($_POST["action"]) {

        case "loginUser":

            $correo = $_POST["correo"];

            $status = [
                "status" => false,
                "message" => "",
                "rol" => ""
            ];

            $data = $user->loginUser($correo);

            if (!$data) {
                $_SESSION["status"] = false;
                $status["message"] = "El correo no existe";
            } else {

                $permissions = $permission->getPermissionByRol($data["idrol"]);

                $passwordEncript = $data["contrasenia"];
                $_SESSION["idusuario"] = $data["idusuario"];
                $_SESSION["imagen"] = $data["imagen"];
                $_SESSION["apellidos"] = $data["apellidos"];
                $_SESSION["nombres"] = $data["nombres"];
                $_SESSION["rol"] = $data["rol"];
                $_SESSION["permissions"] = $permissions;
                $_SESSION["direccion"] = $data["direccion"];

                if (password_verify($_POST["contrasenia"], $passwordEncript)) {
                    $home = $permission->getDashboardByRol($data["rol"]);

                    $_SESSION["status"] = true;
                    $_SESSION["home"] = $home;
                    $status["status"] = true;
                    $status["rol"] = $data["rol"];
                    $status["message"] = "Usuario logueado correctamente";

                    $status["data"] = $data;
                    $status["permissions"] = $permissions;
                    $status["home"] = $home;
                } else {
                    $_SESSION["status"] = false;
                    $status["message"] = "Contraseña incorrecta";
                }
            }

            echo json_encode($status);

            break;
        case 'listUsers':

            echo json_encode($user->listUsers());
            break;

        case 'addUser':

            $contrasenia = $config->listConfig("contrasenia");

            $today = date("dmYhis");
            $nomFile = null;

            $dataObtained = [
                'imagen'            => $nomFile,
                'nombres'           => $_POST["nombres"],
                'apellidos'         => $_POST["apellidos"],
                'documento_tipo'    => $_POST["documento_tipo"],
                'documento_nro'     => $_POST["documento_nro"],
                'estado_civil'      => $_POST["estado_civil"],
                'iddistrito'        => $_POST["iddistrito"],
                'direccion'         => $_POST["direccion"],
                'nacionalidad'      => $_POST["nacionalidad"],
                'correo'            => $_POST["correo"],
                'contrasenia'       => $contrasenia["valor"],
                'idrol'             => $_POST["idrol"],
                'idsede'            => $_POST["idsede"]
            ];

            if (isset($_FILES["imagen"]) && $_FILES["imagen"]["size"] > 0) {

                $nomFile = $today . ".jpg";
                $url = "../media/users/" . $nomFile;

                if (move_uploaded_file($_FILES["imagen"]["tmp_name"], $url)) {
                    $dataObtained["imagen"] = $nomFile;
                }
            } else {
                $dataObtained["imagen"] = null;
            }

            echo json_encode($user->addUser($dataObtained));
            break;
        case 'setUser':

            $today = date("dmYhis");
            $nomFile = null;

            $dataObtained = [
                'idusuario'         => $_POST["idusuario"],
                'imagen'            => $nomFile,
                'idpersona'         => $_POST["idpersona"],
                'nombres'           => $_POST["nombres"],
                'apellidos'         => $_POST["apellidos"],
                'documento_tipo'    => $_POST["documento_tipo"],
                'documento_nro'     => $_POST["documento_nro"],
                'estado_civil'      => $_POST["estado_civil"],
                'iddistrito'        => $_POST["iddistrito"],
                'direccion'         => $_POST["direccion"],
                'nacionalidad'      => $_POST["nacionalidad"],
                'correo'            => $_POST["correo"],
                'idrol'             => $_POST["idrol"],
                'idsede'            => $_POST["idsede"]
            ];
            
            if (isset($_FILES["imagen"]) && $_FILES["imagen"]["size"] > 0) {

                $nomFile = $today . ".jpg";
                $url = "../media/users/" . $nomFile;

                if (move_uploaded_file($_FILES["imagen"]["tmp_name"], $url)) {
                    $dataObtained["imagen"] = $nomFile;
                }
            } else {
                $dataUser = $user->getUser($_POST["idusuario"]);
                $dataObtained["imagen"] = $dataUser["imagen"];
            }

            echo json_encode($user->setUser($dataObtained));
            break;

        case 'inactiveUser':

            $idusuario = $_POST["idusuario"];
            echo json_encode($user->inactiveUser($idusuario));
            break;

        case 'getPerson':
            $documento_nro = $_POST["documento_nro"];
            echo json_encode($user->getPersonByDocument($documento_nro));
            break;


        case 'getUser':

            $idusuario = $_SESSION["idusuario"];
            echo json_encode($user->getUser($idusuario));
            break;

        case 'getUser_users':

            $idusuario = $_POST["idusuario"];
            echo json_encode($user->getUser($idusuario));
            break;
            /* -------------------------------------------------------------------------- */
            /*                                  GRÁFICOS                                  */
            /* -------------------------------------------------------------------------- */

        case 'chartEmployee':
            echo json_encode($user->chartEmployee());
            break;


        case 'getSalesEmployee':

            $idusuario = $_SESSION["idusuario"];

            echo json_encode($user->getSalesEmployee($idusuario));
            break;
    }
}

if (isset($_GET["action"])) {

    if ($_GET["action"] == "destroy") {

        session_destroy();
        session_unset();

        header("Location: ../index.php");
    }
}
