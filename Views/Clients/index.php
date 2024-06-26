<!--
=========================================================
* Soft UI Dashboard - v1.0.7
=========================================================

* Product Page: https://www.creative-tim.com/product/soft-ui-dashboard
* Copyright 2023 Creative Tim (https://www.creative-tim.com)
* Licensed under MIT (https://www.creative-tim.com/license)
* Coded by Creative Tim

=========================================================

* The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
-->
<?php

session_start();

if(!isset($_SESSION["status"]) || !$_SESSION["status"]){
  header("Location:../../index.php");
}
?>
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

<body class="g-sidenav-show  bg-gray-100">
  <aside class="sidenav navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-3 " id="sidenav-main">
    <div class="sidenav-header">
      <i class="fas fa-times p-3 cursor-pointer text-secondary opacity-5 position-absolute end-0 top-0 d-none d-xl-none" aria-hidden="true" id="iconSidenav"></i>
      <a class="navbar-brand m-0" href=" https://demos.creative-tim.com/soft-ui-dashboard/Views/dashboard.html " target="_blank">
        <img src="../../assets/img/iconos/Isotipo.png" class="navbar-brand-img h-100" alt="main_logo">
        <span class="ms-1 font-weight-bold">MY AISOFT</span>
      </a>
    </div>
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
      <ul class="navbar-nav">

        <!-- DASHBOARD -->
        <li class="nav-item">
          <a class="nav-link" href="../../Views/dashboard.html">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 45 40" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>shop </title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1716.000000, -439.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g transform="translate(0.000000, 148.000000)">
                        <path class="color-background opacity-6" d="M46.7199583,10.7414583 L40.8449583,0.949791667 C40.4909749,0.360605034 39.8540131,0 39.1666667,0 L7.83333333,0 C7.1459869,0 6.50902508,0.360605034 6.15504167,0.949791667 L0.280041667,10.7414583 C0.0969176761,11.0460037 -1.23209662e-05,11.3946378 -1.23209662e-05,11.75 C-0.00758042603,16.0663731 3.48367543,19.5725301 7.80004167,19.5833333 L7.81570833,19.5833333 C9.75003686,19.5882688 11.6168794,18.8726691 13.0522917,17.5760417 C16.0171492,20.2556967 20.5292675,20.2556967 23.494125,17.5760417 C26.4604562,20.2616016 30.9794188,20.2616016 33.94575,17.5760417 C36.2421905,19.6477597 39.5441143,20.1708521 42.3684437,18.9103691 C45.1927731,17.649886 47.0084685,14.8428276 47.0000295,11.75 C47.0000295,11.3946378 46.9030823,11.0460037 46.7199583,10.7414583 Z"></path>
                        <path class="color-background" d="M39.198,22.4912623 C37.3776246,22.4928106 35.5817531,22.0149171 33.951625,21.0951667 L33.92225,21.1107282 C31.1430221,22.6838032 27.9255001,22.9318916 24.9844167,21.7998837 C24.4750389,21.605469 23.9777983,21.3722567 23.4960833,21.1018359 L23.4745417,21.1129513 C20.6961809,22.6871153 17.4786145,22.9344611 14.5386667,21.7998837 C14.029926,21.6054643 13.533337,21.3722507 13.0522917,21.1018359 C11.4250962,22.0190609 9.63246555,22.4947009 7.81570833,22.4912623 C7.16510551,22.4842162 6.51607673,22.4173045 5.875,22.2911849 L5.875,44.7220845 C5.875,45.9498589 6.7517757,46.9451667 7.83333333,46.9451667 L19.5833333,46.9451667 L19.5833333,33.6066734 L27.4166667,33.6066734 L27.4166667,46.9451667 L39.1666667,46.9451667 C40.2482243,46.9451667 41.125,45.9498589 41.125,44.7220845 L41.125,22.2822926 C40.4887822,22.4116582 39.8442868,22.4815492 39.198,22.4912623 Z"></path>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Dashboard</span>
          </a>
        </li>

        <!-- PROYECTOS -->
        <li class="nav-item">
          <a class="nav-link" href="../projects/index.php">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>office</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                        <path class="color-background opacity-6" d="M12.25,17.5 L8.75,17.5 L8.75,1.75 C8.75,0.78225 9.53225,0 10.5,0 L31.5,0 C32.46775,0 33.25,0.78225 33.25,1.75 L33.25,12.25 L29.75,12.25 L29.75,3.5 L12.25,3.5 L12.25,17.5 Z"></path>
                        <path class="color-background" d="M40.25,14 L24.5,14 C23.53225,14 22.75,14.78225 22.75,15.75 L22.75,38.5 L19.25,38.5 L19.25,22.75 C19.25,21.78225 18.46775,21 17.5,21 L1.75,21 C0.78225,21 0,21.78225 0,22.75 L0,40.25 C0,41.21775 0.78225,42 1.75,42 L40.25,42 C41.21775,42 42,41.21775 42,40.25 L42,15.75 C42,14.78225 41.21775,14 40.25,14 Z M12.25,36.75 L7,36.75 L7,33.25 L12.25,33.25 L12.25,36.75 Z M12.25,29.75 L7,29.75 L7,26.25 L12.25,26.25 L12.25,29.75 Z M35,36.75 L29.75,36.75 L29.75,33.25 L35,33.25 L35,36.75 Z M35,29.75 L29.75,29.75 L29.75,26.25 L35,26.25 L35,29.75 Z M35,22.75 L29.75,22.75 L29.75,19.25 L35,19.25 L35,22.75 Z"></path>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Proyectos</span>
          </a>
        </li>

        <!-- CLIENTES -->
        <li class="nav-item active">
          <a class="nav-link  active" href="../Clients/index.php">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>office</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                        <path class="color-background opacity-6" d="M12.25,17.5 L8.75,17.5 L8.75,1.75 C8.75,0.78225 9.53225,0 10.5,0 L31.5,0 C32.46775,0 33.25,0.78225 33.25,1.75 L33.25,12.25 L29.75,12.25 L29.75,3.5 L12.25,3.5 L12.25,17.5 Z"></path>
                        <svg class="color-background" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                          <path  d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5m.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1z"/>
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Clientes</span>
          </a>
        </li>
        <!-- PRSUPUESTOS -->
        <li class="nav-item">
          <a class="nav-link" href="../budgets/index.php">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>office</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                        <path class="color-background opacity-6" d="M12.25,17.5 L8.75,17.5 L8.75,1.75 C8.75,0.78225 9.53225,0 10.5,0 L31.5,0 C32.46775,0 33.25,0.78225 33.25,1.75 L33.25,12.25 L29.75,12.25 L29.75,3.5 L12.25,3.5 L12.25,17.5 Z"></path>
                        <svg  class="color-background" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-calculator" viewBox="0 0 16 16">
                          <path d="M12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z"/>
                          <path d="M4 2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5zm0 4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5z"/>
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Presupuestos</span>
          </a>
        </li>
        <!-- SEPARACIONES -->
        <li class="nav-item">
          <a class="nav-link " href="../separations/index.php">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>office</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                        <svg class="color-background" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-list-stars" viewBox="0 0 16 16">
                          <path fill-rule="evenodd" d="M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5" />
                          <path d="M2.242 2.194a.27.27 0 0 1 .516 0l.162.53c.035.115.14.194.258.194h.551c.259 0 .37.333.164.493l-.468.363a.28.28 0 0 0-.094.3l.173.569c.078.256-.213.462-.423.3l-.417-.324a.27.27 0 0 0-.328 0l-.417.323c-.21.163-.5-.043-.423-.299l.173-.57a.28.28 0 0 0-.094-.299l-.468-.363c-.206-.16-.095-.493.164-.493h.55a.27.27 0 0 0 .259-.194zm0 4a.27.27 0 0 1 .516 0l.162.53c.035.115.14.194.258.194h.551c.259 0 .37.333.164.493l-.468.363a.28.28 0 0 0-.094.3l.173.569c.078.255-.213.462-.423.3l-.417-.324a.27.27 0 0 0-.328 0l-.417.323c-.21.163-.5-.043-.423-.299l.173-.57a.28.28 0 0 0-.094-.299l-.468-.363c-.206-.16-.095-.493.164-.493h.55a.27.27 0 0 0 .259-.194zm0 4a.27.27 0 0 1 .516 0l.162.53c.035.115.14.194.258.194h.551c.259 0 .37.333.164.493l-.468.363a.28.28 0 0 0-.094.3l.173.569c.078.255-.213.462-.423.3l-.417-.324a.27.27 0 0 0-.328 0l-.417.323c-.21.163-.5-.043-.423-.299l.173-.57a.28.28 0 0 0-.094-.299l-.468-.363c-.206-.16-.095-.493.164-.493h.55a.27.27 0 0 0 .259-.194z" />
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Separaciones</span>
          </a>
        </li>

        <!-- DEVOLUCIONES -->
        <li class="nav-item">
          <a class="nav-link " href="../refunds/index.php">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>office</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                      <svg class="color-background" xmlns="http://www.w3.org/2000/svg"  width="50" height="50" fill="currentColor" class="bi bi-backspace-fill" viewBox="0 0 16 16">
                          <path d="M15.683 3a2 2 0 0 0-2-2h-7.08a2 2 0 0 0-1.519.698L.241 7.35a1 1 0 0 0 0 1.302l4.843 5.65A2 2 0 0 0 6.603 15h7.08a2 2 0 0 0 2-2zM5.829 5.854a.5.5 0 1 1 .707-.708l2.147 2.147 2.146-2.147a.5.5 0 1 1 .707.708L9.39 8l2.146 2.146a.5.5 0 0 1-.707.708L8.683 8.707l-2.147 2.147a.5.5 0 0 1-.707-.708L7.976 8z" />
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Devoluciones</span>
          </a>
        </li>

        <!-- CUOTAS -->
        <li class="nav-item">
          <a class="nav-link" href="../quotas/index.php">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>office</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                        <svg class="color-background" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-credit-card" viewBox="0 0 16 16">
                          <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1z"/>
                          <path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"/>
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Cuotas</span>
          </a>
        </li>

        <!-- USUARIOS -->
        <li class="nav-item">
          <a class="nav-link" href="../users/index.php">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>office</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                        <svg class="color-background" xmlns="http://www.w3.org/2000/svg" width="40" height="50" fill="currentColor" class="bi bi-people-fill" viewBox="0 0 16 16">
                          <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5"/>
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Usuarios</span>
          </a>
        </li>

        <!-- CONTRATOS -->
        <li class="nav-item">
          <a class="nav-link" href="../contracts/index.php">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>office</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                        <svg class="color-background" xmlns="http://www.w3.org/2000/svg" width="50" height="43" fill="currentColor" class="bi bi-file-earmark-font" viewBox="0 0 16 16">
                          <path d="M10.943 6H5.057L5 8h.5c.18-1.096.356-1.192 1.694-1.235l.293-.01v5.09c0 .47-.1.582-.898.655v.5H9.41v-.5c-.803-.073-.903-.184-.903-.654V6.755l.298.01c1.338.043 1.514.14 1.694 1.235h.5l-.057-2z"/>
                          <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5z"/>
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Contratos</span>
          </a>
        </li>

        <!-- MONITOREO -->
        <li class="nav-item">
          <a class="nav-link" href="../contracts/index.php">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>office</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                        <svg class="color-background" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-eye" viewBox="0 0 16 16">
                          <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z"/>
                          <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0"/>
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Monitoreo</span>
          </a>
        </li>
        
        <li class="nav-item mt-3">
          <h6 class="ps-4 ms-2 text-uppercase text-xs font-weight-bolder opacity-6">Panel de usuario</h6>
        </li>

        <!-- PERFIL -->
        <li class="nav-item">
          <a class="nav-link  " href="../Views/profile.html">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 46 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>customer-support</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1717.000000, -291.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g transform="translate(1.000000, 0.000000)">
                        <path class="color-background opacity-6" d="M45,0 L26,0 C25.447,0 25,0.447 25,1 L25,20 C25,20.379 25.214,20.725 25.553,20.895 C25.694,20.965 25.848,21 26,21 C26.212,21 26.424,20.933 26.6,20.8 L34.333,15 L45,15 C45.553,15 46,14.553 46,14 L46,1 C46,0.447 45.553,0 45,0 Z"></path>
                        <path class="color-background" d="M22.883,32.86 C20.761,32.012 17.324,31 13,31 C8.676,31 5.239,32.012 3.116,32.86 C1.224,33.619 0,35.438 0,37.494 L0,41 C0,41.553 0.447,42 1,42 L25,42 C25.553,42 26,41.553 26,41 L26,37.494 C26,35.438 24.776,33.619 22.883,32.86 Z"></path>
                        <path class="color-background" d="M13,28 C17.432,28 21,22.529 21,18 C21,13.589 17.411,10 13,10 C8.589,10 5,13.589 5,18 C5,22.529 8.568,28 13,28 Z"></path>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Perfil</span>
          </a>
        </li>

        <!-- CERRAR SESIÓN -->
        <li class="nav-item">
          <a class="nav-link  " href="../Views/sign-in.html">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 40 44" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>document</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1870.000000, -591.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g transform="translate(154.000000, 300.000000)">
                        <path class="color-background opacity-6" d="M40,40 L36.3636364,40 L36.3636364,3.63636364 L5.45454545,3.63636364 L5.45454545,0 L38.1818182,0 C39.1854545,0 40,0.814545455 40,1.81818182 L40,40 Z"></path>
                        <path class="color-background" d="M30.9090909,7.27272727 L1.81818182,7.27272727 C0.814545455,7.27272727 0,8.08727273 0,9.09090909 L0,41.8181818 C0,42.8218182 0.814545455,43.6363636 1.81818182,43.6363636 L30.9090909,43.6363636 C31.9127273,43.6363636 32.7272727,42.8218182 32.7272727,41.8181818 L32.7272727,9.09090909 C32.7272727,8.08727273 31.9127273,7.27272727 30.9090909,7.27272727 Z M18.1818182,34.5454545 L7.27272727,34.5454545 L7.27272727,30.9090909 L18.1818182,30.9090909 L18.1818182,34.5454545 Z M25.4545455,27.2727273 L7.27272727,27.2727273 L7.27272727,23.6363636 L25.4545455,23.6363636 L25.4545455,27.2727273 Z M25.4545455,20 L7.27272727,20 L7.27272727,16.3636364 L25.4545455,16.3636364 L25.4545455,20 Z"></path>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>
            </div>
            <span class="nav-link-text ms-1">Cerrar sesión</span>
          </a>
        </li>

      </ul>
    </div>
  </aside>
  <main class="main-content position-relative max-height-vh-100 h-100 border-radius-lg ">
    <!-- Navbar -->
    <nav class="navbar navbar-main navbar-expand-lg px-0 mx-4 shadow-none border-radius-xl" id="navbarBlur" navbar-scroll="true">
      <div class="container-fluid py-1 px-3">
        <nav aria-label="breadcrumb">
          <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 px-0 me-sm-6 me-5">
          <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="#">Dashboard</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Clientes</li>
          </ol>
          <h6 class="font-weight-bolder mb-0" id="cabezera">CLIENTES </h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">
          
          <ul class="navbar-nav  justify-content-end">
            
            <li class="nav-item d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none">Sign In</span>
              </a>
            </li>
            <li class="nav-item d-xl-none ps-3 d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body p-0" id="iconNavbarSidenav">
                <div class="sidenav-toggler-inner">
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                  <i class="sidenav-toggler-line"></i>
                </div>
              </a>
            </li>
            
          </ul>
        </div>
      </div>
    </nav>

    <!-- End Navbar -->
    <div class="container py-4">

    <!-- CONTENIDO -->

    <div class="row">
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-md-6">

                  <h6>Tabla - clientes</h6>
                </div>
                <div class="col-md-6">
                  
                  
                </div>
              </div>
              <div class="row d-flex" style="justify-content: space-between;">
                
                <div class="col-md-3 d-grid">
                  <a class="btn btn-outline-success btn-sm mb-0 me-3" href="./add_client.php" id="add-asset">AGREGAR CLIENTE</a>
                </div>

                <div class="col-md-6">

                  <div class="row">

                    <div class="col-md-6">
                      
                      <select name="tipo_persona" class="form-select" id="tipo_persona">
                        <option value="NATURAL" selected>Tipo de persona</option>
                        <option value="JURÍDICA">Jurídica</option>
                        <option value="NATURAL">Natural</option>
                      </select>
                    </div>
    
                    <div class="col-md-6">
                      <div class="ms-md-auto pe-md-3 d-flex align-items-center">
                        <div class="input-group">
                          <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
                          <input type="text" class="form-control" placeholder="Nº documento..." id="in-doumento-tipo">
                        </div>
                      </div>
                    </div>
                  </div>

                </div>

              </div>
            </div>
            <div class="card-body px-0 pt-0 pb-2 mt-4">
              <div class="table-responsive text-center p-0">
                <hr>
                  <table class="table align-items-center mb-0 table-hover" id="table-clients">
                    <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">#</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">Tipo de persona</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">Cliente</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">Tipo de documento</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">Nº de documento</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">Operaciones</th>
                    </tr>
                  </thead>
                  <tbody>
                    
                  <!-- RENDER -->

                  </tbody>
                </table>
                <div id="render-error">

                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    <footer class="footer pt-3  ">
        <div class="container-fluid">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
              <div class="copyright text-center text-sm text-muted text-lg-start">
                © <script>
                  document.write(new Date().getFullYear())
                </script>,
                auspiciado por
                <a href="https://www.creative-tim.com" class="font-weight-bold" target="_blank">A.I.F Contratistas Generales S.A.C</a>
                (sistema web).
              </div>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </main>
  <div class="fixed-plugin">
    <a class="fixed-plugin-button text-dark position-fixed px-3 py-2">
      <i class="fa fa-cog py-2"> </i>
    </a>
    <div class="card shadow-lg ">
      <div class="card-header pb-0 pt-3 ">
        <div class="float-start">
          <h5 class="mt-3 mb-0">Soft UI Configurator</h5>
          <p>See our dashboard options.</p>
        </div>
        <div class="float-end mt-4">
          <button class="btn btn-link text-dark p-0 fixed-plugin-close-button">
            <i class="fa fa-close"></i>
          </button>
        </div>
        <!-- End Toggle Button -->
      </div>
      <hr class="horizontal dark my-1">
      <div class="card-body pt-sm-3 pt-0">
        <!-- Sidebar Backgrounds -->
        <div>
          <h6 class="mb-0">Colores para el sidebar</h6>
        </div>
        <a href="javascript:void(0)" class="switch-trigger background-color">
          <div class="badge-colors my-2 text-start">
            <span class="badge filter bg-gradient-primary active" data-color="primary" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-dark" data-color="dark" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-info" data-color="info" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-success" data-color="success" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-warning" data-color="warning" onclick="sidebarColor(this)"></span>
            <span class="badge filter bg-gradient-danger" data-color="danger" onclick="sidebarColor(this)"></span>
          </div>
        </a>
        <!-- Sidenav Type -->
        <div class="mt-3">
          <h6 class="mb-0">Tipo de sidebar</h6>
          <p class="text-sm">Puedes escojer entre dos tipos de sidebar.</p>
        </div>
        <div class="d-flex">
          <button class="btn bg-gradient-primary w-100 px-3 mb-2 active" data-class="bg-transparent" onclick="sidebarType(this)">Transparent</button>
          <button class="btn bg-gradient-primary w-100 px-3 mb-2 ms-2" data-class="bg-white" onclick="sidebarType(this)">White</button>
        </div>
        <p class="text-sm d-xl-none d-block mt-2">Solo puedes cambiar la transparecia del seidebar en la vista de escritorio.</p>

        <!-- Navbar Fixed -->
        <div class="mt-3">
          <h6 class="mb-0">Navbar flotante</h6>
        </div>
        <div class="form-check form-switch ps-0">
          <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)">
        </div>
      </div>
    </div>
  </div>

             
            
  
  <!-- MODAL -->
  <!-- Button trigger modal -->
  <!-- Modal -->
  <div class="modal fade" id="data_full_client" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-xl modal-fullscreen-sm-down" role="document">
      <div class="modal-content">
        <div class="modal-header bg-secondary">
          <h5 class="modal-title" id="modalTitle">
            Modal title
          </h5>
          <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div class="row">
            <div class="col-md-6">
              <div class="row">
                
                <div class="col-md-6">
                  <div class="card"  style="height: 100%;">
                    <div class="card-header mx-4 p-3 text-center">
                      <div class="icon icon-shape icon-lg bg-primary shadow text-center border-radius-lg">
                      <i class="fa-solid fa-calendar-days"></i>
                      </div>
                    </div>
                    <div class="card-body pt-0 p-3 text-center">
                      <h6 class="text-center mb-0">Cuota actual</h6>
                      <h6 class="text-center mb-0"></h6>
                      <hr class="horizontal dark my-3">
                      <h5 class="mb-0" id="cuota_actual">30/12/24</h5>
                    </div>
                  </div>
                </div>

                <div class="col-md-6 mt-md-0 mt-4">
                  <div class="card"  style="height: 100%;">
                    <div class="card-header mx-4 p-3 text-center">
                      <div class="icon icon-shape icon-lg bg-primary shadow text-center border-radius-lg">
                      <i class="fa-solid fa-calendar-days"></i>
                      </div>
                    </div>
                    <div class="card-body pt-0 p-3 text-center">
                      <h6 class="text-center mb-0">Cuota próxima</h6>
                      <hr class="horizontal dark my-3">
                      <h5 class="mb-0" id="proxima couta">20/04/2025</h5>
                    </div>
                  </div>
                </div>
              </div>

              <div class="row mt-4">
              <div class="table-responsive table-responsive-lg">
                      <table class="table align-items-center mb-0 table-hover" id="table-clients">
                        <thead>
                          <tr>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">#</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Proyecto</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Sublote</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Deuda</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Monto pagado</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Saldo</th>
                          </tr>
                        </thead>
                        <tbody>
                          <tr>
                            <td>1</td>
                            <td>San Blas</td>
                            <td>12</td>
                            <td>5000.00</td>
                            <td>4000.00</td>
                            <td>1000.00</td>
                          </tr>
                          <tr>
                            <td>2</td>
                            <td>San Blas</td>
                            <td>12</td>
                            <td>5000.00</td>
                            <td>4000.00</td>
                            <td>1000.00</td>
                          </tr>
                        <!-- RENDER NUEVOS CLIENTES  -->
                        
                        </tbody>
                      </table>
                    </div>
              </div>
            </div>

            <div class="col-md-6 mt-4">
              <div class="card h-100">
              <div class="card-header pb-0 p-3">
                <div class="row">
                  <div class="col-6 d-flex align-items-center">
                    <h6 class="mb-0"><strong>Información</strong></h6>
                  </div>
                  <hr>
                </div>
              </div>
              <div class="card-body p-3 pb-0">
                <ul class="list-group" id="data-client-modal">

                  <!-- RENDER DE INFORMACIÓN DEL CLIENTE -->
                </ul>

              </div>
            
            </div>
          </div>
          </div>        
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" data-bs-dismiss="modal">
            Cerrar
          </button>
        </div>
      </div>
    </div>
  </div>

  <!-- JQUERY -->
  <!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
  <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script> -->

  <!-- SWEET ALERT -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!--   Core JS Files   -->
  <script src="../../assets/js/core/popper.min.js"></script>
  <script src="../../assets/js/core/bootstrap.min.js"></script>
  <script src="../../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../../assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="../../assets/js/plugins/chartjs.min.js"></script>
  <script src="../../assets/js/globalFunctions.js"></script>
  <script src="../../assets/js/sweetAlert.js"></script>

  <!-- <script>
    $(document).ready(function(){

      $('#table-clients').DataTable();
    });

  </script> -->
  <script>
document.addEventListener("DOMContentLoaded",()=>{

  /* INSTANCIAS */
  const global = new FunGlobal();

  const $ = id => global.$(id);
  const $All = id => global.$All(id);

  let timer;

  //Obtiene los datos del o los reppresentantes legales
  async function getRepresents(id){

    try{

      let url ="../../Controllers/client.controller.php";
      let params = new FormData();
  
      params.append("action","getRepresents");
      params.append("idpersona_juridica",id);

      results = await global.sendAction(url, params);

      if(results){

        console.log(results)
        return results;
      }else{
        console.log("no hay resultados")
      }
    }
    catch(e){
      console.error(e);
    }
  }

  async function getClientModal(id){

    try{

      let url ="../../Controllers/client.controller.php";
      let params = new FormData();
  
      params.append("action","listClientById");
      params.append("idcliente",id);

      results = await global.sendAction(url, params);

      if(results){

        console.log(results);
        dataClient = results;

        $("#data-client-modal").innerHTML = ""; 

        for(let key in dataClient){

          if(dataClient[key] == undefined){
            dataClient[key] = "POR REGISTRAR";
          }
        }

        let row = "";
        row = `
            <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
              <div class="d-flex flex-column">
                <h6 class="mb-1 text-dark font-weight-bold text-sm">Tipo persona</h6>
              </div>
              <div class="d-flex align-items-center text-sm">
                    ${dataClient.tipo_persona}
                </div>
            </li>

            <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
              <div class="d-flex flex-column">
                <h6 class="mb-1 text-dark font-weight-bold text-sm">Tipo de documento</h6>
              </div>
              <div class="d-flex align-items-center text-sm">
                    ${dataClient.documento_tipo}
                </div>
            </li>

            <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
              <div class="d-flex flex-column">
                <h6 class="mb-1 text-dark font-weight-bold text-sm">Tipo de documento</h6>
              </div>
              <div class="d-flex align-items-center text-sm">
                    ${dataClient.documento_nro}
                </div>
            </li>
        `;

        if(dataClient.tipo_persona == "JURÍDICA"){
          $("#modalTitle").innerHTML = dataClient.razon_social;
          
          row += `

            <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
              <div class="d-flex flex-column">
                <h6 class="mb-1 text-dark font-weight-bold text-sm">Razón social</h6>
              </div>
              <div class="d-flex align-items-center text-sm">
                    ${dataClient.razon_social}
                </div>
            </li>

            <hr>
            <h6><strong>Datos del representante :</strong></h6>
            <br>`;
            
          let dataRepresents = await getRepresents(dataClient.idpersona_juridica);

          console.log(dataRepresents);
          dataRepresents.forEach(represent => {

            row +=  `
              <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                <div class="d-flex flex-column">
                  <h6 class="mb-1 text-dark font-weight-bold text-sm">Nombres y apellidos</h6>
                </div>
                <div class="d-flex align-items-center text-sm">
                      ${represent.representante_legal || "POR REGISTRAR"}
                  </div>
              </li>
  
              <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                <div class="d-flex flex-column">
                  <h6 class="mb-1 text-dark font-weight-bold text-sm">Tipo de documento</h6>
                </div>
                <div class="d-flex align-items-center text-sm">
                      ${represent.documento_tipo || "POR REGISTRAR"}
                  </div>
              </li>
  
              <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                <div class="d-flex flex-column">
                  <h6 class="mb-1 text-dark font-weight-bold text-sm">Nº de documento</h6>
                </div>
                <div class="d-flex align-items-center text-sm">
                      ${represent.documento_nro || "POR REGISTRAR"}
                  </div>
              </li>
  
              <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                <div class="d-flex flex-column">
                  <h6 class="mb-1 text-dark font-weight-bold text-sm">Cargo</h6>
                </div>
                <div class="d-flex align-items-center text-sm">
                      ${represent.cargo || "POR REGISTRAR"}
                  </div>
              </li>
  
              <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                <div class="d-flex flex-column">
                  <h6 class="mb-1 text-dark font-weight-bold text-sm">Partida electrónica</h6>
                </div>
                <div class="d-flex align-items-center text-sm">
                      ${represent.partida_elect || "POR REGISTRAR"}
                  </div>
              </li>
              <hr>
              `;
          });

        }else{
          $("#modalTitle").innerHTML = dataClient.apellidos + ", " + dataClient.nombres;
          row += `
            <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
              <div class="d-flex flex-column">
                <h6 class="mb-1 text-dark font-weight-bold text-sm">Apellidos</h6>
              </div>
              <div class="d-flex align-items-center text-sm">
                    ${dataClient.apellidos}
                </div>
            </li>

            <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
              <div class="d-flex flex-column">
                <h6 class="mb-1 text-dark font-weight-bold text-sm">Nombres</h6>
              </div>
              <div class="d-flex align-items-center text-sm">
                    ${dataClient.nombres}
                </div>
            </li>

            <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
              <div class="d-flex flex-column">
                <h6 class="mb-1 text-dark font-weight-bold text-sm">Estado civil</h6>
              </div>
              <div class="d-flex align-items-center text-sm">
                    ${dataClient.estado_civil}
                </div>
            </li>

            <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
              <div class="d-flex flex-column">
                <h6 class="mb-1 text-dark font-weight-bold text-sm">Nacionalidad</h6>
              </div>
              <div class="d-flex align-items-center text-sm">
                    ${dataClient.nacionalidad}
                </div>
            </li>

            `;
        }

        $("#data-client-modal").innerHTML += row;
      }
    }
    catch(e){
      console.error(e);
    }
  };

  function renderClients(results){

    let numberRow = 1;

    $("#table-clients tbody").innerHTML = "";
    $("#render-error").innerHTML = "";

    let newRow = ``;

    if(results.length > 0){
    console.log(results)
      results.forEach(client =>{
        
        let code = btoa(client.idcliente) //CODIFICACIÓN
  
        let clientNames = client.tipo_persona == "NATURAL" ? `<strong class="text-uppercase">${client.apellidos}</strong>, ${client.nombres}` :
                        `<strong class="text-uppercase">${client.razon_social}</strong>`;
        newRow = `
                <tr>
                  <td>
                    <div class="d-flex px-2 py-1">
                      <div class="d-flex flex-column justify-content-center">
                        <h6 class="mb-0 text-sm">${numberRow}</h6>
                      </div>
                    </div>
                  </td>
                  <td>
                    <p class="text-xs font-weight-bold mb-0">${client.tipo_persona}</p>
                    </td>
                    <td class="align-middle text-center text-sm">
                      ${clientNames}
                    </td>
                    <td>
                      <p class="text-xs font-weight-bold mb-0">${client.documento_tipo}</p>
                    </td>
                  <td>
                    <p class="text-xs font-weight-bold mb-0">${client.documento_nro}</p>
                  </td>
                  <td class="align-middle">
                    <div class="btn-group">
                        <a type="button" href="./delete_client.php?id=${code}" class="btn btn-link text-danger text-gradient px-3 mb-0"><i class="bi bi-trash-fill"></i></a>
                        <a type="button" href="./edit_client.php?id=${code}" class="btn btn-link text-dark px-3 mb-0"><i class="bi bi-pencil-fill"></i></a>
                        <a type="button" href="#" class="btn btn-link text-success px-3 mb-0 openModal" data-bs-toggle="modal" data-bs-target="#data_full_client" data-id="${client.idcliente}"><i class="bi bi-arrow-right-square openModal" data-id="${client.idcliente}"></i></a>
                      </div>
                  </td>
              </tr>           
        `;
        numberRow ++;

        $("#table-clients tbody").innerHTML += newRow;
      });

    }else{
      newRow =`
      <div class="alert alert-danger m-4 text-white" role="alert">
          <strong class="text-white">No existe clientes</strong> Asegurate de que existan los registros.
      </div>
      `;
      $("#render-error").innerHTML += newRow;
    }
    

  }

  async function getClients(){

    try{

      /* $("#add-asset").setAttribute("href",`./add_asset.php?idproy=${code}&name=${codeName}`); */

      let url ="../../Controllers/client.controller.php";
      let params = new FormData();
  
      params.append("action","listClienTperson");
      params.append("tipo_persona",$("#tipo_persona").value);

      results = await global.sendAction(url, params);

      if(results){

        /* $("#cabezera").innerText +=` ${name}`; */
        renderClients(results);

      }
    }
    catch(e){
      console.error(e);
    }
  }

  async function searchClients(dnro){
    try{

      let url = `../../Controllers/client.controller.php`;
      let params = new FormData();

      params.append("action", "listClientDnro");
      params.append("tipo_persona",$("#tipo_persona").value);
      params.append("documento_nro",dnro);

      let results = await global.sendAction(url, params);

      if(results){
        renderClients(results);
      }
    }
    catch(e){
      console.error(e);
    }
  }

  //Genera u archivo PDF
  async function generatePdf(id){

    let codeID = btoa(id);
    let url = `../../reports/reports_pdf.php?action=reportLots&idproyecto=${codeID}`;

    window.location.href = url;
  }

  //Genera un archivo excel
  async function generateExcel(id){

    let codeID = btoa(id);
    let url = `../../reports/reports_excel.php?idproyecto=${codeID}`;

    window.location.href = url;
  }

  $("#in-doumento-tipo").addEventListener("input",()=>{

      clearTimeout(timer);

        timer = setTimeout(()=>{

          let dnro = $("#in-doumento-tipo").value;

          if(dnro != ""){

            searchClients(dnro);

          }else{

            getClients();
          }
        },1500)
    });

  $("#tipo_persona").addEventListener("change",()=>{

    getClients();

  });


  $("#table-clients tbody").addEventListener("click",(e)=>{

    if(e.target.classList.contains("openModal")){

      let idCliente = e.target.dataset.id;
      
      getClientModal(idCliente);
    }
  });

    getClients();
});
  </script>
  <script>
    var win = navigator.platform.indexOf('Win') > -1;
    if (win && document.querySelector('#sidenav-scrollbar')) {
      var options = {
        damping: '0.5'
      }
      Scrollbar.init(document.querySelector('#sidenav-scrollbar'), options);
    }
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example Views etc -->
  <script src="../../assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
</body>

</html>