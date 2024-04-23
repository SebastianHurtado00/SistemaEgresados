<%-- 
    Document   : RegistrosEgresados
    Created on : 17/03/2024, 09:38:13 AM
    Author     : ASUS
--%>

<%@page import="Controladores.TipoPoblacionJpaController"%>
<%@page import="Entidades.TipoPoblacion"%>
<%@page import="Entidades.Ciudad"%>
<%@page import="Entidades.Formacion"%>
<%@page import="Entidades.Sede"%>
<%@page import="Entidades.Sexo"%>
<%@page import="Controladores.NivelFormacionJpaController"%>
<%@page import="Entidades.NivelFormacion"%>
<%@page import="Controladores.CiudadJpaController"%>
<%@page import="Controladores.FormacionJpaController"%>
<%@page import="Controladores.SedeJpaController"%>
<%@page import="Controladores.SexoJpaController"%>
<%@page import="java.util.List"%>
<%@page import="Controladores.TipodocumentoJpaController"%>
<%@page import="Entidades.Tipodocumento"%>
<%@page import="Entidades.Usuarios"%>
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
        SexoJpaController controlSexo = new SexoJpaController();
        SedeJpaController controlSede = new SedeJpaController();
        FormacionJpaController controlFormacion = new FormacionJpaController();
        CiudadJpaController controlCiudad = new CiudadJpaController();
        NivelFormacionJpaController controlNivelFomacion = new NivelFormacionJpaController();
        TipoPoblacionJpaController controlTipoPoblacion = new TipoPoblacionJpaController();

        List<Tipodocumento> listaTipoDoc = controlTipoDoc.findTipodocumentoEntities();
        List<Sexo> listaSexo = controlSexo.findSexoEntities();
        List<TipoPoblacion> listaTipoPoblacion = controlTipoPoblacion.findTipoPoblacionEntities();
        List<Sede> ListaSedes = controlSede.findSedeEntities();
        List<Formacion> listaFormacion = controlFormacion.findFormacionEntities();
        List<Ciudad> listaCiudades = controlCiudad.findCiudadEntities();
        List<NivelFormacion> listaNivelFormacion = controlNivelFomacion.findNivelFormacionEntities();

        TipodocumentoJpaController controlTipoDocs = new TipodocumentoJpaController();
        List<Tipodocumento> ListaTiposDocs = controlTipoDocs.findTipodocumentoEntities();
        List<Tipodocumento> ListaTiposDocs2 = controlTipoDocs.findTipodocumentoEntities();

    %>
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
                                <a class="dropdown-item" href="ListadoRegistroPoblaciones.jsp">Lisatdo y Registro de Poblaciones</a>
                                <a class="dropdown-item" href="ListadoRegistroCiudades.jsp">Listado y Registro de  ciudades</a>
                                <a class="dropdown-item" href="ListadoRegistroFormacionesSedes.jsp">Lisatdo y Registros de Formaciones y sedes</a>
                            </div>
                        </li>

                        <%
                            Usuarios userAdminValidarMenu = (Usuarios) sessionObtenida.getAttribute("Admin");
                            if (userAdminValidarMenu == null) {
                        %>
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
                        <%
                            }

                        %>
                        <li class="nav-item">
                            <a class="nav-link" href="FiltradoEgresados.jsp">Filtrados de Egresados</a>
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
        <!--Formulario Egresados -->
        <section class="p-3" aty>

            <div class="col-md-12 d-md-flex justify-content-end justify-content-sm-end">
                <form action="<%=request.getContextPath()%>/ManejoDeExcels" method="post" enctype="multipart/form-data">
                    <div class="d-grid gap-2 ">
                        <div class="input-group mb-2">
                            <input type="file" class="form-control" name="csvFile" id="fileInput3" required="1" accept=".csv">
                            <button name="BtnExcel" value="action" class="btn btn-outline-success" style="font-family: monospace" onclick="document.getElementById('inputArchivoExcel').click();">Importar datos desde Excel <i class="fa-solid fa-file-excel"></i></button>
                        </div>
                    </div>
                </form>
            </div>


            <form action="<%=request.getContextPath()%>/RegistroEgresados" method="post">
                <div class="card mb-5 mt-3 mx-auto" style="max-width: 900px ; min-width: 200px; font-family: monospace">

                    <h5 class="card-title text-center mt-3" ><img src="../IMG/graduado.webp" alt="alt" width="50px" height="50px"/>  Registros de egresados</h5>

                    <div class="card-body">

                        <!--Seccion de datos Personales -->
                        <div class="page" id="page1">
                            <div class="row">
                                <h5 class="card-title mb-4">Informacion Personal</h5>
                                <div class="col-md-6">
                                    <img src="../IMG/id-facial.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="numeroDocumento" class="form-label">N° Documento</label>
                                    <input type="number" name="numeroDocumento" id="numeroDocumento" class="form-control mb-3" required max="99999999999">

                                    <img src="../IMG/nombre.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="nombres" class="form-label">Nombres</label>
                                    <input type="text" id="nombres" name="nombres" class="form-control mb-3" required maxlength="45">

                                    <img src="../IMG/etiqueta-de-nombre.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="apellidos" class="form-label">Apellidos</label>
                                    <input type="text" name="apellidos" id="apellidos" class="form-control mb-3" required maxlength="45">
                                </div>

                                <div class="col-md-6">
                                    <img src="../IMG/tarjeta-de-identificacion.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="tipoDocumento" class="form-label">Tipo de Documento</label>
                                    <select name="tipoDocumento" id="tipoDocumento" class="form-select mb-3" required>
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <%

                                            for (Tipodocumento tipoDoc : listaTipoDoc) {
                                                out.print("<option value ='" + tipoDoc.getId() + "'> ");
                                                out.print(tipoDoc.getNombre());
                                                out.print("</option>");
                                            }
                                        %>
                                    </select>

                                    <img src="../IMG/sexo.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="sexo" class="form-label">Sexo</label>
                                    <select name="sexo" id="sexo" class="form-select mb-3" required>
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <%
                                            for (Sexo sex : listaSexo) {
                                        %>
                                        <option value="<%=sex.getId()%>"><%=sex.getNombre()%></option>
                                        <%
                                            }
                                        %>
                                    </select>

                                    <img src="../IMG/personas.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="tipoPoblacion" class="form-label">Tipo de Población</label>
                                    <select name="tipoPoblacion" id="tipoPoblacion" class="form-select mb-3" required>
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <%
                                            for (TipoPoblacion TipoPoblacion : listaTipoPoblacion) {
                                        %>
                                        <option value="<%=TipoPoblacion.getId()%>"><%=TipoPoblacion.getNombre()%></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>
                            <div class="row">
                                <h5 class="card-title mb-4">Informacion Residencia y contactos</h5>
                                <div class="col-md-6">

                                    <img src="../IMG/edificios.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="ciudad" class="form-label">Ciudad</label>
                                    <select name="ciudad" id="ciudad" class="form-select mb-3" required>
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <%
                                            for (Ciudad ciudad : listaCiudades) {
                                        %>
                                        <option value="<%=ciudad.getId()%>"><%=ciudad.getNombre()%></option>
                                        <%
                                            }
                                        %>
                                    </select>

                                    <img src="../IMG/marcador-de-posicion.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="direccion" class="form-label">Dirección</label>
                                    <input type="text"name="direccion" id="direccion" class="form-control mb-3" maxlength="100" placeholder="Opcional">
                                </div>

                                <div class="col-md-6">
                                    <img src="../IMG/certificado.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="numCertificados" class="form-label">N° de Certificados</label>
                                    <input type="number" name="numCertificados" id="numCertificados" class="form-control mb-3" max="99999999999"" placeholder="Opcional">

                                    <img src="../IMG/gmail.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="correo" class="form-label">Correo</label>
                                    <input type="email" name="correo" id="correo" class="form-control mb-3" maxlength="45">
                                </div>

                                <div class="row">
                                    <div class = "col-md-3">
                                    </div>
                                    <div class = "col-md-6">
                                        <img src="../IMG/atencion-al-cliente.webp" alt="alt" width="30px" height="30px"/>
                                        <label for="numContacto" class="form-label mx-auto">Número de Contacto</label>
                                        <input type="number" name="numContacto" id="numContacto" class="form-control mb-3">
                                    </div>
                                    <div class = "col-md-3">
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-5">
                                <h5 class="card-title mb-4">Informacion Academica y laboral</h5>
                                <div class="col-md-4">
                                    <img src="../IMG/SedeFormacion.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="sede" class="form-label">Sede</label>
                                    <select name="sede" id="sede" class="form-select mb-3">
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <%
                                            for (Sede sede : ListaSedes) {
                                        %>
                                        <option value="<%=sede.getId()%>"><%=sede.getNombre()%></option>
                                        <%
                                            }
                                        %>
                                    </select>

                                    <!-- Pregunta y check Box sobre cadena de formacion -->
                                    <div>
                                        <!-- Pregunta -->
                                        <label class="form-label mx-2">¿Cadena de formación?</label>
                                        <br>
                                        <!-- Checkbox "Sí" -->
                                        <div class="form-check form-check-inline mx-4">
                                            <input class="form-check-input"  name="CadenaFormacion" type="checkbox" id="siCheckbox" value="1" onchange="mostrarOcultarInput(this.checked, 'miInputContainer', 'siCheckbox', 'noCheckbox'), validarCheckboxes()">
                                            <label class="form-check-label" for="siCheckbox">Sí</label>
                                        </div>

                                        <!-- Checkbox "No" -->
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" name="CadenaFormacion" type="checkbox" id="noCheckbox" value="0" onchange="mostrarOcultarInput(!this.checked, 'miInputContainer', 'siCheckbox', 'noCheckbox'), validarCheckboxes()">
                                            <label class="form-check-label" for="noCheckbox">No</label>
                                        </div>

                                        <!-- Contenedor del input -->
                                        <div id="miInputContainer" style="display: none; margin-top: 10px;">
                                            <input name="FormacionCursada" class="form-control mb-3" type="text" id="miInput" placeholder="Formacion Cursada">
                                        </div>
                                    </div>

                                </div>

                                <div class="col-md-4">
                                    <img src="../IMG/formacion.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="formacion" class="form-label">Formación</label>
                                    <select name="formacion" id="formacion" class="form-select mb-3">
                                        <option  value="" selected disabled>Seleccione una opción</option>
                                        <%
                                            for (Formacion formacion : listaFormacion) {
                                        %>
                                        <option value="<%=formacion.getId()%>"><%=formacion.getNombre()%></option>
                                        <%
                                            }
                                        %>
                                    </select>



                                    <!-- Pregunta y check Box sobre Experiencia -->
                                    <div >
                                        <!-- Pregunta -->
                                        <label class="form-label mx-2">¿Experiencia Laboral?</label>
                                        <br>
                                        <!-- Checkbox "Sí" -->
                                        <div class="form-check form-check-inline mx-4">
                                            <input class="form-check-input" name="Experiencia" type="checkbox" id="siCheckboxExp" value="1" onchange="mostrarOcultarInput(this.checked, 'miInputContainerExp', 'siCheckboxExp', 'noCheckboxExp'), validarCheckboxes()">
                                            <label class="form-check-label" for="siCheckbox">Sí</label>
                                        </div>

                                        <!-- Checkbox "No" -->
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input"  name="Experiencia" type="checkbox" id="noCheckboxExp" value="0" onchange="mostrarOcultarInput(!this.checked, 'miInputContainerExp', 'siCheckboxExp', 'noCheckboxExp'), validarCheckboxes()">
                                            <label class="form-check-label" for="noCheckbox">No</label>
                                        </div>

                                        <!-- Contenedor del input -->
                                        <div id="miInputContainerExp" style="display: none; margin-top: 10px;">
                                            <textarea id="" name="ExperienciaDescrip" rows="5" cols="" class="form-control" placeholder="Describa su experiencia maximo(300 caracteres)" maxlength="300"></textarea>

                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-4">
                                    <img src="../IMG/crecimiento.webp" alt="alt" width="30px" height="30px"/>
                                    <label for="nivelFormacion" class="form-label">Nivel de Formación</label>
                                    <select id="nivelFormacion" name="nivelFormacion" class="form-select mb-3">
                                        <option value="" selected disabled>Seleccione una opción</option>
                                        <%
                                            for (NivelFormacion Niveñformacion : listaNivelFormacion) {
                                        %>
                                        <option value="<%=Niveñformacion.getId()%>"><%=Niveñformacion.getNombre()%></option>
                                        <%
                                            }
                                        %>
                                    </select>

                                    <!-- Pregunta y check Box sobre Carrera Universitaria -->
                                    <div>
                                        <!-- Pregunta -->
                                        <label class="form-label mx-2">¿Carrera Univerisitaria?</label>
                                        <br>
                                        <!-- Checkbox "Sí" -->
                                        <div class="form-check form-check-inline mx-4">
                                            <input class="form-check-input" type="checkbox" name="CarreraUniversitaria" id="siCheckboxUni" value="1" onchange="mostrarOcultarInput(this.checked, 'miInputContainerUni', 'siCheckboxUni', 'noCheckboxUni'), validarCheckboxes()">
                                            <label class="form-check-label" for="siCheckbox">Sí</label>
                                        </div>

                                        <!-- Checkbox "No" -->
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="checkbox" id="noCheckboxUni" name="CarreraUniversitaria" value="0" onchange="mostrarOcultarInput(!this.checked, 'miInputContainerUni', 'siCheckboxUni', 'noCheckboxUni'), validarCheckboxes()">
                                            <label class="form-check-label" for="noCheckbox">No</label>
                                        </div>

                                        <!-- Contenedor del input -->
                                        <div id="miInputContainerUni" style="display: none; margin-top: 10px;">
                                            <input class="form-control mb-3" type="text" maxlength="100" id="miInput"name="NombreUni" placeholder="Nombre Univerisad">
                                            <input class="form-control mb-3" type="text" maxlength="100" id="miInput" name="NombreCarrera" placeholder="Nombre Carrera">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row mb-5">
                                <!-- Pregunta y check Box su estdo de trabajo -->
                                <div class="d-flex justify-content-center" >
                                    <!-- Pregunta -->
                                    <label class="form-label mx-2">¿Se encuntra trabajando actualmente?</label>
                                    <br>
                                    <!-- Checkbox "Sí" -->
                                    <div class="form-check form-check-inline mx-4">
                                        <input class="form-check-input" type="checkbox" name="trabajando" id="siCheckboxTraba" value="1" onchange="validarCheckboxes(); uncheckCheckbox('noCheckboxTraba');">
                                        <label class="form-check-label" for="siCheckbox">Sí</label>
                                    </div>

                                    <!-- Checkbox "No" -->
                                    <div class="form-check form-check-inline">
                                        <input class="form-check-input" type="checkbox" id="noCheckboxTraba" name="trabajando" value="0" onchange="validarCheckboxes(); uncheckCheckbox('siCheckboxTraba');">
                                        <label class="form-check-label" for="noCheckbox">No</label>
                                    </div>
                                </div>
                            </div>
                            <button value="RegistrarEgresados" name="BtnEgresados" class="btn btn-outline-success" disabled >Guardar</button>
                        </div>
                    </div>
                </div>
            </form>
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
    <%
        String res = request.getParameter("respuesta");

        if (res != null) {
            switch (res) {
                case "RegstroExitoso":
    %>
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header  text-white" style="background: #35C35D">
                <strong class="me-auto ">Exito!!</strong>
                <small>Ahora</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Registro guardado correctamente!!
            </div>
        </div>
    </div>
    <%
            break;
        case "Existente":

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
        case "Exito":
    %>
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header  text-white" style="background: #35C35D">
                <strong class="me-auto ">Exito!!</strong>
                <small>Ahora</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                La importacion del archivo CSV fue exitosa!!
            </div>
        </div>
    </div>
    <%
            break;
        case "fallo":
    %>
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header  text-white" style="background: #35C35D">
                <strong class="me-auto ">Upss!!</strong>
                <small>Error</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Revise su archivo CSV y su logica de llenado no se pudo subir el archivo!!
            </div>
        </div>
    </div>
    <%
                    break;
                default:
                    break;
            }

        }

    %>



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
    <script src="../JS/IniciarToast.js"></script>
    <script>
                                            function validarCheckboxes() {
                                                var siCheckboxExp = document.getElementById("siCheckboxExp");
                                                var noCheckboxExp = document.getElementById("noCheckboxExp");
                                                var siCheckboxUni = document.getElementById("siCheckboxUni");
                                                var noCheckboxUni = document.getElementById("noCheckboxUni");
                                                var siCheckboxCadena = document.getElementById("siCheckbox");
                                                var noCheckboxCadena = document.getElementById("noCheckbox");
                                                var siCheckboxTraba = document.getElementById("siCheckboxTraba");
                                                var noCheckboxTraba = document.getElementById("noCheckboxTraba");
                                                var submitButton = document.querySelector("[name='BtnEgresados']");

                                                // Verificar si al menos uno de los checkboxes de cada grupo está seleccionado
                                                var experienciaLaboralSeleccionada = siCheckboxExp.checked || noCheckboxExp.checked;
                                                var carreraUniversitariaSeleccionada = siCheckboxUni.checked || noCheckboxUni.checked;
                                                var cadenaFormacionSeleccionada = siCheckboxCadena.checked || noCheckboxCadena.checked;
                                                var trabajandoSeleccionado = siCheckboxTraba.checked || noCheckboxTraba.checked;

                                                // Habilitar el botón de enviar si al menos uno de los checkboxes de cada grupo está seleccionado
                                                submitButton.disabled = !(experienciaLaboralSeleccionada && carreraUniversitariaSeleccionada && cadenaFormacionSeleccionada && trabajandoSeleccionado);
                                            }

    </script>
    <script>
        function uncheckCheckbox(checkboxId) {
            // Desmarca el otro checkbox
            document.getElementById(checkboxId).checked = false;
        }
    </script>
</html>
