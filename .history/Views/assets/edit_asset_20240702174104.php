<?php include "../sidebar/permissions.php"; ?>
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

        <?php require_once "../sidebar/sidebar_options.php" ?>

        <!-- CERRAR SESIÓN -->
        <li class="nav-item">
          <a class="nav-link  " href="../../Controllers/user.controller.php?action=destroy">
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
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Editar lote</li>
          </ol>
          <h6 class="font-weight-bolder mb-0" id="cabezera">EDITAR LOTE - </h6>
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
                    <form class="row needs-validation" id="form-assset-set" novalidate>
                      <div class="tab">
                        <div class="row">
                          <div class="col-md-6">

                            <!-- DATOS GENERALES -->

                            <!-- UBIGEO -->
                            <div>
                              <label for="ubigeo" class="form-label">Ubigeo</label>
                              <input type="text" class="form-control" id="ubigeo" readonly>

                            </div>

                            <!-- ESTADO -->
                            <div class="mt-4">
                              <label for="estado" class="form-label">Estado</label>
                              <input type="text" class="form-control" id="estado" value="SIN VENDER" readonly>

                            </div>

                            <!-- TIPO ACTIVO -->
                            <div class="mt-4">
                              <label for="tipo_activo" class="form-label">Tipo de propiedad</label>
                              <select name="tipo_activo" class="form-select" id="tipo_activo" required>
                                <option value="" default>Tipo de propiedad</option>
                                <option value="LOTE">Lote</option>
                                <option value="CASA">Casa</option>
                              </select>
                              <div class="invalid-feedback">
                                Necesitas ingresar el tipo (casa/lote).
                              </div>
                              <div class="valid-feedback">
                                Casa/lote registrado correctamente.
                              </div>
                            </div>

                            <!-- PROPIETARIO LOTE -->
                            <div class="mt-4">
                              <label for="propietario_lote" class="form-label">Propietarios</label>
                              <select name="propietario_lote" class="form-select" id="propietario_lote">
                                <option value="A.I.F">A.I.F</option>
                                <option value="TERCEROS">Terceros</option>
                              </select>
                              <div class="invalid-feedback">
                                Necesitas ingresar el propietario.
                              </div>
                              <div class="valid-feedback">
                                Propietario registrado correctamente.
                              </div>
                            </div>

                            <!-- SUBLOTE -->
                            <div class="mt-4">
                              <label for="sublote" class="form-label">Sublote</label>
                              <input type="text" class="form-control" id="sublote" placeholder="Sublote" required>
                              <div class="invalid-feedback">
                                Necesitas ingresar el sublote.
                              </div>
                              <div class="valid-feedback">
                                Sublote registrado correctamente.
                              </div>
                            </div>

                            <!-- DIRECCIÓN -->
                            <div class="mt-4">
                              <label for="direccion" class="form-label">Dirección</label>
                              <input type="text" class="form-control" id="direccion" placeholder="Dirección" required>
                              <div class="invalid-feedback">
                                Necesitas ingresar una dirección.
                              </div>
                              <div class="valid-feedback">
                                Dirección ingresada correctamente.
                              </div>
                            </div>

                          </div>
                          <div class="col-md-6">

                            <div class="col-lg-12 ms-auto text-center mt-5 mt-lg-0">
                              <!-- IMAGEN -->
                              <div class="form-group" style="margin-top: 70px;">
                                <label for="in-image" class="label-img">
                                  <i class="material-icons"></i>
                                  <span class="title" style="display: flex; justify-content: center;">Agregar imagen</span>
                                  <input type="file" accept=".jpg" id="in-image">
                                  <div class="invalid-feedback">
                                    Selcciona una imagen
                                  </div>
                                  <div class="valid-feedback">
                                    Imagen seleccionada correctamente
                                  </div>

                                  <!-- CONTENEDOR DE LA IMAGEN -->
                                  <div class="img-content">

                                    <img class="w-100 position-relative z-index-2 pt-4" id="file-view" src="../../media/logos/NoImage.jpg" alt="">
                                  </div>
                                </label>
                              </div>
                            </div>
                          </div>
                        </div>
                        <div class="d-flex justify-content-center mt-4">
                          <div class="btn-group">
                            <button type="button" class="btn btn-secondary prevBtn" disabled>Anterior</button>
                            <button type="button" class="btn btn-success nextBtn">Siguiente</button>
                          </div>
                        </div>
                      </div>

                      <div class="tab">
                        <div class="row">
                          <div class="col-md-6">

                            <!-- DESCRPCIÓN -->

                            <!-- ÁREA -->
                            <div>
                              <label for="area" class="form-label">Área terreno (m2)</label>
                              <input type="number" class="form-control" id="area" min="1.0" step="0.01" placeholder="Área (m2)" required title="Porcentaje del área común (%)">
                              <div class="invalid-feedback">
                                Necesitas ingresar el área del lote.
                              </div>
                              <div class="valid-feedback">
                                Área del lote registrado correctamente.
                              </div>
                            </div>

                            <!-- ZONAS COMUNES -->
                            <div class="mt-4">
                              <label for="z-comunes" class="form-label">Zonas comunes</label>
                              <input type="number" class="form-control" id="z-comunes" min="1.0" step="0.1" placeholder="Zonas comúnes (%)" required>

                            </div>


                            <!-- MONEDA VENTA -->
                            <div class="mt-4">
                              <label for="moneda-venta" class="form-label">Moneda de venta</label>
                              <select class="form-select custom-select-scroll" id="moneda-venta" required>
                                <option value="">Tipo moneda</option>
                                <option value="USD">Dólares</option>
                                <option value="SOL">Soles</option>
                              </select>
                              <div class="invalid-feedback">
                                Necesitas ingresar la moneda de venta.
                              </div>
                              <div class="valid-feedback">
                                Moneda de venta registrada correctamente.
                              </div>
                            </div>

                            <!-- PRECIO LOTE -->
                            <div class="mt-4">
                              <label for="precio_lote" class="form-label">Precio del lote</label>
                              <input type="number" class="form-control" id="precio_lote" placeholder="Precio de venta" maxlength="7" minlength="7" min="1.00" step="0.01" required autofocus>
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
                              <select class="form-select custom-select-scroll" id="idpresupuesto">
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
                              <input type="number" class="form-control" id="precio_construccion" placeholder="Precio de construcción" maxlength="7" minlength="7" min="1.00" step="0.01" readonly>
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
                              <input type="number" class="form-control" id="precio_venta" placeholder="Precio de venta" maxlength="8" minlength="8" min="1.00" step="0.01">
                              <div class="invalid-feedback">
                                Necesitas ingresar el precio de venta.
                              </div>
                              <div class="valid-feedback">
                                Precio de venta registrado correctamente.
                              </div>
                            </div>

                            <!-- PRTIDA ELECTRÓNICA -->
                            <div class="mt-4">
                              <label for="partida-elect" class="form-label">Partida electrónica</label>

                              <textarea name="partida-elect" class="form-control" id="partida-elect" cols="38" rows="3" required></textarea>
                              <div class="invalid-feedback">
                                Necesitas ingresar la partida electrónica.
                              </div>
                              <div class="valid-feedback">
                                Partida electrónica registrada correctamente.
                              </div>
                            </div>
                          </div>

                          <div class="col-md-6">

                            <!-- ÁREA COSNTRUCCIÓN -->
                            <div class="mt-2">
                              <label for="area_construccion">Área de construcción (m2)</label>
                              <input type="number" id="area_construccion" class="form-control form-area" min="1" step="0.01" required>
                              <div class="invalid-feedback">
                                Registra el área de construcción
                              </div>
                              <div class="valid-feedback">
                                Área de construcción registrada correctamente.
                              </div>
                            </div>

                            <!-- ÁREA TECHADA -->
                            <div class="mt-4">
                              <label for="area_techada">Àrea techada (m2)</label>
                              <input type="number" name="area_techada" id="area_techada" class="form-control" min="1" step="0.01" required>
                              <div class="invalid-feedback">
                                Registra el área techada
                              </div>
                              <div class="valid-feedback">
                                Área techada registrada correctamente.
                              </div>
                            </div>

                            <!-- LATITUD -->
                            <div>
                              <label for="latitud" class="form-label">Latitud</label>

                              <input type="text" name="partida-elect" class="form-control" id="latitud" placeholder="Latitud">
                              <div class="invalid-feedback">
                                Necesitas ingresar la latitud.
                              </div>
                              <div class="valid-feedback">
                                Latitud registrada correctamente.
                              </div>
                            </div>

                            <!-- LONGITUD -->
                            <div class="mt-4">
                              <label for="longitud" class="form-label">Longitud</label>

                              <input type="text" name="longitud" class="form-control" id="longitud" placeholder="Longitud">
                              <div class="invalid-feedback">
                                Necesitas ingresar la longitud.
                              </div>
                              <div class="valid-feedback">
                                Longitud registrada correctamente.
                              </div>
                            </div>
                            <!-- PERIMTETRO -->
                            <label for="longitud" class="form-label">Perímetro</label>
                            <div id="perim">
                              <div id="patern">

                                <div class="row">
                                  <div class="col-md-11">

                                    <div class="row">
                                      <div class="col-md-6 mb-2">
                                        <input type="text" class="form-control perim-key" name="clave" id="clave">
                                      </div>
                                      <div class="col-md-6">
                                        <input type="text" class="form-control perim-value" name="valor" id="valor">
                                      </div>
                                    </div>
                                  </div>
                                  <div class="col-md-1">
                                    <button type="button" class="btn btn-success pluss" id="add-textBox">+</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </div>
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
  <script src="../../assets/js/projects/interactionForms.js"></script>
  <script src="../../assets/js/renderInputs.js"></script>

  <!-- <script src="../../assets/js/renderUbigeo.js"></script>  -->

  <!-- SELECT2 - JQUERY -->
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
  <script>
    /* $('#propetario_lote').select2();  */
  </script>
  <script>
    const global = new FunGlobal();
    const sAlert = new Alert();

    //formulario
    const idform = "#form-assset-set"
    const formMS = new multiStepsForm(idform);

    const $ = id => global.$(id);
    const $All = id => global.$All(id);

    //OBTIENE EL ID DEL URL
    const stringQuery = window.location.search;

    const url = new URLSearchParams(stringQuery);

    const code = url.get("id");

    const codePr = url.get("idproy");
    const nameProy = url.get("name");

    const idActivo = atob(code);

    let dataAsset;

    let oldImage;
    let AllDataAssets;
    let idProyecto;

    //Obtiene los presupuestos
    async function getBudgets(area_construida) {

      try {
        let url = "../../Controllers/budget.controller.php";

        let params = new FormData();
        params.append("action", "listBudgetsAsset");
        params.append("area_construida", area_construida);

        let results = await global.sendAction(url, params);

        if (results) {

          results.forEach(option => {

            let newTag = document.createElement("option");
            newTag.value = option.idpresupuesto;
            newTag.innerText = option.codigo;
            newTag.dataset.monto = option.total;

            $("#idpresupuesto").appendChild(newTag);
          })
        }
      } catch (e) {
        console.error(e)
      }
    }

    async function bucleOptions(select, param) {

      for (i = 0; i < select.options.length; i++) {

        if (select.options[i].value == param) {

          select.options[i].selected = true;

          break;

        }
      }
    }

    function renderInputs(key, value) {

      /*INPUT KEY */
      let inputKey = document.createElement("input");
      inputKey.classList.add("form-control", "perim-key")
      inputKey.value = key;

      /* INPUT VALUE */
      let inputValue = document.createElement("input");
      inputValue.classList.add("form-control", "perim-value");
      inputValue.value = value;

      /* DIV KEY */
      let divKey = document.createElement("div");
      divKey.classList.add("col-md-6");

      /* DIV VALUE */
      let divValue = document.createElement("div");
      divValue.classList.add("col-md-6");

      divKey.appendChild(inputKey);
      divValue.appendChild(inputValue);


      let rowInputs = document.createElement("div");
      rowInputs.classList.add("row", "mt.2");

      rowInputs.appendChild(divKey);
      rowInputs.appendChild(divValue);

      let divInputs = document.createElement("div");
      divInputs.classList.add("col-md-11");

      divInputs.appendChild(rowInputs);

      /* -------------------------------------------------- */

      /* BOTÓN "-" */
      let buttonLess = document.createElement("button");
      buttonLess.classList.add("btn", "btn-danger", "less", "mt-2", "active");
      buttonLess.setAttribute("id", "add-textBox");
      buttonLess.setAttribute("type", "button");
      buttonLess.innerText = "-";

      let divButton = document.createElement("div");
      divButton.classList.add("col-md-1");

      divButton.appendChild(buttonLess);

      /* -------------------------------------------------- */

      let rowMaster = document.createElement("div");
      rowMaster.classList.add("row");

      rowMaster.appendChild(divInputs);
      rowMaster.appendChild(divButton);

      let firstRow = $("#perim").firstChild;
      $("#perim").insertBefore(rowMaster, firstRow);
    }

    /**
     * Funcion para obtener los lotes asociados a un idproyecto
     */
    async function getAssetsAll(id) {

      try {

        let url = "../../Controllers/asset.controller.php";
        let params = new FormData();

        params.append("action", "listAssetByIProyect");
        params.append("idproyecto", id);

        let results = await global.sendAction(url, params);

        if (results) {

          AllDataAssets = results;
        }
      } catch (e) {
        console.error(e);
      }
    };

    /**
     * Función para renderizar los datos obtenidos
     * */
    async function renderData(asset) {

      try {
        console.log(asset);

        oldImage = asset.imagen;
        let img = asset.imagen != null ? asset.imagen : "NoImage.jpg";

        $("#cabezera").innerText += ` ${asset.sublote} - ${asset.denominacion}`;

        /* FORMULARIO DATOS GENERALES  */
        $("#ubigeo").value = `${asset.distrito} - ${asset.provincia} - ${asset.departamento}`;
        $("#estado").value = asset.estado;

        bucleOptions($("#tipo_activo"), asset.tipo_activo)

        bucleOptions($("#propietario_lote"), asset.propietario_lote);

        $("#sublote").value = asset.sublote;
        $("#direccion").value = asset.direccion;
        $("#file-view").setAttribute("src", `../../media/lotes/${img}`);

        /* FORMULARIO DESCRIPCIÓN  */
        $("#area").value = asset.area_terreno;
        $("#z-comunes").value = asset.zcomunes_porcent;
        //$("#moneda-venta").value = asset.moneda_venta;
        $("#precio_lote").value = asset.precio_lote;

        setTimeout(() => {

          Array.from($("#idpresupuesto").options).forEach(option => {
            if (option.value == asset.idpresupuesto) {
              option.selected = true;
            }
          });
        }, 1000);
        $("#precio_construccion").value = asset.precio_construccion;
        $("#precio_venta").value = asset.precio_venta;
        $("#partida-elect").value = asset.partida_elect;
        $("#latitud").value = asset.latitud;
        $("#longitud").value = asset.longitud;

        const perimetro = await global.JSONtoObject(asset.perimetro);

        console.log(perimetro);
      } catch (e) {
        console.error(e);
      }
    }

    /**
     * Funciòn para obtener la data de un lote por su ID
     */
    async function getAsset(id) {

      try {


        let url = "../../Controllers/asset.controller.php";
        let params = new FormData();

        params.append("action", "listAssetId");
        params.append("idactivo", id);

        let result = await global.sendAction(url, params);

        if (result) {
          console.log(result);

          dataAsset = result;
          idProyecto = dataAsset.idproyecto;
          console.log(dataAsset);

          let optionsTypesLots = Array.from($("#tipo_activo").options);
          let optionsMoney = Array.from($("#moneda-venta").options)                   
          
          getAssetsAll(idProyecto);
          renderData(dataAsset);

          return new Promise((resolve, reject)=>{
            
            optionsMoney.forEach(option =>{

              console.log(option)
              if(option.value == dataAsset.moneda_venta){
                option.selected = true;
              }
            });
            

            optionsTypesLots.forEach(option =>{
              
              if(option.value == dataAsset.tipo_activo){
                option.selected = true;
                resolve()
              }
            });

          })
          .then(()=>{
            return new Promise((resolve, reject)=>{
              $("#tipo_activo").dispatchEvent(new Event("change"));
              resolve()
            })
          })
          .then(()=>{
            return new Promise((resolve, reject)=>{
            
              optionsMoney.forEach(option =>{

                console.log(option)
                if(option.value == dataAsset.moneda_venta){
                  option.selected = true;
                  resolve()
                }
              });
            });
          })
          .then(()=>{
            
            if(dataAsset.idpresupuesto){

              return new Promise((resolve, reject)=>{

                let budgetsOptions = Array.from($("#idpresupuesto").options)

                if(budgetsOptions.length > 1){
                  resolve()
                }else{

                  const interval = setInterval(() => {
                    
                    if(dataAsset.length > 1){
                      clearInterval(interval);
                      resolve();
                    }
                  }, 100);
                }
              });
            }
              
          })
          .then(()=>{
            
            if(dataAsset.idpresupuesto){

              return new Promise((resolve, reject)=>{

                let budgetsOptions = Array.from($("#idpresupuesto").options)

                budgetsOptions.forEach(option =>{
                  if(option.value == dataAsset.idpresupuesto){
                    option.selected = true;
                  }
                })

                $("#idpresupuesto").dispatchEvent(new Event("change"));
              });
            }
              
          });

          
          

        }
      } catch (e) {
        console.error(e);
      }
    };

    /**
     * FUNCIÓN PARA COMPARA INFORMACIÓN
     */
    async function searchInfo(array, column, param) {

      if (column == "sublote") {

        return new Promise((resolve, reject) => {

          for (let element of array) {

            const found = array.find(element => element[column] == param);

            if (found) {

              sAlert.sweetWarning("Se ha encontrado coincidencias", `"${param}" ya existe, ingresa otro`);

              reject();
            } else {

              $("#sublote").removeAttribute("autofocus");
              $("#direccion").removeAttribute("readonly");
              $("#direccion").focus();

              resolve();
            }
          }
        });
      }
    };

    async function setAsset(id) {

      try {

        const keyClass = ".form-control.perim-key";
        const keyValue = ".form-control.perim-value";

        const json = await global.getJson(keyClass, keyValue)

        let url = "../../Controllers/asset.controller.php";

        let params = new FormData();

        let img = $("#in-image").files[0] != null ? $("#in-image").files[0] : oldImage;

        params.append("action", "setAsset");
        params.append("idactivo", id);
        params.append("idproyecto", idProyecto);
        params.append("tipo_activo", $("#tipo_activo").value);
        params.append("imagen", img);
        params.append("estado", dataAsset.estado);
        params.append("sublote", $("#sublote").value);
        params.append("direccion", $("#direccion").value);
        params.append("moneda_venta", $("#moneda-venta").value);
        params.append("area_terreno", $("#area").value);
        params.append("area_construccion", $("#area_construccion").value);
        params.append("area_techada", $("#area_techada").value);
        params.append("zcomunes_porcent", $("#z-comunes").value);
        params.append("partida_elect", $("#partida-elect").value);
        params.append("latitud", $("#latitud").value);
        params.append("longitud", $("#longitud").value);
        params.append("perimetro", json);
        params.append("idpresupuesto", $("#idpresupuesto").value);
        params.append("propietario_lote", $("#propietario_lote").value);
        params.append("precio_lote", $("#precio_lote").value);
        params.append("precio_construccion", $("#precio_construccion").value);
        params.append("precio_venta", $("#precio_venta").value);

        let results = await global.sendAction(url, params);

        if (results) {

          console.log(results);

          if (results.filasAfect > 0) {

            let codeName = btoa(dataAsset.denominacion)
            let codeid = btoa(idProyecto);
            sAlert.sweetSuccess("Registro actualizado", "El registro se ha actualizado correctamente", () => {

              window.location.href = `./index.php?id=${codeid}&name=${codeName}`;
            });
          } else {
            sAlert.sweetError("No se actualizó el registro", "Vuelve a intentarlo");
          }
        }

      } catch (e) {
        console.error(e);
      }
    }

    $("#area_construccion").addEventListener("input", (e) => {

      let inputValue = e.target.value;

      if (inputValue) {

        clearTimeout(timer);

        timer = setTimeout(() => {

          getBudgets(inputValue)
          console.log(inputValue)
        }, 1500);
      }
    })

    $("#sublote").addEventListener("blur", (e) => {

      let sublote = $("#sublote").value;

      if (sublote != "" && sublote !== dataAsset.sublote) {

        searchInfo(AllDataAssets, "sublote", sublote)
          .then(() => {})
          .catch(() => {
            $("#sublote").focus();
          });

      } else {

        $("#direccion").removeAttribute("readonly");
        $("#direccion").focus();
      }
    });

    $("#tipo_activo").addEventListener("change", (e) => {
      let tipoActivo = $("#tipo_activo").value;

      if (tipoActivo == "CASA") {
        $("#idpresupuesto").required = true;
        $("#moneda-venta").value = "SOL";
        $("#area_construccion").disabled = false;
        $("#area_techada").disabled = false;
        $("#idpresupuesto").disabled = false;
      } else {
        $("#idpresupuesto").required = false;
        $("#moneda-venta").value = "";
        $("#area_construccion").disabled = true;
        $("#area_techada").disabled = true;
        $("#idpresupuesto").disabled = true;
      }
    });


    $("#precio_lote").addEventListener("input", (e) => {
      let precioLote = Number.parseFloat(e.target.value || 0);

      let precioConstruccion = Number.parseFloat($("#precio_construccion").value == false ? 0 : $("#precio_construccion").value);

      $("#precio_venta").value = precioLote + precioConstruccion;

    })

    $("#idpresupuesto").addEventListener("change", () => {

      let presupuesto = $("#idpresupuesto").options[$("#idpresupuesto").selectedIndex].dataset.monto;
      let monto = Number.parseFloat(presupuesto);
      let precioLote = Number.parseFloat($("#precio_lote").value || 0);

      $("#precio_construccion").value = monto;
      $("#precio_venta").value = monto + precioLote;
    });

    getAsset(idActivo);

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
          } else {
            event.preventDefault();
            sAlert.sweetConfirm("Datos nuevos", "¿Deseas actualizar el registro?", () => {

              setAsset(idActivo); //Ejecuta la función
            });
          }

          form.classList.add('was-validated') //=> AGREGA ESTA CLASE A LOS ELEMENTOS DEL FORMULARIO(MUESTRA LOS COMENTARIOS)
        }, false) //=> ESTE TERCER ARGUMENTO INDICA QUE EL EVENTO NO SE ESTA CAPTURANDO EN LA ""FASE DE CAPTURA" SINO EN "PROPAGACIÓN NORMAL"
      })
    })();
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