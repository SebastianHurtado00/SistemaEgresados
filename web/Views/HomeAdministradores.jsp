<%-- 
    Document   : HomeAdministradores
    Created on : 15/03/2024, 07:46:33 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Home Administradores</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS v5.2.1 -->
        <link rel="shortcut icon" href="" type="image/x-icon">
        <link rel="stylesheet" href="../CSS/HomeAdministrador.css"/>
        <link rel="stylesheet" href="../CSS/CardsHome.css"/>
        <link rel="stylesheet" href="../CSS/UsuarioConectado.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    </head>
</head>

<!-- Demo header-->
<section class="section-0 d-flex justify-content-between">
    <h2 class="text-start mt-4" style="margin-left: 7px; font-family: serif">Regional Sucre</h2>
    <img  src="../IMG/Logo_Sena_Sin_Fondo.png" width="150px" height="200px" alt="alt" class="align-self-end img-fluid"/> 
</section>

<!--Menu-->
<header class="header sticky-top">
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid d-flex justify-content-between align-items-center">
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <!--Boton Usuario y menu de Datos personales y cerrado de sesion -->
            <div class="navbar-brand order-lg-2" href="#">
                <strong class="h6 mb-0 font-weight-bold">
                    <div class="dropdown-center">
                        <button id="btn-message" class="button-message" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <div class="content-avatar">
                                <div class="status-user"></div>
                                <div class="avatar">
                                    <svg class="user-img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24">
                                    <path d="M12,12.5c-3.04,0-5.5,1.73-5.5,3.5s2.46,3.5,5.5,3.5,5.5-1.73,5.5-3.5-2.46-3.5-5.5-3.5Zm0-.5c1.66,0,3-1.34,3-3s-1.34-3-3-3-3,1.34-3,3,1.34,3,3,3Z"></path>
                                    </svg>
                                </div>
                            </div>
                            <div class="notice-content">
                                <div class="username">Jessica Sanders</div>
                            </div>
                        </button>
                        <ul class="dropdown-menu text-center" style="font-family: monospace">
                            <li><a class="dropdown-item" href="#">Datos perosnales</a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="#">Cerrado de Sesion</a></li>
                        </ul>
                    </div>
                </strong>
            </div>
            <!--Items del menu -->
            <div class="collapse navbar-collapse" id="navbarText">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="HomeAdministradores.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Registros Egresados</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Registros Poblaciones</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>




<section class="section-1">
    <div class="container py-2">
        <div class="row text-center" style="font-family: monospace;">
            <div class="col-md-6 col-lg-4 d-flex justify-content-center align-items-center ">
                <div class="card mt-5 ">
                    <img src="../IMG/Egresados.webp" class="card-img-top" alt="Imagen_Egresados" width="300px" height="200px">
                    <div class="card-details">
                        <h5 class="mt-2">Registros Egresados</h5>
                        <p class="text-body">Click para ver los registros de  egresados</p>
                    </div>
                    <button class="card-button">Ingreso</button>
                </div>
            </div>
            <div class="col-md-6 col-lg-4 d-flex justify-content-center align-items-center">
                <div class="card mt-5">
                    <img src="../IMG/Poblaciones.webp" class="card-img-top" alt="Imagen_Egresados" width="300px" height="200px">
                    <div class="card-details">
                        <h5 class="mt-2">Registros Poblaciones</h5>
                        <p class="text-body">Click para ver registros de poblaciones</p>
                    </div>
                    <button style="font-family: monospace" class="card-button">Ingreso</button>
                </div>
            </div>
            <div class="col-lg-4 d-flex justify-content-center align-items-center">
                <div class="card mt-5"> 
                    <img src="../IMG/SedeFormacion.webp" class="card-img-top" alt="Imagen_Egresados" width="300px" height="200px">
                    <div class="card-details">
                        <h5 class="mt-2" >Formaciones y Sedes</h5>
                        <p class="text-body">Click para ver registros de formaciones y sedes</p>
                    </div>
                    <button class="card-button">Ingreso</button>
                </div>
            </div>
        </div>
    </div>
</section>


<section class="py-5 section-2">
    <div class="container py-5 text-center">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <h2>Demo section 2</h2>
                <p class="text-muted lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate.</p>
            </div>
        </div>
    </div>
</section>

<section class="py-5 section-3">
    <div class="container py-5 text-center">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <h2>Demo section 3</h2>
                <p class="text-muted lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate.</p>
            </div>
        </div>
    </div>
</section>

<section class="py-5 section-4">
    <div class="container py-5 text-center">
        <div class="row">
            <div class="col-lg-8 mx-auto">
                <h2>Demo section 4</h2>
                <p class="text-muted lead">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate.</p>
            </div>
        </div>
    </div>
</section>

<!-- Bootstrap JavaScript Libraries -->
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
        integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
        integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
            document.addEventListener('DOMContentLoaded', function () {
                var btnMessage = document.getElementById('btn-message');
                var navbarText = document.getElementById('navbarText');

                navbarText.addEventListener('show.bs.collapse', function () {
                    btnMessage.classList.add('dropdown-open');
                });

                navbarText.addEventListener('hide.bs.collapse', function () {
                    btnMessage.classList.remove('dropdown-open');
                });
            });

</script>
</html>
