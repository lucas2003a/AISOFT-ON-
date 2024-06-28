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
        <li class="nav-item">
          <a class="nav-link" href="../Clients/index.php">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>office</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                        <path class="color-background opacity-6" d="M12.25,17.5 L8.75,17.5 L8.75,1.75 C8.75,0.78225 9.53225,0 10.5,0 L31.5,0 C32.46775,0 33.25,0.78225 33.25,1.75 L33.25,12.25 L29.75,12.25 L29.75,3.5 L12.25,3.5 L12.25,17.5 Z"></path>
                        <svg class="color-background" xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor" class="bi bi-person-lines-fill" viewBox="0 0 16 16">
                          <path d="M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5m.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1z" />
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
                        <svg class="color-background" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-calculator" viewBox="0 0 16 16">
                          <path d="M12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z" />
                          <path d="M4 2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5zm0 4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5z" />
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
          <a class="nav-link" href="../separations/index.php">
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
                        <svg class="color-background" xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor" class="bi bi-backspace-fill" viewBox="0 0 16 16">
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
                          <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1z" />
                          <path d="M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z" />
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
                          <path d="M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5" />
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
          <a class="nav-link active" href="../contracts/index.php">
            <div class="icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center">
              <svg width="12px" height="12px" viewBox="0 0 42 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                <title>office</title>
                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                  <g transform="translate(-1869.000000, -293.000000)" fill="#FFFFFF" fill-rule="nonzero">
                    <g transform="translate(1716.000000, 291.000000)">
                      <g id="office" transform="translate(153.000000, 2.000000)">
                        <svg class="color-background" xmlns="http://www.w3.org/2000/svg" width="50" height="43" fill="currentColor" class="bi bi-file-earmark-font" viewBox="0 0 16 16">
                          <path d="M10.943 6H5.057L5 8h.5c.18-1.096.356-1.192 1.694-1.235l.293-.01v5.09c0 .47-.1.582-.898.655v.5H9.41v-.5c-.803-.073-.903-.184-.903-.654V6.755l.298.01c1.338.043 1.514.14 1.694 1.235h.5l-.057-2z" />
                          <path d="M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5z" />
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
                          <path d="M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z" />
                          <path d="M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0" />
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
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Editar contrato</li>
          </ol>
          <h6 class="font-weight-bolder mb-0" id="cabezera">EDITAR CONTRATO </h6>
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

      <!-- FORMULARIO -->
      <div>
        <div class="col-lg-12 mb-lg-0 mb-4 mt-4">
          <div class="card">
            <div class="card-body" style="padding: 50px">
              <div class="row">
                <div class="col-lg-12">
                  <div class="d-flex flex-column h-100">
                    <form class="row needs-validation" id="form-contract" novalidate>
                      <div class="tab">
                        <div class="row">
                          <div class="col-md-6">

                            <!-- NRO DE EXPEDIENTE -->
                            <div class="mt-2">
                              <label for="n_expediente" class="form-label">Nº de expediente</label>
                              <input type="text" name="n_expediente" id="n_expediente" class="form-control" readonly>
                            </div>

                            <!-- TIPO DE CONTRATO -->
                            <div class="mt-2">
                              <label for="tipo_contrato" class="form-label">Tipo de contrato</label>
                              <select name="tipo_contrato" id="tipo_contrato" class="form-select" required autofocus>
                                <option value="">Selecciona un tipo de contrato</option>
                                <option data-type="LOTE" value="VENTA DE LOTE">Venta de lote</option>
                                <option data-type="CASA" value="VENTA DE CASA">Venta de casa</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona un tipo de contrato.
                              </div>
                              <div class="valid-feedback">
                                Tipo de contrato seleccionado correctamente.
                              </div>
                            </div>

                            <!-- IDSEPARACIÓN -->
                            <div class="mt-2">
                              <label for="idseparacion">Separación</label>
                              <select name="idseparacion" id="idseparacion" class="form-select" required>
                                <option value="">Selecciona una separación</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona una separación
                              </div>
                              <div class="valid-feedback">
                                Separación seleccionada correctamente.
                              </div>
                            </div>

                            <!-- IDPROYECTO -->
                            <div class="mt-2">
                              <label for="idproyecto">Proyectos</label>
                              <select name="idproyecto" id="idproyecto" class="form-select input-contract" required>
                                <option value="">Selecciona un proyecto</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona un proyecto.
                              </div>
                              <div class="valid-feedback">
                                Proyecto seleccionado correctamente.
                              </div>
                            </div>

                            <!-- IDLOTE -->
                            <div class="mt-2">
                              <label for="idactivo">Lotes</label>
                              <select name="idactivo" id="idactivo" class="form-select input-contract" required>
                                <option value="">Seleccione un lote</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona un lote.
                              </div>
                              <div class="valid-feedback">
                                Lote seleccionado correctamente.
                              </div>
                            </div>

                            <!-- PRECIO VENTA -->
                            <div class="mt-2">
                              <label for="precio_venta">Precio de venta</label>
                              <input type="text" name="precio_venta" id="precio_venta" class="form-control" readonly>
                            </div>


                          </div>

                          <div class="col-md-6">


                            <!-- TIPO DE PERSONA -->
                            <div class="mt-2">
                              <label for="tipo_persona">Tipo de persona</label>
                              <select name="tipo_persona" id="tipo_persona" class="form-select input-contract" required>
                                <option value="">Selecciona el tipo de persona</option>
                                <option value="NATURAL">Natural</option>
                                <option value="JURÍDICA">Jurídica</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona el tipo de persona.
                              </div>
                              <div class="valid-feedback">
                                Tipo de persona seleccionado correctamente.
                              </div>
                            </div>

                            <!-- IDLCIENTE -->
                            <div class="mt-2">

                              <label for="idcliente">Cliente</label>
                              <select name="idcliente" id="idcliente" class="form-select" required>
                                <option value="">Selecciona un cliente</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona un cliente.
                              </div>
                              <div class="valid-feedback">
                                Cliente seleccionado correctamente.
                              </div>
                            </div>

                            <!-- IDCONYUGUE -->
                            <div class="mt-2">
                              <label for="idconyugue">Conyugue</label>
                              <select name="idconyugue" id="idconyugue" class="form-select input-contract" required>
                                <option value="">Selecciona un conyugue</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona un conyugue.
                              </div>
                              <div class="valid-feedback">
                                Conyugue seleccionado correctamente.
                              </div>
                            </div>

                            <!-- IDREPRESENTANTE LEGAL -->
                            <div class="mt-2">
                              <label for="idrepresentante_legal">Representante legal</label>
                              <span class="text-secondary text-sm">(ctrl + click para selección multiple)</span>
                              <select name="idrepresentante_legal" id="idrepresentante_legal" class="form-select" multiple required>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona al menos un representante legal.
                              </div>
                              <div class="valid-feedback">
                                Representante legal seleccionado correctamente.
                              </div>
                            </div>

                          </div>
                        </div>

                        <div class="d-flex justify-content-center mt-4">
                          <div class="btn-group">
                            <button type="button" class="btn btn-secondary prevBtn" disabled>Anterior</button>
                            <button type="button" id="save-reps" class="btn btn-success nextBtn">Siguiente</button>
                          </div>
                        </div>

                      </div>

                      <div class="tab">
                        <div class="row">
                          <div class="col-md-6">

                            <!-- DEPARTAMENTO -->
                            <div class="mt-2">
                              <label for="iddepartamento">Departamento</label>
                              <select name="iddepartamento" id="iddepartamento" class="form-select" required>
                                <option value="">Seleccione un departamento</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona un departamento.
                              </div>
                              <div class="valid-feedback">
                                Departamento seleccionado correctamente.
                              </div>
                            </div>

                            <!-- PROVINCIA -->
                            <div class="mt-2">
                              <label for="idprovincia">Provincia</label>
                              <select name="idprovincia" id="idprovincia" class="form-select" required>
                                <option value="">Seleccione una provincia</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona una provincia.
                              </div>
                              <div class="valid-feedback">
                                Provincia seleccionada correctamente.
                              </div>
                            </div>

                            <!-- DISTRITO -->
                            <div class="mt-2">
                              <label for="iddistrito">Distrito</label>
                              <select name="iddistrito" id="iddistrito" class="form-select" required>
                                <option value="">Seleccione un distrito</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona un distrito.
                              </div>
                              <div class="valid-feedback">
                                Distrito seleccionado correctamente.
                              </div>
                            </div>


                          </div>

                          <div class="col-md-6">
                            <!-- IDSEDE -->
                            <div class="mt-2">
                              <label for="idsede">idsede</label>
                              <select name="idsede" id="idsede" class="form-select" required>
                                <option value="">Selecciona un sede</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona una sede.
                              </div>
                              <div class="valid-feedback">
                                Sede seleccionada correctamente.
                              </div>
                            </div>

                            <!-- IDREPRESENTANTE PRIMARIO -->
                            <div class="mt-2">
                              <label for="idrepresentante_primario">Representante principal</label>
                              <select name="idrepresentante_primario" id="idrepresentante_primario" class="form-select" required>
                                <option value="">Selecciona un representante principal</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona un representante principal
                              </div>
                              <div class="valid-feedback">
                                Representante principal seleccionado correctamente.
                              </div>
                            </div>

                            <!-- IDREPRESENTANTE SECUNDARIO -->
                            <div class="mt-2">
                              <label for="idrepresentante_secundario">Representante secundario</label>
                              <select name="idrepresentante_secundario" id="idrepresentante_secundario" class="form-select">
                                <option value="">Selecciona una representante secundario</option>
                              </select>
                              <div class="invalid-feedback">
                                Selecciona un representante secundario
                              </div>
                              <div class="valid-feedback">
                                Representante secundario seleccionado correctamente.
                              </div>
                            </div>
                          </div>

                          <div class="d-flex justify-content-center mt-4">
                            <div class="btn-group">
                              <button type="button" class="btn btn-secondary prevBtn">Anterior</button>
                              <button type="button" class="btn btn-success nextBtn">Siguiente</button>
                            </div>
                          </div>

                        </div>
                      </div>

                      <div class="tab">
                        <div class="row">
                          <div class="col-md-6">

                            <!-- TIPO DE CAMBIO -->
                            <div class="mt-2">
                              <label for="tipo_cambio">Tipo de cambio</label>
                              <input type="number" name="tipo_cambio" id="tipo_cambio" class="form-control" value="0.00" min="1.00" step="0.01" required>
                              <div class="invalid-feedback">
                                Ingresa el tipo de cambio.
                              </div>
                              <div class="valid-feedback">
                                Tipo de cambio ingresado correctamente.
                              </div>
                            </div>
                            <div class="valid-feedback">
                              Tipo de cambio ingresado correctamente.
                            </div>

                            <!-- MONEDA DE VENTA -->
                            <div class="mt-2">
                              <label for="moneda_venta">Moneda de venta</label>
                              <input type="text" name="moneda_venta" id="moneda_venta" class="form-control" readonly>
                            </div>
                          </div>

                          <div class="col-md-6">

                            <!-- FECHA DE CONTRATO -->
                            <div class="mt-2">
                              <label for="fecha_contrato">Fecha del contrato</label>
                              <input type="date" name="fecha_contrato" id="fecha_contrato" class="form-control" required>
                              <div class="invalid-feedback">
                                Fecha del contrato requerida.
                              </div>
                              <div class="valid-feedback">
                                Fecha del contrato ingresada correctamente.
                              </div>
                            </div>

                            <!-- MONTO DE INICIAL -->
                            <div class="mt-2">
                              <label for="monto_inicial">Monto de inicial</label>
                              <input type="number" name="monto_inicial" id="monto_inicial" class="form-control" min="500.00" value="0.00" step="0.01" required>
                              <div class="invalid-feedback">
                                Monto de inicial requerido.
                              </div>
                              <div class="valid-feedback">
                                Monto de inicial ingresado correctamente.
                              </div>
                            </div>

                          </div>
                        </div>
                        <hr class="mt-2">
                        <div class="mt-2" id="content-det">
                          <div class="row">
                            <div class="col-md-10">
                              <label for="label-detalle">Detalles</label>
                              <input type="text" class="form-control input-key" placeholder="Cabezera" id="input-key" required>
                              <div class="invalid-feedback">
                                Detalle requerido.
                              </div>
                              <div class="valid-feedback">
                                Detalle ingresado correctamente.
                              </div>
                              <textarea name="content-detalle" cols="30" rows="5" class="form-control input-value mt-2" id="input-value" placeholder="Detalle ...." required></textarea>
                              <div class="invalid-feedback">
                                Detalle requerido.
                              </div>
                              <div class="valid-feedback">
                                Detalle ingresado correctamente.
                              </div>
                            </div>
                            <div class="col-md-2 d-flex align-items-center">
                              <div class="align-items-center">

                                <button type="button" class="btn bg-primary btn-sm text-white add-det">+</button>
                              </div>

                            </div>
                          </div>
                        </div>

                        <div class="d-flex justify-content-center mt-2">
                          <div class="btn-group">
                            <button type="button" class="btn btn-secondary prevBtn">Anterior</button>
                            <button type="button" id="getJson" class="btn btn-success nextBtn">Siguiente</button>
                          </div>
                        </div>
                      </div>

                      <div class="tab">

                        <div class="row">
                          <div class="col-md-12">
                            <div class="mt-2">

                              <div class="form-group mt-4">
                                <label for="in-doc" class="label-img">
                                  <i class="material-icons"></i>
                                  <span class="title" style="display: flex; justify-content: center;">Agregar archivo (solo archivos con extensión .pdf)</span>
                                  <input type="file" accept=".pdf, .doc, .docx" id="in-doc" required>
                                </label>
                                <div class="invalid-feedback">
                                  Archivo de contrato requerido.
                                </div>
                                <div class="valid-feedback">
                                  Archivo de contrato ingresado correctamente.
                                </div>
                              </div>

                            </div>
                          </div>

                          <div class="row">
                            <iframe id="frame" src="" frameborder="4" width="500" height="800"></iframe>
                          </div>

                          <div class="d-flex justify-content-center">

                            <div class="btn-group mt-4">
                              <button type="button" class="btn btn-secondary prevBtn">Anterior</button>
                              <button type="submit" class="btn btn-success submit" id="guardar">Guardar</button>
                            </div>
                          </div>
                        </div>
                    </form>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- TEMPLATE -->
      <template id="det-clone">
        <div class="row mt-2">
          <div class="col-md-10">
            <label for="label-detalle">Detalles</label>
            <input type="text" id="label-detalle" class="form-control input-key" placeholder="Cabezera" required>
            <div class="invalid-feedback">
              Detalle requerido.
            </div>
            <div class="valid-feedback">
              Detalle ingresada correctamente.
            </div>
            <textarea name="content-detalle" id="content-detalle" cols="30" rows="5" class="form-control mt-2 input-value" placeholder="Detalle ...." required></textarea>
            <div class="invalid-feedback">
              Detalle requerido.
            </div>
            <div class="valid-feedback">
              Detalle ingresada correctamente.
            </div>
          </div>
          <div class="col-md-2 d-flex align-items-center">
            <button type="button" class="btn bg-primary btn-sm text-white add-det">+</button>
          </div>
        </div>
      </template>

      <template id="det-clone-less">
        <div class="row mt-2">
          <div class="col-md-10">
            <label for="label-detalle">Detalles</label>
            <input type="text" id="label-detalle" class="form-control input-key" placeholder="Cabezera" required>
            <textarea name="content-detalle" id="content-detalle" cols="30" rows="5" class="form-control mt-2 input-value" required></textarea>
            <div class="invalid-feedback">
              Detalle requerido.
            </div>
            <div class="valid-feedback">
              Detalle ingresada correctamente.
            </div>
          </div>
          <div class="col-md-2 d-flex align-items-center">
            <button type="button" class="btn bg-danger btn-sm text-white less-det">-</button>
          </div>
        </div>
      </template>

      <template id="new-button">
        <button type="button" class="btn bg-danger btn-sm text-white less-det">-</button>
      </template>


      <!-- TEMPLATE -->

      <!-- /FORMULARIO -->

      <footer class="footer pt-3  ">
        <div class="container-fluid">
          <div class="row align-items-center justify-content-lg-between">
            <div class="col-lg-6 mb-lg-0 mb-4">
              <div class="copyright text-center text-sm text-muted text-lg-start">
                © <script>
                  document.write(new Date().getFullYear())
                </script>,
                auspiciado por
                <a href="https://aifperu.com/" class="font-weight-bold" target="_blank">A.I.F Contratistas Generales S.A.C</a>
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

    <!-- CONFIGURACIONES DEL PANEL -->
    <div class="card shadow-lg ">
      <div class="card-header pb-0 pt-3 ">
        <div class="float-start">
          <h5 class="mt-3 mb-0">Configurar tu interfáz</h5>
          <p>Mira las opciones de configuración</p>
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
          <button class="btn bg-gradient-primary w-100 px-3 mb-2 active" data-class="bg-transparent" onclick="sidebarType(this)">Transparente</button>
          <button class="btn bg-gradient-primary w-100 px-3 mb-2 ms-2" data-class="bg-white" onclick="sidebarType(this)">Blanco</button>
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
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  <!-- SWEET ALERT -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <!--   Core JS Files   -->
  <script src="../../assets/js/core/popper.min.js"></script>
  <script src="../../assets/js/core/bootstrap.min.js"></script>
  <script src="../../assets/js/core/bootstrap.bundle.min.js"></script>
  <script src="../../assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../../assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="../../assets/js/plugins/chartjs.min.js"></script>
  <script src="../../assets/js/globalFunctions.js"></script>
  <script src="../../assets/js/sweetAlert.js"></script>
  <script src="../../assets/js/formMultiSteps.js"></script>
  <script src="../../assets/js/renderUbigeo.js"></script>

  <!-- <script src="../../assets/js/renderUbigeo.js"></script>  -->

  <!-- SELECT2 - JQUERY -->
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
  <script>
    document.addEventListener("DOMContentLoaded", async function() {

      const global = new FunGlobal();
      const sAlert = new Alert();

      //formulario
      const idform = "#form-contract"
      const formMS = new multiStepsForm(idform);

      const $ = id => global.$(id);
      const $All = id => global.$All(id);

      let stringQuery = window.location.search;
      let params = new URLSearchParams(stringQuery);
      let code = params.get("id");
      let idcontrato = atob(code);

      let oldExpedient = false;
      let dataContract;
      let dataRepresents = [];
      let filterRepresents = [];
      let dataRepresentsAll = [];
      let date = new Date();
      let jsonDet = "";
      let frame = $("#frame");
      let detContracts;

      let isEdit = false;
      let serieContract;

      // * Retorna una promesa
      function returnPromise(array) {

        return new Promise((resolve, reject) => {
          if (array.length > 0) {
            return array;
            resolve();
          } else {
            reject();
          }
        })
      }

      // * Obtienes a los represetantes y la sede por el proyecto
      async function selectRepresentsIdsede(result) {

        // ! Crea un intervalo de tiempo para seleccionar a los respresentantes
        return new Promise((resolve, reject) => {

            getUbigeo(result.sede_distrito);
            resolve();
          })
          .then(() => {


            return new Promise((resolve, reject) => {

              if ($("#idsede").options.length > 1) {
                resolve();
              } else {
                const interval = setInterval(() => {

                  if ($("#idsede").options.length > 1) {
                    clearInterval(interval);
                    resolve();
                    console.log("intervalo terminado")
                  }
                }, 100);
              }
            });

          })

          // ! Selecciona el ubigeo
          .then(() => {

            return new Promise((resolve, reject) => {

              let options = Array.from($("#idsede").options);

              options.forEach(option => {

                let options = Array.from($("#idsede").options);
                if (option.value == result.idsede) option.selected = true;
              })
              $("#idsede").dispatchEvent(new Event("change"));
              resolve();
            });
          })


          // ! Obitene el representante legal
          .then(() => {

            return new Promise((resolve, reject) => {

              let options = $("#idrepresentante_primario").options;
              if (options.length > 1) {
                resolve();
              } else {
                const interval = setInterval(() => {

                  let options = $("#idrepresentante_primario").options;
                  if (options.length > 1) {

                    clearInterval(interval);
                    resolve();
                  }
                }, 100);
              }
            });
          })
          // ! Selecciona el representante primario
          .then(() => {
            return new Promise((resolve, reject) => {

              let options = Array.from($("#idrepresentante_primario").options);

              options.forEach(option => {

                if (option.value == result.idrepresentante_primario) option.selected = true;
              });
              $("#idrepresentante_primario").dispatchEvent(new Event("change"));
              resolve();
            });
          })

          // !Obitienes al representante secundario
          .then(() => {

            if (result.idrepresentante_secundario) {

              return new Promise((resolve, reject) => {

                  let options = Array.from($("#idrepresentante_secundario").options);
                  if (options.length > 1) {
                    resolve();
                  } else {
                    const interval = setInterval(() => {

                      let options = Array.from($("#idrepresentante_secundario").options);
                      if (options.length > 1) {

                        clearInterval(interval);
                        resolve();
                      }
                    }, 100);
                  }
                })
                .then(() => {
                  return new Promise((resolve, reject) => {

                    let options = Array.from($("#idrepresentante_secundario").options);

                    options.forEach(option => {

                      if (option.value == result.idrepresentante_secundario) option.selected = true;
                    });
                    resolve();
                  })
                });
            }

          }).then(()=>{

            // !Valor del tipo de cambio
            $("#tipo_cambio").value = result.tipo_cambio;
    
            // !Valor de la fecha del contrato
            $("#fecha_contrato").value = result.fecha_contrato;
    
            // !Valor de la moneda de venta
            $("#moneda_venta").value = result.moneda_venta;
            console.log("moneda de venta : " + result.moneda_venta)
    
            // !Valor del monto de incial
            $("#monto_inicial").value = Number.parseFloat(result.inicial);
            console.log(Number.parseFloat(result.inicial))
    
            // !Valor de los detalles
            let object = JSON.parse(result.det_contrato);
    
            let keys = object.clave;
            let values = object.valor;
    
            for (index = 0; index < keys.length; index++) {
    
    
              let key = keys[index];
              let value = values[index];
    
              // !Si las claves ni los valores están vacíos
              if (key && value) {
    
    
    
                // !Verifica si es el ultimo elemento del array
                if (index == 0) {
    
    
                  $("#input-key").value = key;
                  $("#input-value").value = value;
    
    
    
                  // !Sino ....
                } else {
                  let content_det = $("#content-det");
                  let content_det_first_child = $("#content-det").firstChild;
    
                  let template = $("#det-clone-less").content.cloneNode(true);
                  let lessButton = $("#new-button").content.cloneNode(true);
    
                  template.querySelector(".input-key").value = key;
                  template.querySelector(".input-value").value = value;
    
                  content_det.insertBefore(template, content_det_first_child);
                }
              }
            };
    
            // !URL del archivo
            $("#in-doc").disabled = result.archivo ? true : false;
            $("#frame").src = "../../media/files/" + result.archivo;
          })
      }

      // * Obitene los datos del contrato directo
      async function getDirectContract(result) {

        let tipo = ($("#tipo_contrato")[$("#tipo_contrato").selectedIndex].dataset.type);
        console.log(tipo);

        await getProjectsTypeAct(tipo)

          .then(() => {

            return new Promise((resolve, reject)=>{

              let options = Array.from($("#idproyecto").options);

              if(options.length > 1){
                resolve();
              }else{

                const interval = setInterval(()=>{

                  if(options.length > 1){
                    clearInterval(interval);
                    resolve();
                  }
                });
              }
            });
          })
          // ! Obtengo el proyecto
          .then(() => {

            return new Promise((resolve, reject) => {

              let projects = Array.from($("#idproyecto").options);
              referenceNode = projects[1];
              paretntReference = referenceNode.parentNode;

              let tagOption = document.createElement("option");
              tagOption.value = result.idproyecto;
              tagOption.innerText = result.denominacion;

              paretntReference.insertBefore(tagOption, referenceNode)
              resolve();

            });
          })

          // ! Selecciono el proyecto
          .then(() => {

            return new Promise((resolve, reject) => {


              let projects = Array.from($("#idproyecto").options);

              projects.forEach(option => {

                if (option.value == result.idproyecto) {
                  option.selected = true;
                  resolve();
                }
              })

            });
          })

          // ! Obtengo el cliente
          .then(async function() {

            await getCustomers();
            return new Promise((resolve, reject) => {

              let tagOption = document.createElement("option");
              tagOption.vale = result.idactivo;
              tagOption.innerText = "LT-" + result.sublote;
              tagOption.selected = true;

              $("#idactivo").append(tagOption);

              let moneda = result.moneda_venta == "USD" ? "$/ " : "S/ ";

              $("#precio_venta").value = moneda + result.precio_venta;
              $("#moneda_venta").value = result.moneda_venta;
              resolve();
            });
          })

          // ! Seleciona el tipo de persona
          .then(() => {

            return new Promise((resolve, reject) => {

              Array.from($("#tipo_persona").options).forEach(option => {

                if (option.value == result.tipo_persona) option.selected = true;
              });
              $("#tipo_persona").dispatchEvent(new Event("change"));

              resolve();
            });
          })

          // ! Crear un intervalo de tiempo hasta cargar los clientes
          .then(() => {

            return new Promise((resolve, reject) => {

              let options = $("#idcliente").options;
              if (options.length > 1) {

                resolve();
              } else {

                const interval = setInterval(() => {

                  let options = $("#idcliente").options;
                  if (options.length > 1) {
                    clearInterval(interval);
                    resolve();
                  }
                }, 100); // ! Revisa casa 100 milisegundos
              }

            });
          })

          // ! Selecciona el cliente
          .then(() => {

            return new Promise((reolve, reject) => {

              options = Array.from($("#idcliente").options);

              options.forEach(option => {

                if (option.value == result.idcliente) option.selected = true;

              });
              $("#idcliente").dispatchEvent(new Event("change"));
              reolve();
            })
          })


          .then(async function() {

            await selectRepresentsIdsede(result);
          })


          .catch(e => {
            console.error(e)
          });
      }

      // *  Obtiene el ubigeo
      async function getUbigeo(iddistrito) {

        try {

          let url = "../../Controllers/ubigeo/district.controller.php";
          let params = new FormData();

          params.append("action", "getUbigeo");
          params.append("iddistrito", iddistrito);

          let result = await global.sendAction(url, params)

          if (result) {
            console.log(result)

            const tagDistrito = document.createElement("option");
            tagDistrito.value = result.iddistrito;
            tagDistrito.innerHTML = result.distrito.trim();
            $("#iddistrito").appendChild(tagDistrito);
            $("#iddistrito").value = result.iddistrito;

            const tagProvincia = document.createElement("option");
            tagProvincia.value = result.idprovincia;
            tagProvincia.innerHTML = result.provincia.trim();
            $("#idprovincia").appendChild(tagProvincia);
            $("#idprovincia").value = result.idprovincia;

            $("#iddepartamento").value = result.iddepartamento;
            $("#iddistrito").dispatchEvent(new Event("change"));
          }
        } catch (e) {
          console.error(e);
        }
      };

      // * Selecciona los representantes legales
      async function selectRepresents() {

        let options = $("#idrepresentante_legal").options;

        Array.from(options).forEach(option => {

          detContracts.forEach(det => {

            if (det.idrepresentante == option.value) option.selected = true;
          });
        });
      }

      // * Lista los detalles del contrato
      async function listDetContracts(idcontrato) {

        try {

          let url = "../../Controllers/contract.controller.php";
          let params = new FormData();
          params.append("action", "listDetContract");
          params.append("idcontrato", idcontrato);

          let result = await global.sendAction(url, params);

          if (result) {
            detContracts = result;
            console.log(detContracts)
          }
        } catch (e) {
          console.error(e);
        }
      }

      // * Selecciona el valor del cliente
      async function selectClientvalue(result) {

        Array.from($("#idcliente").options).forEach(option => {
          if (option.value == result.idcliente) {
            option.selected = true;
          }
        })
      }

      // * Espera el evento
      async function waitEvent(element, event) {

        return new Promise((resolve, reject) => {

          const handler = () => {

            element.removeEventListener(event, handler);

            resolve();
          };

          element.addEventListener(event, handler);
        });
      }

      // * Obtiene el valor del tipo de contrato
      async function getContractType(result) {

        $("#tipo_contrato").value = result.tipo_contrato;

        let changeEventPromise = waitEvent($("#tipo_contrato"), "change");

        $("#tipo_contrato").dispatchEvent(new Event("change"));

      }

      // * Inserta la opcion de la separación
      async function insertOptionSeparation(result) {


      }

      // * Obtiene el contrato por el id
      async function getContractId(id) {

        try {
          let url = "../../Controllers/contract.controller.php";

          let params = new FormData();
          params.append("action", "listContractId");
          params.append("idcontrato", id);

          let result = await global.sendAction(url, params);

          if (result) {

            setContract = result.n_expediente;

            // !Valor del númmero de expediente
            $("#n_expediente").value = result.n_expediente;

            // !Valor del tipoo de contrato
            await getContractType(result);

            if (!result.idseparacion) {
              await getDirectContract(result);
            } else {

              // ! Espeara al cargar las opcioes sde separaciones
              return new Promise((resolve, reject) => {

                  let options = Array.from($("#idseparacion").options);

                  if (options.length > 0) {
                    resolve();
                  } else {

                    const interval = setInterval(() => {

                      let options = Array.from($("#idseparacion").options);
                      if (options.length > 0) {
                        clearInterval(interval);
                        resolve();
                      }
                    }, 100)
                  }
                })

                // ! Creo la opción de separación
                .then(() => {
                  return new Promise((resolve, reject) => {

                    let options = Array.from($("#idseparacion").options);
                    let referenceNode = options.length > 1 ? options[1] : options[0];
                    console.log(referenceNode)
                    let referenceParent = referenceNode.parentNode;

                    let newTag = document.createElement("option");
                    newTag.value = result.idseparacion;
                    newTag.innerText = result.n_separacion;
                    newTag.dataset.precio_venta = result.precio_venta;
                    newTag.dataset.moneda_venta = result.moneda_venta;

                    if(options.length > 1){
                      
                      referenceParent.insertBefore(newTag, referenceNode);
                    }else{
                      $("#idseparacion").append(newTag);
                    }
                    resolve();
                    console.log(options)
                  })
                })

                // ! Selecciona la opción de separación
                .then(() => {

                  return new Promise((resolve, reject) => {

                    let options = Array.from($("#idseparacion").options);

                    options.forEach(option => {
                      if (option.value == result.idseparacion) option.selected = true;
                      $("#idseparacion").dispatchEvent(new Event("change"));
                      resolve();
                    })
                  });
                })

                // ! Obtengo al cliente por el tipo de persona
                .then(async function() {

                  await getCustomers(result.tipo_persona);

                  return new Promise((resolve, rejecet) => {

                    let options = Array.from($("#idcliente").options);

                    if (options.length > 1) {
                      resolve();
                    } else {

                      const interval = setInterval(() => {

                        let options = Array.from($("#idcliente").options);
                        if (options.length > 1) {
                          clearInterval(interval);
                          resolve();
                        }
                      }, 100)
                    }
                  });
                })

                // ! Selecciono al cliente
                .then(() => {

                  return new Promise((resolve, reject) => {
                    let options = Array.from($("#idcliente").options);

                    options.forEach(option => {

                      if (option.value == result.idcliente) option.selected = true;
                    })
                    resolve();
                    $("#idcliente").dispatchEvent(new Event("change"));
                  })
                })
                .then(async function() {

                  await selectRepresentsIdsede(result);
                })
                .catch(e => {
                  console.error(e);
                })
            }






          }
        } catch (e) {
          console.error(e);
        }
      }

      //Agrega un registro a la tabla "DETALLE DE CONTRATOS"
      async function addDetContract(idrep, idcont) {

        try {

          let url = "../../Controllers/contract.controller.php";

          let params = new FormData();
          params.append("action", "addDetContract");
          params.append("idrepresentante", idrep);
          params.append("idcontrato", idcont);

          let result = await global.sendAction(url, params);

          if (result) {

            return result.filasAfect;
          }
        } catch (e) {
          console.error(e);
        }
      }

      //Transformar el detalle registrado en los inputs, a un JSON
      function getJSON() {

        let key = ".form-control.input-key";
        let value = ".form-control.input-value";

        let json = global.getJson(key, value);

        jsonDet = json;
      }

      // Clona el contenido del template
      function readFile(event) {

        let reader = new FileReader();
        let file = event.target.files[0];

        reader.onload = (event) => {

          frame.setAttribute("src", `${event.target.result}`);

        }

        reader.readAsDataURL(file);

      }

      //Registra un contrato
      async function setContract(idcontrato) {

        try {

          let detJson = await global.getJson(".input-key", ".input-value");
          let lote_value = $("#idactivo").value;
          let lote_split = lote_value.split("-");
          let lote = lote_split[1];

          let precio_venta_value = $("#precio_venta").value;
          let precio_venta_split = precio_venta_value.split(" ");
          let precio_venta = Number.parseFloat(precio_venta_split[1]);
          console.log("Precio venta: ", precio_venta)
          console.log("tipo: ", typeof(precio_venta))

          let url = "../../Controllers/contract.controller.php";
          let params = new FormData();

          params.append("action", "setContract");
          params.append("idcontrato", idcontrato);
          params.append("n_expediente", serieContract)
          params.append("tipo_contrato", $("#tipo_contrato").value)
          params.append("idseparacion", $("#idseparacion").value)
          params.append("idrepresentante_primario", $("#idrepresentante_primario").value)
          params.append("idrepresentante_secundario", $("#idrepresentante_secundario").value)
          params.append("idcliente", $("#idcliente").value)
          params.append("idconyugue", $("#idconyugue").value)
          params.append("idactivo", lote)
          params.append("tipo_cambio", $("#tipo_cambio").value)
          params.append("fecha_contrato", $("#fecha_contrato").value)
          params.append("precio_venta", precio_venta)
          params.append("moneda_venta", $("#moneda_venta").value)
          params.append("inicial", $("#monto_inicial").value)
          params.append("det_contrato", jsonDet)
          params.append("archivo", $("#in-doc").files[0])

          let result = await global.sendAction(url, params);

          if (result.status) {

            let idcontrato = result.data.idcontrato;

            if (dataRepresents.length > 0) {
              let counter = 0;
              for (item of dataRepresents) {
                counter += await addDetContract(Number.parseInt(item), idcontrato);
              };

              if (counter > 0) {

                sAlert.sweetSuccess("Éxito", "Registro realizado correctamente", () => {

                  // window.location.href = "./index.php";

                });
              } else {
                sAlert.sweetError("Error", "No se pudo registrar el contrato");
              }

            } else {
              sAlert.sweetSuccess("Éxito", result.message, () => {

                setTimeout(() => {

                  window.location.href = "./index.php";
                }, 1500);
              });
            }
          } else {
            sAlert.sweetError("Error", result.message);
          }
        } catch (e) {
          console.error(e);
        }
      }

      //Clona la etiqueta
      function cloneContent() {

        let detailContent = $("#det-clone").content.cloneNode(true);
        let buttonLess = $("#new-button").content.cloneNode(true);

        let container = $("#content-det");
        let buttonAdd = $(".add-det");

        let parent = buttonAdd.parentNode;

        parent.replaceChild(buttonLess, buttonAdd);

        container.appendChild(detailContent);


      }

      //valida las cajas de texto del detalle
      function validateDetail() {

        let form = document.querySelectorAll(".input-det");

        let isValid = false

        isValid = Array.from(form).every(input => {
          if (input.value) {

            return true;

          } else {
            return false;
          }
        });

        if (!isValid) {
          sAlert.sweetWarning("Cajas de texto vacías", "Complete todas las cajas de texto.")
        } else {
          cloneContent();
        }
      }

      //Configura los límites del control calendario
      async function setDate() {

        let futureDate = new Date();
        let pastDate = new Date();

        futureDate.setMonth(date.getMonth() + 1);
        pastDate.setMonth(date.getMonth() - 1);

        if (futureDate.getDate() !== date.getDate()) {
          futureDate.setDate(0);
        }

        if (pastDate.getDate() !== date.getDate()) {
          pastDate.setDate(0);
        }

        let pastDay = pastDate.getDate().toString().padStart(2, '0');
        let pastMonth = (pastDate.getMonth() + 1).toString().padStart(2, '0');
        let pastYear = pastDate.getFullYear().toString();

        let past = `${pastYear}-${pastMonth}-${pastDay}`;

        let futureDay = futureDate.getDate().toString().padStart(2, '0');
        let futureMonth = (futureDate.getMonth() + 1).toString().padStart(2, '0');
        let futureYear = futureDate.getFullYear().toString();

        let future = `${futureYear}-${futureMonth}-${futureDay}`;

        $("#fecha_contrato").min = past;
        $("#fecha_contrato").max = future;

      }

      //Obtiene el día actual
      async function getToday() {

        let dayNow = date.getDate().toString().padStart(2, '0');
        let monthNow = (date.getMonth() + 1).toString().padStart(2, '0');
        let yearNow = date.getFullYear();

        let today = `${yearNow}-${monthNow}-${dayNow}`;
        $("#fecha_contrato").value = today;
        await setDate()
        return today;

      }

      //Obtiene el representante secundario por el idsede
      async function getRepresentsSecIdSede() {
        let valRepPrin = Number.parseInt($("#idrepresentante_primario").value)

        filterRepresents = dataRepresentsAll.filter(data => data.idrepresentante !== valRepPrin)

        console.log(filterRepresents);

        $("#idrepresentante_secundario").innerHTML = "";

        let tagDef = document.createElement("option");
        tagDef.value = "";
        tagDef.text = "Seleccione un representante secundario";

        $("#idrepresentante_secundario").appendChild(tagDef);

        filterRepresents.forEach(result => {

          let newTag = document.createElement("option")
          newTag.value = result.idrepresentante;
          newTag.innerText = result.documento_tipo + ": " + result.documento_nro + " // " + result.apellidos + " " + result.nombres;

          $("#idrepresentante_secundario").appendChild(newTag);
        });
      }

      //Obtiene el representante por el idsede
      async function getRepresentsIdSede() {

        try {
          let url = "../../Controllers/represent.controller.php";

          let params = new FormData();

          params.append("action", "listRepresentsIdAdress");
          params.append("idsede", $("#idsede").value);

          let results = await global.sendAction(url, params);

          if (results.length > 0) {
            dataRepresentsAll = results;
            console.log(results);

            $("#idrepresentante_primario").innerHTML = "";

            let tagDef = document.createElement("option");
            tagDef.value = "";
            tagDef.text = "Seleccione un representante primario";

            $("#idrepresentante_primario").appendChild(tagDef);

            results.forEach(result => {

              let newTag = document.createElement("option")
              newTag.value = result.idrepresentante;
              newTag.innerText = result.documento_tipo + ": " + result.documento_nro + " // " + result.apellidos + " " + result.nombres;

              $("#idrepresentante_primario").appendChild(newTag);
            });



          }
        } catch (e) {
          console.error(e);
        }
      }

      //Obtiene el cliente por su id
      async function getCustomersId(idcliente) {

        try {

          let url = "../../Controllers/client.controller.php";
          let params = new FormData();

          params.append("action", "listClientById");
          params.append("idcliente", idcliente);

          let result = await global.sendAction(url, params);

          if (result) {
            console.log(result)
            $("#idcliente").innerHTML = "";

            let tagDef = document.createElement("option");
            tagDef.value = "";
            tagDef.innerText = "Seleccione un cliente";
            $("#idcliente").appendChild(tagDef);

            let newTag = document.createElement("option");
            newTag.value = result.idcliente;
            newTag.innerText = result.razon_social ? result.documento_nro + " - " + result.razon_social : result.documento_nro + " - " + result.apellidos + ", " + result.nombres;
            newTag.dataset.t_persona = result.tipo_persona
            $("#idcliente").appendChild(newTag);

            // !Valor el cliente
            await selectClientvalue(result);
            await getRepresents(result.idpersona_juridica)


          }
        } catch (e) {
          console.error(e);
        }
      }

      //Obtiene los datos de los representantes egales del cliente
      async function getRepresents(idpersona_juridica) {

        try {

          let url = "../../Controllers/client.controller.php";

          let params = new FormData();

          params.append("action", "getRepresents");
          params.append("idpersona_juridica", idpersona_juridica);

          let results = await global.sendAction(url, params);

          if (results) {

            $("#idrepresentante_legal").innerHTML = "";

            results.forEach(result => {

              let newTag = document.createElement("option");
              newTag.value = result.idrepresentante;
              newTag.innerText = result.documento_tipo + ": " + result.documento_nro + " // " + result.representante_legal;

              $("#idrepresentante_legal").appendChild(newTag);
            });

            // !Valor del representante legal
            await selectRepresents();


          } else {
            $("#idrepresentante_legal").innerHTML = "";
          }

        } catch (e) {
          console.error(e);
        }
      }

      //Obtiene los datos de los clientes por el tipo de persona
      async function getCustomers(tpersona) {

        try {

          let url = "../../Controllers/client.controller.php";
          let params = new FormData();

          params.append("action", "listClienTperson");
          params.append("tipo_persona", tpersona);

          let results = await global.sendAction(url, params);

          if (results.length > 0) {
            console.log(results)
            dataClients = results;
            $("#idcliente").innerHTML = "";

            let defaultTag = document.createElement("option");
            defaultTag.innerText = "Seleccione un cliente";
            defaultTag.value = "";

            $("#idcliente").appendChild(defaultTag);

            results.forEach(result => {

              let name = result.tipo_persona == "NATURAL" ? result.apellidos.toUpperCase() + ", " + result.nombres.toLowerCase() : result.razon_social.toUpperCase();

              let newOption = document.createElement("option");
              newOption.text = result.documento_nro + " - " + name;
              newOption.value = result.idcliente;

              if (result.idpersona_juridica) {

                newOption.dataset.idperj = result.idpersona_juridica;
              }

              $("#idcliente").appendChild(newOption);
            });

          }
        } catch (e) {
          console.error(e);
        }
      }

      //Obitne los datos de la separación por su id
      async function getSeparationById() {
        try {

          let url = "../../Controllers/separation.controller.php";
          let params = new FormData();

          params.append("action", "listSeparationById");
          params.append("idseparacion", $("#idseparacion").value);

          let result = await global.sendAction(url, params);

          if (result) {
            console.log(result);

            result.tipo_persona == "NATURAL" ? $("#idrepresentante_legal").required = false : $("#idrepresentante_legal").required = true;

            await getCustomersId(result.idcliente)
          }
        } catch (e) {
          console.error(e);
        }
      }

      //Obotiene los datos de las separacione exeptuando a las que tienen contrato
      async function getSeparationWithoutContract() {
        try {

          let url = "../../Controllers/separation.controller.php";
          let params = new FormData();

          params.append("action", "listSeparationsAll");

          let results = await global.sendAction(url, params);

          if (results.length > 0) {

            console.log(results)
            $("#idseparacion").innerHTML = "";

            let tagDef = document.createElement("option");
            tagDef.value = "";
            tagDef.innerText = "Selecciona una separación";

            $("#idseparacion").appendChild(tagDef);

            results.forEach(result => {

              let tagOption = document.createElement("option");
              tagOption.value = result.idseparacion;
              tagOption.innerText = result.n_expediente;
              tagOption.dataset.precio_venta = result.precio_venta;
              tagOption.dataset.moneda_venta = result.moneda_venta;

              $("#idseparacion").appendChild(tagOption);
            });
          }
        } catch (e) {
          console.error(e);
        }
      }

      //Obtiene las casas (tipo casa)
      async function getHouses(idproyecto) {

        try {
          let url = "../../Controllers/asset.controller.php";
          let params = new FormData();

          params.append("action", "listOnlyHouses");
          params.append("idproyecto", idproyecto);

          let results = await global.sendAction(url, params);

          if (results.length > 0) {
            console.log(results)

            $("#idactivo").innerHTML = "";

            let tagDef = document.createElement("option");
            tagDef.value = "";
            tagDef.innerText = "Selecciona un lote";

            $("#idactivo").appendChild(tagDef);

            results.forEach(result => {

              let newTag = document.createElement("option");
              newTag.value = result.idactivo;
              newTag.innerText = "LT - " + result.sublote;
              newTag.dataset.precio_venta = result.precio_venta;
              newTag.dataset.moneda_venta = result.moneda_venta;

              $("#idactivo").appendChild(newTag);
            });
          }
        } catch (e) {
          console.error(e);
        }
      }

      //Obtiene los datos de los conyugues, exeptuando al cliente
      async function getSpouses(idcliente) {

        console.log(idcliente)
        let parseIdcliente = Number.parseInt(idcliente);
        if (dataClients.length > 0) {

          //Array que contiene los datos de los conyugues
          let spouses = dataClients.filter(result => result.idcliente !== parseIdcliente && result.tipo_persona == "NATURAL")

          console.log(spouses);
          $("#idconyugue").innerHTML = "";

          let defaultTag = document.createElement("option");
          defaultTag.innerText = "Seleccione una persona";
          defaultTag.value = "";

          $("#idconyugue").appendChild(defaultTag);

          spouses.forEach(spouse => {

            let name = spouse.apellidos.toUpperCase() + ", " + spouse.nombres.toLowerCase();

            let newOption = document.createElement("option");
            newOption.text = spouse.documento_nro + " - " + name;
            newOption.value = spouse.idcliente;

            $("#idconyugue").appendChild(newOption);
          });
        }
      }

      //Obtiene los proyects por el tipo de inmoviliario (casa o lote)
      async function getProjectsTypeAct(type) {

        try {
          let url = "../../Controllers/project.controller.php";
          let params = new FormData();

          params.append("action", "listProjecTypeAct");
          params.append("tipo_activo", type);

          let results = await global.sendAction(url, params);

          if (results.length > 0) {

            $("#idproyecto").innerHTML = "";

            let tagDefault = document.createElement("option");
            tagDefault.value = "";
            tagDefault.text = "Seleccione un proyecto";

            $("#idproyecto").appendChild(tagDefault);

            results.forEach(result => {

              let newTag = document.createElement("option");
              newTag.value = result.idproyecto;
              newTag.innerText = result.denominacion;
              newTag.dataset.tipo = result.tipo;

              $("#idproyecto").appendChild(newTag);
            });

            returnPromise(results)
          }
        } catch {

        }
      }

      //Obtiene todos los contratos;
      async function getAllContracts() {

        try {

          let url = "../../Controllers/contract.controller.php";
          let params = new FormData();

          params.append("action", "listContractsAll");

          let results = await global.sendAction(url, params);

          if (results.length > 0) {
            dataContract = results;
          }

        } catch (e) {
          console.error(e);
        }
      }

      //Valida los datos 
      async function validateData(value, column, array) {

        return new Promise((resolve, reject) => {

          let found = array.find(element => element[column] == value)

          if (found) {
            sAlert.sweetWarning("Se ha encontrado coincidencias", `"${value}" ya existe, ingresa otro`);
            reject();
          } else {
            resolve();

          }
        })
      }

      $("#getJson").addEventListener("click", () => {
        getJSON();
        console.log(jsonDet);
      });

      $("#idactivo").addEventListener("change", (e) => {

        let precio_venta = e.target.options[e.target.selectedIndex].dataset.precio_venta;
        let moneda_venta = e.target.options[e.target.selectedIndex].dataset.moneda_venta;
        let format_precio_venta = moneda_venta == "USD" ? "$/ " + precio_venta : "S/ " + precio_venta;



        $("#precio_venta").value = format_precio_venta;
        $("#moneda_venta").value = moneda_venta;
      });

      $("#in-doc").addEventListener("change", (e) => {
        readFile(e)
      });

      $("#content-det").addEventListener("click", (e) => {

        if (e.target.classList.contains("add-det")) {

          validateDetail();
        } else if (e.target.classList.contains("less-det")) {

          sAlert.sweetConfirm("¿Deseas eliminar el registro?", "Una vezeliminado no se podrá recuperar", () => {

            let row = e.target.closest(".row");
            row.remove();
          });

        }
      })

      $("#idrepresentante_primario").addEventListener("change", () => {
        getRepresentsSecIdSede();
      });

      $("#idsede").addEventListener("change", () => {
        getRepresentsIdSede();
      });

      $("#save-reps").addEventListener("click", (e) => {
        e.preventDefault();
        console.log(dataRepresents)
        let options = $("#idrepresentante_legal").options;

        Array.from(options).forEach(option => {

          if (option.selected) {
            dataRepresents.push(option.value)
          }
        });

        console.log(dataRepresents)

      });

      $("#idcliente").addEventListener("change", (e) => {

        let idcliente = e.target[e.target.selectedIndex].value;
        let tipo_persona = e.target[e.target.selectedIndex].dataset.t_persona

        $("#idrepresentante_legal").readonly = tipo_persona == "JURÍDICA" ? false : true;

        getSpouses(idcliente);

        let idpersona_juridica = e.target.options[e.target.selectedIndex].dataset.idperj;

        if (idpersona_juridica) {
          getRepresents(idpersona_juridica);
        }

      });

      $("#tipo_persona").addEventListener("change", (e) => {
        let tipo_persona = e.target.options[e.target.selectedIndex].value;

        getCustomers(tipo_persona);

        if (tipo_persona == "NATURAL") {
          $("#idconyugue").disabled = false;
          $("#idrepresentante_legal").value = "";
          $("#idrepresentante_legal").disabled = true;
          dataRepresents = [];
        } else {
          $("#idconyugue").disabled = true;
          $("#idrepresentante_legal").disabled = false;
        }

      })

      $("#idproyecto").addEventListener("change", (e) => {

        getHouses(idproyecto);
        
      });

      $("#idseparacion").addEventListener("change", (e) => {
        let precio_venta = e.target.options[e.target.selectedIndex].dataset.precio_venta;
        let moneda_venta = e.target.options[e.target.selectedIndex].dataset.moneda_venta;
        let format_precio_venta = moneda_venta == "USD" ? "$/ " + precio_venta : "S/ " + precio_venta;

        $("#precio_venta").value = format_precio_venta;
        $("#moneda_venta").value = moneda_venta;
        getSeparationById();
      });

      $("#tipo_contrato").addEventListener("change", async function(e) {

        console.log(performance.now())
        let option = e.target.options[e.target.selectedIndex].dataset.type;

        let form = document.querySelectorAll(".input-contract");

        if (option == "LOTE") {
          Array.from(form).forEach(input => {

            input.value = "";
            input.disabled = true;
          });

          dataRepresents = [];

          $("#idseparacion").disabled = false;

          await getSeparationWithoutContract();


        } else {
          Array.from(form).forEach(input => {

            input.disabled = false;
          });

          $("#idseparacion").disabled = true;
          await getProjectsTypeAct(option);
        }
      });

      $("#n_expediente").addEventListener("input", (e) => {

        let inputValue = e.target.value;
        console.log(inputValue)

        if (inputValue !== e.target.dataset.prevVal) {
          oldExpedient = false;
        }

        e.target.dataset.prevVal = inputValue;

      });

      $("#n_expediente").addEventListener("blur", async function(e) {

        e.preventDefault();

        let inputValue = e.target.value;
        console.log(inputValue)
        if (!oldExpedient) {

          oldExpedient = true;

          let sliceValue = inputValue.slice(0, 5);
          let parseValue = sliceValue.toString().padStart(5, '0');
          let newValue = "CON-" + parseValue;

          $("#n_expediente").value = parseValue;

          await validateData(newValue, "n_expediente", dataContract)
            .then(() => {
              $("#tipo_contrato").focus();
            })
            .catch(() => {
              $("#n_expediente").focus();
            })
        }
      });

      /*await getToday();
      await getAllContracts(); */
      await listDetContracts(idcontrato);
      await getContractId(idcontrato);

      /* --------------------------------- FUNCIÓN DE VALIDACIÓN --------------------------------------------------------- */

      (() => {
        'use strict' //=> USO ESTRICTO POR POLITICAS DE SEGURIDAD EN EL FORMULARIO

        //SELECCIONA TODOS LOS ELEMENTOS DEL FORMULARIO QUE TIENE LA CLASE "needs-validation
        const forms = document.querySelectorAll('.needs-validation')

        // TOMA EL ELEMENTO "FORMS" Y LO CONVIERTE A UN ARRAY
        // SE INCLUYE EN UN FOREAH PARA ITERAR SOBRE SUS ELEMENTOS

        Array.from(forms).forEach(form => {
          form.addEventListener('submit', event => {

            //SI LA VALIDACIÓN DEL FORMULARIO ES FALSE
            if (!form.checkValidity()) {
              event.preventDefault() //=> FRENA EL ENVÍO DEL FORMULARIO
              event.stopPropagation() //=> FRENA LA PROPAGACIÓN DE DATOS EN EL FORMULARIO
              form.reportValidity();
              setContract(idcontrato)();
            } else {
              event.preventDefault();
              sAlert.sweetConfirm("Datos nuevos", "¿Deseas actualizar el registro?", () => {

                setContract(idcontrato); //Ejecuta la función
              });
            }

            form.classList.add('was-validated') //=> AGREGA ESTA CLASE A LOS ELEMENTOS DEL FORMULARIO(MUESTRA LOS COMENTARIOS)
          }, false) //=> ESTE TERCER ARGUMENTO INDICA QUE EL EVENTO NO SE ESTA CAPTURANDO EN LA ""FASE DE CAPTURA" SINO EN "PROPAGACIÓN NORMAL"
        })
      })();
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