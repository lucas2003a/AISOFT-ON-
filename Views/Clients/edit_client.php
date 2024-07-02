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
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Editar clientes</li>
          </ol>
          <h6 class="font-weight-bolder mb-0" id="cabezera">EDITAR 
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

    <div class="d-flex flex-column h-100">

        <hr>
        <form class="row needs-validation" id="form-data-client" novalidate>
          <div class="row">
            <div class="col-md-4">
              <!-- TIPO DE PERSONA -->
              <div class="mt-4">
                <label for="tipo_persona" class="form-label">Tipo de persona</label>
                  <select class="form-select custom-select-scroll" id="tipo_persona" required>
                    <option selected value="NATURAL">Natural</option>
                    <option value="JURÍDICA">Juridica</option>
                  </select>
                  <div class="invalid-feedback">
                      Necesitas escojer un tipo de persona.
                  </div>
                  <div class="valid-feedback">
                    Tipo de persona seleccionado correctamente.
                  </div>
              </div>
            </div>
            <div class="col-md-4">
    
              <!-- DOCUMENTO TIPO -->
              <div class="mt-4">
                <label for="documento_tipo" class="form-label">Tipo de documento</label>
                <select name="documento_tipo" class="form-select" id="documento_tipo" required>
                  <option value="">Tipo de documento</option>
                </select>
                <div class="invalid-feedback">
                  Necesitas registrar el tipo de documento.
                </div>
                <div class="valid-feedback">
                  Tipo de documento registrado correctamente.
                </div>
              </div>
            </div>
            <div class="col-md-4 mt-4">
              <label for="documento_nro" class="form-label">Nº de documento</label>
              <div class="row">
                <div class="col-md-9">
      
                  <input type="text" name="documento_nro" id="documento_nro" class="form-control" placeholder="Nº documento" required>
                  <div class="invalid-feedback">
                      Necesitas ingresar el número del documento.
                  </div>
                  <div class="valid-feedback">
                      Nº de documento ingresado correctamente.
                  </div>
                </div>
                <div class="col-md-3">
                  <button type="submit" class="btn btn-success" id="buscar" disabled>Buscar</button>
                  
                </div>
              </div>
    
            </div>
          </div>
          <div class="row">
            <div class="col-md-6">

                <!-- DATOS GENERALES -->


                <!-- DEPARTAMENTO -->
                <div class="mt-4">
                    <label for="iddepartamento" class="form-label">Departamento</label>
                    <select class="form-select custom-select-scroll" id="iddepartamento" required>
                        <option selected disabled value="">Departamento</option>
                    </select>
                    <div class="invalid-feedback">
                        Necesitas escojer una departamento.
                    </div>
                    <div class="valid-feedback">
                      Departamento escojido correctamente.
                    </div>
                </div>

                <!-- PROVINCIA -->
                <div class="mt-4">
                    <label for="idprovincia" class="form-label">Provincia</label>
                    <select class="form-select custom-select-scroll" id="idprovincia" required>
                        <option selected disabled value="">Provincia</option>
                    </select>
                    <div class="invalid-feedback">
                        Necesitas escojer una provincia.
                    </div>
                    <div class="valid-feedback">
                        Provincia escojida correctamente.
                    </div>
                </div>

                <!-- DISTRITO -->
                <div class="mt-4">
                    <label for="iddistrito" class="form-label">Distrito</label>
                    <select class="form-select custom-select-scroll" id="iddistrito" required>
                        <option selected disabled value="">Distrito</option>
                    </select>
                    <div class="invalid-feedback">
                        Necesitas escojer un distrito.
                    </div>
                    <div class="valid-feedback">
                        Distrito escojido correctamente.
                    </div>
                </div>

                <!-- DIRECCIÓN -->
                <div class="mt-4">
                    <label for="direccion" class="form-label">Dirección</label>                                  
                    <input type="text" class="form-control" id="direccion" placeholder="Dirección" required>
                    <div class="invalid-feedback">
                        Necesitas registrar la dirección.
                    </div>
                    <div class="valid-feedback">
                        Dirección registrada correctamente.
                    </div>
                </div>

                 <!-- NACIONALIDAD -->
                 <div class="mt-4">
                    <label for="nacionalidad" class="form-label">Nacionalidad</label>
                    <input type="text" name="nacionalidad" id="nacionalidad" placeholder="Nacionalidad" class="form-control pern-n">
                    <div class="invalid-feedback">
                        Necesitas registrar la nacionalidad.
                    </div>
                    <div class="valid-feedback">
                      Nacionalidad registrada correctamente.
                    </div>
                </div>  

                   
            </div>

            <div class="col-md-6">

                <!-- APELLIDOS -->
                <div class="mt-4">
                    <label for="apellidos" class="form-label">Apellidos</label>
                    <input type="text" name="nombres" id="apellidos" placeholder="Apellidos" class="form-control pern-n" required>
                    <div class="invalid-feedback">
                        Necesitas registrar los apellidos.
                    </div>
                    <div class="valid-feedback">
                        Apellidos registrados correctamente.
                    </div>
                </div>

                <!-- NOMBRES -->
                <div class="mt-4">
                    <label for="nombres" class="form-label">Nombres</label>
                    <input type="text" name="nombres" id="nombres" placeholder="Nombres" class="form-control pern-n" required>
                    <div class="invalid-feedback">
                        Necesitas registrar los nombres.
                    </div>
                    <div class="valid-feedback">
                        Nombres registrados correctamente.
                    </div>
                </div>              

                <!-- ESTADO CIVIL -->
                <div class="mt-4">
                    <label for="estado_civil" class="form-label">Estado civil</label>                                  
                    <input type="text" class="form-control pern-n" id="estado_civil" placeholder="Estado civil" required>
                    <div class="invalid-feedback">
                        Necesitas registrar el estado civil.
                    </div>
                    <div class="valid-feedback">
                        Estado civil registrado correctamente.
                    </div>
                </div>

                <!-- RAZÓN SOCIAL -->
                <div class="mt-4">
                    <label for="razon_social" class="form-label">Razón social</label>
                    <input type="text" name="razon_social" id="razon_social" placeholder="Razón social" class="form-control pern-j" disabled>
                    <div class="invalid-feedback">
                        Necesitas registrar la razón social.
                    </div>
                    <div class="valid-feedback">
                      Razón social registrada correctamente.
                    </div>
                </div>  
                <div class="mt-4">
                  <button type="button" class="btn btn-primary btn-lg  pern-j" id="open-modal-represents" data-bs-toggle="modal" data-bs-target="#modal-data-represents" disabled>
                  Representantes
                  </button>
                </div>
              </div>                                    
              <div class="mt-4 mb-4">

                  <button class="btn btn-success" type="submit" id="guardar">Guardar</button>
              </div>
                <!-- Button trigger modal -->

        </div>
      </form>
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

  
  <!-- Modal -->
  <div class="modal fade" id="modal-data-represents" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog  modal-fullscreen-sm-down modal-lg" role="document">
      <form action="" id="form-data-represents" class="row needs-validation">
        <div class="modal-content p-0">
          <div class="modal-header bg-secondary">
            <h5 class="modal-title" id="modalTitleId">
              Representantes legales
            </h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
          </div>
          <div class="modal-body">
            <div class="text-end">
            <button type="button" class="btn bg-gradient-dark" id="add"><i class="fas fa-plus"></i>&nbsp;&nbsp;Agregar</button> 
            <button type="button" class="btn bg-gradient-dark" id="queryApi">Consulta Api</button>
            <button type="button" class="btn bg-gradient-dark d-none" id="spinner" disabled>
                    <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span>
                  </button> 
            </div>
            <div class="card-body pt-4 p-3">

              <ul class="list-group" id="list-represents">
                
              <!-- RENDER REPRESENTANTES -->
                <li class="list-group-item border-0 d-flex p-4 mb-4 bg-gray-100 border-radius-lg add-data">
                  <div class="col-12">
                    <div class="form-check">
                      <input class="form-check-input" name="estado-check" type="checkbox" checked>
                        <label class="form-check-label" style="width: 100%;">
                        <div class="ms-auto text-end">
                        <a type="button" class="btn btn-link text-danger text-gradient px-3 mb-0 delete" href="javascript:;"><i class="far fa-trash-alt me-2"></i>Eliminar</a>
                        </div>
                        <div class="row">
                          
                          <!-- REPRESENTANTE LEGAL -->
                          <div class="mt-4">
                              <label for="representante_legal" class="form-label">Representante legal</label>
                              <input type="text" name="representante_legal" placeholder="Representante legal" class="form-control" required>
                              <div class="invalid-feedback">
                                  Necesitas registrar al representante legal.
                              </div>
                              <div class="valid-feedback">
                                Representante legal registrado correctamente.
                              </div>
                          </div>  
                        </div>

                        <div class="row">

                          <!-- NRO DE DOCUMENTO DEL REPRESENTATE -->
                          <div class="mt-4 col-md-6">
                              <label for="documento_nro_representante" class="form-label">Nº de documento</label>
                              <input type="text" name="documento_nro" placeholder="Nº de documento" class="form-control" minlength="8" maxlength="8" required>
                              <div class="invalid-feedback">
                                  Necesitas registrar el nº de documento del representante.
                              </div>
                              <div class="valid-feedback">
                                Nº de documento del representante registrado correctamente.
                              </div>
                          </div>  

                          
                          <!-- TIPO DE DOCUMENTO DEL REPRESENTATE -->
                          <div class="mt-4 col-md-6">
                              <label for="documento_t_representante" class="form-label">Tipo de documento</label>
                              <input type="text" name="documento_tipo" placeholder="Tipo de documento" class="form-control" required>
                              <div class="invalid-feedback">
                                  Necesitas registrar el tipo de documento del representante.
                              </div>
                              <div class="valid-feedback">
                                Tipo de documento del representante registrado correctamente.
                              </div>
                          </div>
                        </div>
                        <div class="row">

                          <div class="mt-4 col-md-6">

                              <!-- PARTIDA ELECTRÓNICA -->
                              <label for="partida_elect" class="form-label">Partida electrónica</label>
                              <input type="text" name="partida_elect" placeholder="Partida electrónica" class="form-control partida_elect" required>
                              <div class="invalid-feedback">
                                  Necesitas registrar la partida electrónica.
                              </div>
                              <div class="valid-feedback">
                                Partida electrónica registrada correctamente.
                              </div>
                          </div>
          
                          <!-- CARGO -->
                          <div class="mt-4 col-md-6">
                              <label for="cargo" class="form-label">Cargo</label>
                              <input type="text" name="cargo" placeholder="Cargo" class="form-control" required>
                              <div class="invalid-feedback">
                                  Necesitas registrar el cargo.
                              </div>
                              <div class="valid-feedback">
                                Cargo registrado correctamente.
                              </div>
                          </div>
                        </div>
                        </label>
                      </div>
                    </div>
                  </div>
                </li>

              </ul>

            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="cerrar">
                Cerrar
              </button>
              <button type="submit" class="btn btn-primary" id="guardar-representante">Guardar</button>
            </div>
          </div>
        </div>
      </form>
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
  <script src="../../assets/js/renderUbigeo.js"></script>
  <script>
document.addEventListener("DOMContentLoaded",()=>{

  /* INSTANCIAS */
  const global = new FunGlobal();
  const sAlert = new Alert();

  const $ = id => global.$(id);
  const $All = id => global.$All(id);

  let serchQuery = document.location.search;
  let params = new URLSearchParams(serchQuery);
  let code = params.get("id");

  let idCliente = atob(code);
  
  
  let dataClient;
  let dataClients;
  let idpersonaJuridica;
  let register = false;
  
  let numList;
  let idStoDelete = [];
  let dataRepresents;


  function createInputs(){

    let newCard = `
    <li class="list-group-item border-0 d-flex p-4 mb-4 bg-gray-100 border-radius-lg add-data">
                  <div class="col-12">
                    <div class="form-check">
                      <input class="form-check-input" name="estado-check" type="checkbox" checked>
                        <label class="form-check-label" style="width: 100%;">
                        <div class="ms-auto text-end">
                          <a class="btn btn-link text-danger text-gradient px-3 mb-0 delete" href="javascript:;"><i class="far fa-trash-alt me-2"></i>Eliminar</a>
                        </div>
                        <div class="row">
                          
                          <!-- REPRESENTANTE LEGAL -->
                          <div class="mt-4">
                              <label for="representante_legal" class="form-label">Representante legal</label>
                              <input type="text" name="representante_legal" placeholder="Representante legal" class="form-control" required>
                              <div class="invalid-feedback">
                                  Necesitas registrar al representante legal.
                              </div>
                              <div class="valid-feedback">
                                Representante legal registrado correctamente.
                              </div>
                          </div>  
                        </div>

                        <div class="row">

                          <!-- NRO DE DOCUMENTO DEL REPRESENTATE -->
                          <div class="mt-4 col-md-6">
                              <label for="documento_nro_representante" class="form-label">Nº de documento</label>
                              <input type="text" name="documento_nro" placeholder="Nº de documento" class="form-control" minlength="8" maxlength="8" required>
                              <div class="invalid-feedback">
                                  Necesitas registrar el nº de documento del representante.
                              </div>
                              <div class="valid-feedback">
                                Nº de documento del representante registrado correctamente.
                              </div>
                          </div>  

                          
                          <!-- TIPO DE DOCUMENTO DEL REPRESENTATE -->
                          <div class="mt-4 col-md-6">
                              <label for="documento_t_representante" class="form-label">Tipo de documento</label>
                              <input type="text" name="documento_tipo" placeholder="Tipo de documento" class="form-control" required>
                              <div class="invalid-feedback">
                                  Necesitas registrar el tipo de documento del representante.
                              </div>
                              <div class="valid-feedback">
                                Tipo de documento del representante registrado correctamente.
                              </div>
                          </div>
                        </div>
                        <div class="row">

                          <div class="mt-4 col-md-6">

                              <!-- PARTIDA ELECTRÓNICA -->
                              <label for="partida_elect" class="form-label">Partida electrónica</label>
                              <input type="text" name="partida_elect" placeholder="Partida electrónica" class="form-control partida_elect" required>
                              <div class="invalid-feedback">
                                  Necesitas registrar la partida electrónica.
                              </div>
                              <div class="valid-feedback">
                                Partida electrónica registrada correctamente.
                              </div>
                          </div>
          
                          <!-- CARGO -->
                          <div class="mt-4 col-md-6">
                              <label for="cargo" class="form-label">Cargo</label>
                              <input type="text" name="cargo" placeholder="Cargo" class="form-control" required>
                              <div class="invalid-feedback">
                                  Necesitas registrar el cargo.
                              </div>
                              <div class="valid-feedback">
                                Cargo registrado correctamente.
                              </div>
                          </div>
                        </div>
                        </label>
                      </div>
                    </div>
                  </div>
                </li>
    `;

    //Renderiza sin borrar los registros anteriores
    $("#list-represents").insertAdjacentHTML("beforeend",newCard);
  }

  
  //Obtiene los datos del o los reppresentantes legales
  async function getRepresents(id){

    try{

      let url ="../../Controllers/client.controller.php";
      let params = new FormData();
  
      params.append("action","getRepresents");
      params.append("idpersona_juridica",id);

      results = await global.sendAction(url, params);

      if(results && results.length > 0){

        console.log(results)

        dataRepresents = results;
          let newCard = ``;

          $("#list-represents").innerHTML = "";
          dataRepresents.forEach(rep =>{

            newCard = `
            <li class="list-group-item border-0 d-flex p-4 mb-4 bg-gray-100 border-radius-lg edit-data" >
                    <div class="col-12">
                      <div class="form-check">
                        <input class="form-check-input edit-data" name="estado-check" data-id="${rep.idrepresentante}" type="checkbox" checked>
                          <label class="form-check-label" style="width: 100%">
                          <div class="ms-auto text-end">
                          <a type="button" class="btn btn-link text-danger text-gradient px-3 mb-0 delete edit-data" href="javascript:;" data-id="${rep.idrepresentante}"><i class="far fa-trash-alt me-2"></i>Eliminar</a>
                          </div>
                          <div class="row">
                            
                            <!-- REPRESENTANTE LEGAL -->
                            <div class="mt-4">
                                <label for="representante_legal" class="form-label">Representante legal</label>
                                <input type="text" name="representante_legal" placeholder="Representante legal" class="form-control" value="${rep.representante_legal}" required>
                                <div class="invalid-feedback">
                                    Necesitas registrar al representante legal.
                                </div>
                                <div class="valid-feedback">
                                  Representante legal registrado correctamente.
                                </div>
                            </div>  
                          </div>

                          <div class="row">

                            <!-- NRO DE DOCUMENTO DEL REPRESENTATE -->
                            <div class="mt-4 col-md-6">
                                <label for="documento_nro_representante" class="form-label">Nº de documento</label>
                                <input type="text" name="documento_nro" placeholder="Nº de documento" class="form-control" value="${rep.documento_nro}" min-length="8" max-length="8" required>
                                <div class="invalid-feedback">
                                    Necesitas registrar el nº de documento del representante.
                                </div>
                                <div class="valid-feedback">
                                  Nº de documento del representante registrado correctamente.
                                </div>
                            </div>  

                            
                            <!-- TIPO DE DOCUMENTO DEL REPRESENTATE -->
                            <div class="mt-4 col-md-6">
                                <label for="documento_t_representante" class="form-label">Tipo de documento</label>
                                <input type="text" name="documento_tipo" placeholder="Tipo de documento" class="form-control" value="${rep.documento_tipo}" required>
                                <div class="invalid-feedback">
                                    Necesitas registrar el tipo de documento del representante.
                                </div>
                                <div class="valid-feedback">
                                  Tipo de documento del representante registrado correctamente.
                                </div>
                            </div>
                          </div>
                          <div class="row">

                            <div class="mt-4 col-md-6">

                                <!-- PARTIDA ELECTRÓNICA -->
                                <label for="partida_elect" class="form-label">Partida electrónica</label>
                                <input type="text" name="partida_elect" placeholder="Partida electrónica" class="form-control" value="${rep.partida_elect}" required>
                                <div class="invalid-feedback">
                                    Necesitas registrar la partida electrónica.
                                </div>
                                <div class="valid-feedback">
                                  Partida electrónica registrada correctamente.
                                </div>
                            </div>
            
                            <!-- CARGO -->
                            <div class="mt-4 col-md-6">
                                <label for="cargo" class="form-label">Cargo</label>
                                <input type="text" name="cargo" placeholder="Cargo" class="form-control" value="${rep.cargo}" required>
                                <div class="invalid-feedback">
                                    Necesitas registrar el cargo.
                                </div>
                                <div class="valid-feedback">
                                  Cargo registrado correctamente.
                                </div>
                            </div>
                          </div>
                          </label>
                      </div>
                    </div>
                  </li>
            `;
            $("#list-represents").innerHTML += newCard;
          });

      }else{
        console.log("no hay resultados")
      }
    }
    catch(e){
      console.error(e);
    }
  }

  //Busca los datos del prepresentante legal de una empresa POR SU RUC
  async function searchRpRUC(dnro){

    try{

      $("#guardar-representante").disabled = true;
      $("#add").disabled = true;
      $("#queryApi").classList.toggle("d-none");
      $("#spinner").classList.toggle("d-none");

      let params = new URLSearchParams();
      params.append("action","searchRpRUC");
      params.append("documento_nro",$("#documento_nro").value)

      let url = `../../Controllers/searchDocument.php?${params}`;

      let result = await global.sendActionGET(url);

      if(result){
        if(result.data.success){

          let docs = result.data.data;

          let newCard = "";
          $("#list-represents").innerHTML = "";
          docs.forEach(rep =>{

            console.log(dataRepresents);
            if(dataRepresents && dataRepresents.length > 0){

              let found = dataRepresents.find(represent => represent.documento_nro == rep.numero_de_documento);
  
              if(!found){
  
                newCard = `
                <li class="list-group-item border-0 d-flex p-4 mb-4 bg-gray-100 border-radius-lg add-data">
                        <div class="col-12">
                          <div class="form-check">
                            <input class="form-check-input" name="estado-check" type="checkbox" checked>
                              <label class="form-check-label" style="width: 100%">
                              <div class="ms-auto text-end">
                                <a class="btn btn-link text-danger text-gradient px-3 mb-0 delete" href="javascript:;"><i class="far fa-trash-alt me-2"></i>Eliminar</a>
                              </div>
                              <div class="row">
                                
                                <!-- REPRESENTANTE LEGAL -->
                                <div class="mt-4">
                                    <label for="representante_legal" class="form-label">Representante legal</label>
                                    <input type="text" name="representante_legal" placeholder="Representante legal" class="form-control" value="${rep.nombre}" required>
                                    <div class="invalid-feedback">
                                        Necesitas registrar al representante legal.
                                    </div>
                                    <div class="valid-feedback">
                                      Representante legal registrado correctamente.
                                    </div>
                                </div>  
                              </div>
    
                              <div class="row">
    
                                <!-- NRO DE DOCUMENTO DEL REPRESENTATE -->
                                <div class="mt-4 col-md-6">
                                    <label for="documento_nro_representante" class="form-label">Nº de documento</label>
                                    <input type="text" name="documento_nro" placeholder="Nº de documento" class="form-control" value="${rep.numero_de_documento}" min-length="8" max-length="8" required>
                                    <div class="invalid-feedback">
                                        Necesitas registrar el nº de documento del representante.
                                    </div>
                                    <div class="valid-feedback">
                                      Nº de documento del representante registrado correctamente.
                                    </div>
                                </div>  
    
                                
                                <!-- TIPO DE DOCUMENTO DEL REPRESENTATE -->
                                <div class="mt-4 col-md-6">
                                    <label for="documento_t_representante" class="form-label">Tipo de documento</label>
                                    <input type="text" name="documento_tipo" placeholder="Tipo de documento" class="form-control" value="${rep.tipo_de_documento}" required>
                                    <div class="invalid-feedback">
                                        Necesitas registrar el tipo de documento del representante.
                                    </div>
                                    <div class="valid-feedback">
                                      Tipo de documento del representante registrado correctamente.
                                    </div>
                                </div>
                              </div>
                              <div class="row">
    
                                <div class="mt-4 col-md-6">
    
                                    <!-- PARTIDA ELECTRÓNICA -->
                                    <label for="partida_elect" class="form-label">Partida electrónica</label>
                                    <input type="text" name="partida_elect" placeholder="Partida electrónica" class="form-control partida_elect" required>
                                    <div class="invalid-feedback">
                                        Necesitas registrar la partida electrónica.
                                    </div>
                                    <div class="valid-feedback">
                                      Partida electrónica registrada correctamente.
                                    </div>
                                </div>
                
                                <!-- CARGO -->
                                <div class="mt-4 col-md-6">
                                    <label for="cargo" class="form-label">Cargo</label>
                                    <input type="text" name="cargo" placeholder="Cargo" class="form-control" value="${rep.cargo}" required>
                                    <div class="invalid-feedback">
                                        Necesitas registrar el cargo.
                                    </div>
                                    <div class="valid-feedback">
                                      Cargo registrado correctamente.
                                    </div>
                                </div>
                              </div>
                              </label>
                          </div>
                        </div>
                      </li>
                `;
                $("#list-represents").insertAdjacentHTML("beforeend",newCard);

              }else{
                sAlert.sweetWarning("El número de documento ya existe","El número de documento ya existe, revisa si no necesita una actualización");
              }
            }else{
              newCard = `
                <li class="list-group-item border-0 d-flex p-4 mb-4 bg-gray-100 border-radius-lg add-data">
                        <div class="col-12">
                          <div class="form-check">
                            <input class="form-check-input" name="estado-check" type="checkbox" checked>
                              <label class="form-check-label" style="width: 100%">
                              <div class="ms-auto text-end">
                                <a class="btn btn-link text-danger text-gradient px-3 mb-0 delete" href="javascript:;"><i class="far fa-trash-alt me-2"></i>Eliminar</a>
                              </div>
                              <div class="row">
                                
                                <!-- REPRESENTANTE LEGAL -->
                                <div class="mt-4">
                                    <label for="representante_legal" class="form-label">Representante legal</label>
                                    <input type="text" name="representante_legal" placeholder="Representante legal" class="form-control" value="${rep.nombre}" required>
                                    <div class="invalid-feedback">
                                        Necesitas registrar al representante legal.
                                    </div>
                                    <div class="valid-feedback">
                                      Representante legal registrado correctamente.
                                    </div>
                                </div>  
                              </div>
    
                              <div class="row">
    
                                <!-- NRO DE DOCUMENTO DEL REPRESENTATE -->
                                <div class="mt-4 col-md-6">
                                    <label for="documento_nro_representante" class="form-label">Nº de documento</label>
                                    <input type="text" name="documento_nro" placeholder="Nº de documento" class="form-control" value="${rep.numero_de_documento}" min-length="8" max-length="8" required>
                                    <div class="invalid-feedback">
                                        Necesitas registrar el nº de documento del representante.
                                    </div>
                                    <div class="valid-feedback">
                                      Nº de documento del representante registrado correctamente.
                                    </div>
                                </div>  
    
                                
                                <!-- TIPO DE DOCUMENTO DEL REPRESENTATE -->
                                <div class="mt-4 col-md-6">
                                    <label for="documento_t_representante" class="form-label">Tipo de documento</label>
                                    <input type="text" name="documento_tipo" placeholder="Tipo de documento" class="form-control" value="${rep.tipo_de_documento}" required>
                                    <div class="invalid-feedback">
                                        Necesitas registrar el tipo de documento del representante.
                                    </div>
                                    <div class="valid-feedback">
                                      Tipo de documento del representante registrado correctamente.
                                    </div>
                                </div>
                              </div>
                              <div class="row">
    
                                <div class="mt-4 col-md-6">
    
                                    <!-- PARTIDA ELECTRÓNICA -->
                                    <label for="partida_elect" class="form-label">Partida electrónica</label>
                                    <input type="text" name="partida_elect" placeholder="Partida electrónica" class="form-control partida_elect" required>
                                    <div class="invalid-feedback">
                                        Necesitas registrar la partida electrónica.
                                    </div>
                                    <div class="valid-feedback">
                                      Partida electrónica registrada correctamente.
                                    </div>
                                </div>
                
                                <!-- CARGO -->
                                <div class="mt-4 col-md-6">
                                    <label for="cargo" class="form-label">Cargo</label>
                                    <input type="text" name="cargo" placeholder="Cargo" class="form-control" value="${rep.cargo}" required>
                                    <div class="invalid-feedback">
                                        Necesitas registrar el cargo.
                                    </div>
                                    <div class="valid-feedback">
                                      Cargo registrado correctamente.
                                    </div>
                                </div>
                              </div>
                              </label>
                          </div>
                        </div>
                      </li>
                `;
                $("#list-represents").insertAdjacentHTML("beforeend",newCard);
            }
          });

        }else{
          sAlert.sweetError("El documento ingresado no existe",`${result.data.message}`);
        }
      }

      $("#guardar-representante").disabled = false;
      $("#add").disabled = false;
      $("#queryApi").classList.toggle("d-none");
      $("#spinner").classList.toggle("d-none");

    }catch(e){
      $("#guardar-representante").disabled = false;
      $("#add").disabled = false;
      $("#queryApi").classList.toggle("d-none");
      $("#spinner").classList.toggle("d-none");

      console.error(e);
    }
  }

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
        
        $("#tipo_persona").value = dataClient.tipo_persona;

        let tPersons = $("#tipo_persona");
        await createOptions(tPersons);
        await changeVisibilityInput(tPersons.value);

        $("#documento_tipo").value = dataClient.documento_tipo;
        $("#documento_nro").value = dataClient.documento_nro;

        getUbigeo(dataClient.iddistrito);
        $("#direccion").value = dataClient.direccion;

        if(dataClient.tipo_persona == "JURÍDICA"){

          $("#razon_social").value = dataClient.razon_social;
          
          
          if(dataClient.idpersona_juridica){

            idpersonaJuridica = dataClient.idpersona_juridica
            getRepresents(idpersonaJuridica);
          }

        }else{

          $("#nacionalidad").value = dataClient.nacionalidad;
          $("#apellidos").value = dataClient.apellidos;
          $("#nombres").value = dataClient.nombres;
          $("#estado_civil").value = dataClient.estado_civil;
        }
      }
    }
    catch(e){
      console.error(e);
    }
  };

  async function getClients(){  

    try{

      let url ="../../Controllers/client.controller.php";
      let params = new FormData();
  
      params.append("action","listClienTperson");
      params.append("tipo_persona",$("#tipo_persona").value);

      results = await global.sendAction(url, params);

      if(results){

        dataClients = results;
        console.log(dataClients)
      }
    }
    catch(e){
      console.error(e);
    }
  }

  async function searchUbigeo(obj){

    try{

      let url = "../../Controllers/ubigeo/district.controller.php";

      let params = new FormData();

      params.append("action","listUbigeoFull");
      params.append("distrito",obj.distrito);
      params.append("provincia",obj.provincia);
      params.append("departamento",obj.departamento);

      let result = await global.sendAction(url, params);

      if(result){

        return result;
      }

    }
    catch(e){
      console.error(e);
    }
  }

  async function searchUbigeoRUC(obj){

    try{

      let url = "../../Controllers/ubigeo/district.controller.php";

      let params = new FormData();

      params.append("action","listUbigeoFull");
      params.append("distrito",obj.desDistrito);
      params.append("provincia",obj.desProvincia);
      params.append("departamento",obj.desDepartamento);

      let result = await global.sendAction(url, params);

      if(result){

        return result;
      }

    }
    catch(e){
      console.error(e);
    }
  }

  async function getUbigeo(iddistrito){

    try{

      let url = "../../Controllers/ubigeo/district.controller.php";
      let params = new FormData();

      params.append("action","getUbigeo");
      params.append("iddistrito", iddistrito);

      let result = await global.sendAction(url,params)

      if(result){

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
      }
    }
    catch(e){
      console.error(e);
    }
  };

  //Registra un representante legal
  async function addRepresents(represents){

    try{
      
      let url = "../../Controllers/client.controller.php";

      let params = new FormData();

      params.append("action","addRepresents");
      params.append("idpersona_juridica",represents.idpersona_juridica);
      params.append("representante_legal",represents.representante_legal);
      params.append("documento_tipo",represents.documento_tipo);
      params.append("documento_nro",represents.documento_nro);
      params.append("cargo",represents.cargo);
      params.append("partida_elect",represents.partida_elect);
      params.append("estado",represents.estado);

      let results = await global.sendAction(url, params);

      if(results){

        if(results.filasAfect > 0){

          let filasAfectAdd = results.filasAfect
          return filasAfectAdd;
        }
      }
    }
    catch(e){
      console.error(e);
    }
  };

  //Elimina a los Representantes
  async function deleteRepresents(id){
    try{
      
      let idDelete = Number.parseInt(id);

      let url = "../../Controllers/client.controller.php";

      let params = new FormData();

      params.append("action","inactiveRepresents");
      params.append("idrepresentante",idDelete);

      let results = await global.sendAction(url, params);

      if(results){

        if(results.filasAfect > 0){

          let filasAfectDelete = results.filasAfect
          return filasAfectDelete;
        }
      }
    }
    catch(e){
      console.error(e);
    }
  }

  //Actualiza un representante legal
  async function editRepresents(represents){

    try{
      
      let url = "../../Controllers/client.controller.php";

      let params = new FormData();

      params.append("action","setRepresents");
      params.append("idrepresentante",represents.idrepresentante);
      params.append("idpersona_juridica",represents.idpersona_juridica);
      params.append("representante_legal",represents.representante_legal);
      params.append("documento_tipo",represents.documento_tipo);
      params.append("documento_nro",represents.documento_nro);
      params.append("cargo",represents.cargo);
      params.append("partida_elect",represents.partida_elect);
      params.append("estado",represents.estado);

      let results = await global.sendAction(url, params);

      if(results){

        if(results.filasAfect > 0){

          filasAfectEdit = results.filasAfect;
          return filasAfectEdit;
        }
      }
    }
    catch(e){
      console.error(e);
    }
  }

  //Obtiene los datos del representante
  async function processRepresents(idpersonaJuridica){

    const representsList = $All("#list-represents li");

    let numList = representsList.length;

    let counterEdit = 0;
    let counterAdd = 0;
    let counterDelete = 0;
    let oneChecked = false;
    let textEdit = "";
    let textAdd = "";
    let textDelete = "";


    for(id of idStoDelete){
      
      let resultDelete = await deleteRepresents(id);

      if(resultDelete > 0){
        
        counterDelete += resultDelete;
      }

      textDelete = `Registros eliminados : ${counterDelete} \n`;
    };

    for(list of representsList){

      if(list.querySelector('input[name = "estado-check"]').checked){

        oneChecked = true;
        break;
      }
    }

    if(!oneChecked){
      
      sAlert.sweetError("Error", "Debes seleccionar al menos un representante");

    }else{
      for(list of representsList){

        if(list.classList.contains("edit-data")){
          
          let status = list.querySelector('input[name = "estado-check"]').checked ? "HABILITADO" : "DESHABILITADO";
          let representsEdit = {
            
            idrepresentante : Number.parseInt(list.querySelector('input[name = "estado-check"]').dataset.id),
            idpersona_juridica: idpersonaJuridica,
            representante_legal : list.querySelector('input[name = "representante_legal"]').value,
            documento_tipo: list.querySelector('input[name = "documento_tipo"]').value,
            documento_nro: list.querySelector('input[name = "documento_nro"]').value,
            cargo: list.querySelector('input[name = "cargo"]').value,
            partida_elect: list.querySelector('input[name = "partida_elect"]').value,
            estado: status
            
          };
          
          let resultEdit = await editRepresents(representsEdit);

          if(resultEdit > 0){
            
            counterEdit += resultEdit;

          }
          textEdit = `Registros actualizados : ${counterEdit} \n`;

          
        }else if(list.classList.contains("add-data")){

          let status = list.querySelector('input[name = "estado-check"]').checked ? "HABILITADO" : "DESHABILITADO";
          let representsAdd = {
              
            idpersona_juridica: idpersonaJuridica,
            representante_legal : list.querySelector('input[name = "representante_legal"]').value,
            documento_tipo: list.querySelector('input[name = "documento_tipo"]').value,
            documento_nro: list.querySelector('input[name = "documento_nro"]').value,
            cargo: list.querySelector('input[name = "cargo"]').value,
            partida_elect: list.querySelector('input[name = "partida_elect"]').value,
            estado: status
            
          };
          
          let resultAdd = await addRepresents(representsAdd);
          
          if(resultAdd > 0){

            counterAdd += resultAdd;

            if(counterAdd > 0){
      
              register = true;
              
            }
          }
          textAdd = `Registros nuevos : ${counterAdd}\n`;
          

        }

      }

      if(counterEdit > 0 || counterAdd > 0 || counterDelete > 0){
        sAlert.sweetWarningPromise("Actualizaciones realizadas", `${textEdit || ""} <br> ${textAdd || ""} <br> ${textDelete || ""}`)
        .then(()=>{

          window.location.href = "./index.php"
        });

      }else{
        sAlert.sweetWarning("No hay actualizaciones realizadas", "No has hecho nigun cambio de datos");
      }
    }
  }

  //Agrega un cliente
  async function setClient(){

    try{

      let url = "../../Controllers/client.controller.php";

      let params = new FormData();

      
      if($("#tipo_persona").value == "JURÍDICA"){
        
        params.append("action","setLegalClient");
        params.append("idcliente",idCliente);
        params.append("tipo_persona",$("#tipo_persona").value);
        params.append("idpersona_juridica",dataClient.idpersona_juridica);
        params.append("razon_social",$("#razon_social").value);
        params.append("documento_tipo",$("#documento_tipo").value);
        params.append("documento_nro",$("#documento_nro").value);
        params.append("iddistrito",$("#iddistrito").value);
        params.append("direccion",$("#direccion").value);

      }else if($("#tipo_persona").value == "NATURAL"){
        
        params.append("action","setClientNatural");
        params.append("idcliente",idCliente);
        params.append("tipo_persona",$("#tipo_persona").value);
        params.append("idpersona",dataClient.idpersona);
        params.append("nombres",$("#nombres").value);
        params.append("apellidos",$("#apellidos").value);
        params.append("documento_tipo",$("#documento_tipo").value);
        params.append("documento_nro",$("#documento_nro").value);
        params.append("estado_civil",$("#estado_civil").value);
        params.append("iddistrito",$("#iddistrito").value);
        params.append("direccion",$("#direccion").value);
        params.append("nacionalidad",$("#nacionalidad").value);
      }

      
      let result = await global.sendAction(url, params);

      if(result){
        
        if($("#tipo_persona").value == "JURÍDICA"){
          
          $("#open-modal-represents").removeAttribute("disabled");
          $("#open-modal-represents").click();
        
        }else if($("#tipo_persona").value == "NATURAL"){

          if(result.filasAfect > 0){
  
            sweetSuccess("Éxito", `Se han realizado logrado actualizar los reigistros de forma exitosa`, ()=>{
  
              window.location.href = "./index.php";
            })
  
          }else{
            sAlert.sweetError("Ocurrió un error","No se han realizado registros");
          }
        }
        
      }
    }
    catch(e){
      
      console.error(e);
    }
  }

  //Validar formulario
  function validateForm(form, callback) {
    'use strict' //=> USO ESTRICTO POR POLITICAS DE SEGURIDAD EN EL FORMULARIO

     //SELECCIONA TODOS LOS ELEMENTOS DEL FORMULARIO QUE TIENE LA CLASE "needs-validation
    const forms = document.querySelectorAll(form)

    // TOMA EL ELEMENTO "FORMS" Y LO CONVIERTE A UN ARRAY
    // SE INCLUYE EN UN FOREAH PARA ITERAR SOBRE SUS ELEMENTOS

    Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {

            //SI LA VALIDACIÓN DEL FORMULARIO ES FALSE
        if (!form.checkValidity()) {
            event.preventDefault()      //=> FRENA EL ENVÍO DEL FORMULARIO
            event.stopPropagation()     //=> FRENA LA PROPAGACIÓN DE DATOS EN EL FORMULARIO
            form.reportValidity();
        }else{
            event.preventDefault();
            
            callback();
            /* sAlert.sweetConfirm("Datos nuevos","¿Deseas actualizar el registro?",()=>{
                
            }); */
        }

        form.classList.add('was-validated') //=> AGREGA ESTA CLASE A LOS ELEMENTOS DEL FORMULARIO(MUESTRA LOS COMENTARIOS)
        }, false) //=> ESTE TERCER ARGUMENTO INDICA QUE EL EVENTO NO SE ESTA CAPTURANDO EN LA ""FASE DE CAPTURA" SINO EN "PROPAGACIÓN NORMAL"
    })  
  };

  //Compara si existe un registro con el número de documento
  async function validateDocument(array, params){

    return new Promise((resolve, reject)  => {

      const found = array.find(element => element.documento_nro == params);
  
      if(found){
  
        sAlert.sweetError("El documento ingresado ya existe","Ya existe un registro con este documento");
        
        reject();
      
      }else{
  
        validateForm("#form-data-client",setClient);
        resolve();
  
      }
    })

  }

  //Cambia la visibilidad de los inputs dependiendo del tipo de persona
  function changeVisibilityInput(tPersona){
    
    let perJInputs = $All(".pern-j");
    let perNInputs = $All(".pern-n");

    let forms = $("#form-data-client");
    forms.classList.toggle("was-validated");

    if(tPersona == "JURÍDICA"){

    
      forms.classList.toggle("was-validated");

      idpersonaJuridica = dataClient.idpersona_juridica;

      Array.from(perJInputs).forEach(input =>{

        if(input.disabled == true){

          input.removeAttribute("disabled");
          input.setAttribute("required",true);
        }
      });

      Array.from(perNInputs).forEach(input =>{

        if(input.disabled == false){

          input.removeAttribute("required");
          input.setAttribute("disabled", true);
        }
      });

    }else if(tPersona == "NATURAL"){

      idpersonaJuridica = null;
      forms.classList.toggle("was-validated");

      Array.from(perJInputs).forEach(input =>{

        if(input.disabled == false){

          input.setAttribute("disabled", true);
          input.removeAttribute("required");
        }
      });

      Array.from(perNInputs).forEach(input =>{

        if(input.disabled == true){

          input.setAttribute("required", true);
          input.removeAttribute("disabled");
        }
      });

    }

  }

  function createOptions(tPersona){

    $("#documento_tipo").innerHTML = "";

    const defaultOption = document.createElement("option");
    defaultOption.value = "";
    defaultOption.innerText = "Tipo de documento";
    $("#documento_tipo").appendChild(defaultOption);

    if(tPersona.value == "JURÍDICA"){

      const rucOption = document.createElement("option");
      rucOption.value = "RUC";
      rucOption.innerText = "RUC";

      $("#documento_tipo").appendChild(rucOption);
    
    }else{

      const ctOption = document.createElement("option");
      ctOption.value = "CARNET DE EXTRANJERÍA";
      ctOption.innerText = "CARNET DE EXTRANJERÍA";

      $("#documento_tipo").appendChild(ctOption);

      const dniOption = document.createElement("option");
      dniOption.value = "DNI";
      dniOption.innerText = "DNI";

      $("#documento_tipo").appendChild(dniOption);
    }
  }

  //Cambia la longitud de la cadena de acuerdo al tipo de documento escojido
  function lengthTDocument(tDocument){

    $("#nacionalidad").required = false;
    $("#documento_nro").minLength = 0;
    $("#documento_nro").maxLength = 0;

    if(tDocument.value == "DNI"){

      $("#documento_nro").maxLength = 8;
      $("#documento_nro").minLength = 8;
      
    }else if(tDocument.value == "CARNET DE EXTRANJERÍA"){

      $("#documento_nro").maxLength = 12;
      $("#documento_nro").minLength = 0;
      $("#nacionalidad").required = true;
      
    }else if(tDocument.value == "RUC"){

      $("#documento_nro").maxLength = 11;
      $("#documento_nro").minLength = 11;

    }
  }

  function storageIDDeleted(event){

    if(event.target.classList.contains("edit-data")){
      
      let idDeleted = event.target.dataset.id;

      idStoDelete.push(idDeleted);
      console.log(idStoDelete)
    }
  }

    $("#form-data-client").addEventListener("submit",(e)=>{

      e.preventDefault(); 
      validateDocument(dataClients, $("#documento_nro").value);
    })
    
  $("#documento_tipo").addEventListener("change",(e)=>{

    lengthTDocument($("#documento_tipo"));
  });

  $("#tipo_persona").addEventListener("change",()=>{

    getClients();
    changeVisibilityInput($("#tipo_persona").value);
    createOptions($("#tipo_persona"));

  });

  $("#form-data-represents").addEventListener("submit",(e)=>{

    e.preventDefault();
    if(idpersonaJuridica){

      validateForm("#form-data-client",processRepresents(idpersonaJuridica));
    }else{
      sAlert.sweetError("No se ha realizado el registro","Necesitas registrar la empresa");
    }
  });

  $("#add").addEventListener("click",()=>{

    let formIputs = $All('#form-data-represents li input[type = "text"]');
    let complete;

    Array.from(formIputs).forEach(input => {

      if(input.value == ""){

        complete = false;
        sAlert.sweetError("Completa el formulario", "No puedes crear otro registro, completa el formulario");
        input.classList.add('was-validated')
      }else{
        complete = true;
      }

    });

      if(complete){
        createInputs();
        numList +=1;
      }
  });

  $("#list-represents").addEventListener("click",(e)=>{
    numList = $All(".list-group-item").length;

    console.log(numList);
    if(e.target.classList.contains("delete")){
      if(numList > 1){
        numList -= 1
        
        console.log(numList);
        console.log("borrar");
  
        let li = e.target.closest(".list-group-item");
  
        li.remove();
        storageIDDeleted(e);
      }else{
        sAlert.sweetError("No se puedo eliminar", "Necesitas al menos un registro")
      }
    }
  });

  $("#queryApi").addEventListener("click",()=>{

    searchRpRUC();
  });

  createOptions($("#tipo_persona"));
  getClients();
  getClient(idCliente);

  window.addEventListener("beforeunload",function(e){
    
    e.preventDefault();
    if(!register){

      e.returnValue = "";
      return "";
    }
  });
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