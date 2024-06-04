<?php 

session_start();
require_once "../Models/User.php";

if(isset($_POST["action"])){

    $user = new User();

    switch($_POST["action"]){

        case "loginUser": 
            
            $correo = $_POST["correo"];

            $status = [
                "status" => false,
                "message" => "",
                "rol" => ""
            ];

            $data = $user->loginUser($correo);

            if(!$data){
                $_SESSION["status"] = false;
                $status["message"] = "El correo no existe";
            
            }else{

                $passwordEncript = $data["contrasenia"];
                $_SESSION["idusuario"] = $data["idusuario"];
                $_SESSION["imagen"] = $data["imagen"];
                $_SESSION["apellidos"] = $data["apellidos"];
                $_SESSION["nombres"] = $data["nombres"];
                $_SESSION["rol"] = $data["rol"];
                $_SESSION["direccion"] = $data["direccion"];

                if(password_verify($_POST["contrasenia"],$passwordEncript)){
                    
                    $_SESSION["status"] = true;
                    $status["status"] = true;
                    $status["rol"] = $data["rol"];
                    $status["message"] = "Usuario logueado correctamente";
                }else{
                    $_SESSION["status"] = false;
                    $status["message"] = "Contraseña incorrecta";
                }
            }

            echo json_encode($status);
            break;
    }
}

if(isset($_GET["action"])){

    if($_GET["action"]== "detroy"){

        session_destroy();
        session_unset();

        header("Location: ../index.php");
    }
}
?>