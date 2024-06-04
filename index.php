<?php

if(isset($_SESSION["status"]) && $_SESSION["status"]){

  header("Location: Views/dashboad.html");
}
?>
<!DOCTYPE html>
<html lang="es">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="assets/img/iconos/Isotipo.png">
  <link rel="icon" type="image/png" href="assets/img/iconos/Isotipo.png">
  <title>
    My Aisoft
  </title>
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="Viewstyle" href="assets/css/soft-ui-dashboard.css?v=1.0.7" rel="stylesheet" />
  <!-- Nepcha Analytics (nepcha.com) -->
  <!-- Nepcha is a easy-to-use web analytics. No cookies and fully compliant with GDPR, CCPA and PECR. -->
  <script defer data-site="YOUR_DOMAIN_HERE" src="https://api.nepcha.com/js/nepcha-analytics.js"></script>
</head>

<body class="">

  <main class="main-content  mt-0">
    <section>
      <div class="page-header min-vh-75">
        <div class="container">
          <div class="row">
            <div class="col-xl-4 col-lg-5 col-md-6 d-flex flex-column mx-auto">
              <div class="card card-plain mt-8">
                <div class="card-header pb-0 text-left bg-transparent">
                  <h3 class="font-weight-bolder text-info text-gradient">Bienvenido</h3>
                  <p class="mb-0">Ingresa tus credenciales para iniciar sesión</p>
                </div>
                <div class="card-body">
                  <form class="row needs-validation" novalidate>
                    <label>Correo</label>
                    <div class="mb-3">
                      <input type="email" class="form-control" id="correo" placeholder="Correo" aria-label="Email" aria-describedby="email-addon" required>
                    </div>
                    <div class="invalid-feedback">
                      Por favor ingresa un correo valido
                    </div>
                    <div class="valid-feedback">
                      Correo valido
                    </div>
                    <label>Contraseña</label>
                    <div class="mb-3">
                      <input type="password" class="form-control" id="contrasenia" placeholder="Contraseña" aria-label="Password" aria-describedby="password-addon" required>
                    </div>
                    <div class="invalid-feedback">
                      Ingresa una contraseña valida
                    </div>
                    <div class="valid-feedback">
                      Contraseña valida
                    </div>
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" id="rememberMe" checked="">
                      <label class="form-check-label" for="rememberMe">Recuerdame</label>
                    </div>
                    <div class="text-center">
                      <button type="submit" class="btn bg-gradient-info w-100 mt-4 mb-0" id="iniciar-sesion">Iniciar sesión</button>
                    </div>
                  </form>
                </div><!-- 
                <div class="card-footer text-center pt-0 px-lg-2 px-1">
                  <p class="mb-4 text-sm mx-auto">
                    Don't have an account?
                    <a href="javascript:;" class="text-info text-gradient font-weight-bold">Sign up</a>
                  </p>
                </div> -->
              </div>
            </div>
            <div class="col-md-6  d-flex justify-content-center align-content-center">
              <img src="assets/img/iconos/Isotipo.png" alt="">
            </div>
          </div>
        </div>
      </div>
    </section>
  </main>
  <!-- -------- START FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
  <footer class="footer py-5">
    <div class="container">
      <div class="row">
        <!-- REFERENCIAS -->
        <!-- <div class="col-lg-8 mb-4 mx-auto text-center">
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
            Company
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
            About Us
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
            Team
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
            Products
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
            Blog
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-5 me-3 mb-sm-0 mb-2">
            Pricing
          </a>
        </div> -->

        <!-- ICONOS -->
        <!-- <div class="col-lg-8 mx-auto text-center mb-4 mt-2">
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-4 me-4">
            <span class="text-lg fab fa-dribbble"></span>
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-4 me-4">
            <span class="text-lg fab fa-twitter"></span>
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-4 me-4">
            <span class="text-lg fab fa-instagram"></span>
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-4 me-4">
            <span class="text-lg fab fa-pinterest"></span>
          </a>
          <a href="javascript:;" target="_blank" class="text-secondary me-xl-4 me-4">
            <span class="text-lg fab fa-github"></span>
          </a>
        </div> -->
      </div>
      <div class="row">
        <div class="col-8 mx-auto text-center mt-1">
          <p class="mb-0 text-secondary">
            Copyright © <script>
              document.write(new Date().getFullYear())
            </script> auspiciado por
            <a href="https://aifperu.com/" class="font-weight-bold" target="_blank">A.I.F Contratistas Generales S.A.C</a>
            (sistema web).
          </p>
        </div>
      </div>
    </div>
  </footer>
  <!-- -------- END FOOTER 3 w/ COMPANY DESCRIPTION WITH LINKS & SOCIAL ICONS & COPYRIGHT ------- -->
  <!--   Core JS Files   -->
  <!-- <script scr="./assets/js/globalFunctions.js"></script>
  <script scr="./assets/js/sweetAlert.js"></script>
  <script src="./assets/js/core/popper.min.js"></script>
  <script src="./assets/js/core/bootstrap.min.js"></script>
  <script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="./assets/js/plugins/smooth-scrollbar.min.js"></script> -->

  <!-- SWEET ALERT -->
  <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

  <script src="./assets/js/core/popper.min.js"></script>
  <script src="./assets/js/core/bootstrap.min.js"></script>
  <script src="./assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="./assets/js/plugins/smooth-scrollbar.min.js"></script>
  <script src="./assets/js/plugins/chartjs.min.js"></script>
  <script src="./assets/js/globalFunctions.js"></script>
  <script src="./assets/js/sweetAlert.js"></script>
  <script>
    document.addEventListener("DOMContentLoaded", ()=>{

      const global = new FunGlobal();
      const sAlert = new Alert();

      const $ = id => document.querySelector(id);
      const $All = id => document.querySelectorAll(id);


      async function userLogin() {

        try {
          let url = "Controllers/user.controller.php";

          let params = new FormData();
          params.append("action", "loginUser");
          params.append("correo", $("#correo").value);
          params.append("contrasenia", $("#contrasenia").value);

          let result = await global.sendAction(url, params);
          
          if(!result.status){
            console.log(result)
            sAlert.sweetError("Error", result.message);

          }else{

            sAlert.sweetSuccess("Éxito","Acceso correcto");

            setTimeout(() => {
              
              window.location.href = "./Views/dashboard.html";
            },1500);
          }

        } catch (e) {

        }
      }


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
              userLogin(); //Ejecuta la función
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
  <script src="assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
</body>

</html>