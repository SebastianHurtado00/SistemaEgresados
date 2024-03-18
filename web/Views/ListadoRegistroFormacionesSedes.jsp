<%-- 
    Document   : ListadoRegistroFormacionesSedes
    Created on : 18/03/2024, 09:28:59 AM
    Author     : ASUS
--%>

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
                                    <li><a class="dropdown-item" href="DatosPersonales.jsp">Datos perosnales</a></li>
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
                                    <a class="dropdown-item" href="ListadoRegistroCiudades.jsp">Listado y Registro de  ciudades</a>
                                    <a class="dropdown-item" href="ListadoRegistroFormacionesSedes.jsp">Lisatdo y Registros de Formaciones y sedes</a>
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

    <body style="background: #F1F1F1">

        <section class="mt-3 p-3">
            <div class="card mx-auto" style="font-family: monospace; width: 900px" >
                <h5 class="card-title text-center mt-4" >Listado Registro y edicion de Sedes</h5>
                <div class="input-group mb-3 mt-2 p-2">
                    <input type="text" class="form-control" placeholder="Busqueda de Sedes"
                           name="Dato_User" id="filtro1">
                    <button class="btn btn-success btn-sm" type="button" data-bs-toggle="modal"
                            data-bs-target="#ModalRegistroSede"><a style="color: white ; text-decoration: none">Regitrar Sede</a></button>
                </div>
                <div class="table-responsive" >
                    <div class="table-wrapper-scroll-y my-custom-scrollbar p-2" style="height: 300px">
                        <table id="tabla1" class="table table-striped-columns" style="height: 500px">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">ID Sedes</th>
                                    <th scope="col">Nombre Sede</th>
                                    <th scope="col">Configuracion</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>

                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                </tr> <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                </tr> <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <section class="mt-2 p-3">
            <div class="card mx-auto" style="font-family: monospace ; width: 900px" >
                <h5 class="card-title text-center mt-4" >Listado Registro y edicion de Formaciones</h5>
                <div class="input-group mb-3 mt-2 p-2">

                    <input type="text" class="form-control" placeholder="Busqueda de Formaciones"
                           name="Dato_User" id="filtro2">
                    <button class="btn btn-success btn-sm" type="button" data-bs-toggle="modal"
                            data-bs-target="#ModalRegistroFormaciones"><a style="color: white ; text-decoration: none">Regitrar Formacion</a></button>
                </div>
                <div class="table-responsive" >
                    <div class="table-wrapper-scroll-y my-custom-scrollbar p-2" style="height: 300px">
                        <table id="tabla2" class="table table-striped-columns" style="height: 500px">
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">ID Sedes</th>
                                    <th scope="col">Nombre Sede</th>
                                    <th scope="col">Configuracion</th>

                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>

                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                </tr> <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                </tr> <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <!-- Modal Regsitro de Sede -->
        <div class="modal fade" id="ModalRegistroSede" tabindex="-1" aria-labelledby="ModalRegistroSede" aria-hidden="true" style="font-family: monospace">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="ModalRegistro">Registro Sedes</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body mx-auto">
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <label for="Id" class="form-label">ID de Sede</label>
                                <input type="number" id="Id" name="name" class="form-control mb-2" max="99999999999" required>
                            </div>
                            <div class="col-8 mx-auto">
                                <label for="NombreSede" class="form-label">Nombre de Sede</label>
                                <input type="number" id="NombreSede" name="name" class="form-control mb-2" maxlength="60" required>
                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-success">Guardar</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal Regsitro de Formaciones -->
        <div class="modal fade" id="ModalRegistroFormaciones" tabindex="-1" aria-labelledby="ModalRegistroFormacion" aria-hidden="true" style="font-family: monospace">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="ModalRegistro">Registro Formacion</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body mx-auto">
                        <div class="row">
                            <div class="col-8 mx-auto">
                                <label for="Id" class="form-label">ID de Formacion</label>
                                <input type="number" id="Id" name="name" class="form-control mb-2" max="99999999999" required>
                            </div>
                            <div class="col-8 mx-auto">
                                <label for="NombreFormacion" class="form-label">Nombre de Formacion</label>
                                <input type="number" id="NombreFormacion" name="name" class="form-control mb-2" maxlength="45" required>
                            </div>
                            <div class="col-8 mx-auto">
                                <label for="SedePerteneciente" class="form-label">Sede perteneciente</label>
                                <select id="SedePerteneciente" class="form-select">
                                    <option value="" selected disabled>Seleccione una opción</option>
                                </select>

                            </div>

                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                        <button type="button" class="btn btn-success">Guardar</button>
                    </div>
                </div>
            </div>
        </div>


    </body>

    <footer style="max-height: 160px; font-family: monospace; text-decoration: black; background-color: #35C35D ; margin-top: 5%">
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
                        <br>
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
<script src="../JS/FiltradoTablaFormacionSede.js"></script>
</html>