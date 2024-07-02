<?php require_once "../sidebar/permissions.php"; ?>

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

      <?php require_once "../sidebar/sidebar_options.php"; ?>

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
          <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="#">CLientes</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Eliminar clientes</li>
          </ol>
          <h6 class="font-weight-bolder mb-0" id="cabezera">ELIMINAR 
            CIENTES </h6>
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

    <div class="col-lg-12 mb-lg-0 mb-4 mt-4">
            <div class="card">
              <div class="card-body" style="padding: 50px">
                <div class="row">
                  <div class="col-lg-12">
                    <div class="d-flex flex-column h-100">
                      <form class="row needs-validation" id="form-add-project" novalidate>
                        <div class="row">
                          <div class="col-md-12" id="card-body">

                            <!-- REGISTRO -->
                              <div  class="card-title m-4"><h2 style="text-align: center; text-transform: uppercase;"><strong  id="card-title"></strong></h2></div>
                              <hr>
                              <div id="data-client">

                              <!-- RENDER DATOS DEL CLIENTE -->
                              </div>
                              
                              <div class="m-4" style="display:flex; justify-content: center;">
                                <h4 class="ask-footer text-danger">¿Deseas eliminarlo?</h4>
                              </div>
                              <div style ="display: flex; justify-content: center;">
                                <div>
                                  <div class="btn-group">                                    
                                      <button type="button" class="btn btn-danger" id="eliminar">Eliminar</button>
                                      <button type="button" class="btn btn-success" id="cancelar">Cancelar</button>
                                  </div>
                                </div>
                                
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
  <script>
document.addEventListener("DOMContentLoaded",()=>{

  /* INSTANCIAS */
  const global = new FunGlobal();
  const sAlert = new Alert();

  const $ = id => global.$(id);
  const $All = id => global.$All(id);

  let dataClient;
  let dataClients;

  let url = window.location.search;
  let stringQuery = new URLSearchParams(url);
  let code = stringQuery.get("id");
  let idCliente = atob(code);

  //Obtiene los datos del cliente
  async function getClient(id){

    try{

      let url ="../../Controllers/client.controller.php";
      let params = new FormData();
  
      params.append("action","listClientById");
      params.append("idcliente",id);

      results = await global.sendAction(url, params);

      if(results){

        console.log(results);
        dataClient = results;

        let row = "";
        row = `
            <div class="row">
              <div class="col-md-6">
                <h3><strong>Tipo de persona :</strong></h3>
              </div>
              <div class="col-md-6">
                <h4 id="sublote"> ${dataClient.tipo_persona} </h4>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <h3><strong>Tipo de documento :</strong></h3>
              </div>
              <div class="col-md-6">
                <h4 id="sublote"> ${dataClient.documento_tipo} </h4>
              </div>
            </div>

            <div class="row">
              <div class="col-md-6">
                <h3><strong>Nº de documento :</strong></h3>
              </div>
              <div class="col-md-6">
                <h4 id="sublote"> ${dataClient.documento_nro} </h4>
              </div>
            </div>
        `;
        if(dataClient.tipo_persona == "JURÍDICA"){
          $("#card-title").innerHTML = dataClient.razon_social;

          row += `

              <div class="row">
                <div class="col-md-6">
                  <h3><strong>Razón social :</strong></h3>
                </div>
                <div class="col-md-6">
                  <h4 id="sublote"> ${dataClient.razon_social} </h4>
                </div>
              </div>

              <hr>
              <h3><strong>Razón Datos del representante :</strong></h3>
              <br>

              <div class="row">
                <div class="col-md-6">
                  <h3><strong>Nombres y apellidos :</strong></h3>
                </div>
                <div class="col-md-6">
                  <h4 id="sublote"> ${dataClient.representante_legal} </h4>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <h3><strong>Tipo de documento :</strong></h3>
                </div>
                <div class="col-md-6">
                  <h4 id="sublote"> ${dataClient.repDocumento_tipo} </h4>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <h3><strong>Nº de documento :</strong></h3>
                </div>
                <div class="col-md-6">
                  <h4 id="sublote"> ${dataClient.repDocumento_nro} </h4>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <h3><strong>Cargo :</strong></h3>
                </div>
                <div class="col-md-6">
                  <h4 id="sublote"> ${dataClient.cargo} </h4>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <h3><strong>Partida electrónica :</strong></h3>
                </div>
                <div class="col-md-6">
                  <h4 id="sublote"> ${dataClient.partida_elect} </h4>
                </div>
              </div>
              `;

        }else{
          $("#card-title").innerHTML = dataClient.apellidos + ", " + dataClient.nombres;
          row += `
              <div class="row">
                <div class="col-md-6">
                  <h3><strong>Apellidos :</strong></h3>
                </div>
                <div class="col-md-6">
                  <h4 id="sublote"> ${dataClient.apellidos} </h4>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <h3><strong>Nombres :</strong></h3>
                </div>
                <div class="col-md-6">
                  <h4 id="sublote"> ${dataClient.nombres} </h4>
                </div>
              </div>

              <div class="row">
                <div class="col-md-6">
                  <h3><strong>Estado civil :</strong></h3>
                </div>
                <div class="col-md-6">
                  <h4 id="sublote"> ${dataClient.estado_civil} </h4>
                </div>
              </div>
              
              <div class="row">
                <div class="col-md-6">
                  <h3><strong>Nombres :</strong></h3>
                </div>
                <div class="col-md-6">
                  <h4 id="sublote"> ${dataClient.nacionalidad} </h4>
                </div>
              </div>

              `;
          
          
        }

        $("#data-client").innerHTML += row;
      }
    }
    catch(e){
      console.error(e);
    }
  }

  //Agrega un cliente
  async function deleteClient(id){

    try{

      let url = "../../Controllers/client.controller.php";

      let params = new FormData();
      params.append("action","inactiveClient")
      params.append("idcliente",id)
      
      let result = await global.sendAction(url, params);

      if(result){

        console.log(result.filasAfect);
        if(result.filasAfect > 0){

          sAlert.sweetSuccess("Se elminó el registro","El registro se ha eliminado de forma exitosa",()=>{
    
            window.location.href = "./index.php";
          });

        }else{
          sAlert.sweetError("No se eliminó el registro","Vuelve a intentarlo");
        }

      }else{
        sAlert.sweetError("No se eliminó el registro","Vuelve a intentarlo");
      }
    }
    catch(e){
      
      console.error(e);
    }
  }

  $("#eliminar").addEventListener("click",()=>{

    deleteClient(idCliente);
  });

  $("#cancelar").addEventListener("click",()=>{

    window.location.href = "./index.php";
  });
  
  getClient(idCliente);
  
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