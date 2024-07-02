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

        <?php require_once "../sidebar/s";?>

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
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="#">Presupuestos</a></li>
          </ol>
          <h6 class="font-weight-bolder mb-0" id="cabezera">Presupuesto - </h6>
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
        <div class="col-lg-9">

          <!-- FORMULARIO DEL PRESUPUESTO -->
          <div class="row">
            <div class="col-md-12 mb-lg-0 mb-4">
              <div class="card">
                <div class="card-header pb-0 p-3">
                  <div class="row">
                    <div class="col-6 d-flex align-items-center">
                      <h6 class="mb-0"><strong>Información del presupuesto</strong></h6>
                    </div>
                  </div>
                </div>
                <div class="card-body p-3">

                  <!-- FORMULARIO PARA EL PRESUPUESTO -->
                  <form action="" class="row needs-validation" id="form-budget" novalidate>
                    <div class="row d-flex align-items-center">

                      <!-- NÚMERO DE SERIE (CÓDIGO)-->
                      <div class="col-md-3">
                        <div class="m-2">
                          <label for="codigo" class="form-label">Código</label>
                          <input class="form-control" type="text" name="codigo" id="codigo" readonly>

                          <div class="invalid-feedback">
                            Necesitas ingresar el código del presupuesto.
                          </div>
                          <div class="valid-feedback">
                            Código de presupuesto registrado correctamente.
                          </div>
                        </div>
                      </div>

                      <!-- MODELO  -->
                      <div class="col-md-3">
                        <div class="m-2">
                          <label for="modelo" class="form-label">Modelo</label>
                          <input class="form-control" type="text" name="modelo" id="modelo" placeholder="Modelo" required autofocus>
                          <div class="invalid-feedback">
                            Necesitas ingresar el modelo del presupuesto.
                          </div>
                          <div class="valid-feedback">
                            Modelo de presupuesto registrado correctamente.
                          </div>
                        </div>
                      </div>


                      <!-- ÁRE DE CONSTRUCCIÓN -->
                      <div class="col-md-3">
                        <div class="m-2">
                          <label for="area_construccion" class="form-label">Área de construcción (m2)</label>
                          <input class="form-control" type="number" name="area_construccion" id="area_construccion" min="1" step="0.01" placeholder="Área de construcción(m2)" required>
                          <div class="invalid-feedback">
                            Necesitas ingresar el modelo del presupuesto.
                          </div>
                          <div class="valid-feedback">
                            Modelo de presupuesto registrado correctamente.
                          </div>
                        </div>
                      </div>
                      <div class="col-md-2 mt-4 text-button align-bottom">
                        <button type="submit" class="btn btn-sm bg-gradient-info mb-0" id="save_budget" disabled><i class="fa-solid fa-floppy-disk"></i> Guardar</button>
                      </div>
                    </div>
                  </form>

                  <hr>
                  <h6 class="mb-0 mt-4 mb-4"><strong>Detalles del presupuesto</strong></h6>
                  <form action="" class="row needs-validation" id="form_det_budget" novalidate>
                    <div class="row d-flex align-items-center">

                      <div class="col-md-3">
                        <label for="categoria_costo" class="form-label">Categoría</label>
                        <select name="categoria_costo" id="categoria_costo" class="form-select" required>
                          <option value="" default>Categoría</option>
                        </select>
                        <div class="invalid-feedback">
                          Necesitas ingresar la categoría del costo.
                        </div>
                        <div class="valid-feedback">
                          Categoría de costo registrado correctamente.
                        </div>
                      </div>

                      <div class="col-md-4">
                        <label for="subcategoria_costo" class="form-label">Subcategoría</label>
                        <select name="subcategoria_costo" id="subcategoria_costo" class="form-select" required>
                          <option value="" default>Subcategoría</option>
                        </select>
                        <div class="invalid-feedback">
                          Necesitas ingresar la subcategoría del costo.
                        </div>
                        <div class="valid-feedback">
                          Subcategoría de costo registrado correctamente.
                        </div>
                      </div>

                      <div class="col-md-5 mb-2">
                        <label for="detalle" class="form-label">Detalle</label>
                        <input type="text" name="detalle" id="detalle" class="form-control" placeholder="Detalle" required>
                        <div class="invalid-feedback">
                          Necesitas ingresar la un detalle.
                        </div>
                        <div class="valid-feedback">
                          Detalle registrado correctamente.
                        </div>
                      </div>
                    </div>
                    <div class="row d-flex align-items-center mb-4 d-none" id="inputs_materials">

                      <!-- MATERIALES -->
                      <div class="col-md-6">
                        <label for="marca" class="form-label">Marca</label>
                        <select name="marca" id="marca" class="form-select" required>
                          <option value="" default>Marca</option>
                        </select>
                        <div class="invalid-feedback">
                          Necesitas ingresar una marca.
                        </div>
                        <div class="valid-feedback">
                          Marca registrado correctamente.
                        </div>
                      </div>

                      <div class="col-md-6">
                        <label for="material" class="form-label">Material</label>
                        <select name="material" id="material" class="form-select" required>
                          <option value="" default>Material</option>
                        </select>
                        <div class="invalid-feedback">
                          Necesitas ingresar un material.
                        </div>
                        <div class="valid-feedback">
                          Material registrado correctamente.
                        </div>
                      </div>
                    </div>
                    <hr>

                    <!-- CANTIDAD -->
                    <div class="row d-flex align-items-center">

                      <div class="col-md-3">
                        <label for="cantidad" class="form-label">Cantidad</label>
                        <input type="number" name="cantidad" id="cantidad" min="1.0" class="form-control" required>
                        <div class="invalid-feedback">
                          Necesitas ingresar la cantidad.
                        </div>
                        <div class="valid-feedback">
                          Cantidad registrada correctamente.
                        </div>
                      </div>

                      <div class="col-md-3">
                        <label for="precio_unitario" class="form-label">Precio Unitario</label>
                        <input type="number" name="precio_unitario" id="precio_unitario" class="form-control" value="0.00" min="1.0" step="0.01" required>
                        <div class="invalid-feedback">
                          Necesitas ingresar el precio unitario.
                        </div>
                        <div class="valid-feedback">
                          Precio unitario registrado correctamente.
                        </div>
                      </div>

                      <div class="col-md-6 text-end">
                        <button class="btn bg-gradient-dark mb-0 mt-3" id="add"><i class="fas fa-plus"></i>&nbsp;&nbsp;Agregar</button>
                      </div>
                    </div>

                  </form>
                </div>
              </div>
            </div>

            <!-- TABLA DE DETALLES -->

            <div class="col-md-12 mb-lg-0 mb-4">
              <div class="card mt-4" style="max-height: 50rem ; overflow-y: auto;">
                <div class="card-header pb-0 p-3">
                  <div class="row">
                    <div class="col-6 d-flex align-items-center">
                      <h6 class="mb-0"></h6>
                    </div>
                  </div>
                </div>
                <div class="card-body p-3">
                  <div class="row">
                    <div class="table-responsive table-responsive-lg">
                      <table class="table align-items-center mb-0 table-hover" id="table-det-budgets" style="table-layout: fixed;">
                        <colgroup>
                          <col width="5%">
                          <col width="25%">
                          <col width="25%">
                          <col width="10%">
                          <col width="10%">
                          <col width="10%">
                          <col width="10%">
                        </colgroup>
                        <thead>
                          <tr>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7">#</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Subcat. Costo</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Detalle</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Cantidad</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Precio unitario</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Total</th>
                            <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-7 ps-2">Operaciones</th>
                          </tr>
                        </thead>
                        <tbody style="font-size: 12px;">

                          <!-- RENDER DETALLES  -->

                        </tbody>
                      </table>
                      <div class="row mt-2 p-4" id="message-info">

                        <!-- MENSAJE DE INFORMACIÓN -->
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          <!-- ---------- -->
        </div>
        <div class="col-lg-3">
          <div class="card h-100">
            <div class="card-header pb-0 p-3">
              <div class="row">
                <div class="col-6 d-flex align-items-center">
                  <h6 class="mb-0">Proyectos</h6>
                </div>
                <div class="col-6 text-end">
                  <button type="button" class="btn btn-sm bg-gradient-info mb-0" id="save_lots"><i class="fa-solid fa-floppy-disk"></i> Guardar</button>
                </div>
              </div>
            </div>
            <div class="card-body p-3 pb-0">
              <ul class="list-group" id="list-proyectos">
                <div class="accordion accordion-flush" id="accordion-proyectos">

                  <!-- RENDER ACOORDION -->
                </div>
              </ul>
            </div>
          </div>
        </div>
      </div>
      <div class="row">

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
  <script>
    const global = new FunGlobal();
    const sAlert = new Alert();

    const $ = id => global.$(id);
    const $All = id => global.$All(id);

    const queryString = window.location.search;
    const url = new URLSearchParams(queryString);

    const code = url.get("id");

    const idpresupuestoOBT = atob(code);

    let det_casaJSON;
    let idPresupuesto;

    //recuperando datos del sessionStorage
    // sessionStorage.removeItem("dataStoraged");
    let dataStorage;
    let nombresUnicos = [];
    let idpresupuesto;
    let rowDelete = [];
    let rowEdit = [];
    let lastCode = true;
    let finalCode;
    let lastModel = true;
    let allDataBudget;
    let dataGetBudget;
    let index = 0;
    let isAddForm = true;
    let iddetalleCosto;
    let indexDelete = []
    let codeVelue;
    let area_construccion;

    // Elimina un detalle del presupuesto
    async function deleteDetBudget(iddet) {

      try {

        let url = "../../Controllers/cost.controller.php";

        let params = new FormData();

        params.append("action", "inactiveDetailCost");
        params.append("iddetalle_costo", iddet);

        let result = await global.sendAction(url, params);

        if (result) {

          if (result.filasAfect > 0) {

            sAlert.sweetSuccess("Éxito", "Detalle eliminado correctamente", () => {
              getDetCostByIdBudget(idpresupuestoOBT)
            });
          } else {
            sAlert.sweetError("Ocurrió un error", "No se ha podido eliminar el detalle");
          }
        }
      } catch (e) {
        console.error(e);
      }
    }

    // Valida los datos de la cabezera del presupuesto
    function validateData(value, column, array) {

      return new Promise((resolve, reject) => {

        for (element of array) {

          let exist = array.find(element => element[column] == value);

          if (exist) {

            sAlert.sweetWarning("Se ha encontrado coincidencias", `"${value}" ya existe, ingresa otro`);
            reject();
          } else {

            resolve();
          }
        }
      })
    }

    //Obtiene los datos de los presupuestos
    async function getBudgetsData() {

      try {

        let url = "../../Controllers/budget.controller.php";

        let params = new FormData()

        params.append("action", "listBudgets");

        let results = await global.sendAction(url, params);

        if (results) {

          allDataBudget = results;

        }
      } catch (e) {
        console.error(e);
      }
    }

    //Cambia el idpresupuesto de un lote
    async function setIdBudget(idactivo, idpres) {

      try {

        let url = "../../Controllers/asset.controller.php"

        let params = new FormData();

        params.append("action", "setIdBudget");
        params.append("idactivo", idactivo);
        params.append("idpresupuesto", idpres);

        let result = await global.sendAction(url, params);

        if (result) {

          return result.filasAfect;
        }

      } catch (e) {
        console.error(e);
      }
    }

    //Agrega detalle de presupuesto
    async function upSetDetCost(obj, isAdd) {
      try {

        let url = "../../Controllers/cost.controller.php";

        let params = new FormData();

        if (!isAdd) {
          params.append("action", "setDetailCost");
          params.append("iddetalle_costo", obj.iddetalle_costo);
        } else {

          params.append("action", "addDetailCost");
        }
        params.append("idpresupuesto", idpresupuestoOBT);
        params.append("idsubcategoria_costo", obj.idsubcategoria_costo);
        params.append("idmaterial", obj.idmaterial)
        params.append("detalle", obj.detalle)
        params.append("cantidad", obj.cantidad)
        params.append("precio_unitario", obj.precio_unitario);


        let results = await global.sendAction(url, params);

        if (results) {

          if (results.filasAfect > 0) {

            sAlert.sweetSuccess("Éxito", "Detalle actualizado correctamente", () => {
              getDetCostByIdBudget(idpresupuestoOBT)
              $("#add").innerHTML = `<i class="fa fa-plus"></i>&nbsp;&nbsp;Agregar`;
              isAddForm = true;
            });
          }
        }
      } catch (e) {
        console.error(e);
      }
    }

    //Actualiza el presupuesto
    async function setBudget() {

      try {

        let url = "../../Controllers/budget.controller.php"

        let params = new FormData();
        params.append("action", "setBudget");
        params.append("idpresupuesto", idpresupuestoOBT);
        params.append("codigo", $("#codigo").value);
        params.append("modelo", $("#modelo").value);
        params.append("area_construccion", area_construccion);

        let result = await global.sendAction(url, params);

        if (result) {

          console.log(result)
          if (result.filasAfect > 0) {

            let data = {
              idpresupuesto: result.idpresupuesto,
              codigo: result.codigp,
              modelo: result.modelo,
              area_construccion: result.area_construccion
            };

            $("#codigo").value = result.codigo;
            $("#modelo").value = result.modelo;
            $("#area_construccion").value = result.area_construccion;

            sAlert.sweetSuccess("Éxito", "Presupuesto actualizado correctamente", () => {
              $("#save_budget").disabled = true;
            });
          }

        } else {
          sAlert.sweetError("Ocurrió un error", "No se ha podido actualizar el presupuesto");
        }
      } catch (e) {
        console.error(e);
      }
    };

    //Renderiza dataStorage en la tabla
    function renderDetbudgets(array) {


      $("#table-det-budgets tbody").innerHTML = "";
      $("#message-info").innerHTML = "";

      let numRow = 1;

      if (array.length > 0) {

        array.forEach(element => {

          let precioUnitario = +element.precio_unitario;
          let precioUnitarioFormat = precioUnitario.toPrecision(8);
          let total = element.precio_unitario * element.cantidad;
          let numberFormat = total.toPrecision(8);
          let newRow = `
          <tr class="${element.action}">
            <td>${numRow}</td>
            <td class="edit-row select text-truncate" data-subcategoria="subcategoria"data-idcategoria_costo="${element.idcategoria_costo}">${element.subcategoria_costo}</td>
            <td class="edit-row text text-truncate" data-detalle="detalle">${element.detalle}</td>
            <td class="edit-row number" data-cantidad="cantidad">${element.cantidad}</td>
            <td class="edit-row number" data-precio="precio_unitario">${precioUnitarioFormat}</td>
            <td>${numberFormat}</td>
            <td>
              <button type="button" data-index="${element.iddetalle_costo}" class="btn btn-link text-dark px-3 mb-0 edit"><i class="bi bi-pencil-fill edit" data-index="${element.iddetalle_costo}"></i></button>
              <button type="button" data-index="${element.iddetalle_costo}" class="btn btn-link text-danger text-gradient px-3 mb-0 delete"><i data-index="${element.iddetalle_costo}" class="bi bi-trash-fill delete"></i></button>
            </td>
          </tr>
        `;


          $("#table-det-budgets tbody").innerHTML += newRow;
          ++numRow;
        });

      } else {

        let cardInfo = `
        <div class="alert alert-info text-white" role="alert">
          <h4 class="alert-heading">No hay registros</h4>
          <hr />
          <p class="mb-0">Necesitas registrar un item</p>
          </div>
        `;

        $("#message-info").innerHTML = cardInfo;
      }

    };

    //Obtiene los detalles del costo por el idresupuesto
    async function getDetCostByIdBudget(idpres) {

      try {

        let url = "../../Controllers/cost.controller.php";

        let params = new FormData();
        params.append("action", "listDetailCostIdBudget");
        params.append("idpresupuesto", idpres);

        let results = await global.sendAction(url, params);

        if (results) {
          dataStorage = results
          if (dataStorage.length == 0) {
            $("#save_lots").disabled = true;
          }
          renderDetbudgets(results)
        }
      } catch (e) {
        console.error(e);
      }
    }

    //Obtiene los datos de cabezera de un presupesto por su id
    async function getBudgetsById(idpres) {
      try {

        let url = "../../Controllers/budget.controller.php";
        let params = new FormData();

        params.append("action", "getBudgetById");
        params.append("idpresupuesto", idpres);

        let results = await global.sendAction(url, params);

        if (results) {

          console.log(results)
          let data = JSON.stringify(results);
          dataGetBudget = results;

          $("#codigo").value = results.codigo;
          $("#modelo").value = results.modelo;
          $("#area_construccion").value = results.area_construccion;

        }
      } catch (e) {
        console.error(e);
      }
    }

    //Almacena datos en un array
    function storageData() {

      let data = {};
      if ($("#inputs_materials").classList.contains("d-none")) {

        data = {
          iddetalle_costo: iddetalleCosto,
          idcategoria_costo: $("#categoria_costo").value,
          idsubcategoria_costo: $("#subcategoria_costo").value,
          idmaterial: null,
          detalle: $("#detalle").value,
          cantidad: $("#cantidad").value,
          precio_unitario: $("#precio_unitario").value
        };
      } else {

        let marca = $("#marca").options[$("#marca").selectedIndex].textContent;
        let material = $("#material").options[$("#material").selectedIndex].textContent;
        let unidad_medida = $("#material").options[$("#material").selectedIndex].dataset.unidad_medida;

        data = {
          iddetalle_costo: iddetalleCosto,
          idcategoria_costo: $("#categoria_costo").value,
          idsubcategoria_costo: $("#subcategoria_costo").value,
          idmaterial: Number.parseInt($("#material").value),
          detalle: marca + " // " + material + " // " + unidad_medida,
          cantidad: $("#cantidad").value,
          precio_unitario: $("#precio_unitario").value
        }
      }



      upSetDetCost(data, isAddForm);


      $("#save_lots").disabled = false;
    };

    //Obtiene las marcas
    async function getBrands() {

      try {

        let url = "../../Controllers/brand.controller.php";

        let params = new FormData();
        params.append("action", "listBrand")

        let results = await global.sendAction(url, params);

        if (results.length > 0) {

          results.forEach(result => {

            let newTag = document.createElement("option");
            newTag.value = result.idmarca;
            newTag.innerText = result.marca;

            $("#marca").appendChild(newTag);
          });
        } else {
          let message = "Marcas";

          let newTag = document.createElement("option");
          newTag.value = "";
          newTag.innerText = message;

          $("#marca").appendChild(newTag);
        }
      } catch (e) {
        console.error(e);
      }
    };

    //Obtiene los materiales
    async function getMaterials(idmarca) {
      try {

        let url = "../../Controllers/material.controller.php";

        let params = new FormData();
        params.append("action", "listMaterials");
        params.append("idmarca", idmarca);

        let results = await global.sendAction(url, params);

        if (results.length > 0) {

          //Opcion por defecto
          let tagDefault = document.createElement("option");
          tagDefault.value = "";
          tagDefault.textContent = "Seleccione un material";
          tagDefault.selected = true;

          $("#material").append(tagDefault);

          results.forEach(result => {

            let newTag = document.createElement("option");
            newTag.value = result.idmaterial;
            newTag.innerText = result.material;
            newTag.dataset.unidad_medida = result.unidad_medida;
            newTag.dataset.precio = result.precio_unitario;

            $("#material").appendChild(newTag);
          });
        } else {
          let message = "Material";

          let newTag = document.createElement("option");
          newTag.value = "";
          newTag.innerText = message;

          $("#material").appendChild(newTag);
        }
      } catch (e) {
        console.error(e);
      }
    };

    //Obtiene las caregorias de los costos
    async function getCategoriesCosts() {

      try {

        let url = "../../Controllers/cost.controller.php";
        let params = new FormData();
        params.append("action", "listCategory");

        let results = await global.sendAction(url, params);

        if (results.length > 0) {

          results.forEach(result => {

            let tagOption = document.createElement("option");
            tagOption.value = result.idcategoria_costo;
            tagOption.innerText = result.categoria_costo;

            $("#categoria_costo").appendChild(tagOption);

          })
        } else {
          let message = "Categoría";

          $("#categoria_costo").appendChild(newTag);
        }
      } catch (e) {

      }
    };

    //Obtiene las subcategorías de los costos, según ka categoría
    async function getSubcategoriesCosts(categoria) {

      try {

        let url = "../../Controllers/cost.controller.php";

        let params = new FormData();
        params.append("action", "listSubcategory")
        params.append("idcategoria_costo", categoria)

        let results = await global.sendAction(url, params);

        if (results.length > 0) {

          //Opción por defecto
          let tagOption = document.createElement("option");
          tagOption.value = "";
          tagOption.innerText = "Seleccione una subcategoría";
          tagOption.selected = true;

          $("#subcategoria_costo").appendChild(tagOption);

          results.forEach(result => {

            let tagOption = document.createElement("option");
            tagOption.value = result.idsubcategoria_costo;
            tagOption.innerText = result.subcategoria_costo;
            tagOption.setAttribute("data-material", result.requiere_material);

            $("#subcategoria_costo").appendChild(tagOption);
          });
        } else {
          let message = "Subcategoría";

          let newTag = document.createElement("option");
          newTag.value = "";
          newTag.innerText = message;

          $("#subcategoria_costo").appendChild(newTag);
        }
      } catch (e) {
        console.error(e);
      }
    };

    //Obtiene las subcategorías de los costos, según ka categoría (SOLO LOS DATOS) usado en los selects de la tabla
    async function getSubcategoriesCostsData(categoria) {

      try {

        let url = "../../Controllers/cost.controller.php";

        let params = new FormData();
        params.append("action", "listSubcategory")
        params.append("idcategoria_costo", categoria)

        let results = await global.sendAction(url, params);

        if (results.length > 0) {


          return results;
        } else {
          let message = "Subcategoría";

          let newTag = document.createElement("option");
          newTag.value = "";
          newTag.innerText = message;

          $("#subcategoria_costo").appendChild(newTag);
        }
      } catch (e) {
        console.error(e);
      }
    };

    //Renderiza los botones del acordion
    async function renderAccordionButtons(array, arrayContent) {

      for (element of array) {

        let newButton = "";
        let newContent = "";
        let isChecked;
        arrayContent.forEach(content => {

          isChecked = !content.idpresupuesto ? false : true;
          let checkedAttribute = isChecked ? "checked" : "";
          let idpresupuesto = content.idpresupuesto ? content.idpresupuesto : null;

          if (element.idproyecto == content.idproyecto) {

            newContent += `
          <div id="flush-collapse-${element.idproyecto}" class="accordion-collapse lote-item collapse" data-bs-parent="#accordion-proyectos">
            <div class="form-check" style="margin: 0px 20px; display:flex; align-content:center;">
              <input class="form-check-input form-lotes" type="checkbox" style="height:20px;" data-idpresupuesto="${idpresupuesto}" data-idactivo="${content.idactivo}" data-idproyecto="${content.idproyecto}" name="data-lotes" ${checkedAttribute}/>
              <label class="form-check-label" for="sublote" style="font-size:10px; margin-top:10px;"> 
                Lote - ${content.sublote}
              </label>
            </div>
          </div>
          `;
          }
        })

        newButton = `
      
      <div class="accordion-item">
        <h2 class="accordion-header">
          <div class="form-check form-proyects">
            <input class="form-check-input check-proyects" type="checkbox" style="height:30px;" data-idproyecto="${element.idproyecto}" name="data-proyectos"/>
            <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${element.idproyecto}" aria-expanded="false" aria-controls="flush-collapse-${element.idproyecto}">
              <label class="form-check-label" for="denominacion" style="font-size:10px;"> <strong>${element.denominacion}</strong> </label>
            </button>
          </div>
          <div class="scrollable-content" id="render-accordion-${element.idproyecto}">
            <div id="flush-collapse-${element.idproyecto}" class="accordion-collapse collapse" data-bs-parent="#accordion-proyectos">
                <input type="text" class="form-control search-content" data-idproyecto="${element.idproyecto}" placeholder="Buscar..." style="margin-bottom: 10px;"/>
              </div>
            ${newContent}
          </div>  
        </h2>
      </div>
      `;

        $("#accordion-proyectos").innerHTML += newButton;

      }

      let buttonsProyects = document.querySelectorAll(".form-check-input.form-lotes")

      Array.from(buttonsProyects).forEach(element => {

        if (element.checked) {

          let idproyectoChecked = Number.parseInt(element.dataset.idproyecto);
          let checkProyects = document.querySelectorAll(".form-check-input.check-proyects");

          Array.from(checkProyects).forEach(checkProyect => {

            let buttonProyectChecked = checkProyect.dataset.idproyecto;

            if (buttonProyectChecked == idproyectoChecked) {

              checkProyect.checked = true
            }
          })
        }
      });

      document.querySelectorAll(".search-content").forEach(input => {
        input.addEventListener("input",(e)=>{

          let searchTerm = e.target.value.toLowerCase();
          let idproyecto = e.target.dataset.idproyecto;
          console.log('idproyecto :>> ', idproyecto);
          let accordionContent = document.querySelector(`#render-accordion-${idproyecto}`);

          console.log('accordionContent :>> ', accordionContent);
          let loteItems = accordionContent.querySelectorAll(".lote-item");

          loteItems.forEach(item =>{

            let label = item.querySelector(".form-check-label").textContent.toLowerCase();

            if(label.includes(searchTerm)){
              item.style.display = "";
            }else{
              item.style.display = "none";
            }
          })
        })
      });
    };

    //Obtiene los lotes filtrando los que coninciden con el id lote o los que son null
    async function getFilteredLots() {

      try {

        let url = "../../Controllers/asset.controller.php";

        let params = new FormData();
        params.append("action", "litsLotsForBudget");
        params.append("idpresupuesto", idpresupuestoOBT);

        let results = await global.sendAction(url, params);

        if (results) {

          results.forEach(result => {

            let nombresExist = nombresUnicos.find(nombre => nombre.idproyecto == result.idproyecto && nombre.denominacion == result.denominacion);

            if (!nombresExist) {
              nombresUnicos.push({
                idproyecto: result.idproyecto,
                denominacion: result.denominacion
              })
            }
          })

          await renderAccordionButtons(nombresUnicos, results);
        }

      } catch (e) {
        console.error(e);
      }
    };


    //Oculta/muestra los inputs
    function toggleInputs(isRequired) {

      if (!isRequired) {

        $("#marca").required = false;
        $("#material").required = false;
        $("#detalle").disabled = false
      } else {
        $("#marca").required = true;
        $("#material").required = true;
        $("#detalle").disabled = true;
      }
    };

    //Valida el formulario
    async function validateForm(formdata, callback) {
      return new Promise((resolve, reject) => {

        'use strict'

        const form = document.querySelector(formdata)

        if (!form.checkValidity()) {
              event.preventDefault() //=> FRENA EL ENVÍO DEL FORMULARIO
              event.stopPropagation() //=> FRENA LA PROPAGACIÓN DE DATOS EN EL FORMULARIO
              form.reportValidity();

              reject();
            } else {

              event.preventDefault();

              sAlert.sweetConfirm("Datos nuevos", "¿Deseas actualizar el registro?", () => {

                callback()
                form.reset();
                form.classList.remove("was-validated")

              });

              resolve();
            }

            form.classList.add('was-validated')

      });
    };

    async function setSubcategryValue(obj) {

      return new Promise((resolve, reject) => {

        setTimeout(() => {

          Array.from($("#subcategoria_costo").options).forEach(option => {
            console.log(option)
            console.log("dentro delforeach")
            if (obj.idsubcategoria_costo == option.value) {
              option.selected = true;
            }
          })
          resolve();
        }, 1000);
      })
    }

    $("#area_construccion").addEventListener("input",(e)=>{

      let valueInput = e.target.value

      if(valueInput){

        area_construccion = Number.parseFloat(valueInput);
        $("#save_budget").disabled = false;
      }else{
        $("#save_budget").disabled = true;
      }
    })

    $("#material").addEventListener("change", () => {

      let precio = Number.parseFloat($("#material").options[$("#material").selectedIndex].dataset.precio);
      console.log(precio)
      $("#precio_unitario").value = precio
    });

    $("#marca").addEventListener("change", () => {

      let idmarca = $("#marca").value
      $("#material").innerHTML = "";

      getMaterials(idmarca)
    });

    $("#categoria_costo").addEventListener("change", (e) => {


      $("#subcategoria_costo").innerHTML = "";
      getSubcategoriesCosts(e.target.value);

      if (e.target.value == 2) {
        $("#inputs_materials").classList.add("d-none");
      }
    });

    $("#subcategoria_costo").addEventListener("change", (e) => {

      let required = false;

      let option = e.target.options[e.target.selectedIndex].dataset.material;
      if (option == "NO") {

        required = false;
        $("#inputs_materials").classList.add("d-none");
        toggleInputs(required)


      } else {

        required = true;
        $("#inputs_materials").classList.remove("d-none");
        toggleInputs(required);
      }
    });

    $("#table-det-budgets tbody").addEventListener("click", async function(e) {

      if (e.target.classList.contains("edit")) {

        $("#form_det_budget").reset();

        $("#form-budget").scrollIntoView({
          behavior: "auto"
        });

        isAddForm = false;
        iddetalleCosto = Number.parseInt(e.target.dataset.index);
        console.log(iddetalleCosto)
        console.log("incio del filtro")

        let dataObt = dataStorage.find(data => data.iddetalle_costo == iddetalleCosto)
        console.log(dataObt)
        if (dataObt) {

          console.log("filtrando")
          $("#add").innerHTML = `<i class="bi bi-pencil-fill edit"></i>Actualizar`;
          $("#categoria_costo").value = dataObt.idcategoria_costo
          $("#categoria_costo").dispatchEvent(new Event("change"));

          console.log("inicio del recorrido")
          await setSubcategryValue(dataObt);
          console.log("fin del recorrido")
          $("#detalle").value = dataObt.detalle;
          $("#cantidad").value = dataObt.cantidad;
          $("#precio_unitario").value = dataObt.precio_unitario;

          if (!dataObt.idmarca) {
            $("#inputs_materials").classList.add("d-none");
            $("#marca").required = false;
            $("#material").required = false;
          } else {
            $("#marca").required = true;
            $("#material").required = true;
            $("#inputs_materials").classList.remove("d-none");
          }
        }

        console.log("fin del filtro")
      } else if (e.target.classList.contains("delete")) {

        let iddetalle = e.target.dataset.index
        console.log(iddetalle)


        if (dataStorage.length > 1) {
          $("#save_lots").disabled = false;
          sAlert.sweetConfirm("¿Deseas eliminar el registro?", "", async function() {
            console.log(dataStorage)
            let iddetalle = parseInt(e.target.dataset.index);

            await deleteDetBudget(iddetalle);
          })
        } else if (dataStorage.length == 1) {

          sAlert.sweetError("No puede elimnar este registro", "Necesitas al menos un registro");

        } else if (dataStorage.length < 1) {

          $("#save_lots").disabled = true;

        }

      }
    })

    $("#save_lots").addEventListener("click", async function() {

      $("#save_lots").disabled = true;
      let lotes = document.querySelectorAll(".form-check-input.form-lotes");

      let counter = 0;
      let result = 0;
      let arrayLotes = Array.from(lotes);

      for (lote of lotes) {

        let idactivo = lote.dataset.idactivo;

        let idpresupuestoEdit = lote.checked ? idpresupuestoOBT : "";
        counter += await setIdBudget(idactivo, idpresupuestoEdit)

      }

      if (counter) {

        sAlert.sweetSuccess("Datos nuevos", `Registros actualizados : ${counter}<br>`, () => {
          window.location.href = "./index.php";
          $("#save_lots").disabled = false;
        });
      } else {
        sAlert.sweetError("Lotes no actualizados", "No se ha registrado actualizaciones en los lotes");
      }

      $("#save_lots").disabled = false;

    });

    $("#list-proyectos").addEventListener("click", (e) => {

      if (e.target.classList.contains("check-proyects")) {

        let idproyecto = e.target.dataset.idproyecto;
        let isChecked = e.target.checked;
        let contents = document.querySelectorAll(".form-check-input.form-lotes");

        Array.from(contents).forEach(content => {

          let idproyectoLote = content.dataset.idproyecto

          if (idproyectoLote == idproyecto) {
            content.checked = isChecked;

          }
        });

      } else if (e.target.classList.contains("form-lotes")) {
        let idproyecto = e.target.dataset.idproyecto;
        let accordionHeader = e.target.closest(".accordion-header")
        let checkAncestro = accordionHeader.querySelector(".check-proyects")

        if (e.target.checked) {
          checkAncestro.checked = true;
        }
      }
    });

    $("#form-budget").addEventListener("submit", (e) => {

      e.preventDefault();
      let codigo = $("#codigo").value;
      let modelo = $("#modelo").value;

      validateForm("#form-budget", setBudget)
        .then(() => {

          Array.from(document.querySelectorAll("#form-budget input")).forEach(input => {

            input.readOnly = true;
          });

        })
        .catch(e => {
          console.error(e);
        });

    })

    $("#form_det_budget").addEventListener("submit", (e) => {
      e.preventDefault(e)
      validateForm("#form_det_budget", storageData);
    })

    $("#modelo").addEventListener("blur", (e) => {
      e.preventDefault();

      let valueInput = e.target.value;

      if (valueInput !== dataGetBudget.modelo) {

        if (!lastModel) {

          validateData($("#modelo").value, "modelo", allDataBudget)
            .then(() => {
              $("#save_budget").disabled = false;
            })
            .catch(e => {
              console.error(e);
              $("#modelo").focus();
              $("#save_budget").disabled = true;
            })
        }
      }
    });

    $("#modelo").addEventListener("input", (e) => {

      let valueInput = e.target.value;

      if (e.target.dataset.prevValue !== valueInput) {
        lastModel = false;
      }

      e.target.dataset.prevValue = valueInput;
    });

    getBrands();
    getCategoriesCosts();
    getFilteredLots();

    getBudgetsData();
    getBudgetsById(idpresupuestoOBT);
    getDetCostByIdBudget(idpresupuestoOBT);

    window.addEventListener("beforeunload", (e) => {

      e.preventDefault();
      e.returnValue = "¿Estás seguro de que quieres salir?";
      return "¿Estás seguro de que quieres salir?";
    })


    let acordionItems = document.querySelectorAll(".accordion-item");
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example Views etc -->
  <script src="../../assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
</body>

</html>