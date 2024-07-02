<?php include "../sidebar/permissions.php";?>
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
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="#">Separaciones</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Agregar separación</li>
          </ol>
          <h6 class="font-weight-bolder mb-0" id="cabezera">AGREGAR SEPARACIÓN</h6>
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
                <div class="h-50" style="display: flex; justify-content: center;">

                  <div class="position-relative d-flex align-items-center justify-content-center h-100">
                    <!-- <img class="w-100 position-relative z-index-2 pt-4" style="width: 100%;" id="file-view" src="../../media/constancias_sep/NoImage.jpg" alt=""> -->
                  </div>
                </div>

                <div>

                  <div class="d-flex flex-column h-100">
                    <form class="row needs-validation" id="form-add-separation" novalidate>
                      <div class="row">
                        <div class="col-md-6">

                          <!-- DATOS GENERALES -->

                          <!-- NRO EXPEDIENTE -->
                          <div class="mt-4">
                            <label for="n_expediente" class="form-label">Nº de expediente</label>
                            <input type="text" class="form-control" id="n_expediente" placeholder="Nº de expediente" readonly>

                          </div>

                          <!-- TIPO DE PERSONA -->
                          <div class="mt-4">
                            <label for="tipo_persona" class="form-label">Tipo de persona</label>
                            <select class="form-select custom-select-scroll" id="tipo_persona" required autofocus>
                              <option selected value="">Tipo de persona</option>
                              <option value="NATURAL">Natural</option>
                              <option value="JURÍDICA">Jurídica</option>
                            </select>
                            <div class="invalid-feedback">
                              Necesitas escojer un tipo de persona.
                            </div>
                            <div class="valid-feedback">
                              Tipo de persona escojida correctamente.
                            </div>
                          </div>

                          <!-- CLIENTE -->
                          <div class="mt-4">
                            <label for="idcliente" class="form-label">Cliente</label>
                            <select class="form-select custom-select-scroll" id="idcliente" required>
                              <option value="">Seleccione un cliente</option>
                            </select>
                            <div class="invalid-feedback">
                              Necesitas escojer una cliente.
                            </div>
                            <div class="valid-feedback">
                              Cliente escojido correctament
                            </div>
                          </div>

                          <!-- CONYUGUE -->
                          <div class="mt-4">
                            <label for="idconyugue" class="form-label">Conyugue</label>
                            <select class="form-select custom-select-scroll" id="idconyugue" disabled>
                              <option selected value="">Seleccione una persona</option>
                            </select>
                            <div class="invalid-feedback">
                              Necesitas escojer una cliente.
                            </div>
                            <div class="valid-feedback">
                              Cliente escojido correctament
                            </div>
                          </div>


                          <!-- TIPO DE CAMBIO -->
                          <div class="mt-4">
                            <label for="tipo_cambio" class="form-label">Tipo de cambio</label>
                            <input type="number" class="form-control" id="tipo_cambio" required min="1.00" value="0.00" step="0.01">
                            <div class="invalid-feedback">

                            </div>
                            <div class="valid-feedback">

                            </div>
                          </div>

                          <!-- FECHA PAGO -->
                          <div class="mt-4">
                              <label class="form-label" name="fecha_pago">Fecha de pago</label>
                              <input type="date" class="form-control" id="fecha_pago" required>
                            </div>


                          <!-- DETALLES -->
                          <div class="mt-4">
                            <label for="detalle" class="form-label">Detalles</label>
                            <textarea name="detalle" id="detalle" cols="30" rows="5" class="form-control" required></textarea>
                          </div>

                          <!-- IMAGEN -->
                          <div class="form-group" style="margin-top: 70px;">
                            <label for="in-image" class="label-img">
                              <i class="material-icons"></i>
                              <span class="title" style="display: flex; justify-content: center;">Agregar comprobante</span>
                              <input type="file" accept=".jpg" id="in-image" required>
                              <div class="invalid-feedback">
                                Selcciona una imagen
                              </div>
                              <div class="valid-feedback">
                                Imagen seleccionada correctamente
                              </div>

                              <!-- CONTENEDOR DE LA IMAGEN -->
                              <div class="img-content">

                                <img class="w-100 position-relative z-index-2 pt-4" id="file-view" src="../../media/constancias_sep/NoImage.jpg" alt="">
                              </div>
                            </label>
                          </div>



                          <div class="d-grid p-3">

                            <button class="btn btn-success" type="submit" id="guardar">Guardar</button>
                          </div>

                        </div>

                        <div class="col-md-6">


                          <!-- PROYECTOS -->
                          <div class="mt-4">
                            <label for="idproyecto" class="form-label">Proyectos</label>
                            <select class="form-select custom-select-scroll" id="idproyecto" required>
                              <option selected disabled value="">Seleccione un proyecto</option>
                            </select>
                            <div class="invalid-feedback">
                              Necesitas escojer un proyecto.
                            </div>
                            <div class="valid-feedback">
                              Proyecto escojido correctamente.
                            </div>
                          </div>

                          <!-- LOTES -->
                          <div class="mt-4">
                            <label for="idactivo" class="form-label">Lote</label>
                            <select class="form-select custom-select-scroll" id="idactivo" required>
                              <option selected disabled value="">Seleccione un lote</option>
                            </select>
                            <div class="invalid-feedback">
                              Necesitas escojer una un lote.
                            </div>
                            <div class="valid-feedback">
                              Lote escojido correctamente.
                            </div>
                          </div>

                          <!-- MONEDA VENTA -->
                          <div class="mt-4">
                            <label for="moneda_venta" class="form-label">Moneda de venta</label>
                            <input type="text" class="form-control" id="moneda_venta" readonly>
                            <div class="invalid-feedback">
                            </div>
                            <div class="valid-feedback">
                            </div>
                          </div>

                          <!-- MONTO DE SEPARACIÓN -->
                          <div class="mt-4">
                            <label for="separacion_monto" class="form-label">Monto de separación</label>
                            <input type="number" class="form-control" id="separacion_monto" placeholder="Monto de separación" value="0.00" min="500.00" step="0.01" required>
                            <div class="invalid-feedback">
                              Necesitas ingresar el monto de separación.
                            </div>
                            <div class="valid-feedback">
                              Monto de separación ingresado correctamente.
                            </div>

                            

                            <!-- MODALIDAD DE PAGO -->
                            <div class="mt-4">
                              <label for="modalidad_pago" class="form-label">Tipo de pago</label>
                              <select name="modalidad_pago" id="modalidad_pago" class="form-select" required>
                                <option value="">Seleccione una modalidad de pago</option>
                                <option value="TRANSFERENCIA">Transferencia</option>
                                <option value="EFECTIVO">Efectivo</option>
                              </select>
                            </div>

                            <!-- ENTIDAD BANCARIA -->
                            <div class="mt-4">
                              <label for="entidad_bancaria">Entidad bancaria</label>
                              <select name="entidad_bancaria" id="entidad_bancaria" class="form-select" required>
                                <option value="">Selecciona una entidad bancaria</option>
                                <option value="BCP">BCP</option>
                                <option value="INTERBANCK">INTERBANCK</option>
                                <option value="BBVA">BBVA</option>
                                <option value="SCOTIABANK">SCOTIABANK</option>
                              </select>
                            </div>

                            <!-- NRO DE OPERACION -->
                            <div class="mt-4">
                              <label for="nro_operacion">Nro de operación</label>
                              <input type="number" name="nro_operacion" id="nro_operacion" placeholder="Nro de operación" class="form-control" min="1" placeholder="0000000000" required>
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

  <!-- Modal trigger button -->
  <button type="button" id="show-modal" class="btn btn-primary btn-lg" data-bs-toggle="modal" data-bs-target="#modalId" style="position: absolute; left: -9999px; top: -9999px;">
    Launch
  </button>


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

  <!-- <script src="../../assets/js/renderUbigeo.js"></script>  -->

  <!-- SELECT2 - JQUERY -->
  <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
  <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
  <script>
    const global = new FunGlobal();
    const sAlert = new Alert();

    const $ = id => global.$(id);
    const $All = id => global.$All(id);

    let dataSeparations;
    let lastCode = false;
    let dataClients;
    let newValue;
    let timer;


    // * Obtienie el numero de serie código
    async function getSerieCode() {

      try {

        let url = "../../Controllers/configuration.controller.php";

        let params = new FormData();
        params.append("action", "listConfig");
        params.append("clave", "serie-separacion");

        let result = await global.sendAction(url, params);

        if (result) {

          console.log(result)

          let alphanum = "SEPC-";
          let number = Number.parseInt(result.valor) + 1;
          let numberString = String(number).toString().padStart(5, '0');
          let serie = alphanum + numberString
          console.log(serie)

          const alpha_serie = {
            "clave": "serie-separacion",
            "serie": serie,
            "number": number,
            "numberString": numberString,
            "alphanum": alphanum
          }

          $("#n_expediente").value = serie;

          return alpha_serie;
        }

      } catch (e) {
        console.error(e)
      }
    }

    //Obtiene la fecha actual
    async function getToday() {
      let date = new Date();

      let day = date.getDate().toString().padStart(2, '0');
      let month = (date.getMonth() + 1).toString().padStart(2, '0');
      let year = date.getFullYear().toString().padStart(2, '0');

      let today = `${year}-${month}-${day}`;

      $("#fecha_pago").value = today;
      $("#fecha_pago").min = today;
      return today;
    }

    //Obtiene el tipo de cambio
    async function getTC() {

      try {

        let params = new URLSearchParams();
        let today = await getToday();

        console.log(today)
        params.append("action", "searchTC");
        params.append("fecha", today);

        let url = `../../Controllers/searchDocument.php?${params}`;

        let results = await global.sendActionGET(url);

        if (results) {

          console.log(results)
          if (results.data.data) {
            let precio_venta = results.data.data.venta;
            let number_format = precio_venta.toFixed(2);
            let pVenta_format = Number.parseFloat(number_format);
            $("#tipo_cambio").value = pVenta_format;

          } else {
            sAlert.sweetWarning("No se ha conseguido el tipo de cambio", "No se ha podido conseguir el tipo de cambio <br> Intentalo más tarde.")
          }
        }
      } catch (e) {
        console.error(e)
      }
    }

    //Obtiene los datos de las separaciones
    async function getSeparations() {

      try {

        let url = "../../Controllers/separation.controller.php";

        let params = new FormData();
        params.append("action", "listSeparations");

        let results = await global.sendAction(url, params);

        if (results.length > 0) {
          dataSeparations = results;
          console.log(dataSeparations);
        }
      } catch (e) {
        console.error(e);
      }
    }

    //Valida los datos(inptu n_expediente y idactivo)
    function validateDate(campo, value, array) {

      return new Promise((resolve, reject) => {

        let isFound = array.find(element => element[campo] == value)

        if (isFound) {
          sAlert.sweetWarning("Se ha encontrado coincidencias", `"${value}" ya existe, ingresa otro`);
          reject();
          console.log("dato encontrado");
        } else {
          resolve();
          console.log("data no encontrado");
        }
      });

    }

    //Obtiene los proyectos 
    async function getProjects() {

      try {

        let url = "../../Controllers/project.controller.php";

        let params = new FormData();
        params.append("action", "listProjecTypeAct");
        params.append("tipo_activo", "LOTE");

        let results = await global.sendAction(url, params);

        if (results.length > 0) {

          $("#idproyecto").innerHTML = "";

          let defaultTag = document.createElement("option");
          defaultTag.text = "Seleccione un proyecto";
          defaultTag.value = "";
          $("#idproyecto").appendChild(defaultTag);

          results.forEach(result => {

            let newTag = document.createElement("option");
            newTag.innerText = result.denominacion;
            newTag.value = result.idproyecto;

            $("#idproyecto").appendChild(newTag);

          });
        }
      } catch (e) {
        console.log(e);
      }
    }

    //Obtiene los datos de los lotes
    async function getLots(idproyecto) {

      try {
        let url = "../../Controllers/asset.controller.php";
        let params = new FormData();

        params.append("action", "listOnlyLots");
        params.append("idproyecto", idproyecto);
        let results = await global.sendAction(url, params);

        if (results.length > 0) {

          $("#idactivo").innerHTML = "";

          let defaultValue = document.createElement("option");
          defaultValue.innerText = "Seleccione un lote";
          defaultValue.value = "";

          $("#idactivo").appendChild(defaultValue);

          results.forEach(result => {
            let newOption = document.createElement("option");
            newOption.text = "LT - " + result.sublote;
            newOption.value = result.idactivo;
            newOption.dataset.moneda_venta = result.moneda_venta;

            $("#idactivo").appendChild(newOption);
          });
        }
      } catch (e) {
        console.error(e);
      }
    }

    function readFile(event) {
      let file = event.target.files[0];
      let reader = new FileReader();

      reader.onload = (event) => {
        $("#file-view").setAttribute("src", (event.target.result));
        $("#file-view").style.width = "100%";
        $("#file-view").style.height = "20rem";
      }

      reader.readAsDataURL(file);
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

            $("#idcliente").appendChild(newOption);
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

        console.log(dataClients);
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

    //Registra una separación
    async function addSeparation() {

      try {

        let serie = await getSerieCode()
        let url = "../../Controllers/separation.controller.php";
        let params = new FormData()

        params.append("action", "addSeparation");
        params.append("n_expediente", serie.serie);
        params.append("idactivo", $("#idactivo").value);
        params.append("idcliente", $("#idcliente").value);
        params.append("idconyugue", $("#idconyugue").value);
        params.append("tipo_cambio", $("#tipo_cambio").value);
        params.append("moneda_venta", $("#moneda_venta").value);
        params.append("separacion_monto", $("#separacion_monto").value);
        params.append("fecha_pago", $("#fecha_pago").value);
        params.append("imagen", $("#in-image").files[0]);
        params.append("detalle", $("#detalle").value);
        params.append("modalidad_pago", $("#modalidad_pago").value);
        params.append("entidad_bancaria", $("#entidad_bancaria").value);
        params.append("nro_operacion", $("#nro_operacion").value);
        params.append("clave", serie.clave);
        params.append("valor", serie.number);

        let result = await global.sendAction(url, params);

        if (result.filasAfect > 0) {
          console.log(result);
          sAlert.sweetConfirmAdd("El registro fué exitoso", "¿Deseas volver a registrar?",
            () => {
              $("#form-add-separation").reset();
              $("#form-add-separation").classList.remove("was-validated");

            }, () => {
              window.location.href = "./index.php";
            })
        }
      } catch (e) {
        console.error(e);
      }
    }

    $("#nro_operacion").addEventListener("input",(e)=>{

      
      let valueInput = e.target.value;
      let valueInt = Number.parseInt(valueInput);
      
      console.log(valueInput)
      if(valueInput && valueInt > 0){

        clearTimeout(timer)
        timer = setTimeout(()=>{
          
          let value_path = valueInput.padStart(10,'0');
          let value = value_path.substring((value_path.length)-10) // ! Obtiene los ultimos 10 elementos
          $("#nro_operacion").value = value;
        },1500)
      }
    });

    $("#modalidad_pago").addEventListener("change",(e)=>{

      valueSelect = e.target.value;

      if(valueSelect == "TRANSFERENCIA")$("#nro_operacion").disabled = false, $("#entidad_bancaria").disabled = false;
      else $("#nro_operacion").disabled = true,$("#entidad_bancaria").disabled = true
    });

    $("#idproyecto").addEventListener("change", (e) => {

      let valueInput = e.target.value;

      getLots(valueInput)

    });

    $("#idactivo").addEventListener("change", (e) => {

      let moneda_venta = e.target.options[e.target.selectedIndex].dataset.moneda_venta;
      console.log(moneda_venta)

      $("#moneda_venta").value = moneda_venta;

    });

    $("#tipo_persona").addEventListener("change", (e) => {
      let tipo_persona = e.target.options[e.target.selectedIndex].value;

      getCustomers(tipo_persona);

      if (tipo_persona == "NATURAL") {
        $("#idconyugue").disabled = false;
      } else {
        $("#idconyugue").disabled = true;
      }

    })

    $("#idcliente").addEventListener("change", (e) => {

      let idcliente = e.target[e.target.selectedIndex].value;

      getSpouses(idcliente);

    });


    $("#in-image").addEventListener("change", (e) => {

      if (e.target.files.length > 0) {
        readFile(e);
      }
    });

    getTC();
    getProjects();
    getSeparations();

    getSerieCode();
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

              addSeparation(); //Ejecuta la función
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