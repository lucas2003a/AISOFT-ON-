
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

        <?php include "../sidebar/sidebar_options.php"; ?>

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
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Separaciones</li>
          </ol>
          <h6 class="font-weight-bolder mb-0" id="cabezera">SEPARACIONES </h6>
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
        <div class="col-12">
          <div class="card mb-4">
            <div class="card-header pb-0">
              <div class="row">
                <div class="col-md-3">

                  <h6>Tabla - separaciones</h6>
                </div>
                <div class="row d-flex" style="align-items: end;">

                  <div class="col-md-3 mt-2">
                    <label for="tipo_persona">Tipo de persona</label>
                    <select name="tipo_persona" class="form-select" id="tipo_persona">
                      <option value="">Tipo de persona</option>
                      <option value="NATURAL" selected>Natural</option>
                      <option value="JURÍDICA">Juridica</option>
                    </select>
                  </div>

                  <div class="col-md-3 mt-2">
                    <label for="fechaInicio" class="form-label">
                      Fecha de inicio
                    </label>
                    <input type="date" name="fechaInicio" class="form-control" id="fechaInicio">
                  </div>
                  <div class="col-md-3 mt-2">
                    <label for="fechaFin" class="form-label">
                      Fecha de fin
                    </label>
                    <input type="date" name="fechaFin" class="form-control" id="fechaFin">
                  </div>

                  <div class="col-md-3 d-grid mt-2">
                    <label for="campoCriterio">Nº de expediente o documento de identidad</label>
                    <div class="input-group">
                      <span class="input-group-text text-body"><i class="fas fa-search" aria-hidden="true"></i></span>
                      <input type="text" class="form-control" placeholder="Nº de expediente o documento de identidad..." id="n_expediente">
                    </div>
                  </div>

                </div>
                <div class="row d-flex" style="justify-content: space-between; align-items: start;">
                  <div class="col-md-3 m-2">
                    <div class="btn-group text-start mt-2">
                      <a type="button" class="mb-0  btn btn-sm btn-outline-success" href="./add_separation.php">AGREGAR SEPARACIÓN</a>
                    </div>

                  </div>
                </div>
              </div>
            </div>
            <hr>
            <div class="card-body px-0 pt-0 pb-2">
              <div class="table-responsive text-center p-0" style="min-height: 300px;">
                <table class="table align-items-center mb-0 table-hover" id="table-separations">
                  <thead>
                    <tr>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">#</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">Nº de expediente</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">Cliente</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">Tipo de documento</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">Nº de documento</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">Monto de separación</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">Fecha de registro</th>
                      <th class="text-uppercase text-secondary text-xxs font-weight-bolder opacity-10">Operaciones</th>
                    </tr>
                  </thead>
                  <tbody>

                    <!-- RENDER -->

                  </tbody>
                </table>
                <div id="render-alert">


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
  <div class="fixed-plugin d-none">
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
  <div class="modal fade" id="modal_det_sep" tabindex="-1" role="dialog" aria-labelledby="modalTitleId" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable modal-lg modal-fullscreen-sm-down" role="document">
      <div class="modal-content">
        <div class="modal-header bg-secondary">
          <h5 class="modal-title text-white" id="modalTitle">
            --
          </h5>
          <button type="button" class="btn-close text-dark" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
          <div style="margin: 5% 10% 5% 10%;">
            <div class="d-flex row" style="justify-content: space-between;" id="render-details">

              <!-- RENDER DETALLES -->
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
    document.addEventListener("DOMContentLoaded", () => {

      /* INSTANCIAS */
      const global = new FunGlobal();
      const sAlert = new Alert();

      const $ = id => global.$(id);
      const $All = id => global.$All(id);

      let date = new Date();
      let minDate = new Date('2024-1-1'); //La fecha se agrega sin 0 a la izquierda
      let defaultDate = new Date();
      console.log(date.get)

      let fechaInicioValue = "";
      let fechaFinValue = "";
      let dateReset = "";

      let timmer;

      //Cuenta si existe un contrato por el idsepracion
      async function countContrato(id) {

        try {
          let url = "../../Controllers/contract.controller.php";

          let params = new FormData();
          params.append("action", "existContract");
          params.append("idseparacion", id);

          let result = await global.sendAction(url, params);

          if (result) {
            return result.existContract;
          }
        } catch (e) {
          console.error(e)
        }
      }

      //Obtiene los registros de una separacion por id
      async function getSeparation(id) {

        try {
          let url = "../../Controllers/separation.controller.php";
          let params = new FormData();

          params.append("action", "listSeparationById");
          params.append("idseparacion", id);

          let result = await global.sendAction(url, params);

          if (result) {
            console.log(result)

            let divDetails = $("#render-details");
            let montoPagado = "";
            let monedas = {

              SOL: "S/ " + result.separacion_monto,
              USD: "$/ " + result.separacion_monto
            };

            montoPagado = monedas[result.moneda_venta];

            const content = [{
                clave: "Cliente",
                valor: result.cliente
              },
              {
                clave: "Tipo de documento",
                valor: result.documento_tipo
              },
              {
                clave: "Nro de documento",
                valor: result.documento_nro
              },
              {
                clave: "Proyecto",
                valor: result.denominacion
              },
              {
                clave: "Sublote",
                valor: result.sublote
              },
              {
                clave: "Conyugue",
                valor: result.conyugue || "SIN REGISTRAR"
              },
              {
                clave: "Tipo de documento (conyugue)",
                valor: result.conyPers_documento_tipo || "SIN REGISTRAR"
              },
              {
                clave: "Nro de documento (conyugue)",
                valor: result.conyPers_documento_nro || "SIN REGISTRAR"
              },
              {
                clave: "Monto de separación",
                valor: montoPagado
              },
              {
                clave: "Modalidad de pago",
                valor: result.modalidad_pago
              },
              {
                clave: "Entidad Bancaria",
                valor: result.entidad_bancaria || "SIN REGISTRAR"
              },
              {
                clave: "Número de operación",
                valor: result.nro_operacion || "SIN REGISTRAR"
              },
              {
                clave: "Comprobante",
                valor: "../../media/constancias_sep/" + result.imagen
              },
            ];

            $("#modalTitle").innerHTML = result.n_expediente;

            divDetails.innerHTML = "";
            content.forEach(element => {
              let html = ``;

              if (element.clave !== "Comprobante") {

                html = `
                    <div class="col-md-6">
                      <div class="mt-2">
                        <h6><strong>${element.clave}: </strong></h6>
                      </div>
                    </div>
                    <div class="col-md-6">
                      <div class="mt-2">
                        <h6>${element.valor}</h6>
                      </div>
                    </div>
                `;
              } else {

                html = `
                <div class="mt-4">
                  <h6><strong>${element.clave}: </strong></h6>
                </div>
                <div class="d-flex justify-content-center img-content">
                  <div class="mt-2">
                    <img src="${element.valor}" alt="${element.valor}">
                  </div>
                </div>
                `;
              }

              divDetails.innerHTML += html;
            });

          }
        } catch (e) {
          console.error(e);
        }
      }
      //Obtiene los datos de las separciones en base a 4 criterios
      async function getSeparations(tpersona, dateStart, dateEnd, campoCriterio) {

        try {

          let url = "../../Controllers/separation.controller.php";

          let params = new FormData();


          if (!campoCriterio) {

            params.append("action", "listSeparationsTPersona");
            params.append("tipoPersona", tpersona);
            params.append("fechaInicio", dateStart);
            params.append("fechaFin", dateEnd);
          } else {
            params.append("action", "listSeparationsCampoCriterio");
            params.append("tipoPersona", tpersona);
            params.append("fechaInicio", dateStart);
            params.append("fechaFin", dateEnd);
            params.append("campoCriterio", campoCriterio)

          }


          let results = await global.sendAction(url, params);

          if (results) {

            $("#render-alert").innerHTML = "";
            $("#table-separations tbody").innerHTML = "";

            if (results.length > 0) {
              console.log(results);

              let numberRow = 1;

              results.forEach(result => {
                let newRow = "";
                let isDisabled = result.existe_contrato ? "disabled" : "";
                let code = btoa(result.idseparacion);
                let expedient = btoa(result.n_expediente);
                let liContract = "";

                let contractOptions = [
                  `<li><a type="button" data-expedient="${result.n_expediente}" data-id="${result.idseparacion}" class="dropdown-item go  ${isDisabled}"><i data-id="${result.idseparacion}" data-expedient="${result.n_expediente}" class="bi bi-file-earmark-pdf text-danger go" data-id="${result.idseparacion}"></i> Generar contrato</a></li>`,
                  `<li><a type="button" data-id="${result.idseparacion}" class="dropdown-item text-secondary px-3 mb-0 return"><i class="fa-solid fa-right-left text-secondary return" data-id="${result.idseparacion}"></i> Devolución</a></li>`,
                  `<li><a type="button" data-expedient="${result.n_expediente}" data-id="${result.idseparacion}" class="dropdown-item edit"><i data-id="${result.idseparacion}" data-expedient="${result.n_expediente}" class="bi bi-pencil-fill text-primary edit" data-id="${result.idseparacion}"></i> Editar</a></li>`
                ];

                if (!result.existe_contrato) {

                  contractOptions.forEach(option => {
                    liContract += option;
                  });
                } else {
                  liContract = "";
                }

                newRow = `
                  <tr>
                    <td class="text-xs">${numberRow}</td>
                    <td class="text-xs">${result.n_expediente}</td>
                    <td class="text-xs">${result.cliente.toLowerCase()}</td> 
                    <td class="text-xs">${result.documento_tipo}</td> 
                    <td class="text-xs">${result.documento_nro}</td> 
                    <td class="text-xs">${result.separacion_monto}</td>
                    <td class="text-xs">${result.create_at}</td>
                    <td>
                      <div class="btn-group">
                        <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" data-bs-auto-close="true" aria-expanded="false">
                          
                        </button>
                        <ul class="dropdown-menu">
                          <li><a type="button" href="#" data-id="${result.idseparacion}" class="dropdown-item px-3 mb-0 open-modal" data-bs-toggle="modal" data-bs-target="#modal_det_sep" ><i class="fa-solid fa-eye open-modal text-info" data-id="${result.idseparacion}"></i> Ver</a></li>
                          ${liContract}
                          </ul>
                      </div>
                    </td>
                  </tr>
                  `;
                $("#table-separations tbody").innerHTML += newRow;
                ++numberRow;
              });
            } else {

              let newAlert = "";
              newAlert = `
                  <div class="alert alert-danger text-white" role="alert">
                      <h4 class="alert-heading">No hay registros</h4>
                      <hr />
                      <p class="mb-0">Asegurate de ingresar los datos correctos</p>
                    </div>
              `;

              $("#render-alert").innerHTML = newAlert;
            }
          } else {
            let newAlert = "";
            newAlert = `
                  <div class="alert alert-danger text-white" role="alert">
                      <h4 class="alert-heading">No hay registros</h4>
                      <hr />
                      <p class="mb-0">Asegurate de ingresar los datos correctos</p>
                    </div>
              `;

            $("#render-alert").innerHTML = newAlert;
          }
        } catch (e) {
          console.error(e);
        }
      }

      //Cambia la fecha actual hacia 1 mes atrás (fecha por defecto de inicio) 
      function setDefaultDate() {

        //FECHA POR DEFECTO (1 MES ATRÁS)

        defaultDate.setMonth(defaultDate.getMonth() - 1);

        if (defaultDate.getDate() !== date.getDate()) {
          defaultDate.getDate(0)
        }

        const defaultDay = defaultDate.getDate().toString().padStart(2, '0');
        const defaultMonth = (defaultDate.getMonth() + 1).toString().padStart(2, '0');
        const defaultYear = defaultDate.getFullYear().toString();

        let defDate = `${defaultYear}-${defaultMonth}-${defaultDay}`;

        dateReset = defDate; //variable que guardará la fecha por defecto

        return defDate;
      }

      //Actuazliza la fecha, a la fecha actual
      function setToday() {
        //FECHA ACTUAL

        /*getDate() => numero del día entre 1 y 31 (o 30 dependiendo del mes)
          getMonth() => numero del mes entre 0 y 11 (0 = enero, 1 = febrero, etc)
          getFullYear() => año en formato 4 dígitos
          getDate(0) => Devuelve el ultimo día del mes anterior
         */
        const day = date.getDate().toString().padStart(2, '0');
        const month = (date.getMonth() + 1).toString().padStart(2, '0');
        const year = date.getFullYear().toString();

        let defToday = `${year}-${month}-${day}`;
        return defToday;
      }

      // Configura los valores por defecto de los inputs date
      async function getDates() {

        //FECHA ACTUAL

        let today = setToday();

        //FECHA MÍNIMA
        const minDay = minDate.getDate().toString().padStart(2, '0');
        const minMonth = (minDate.getMonth() + 1).toString().padStart(2, '0');
        const minYear = minDate.getFullYear().toString();

        let dateBefore = `${minYear}-${minMonth}-${minDay}`;

        //FECHA POR DEFECTO (1 MES ATRÁS)

        let dateDefault = setDefaultDate();

        $("#fechaInicio").min = dateBefore;
        $("#fechaInicio").value = dateDefault;
        $("#fechaInicio").max = today;
        fechaInicioValue = $("#fechaInicio").value;

        $("#fechaFin").value = today;
        $("#fechaFin").max = today;
        $("#fechaFin").min = dateBefore;
        fechaFinValue = $("#fechaFin").value

        let tPersona = $("#tipo_persona").options[$("#tipo_persona").selectedIndex].value;
        await getSeparations(tPersona, dateDefault, today, false);
      }

      //Valida las fechas de los inputs date
      function validateDates() {

        return new Promise((resolve, reject) => {

          console.log("incio filtro")
          console.log(fechaInicioValue)
          console.log(fechaFinValue)

          let fechaInicioDate = new Date(fechaInicioValue);
          let fechaFinDate = new Date(fechaFinValue);

          if (fechaInicioDate > fechaFinDate) {

            $("#fechaInicio").value = dateReset;
            $("#fechaFin").value = setToday();
            reject()
          } else {

            resolve()
          }
          console.log("fin filtro")
        })
      }


      $("#fechaInicio").addEventListener("change", (e) => {
        console.log(e.target.value);
        fechaInicioValue = e.target.value;
        validateDates()
          .then(() => {
            let tipoPersona = $("#tipo_persona").options[$("#tipo_persona").selectedIndex].value;
            let n_expedient = $("#n_expediente").value ? $("#n_expediente").value : false;

            getSeparations(tipoPersona, fechaInicioValue, fechaFinValue, n_expedient);
          })
      })

      $("#fechaFin").addEventListener("change", (e) => {
        console.log(e.target.value);
        fechaFinValue = e.target.value;
        validateDates()
          .then(() => {
            let tipoPersona = $("#tipo_persona").options[$("#tipo_persona").selectedIndex].value;
            let n_expedient = $("#n_expediente").value ? $("#n_expediente").value : false;

            getSeparations(tipoPersona, fechaInicioValue, fechaFinValue, n_expedient);
          })
      });

      $("#tipo_persona").addEventListener("change", (e) => {

        let option = e.target.options[e.target.selectedIndex].value;
        console.log(option)
        if (option) {
          let n_expedient = $("#n_expediente").value ? $("#n_expediente").value : false;

          getSeparations(option, fechaInicioValue, fechaFinValue, n_expedient);
        }
      })

      $("#n_expediente").addEventListener("input", (e) => {

        let input = e.target.value;

        if (input) {

          clearTimeout(timmer);

          timmer = setTimeout(() => {
            let tpersona = $("#tipo_persona").options[$("#tipo_persona").selectedIndex].value
            getSeparations(tpersona, fechaInicioValue, fechaFinValue, input);
          }, 1000);
        }
      });

      $("#table-separations tbody").addEventListener("click", async function(e) {

        e.preventDefault();


        if (e.target.classList.contains("open-modal")) {

          let idSeparacion = e.target.dataset.id;
          getSeparation(idSeparacion);

        } else if (e.target.classList.contains("delete")) {
          let idSeparacion = e.target.dataset.id;
          let expedientGet = e.target.dataset.expedient;

          let code = btoa(idSeparacion);
          let expedient = btoa(expedientGet);

          let exist = await countContrato(idSeparacion)

          if (exist) {
            sAlert.sweetWarning("No se puede actualizar el registro", "Este registro cuenta con un contrato, intentalo más tarde.")
          } else {

            window.location.href = `./delete_separation.php?id=${code}&expedient=${expedient}`;
          }

        } else if (e.target.classList.contains("return")) {

          let idSeparacion = e.target.dataset.id;

          let code = btoa(idSeparacion);

          console.log(await countContrato(idSeparacion));
          let exist = await countContrato(idSeparacion)

          if (exist) {
            sAlert.sweetWarning("No se puede actualizar el registro", "Este registro cuenta con un contrato, intentalo más tarde.")
          } else {
            let type = btoa("sep");
            window.location.href = `../refunds/add_refund.php?id=${code}&type=${type}`;
          }
        } else if (e.target.classList.contains("edit")) {

          let idSeparacion = e.target.dataset.id;
          let expedientE = e.target.dataset.expedient;

          let code = btoa(idSeparacion);
          let expedient = btoa(expedientE);

          window.location.href = `./edit_separation.php?id=${code}&expedient=${expedient}`;
        } else if (e.target.classList.contains("go")) {

          let code = btoa(e.target.dataset.id);
          window.location.href = "../contracts/add_contract_separation.php?id=" + code;
        }
      });

      getDates()

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