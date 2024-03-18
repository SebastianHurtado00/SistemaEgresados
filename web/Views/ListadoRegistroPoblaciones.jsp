<%-- 
    Document   : ListadoRegistroPoblaciones
    Created on : 17/03/2024, 09:35:58 PM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Listado Y registro de Poblaciones</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS v5.2.1 -->
        <link rel="shortcut icon" href="" type="image/x-icon">
        <link rel="stylesheet" href="../CSS/HomeAdministrador.css"/>
        <link rel="stylesheet" href="../CSS/Footer.css"/>
        <link rel="stylesheet" href="../CSS/UsuarioConectado.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <link rel="stylesheet" href="../CSS/TableScroll.css"/>

        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://kit.fontawesome.com/0702706600.js" crossorigin="anonymous"></script>
    </head>
    <body>
        <!-- Demo header-->
        <section class="section-0 d-flex justify-content-between">
            <h2 class="text-start mt-4" style="margin-left: 7px; font-family: serif">Regional Sucre</h2>
            <img  src="../IMG/Logo_Sena_Sin_Fondo.png" width="150px" height="200px" alt="alt" class="align-self-end img-fluid "/> 
        </section>

        <!--Menu-->
        <header style="font-family: monospace" class="header sticky-top">
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
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    Registros
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                    <a class="dropdown-item" href="RegistrosEgresados.jsp">Registro Egresados</a>
                                    <a class="dropdown-item" href="">Lisatdo de Egresados</a>
                                    <a class="dropdown-item" href="ListadoRegistroPoblaciones.jsp">Lisatdo y Registro de Poblaciones</a>
                                    <a class="dropdown-item" href="#">Listado y Registro de  ciudades</a>
                                    <a class="dropdown-item" href="#">Lisatdo y Registros de Formaciones y sedes</a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Filtrados de Egresados</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>


        <section class="mt-5">

            <div class="card mx-auto" style="font-family: monospace" >
                <h5 class="card-title text-center mt-3" >Listado Registro y edicion de poblaciones</h5>
                <div class="input-group mb-3 mt-2">
                    <i id="start-btn" class="fa-solid fa-microphone-lines btn btn-success py-3" onclick="voz()"></i>
                    <input type="text" class="form-control" placeholder="Busqueda de Poblaciones"
                           name="Dato_User" id="filtro">
                    <button class="btn btn-success" type="button" data-bs-toggle="modal"
                            data-bs-target="#"><a style="color: white ; text-decoration: none">Regitrar Poblacion</a></button>
                </div>


                <div class="table-responsive" >
                    <div class="table-wrapper-scroll-y my-custom-scrollbar">
                        <table class="table table-dark table-striped" style="height: 800px" >
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">First</th>
                                    <th scope="col">Last</th>
                                    <th scope="col">Handle</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr> <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr> <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@tw
                                        itter</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr> <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr> <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr>




                            </tbody>
                        </table>
                    </div>
                </div>
            </div>



        </section>




        <footer style="max-height: 160px; font-family: monospace; text-decoration: black; background-color: #5EB31A ; margin-top: 5%">
            <div class="container-fluid">
                <!--Row Principal-->
                <div class="row">
                    <!--Primera Columna-->
                    <div class="col-md-4" id="redes">
                        <!--Rows Internos-->
                        <div class="row col-md-12" style="margin-left: 15px;">
                            <a href="https://github.com/SebastianHurtado00" target="_blank" style="color: white;">
                                <label class="form-label mt-3"> <img src="../IMG/github.png" alt="" style="width: 25px;">
                                    GitHub</a></label>
                        </div>
                        <div class="row col-md-12" style="margin-left: 15px;">
                            <a href="https://www.linkedin.com/in/sebastian-hurtado-72a564267/" target="_blank" style="color: white;">
                                <label class="form-label mt-3"> <img src="../IMG/linkedin.png" alt="linkedin" style="width: 25px;"> Linkedid
                                </label>
                            </a>
                        </div>
                        <!--https://www.instagram.com/sebastian_hurtado86/-->
                        <div class="row" style="margin-left: 15px;">
                            <a href="https://www.instagram.com/sebastian_hurtado86/?next=%2F" target="_blank" style="color: white;">
                                <label class="form-label mt-3"> <img src="../IMG/instagram.png" alt="" style="width: 25px;"> Instagram</label>
                            </a>
                        </div>
                    </div>
                    <!--Segunda Columna-->
                    <div class="col-md-4 d-flex align-items-center justify-content-center">
                        <p class="contact-info" style="margin-left: 10%; color: white;"> &copy; By Sebastian Navaja Hurtado
                            <br>
                            Teléfono: +57 310 299 5093
                            <!-- Esto evitará que el salto de línea se aplique en dispositivos más pequeños -->
                            Email: slnavaja@soy.sena.edu.co
                        </p>
                    </div>

                    <!--Columna Logo Personal-->
                    <div class="col-md-4 mt-5" id="logoPersonal">
                        <div class="col-md-4">
                            <img src="../IMG/letra-n.png" alt="Descripción de la imagen"
                                 style="width: 70px; margin-top: 10; margin-left: 200%;">
                        </div>
                    </div>
                </div>
            </div>
        </footer>


    </body>
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <!-- Bootstrap JavaScript Libraries -->
    <!-- Bootstrap JavaScript Libraries -->
    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous">
    </script>
    <script src="../JS/ReconocimientoVoz.js"></script>
    <script src="../JS/FiltradoTablas.js"></script>
</html>
