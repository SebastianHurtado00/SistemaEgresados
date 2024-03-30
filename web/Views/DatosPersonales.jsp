<%-- 
    Document   : DatosPersonales
    Created on : 18/03/2024, 11:12:56 AM
    Author     : ASUS
--%>

<%@page import="java.util.List"%>
<%@page import="Controladores.TipodocumentoJpaController"%>
<%@page import="Entidades.Tipodocumento"%>
<%@page import="Entidades.Usuarios"%>
<%-- 
    Document   : HomeAdministradores
    Created on : 15/03/2024, 07:46:33 AM
    Author     : ASUS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <%
        
        response.setHeader("Cache-Control", "no-Cache,no-store,must-revalidate");
        HttpSession sessionObtenida = request.getSession();
        String MenuHome = "";
        Usuarios usuarioEntrante = new Usuarios();
        if ((sessionObtenida.getAttribute("Admin") != null) || (sessionObtenida.getAttribute("SuperAdmin") != null)) {
            
            Usuarios userAdmin = (Usuarios) sessionObtenida.getAttribute("Admin");
            Usuarios userSuperAdmin = (Usuarios) sessionObtenida.getAttribute("SuperAdmin");
            
            if (userAdmin != null) {
                MenuHome = "HomeAdministradores.jsp";
                usuarioEntrante = userAdmin;
            } else {
                MenuHome = "HomeSuperAdmin.jsp";
                usuarioEntrante = userSuperAdmin;
            }
            
        } else {
            //Si no hay session administrativa se maata la sssion que entre
            HttpSession sessionCerrar = request.getSession(false); // Obtén la sesión sin crear una nueva si no existe.
            if (sessionCerrar != null) {
                sessionCerrar.invalidate(); // Invalida la sesión actual
            }
            response.sendRedirect("index.jsp"); // Redirige al índice

        }
        TipodocumentoJpaController controlTipoDoc = new TipodocumentoJpaController();
        List<Tipodocumento> listaTipoDocumento = controlTipoDoc.findTipodocumentoEntities();

    %>
    <head>

        <title>Home Administradores</title>
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
                                    <div class="username text-small"><%=usuarioEntrante.getNombre()%></div> 
                                    <div class="text-center text-small text-gray">Admin</div>
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
                            <a class="nav-link active" aria-current="page" href="<%=MenuHome%>">Home</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                Registros
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" href="RegistrosEgresados.jsp">Registro Egresados</a>
                                <a class="dropdown-item" href="RestablecimientoContrasehaEgresados.jsp">Reestablecer contraseña de Egresados</a>
                                <a class="dropdown-item" href="ListadoRegistroPoblaciones.jsp">Listado y Registro de Poblaciones</a>
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
        <section style="font-family: monospace">
            <div class="card mx-auto mt-5 mb-5" style="max-width: 800px">
                <h5 class="card-title text-center mt-2">Datos Personales</h5>
                <form action="<%=request.getContextPath()%>/LogicaDatosUsuario" method="post">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6">
                                <label for="Num_Cedula" class="form-label">N° Cedula</label>
                                <input class="form-control" type="number" id="Num_Cedula" max="999999999999" name="Num_Cedula" value="<%=usuarioEntrante.getCedula()%>" readonly="">
                            </div>
                            <div class="col-md-6">
                                <label for="Tipo_Doc" class="form-label">Tipo Cedula</label>
                                <select  name="TipoDoc" class="form-select" id="Tipo_Doc">
                                    <option value="<%=usuarioEntrante.getTipoDocID().getId()%>" ><%=usuarioEntrante.getTipoDocID().getNombre()%></option>
                                    <% for (Tipodocumento TipoDoc : listaTipoDocumento) {
                                            if (usuarioEntrante.getTipoDocID().getId() != TipoDoc.getId()) {
                                    %>
                                    <option value="<%=TipoDoc.getId()%>"><%=TipoDoc.getNombre()%></option>
                                    <%
                                            }
                                        }
                                    %>
                                </select>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <div class="col-md-6">
                                <label for="Nombre" class="form-label">Nombre</label>
                                <input class="form-control" type="text" maxlength="45" id="Nombre" name="Nombre" value="<%=usuarioEntrante.getNombre()%>" required>
                            </div>
                            <div class="col-md-6">
                                <label for="Apellidos" class="form-label">Apellidos</label>
                                <input class="form-control" type="text" maxlength="45" id="Apellidos" name="Apellidos" value="<%=usuarioEntrante.getApellido()%>" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label for="Correo" class="form-label">Correo</label>
                                <input class="form-control" type="email" maxlength="200" id="Correo" name="Correo" value="<%=usuarioEntrante.getCorreo()%>" required>
                            </div>
                            <div class="col-md-6 mb-4">
                                <label for="Telefono" class="form-label">Telefono</label>
                                <input class="form-control" type="tel" max="9999999999" id="Telefono" name="Telefono" value="<%=usuarioEntrante.getTelefono()%>" required>
                            </div>
                        </div>
                        <div class="d-grid gap-2 col-4 mx-auto mt-4 mb-4">
                            <button class="btn btn-success" name="BtnModificar" value="Modificar" >Modificar</button>
                        </div>
                    </div>
                </form>
            </div>
        </section>


    </body>
    <footer  style="max-height: 160px; font-family: monospace; text-decoration: black; background-color: #35C35D">
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

    <%            String res = request.getParameter("respuesta");
        
        if (res != null) {
            switch (res) {
                case "SinCambios":
    %>
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header  text-white" style="background: #35C35D">
                <strong class="me-auto ">Upps!!</strong>
                <small>Ahora</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                No se han encontrado Cambios!!
            </div>
        </div>
    </div>
    <%        
            break;
        case "Edicion":

    %>
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header  text-white" style="background: #35C35D">
                <strong class="me-auto ">Exito!!</strong>
                <small>Ahora</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Edicion Exitosa !!
            </div>
        </div>
    </div>
    <%                        break;
                default:
                    break;
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="../JS/IniciarToast.js"></script>
</html>
<script>
                AOS.init();
</script>