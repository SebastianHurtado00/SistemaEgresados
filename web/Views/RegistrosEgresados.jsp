<%-- 
    Document   : RegistrosEgresados
    Created on : 17/03/2024, 09:38:13 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Registro Egresados</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="../IMG/birrete.webp" type="image/x-icon">
        <!-- Bootstrap CSS v5.2.1 -->
        <link rel="shortcut icon" href="" type="image/x-icon">
        <link rel="stylesheet" href="../CSS/HomeAdministrador.css"/>
        <link rel="stylesheet" href="../CSS/Footer.css"/>
        <link rel="stylesheet" href="../CSS/UsuarioConectado.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
        <script src="https://kit.fontawesome.com/0702706600.js" crossorigin="anonymous"></script>
    </head>
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
                                <div class="notice-content" style="font-family: monospace">
                                    <div class="username">Jessica Sanders</div>
                                    <div class="text-center text-small text-gray">Admin</div>

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
                                <a class="dropdown-item" href="RestablecimientoContrasehaEgresados.jsp">Reestablecer contraseña de Egresados</a>
                                <a class="dropdown-item" href="ListadoRegistroPoblaciones.jsp">Lisatdo y Registro de Poblaciones</a>
                                <a class="dropdown-item" href="ListadoRegistroCiudades.jsp">Listado y Registro de  ciudades</a>
                                <a class="dropdown-item" href="ListadoRegistroFormacionesSedes.jsp">Lisatdo y Registros de Formaciones y sedes</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="FiltradoEgresados.jsp">Filtrados de Egresados</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
    </header>

    <body style="background: #F1F1F1">
        <!--Formulario Egresados -->
        <section class="p-3" aty>
            <div class="d-grid gap-2 d-md-flex justify-content-md-end  justify-content-sm-end">
                <button class="btn btn-outline-success mt-4" type="button" style="font-family: monospace">Importar datos desde CSV <i class="fa-solid fa-file-import"></i></button>
            </div>
            <div class="card mb-5 mt-3 mx-auto" style="max-width: 900px ; min-width: 200px; font-family: monospace">

                <h5 class="card-title text-center mt-3" ><img src="../IMG/graduado.webp" alt="alt" width="50px" height="50px"/>  Registros de egresados</h5>

                <div class="card-body">
                    <form id="multiPageForm">
                        <!--Seccion de datos Personales -->
                        <div class="page" id="page1">
                            <div class="row">
                                <h5 class="card-title mb-4">Informacion Personal</h5>
                                <div class="col-md-6">
                                    <img src="../IMG/id-facial.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="numeroDocumento" class="form-label">N° Documento</label>
                                    <input type="text" id="numeroDocumento" class="form-control mb-3" required max="99999999999">

                                    <img src="../IMG/nombre.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="nombres" class="form-label">Nombres</label>
                                    <input type="text" id="nombres" class="form-control mb-3" required maxlength="45">

                                    <img src="../IMG/etiqueta-de-nombre.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="apellidos" class="form-label">Apellidos</label>
                                    <input type="text" id="apellidos" class="form-control mb-3" required maxlength="45">
                                </div>

                                <div class="col-md-6">
                                    <img src="../IMG/tarjeta-de-identificacion.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="tipoDocumento" class="form-label">Tipo de Documento</label>
                                    <select id="tipoDocumento" class="form-select mb-3" required>
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <!-- Opciones -->
                                    </select>

                                    <img src="../IMG/sexo.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="sexo" class="form-label">Sexo</label>
                                    <select id="sexo" class="form-select mb-3" required>
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <!-- Opciones -->
                                    </select>

                                    <img src="../IMG/personas.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="tipoPoblacion" class="form-label">Tipo de Población</label>
                                    <select id="tipoPoblacion" class="form-select mb-3" required>
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <!-- Opciones -->
                                    </select>
                                </div>
                            </div>
                            <i class="fa-solid fa-arrow-right fa-lg mt-3 px-3 " onclick="nextPage()"></i>
                        </div>

                        <!-- Seccion de datos de residencia -->
                        <div class="page" id="page2" style="display: none;">

                            <div class="row">
                                <h5 class="card-title mb-4">Informacion Residencia y contactos</h5>
                                <div class="col-md-6">

                                    <img src="../IMG/edificios.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="ciudad" class="form-label">Ciudad</label>
                                    <select id="ciudad" class="form-select mb-3" required>
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <!-- Opciones -->
                                    </select>

                                    <img src="../IMG/marcador-de-posicion.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="direccion" class="form-label">Dirección</label>
                                    <input type="text" id="direccion" class="form-control mb-3" maxlength="100" placeholder="Opcional">
                                </div>

                                <div class="col-md-6">
                                    <img src="../IMG/certificado.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="numCertificados" class="form-label">N° de Certificados</label>
                                    <input type="number" id="numCertificados" class="form-control mb-3" max="99999999999"" placeholder="Opcional">

                                    <img src="../IMG/gmail.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="correo" class="form-label">Correo</label>
                                    <input type="email" id="correo" class="form-control mb-3" maxlength="45">
                                </div>

                                <div class="row">
                                    <div class = "col-md-3">
                                    </div>
                                    <div class = "col-md-6">
                                        <img src="../IMG/atencion-al-cliente.webp" alt="alt" width="30px" height="30px"/>
                                        <label for="numContacto" class="form-label mx-auto">Número de Contacto</label>
                                        <input type="tel" id="numContacto" class="form-control mb-3">
                                    </div>
                                    <div class = "col-md-3">
                                    </div>
                                </div>
                            </div>
                            <i class="fa-solid fa-arrow-left fa-lg mt-3 px-3 " onclick="prevPage()"></i>
                            <i class="fa-solid fa-arrow-right fa-lg mt-3 px-3 " onclick="nextPage()"></i>
                        </div>

                        <!--Informacion Laboral -->
                        <div class="page" id="page3" style="display: none;">
                            <h5 class="card-title mb-4">Informacion Academica</h5>
                            <div class="row mb-5">
                                <div class="col-md-4">
                                    <img src="../IMG/SedeFormacion.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="sede" class="form-label">Sede</label>
                                    <select id="sede" class="form-select mb-3">
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <!-- Opciones -->
                                    </select>

                                    <!-- Pregunta y check Box sobre cadena de formacion -->
                                    <div>
                                        <!-- Pregunta -->
                                        <label class="form-label mx-2">¿Cadena de formación?</label>
                                        <br>
                                        <!-- Checkbox "Sí" -->
                                        <div class="form-check form-check-inline mx-4">
                                            <input class="form-check-input" type="checkbox" id="siCheckbox" value="1" onchange="mostrarOcultarInput(this.checked, 'miInputContainer', 'siCheckbox', 'noCheckbox')">
                                            <label class="form-check-label" for="siCheckbox">Sí</label>
                                        </div>

                                        <!-- Checkbox "No" -->
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="noCheckbox" value="0" onchange="mostrarOcultarInput(!this.checked, 'miInputContainer', 'siCheckbox', 'noCheckbox')">
                                            <label class="form-check-label" for="noCheckbox">No</label>
                                        </div>

                                        <!-- Contenedor del input -->
                                        <div id="miInputContainer" style="display: none; margin-top: 10px;">
                                            <input class="form-control mb-3" type="text" id="miInput" placeholder="Formacion Cursada">
                                        </div>
                                    </div>

                                </div>

                                <div class="col-md-4">
                                    <img src="../IMG/formacion.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="formacion" class="form-label">Formación</label>
                                    <select id="formacion" class="form-select mb-3">
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <!-- Opciones -->
                                    </select>



                                    <!-- Pregunta y check Box sobre Experiencia -->
                                    <div >
                                        <!-- Pregunta -->
                                        <label class="form-label mx-2">¿Experiencia Laboral?</label>
                                        <br>
                                        <!-- Checkbox "Sí" -->
                                        <div class="form-check form-check-inline mx-4">
                                            <input class="form-check-input" type="checkbox" id="siCheckboxExp" value="1" onchange="mostrarOcultarInput(this.checked, 'miInputContainerExp', 'siCheckboxExp', 'noCheckboxExp')">
                                            <label class="form-check-label" for="siCheckbox">Sí</label>
                                        </div>

                                        <!-- Checkbox "No" -->
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="noCheckboxExp" value="0" onchange="mostrarOcultarInput(!this.checked, 'miInputContainerExp', 'siCheckboxExp', 'noCheckboxExp')">
                                            <label class="form-check-label" for="noCheckbox">No</label>
                                        </div>

                                        <!-- Contenedor del input -->
                                        <div id="miInputContainerExp" style="display: none; margin-top: 10px;">
                                            <textarea id="" name="name" rows="5" cols="" class="form-control" placeholder="Describa su experiencia maximo(300 caracteres)" maxlength="300"></textarea>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <img src="../IMG/crecimiento.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="nivelFormacion" class="form-label">Nivel de Formación</label>
                                    <select id="nivelFormacion" class="form-select mb-3">
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <!-- Opciones -->
                                    </select>

                                    <!-- Pregunta y check Box sobre Carrera Universitaria -->
                                    <div>
                                        <!-- Pregunta -->
                                        <label class="form-label mx-2">¿Carrera Univerisitaria?</label>
                                        <br>
                                        <!-- Checkbox "Sí" -->
                                        <div class="form-check form-check-inline mx-4">
                                            <input class="form-check-input" type="checkbox" id="siCheckboxUni" value="1" onchange="mostrarOcultarInput(this.checked, 'miInputContainerUni', 'siCheckboxUni', 'noCheckboxUni')">
                                            <label class="form-check-label" for="siCheckbox">Sí</label>
                                        </div>

                                        <!-- Checkbox "No" -->
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="noCheckboxUni" value="0" onchange="mostrarOcultarInput(!this.checked, 'miInputContainerUni', 'siCheckboxUni', 'noCheckboxUni')">
                                            <label class="form-check-label" for="noCheckbox">No</label>
                                        </div>

                                        <!-- Contenedor del input -->
                                        <div id="miInputContainerUni" style="display: none; margin-top: 10px;">
                                            <input class="form-control mb-3" type="text" maxlength="100" id="miInput" placeholder="Nombre Univerisad">
                                            <input class="form-control mb-3" type="text" maxlength="100" id="miInput" placeholder="Nombre Carrera">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <i class="fa-solid fa-arrow-left fa-lg mt-3 px-3 " onclick="prevPage()"></i>
                            <button class="fa-solid fa-file-arrow-up fa-lg btn"></button>
                        </div>
                    </form>
                </div>

            </div>
        </section>













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
                    <p class="contact-info" style="margin-left: 10%; color: white;"> &copy; By Sebastian Navaja - Crystian Peralta
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
    <script src="../JS/NavegacionFormularioEgresados.js"></script>
    <script src="../JS/LogicaCheakBox.js"></script>
</html>
