<%-- 
    Document   : HomeSuperAdmin
    Created on : 20/03/2024, 09:27:09 AM
    Author     : ASUS
--%>

<%@page import="Entidades.Tipodocumento"%>
<%@page import="java.util.List"%>
<%@page import="Controladores.TipodocumentoJpaController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    response.setHeader("Cache-Control", "no-Cache,no-store,must-revalidate");
    HttpSession sessionObtenida = request.getSession();
    if (sessionObtenida.getAttribute("SuperAdmin") == null) {
        response.sendRedirect("../index.jsp");
    }
    TipodocumentoJpaController controlTipoDocs = new TipodocumentoJpaController();
    List<Tipodocumento> ListaTiposDocs = controlTipoDocs.findTipodocumentoEntities();
    List<Tipodocumento> ListaTiposDocs2 = controlTipoDocs.findTipodocumentoEntities();
%>
<html>
    <head>

        <title>Home Super Administrador</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="../IMG/work-from-home.webp" type="image/x-icon">
        <!-- Bootstrap CSS v5.2.1 -->
        <link rel="shortcut icon" href="" type="image/x-icon">
        <link rel="stylesheet" href="../CSS/HomeAdministrador.css"/>
        <link rel="stylesheet" href="../CSS/Footer.css"/>
        <link rel="stylesheet" href="../CSS/CardsHome.css"/>
        <link rel="stylesheet" href="../CSS/UsuarioConectado.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

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
                                    <div class="text-center text-small text-gray">Super Admin</div>
                                </div>
                            </button>
                            <ul class="dropdown-menu text-center" style="font-family: monospace">
                                <li><a class="dropdown-item" href="DatosPersonales.jsp">Datos perosnales</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="../CerradoSession.jsp">Cerrado de Sesion</a></li>
                            </ul>
                        </div>
                    </strong>
                </div>
                <!--Items del menu -->
                <div class="collapse navbar-collapse" id="navbarText">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="HomeSuperAdmin.jsp">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Registros
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" id="paginaActual" href="RegistrosEgresados.jsp">Registro Egresados</a>
                                <a class="dropdown-item" href="RestablecimientoContrasehaEgresados.jsp">Reestablecer contraseña de Egresados</a>
                                <a class="dropdown-item" href="ListadoRegistroPoblaciones.jsp">Listado y Registro de Poblaciones</a>
                                <a class="dropdown-item" href="ListadoRegistroCiudades.jsp">Listado y Registro de  ciudades</a>
                                <a class="dropdown-item" href="ListadoRegistroFormacionesSedes.jsp">Lisatdo y Registros de Formaciones y sedes</a>
                            </div>
                        </li>

                        <li  class="nav-item dropdown"><a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuSuperAdmin" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Funciones especiales
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuSuperAdmin">
                                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#RegistroAdministradores">Registro de Administradores</a>
                                <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#RegistroSuperAdministradores" href="">Registro Super Admins</a>
                                <a class="dropdown-item" href="RegistrosDeAcceos.jsp">Registros Accesos</a>
                                <a class="dropdown-item" href="ListadoAdministradores.jsp">Listado de administradores</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>



    </header>

    <!--Modales-->
    <!-- Registro Administradores -->
    <div class="modal fade" id="RegistroAdministradores" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="font-family: monospace">
        <div class="modal-dialog">
            <form action="<%=request.getContextPath()%>/CrudAdministradores" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Registro de administradores</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <img src="../IMG/id-facial.webp" alt="alt" width="30px" height="30px"/>
                                <label for="CCadmin" class="form-label">Cedula</label>
                                <input  class="form-control mb-2" id="CCadmin" type="number" name="CedulaAdmin" max="999999999999" required>

                                <img src="../IMG/nombre.webp" alt="alt" width="30px" height="30px"/>
                                <label for="NombreAdmin" class="form-label">Nombre</label>
                                <input  class="form-control mb-2" id="NombreAdmin" type="text" name="NombreAdmin" maxlength="45" required>

                                <img src="../IMG/gmail.webp" alt="alt" width="30px" height="30px"/>
                                <label for="emailAdmin" class="form-label">email</label>
                                <input  class="form-control mb-2" id="emailAdmin" type="email" name="EmailAdmin" maxlength="200" required>

                            </div>
                            <div class="col-md-6 col-sm-12">
                                <img src="../IMG/tarjeta-de-identificacion.webp" alt="alt" width="30px" height="30px"/>
                                <label class="form-label" for="TipoDocAdmin">Tipo Documento</label>
                                <select id="TipoDocAdmin" name="TipodocumentAdmin" class="form-select mb-2" required>
                                    <option value="" selected disabled>Seleccione una opción</option>
                                    <%

                                        for (Tipodocumento tipoDoc : ListaTiposDocs) {
                                            out.print("<option value ='" + tipoDoc.getId() + "'> ");
                                            out.print(tipoDoc.getNombre());
                                            out.print("</option>");
                                        }
                                    %>
                                </select>

                                <img src="../IMG/etiqueta-de-nombre.webp" alt="alt" width="30px" height="30px"/>
                                <label for="ApellidoAdmin" class="form-label">Apellido</label>
                                <input  class="form-control mb-2" id="ApellidoAdmin" type="text" name="ApellidoAdmin" maxlength="45" required>

                                <img src="../IMG/atencion-al-cliente.webp" alt="alt" width="30px" height="30px"/>
                                <label for="TelefonoAdmin" class="form-label">Telefono</label>
                                <input  class="form-control mb-2" id="TelefonoAdmin" type="number" name="TelefonoAdmin" max="999999999999" required>
                            </div>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="" name="BtnAdmin" value="BtnGuardarAdmin" class="btn btn-success">Registrar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <!-- Registro SuperAdministradores -->
    <div class="modal fade" id="RegistroSuperAdministradores" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true" style="font-family: monospace">
        <div class="modal-dialog">
            <form action="<%=request.getContextPath()%>/RegistroTemporalSuperAdmin" method="post">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="staticBackdropLabel">Registro de Super Administradores</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6 col-sm-12">
                                <img src="../IMG/id-facial.webp" alt="alt" width="30px" height="30px"/>
                                <label for="CCsuper" class="form-label">Cedula</label>
                                <input  class="form-control mb-2" id="CCsuper" type="number" name="CedulaSuper" max="999999999999" required>

                                <img src="../IMG/nombre.webp" alt="alt" width="30px" height="30px"/>
                                <label for="NombreSuper" class="form-label">Nombre</label>
                                <input  class="form-control mb-2" id="NombreSuper" type="text" name="NombreSuper" maxlength="45" required>

                                <img src="../IMG/gmail.webp" alt="alt" width="30px" height="30px"/>
                                <label for="emailSuper" class="form-label">email</label>
                                <input  class="form-control mb-2" id="emailSuper" type="text" name="emailSuper" maxlength="200" required>

                            </div>
                            <div class="col-md-6 col-sm-12">
                                <img src="../IMG/tarjeta-de-identificacion.webp" alt="alt" width="30px" height="30px" />
                                <label class="form-label" for="TipoDocSuper">Tipo Documento</label>
                                <select id="TipoDocSuper" name="TipoDocSuper" class="form-select mb-2" required="">
                                    <option value="" selected disabled>Seleccione una opción</option>
                                    <%
                                        for (Tipodocumento tipoDoc : ListaTiposDocs2) {
                                            out.print("<option value ='" + tipoDoc.getId() + "'> ");
                                            out.print(tipoDoc.getNombre());
                                            out.print("</option>");
                                        }
                                    %>
                                </select>

                                <img src="../IMG/etiqueta-de-nombre.webp" alt="alt" width="30px" height="30px"/>
                                <label for="ApellidoAdmin" class="form-label">Apellido</label>
                                <input  class="form-control mb-2" id="ApellidoSuper" type="text" name="ApellidoSuper" maxlength="45" required>

                                <img src="../IMG/atencion-al-cliente.webp" alt="alt" width="30px" height="30px"/>
                                <label for="TelefonoSuper" class="form-label">Telefono</label>
                                <input  class="form-control mb-2" id="TelefonoSuper" type="number" name="TelefonoSuper" max="999999999999" required>
                            </div>


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button value="GuardarSuper" name="BtnSuperAdmin" class="btn btn-success">Registrar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <body style="background: #F1F1F1">
        <section class="section-1">
            <h4 class="text-center py-5" data-aos="fade-up-right" data-aos-easing="linear" data-aos-duration="400" style="font-family: monospace">Sistema de Administracion de Egresados</h4>
            <div class="container">
                <div class="row text-center" style="font-family: monospace;">
                    <div class="col-md-6 col-lg-4 d-flex justify-content-center align-items-center ">
                        <div class="card mt-2 mb-4" data-aos="fade-up-right" data-aos-easing="linear" data-aos-duration="400">
                            <img src="../IMG/Egresados_Card_11zon.webp" class="card-img-top" alt="Imagen_Egresados" width="300px" height="200px">
                            <div class="card-details">
                                <h5 class="mt-2">Registros Egresados</h5>
                                <p class="text-body">Click para ver los registros de  egresados</p>
                            </div>
                            <button class="card-button" style="background:#35C35D">Ingreso</button>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 d-flex justify-content-center align-items-center">
                        <div class="card mt-2 mb-4" data-aos="fade-up-right" data-aos-easing="linear" data-aos-duration="400">
                            <img src="../IMG/Poblaciones_Card_11zon.webp" class="card-img-top" alt="Imagen_Egresados" width="300px" height="200px">
                            <div class="card-details">
                                <h5 class="mt-2">Registros Poblaciones</h5>
                                <p class="text-body">Click para ver registros de poblaciones</p>
                            </div>
                            <button class="card-button" style="background:#35C35D ">Ingreso</button>
                        </div>
                    </div>
                    <div class="col-lg-4 d-flex justify-content-center align-items-center">
                        <div class="card mt-2" data-aos="fade-up-right" data-aos-easing="linear" data-aos-duration="400"> 
                            <img src="../IMG/Formaciones_Sedes_Cards_11zon.webp" class="card-img-top" alt="Imagen_Egresados" width="300px" height="200px">
                            <div class="card-details">
                                <h5 class="mt-2" >Formaciones y Sedes</h5>
                                <p class="text-body">Click para ver registros de formaciones y sedes</p>
                            </div>
                            <button class="card-button" style="background:#35C35D ">Ingreso</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="section-2 mb-5">
            <div class="container">
                <div class="row text-center" style="font-family: monospace;">
                    <div class="col-md-6 col-lg-4 d-flex justify-content-center align-items-center ">
                        <div class="card mt-5" data-aos="fade-up-right" data-aos-easing="linear" data-aos-duration="400">
                            <img src="../IMG/Filtro_Egresados_Card_11zon.webp" class="card-img-top" alt="Imagen_Egresados" width="300px" height="200px">
                            <div class="card-details">
                                <h5 class="mt-2">Filtro de Egresados</h5>
                                <p class="text-body">Click para filtrar los egresados</p>
                            </div>
                            <button class="card-button" style="background:#35C35D">Ingreso</button>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-4 d-flex justify-content-center align-items-center">
                        <div class="card mt-5" data-aos="fade-up-right" data-aos-easing="linear" data-aos-duration="400">
                            <img src="../IMG/Ciudades_Card_11zon.webp" class="card-img-top" alt="Imagen_Egresados" width="300px" height="200px">
                            <div class="card-details">
                                <h5 class="mt-2">Registros de ciudades</h5>
                                <p class="text-body">Click para ver registros de ciudades</p>
                            </div>
                            <button class="card-button" style="background:#35C35D ">Ingreso</button>
                        </div>
                    </div>
                    <div class="col-lg-4 d-flex justify-content-center align-items-center">
                        <div class="card mt-5 mb-2" data-aos="fade-up-right" data-aos-easing="linear" data-aos-duration="400"> 
                            <img src="../IMG/Tipos_Docuemnto_Card_11zon.webp" class="card-img-top" alt="Imagen_Egresados" width="300px" height="200px">
                            <div class="card-details">
                                <h5 class="mt-2" >Listado de egresados</h5>
                                <p class="text-body">Click para ver Listado de egresados</p>
                            </div>
                            <button class="card-button" style="background:#35C35D ">Ingreso</button>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <footer style="max-height: 160px; font-family: monospace; text-decoration: black; background-color: #35C35D">
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

    <%
        String res = request.getParameter("respuesta");

        if (res != null) {
            switch (res) {
                case "AdminGuaradado":
    %>
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header  text-white" style="background: #35C35D">
                <strong class="me-auto ">Exito!!</strong>
                <small>Ahora</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Administrador guardado correctamente!!
            </div>
        </div>
    </div>
    <%
            break;
        case "CCRegistrada":

    %>
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header  text-white" style="background: #35C35D">
                <strong class="me-auto ">Upss!!</strong>
                <small>Ahora</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Cedula ya registrada
            </div>
        </div>
    </div>
    <%                    break;
        case "ExitoSuperAdmin":
    %>
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header  text-white" style="background: #35C35D">
                <strong class="me-auto ">Exito!!</strong>
                <small>Ahora</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Super Admin registrado correctamente!!
            </div>
        </div>
    </div>
    <%
                    break;
                default:
                    throw new AssertionError();
            }

        }

    %>



    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>

    <!-- Bootstrap JavaScript Libraries -->
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
            integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"
            integrity="sha384-BBtl+eGJRgqQAUMxJ7pMwbEyER4l1g+O15P+16Ep7Q9Q+zqX6gSbd85u4mG4QzX+" crossorigin="anonymous">
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-/WfsFq4XLtXJzweC9UJ7o4JvW/2HGM8eNQwuqzoU4llitlLVvc/UnzgZ81gMdd6R" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</html>

<script>
                AOS.init();
</script>

<script>
    // Activar el toast cuando la página se carga
    window.onload = function () {
        var toastEl = document.querySelector('.toast');
        var toast = new bootstrap.Toast(toastEl);
        toast.show();
    };
</script>