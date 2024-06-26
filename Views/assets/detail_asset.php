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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous" />
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
          <a class="nav-link active" href="../projects/index.php">
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
          <a class="nav-link" href="../contracts/index.php">
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
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="#">Proyectos</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="#">Lotes</a></li>
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="#"></a>Detalles</li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Detalles del lote</li>
          </ol>
          <h6 class="font-weight-bolder mb-0" id="cabezera">DETALLES DEL LOTE - </h6>
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
        <div class="col-lg-8">

          <!-- IMAGEN -->
          <div class="row">
            <div class="col-xl-6 mb-xl-0 mb-4">
              <div class="card bg-transparent shadow-xl" style="height: 100%;">
                <div class="overflow-hidden position-relative border-radius-xl" style="background-image: url('../../assets/img/curved-images/curved14.jpg');" id="imagen">
                  <span class="mask bg-gradient-dark" id="mask"></span>
                  <div class="card-body position-relative z-index-1 p-3">
                  </div>
                </div>
              </div>
            </div>

            <!-- CABEZERA DEL DETALLE -->

            <div class="col-xl-6">
              <div class="row">
                <div class="col-md-6">
                  <div class="card" style="height: 100%;">
                    <div class="card-header mx-4 p-3 text-center">
                      <div class="icon icon-shape icon-lg bg-primary shadow text-center border-radius-lg">
                        <i class="fa-solid fa-coins opacity-10"></i>
                      </div>
                    </div>
                    <div class="card-body pt-0 p-3 text-center">
                      <h6 class="text-center mb-0">Precio de construcción</h6>
                      <hr class="horizontal dark my-3">
                      <h5 class="mb-0" id="precio_construccion">--</h5>
                    </div>
                  </div>
                </div>

                <div class="col-md-6 mt-md-0 mt-4">
                  <div class="card" style="height: 100%;">
                    <div class="card-header mx-4 p-3 text-center">
                      <div class="icon icon-shape icon-lg bg-primary shadow text-center border-radius-lg">
                        <i class="fa-solid fa-hand-holding-dollar opacity-10"></i>
                      </div>
                    </div>
                    <div class="card-body pt-0 p-3 text-center">
                      <h6 class="text-center mb-0">Precio del lote</h6>
                      <hr class="horizontal dark my-3">
                      <h5 class="mb-0" id="precio_lote">--</h5>
                    </div>
                  </div>
                </div>
              </div>
            </div>

            <!-- /CABEZERA DEL DETALLE -->

            <!-- RESUMEN -->
            <div class="col-md-12 mb-lg-0 mb-4">
              <div class="card mt-4">
                <div class="card-header pb-0 p-3">
                  <div class="row">
                    <div class="col-6 d-flex align-items-center">
                      <h6 class="mb-0"><strong>RESUMEN</strong></h6>
                    </div>
                    <div id="list-resume" class="m-4">

                      <!-- RENDER RESUMEN -->

                    </div>
                  </div>
                </div>
                <div class="card-body p-3">
                  <div class="row">

                  </div>
                </div>
              </div>
            </div>

            <!-- CLIENTES -->

            <div class="col-md-12 mb-lg-0 mb-4">
              <div class="card mt-4">
                <div class="card-header pb-0 p-3">
                  <div class="row">
                    <div class="col-6 d-flex align-items-center">
                      <h6 class="mb-0">Clientes</h6>
                    </div>
                  </div>
                </div>
                <div class="card-body p-3">
                  <div class="row">
                    <div class="table-responsive table-responsive-lg">
                      <table class="table align-items-center mb-0 table-hover" id="table-clients">
                        <thead class="text-center">
                          <tr>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">#</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Cliente</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Tipo de documento</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Nº de documento</th>
                          </tr>
                        </thead>
                        <tbody class="text-center">

                          <!-- RENDER NUEVOS CLIENTES  -->

                        </tbody>
                      </table>
                      <div id="render-error">

                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>

          </div>
          <!-- /CLIENTES -->


          <!-- ---------- -->
        </div>
        <div class="col-lg-4">
          <div class="card h-100">
            <div class="card-header pb-0 p-3">
              <div class="row">
                <div class="col-6 d-flex align-items-center">
                  <h6 class="mb-0">Características</h6>
                </div>
              </div>
            </div>
            <div class="card-body p-3 pb-0">
              <ul class="list-group" id="caracteristicas">

                <!-- ESTADO -->
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex flex-column">
                    <h6 class="mb-1 text-dark font-weight-bold text-sm">Estado </h6>
                  </div>
                  <div class="d-flex align-items-center text-sm" id="estado">

                    <!-- RENDER -->

                  </div>
                </li>

                <!-- UBIGEO -->
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex flex-column">
                    <h6 class="mb-1 text-dark font-weight-bold text-sm">Ubigeo</h6>
                  </div>
                  <div class="d-flex align-items-center text-sm" id="ubigeo">

                    <!-- RENDER -->

                  </div>
                </li>

                <!-- DIRECCION -->
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex flex-column">
                    <h6 class="mb-1 text-dark font-weight-bold text-sm">Dirección</h6>
                  </div>
                  <div class="d-flex align-items-center text-sm" id="direccion">

                    <!-- RENDER -->

                  </div>
                </li>

                <!-- TIPO ACTIVO -->
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex flex-column">
                    <h6 class="mb-1 text-dark font-weight-bold text-sm">Tipo </h6>
                  </div>
                  <div class="d-flex align-items-center text-sm" id="tipo_activo">

                    <!-- RENDER -->

                  </div>
                </li>

                <!-- MONEDA VENTA -->
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex flex-column">
                    <h6 class="mb-1 text-dark font-weight-bold text-sm">Moneda de venta </h6>
                  </div>
                  <div class="d-flex align-items-center text-sm" id="moneda_venta">

                    <!-- RENDER -->

                  </div>
                </li>

                <!-- PARTIDA ELECTRÓNICA -->
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex flex-column">
                    <h6 class="mb-1 text-dark font-weight-bold text-sm">Partida electrónica</h6>
                  </div>
                  <div class="d-flex align-items-center text-sm" id="partida_elect">

                    <!-- RENDER -->

                  </div>
                </li>

                <!-- ÁREA DEL TERRENO -->
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex flex-column">
                    <h6 class="mb-1 text-dark font-weight-bold text-sm">Área del terreno</h6>
                  </div>
                  <div class="d-flex align-items-center text-sm" id="area_terreno">

                    <!-- RENDER -->

                  </div>
                </li>

                <!-- ÁREA DEL CONSTRUCCIÓN -->
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex flex-column">
                    <h6 class="mb-1 text-dark font-weight-bold text-sm">Área de construcción</h6>
                  </div>
                  <div class="d-flex align-items-center text-sm" id="area_construccion">

                    <!-- RENDER -->

                  </div>
                </li>

                <!-- ÁREA TECHADA -->
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex flex-column">
                    <h6 class="mb-1 text-dark font-weight-bold text-sm">Área techada</h6>
                  </div>
                  <div class="d-flex align-items-center text-sm" id="area_techada">

                    <!-- RENDER -->

                  </div>
                </li>

                <!-- ZONAS COMUNES -->
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex flex-column">
                    <h6 class="mb-1 text-dark font-weight-bold text-sm">Zonas comunes</h6>
                  </div>
                  <div class="d-flex align-items-center text-sm" id="zcomunes_porcent">

                    <!-- RENDER -->

                  </div>
                </li>

                <!-- PRECIO VENTA -->
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex flex-column">
                    <h6 class="mb-1 text-dark font-weight-bold text-sm">Precio de venta</h6>
                  </div>
                  <div class="d-flex align-items-center text-sm" id="precio_venta">

                    <!-- RENDER -->

                  </div>
                </li>

                <!-- MODELO DE PRESUPUESTO -->
                <li class="list-group-item border-0 d-flex justify-content-between ps-0 mb-2 border-radius-lg">
                  <div class="d-flex flex-column">
                    <h6 class="mb-1 text-dark font-weight-bold text-sm">MODELO DE PRESUPUESTO</h6>
                  </div>
                  <div class="d-flex align-items-center text-sm" id="modelo_presupuesto">

                    <!-- RENDER -->

                  </div>
                </li>

              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="row">

        <!-- DETALLES DE CONSTRUCCIÓN -->

        <div class="col-md-12 mb-lg-0 mb-4" id="show-detail">
          <div class="card mt-4">
            <div class="card-header pb-0 p-3">
              <div class="row">
                <div class="col-6 d-flex align-items-center">
                  <h6 class="mb-0">Detalles de constricción</h6>
                </div>
                <div class="col-6 text-end">
                  <button class="btn bg-gradient-dark mb-0" id="add"><i class="fas fa-plus"></i>&nbsp;&nbsp;Agregar</button>
                  <button type="button" class="btn bg-gradient-info mb-0" id="save"><i class="fa-solid fa-floppy-disk"></i> Guardar</button>
                </div>
              </div>
            </div>
            <div class="card-body p-3">
              <div class="card-body pt-4 p-3">
                <ul class="list-group" id="list-group">

                  <!-- RENDER DETALLES DE CONSTRUCCIÓN -->

                </ul>
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
                  <a href="https://aifperu.com/" class="font-weight-bold" target="_blank">A.I.F Contratistas Generales S.A.C</a>
                  (sistema web).
                </div>
              </div>
            </div>
          </div>
        </footer>
      </div>
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

  <!-- Button trigger modal -->
  <button id="show-modal" type="button" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#modalId" style="position: absolute; left: -9999px; top: -9999px;">
    Launch
  </button>

  <!-- Modal -->
  <div class="modal fade" id="modalId" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <form class="row needs-validation" id="form-montos" novalidate>
        <div class="modal-content p-0">
          <div class="modal-header bg-secondary">
            <h5 class="modal-title text-white" id="modalTitleId">
              Confirma el precio de venta !!
            </h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <h4>Actualiza los datos</h4>
            <!-- PRECIO LOTE -->
            <div class="mt-4">
              <label for="precio_lote" class="form-label">Precio del lote</label>
              <input type="number" class="form-control" id="precio_lote_modal" placeholder="Precio de venta" maxlength="7" minlength="7" min="1.00" value="0.00" step="0.01" required autofocus>
              <div class="invalid-feedback">
                Necesitas ingresar el precio del lote.
              </div>
              <div class="valid-feedback">
                Precio del lote registrado correctamente.
              </div>
            </div>

            <!-- PRESUPUESTO -->
            <div class="mt-4">
              <label for="idpresupuesto" class="form-label">Presupuesto</label>
              <select class="form-select custom-select-scroll" id="idpresupuesto_modal">
                <option value="">Presupuesto</option>
              </select>
              <div class="invalid-feedback">
                Necesitas ingresar el presupuesto.
              </div>
              <div class="valid-feedback">
                Presupuesto registrado correctamente.
              </div>
            </div>

            <!-- PRECIO CONSTRUCCION -->
            <div class="mt-4">
              <label for="precio_construccion" class="form-label">Precio de la construcción</label>
              <input type="number" class="form-control" id="precio_construccion_modal" placeholder="Precio de construcción" maxlength="7" minlength="7" min="1.00" value="0.00" step="0.01">
              <div class="invalid-feedback">
                Necesitas ingresar el precio de construcción.
              </div>
              <div class="valid-feedback">
                Precio de construcción registrado correctamente.
              </div>
            </div>

            <!-- PRECIO VENTA -->
            <div class="mt-4">
              <label for="precio_venta" class="form-label">Precio de la venta</label>
              <input type="number" class="form-control" id="precio_venta_modal" placeholder="Precio de venta" maxlength="8" minlength="8" min="1.00" value="0.00" step="0.01">
              <div class="invalid-feedback">
                Necesitas ingresar el precio de venta.
              </div>
              <div class="valid-feedback">
                Precio de venta registrado correctamente.
              </div>
            </div>

          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">
              Cerrar
            </button>
            <button type="submit" class="btn btn-primary">Guardar</button>
          </div>
        </div>
      </form>
    </div>
  </div>



  <!-- JQUERY -->
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
  <!-- <script src="../../assets/js/formMultiSteps.js"></script>
  <script src="../../assets/js/projects/interactionForms.js"></script> -->
  <!-- <script src="../../assets/js/renderUbigeo.js"></script>  -->
  <!-- jQuery and Bootstrap Bundle JS -->

  <script>
    document.addEventListener("DOMContentLoaded", () => {
      const global = new FunGlobal();
      const sAlert = new Alert();

      const $ = id => global.$(id);
      const $All = id => global.$All(id);

      const queryString = window.location.search;
      const url = new URLSearchParams(queryString);

      const code = url.get("id");

      const idActivo = atob(code);

      const btnsEdit = $All(".edit");

      let bootstrap;

      let det_casaJSON;
      let idPresupuesto;
      let dataDetAsset;

      //Edita los montos
      async function setAsset(id) {

        try {

          let url = "../../Controllers/asset.controller.php";

          let params = new FormData();

          params.append("action", "setAsset");
          params.append("idactivo", id);
          params.append("idproyecto", dataDetAsset.idproyecto);
          params.append("tipo_activo", dataDetAsset.tipo_activo);
          params.append("imagen", dataDetAsset.imagen);
          params.append("estado", dataDetAsset.estado);
          params.append("sublote", dataDetAsset.sublote);
          params.append("direccion", dataDetAsset.direccion);
          params.append("moneda_venta", dataDetAsset.moneda_venta);
          params.append("precio_venta", $("#precio_venta_modal").value);
          params.append("area_terreno", dataDetAsset.area_terreno);
          params.append("zcomunes_porcent", dataDetAsset.zcomunes_porcent);
          params.append("partida_elect", dataDetAsset.partida_elect);
          params.append("latitud", dataDetAsset.latitud);
          params.append("longitud", dataDetAsset.longitud);
          params.append("perimetro", dataDetAsset.perimetro);
          params.append("idpresupuesto", idPresupuesto);
          params.append("propietario_lote", dataDetAsset.propietario_lote);
          params.append("precio_lote", $("#precio_lote_modal").value);
          params.append("precio_construccion", $("#precio_construccion_modal").value);
          params.append("precio_venta", $("#precio_venta_modal").value);

          let results = await global.sendAction(url, params);

          if (results) {

            console.log(results);

            if (results.filasAfect > 0) {

              sAlert.sweetSuccess("Registro actualizado", "El registro se ha actualizado correctamente", () => {
                getDetails(idActivo);
              });
            } else {
              sAlert.sweetError("No se actualizó el registro", "Vuelve a intentarlo");
            }
          }

        } catch (e) {
          console.error(e);
        }
      }

      //Obtiene los presupuestos
      async function getBudgets() {

        try {
          let url = "../../Controllers/budget.controller.php";

          let params = new FormData();
          params.append("action", "listBudgetsAsset");

          let results = await global.sendAction(url, params);

          if (results) {

            results.forEach(option => {

              let newTag = document.createElement("option");
              newTag.value = option.idpresupuesto;
              newTag.innerText = option.codigo;
              newTag.dataset.monto = option.total;

              $("#idpresupuesto_modal").appendChild(newTag);
            })
          }
        } catch (e) {
          console.error(e)
        }
      }
      //Obtiene los presupuestos
      async function getBudgetsID(id) {

        try {
          let url = "../../Controllers/budget.controller.php";

          let params = new FormData();
          params.append("action", "getBudgetById");
          params.append("idpresupuesto", id);

          let results = await global.sendAction(url, params);

          if (results) {

            if (results.total !== dataDetAsset.precio_construccion) {
              $("#show-modal").click();


              getBudgets();
              $("#precio_lote_modal").value = dataDetAsset.precio_lote;

              setTimeout(() => {

                Array.from($("#idpresupuesto_modal").options).forEach(option => {
                  console.log(option.value)
                  console.log(results.idpresupuesto)
                  if (option.value == results.idpresupuesto) {
                    option.selected = true;
                  }
                })
              }, 1000);

              $("#precio_construccion_modal").value = results.total;

              let precio_lote = Number.parseFloat($("#precio_lote_modal").value);
              let precio_construccion = Number.parseFloat($("#precio_construccion_modal").value);
              let suma = (precio_lote + precio_construccion).toFixed(2);
              $("#precio_venta_modal").value = suma;
            }
            console.log(results)
          }
        } catch (e) {
          console.error(e)
        }
      }

      //Obitiene el resumen del presupuesto por subcategorìas de costos
      async function getResumeSubcategory(idpres) {

        try {

          let url = "../../Controllers/cost.controller.php";

          let params = new FormData();

          params.append("action", "resumeBudgetSubategory");
          params.append("idpresupuesto", idpres);

          let results = await global.sendAction(url, params);

          if (results) {

            let total = 0;
            let content = ``;

            results.forEach(result => {

              total += Number.parseFloat(result.total);

              content = `<p><strong>${result.subcategoria_costo}:  </strong> ${result.total}</p>`

              $("#list-resume").innerHTML += content;
            });

            let contentTotal = `<h6><strong>Total:  </strong> ${total}</h6>`
            $("#list-resume").innerHTML += contentTotal;

            console.log(total);
          }
        } catch (e) {
          console.error(e);
        }
      }

      /**
       * Renderiza los de talles de la construcción - recive un JSON
       */
      function renderDetBuild(json) {

        const jsonObj = JSON.parse(json);

        const keys = jsonObj.clave;
        const values = jsonObj.valor;

        keys.forEach((key, index) => {

          const value = values[index];

          if (key != "" || value != "") {

            let newDetail =
              `
              <li class="list-group-item border-0 p-4 mb-2 bg-gray-100 border-radius-lg">
      
                <div class="row">
                  <div class="col-md-9">
                    <div class="d-flex flex-column">
                      <h6 class="mb-3 text-sm text-key">${key}</h6>
                      <span class="mb-2 text-xs text-value"><span class="text-dark font-weight-bold ms-sm-2">${value}</span></span>
                    </div>
                  </div>
      
                  <div class="col-md-3">
                    <div class="ms-auto text-end">
                      <a class="btn btn-link text-danger text-gradient px-3 mb-0 delete" href="javascript:;"><i class="far fa-trash-alt me-2"></i>Eliminar</a>
                      <a class="btn btn-link text-dark px-3 mb-0 edit" href="javascript:;"><i class="fas fa-pencil-alt text-dark me-2" aria-hidden="true"></i>Editar</a>
                    </div>
                  </div>
      
                </div>
      
              </li>
            `;

            $("#list-group").innerHTML += newDetail;
          }
        });
      }

      function renderListError(id) {

        newDetail = `
        <div class="alert alert-danger m-4 text-white" role="alert">
            <strong class="text-white">No se ha encontrado registros</strong><br>Asegurate que exista la conformidad de datos.
        </div>
        `;
        $(id).innerHTML += newDetail;
      }

      /**
       * Obtiene los detalles de cosntrucción
       */
      async function getDetails(id) {

        try {
          let url = "../../Controllers/asset.controller.php";

          let params = new FormData();

          params.append("action", "listAssetId")
          params.append("idactivo", id)

          let result = await global.sendAction(url, params);

          if (result) {

            dataDetAsset = result;
            console.log(result)
            idPresupuesto = result.idpresupuesto;

            await getResumeSubcategory(idPresupuesto);

            let imagen = result.imagen ? result.imagen : "NoImage.jpg";

            $("#cabezera").innerHTML += `${result.sublote} - ${result.denominacion}`;

            $("#imagen").setAttribute("style", `background-image: url('../../media/lotes/${imagen}');background-size: cover; background-repeat: no-repeat; height:12rem; width: 100%`);
            $("#mask").classList.remove("bg-gradient-dark");
            $("#moneda_venta").innerText = result.moneda_venta;
            $("#precio_lote").innerText = result.precio_lote;
            $("#precio_construccion").innerText = result.precio_construccion;

            $("#estado").innerHTML = result.estado;
            $("#ubigeo").innerHTML = `${result.distrito} - ${result.provincia} - ${result.departamento}`;
            $("#direccion").innerHTML = result.direccion;
            $("#tipo_activo").innerHTML = result.tipo_activo;
            $("#partida_elect").innerHTML = result.partida_elect;
            $("#area_terreno").innerHTML = result.area_terreno ? `${result.area_terreno} m2` : 0 + "m2";
            $("#area_construccion").innerHTML = result.area_construccion ? `${result.area_construccion} m2` : 0 + "m2";
            $("#area_techada").innerHTML = result.area_techada ? `${result.area_techada} m2` : 0 + "m2";

            $("#zcomunes_porcent").innerHTML = result.zcomunes_porcen ? `${result.zcomunes_porcent} %` : 0 + " %";

            $("#precio_venta").innerHTML = result.moneda_venta == "USD" ? `$/ ${result.precio_venta}` : `S/ ${result.precio_venta}`;
            $("#modelo_presupuesto").innerHTML = result.modelo;

            if(result.tipo_activo == "LOTE") $("#show-detail").style.display = "none";
            det_casaJSON = result.det_casa
            getBudgetsID(idPresupuesto);
            renderDetBuild(det_casaJSON);

          } else {

            renderListError("#list-group");
          }
        } catch {

        }
      }

      /**
       * Actualiza los detalles de construcción
       */
      async function setDetAssetBuild(id, json) {

        try {

          let url = "../../Controllers/asset.controller.php"
          let params = new FormData();

          params.append("action", "setDetAssetBuild");
          params.append("idactivo", id);
          params.append("det_casa", json);

          let result = await global.sendAction(url, params);

          if (result) {

            if (result.filasAfect > 0) {
              sAlert.sweetSuccess("Registro actualizado", "El registro se ha actualizado correctamente", () => {

              });
            } else if (result.filasAfect == 0) {

              sAlert.sweetError("No se actualizó el registro", "Vuelve a intentarlo");

            } else {

              sAlert.sweetWarning("No hay actualizaciones", "No hay datos nuevos para actualizar");
            }
          }
        } catch (e) {

          console.error(e);
        }
      }

      /**
       *Obtentine el constenido de etiquetas de texto y las convierte a etiquetas el tipo input
       */
      async function getText() {

        const keyClass = ".list-group-item .text-key";
        const valueClass = ".list-group-item .text-value";

        const textContent = await global.getJsonTxT(keyClass, valueClass); // => Contenido del texto econvertido a JSON

        if (textContent) {

          setDetAssetBuild(idActivo, textContent);

        } else {
          console.error("no hay datos")
        }

      }

      /**
       * Transforma las etiquetas del tipo inputa a etiquetas de texto
       */
      async function restoreText() {

        const textareas = $All("textarea");
        const inputs = $All("input");

        inputs.forEach(input => {

          const h6 = document.createElement("h6");
          h6.classList.add("mb-3", "text-sm", "text-key")
          h6.textContent = input.value

          input.parentNode.replaceChild(h6, input);
        });


        textareas.forEach(textarea => {

          const span = document.createElement("span");
          span.classList.add("text-dark", "font-weight-bold", "ms-sm-2");
          span.textContent = textarea.value;

          const spanParent = document.createElement("span");
          spanParent.classList.add("mb-2", "text-xs", "text-value");

          spanParent.appendChild(span)

          textarea.parentNode.replaceChild(spanParent, textarea);
        });

        await getText()

      }

      /**
       * Elimina la etiqueta Li del botón seleccionado
       */
      async function dropTextli(event) {

        let li = event.target.closest(".list-group-item");

        li.remove();

        getText();
      }

      /**
       *Reemplaza las etiquetas de texto a una etiqueta input
       */
      function replaceTextLabel(e) {

        //reemplazando a una etiqueta input
        const h6 = e.target.parentNode.parentNode.previousElementSibling.querySelector(".text-key");

        const input = document.createElement("input");
        input.classList.add("form-control", "mb-2", "text-dark", "font-weight-bold", "ms-sm-2", "text-key");
        input.setAttribute("required", true);

        input.value = h6.textContent;
        input.innerHTML = h6.textContent;
        console.log(input.value),

          h6.parentNode.replaceChild(input, h6);

        //Remplazando a una etiqueta textarea
        const span = e.target.parentNode.parentNode.previousElementSibling.querySelector(".text-value");

        const textarea = document.createElement("textarea");

        textarea.classList.add("form-control", "mb-2", "text-dark", "font-weight-bold", "ms-sm-2", "text-value");
        textarea.setAttribute("cols", "70");
        textarea.setAttribute("rows", "10");
        textarea.value = span.textContent;
        textarea.innerHTML = span.textContent;

        span.parentNode.replaceChild(textarea, span);
      }

      function createIputText() {

        //CREA EL INPUT
        const input = document.createElement("input");
        input.classList.add("form-control", "mb-2", "text-dark", "font-weight-bold", "ms-sm-2", "text-key");

        //Crea el TEXTAREA
        const textarea = document.createElement("textarea");

        textarea.classList.add("form-control", "mb-2", "text-dark", "font-weight-bold", "ms-sm-2", "text-value");
        textarea.setAttribute("cols", "70");
        textarea.setAttribute("rows", "10");

        //Div flex-column
        const flexColumn = document.createElement("div");
        flexColumn.classList.add("d-flex", "flex-column");

        flexColumn.appendChild(input);
        flexColumn.appendChild(textarea);

        //Div col-md-9
        const colMd9 = document.createElement("div");
        colMd9.classList.add("col-md-9");

        colMd9.appendChild(flexColumn);

        //Botón edit
        const btnDelete = document.createElement("a");
        btnDelete.classList.add("btn", "btn-link", "text-danger", "text-gradient", "px-3", "mb-0", "delete");
        btnDelete.setAttribute("href", "#");
        btnDelete.innerText = "Eliminar";

        const iconTrash = document.createElement("i");
        iconTrash.classList.add("far", "fa-trash-alt", "me-2");

        btnDelete.insertBefore(iconTrash, btnDelete.firstChild);

        //Botón edit
        const btnEdit = document.createElement("a");
        btnEdit.classList.add("btn", "btn-link", "text-dark", "px-3", "mb-0", "edit");
        btnEdit.setAttribute("href", "#");
        btnEdit.innerText = "Editar";

        const iconPencil = document.createElement("i");
        iconPencil.classList.add("fas", "fa-pencil-alt", "text-dark", "me-2");
        iconPencil.setAttribute("aria-hidden", true);


        btnEdit.insertBefore(iconPencil, btnEdit.firstChild);

        //Div ms-auto
        const msAuto = document.createElement("div");
        msAuto.classList.add("ms-auto", "text-end")

        msAuto.appendChild(btnDelete);
        msAuto.appendChild(btnEdit);

        //Div col-md-3
        const colMd3 = document.createElement("div");
        colMd3.classList.add("col-md-3")

        colMd3.appendChild(msAuto);

        //Div row
        const row = document.createElement("div");
        row.classList.add("row");

        row.appendChild(colMd9);
        row.appendChild(colMd3);

        //Etiqueta LI 
        const li = document.createElement("li");
        li.classList.add("list-group-item", "border-0", "p-4", "mb-2", "bg-gray-100", "border-radius-lg");

        li.appendChild(row);

        let firstList = $("#list-group").firstChild;

        $("#list-group").insertBefore(li, firstList);
      }

      //FUnción para validar si las cajas están vacías
      function validateInputs(callback) {

        const form = $All(".list-group input, textarea");

        let isValid = true;

        console.log(isValid);
        // forEach => rcorre todos los elemmentos sin condición de frenar
        // every => rcorre todos los elementos y se devuelve true si todos son true o false si alguno no cumple
        // some => recorre todos los elementos y devuelve true si alguo coincide
        isValid =  Array.from(form).every(input => {

          if (input.value == "") {

            input.classList.add('was-validated'), //MUESTRA LOS LABELS EN ROJO
            isValid = false;

            input.reportValidity();

            sAlert.sweetWarning("Cajas vacías", "Necesitas completar los campos");
            return false;
          } else {

            input.classList.remove('was-validated');
            isValid = true;

            return true;
          }
        });
        
        if (isValid) {
          callback();

        }

      }

      function renderTable(idtable, data) {

        console.log('data :>> ', data);
        let numRow = 1;
        data.forEach(element =>{

          let newRow = "";
          newRow = `
          <tr class="table-active">
            <td>
              <p class="text-xs font-weight-bold mb-0">${numRow}</p>
            </td>
            <td>
              <p class="text-xs font-weight-bold mb-0">${element.cliente}</p>
            </td>
            <td>
              <p class="text-xs font-weight-bold mb-0">${element.documento_tipo}</p>
            </td>
            <td>
              <p class="text-xs font-weight-bold mb-0">${element.documento_nro}</p>
            </td>
          </tr>  
          `;
          ++numRow;

          if(element.conyugue){
            newRow += `
            <tr>
              <td>
                <p class="text-xs font-weight-bold mb-0">${numRow}</p>
              </td>
              <td>
                <p class="text-xs font-weight-bold mb-0">${element.conyugue}</p>
              </td>
              <td>
                <p class="text-xs font-weight-bold mb-0">${element.conyPers_documento_tipo}</p>
              </td>
              <td>
                <p class="text-xs font-weight-bold mb-0">${element.conyPers_documento_nro}</p>
              </td>
            </tr>  
            `;
          }
          
          $(idtable).innerHTML += newRow;
        });
      }

      async function getClients(id) {

        try {

          let url = "../../Controllers/separation.controller.php";

          let params = new FormData();

          params.append("action", "listByIdAsset");
          params.append("idactivo", id);

          let results = await global.sendAction(url, params);

          $("#table-clients tbody").innerHTML = "";
          if (results.length > 0) {

            console.log(results);
            renderTable("#table-clients tbody", results);
          } else {

            renderListError("#render-error")
          }
        } catch (e) {

          console.error(e);

        }
      }

      $("#add").addEventListener("click", () => {

        if (idPresupuesto) {

          validateInputs(createIputText);
        } else {
          sAlert.sweetError("Registra el presupuesto", "El lote no tiene aún un presupuesto asignado");
        }

      });

      $("#save").addEventListener("click", () => {

        const form = $All(".list-group input, textarea");

        if (form.length > 0) {

          validateInputs(restoreText);

        } else {

          sAlert.sweetWarning("No hay actualizaciones", "No hay datos nuevos para actualizar");
        }

      });

      $("#list-group").addEventListener("click", (e) => {

        if (e.target.classList.contains("edit")) {

          replaceTextLabel(e);

        } else if (e.target.classList.contains("delete")) {

          sAlert.sweetConfirm("¿Deseas eliminar esta especifiación?", "Una vez borrado no se podrá recuperar", () => {

            dropTextli(e);
          })
        }
      });

      $("#precio_lote_modal").addEventListener("input", (e) => {
        let precioLote = Number.parseFloat(e.target.value || 0);

        let precioConstruccion = Number.parseFloat($("#precio_construccion_modal").value == false ? 0 : $("#precio_construccion_modal").value);

        $("#precio_venta_modal").value = precioLote + precioConstruccion;

      })

      $("#idpresupuesto_modal").addEventListener("change", () => {

        let presupuesto = $("#idpresupuesto_modal").options[$("#idpresupuesto_modal").selectedIndex].dataset.monto;
        let monto = Number.parseFloat(presupuesto);
        let precioLote = Number.parseFloat($("#precio_lote_modal").value || 0);

        $("#precio_construccion_modal").value = monto;
        $("#precio_venta_modal").value = monto + precioLote;
      });

      getClients(idActivo);
      getDetails(idActivo);

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
            } else {
              event.preventDefault();
              sAlert.sweetConfirm("Datos nuevos", "¿Deseas actualizar el registro?", () => {

                setAsset(idActivo); //Ejecuta la función
                window.location.reload();
              });
            }

            form.classList.add('was-validated') //=> AGREGA ESTA CLASE A LOS ELEMENTOS DEL FORMULARIO(MUESTRA LOS COMENTARIOS)
          }, false) //=> ESTE TERCER ARGUMENTO INDICA QUE EL EVENTO NO SE ESTA CAPTURANDO EN LA ""FASE DE CAPTURA" SINO EN "PROPAGACIÓN NORMAL"
        })
      })();
    })
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example Views etc -->
  <script src="../../assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
</body>

</html>