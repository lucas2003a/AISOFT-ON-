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
            <li class="breadcrumb-item text-sm"><a class="opacity-5 text-dark" href="#">Usuarios</a></li>
            <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Registrar usuarios</li>
          </ol>
          <h6 class="font-weight-bolder mb-0" id="cabezera">REGISTRAR USUARIOS </h6>
        </nav>
        <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">

          <ul class="navbar-nav  justify-content-end">

            <li class="nav-item d-flex align-items-center">
              <a href="javascript:;" class="nav-link text-body font-weight-bold px-0">
                <i class="fa fa-user me-sm-1"></i>
                <span class="d-sm-inline d-none"><?= "<strong>" . strtoupper($_SESSION["rol"]) . "</strong>" . " - " . strtolower($_SESSION["apellidos"]) . ", " . strtolower($_SESSION["nombres"]) ?></span>
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

        <div class="card">
          <div class="card-body">
            <form id="form_add_user" class="row needs-validation" novalidate>
              <div class="row">
                <div class="col-md-6">
                  <div class="m-4">
                    <h6><strong>Datos de la persona</strong></h6>

                    <div class="row">

                      <!-- DOCUMENTO TIPO -->
                      <div class="col-md-6">

                        <div class="mt-4">
                          <label for="documento_tipo" class="form-label">Tipo de documento</label>
                          <select name="documento_tipo" class="form-select" id="documento_tipo" required>
                            <option value="">Tipo de documento</option>
                            <option value="DNI">DNI</option>
                            <option value="CARNET DE EXTRANJERÍA">CARNET DE EXTRANJERÍA</option>
                          </select>
                          <div class="invalid-feedback">
                            Necesitas registrar el tipo de documento.
                          </div>
                          <div class="valid-feedback">
                            Tipo de documento registrado correctamente.
                          </div>
                        </div>
                      </div>

                      <!-- DOCUMENTO NRO -->
                      <div class="col-md-6 mt-4">
                        <label for="documento_nro" class="form-label">Nº de documento</label>
                        <input type="text" name="documento_nro" id="documento_nro" class="form-control" placeholder="Nº documento" required>
                        <div class="invalid-feedback">
                          Necesitas ingresar el número del documento.
                        </div>
                        <div class="valid-feedback">
                          Nº de documento ingresado correctamente.
                        </div>
                      </div>
                    </div>

                    <!-- DATOS GENERALES -->

                    <div class="row">
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
                      </div>

                      <div class="col-md-6">

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
                      </div>
                    </div>

                    <div class="row">
                      <div class="col-md-6">

                        <!-- ESTADO CIVIL -->
                        <div class="mt-4">
                          <label for="estado_civil" class="form-label">Estado civil</label>
                          <select name="estado_civil" id="estado_civil" class="form-select" required>
                            <option value="">Seleccione el estado civil</option>
                            <option value="SOLTERO">SOLTERO</option>
                            <option value="CASADO">CASADO</option>
                          </select>
                          <div class="invalid-feedback">
                            Necesitas registrar el estado civil.
                          </div>
                          <div class="valid-feedback">
                            Estado civil registrado correctamente.
                          </div>
                        </div>
                      </div>
                      <div class="col-md-6">
                        <!-- NACIONALIDAD -->
                        <div class="mt-4">
                          <label for="nacionalidad" class="form-label">Nacionalidad</label>
                          <input type="text" name="nacionalidad" id="nacionalidad" value="PERUANA" placeholder="Nacionalidad" class="form-control pern-n" readonly>
                          <div class="invalid-feedback">
                            Necesitas registrar la nacionalidad.
                          </div>
                          <div class="valid-feedback">
                            Nacionalidad registrada correctamente.
                          </div>
                        </div>
                      </div>
                    </div>



                    <!-- DEPARTAMENTO -->
                    <div class="mt-4">
                      <label for="iddepartamento_user" class="form-label">Departamento</label>
                      <select class="form-select custom-select-scroll" id="iddepartamento_user" required>
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
                      <label for="idprovincia_user" class="form-label">Provincia</label>
                      <select class="form-select custom-select-scroll" id="idprovincia_user" required>
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
                      <label for="iddistrito_user" class="form-label">Distrito</label>
                      <select class="form-select custom-select-scroll" id="iddistrito_user" required>
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
                  </div>

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

                        <img class="w-100 position-relative z-index-2 pt-4" id="file-view" src="../../media/constancias_sep/NoImage.jpg" alt="">
                      </div>
                    </label>
                  </div>
                </div>


                <div class="col-md-6">
                  <div class="m-4">

                    <h6><strong>Datos del usuario</strong></h6>

                    <!-- CORREO -->
                    <div class="mt-4">
                      <label for="correo">Correo</label>
                      <input type="email" name="correo" id="correo" class="form-control" required>
                      <div class="invalid-feedback">
                        El correo es requerido.
                      </div>
                      <div class="valid-feedback">
                        Correo ingresado correctamente.
                      </div>
                    </div>

                    <div class="mt-4">
                      <label for="contrasenia">
                        <spam>Contraseña almacenada por defecto</spam>
                      </label>
                    </div>

                    <!-- ROL -->
                    <div class="mt-4">
                      <label for="idrol">Rol</label>
                      <select name="idrol" id="idrol" class="form-select" required>
                        <option value="">Seleccione un rol</option>
                      </select>
                      <div class="invalid-feedback">
                        El rol es requerido.
                      </div>
                      <div class="valid-feedback">
                        Rol ingresado correctamente.
                      </div>
                    </div>


                    <!-- DEPARTAMENTO -->
                    <div class="mt-4">
                      <label for="iddepartamento">
                        Departamento
                      </label>
                      <select name="iddepartamento" id="iddepartamento" class="form-select" required>
                        <option value="">Seleccione un departamento</option>
                      </select>
                      <div class="invalid-feedback">
                        El departamento es requerido.
                      </div>
                      <div class="valid-feedback">
                        Departamento seleccionado correctamente.
                      </div>
                    </div>

                    <!-- PROVINCIA -->
                    <div class="mt-4">
                      <label for="idprovincia">Provincia</label>
                      <select name="idprovincia" id="idprovincia" class="form-select" required>
                        <option value="">Seleccione una provincia</option>
                      </select>
                      <div class="invalid-feedback">
                        La provincia es requerida.
                      </div>
                      <div class="valid-feedback">
                        Provincia seleccionada correctamente.
                      </div>
                    </div>

                    <!-- DISTRITO -->
                    <div class="mt-4">
                      <label for="iddistrito">Distrito</label>
                      <select name="distrito" id="iddistrito" class="form-select" required>
                        <option value="">Seleccione un distrito</option>
                      </select>
                      <div class="invalid-feedback">
                        El distrito es requerido.
                      </div>
                      <div class="valid-feedback">
                        Distrito seleccionado correctamente.
                      </div>
                    </div>

                    <!-- SEDE -->
                    <div class="mt-4">
                      <label for="idsede">Sede</label>
                      <select name="idsede" id="idsede" class="form-select" required>
                        <option value="">Seleccione una sede</option>
                      </select>
                      <div class="invalid-feedback">
                        La sede es requerida.
                      </div>
                      <div class="valid-feedback">
                        Sede seleccionada correctamente.
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="m-4">
                <button type="submit" class="btn btn-success" id="guarda">Guardar</button>
              </div>
            </form>
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
  <script src="../../assets/js/renderUbigeo_user.js"></script>
  <script>
    document.addEventListener("DOMContentLoaded", async function() {

      /* INSTANCIAS */
      const global = new FunGlobal();
      const sAlert = new Alert();

      const $ = id => global.$(id);
      const $All = id => global.$All(id);

      let stringQuery = window.location.search;
      let params = new URLSearchParams(stringQuery);
      let idcode = params.get('id');
      let idusuario = atob(idcode);

      let timer;
      let dataUser;

      async function getUbigeo(iddistrito) {

        try {

          let url = "../../Controllers/ubigeo/district.controller.php";
          let params = new FormData();

          params.append("action", "getUbigeo");
          params.append("iddistrito", iddistrito);

          let result = await global.sendAction(url, params)

          if (result) {

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
        } catch (e) {
          console.error(e);
        }
      };
      async function getUbigeo_sede(iddistrito) {

        try {

          let url = "../../Controllers/ubigeo/district.controller.php";
          let params = new FormData();

          params.append("action", "getUbigeo");
          params.append("iddistrito", iddistrito);

          let result = await global.sendAction(url, params)

          if (result) {

            const tagDistrito = document.createElement("option");
            tagDistrito.value = result.iddistrito;
            tagDistrito.innerHTML = result.distrito.trim();
            $("#iddistrito_user").appendChild(tagDistrito);
            $("#iddistrito_user").value = result.iddistrito;

            const tagProvincia = document.createElement("option");
            tagProvincia.value = result.idprovincia;
            tagProvincia.innerHTML = result.provincia.trim();
            $("#idprovincia_user").appendChild(tagProvincia);
            $("#idprovincia_user").value = result.idprovincia;

            $("#iddepartamento_user").value = result.iddepartamento;
          }
        } catch (e) {
          console.error(e);
        }
      };
      //* Obtiene los datos del usuario 
      async function getUser(id) {

        try {

          let url = "../../Controllers/user.controller.php";

          let params = new FormData();
          params.append("action", "getUser_users");
          params.append("idusuario", id);

          let results = await global.sendAction(url, params);

          if (results) {
            dataUser = results;

            function returnStates(value){

              let input = value.toLowerCase();
              switch (input) {
                case "soltera":
                  return "SOLTERO"
                  break;
                
                case "casada":
                  return "CASADO";
                  break;
                case "soltero":
                  return "SOLTERO"
                  break;
                
                case "casado":
                  return "CASADO";
                  break;
              }
            }

            console.log(' returnStates(results.estado_civil) :>> ',  returnStates(results.estado_civil));
            $("#documento_tipo").value = results.documento_tipo;
            $("#documento_nro").value = results.documento_nro;
            $("#apellidos").value = results.apellidos;
            $("#nombres").value = results.nombres;
            $("#estado_civil").value = returnStates(results.estado_civil);
            $("#nacionalidad").value = results.nacionalidad;
            $("#direccion").value = results.direccion;
            $("#in-image").src = `../../media/users/${results.image ? results.image : "NoImage.jpg"}`;
            $("#correo").value = results.correo;

            if(Array.from($("#idrol").options).length <= 1){
              let interval = setInterval(()=>{
                if(Array.from($("#idrol").options).length > 1){

                  Array.from($("#idrol").options).forEach(option=>{

                    if(option.value == results.idrol) option.selected = true;
                    clearInterval(interval);
                  })
                }

              },1000);
            }
            await getUbigeo_sede(results.iddistrito);
            await getUbigeo(results.iddistrito_sede);

            if(Array.from($("#idsede").options).length <= 1){
              let interval = setInterval(()=>{
                if(Array.from($("#idsede").options).length > 1){

                  Array.from($("#idsede").options).forEach(option=>{
                    for(let option of Array.from($("#idsede").options)){

                      if(option.value == results.idsede_sede) option.selected = true;
                      clearInterval(interval);
                    }
                  })

                }

              },1000);
            }


          }
        } catch (e) {
          console.error(e);
        }
      }


      async function getRols() {

        try {

          let url = "../../Controllers/rol.controller.php";
          let params = new FormData();
          params.append("action", "getRols");

          let results = await global.sendAction(url, params);

          if (results.length > 0) {
            let select = $("#idrol");

            results.forEach(option => {

              let tagOption = document.createElement("option");
              tagOption.value = option.idrol;
              tagOption.innerText = option.rol;

              select.appendChild(tagOption);
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
        }

        reader.readAsDataURL(file);
      }

      function changLength(value) {

        let inputDoc = $("#documento_nro");
        switch (value) {

          case "CARNET DE EXTRANJERÍA":
            inputDoc.maxLength = 9;
            inputDoc.minLength = 9;
            break;

          case "DNI":
            inputDoc.maxLength = 8;
            inputDoc.minLength = 8;
            break;
        }

      }

      async function getPerson(doc) {

        try {

          let url = "../../Controllers/user.controller.php";
          let params = new FormData();
          params.append("action", "getPerson");
          params.append("documento_nro", doc);

          let results = await global.sendAction(url, params);

          if (results) {
            console.log('results :>> ', results);
            $("#apellidos").value = results.apellidos;
            $("#nombres").value = results.nombres;
            $("#estado_civil").value = results.estado_civil.toUpperCase();
            $("#nacionalidad").value = results.nacionalidad;

            return new Promise((resolve, reject) => {
              options = Array.from($("#iddepartamento_user").options);

              options.forEach(option => {
                if (option.value == results.iddepartamento) option.selected = true;
              });
              $("#iddepartamento_user").dispatchEvent(new Event("change"));
              resolve();

            }).then(() => {
              return new Promise((resolve, reject) => {
                options = Array.from($("#idprovincia_user").options);

                if (options.length > 1) {
                  resolve()
                } else {

                  let interval = setInterval(() => {
                    options = Array.from($("#idprovincia_user").options);
                    if (options.length > 1) {
                      clearInterval(interval);
                      resolve()
                    }
                  }, 1000);
                }
              })
            }).then(() => {

              return new Promise((resolve, reject) => {

                options = Array.from($("#idprovincia_user").options);

                options.forEach(option => {
                  if (option.value == results.idprovincia) option.selected = true;

                });
                $("#idprovincia_user").dispatchEvent(new Event("change"));
                resolve();
              });
            }).then(() => {

              return new Promise((resolve, reject) => {

                options = Array.from($("#iddistrito_user").options);

                if (options.length > 1) {
                  resolve()
                } else {

                  let interval = setInterval(() => {
                    options = Array.from($("#iddistrito_user").options);
                    if (options.length > 1) {
                      clearInterval(interval);
                      resolve()
                    }
                  }, 1000);
                }
              })
            }).then(() => {

              return new Promise((resolve, reject) => {

                options = Array.from($("#iddistrito_user").options);

                options.forEach(option => {
                  if (option.value == results.iddistrito) option.selected = true;

                });
                $("#iddistrito_user").dispatchEvent(new Event("change"));
                resolve();
              });
            }).then(() => {

              return new Promise((resolve, reject) => {

                $("#direccion").value = results.direccion;
                resolve();
              });
            }).catch((err) => {
              console.error(err);
            });
          }
        } catch (e) {
          console.error(e);
        }
      }
      //Agrega un cliente
      async function editUser(id) {

        try {

          let url = "../../Controllers/user.controller.php";

          let params = new FormData();
          params.append("action", "setUser");

          params.append("idusuario", id);
          params.append("imagen", $("#in-image").files[0]);
          params.append("idpersona", dataUser.idpersona);
          params.append("nombres", $("#nombres").value);
          params.append("apellidos", $("#apellidos").value);
          params.append("documento_tipo", $("#documento_tipo").value);
          params.append("documento_nro", $("#documento_nro").value);
          params.append("estado_civil", $("#estado_civil").value);
          params.append("iddistrito", $("#iddistrito").value);
          params.append("direccion", $("#direccion").value);
          params.append("nacionalidad", $("#nacionalidad").value);
          params.append("correo", $("#correo").value);
          params.append("idrol", $("#idrol").value);
          params.append("idsede", $("#idsede").value);

          let result = await global.sendAction(url, params);

          if (result) {

            sAlert.sweetConfirmAdd("Éxito", "El registro se ha guardado de forma exitosa, ¿Deseas registrar otro?", () => {

              $("#form_add_user").reset();
              $("#form_add_user").classList.remove('was-validated');

            }, () => {
              window.location.href = "./index.php";
            });

          }
        } catch (e) {

          console.error(e);
        }
      }

      /**=======================================================================================================================
       *                                                    !EVENTOS
       *=======================================================================================================================**/

      $("#in-image").addEventListener("change", (e) => {

        readFile(e);
      });

      $("#documento_tipo").addEventListener("change", (e) => {

        let selectValue = e.target.value;
        changLength(selectValue);
      })

      $("#documento_nro").addEventListener("input", (e) => {



        clearTimeout(timer);

        timer = setTimeout(() => {

          let inputValue = e.target.value;
          if (inputValue) {

            getPerson(inputValue);
          }

        }, 1500);
      })

      await getUser(idusuario);
      await getRols();

      'use strict'; //=> USO ESTRICTO POR POLITICAS DE SEGURIDAD EN EL FORMULARIO

      //SELECCIONA TODOS LOS ELEMENTOS DEL FORMULARIO QUE TIENE LA CLASE "needs-validation
      const forms = document.querySelectorAll(".needs-validation");

      Array.from(forms).forEach(form => {
        form.addEventListener('submit', event => {

          if (!form.checkValidity()) {
            event.preventDefault() //=> FRENA EL ENVÍO DEL FORMULARIO
            event.stopPropagation() //=> FRENA LA PROPAGACIÓN DE DATOS EN EL FORMULARIO
            form.reportValidity();
          } else {
            event.preventDefault();

            editUser(idusuario);
            /* sAlert.sweetConfirm("Datos nuevos","¿Deseas actualizar el registro?",()=>{
                
            }); */
          }

          form.classList.add('was-validated') //=> AGREGA ESTA CLASE A LOS ELEMENTOS DEL FORMULARIO(MUESTRA LOS COMENTARIOS)
        }, false) //=> ESTE TERCER ARGUMENTO INDICA QUE EL EVENTO NO SE ESTA CAPTURANDO EN LA ""FASE DE CAPTURA" SINO EN "PROPAGACIÓN NORMAL"
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