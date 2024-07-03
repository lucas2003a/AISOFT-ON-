<?php

session_start();

if(!isset($_SESSION["status"]) || !$_SESSION["status"]){

    
    header("Location:../../index.php");
}
/**
 * * Verfica los permisos en la url
 */

$permissions = $_SESSION["permissions"];

$currentURL = $_SERVER["REQUEST_URI"];
$parsed_url = parse_url($currentURL);
$path = $parsed_url["path"];

$direc
$urlArray = explode("/",    $currentURL);
$currentPage = $urlArray[count($urlArray)-2] . "/" . $urlArray[count($urlArray)-1];

$status = false;


foreach ($permissions as $permission) {
    
    $pagePermission = $permission["permiso"] . ".php";

    if($currentPage == $pagePermission){
        $status = true;
        break;
    }else{
        $status = false;
        
    }
    
    //echo "comparing {$currentPage} with {$pagePermission}<br>";
}

if(!$status){
    
    //header("HTTP/1.0 403 Forbidden");
    echo '
    <!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../../assets/img/iconos/Isotipo.png">
  <link rel="icon" type="image/png" href="../../assets/img/iconos/Isotipo.png">
  <title>
    My Aisoft
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="../../assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../../assets/css/nucleo-svg.css" rel="stylesheet" />

  <!-- ICONOS DE BOOTSTRAP -->
  <link rel="stylesheet" href="../../vendor/twbs/bootstrap-icons/font/bootstrap-icons.css">

  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="../../assets/css/nucleo-svg.css" rel="stylesheet" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <!-- CSS Files -->
  <link id="Viewstyle" href="../../assets/css/soft-ui-dashboard.css?v=1.0.7" rel="stylesheet" />
  <!-- Nepcha Analytics (nepcha.com) -->
  <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
  <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
</head>
<body>
<div style="display: flex; justify-content: center; align-items: center; height: 100vh;">
    <div style="text-align: center;">
        <img src="../../assets/img/iconos/error.png" alt="Error Icon" style="width: 100px; height: 100px;">
        <h1 style="font-size: 3rem; margin-top: 1rem;">Página restringida</h1>
        <p style="font-size: 1.2rem; margin-top: 0.5rem;">Lo sentimos, la página que estás buscando no existe o no tienes permiso para acceder.</p>
        <a href="../'. $_SESSION["home"] . '" class="btn btn-primary mt-3">Volver al Dashboard</a>
    </div>
</div>
    <footer>
    </footer>
</body>
</html>
';
    exit();
}

?>