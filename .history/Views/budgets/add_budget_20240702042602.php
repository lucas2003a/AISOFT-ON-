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

        <>

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
          <h6 class="font-weight-bolder mb-0" id="cabezera">Presupuesto</h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">

          <ul class="navbar-nav  justify-content-end">

            <li class="nav-item d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none"><?="<strong>" . strtoupper($_SESSION["rol"]) . "</strong>" . " - " . strtolower($_SESSION["apellidos"]) . ", " . strtolower($_SESSION["nombres"])?></span>
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
                        <input type="number" name="precio_unitario" id="precio_unitario" class="form-control" value="0.00" min="1.00" step="0.01" required>
                        <div class="invalid-feedback">
                          Necesitas ingresar el precio unitario.
                        </div>
                        <div class="valid-feedback">
                          Precio unitario registrado correctamente.
                        </div>
                      </div>

                      <div class="col-md-6 text-end">
                        <button class="btn bg-gradient-dark mb-0 mt-3" id="add" disabled><i class="fas fa-plus"></i>&nbsp;&nbsp;Agregar</button>
                      </div>
                    </div>

                  </form>
                </div>
              </div>
            </div>

            <!-- TABLA DE DETALLES -->

            <div class="col-md-12 mb-lg-0 mb-4">
              <div class="card mt-4">
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
                  <button type="button" class="btn btn-sm bg-gradient-info mb-0" id="save_lots" disabled><i class="fa-solid fa-floppy-disk"></i> Guardar</button>
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
    document.addEventListener("DOMContentLoaded", () => {


      const global = new FunGlobal();
      const sAlert = new Alert();

      const $ = id => global.$(id);
      const $All = id => global.$All(id);

      console.log('sessionStorage.getItem("isRecovered") :>> ', sessionStorage.getItem("isRecovered"));
      if (sessionStorage.getItem("isRecovered") == "true") {

        $("#codigo").disabled = true;
        $("#modelo").disabled = true;
        $("#area_construccion").disabled = true;
      } else {

        //sessionStorage.setItem("isRecovered","false");
        //sessionStorage.removeItem("dataBudget")
        $("#codigo").disabled = false;
        $("#modelo").disabled = false;
        $("#area_construccion").disabled = false;
      }

      let bootstrap;

      let det_casaJSON;
      let idPresupuesto;
      let area_const;

      //recuperando datos del sessionStorage
      const dataRestored = sessionStorage.getItem("dataStoraged");

      let dataStorage = JSON.parse(dataRestored) || []; //Si es falso, devuelve un array vacío
      let nombresUnicos = [];
      let index = Number.parseInt(localStorage.getItem("index")) || 0;
      let idpresupuesto;
      let dataBudget = JSON.parse(sessionStorage.getItem("dataBudget")) || null;

      let rowDelete = [];
      let rowEdit = [];
      let lastCode = false;
      let lastModel = false;
      let allDataBudget;
      let codeValue;
      let modelValue;
      let dataHouses;

      // * Obtenie el numero de serie código
      async function getSerieCode() {

        try {

          let url = "../../Controllers/configuration.controller.php";

          let params = new FormData();
          params.append("action", "listConfig");
          params.append("clave", "serie-presupuesto");

          let result = await global.sendAction(url, params);

          if (result) {

            console.log(result)

            let alphanum = "PRES-";
            let number = Number.parseInt(result.valor) + 1;
            let numberString = String(number).toString().padStart(5, '0');
            let serie = alphanum + numberString
            console.log(serie)

            const alpha_serie = {
              "clave": "serie-presupuesto",
              "serie": serie,
              "number": number,
              "numberString": numberString,
              "alphanum": alphanum
            }

            $("#codigo").value = serie;

            return alpha_serie;
          }

        } catch (e) {
          console.error(e)
        }
      }

      // Valida los datos de la cabezera del presupuesto
      function validateData(value, column, array) {

        return new Promise((resolve, reject) => {

          for (element of array) {

            let exist = array.find(element => element[column] == value);

            if (exist) {

              reject();
              sAlert.sweetWarning("Se ha encontrado coincidencias", `"${value}" ya existe, ingresa otro`);

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
            console.log(allDataBudget);
          }
        } catch (e) {
          console.error(e);
        }
      }

      //Cambia el idpresupuesto de un lote
      async function setIdBudget(idactivo) {

        try {

          let url = "../../Controllers/asset.controller.php"

          let params = new FormData();

          params.append("action", "setIdBudget");
          params.append("idactivo", idactivo);
          params.append("idpresupuesto", dataBudget.idpresupuesto);

          let result = await global.sendAction(url, params);

          if (result) {
            return result.filasAfect;
          }

        } catch (e) {
          console.error(e);
        }
      }

      //Agrega detalle de presupuesto
      async function addDetCost(obj) {
        try {

          let url = "../../Controllers/cost.controller.php";

          let params = new FormData();

          params.append("action", "addDetailCost");
          params.append("idpresupuesto", dataBudget.idpresupuesto);
          params.append("idsubcategoria_costo", obj.idsubcategoria_costo);
          params.append("idmaterial", obj.idmaterial)
          params.append("detalle", obj.detalle)
          params.append("cantidad", obj.cantidad)
          params.append("precio_unitario", obj.precio_unitario);

          let results = await global.sendAction(url, params);

          if (results) {

            return results.filasAfect;
          }
        } catch (e) {
          console.error(e);
        }
      }

      //Agrega presupuesto
      async function addBudget() {

        try {

          let serie = await getSerieCode();

          let url = "../../Controllers/budget.controller.php"

          let params = new FormData();
          params.append("action", "addBudget");
          params.append("codigo", serie.serie);
          params.append("modelo", modelValue);
          params.append("area_construccion", area_const);
          params.append("clave", serie.clave);
          params.append("valor", serie.number);

          let result = await global.sendAction(url, params);

          if (result) {

            isRecovering = true;
            idpresupuesto = result.idpresupuesto

            let data = {
              idpresupuesto: result.idpresupuesto,
              codigo: result.codigo,
              modelo: result.modelo,
              area_construccion: Number.parseFloat(result.area_construccion)
            };

            console.log(data);

            console.log(data)
            $("#codigo").value = result.codigo;
            $("#modelo").value = result.modelo;
            $("#area_construccion").value = result.area_construccion;

            sessionStorage.setItem("dataBudget", JSON.stringify(data));
            dataBudget = JSON.parse(sessionStorage.getItem("dataBudget"));

            sAlert.sweetSuccess("Éxito", "Presupuesto agregado correctamente", () => {
              sessionStorage.setItem("isRecovered", "true");
              $("#codigo").disabled = true;
              $("#modelo").disabled = true;
              $("#area_construccion").disabled = true;
              $("#add").disabled = false;
            });

          } else {
            sAlert.sweetError("Ocurrió un error", "No se ha podido registrar el presupuesto");
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
            <tr data-index_tr="${element.indice}">
              <td>${numRow}</td>
              <td class="select text-truncate" data-subcategoria="subcategoria"data-idcategoria_costo="${element.idcategoria_costo}">${element.subcategoria_costo}</td>
              <td class="text text-truncate" data-detalle="detalle">${element.detalle}</td>
              <td class="edit-row number cantidad" data-cantidad="cantidad">${element.cantidad}</td>
              <td class="edit-row number precio" data-precio="precio_unitario">${precioUnitarioFormat}</td>
              <td>${numberFormat}</td>
              <td>
                <button type="button" data-index="${element.indice}" class="btn btn-link text-dark px-3 mb-0 save"><i data-index="${element.indice}" class="fa-solid fa-floppy-disk save"></i></button>
                <button type="button" data-index="${element.indice}" class="btn btn-link text-danger text-gradient px-3 mb-0 delete"><i data-index="${element.indice}" class="bi bi-trash-fill delete"></i></button>
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

      //Almacena data en un array
      function storageData() {

        let data = {};
        if ($("#inputs_materials").classList.contains("d-none")) {

          data = {
            indice: Number.parseInt(index),
            idcategoria_costo: Number.parseInt($("#categoria_costo").value),
            idsubcategoria_costo: Number.parseInt($("#subcategoria_costo").value),
            subcategoria_costo: $("#subcategoria_costo").options[$("#subcategoria_costo").selectedIndex].textContent,
            idmaterial: null,
            detalle: $("#detalle").value,
            cantidad: Number.parseInt($("#cantidad").value),
            precio_unitario: Number.parseInt($("#precio_unitario").value)
          };
        } else {

          let marca = $("#marca").options[$("#marca").selectedIndex].textContent;
          let material = $("#material").options[$("#material").selectedIndex].textContent;
          let unidad_medida = $("#material").options[$("#material").selectedIndex].dataset.uni_medida;

          const isEditable = () => {
            
            let needMaterial = $("#subcategoria_costo").options[$("#subcategoria_costo").selectedIndex].dataset.material;

            if(needMaterial == "SI"){
              return true;
            }else{
              return false
            }
          }
          data = {
            indice: Number.parseInt(index),
            idcategoria_costo: Number.parseInt($("#categoria_costo").value),
            idsubcategoria_costo: Number.parseInt($("#subcategoria_costo").value),
            subcategoria_costo: $("#subcategoria_costo").options[$("#subcategoria_costo").selectedIndex].textContent,
            idmaterial: Number.parseInt($("#material").value),
            detalle: marca + " // " + material + " // " + unidad_medida,
            detEditable : isEditable(),
            cantidad: Number.parseInt($("#cantidad").value),
            precio_unitario: Number.parseFloat($("#precio_unitario").value)
          }
        }

        ++index;
        localStorage.setItem("index", index); //Guardando el contador

        dataStorage.push(data);
        renderDetbudgets(dataStorage);

        //Almacenando en sessionStorage
        const arrayConverted = JSON.stringify(dataStorage);
        sessionStorage.setItem("dataStoraged", arrayConverted);

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
              newTag.dataset.uni_medida = result.unidad_medida;
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
      function renderAccordionButtons(array) {

        for (element of array) {

          let newButton = "";


          newButton = `
        
        <div class="accordion-item">
          <h2 class="accordion-header">
            <div class="form-check form-proyects">
              <input class="form-check-input check-proyects" type="checkbox" style="height:30px;" data-idproyecto="${element.idproyecto}" name="data-proyectos"/>
              <button class="accordion-button find-accordion collapsed" id="render-button-${element.idproyecto}" type="button" data-bs-toggle="collapse" data-bs-target="#flush-collapse-${element.idproyecto}" aria-expanded="false" aria-controls="flush-collapse-${element.idproyecto}" data-idproyecto="${element.idproyecto}">
                <label class="form-check-label find-accordion" for="denominacion" style="font-size:10px;" data-idproyecto="${element.idproyecto}"> <strong class="find-accordion" data-idproyecto="${element.idproyecto}">${element.denominacion}</strong> </label>
              </button>
            </div>
            <div class="scrollable-content" id="render-accordion-${element.idproyecto}">

            </div>  
          </h2>
        </div>
        `;

          $("#accordion-proyectos").innerHTML += newButton;
        }
      };

      async function renderContentAccordion(data, idproyecto) {

        let container = document.getElementById(`render-accordion-${idproyecto}`);
        let button = document.getElementById(`render-button-${idproyecto}`);

        console.log('container.childNodes.length :>> ', container.childNodes.length);
        if(container.childNodes.length <= 1){
          
          container.innerHTML = "";
  
          let newContent = "";
  
          // * Buscador
  
          container.innerHTML = `
              <div id="flush-collapse-${idproyecto}" class="accordion-collapse collapse" data-bs-parent="#accordion-proyectos">
                <input type="text" class="form-control search-content" data-idproyecto="${idproyecto}" placeholder="Buscar..." style="margin-bottom: 10px;"/>
              </div>
            `;
  
          data.forEach(element => {
  
            if (element.idproyecto == idproyecto) {
  
              console.log('element :>> ', element);
              newContent = `
                <div id="flush-collapse-${idproyecto}" class="accordion-collapse collapse lote-item" data-bs-parent="#accordion-proyectos">
                  <div class="form-check" style="margin: 0px 20px; display:flex; align-content:center;">
                    <input class="form-check-input form-lotes" type="checkbox" style="height:20px;" data-idactivo="${element.idactivo}" data-idproyecto="${element.idproyecto}" name="data-lotes"/>
                    <label class="form-check-label" for="sublote" style="font-size:10px; margin-top:10px;"> 
                      Lote - ${element.sublote}
                    </label>
                  </div>
                </div>
                `;
  
              container.innerHTML += newContent;
            }
          });
          
        }
        button.dispatchEvent(new Event("click"));


        document.querySelectorAll(".search-content").forEach(input => {

          input.addEventListener("input", (e) => {

            let searchTerm = e.target.value.toLowerCase();
            let idproyecto = e.target.getAttribute("data-idproyecto");
            let accordionContent = document.querySelector(`#render-accordion-${idproyecto}`);
            let loteItems = accordionContent.querySelectorAll(".lote-item");

            loteItems.forEach(item =>{

              let label = item.querySelector(".form-check-label").textContent.toLowerCase();

              if(label.includes(searchTerm)){
                item.style.display = '';
              }else{
                item.style.display = 'none';
              }
            });
          });
        });
      }
      //Obtiene los lotes sin presupuesto
      async function getLotsAll() {

        try {

          let url = "../../Controllers/asset.controller.php";

          let params = new FormData();
          params.append("action", "listHousesNoBudgets");

          let results = await global.sendAction(url, params);

          if (results) {

            dataHouses = results;

            results.forEach(result => {

              let nombresExist = nombresUnicos.find(nombre => nombre.idproyecto == result.idproyecto && nombre.denominacion == result.denominacion);

              if (!nombresExist) {
                nombresUnicos.push({
                  idproyecto: result.idproyecto,
                  denominacion: result.denominacion
                })
              }
            })


            renderAccordionButtons(nombresUnicos);
          }

        } catch (e) {
          console.error(e);
        }
      };

      //Oculta/muestra los inputs
      function toggleInputs(required) {

        if (!required) {

          $("#marca").required = false;
          $("#material").required = false;
          $("#detalle").disabled = false
        } else {
          $("#marca").required = true;
          $("#material").required = true;
          $("#detalle").disabled = true;
        }
      };

      //Convierte los inputs a textos <td>
      function convertText(tr, indexElement) {

        console.log(dataStorage)
        let tds = tr.querySelectorAll("td");

        Array.from(tds).forEach(td => {

          let indexObject = dataStorage.find(data => data.indice == indexElement)
          if (indexObject) {
            indexObject = dataStorage.indexOf(indexObject);
          };

          if (td.querySelector("select")) {
            let select = td.querySelector("select");

            let content = select.options[select.selectedIndex].textContent;


            dataStorage[indexObject].idsubcategoria_costo = select.value;
            dataStorage[indexObject].subcategoria_costo = content;

            td.textContent = content;

          } else if (td.querySelector("input")) {
            let input = td.querySelector("input");

            let cantidad = Number.parseInt(tr.querySelector(".edit-row.number.cantidad").textContent || tr.querySelector("input[name=cantidad]").value);
            let precio = Number.parseFloat(tr.querySelector(".edit-row.number.precio").textContent || tr.querySelector("input[name=precio_unitario]").value);
            console.log(precio)
            console.log(cantidad)

            let total = cantidad * precio;
            console.log(input)
            dataStorage[indexObject][input.name] = input.value;
            dataStorage[indexObject].cantidad = cantidad;
            dataStorage[indexObject].precio_unitario = precio;
            td.textContent = input.value;

            console.log(dataStorage)

          }
        })

        renderDetbudgets(dataStorage)
        //Almacena en sessionStorage
        const dataEdit = JSON.stringify(dataStorage);
        sessionStorage.setItem("dataStoraged", dataEdit);
      };

      //Valida el formulario
      async function validateForm(formdata, callback) {
        return new Promise((resolve, reject) => {

          'use strict'

          const form = document.querySelector(formdata);

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

          form.classList.add('was-validated') //=> AGREGA ESTA CLASE A LOS ELEMENTOS DEL FORMULARIO(MUESTRA LOS COMENTARIOS)
          /* Array.from(forms).forEach(form => {
            form.addEventListener('submit', event => {

            }, false) //=> ESTE TERCER ARGUMENTO INDICA QUE EL EVENTO NO SE ESTA CAPTURANDO EN LA ""FASE DE CAPTURA" SINO EN "PROPAGACIÓN NORMAL"
          }) */

        });
      };



      $("#area_construccion").addEventListener("input", (e) => {

        let inputValue = e.target.value;
        area_const = Number.parseFloat(inputValue)
        console.log(inputValue)
        console.log(typeof(inputValue))
        console.log(Number.parseFloat($("#area_construccion").value))

        if (inputValue || inputValue > 0) {
          $("#save_budget").disabled = false;
        } else {
          $("#save_budget").disabled = true;
        }
      });

      $("#material").addEventListener("change", () => {

        let precio = Number.parseFloat($("#material").options[$("#material").selectedIndex].dataset.precio);
        console.log(precio)
        $("#precio_unitario").value = precio
      });

      $("#marca").addEventListener("change", (e) => {

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

        if (e.target.classList.contains("edit-row")) {

          if (e.target.classList.contains("select")) {

            let idcategoria = Number.parseInt(e.target.dataset.idcategoria_costo);


            let tagSelect = document.createElement("select");
            tagSelect.name = e.target.dataset.subcategoria;
            tagSelect.classList.add("form-select");

            let dataSubcategorias = await getSubcategoriesCostsData(idcategoria);


            dataSubcategorias.forEach(subcategoria => {

              let tagOption = document.createElement("option");
              tagOption.value = subcategoria.idsubcategoria_costo;
              tagOption.innerText = subcategoria.subcategoria_costo;

              tagSelect.appendChild(tagOption);
            });

            e.target.textContent = "";
            let td = e.target.closest("td");

            td.appendChild(tagSelect);

          } else if (e.target.classList.contains("text")) {

            let input = document.createElement("input");
            input.type = "text";
            input.classList.add("form-control");
            input.name = e.target.dataset.detalle
            input.required = true;
            input.focus()
            input.value = e.target.textContent;

            let td = e.target.closest("td")
            e.target.textContent = "";
            td.appendChild(input);

          } else if (e.target.classList.contains("number")) {

            let inputNumber = document.createElement("input");
            inputNumber.type = "number";
            inputNumber.classList.add("form-control");
            inputNumber.name = e.target.dataset.cantidad ? e.target.dataset.cantidad : e.target.dataset.precio
            inputNumber.focus();
            inputNumber.min = 1;
            inputNumber.value = Number.parseInt(e.target.textContent)

            let td = e.target.closest("td")
            e.target.textContent = "";
            td.appendChild(inputNumber);

          }

        }
      })

      $("#table-det-budgets tbody").addEventListener("click", async function(e) {
        if (e.target.classList.contains("save")) {

          let tr = e.target.closest("tr");
          let indexElement = Number.parseInt(e.target.dataset.index);
          console.log("Indice boton :" + indexElement)

          convertText(tr, indexElement);

        } else if (e.target.classList.contains("delete")) {


          sAlert.sweetConfirm("¿Deseas eliminar el registro?", "", () => {

            let indexDelete = dataStorage.find(data => data.indice == e.target.dataset.index);

            //El metodo splice borra un elemento especificando su indice y cuandas coincidencias(indice, n de coindicencias)
            dataStorage.splice(dataStorage.indexOf(element), 1); //Splice solo funciona con arrays y indeof obtien el indice de un objeto seleccionado

            sessionStorage.setItem("dataStoraged", JSON.stringify(dataStorage));
            renderDetbudgets(dataStorage);

            if (dataStorage.length == 0) {
              $("#save_lots").disabled = true;
            }

            let tr = e.target.closest("tr");
            tr.remove();

          })

        }
      })

      $("#codigo").addEventListener("blur", (e) => {

        e.preventDefault();

        let valueInput = e.target.value;

        if (!lastCode) {

          lastCode = true;
          let sliceValue = valueInput.slice(0, 3);
          let valueFormat = sliceValue.padEnd(3, "0");
          let newValue = "PRES-" + valueFormat;
          codeValue = newValue;
          $("#codigo").value = valueFormat;

          validateData(newValue, "codigo", allDataBudget)
            .then(() => {
              $("#modelo").focus();
            })
            .catch(e => {
              $("#codigo").focus();
              lastCode = false;
            });
        }
      })

      $("#codigo").addEventListener("input", (e) => {

        e.preventDefault();
        let valueInput = e.target.value;

        if (e.target.dataset.prevValue !== valueInput) {
          lastCode = false;

        }
        e.target.dataset.prevValue = valueInput

      });

      $("#save_lots").addEventListener("click", async function() {

        $("#save_lots").disabled = true;
        let lotes = document.querySelectorAll(".form-check-input.form-lotes");

        let counter = 0;
        let arrayLotes = Array.from(lotes);
        let resultDet = 0;
        let counterDet = 0;

        for (lote of arrayLotes) {


          if (lote.checked) {

            let idactivo = Number.parseInt(lote.dataset.idactivo);
            for (data of dataStorage) {

              resultDet = await addDetCost(data);
              counterDet += resultDet
            };

            if (resultDet > 0) {

              let result = await setIdBudget(idactivo);

              counter += result;
            }
          }
        };

        if (counter) {

          sAlert.sweetSuccess("Datos nuevos", `Registros actualizados : ${counter}`, () => {

            sessionStorage.setItem("isRecovered", "false");
            sessionStorage.removeItem("dataBudget");
            sessionStorage.removeItem("dataStoraged");
            $("#save_lots").disabled = false;
            window.location.href = "./index.php";
          });
        } else {
          sAlert.sweetError("No se han realizado registro", "Por favor vuelvelo a intentar");
        }
        $("#save_lots").disabled = false;
      });

      $("#list-proyectos").addEventListener("click", async function(e) {

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

        } else if (e.target.classList.contains("find-accordion")) {

          let idproyecto = e.target.dataset.idproyecto;

          await renderContentAccordion(dataHouses, idproyecto);
        }
      });

      $("#form-budget").addEventListener("submit", (e) => {

        e.preventDefault();
        let modelo = $("#modelo").value;

        validateForm("#form-budget", addBudget)
          .then(() => {

            Array.from(document.querySelectorAll("#form-budget input")).forEach(input => {

              input.readOnly = true;
            });

            $("#form-budget button").disabled = true;
          })
          .catch(e => {
            console.error(e);
          });

      })

      $("#form_det_budget").addEventListener("submit", (e) => {

        e.preventDefault();
        validateForm("#form_det_budget", storageData);
      })

      $("#modelo").addEventListener("blur", (e) => {
        e.preventDefault();

        let modelInput = e.target.value;

        if (!lastModel) {
          console.log(allDataBudget)
          modelValue = modelInput

          validateData(modelInput, "modelo", allDataBudget)
            .then(() => {

              $("#area_construccion").focus();
            })
            .catch(e => {
              console.error(e);
              $("#modelo").focus();
            });
        }
      });

      $("#modelo").addEventListener("blur", (e) => {
        e.preventDefault();

        let modelInput = e.target.value
        console.log(modelInput)
        console.log(e.target.dataset.modelo)
        if (e.target.dataset.modelo !== modelInput) {
          lastModel = false;

        }
        e.target.dataset.modelo = modelInput;
      });

      getBrands();
      getCategoriesCosts();
      getLotsAll();
      renderDetbudgets(dataStorage);
      getBudgetsData();

      if (sessionStorage.getItem("isRecovered") == "false" || sessionStorage.getItem("isRecovered") == null) {
        getSerieCode();
      }

      if (dataStorage.length > 0) {
        renderDetbudgets(dataStorage);

        $("#save_lots").disabled = false;

      }

      if (dataBudget) {
        idPresupuesto = dataBudget.idpresupuesto;
        $("#codigo").value = dataBudget.codigo;
        $("#modelo").value = dataBudget.modelo;
        $("#area_construccion").value = dataBudget.area_construccion;
        $("#add").disabled = false;
      }

      window.addEventListener("beforeunload", (e) => {

        e.preventDefault();
        e.returnValue = "¿Estás seguro de que quieres salir?";
        return "¿Estás seguro de que quieres salir?";
      });

      let acordionItems = document.querySelectorAll(".accordion-item");
    })
  </script>
  <!-- Github buttons -->
  <script async defer src="https://buttons.github.io/buttons.js"></script>
  <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example Views etc -->
  <script src="../../assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
</body>

</html>