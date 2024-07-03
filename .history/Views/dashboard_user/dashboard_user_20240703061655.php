<?php include "../sidebar/permissions.php" ?>

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
                        <li class="breadcrumb-item text-sm text-dark active" aria-current="page">Dashboard</li>
                    </ol>
                    <h6 class="font-weight-bolder mb-0" id="cabezera">DASHBOARD </h6>
                </nav>
                <div class="collapse navbar-collapse mt-sm-0 mt-2 me-md-0 me-sm-4" id="navbar">

                    <ul class="navbar-nav  justify-content-end">

                        <!-- DATOS DEL USUARIO -->
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
        <div class="container-fluid py-4">
            <div class="row">
                <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4"></div>
            </div>

            <div class="row mt-4">
                <div class="col-lg-6 mb-lg-0 mb-4">
                    <div class="card z-index-2">
                        <div class="card-body">
                            <div class="bg-gradient-dark border-radius-lg py-3 pe-1 mb-3">

                                <div class="chart">
                                    <canvas id="chart-line" class="chart-canvas" height="170"></canvas>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <div class="col-lg-6 mb-lg-0 mb-4">
                    <div class="card z-index-2">
                        <div class="card-body p-3">
                            <div class="bg-gradient-dark border-radius-lg py-3 pe-1 mb-3 d-flex justify-content-center align-items-center" style="height: 100%">

                                <div class="chart">
                                    <canvas id="chart-pie" class="chart-canvas p-4"></canvas>
                                </div>
                            </div>
                            <div class="bg-gradient-dark border-radius-lg py-3 pe-1 mb-3 d-flex justify-content-center align-items-center mt-2" style="height: 100%">

                                <div class="chart">
                                    <canvas id="chart-line2" class="chart-canvas p-4"></canvas>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <footer class="footer pt-3">
                <div class="container-fluid">
                    <div class="row align-items-center justify-content-lg-between">
                        <div class="col-lg-6 mb-lg-0 mb-4">
                            <div class="copyright text-center text-sm text-muted text-lg-start">
                                ©
                                <script>
                                    document.write(new Date().getFullYear());
                                </script>
                                , made with <i class="fa fa-heart"></i> by
                                <a href="https://www.creative-tim.com" class="font-weight-bold" target="_blank">Creative Tim</a>
                                for a better web.
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <ul class="nav nav-footer justify-content-center justify-content-lg-end">
                                <li class="nav-item">
                                    <a href="https://www.creative-tim.com" class="nav-link text-muted" target="_blank">Creative Tim</a>
                                </li>
                                <li class="nav-item">
                                    <a href="https://www.creative-tim.com/presentation" class="nav-link text-muted" target="_blank">About
                                        Us</a>
                                </li>
                                <li class="nav-item">
                                    <a href="https://www.creative-tim.com/blog" class="nav-link text-muted" target="_blank">Blog</a>
                                </li>
                                <li class="nav-item">
                                    <a href="https://www.creative-tim.com/license" class="nav-link pe-0 text-muted" target="_blank">License</a>
                                </li>
                            </ul>
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
        <div class="card shadow-lg">
            <div class="card-header pb-0 pt-3">
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
            <hr class="horizontal dark my-1" />
            <div class="card-body pt-sm-3 pt-0">
                <!-- Sidebar Backgrounds -->
                <div>
                    <h6 class="mb-0">Sidebar Colors</h6>
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
                    <h6 class="mb-0">Sidenav Type</h6>
                    <p class="text-sm">Choose between 2 different sidenav types.</p>
                </div>
                <div class="d-flex">
                    <button class="btn bg-gradient-primary w-100 px-3 mb-2 active" data-class="bg-transparent" onclick="sidebarType(this)">
                        Transparent
                    </button>
                    <button class="btn bg-gradient-primary w-100 px-3 mb-2 ms-2" data-class="bg-white" onclick="sidebarType(this)">
                        White
                    </button>
                </div>
                <p class="text-sm d-xl-none d-block mt-2">
                    You can change the sidenav type just on desktop view.
                </p>
                <!-- Navbar Fixed -->
                <div class="mt-3">
                    <h6 class="mb-0">Navbar Fixed</h6>
                </div>
                <div class="form-check form-switch ps-0">
                    <input class="form-check-input mt-1 ms-auto" type="checkbox" id="navbarFixed" onclick="navbarFixed(this)" />
                </div>
                <hr class="horizontal dark my-sm-4" />
                <a class="btn bg-gradient-dark w-100" href="https://www.creative-tim.com/product/soft-ui-dashboard">Free
                    Download</a>
                <a class="btn btn-outline-dark w-100" href="https://www.creative-tim.com/learning-lab/bootstrap/license/soft-ui-dashboard">View documentation</a>
                <div class="w-100 text-center">
                    <a class="github-button" href="https://github.com/creativetimofficial/soft-ui-dashboard" data-icon="octicon-star" data-size="large" data-show-count="true" aria-label="Star creativetimofficial/soft-ui-dashboard on GitHub">Star</a>
                    <h6 class="mt-3">Thank you for sharing!</h6>
                    <a href="https://twitter.com/intent/tweet?text=Check%20Soft%20UI%20Dashboard%20made%20by%20%40CreativeTim%20%23webdesign%20%23dashboard%20%23bootstrap5&amp;url=https%3A%2F%2Fwww.creative-tim.com%2Fproduct%2Fsoft-ui-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
                        <i class="fab fa-twitter me-1" aria-hidden="true"></i> Tweet
                    </a>
                    <a href="https://www.facebook.com/sharer/sharer.php?u=https://www.creative-tim.com/product/soft-ui-dashboard" class="btn btn-dark mb-0 me-2" target="_blank">
                        <i class="fab fa-facebook-square me-1" aria-hidden="true"></i>
                        Share
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!--   Core JS Files   -->
    <script src="../../assets/js/core/popper.min.js"></script>
    <script src="../../assets/js/core/bootstrap.min.js"></script>
    <script src="../../assets/js/plugins/perfect-scrollbar.min.js"></script>
    <script src="../../assets/js/plugins/smooth-scrollbar.min.js"></script>
    <script src="../../node_modules/chart.js/dist/chart.umd.js"></script>
    <script src="../../assets/js/globalFunctions.js"></script>
    <script>
        document.addEventListener("DOMcontentLoaded", () => {

        });
        const global = new FunGlobal();

        const $ = (id) => global.$(id);
        const $All = (id) => global.$All(id);

        //Gráfico de ventas
        const chartSales = $("#chart-line").getContext("2d");
        const chartRefunds = $("#chart-line2").getContext("2d");
        const chartpie = $("#chart-pie").getContext("2d");

        async function renderPieChart(array) {
            new Chart(chartpie, {
                type: "pie",
                data: {
                    labels: ["Vendidos", "Separados", "Sin vender"],
                    datasets: [{
                        label: "ventas",
                        tension: 0.4,
                        borderWidth: 0,
                        borderRadius: 4,
                        borderSkipped: false,
                        backgroundColor: colors,
                        data: [array.vendidos, array.separados, array.no_vendidos],
                        maxBarThickness: 6,
                    }, ],
                },

                options: {
                    responsive: true,
                    maintainAspectRatio: false,
                    plugins: {
                        legend: {
                            display: true,
                            labels: {
                                color: "#fff",
                            },
                        },
                    },
                    interaction: {
                        intersect: false,
                        mode: "index",
                    },
                    scales: {
                        x: {
                            display: false,
                            grid: {
                                drawBorder: false,
                                display: false,
                                drawOnChartArea: false,
                                drawTicks: false,
                            },
                            ticks: {
                                display: true,
                                texTransform: "uppercase",
                                color: "#fff",
                            },
                        },
                    },
                    plugins: {
                        legend: {
                            labels: {
                                color: "#fff",
                                font: {

                                    size: 15
                                }
                            }
                        },
                        title: {
                            display: true,
                            text: "Estado actual de los lotes",
                            font: {
                                size: 20,
                                weight: "bold",
                            },
                            color: "#fff",
                            padding: 10
                        }
                    }
                },
            });
        }

        async function renderChartSales(array) {
            new Chart(chartSales, {
                type: "line",
                data: {
                    labels: array.map((venta) => venta.mes),
                    datasets: [{
                        label: "Ventas",
                        borderSkipped: false,
                        data: array.map((venta) => venta.cantidad)
                    }, ],
                },
                options: {

                    responsive: true,
                    elements: {
                        line: {
                            borderWidth: 1,
                            backgroundColor: "#fff",
                            borderColor: "#fff",
                            tension: 0
                        },
                        point: {
                            backgroundColor: "#fff",
                            radius: 5
                        },
                    },
                    scales: {
                        x: {
                            grid: {
                                display: true,
                                lineWidth: 0.1,
                                color: "#fff"
                            },
                            ticks: {
                                color: "#fff"
                            }
                        },
                        y: {
                            grid: {
                                display: true,
                                color: "#fff",
                                lineWidth: 0.1
                            },
                            ticks: {
                                color: "#fff"
                            }
                        }
                    },
                    plugins: {

                        legend: {
                            dispay: false,
                            position: "top",
                            labels: {

                                color: "#fff"
                            }
                        },

                        title: {
                            display: true,
                            text: "Ventas concretadas",
                            font: {
                                weight: "bold",
                                size: 20
                            },
                            color: "#fff"
                        }
                    }
                }
            });
        }

        //Obtiene las métricas generales de los lotes
        async function listAll() {
            try {
                let url = `../../Controllers/metric.controller.php`;
                let params = new FormData();

                params.append("action", "listAll");

                let result = await global.sendAction(url, params);

                if (result) {
                    console.log(result);
                    renderPieChart(result);
                }
            } catch (e) {
                console.error(e);
            }
        }

        // * Renderiza las devoluciones en el gráfico
        async function chartRefunds(refunds) {

            let refundsContracts = [];
            let refundSeparations = [];

            refunds.filter(result => {
                if (result.tipo_devolucion == 'POR CONTRATO') refundsContracts.push(result);
                else refundSeparations.push(result);
            });

            new Chart(chartRefunds, {

                type: "line",
                data: {
                    labels: refunds.map(refund => refund.tipo_devolucion),
                    datasets:[{
                        label: "Devolución por contrato",
                        data: refundsContracts.
                    }]
                },
                options: {},
                plugins: {}
            });
        }

        //Oteiene los datos de las ventas durante el año
        async function listYearlySales() {
            try {
                let url = `../../Controllers/contract.controller.php`;
                let params = new FormData();

                params.append("action", "getSales");

                let results = await global.sendAction(url, params);

                if (results.length > 0) {

                    let months = [
                        "Ene",
                        "Feb",
                        "Mar",
                        "Abr",
                        "May",
                        "Jun",
                        "Jul",
                        "Agos",
                        "Sept",
                        "Oct",
                        "Nov",
                        "Dic",
                    ];

                    // ! Datos de prueba BORRAR
                    let nuevas_ventas = [{
                            mes: 2,
                            cantidad: 15
                        },
                        {
                            mes: 9,
                            cantidad: 13
                        },
                        {
                            mes: 3,
                            cantidad: 12
                        },
                        {
                            mes: 2,
                            cantidad: 12
                        },
                        {
                            mes: 8,
                            cantidad: 19
                        },
                        {
                            mes: 5,
                            cantidad: 18
                        },
                        {
                            mes: 4,
                            cantidad: 15
                        },
                    ]

                    nuevas_ventas.forEach(currentItem => {

                        results.push(currentItem);
                    });

                    // ! FIN DE DATOS DE PRUEBA

                    results.forEach(venta => {

                        if (venta.mes > 0 && venta.mes < 13) {
                            venta.mes = months[venta.mes - 1];
                            console.log('venta.mes :>> ', venta.mes);
                        }
                    });

                    renderChartSales(results);
                }
            } catch (e) {
                console.error(e);
            }
        }

        // * OBtiene las devoluciones
        async function getRefunds() {

            try {

                let url = "../../Controllers/refund.controller.php";
                let params = new FormData();

                params.append("action", "renderChart");

                let results = await global.sendAction(url, params);

                if (results.length > 0) {

                    await chartRefunds(results);
                }
            } catch (e) {
                console.error(e);
            }
        }

        async function startUI() {
            try {
                await getRefunds
                await listYearlySales();
                await listAll();
            } catch (e) {
                console.error(e);
            }
        }

        startUI();
    </script>
    <script>
        var win = navigator.platform.indexOf("Win") > -1;
        if (win && document.querySelector("#sidenav-scrollbar")) {
            var options = {
                damping: "0.5",
            };
            Scrollbar.init(document.querySelector("#sidenav-scrollbar"), options);
        }
    </script>
    <!-- Github buttons -->
    <script async defer src="https://buttons.github.io/buttons.js"></script>
    <!-- Control Center for Soft Dashboard: parallax effects, scripts for the example Views etc -->
    <script src="../../assets/js/soft-ui-dashboard.min.js?v=1.0.7"></script>
</body>

</html>