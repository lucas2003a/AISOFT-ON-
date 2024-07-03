<?php 


$permissions = $_SESSION["permissions"];
$modules =  [
    "dashboard_admin" => [
        "name" => "Dashboard",
        "icon" => "<svg width='12px' height='12px' viewBox='0 0 45 40' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
                <title>shop </title>
                <g stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>
                  <g transform='translate(-1716.000000, -439.000000)' fill='#FFFFFF' fill-rule='nonzero'>
                    <g transform='translate(1716.000000, 291.000000)'>
                      <g transform='translate(0.000000, 148.000000)'>
                        <path class='color-background opacity-6' d='M46.7199583,10.7414583 L40.8449583,0.949791667 C40.4909749,0.360605034 39.8540131,0 39.1666667,0 L7.83333333,0 C7.1459869,0 6.50902508,0.360605034 6.15504167,0.949791667 L0.280041667,10.7414583 C0.0969176761,11.0460037 -1.23209662e-05,11.3946378 -1.23209662e-05,11.75 C-0.00758042603,16.0663731 3.48367543,19.5725301 7.80004167,19.5833333 L7.81570833,19.5833333 C9.75003686,19.5882688 11.6168794,18.8726691 13.0522917,17.5760417 C16.0171492,20.2556967 20.5292675,20.2556967 23.494125,17.5760417 C26.4604562,20.2616016 30.9794188,20.2616016 33.94575,17.5760417 C36.2421905,19.6477597 39.5441143,20.1708521 42.3684437,18.9103691 C45.1927731,17.649886 47.0084685,14.8428276 47.0000295,11.75 C47.0000295,11.3946378 46.9030823,11.0460037 46.7199583,10.7414583 Z'></path>
                        <path class='color-background' d='M39.198,22.4912623 C37.3776246,22.4928106 35.5817531,22.0149171 33.951625,21.0951667 L33.92225,21.1107282 C31.1430221,22.6838032 27.9255001,22.9318916 24.9844167,21.7998837 C24.4750389,21.605469 23.9777983,21.3722567 23.4960833,21.1018359 L23.4745417,21.1129513 C20.6961809,22.6871153 17.4786145,22.9344611 14.5386667,21.7998837 C14.029926,21.6054643 13.533337,21.3722507 13.0522917,21.1018359 C11.4250962,22.0190609 9.63246555,22.4947009 7.81570833,22.4912623 C7.16510551,22.4842162 6.51607673,22.4173045 5.875,22.2911849 L5.875,44.7220845 C5.875,45.9498589 6.7517757,46.9451667 7.83333333,46.9451667 L19.5833333,46.9451667 L19.5833333,33.6066734 L27.4166667,33.6066734 L27.4166667,46.9451667 L39.1666667,46.9451667 C40.2482243,46.9451667 41.125,45.9498589 41.125,44.7220845 L41.125,22.2822926 C40.4887822,22.4116582 39.8442868,22.4815492 39.198,22.4912623 Z'></path>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>",
        "url" => "../dashboard_admin/dashboard_admin.php",
        "active" => false
    ],
    "dashboard_user" => [
        "name" => "Dashboard",
        "icon" => "<svg width='12px' height='12px' viewBox='0 0 45 40' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
                <title>shop </title>
                <g stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>
                  <g transform='translate(-1716.000000, -439.000000)' fill='#FFFFFF' fill-rule='nonzero'>
                    <g transform='translate(1716.000000, 291.000000)'>
                      <g transform='translate(0.000000, 148.000000)'>
                        <path class='color-background opacity-6' d='M46.7199583,10.7414583 L40.8449583,0.949791667 C40.4909749,0.360605034 39.8540131,0 39.1666667,0 L7.83333333,0 C7.1459869,0 6.50902508,0.360605034 6.15504167,0.949791667 L0.280041667,10.7414583 C0.0969176761,11.0460037 -1.23209662e-05,11.3946378 -1.23209662e-05,11.75 C-0.00758042603,16.0663731 3.48367543,19.5725301 7.80004167,19.5833333 L7.81570833,19.5833333 C9.75003686,19.5882688 11.6168794,18.8726691 13.0522917,17.5760417 C16.0171492,20.2556967 20.5292675,20.2556967 23.494125,17.5760417 C26.4604562,20.2616016 30.9794188,20.2616016 33.94575,17.5760417 C36.2421905,19.6477597 39.5441143,20.1708521 42.3684437,18.9103691 C45.1927731,17.649886 47.0084685,14.8428276 47.0000295,11.75 C47.0000295,11.3946378 46.9030823,11.0460037 46.7199583,10.7414583 Z'></path>
                        <path class='color-background' d='M39.198,22.4912623 C37.3776246,22.4928106 35.5817531,22.0149171 33.951625,21.0951667 L33.92225,21.1107282 C31.1430221,22.6838032 27.9255001,22.9318916 24.9844167,21.7998837 C24.4750389,21.605469 23.9777983,21.3722567 23.4960833,21.1018359 L23.4745417,21.1129513 C20.6961809,22.6871153 17.4786145,22.9344611 14.5386667,21.7998837 C14.029926,21.6054643 13.533337,21.3722507 13.0522917,21.1018359 C11.4250962,22.0190609 9.63246555,22.4947009 7.81570833,22.4912623 C7.16510551,22.4842162 6.51607673,22.4173045 5.875,22.2911849 L5.875,44.7220845 C5.875,45.9498589 6.7517757,46.9451667 7.83333333,46.9451667 L19.5833333,46.9451667 L19.5833333,33.6066734 L27.4166667,33.6066734 L27.4166667,46.9451667 L39.1666667,46.9451667 C40.2482243,46.9451667 41.125,45.9498589 41.125,44.7220845 L41.125,22.2822926 C40.4887822,22.4116582 39.8442868,22.4815492 39.198,22.4912623 Z'></path>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>",
        "url" => "../dashboard_user/dashboard_user.php",
        "active" => false
    ],
    "budgets" => [
        "name" => "Presupuestos",
        "icon" => "<svg width='12px' height='12px' viewBox='0 0 42 42' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
                <title>office</title>
                <g stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>
                  <g transform='translate(-1869.000000, -293.000000)' fill='#FFFFFF' fill-rule='nonzero'>
                    <g transform='translate(1716.000000, 291.000000)'>
                      <g id='office' transform='translate(153.000000, 2.000000)'>
                        <path class='color-background opacity-6' d='M12.25,17.5 L8.75,17.5 L8.75,1.75 C8.75,0.78225 9.53225,0 10.5,0 L31.5,0 C32.46775,0 33.25,0.78225 33.25,1.75 L33.25,12.25 L29.75,12.25 L29.75,3.5 L12.25,3.5 L12.25,17.5 Z'></path>
                        <svg class='color-background' xmlns='http://www.w3.org/2000/svg' width='50' height='50' fill='currentColor' class='bi bi-calculator' viewBox='0 0 16 16'>
                          <path d='M12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z' />
                          <path d='M4 2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5zm0 4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5z' />
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>",
        "url" => "../budgets/index.php",
        "active" => false
    ],
    "clients" => [
        "name" => "Clientes",
        "icon" => "<svg width='12px' height='12px' viewBox='0 0 42 42' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
                <title>office</title>
                <g stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>
                  <g transform='translate(-1869.000000, -293.000000)' fill='#FFFFFF' fill-rule='nonzero'>
                    <g transform='translate(1716.000000, 291.000000)'>
                      <g id='office' transform='translate(153.000000, 2.000000)'>
                        <path class='color-background opacity-6' d='M12.25,17.5 L8.75,17.5 L8.75,1.75 C8.75,0.78225 9.53225,0 10.5,0 L31.5,0 C32.46775,0 33.25,0.78225 33.25,1.75 L33.25,12.25 L29.75,12.25 L29.75,3.5 L12.25,3.5 L12.25,17.5 Z'></path>
                        <svg class='color-background' xmlns='http://www.w3.org/2000/svg' width='40' height='40' fill='currentColor' class='bi bi-person-lines-fill' viewBox='0 0 16 16'>
                          <path d='M6 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5 6s-1 0-1-1 1-4 6-4 6 3 6 4-1 1-1 1zM11 3.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5m.5 2.5a.5.5 0 0 0 0 1h4a.5.5 0 0 0 0-1zm2 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1zm0 3a.5.5 0 0 0 0 1h2a.5.5 0 0 0 0-1z' />
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>",
        "url" => "../clients/index.php",
        "active" => false
    ],
    "contracts" => [
        "name" => "Contratos",
        "icon" => "<svg width='12px' height='12px' viewBox='0 0 42 42' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
                <title>office</title>
                <g stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>
                  <g transform='translate(-1869.000000, -293.000000)' fill='#FFFFFF' fill-rule='nonzero'>
                    <g transform='translate(1716.000000, 291.000000)'>
                      <g id='office' transform='translate(153.000000, 2.000000)'>
                        <svg class='color-background' xmlns='http://www.w3.org/2000/svg' width='50' height='43' fill='currentColor' class='bi bi-file-earmark-font' viewBox='0 0 16 16'>
                          <path d='M10.943 6H5.057L5 8h.5c.18-1.096.356-1.192 1.694-1.235l.293-.01v5.09c0 .47-.1.582-.898.655v.5H9.41v-.5c-.803-.073-.903-.184-.903-.654V6.755l.298.01c1.338.043 1.514.14 1.694 1.235h.5l-.057-2z' />
                          <path d='M14 4.5V14a2 2 0 0 1-2 2H4a2 2 0 0 1-2-2V2a2 2 0 0 1 2-2h5.5zm-3 0A1.5 1.5 0 0 1 9.5 3V1H4a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V4.5z' />
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>",
        "url" => "../contracts/index.php",
        "active" => false
    ],
    "monitoring" => [
        "name" => "Monitoreo",
        "icon" => "<svg width='12px' height='12px' viewBox='0 0 42 42' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
                <title>office</title>
                <g stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>
                  <g transform='translate(-1869.000000, -293.000000)' fill='#FFFFFF' fill-rule='nonzero'>
                    <g transform='translate(1716.000000, 291.000000)'>
                      <g id='office' transform='translate(153.000000, 2.000000)'>
                        <svg class='color-background' xmlns='http://www.w3.org/2000/svg' width='50' height='50' fill='currentColor' class='bi bi-eye' viewBox='0 0 16 16'>
                          <path d='M16 8s-3-5.5-8-5.5S0 8 0 8s3 5.5 8 5.5S16 8 16 8M1.173 8a13 13 0 0 1 1.66-2.043C4.12 4.668 5.88 3.5 8 3.5s3.879 1.168 5.168 2.457A13 13 0 0 1 14.828 8q-.086.13-.195.288c-.335.48-.83 1.12-1.465 1.755C11.879 11.332 10.119 12.5 8 12.5s-3.879-1.168-5.168-2.457A13 13 0 0 1 1.172 8z' />
                          <path d='M8 5.5a2.5 2.5 0 1 0 0 5 2.5 2.5 0 0 0 0-5M4.5 8a3.5 3.5 0 1 1 7 0 3.5 3.5 0 0 1-7 0' />
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>",
        "url" => "../monitoring/index.php",
        "active" => false
    ],
    "projects" => [
        "name" => "Proyectos",
        "icon" => "<svg width='12px' height='12px' viewBox='0 0 42 42' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
                <title>office</title>
                <g stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>
                  <g transform='translate(-1869.000000, -293.000000)' fill='#FFFFFF' fill-rule='nonzero'>
                    <g transform='translate(1716.000000, 291.000000)'>
                      <g id='office' transform='translate(153.000000, 2.000000)'>
                        <path class='color-background opacity-6' d='M12.25,17.5 L8.75,17.5 L8.75,1.75 C8.75,0.78225 9.53225,0 10.5,0 L31.5,0 C32.46775,0 33.25,0.78225 33.25,1.75 L33.25,12.25 L29.75,12.25 L29.75,3.5 L12.25,3.5 L12.25,17.5 Z'></path>
                        <svg class='color-background' xmlns='http://www.w3.org/2000/svg' width='50' height='50' fill='currentColor' class='bi bi-calculator' viewBox='0 0 16 16'>
                          <path d='M12 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1zM4 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2z' />
                          <path d='M4 2.5a.5.5 0 0 1 .5-.5h7a.5.5 0 0 1 .5.5v2a.5.5 0 0 1-.5.5h-7a.5.5 0 0 1-.5-.5zm0 4a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm3-6a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v1a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5zm0 3a.5.5 0 0 1 .5-.5h1a.5.5 0 0 1 .5.5v4a.5.5 0 0 1-.5.5h-1a.5.5 0 0 1-.5-.5z' />
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>",
        "url" => "../projects/index.php",
        "active" => false
    ],
    "profile" => [
        "name" => "Perfil",
        "icon" => "<svg width='12px' height='12px' viewBox='0 0 46 42' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
                <title>customer-support</title>
                <g stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>
                  <g transform='translate(-1717.000000, -291.000000)' fill='#FFFFFF' fill-rule='nonzero'>
                    <g transform='translate(1716.000000, 291.000000)'>
                      <g transform='translate(1.000000, 0.000000)'>
                        <path class='color-background opacity-6' d='M45,0 L26,0 C25.447,0 25,0.447 25,1 L25,20 C25,20.379 25.214,20.725 25.553,20.895 C25.694,20.965 25.848,21 26,21 C26.212,21 26.424,20.933 26.6,20.8 L34.333,15 L45,15 C45.553,15 46,14.553 46,14 L46,1 C46,0.447 45.553,0 45,0 Z'></path>
                        <path class='color-background' d='M22.883,32.86 C20.761,32.012 17.324,31 13,31 C8.676,31 5.239,32.012 3.116,32.86 C1.224,33.619 0,35.438 0,37.494 L0,41 C0,41.553 0.447,42 1,42 L25,42 C25.553,42 26,41.553 26,41 L26,37.494 C26,35.438 24.776,33.619 22.883,32.86 Z'></path>
                        <path class='color-background' d='M13,28 C17.432,28 21,22.529 21,18 C21,13.589 17.411,10 13,10 C8.589,10 5,13.589 5,18 C5,22.529 8.568,28 13,28 Z'></path>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>",
        "url" => "../profile/index.php",
        "active" => false
    ],
    "quotas" => [
        "name" => "Cuotas",
        "icon" => "<svg width='12px' height='12px' viewBox='0 0 42 42' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
                <title>office</title>
                <g stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>
                  <g transform='translate(-1869.000000, -293.000000)' fill='#FFFFFF' fill-rule='nonzero'>
                    <g transform='translate(1716.000000, 291.000000)'>
                      <g id='office' transform='translate(153.000000, 2.000000)'>
                        <svg class='color-background' xmlns='http://www.w3.org/2000/svg' width='50' height='50' fill='currentColor' class='bi bi-credit-card' viewBox='0 0 16 16'>
                          <path d='M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v1h14V4a1 1 0 0 0-1-1zm13 4H1v5a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1z' />
                          <path d='M2 10a1 1 0 0 1 1-1h1a1 1 0 0 1 1 1v1a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z' />
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>",
        "url" => "../quotas/index.php",
        "active" => false
    ],
    "refunds" => [
        "name" => "Devoluciones",
        "icon" => "<svg width='12px' height='12px' viewBox='0 0 42 42' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
                <title>office</title>
                <g stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>
                  <g transform='translate(-1869.000000, -293.000000)' fill='#FFFFFF' fill-rule='nonzero'>
                    <g transform='translate(1716.000000, 291.000000)'>
                      <g id='office' transform='translate(153.000000, 2.000000)'>
                        <svg class='color-background' xmlns='http://www.w3.org/2000/svg' width='50' height='50' fill='currentColor' class='bi bi-backspace-fill' viewBox='0 0 16 16'>
                          <path d='M15.683 3a2 2 0 0 0-2-2h-7.08a2 2 0 0 0-1.519.698L.241 7.35a1 1 0 0 0 0 1.302l4.843 5.65A2 2 0 0 0 6.603 15h7.08a2 2 0 0 0 2-2zM5.829 5.854a.5.5 0 1 1 .707-.708l2.147 2.147 2.146-2.147a.5.5 0 1 1 .707.708L9.39 8l2.146 2.146a.5.5 0 0 1-.707.708L8.683 8.707l-2.147 2.147a.5.5 0 0 1-.707-.708L7.976 8z' />
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>",
        "url" => "../refunds/index.php",
        "active" => false
    ],
    "separations" => [
        "name" => "Separaciones",
        "icon" => "<svg width='12px' height='12px' viewBox='0 0 42 42' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
                <title>office</title>
                <g stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>
                  <g transform='translate(-1869.000000, -293.000000)' fill='#FFFFFF' fill-rule='nonzero'>
                    <g transform='translate(1716.000000, 291.000000)'>
                      <g id='office' transform='translate(153.000000, 2.000000)'>
                        <svg class='color-background' xmlns='http://www.w3.org/2000/svg' width='50' height='50' fill='currentColor' class='bi bi-list-stars' viewBox='0 0 16 16'>
                          <path fill-rule='evenodd' d='M5 11.5a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5m0-4a.5.5 0 0 1 .5-.5h9a.5.5 0 0 1 0 1h-9a.5.5 0 0 1-.5-.5' />
                          <path d='M2.242 2.194a.27.27 0 0 1 .516 0l.162.53c.035.115.14.194.258.194h.551c.259 0 .37.333.164.493l-.468.363a.28.28 0 0 0-.094.3l.173.569c.078.256-.213.462-.423.3l-.417-.324a.27.27 0 0 0-.328 0l-.417.323c-.21.163-.5-.043-.423-.299l.173-.57a.28.28 0 0 0-.094-.299l-.468-.363c-.206-.16-.095-.493.164-.493h.55a.27.27 0 0 0 .259-.194zm0 4a.27.27 0 0 1 .516 0l.162.53c.035.115.14.194.258.194h.551c.259 0 .37.333.164.493l-.468.363a.28.28 0 0 0-.094.3l.173.569c.078.255-.213.462-.423.3l-.417-.324a.27.27 0 0 0-.328 0l-.417.323c-.21.163-.5-.043-.423-.299l.173-.57a.28.28 0 0 0-.094-.299l-.468-.363c-.206-.16-.095-.493.164-.493h.55a.27.27 0 0 0 .259-.194zm0 4a.27.27 0 0 1 .516 0l.162.53c.035.115.14.194.258.194h.551c.259 0 .37.333.164.493l-.468.363a.28.28 0 0 0-.094.3l.173.569c.078.255-.213.462-.423.3l-.417-.324a.27.27 0 0 0-.328 0l-.417.323c-.21.163-.5-.043-.423-.299l.173-.57a.28.28 0 0 0-.094-.299l-.468-.363c-.206-.16-.095-.493.164-.493h.55a.27.27 0 0 0 .259-.194z' />
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>",
        "url" => "../separations/index.php",
        "active" => false
    ],
    "users" => [
        "name" => "Usuarios",
        "icon" => "<svg width='12px' height='12px' viewBox='0 0 42 42' version='1.1' xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink'>
                <title>office</title>
                <g stroke='none' stroke-width='1' fill='none' fill-rule='evenodd'>
                  <g transform='translate(-1869.000000, -293.000000)' fill='#FFFFFF' fill-rule='nonzero'>
                    <g transform='translate(1716.000000, 291.000000)'>
                      <g id='office' transform='translate(153.000000, 2.000000)'>
                        <svg class='color-background' xmlns='http://www.w3.org/2000/svg' width='40' height='50' fill='currentColor' class='bi bi-people-fill' viewBox='0 0 16 16'>
                          <path d='M7 14s-1 0-1-1 1-4 5-4 5 3 5 4-1 1-1 1zm4-6a3 3 0 1 0 0-6 3 3 0 0 0 0 6m-5.784 6A2.24 2.24 0 0 1 5 13c0-1.355.68-2.75 1.936-3.72A6.3 6.3 0 0 0 5 9c-4 0-5 3-5 4s1 1 1 1zM4.5 8a2.5 2.5 0 1 0 0-5 2.5 2.5 0 0 0 0 5' />
                        </svg>
                      </g>
                    </g>
                  </g>
                </g>
              </svg>",
        "url" => "../users/index.php",
        "active" => false
    ]
];

$acces_array = [];

$key_modules = array_keys($modules);
foreach ($key_modules as $module) {

  
  foreach ($permissions as $permission) {

      $permission_explode = explode("/",$permission["permiso"]);
      $permission_get = $permission_explode[0];

      
      if($module == $permission_get){
        array_push($acces_array,$modules[$module]);

      }
      
    /* echo json_encode(stripos($module,$dats) !== false);
      echo"foreach";

    } */
  }
}

/**
 * ! "&" antes de "$acces", indica una modificaión al elemento orginal
 * ! Al pareser al iterar se crea una copia, y las modificaciones afectan solo a la copuia mas no al original
 * ! con "&" se afecta el elemento origianal directamente
 */
foreach ($permissions as $permission) {
  
  //$arrayKey = explode("/",$acces["url"]);
  //$currentItem = $arrayKey[count($arrayKey) -2] . "/" . $arrayKey[count($arrayKey) -1];

  $currentURL = $_SERVER["REQUEST_URI"];
  $urlArray = explode("/",$currentURL);
  $currentPath = $urlArray[count($urlArray)-2] . "/" . $urlArray[count($urlArray)-1];

  $currentItem = $permission["permiso"] . ".php";
  
  if($currentItem == $currentPath){
  
    foreach($acces_array as &$acces){
      $explodeItem = explode("/",$currentItem);
      $currentFolder = $explodeItem[0];

      $explodeUrlFile = explode("/",$acces["url"]);
      $currentUrlFile = $explodeUrlFile[1];

      if($currentFolder == $currentUrlFile){

        $acces["active"] = true;
        break 2;
      }

    }
  } 
  


}
unset($acces); // ! Al haber usado una referencia directa con "&$acces", es necesario borrarla con unset(), terminado el foreach, evita problemas como ducplicidad por referencia directa

$acces_array = arra
foreach ($acces_array as $acces) {

    $isActive = !$acces["active"] ? "" : "active";

      echo "
      <li class='nav-item'>
          <a class='nav-link {$isActive}' href='{$acces["url"]}'>
              <div class='icon icon-shape icon-sm shadow border-radius-md bg-white text-center me-2 d-flex align-items-center justify-content-center'>
              {$acces["icon"]}
              </div>
              <span class='nav-link-text ms-1'>{$acces["name"]}</span>
          </a>
      </li>
      ";  
}    
?>

        


    