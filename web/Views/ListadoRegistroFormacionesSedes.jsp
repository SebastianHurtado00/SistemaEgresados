<%-- 
    Document   : ListadoRegistroFormacionesSedes
    Created on : 18/03/2024, 09:28:59 AM
    Author     : ASUS
--%>

<%@page import="Entidades.Tipodocumento"%>
<%@page import="Controladores.TipodocumentoJpaController"%>
<%@page import="Entidades.Formacion"%>
<%@page import="Controladores.FormacionJpaController"%>
<%@page import="Entidades.Sede"%>
<%@page import="java.util.List"%>
<%@page import="Controladores.SedeJpaController"%>
<%@page import="Entidades.Usuarios"%>
<%-- 
    Document   : ListadoRegistroPoblaciones
    Created on : 17/03/2024, 09:35:58 PM
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
        TipodocumentoJpaController controlTipoDocs = new TipodocumentoJpaController();
        List<Tipodocumento> ListaTiposDocs = controlTipoDocs.findTipodocumentoEntities();
        List<Tipodocumento> ListaTiposDocs2 = controlTipoDocs.findTipodocumentoEntities();

    %>
    <head>
        <title>Listado Y registro de Poblaciones</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <!-- Bootstrap CSS v5.2.1 -->
        <link rel="shortcut icon" href="../IMG/marcador-de-posicion.webp" type="image/x-icon">
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
                                    <div class="notice-content"style="font-family: monospace">
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

        <section class="mt-3 p-3">
            <div class="card mx-auto" style="font-family: monospace; max-width: 900px ; min-width: 200px;" >
                <h5 class="card-title text-center mt-4" > <img src="../IMG/marcador-de-posicion.webp" alt="alt" width="30px" height="30px"/>  Listado Registro y edicion de Sedes</h5>
                <div class="input-group mb-3 mt-2 p-2">
                    <input type="text" class="form-control" placeholder="Busqueda de Sedes"
                           name="Dato_User" id="filtro1">
                    <button class="btn btn-success btn-sm" type="button" data-bs-toggle="modal"
                            data-bs-target="#ModalRegistroSede"><a style="color: white ; text-decoration: none">Regitrar Sede</a></button>
                </div>
                <div class="table-responsive" >
                    <div class="table-wrapper-scroll-y my-custom-scrollbar p-2" style="height: 300px">
                        <table id="tabla1" class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID Sedes</th>
                                    <th scope="col">Nombre Sede</th>
                                    <th>                     </th>
                                    <th scope="col">Configuracion</th>
                                </tr>
                            </thead>
                            <tbody>


                                <%
                                    SedeJpaController controlSedes = new SedeJpaController();
                                    List<Sede> Listasede = controlSedes.findSedeEntities();

                                    for (Sede sede : Listasede) {


                                %>
                                <tr>
                                    <td class="align-middle"><%=sede.getId()%></td>
                                    <td class="align-middle"><%=sede.getNombre()%></td>
                                    <td></td>
                                    <td class="align-middle"><i class="fa-solid fa-gear fa-lg mx-5"type="button" data-bs-toggle="modal"
                                                                data-bs-target="#ModalRegistroModificar" data-info = '{
                                                                "IdSede" : "<%=sede.getId()%>" ,
                                                                "NombreSede" : "<%=sede.getNombre()%>"
                                                                }'></i></td>

                                </tr>

                                <%                                    }
                                %>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <section class="mt-2 p-3">
            <div class="card mx-auto" style="font-family: monospace ; max-width: 900px ; min-width:  250px;" >
                <h5 class="card-title text-center mt-4" > <img src="../IMG/formacion.webp" alt="alt" width="30px" height="30px"/> Listado Registro y edicion de Formaciones</h5>
                <div class="input-group mb-3 mt-2 p-2">

                    <input type="text" class="form-control" placeholder="Busqueda de Formaciones"
                           name="Dato_User" id="filtro2">
                    <button class="btn btn-success btn-sm" type="button" data-bs-toggle="modal"
                            data-bs-target="#ModalRegistroFormaciones"><a style="color: white ; text-decoration: none">Regitrar Formacion</a></button>
                </div>
                <div class="table-responsive" >
                    <div class="table-wrapper-scroll-y my-custom-scrollbar p-2" style="height: 300px">
                        <table id="tabla2" class="table table-striped">
                            <thead>
                                <tr>

                                    <th scope="col">ID Formacion</th>
                                    <th scope="col">Nombre Fomracion</th>
                                    <th scope="col">Sede perteneciente</th>
                                    <th scope="col">Configuracion</th>

                                </tr>
                            </thead>
                            <tbody>
                                <% FormacionJpaController controlFormacion = new FormacionJpaController();
                                    List<Formacion> ListaFormacion = controlFormacion.findFormacionEntities();
                                    for (Formacion formacion : ListaFormacion) {
                                %>
                                <tr>
                                    <td class="align-middle"><%= formacion.getId()%></td>
                                    <td class="align-middle"><%= formacion.getNombre()%></td>
                                    <td class="align-middle"><%= formacion.getSedeID().getNombre()%></td>
                                    <td class="align-middle">
                                        <i class="fa-solid fa-gear fa-lg mx-5" type="button" data-bs-toggle="modal" data-bs-target="#ModalModificarFormaciones" data-info='{
                                           "IdFormacion": "<%= formacion.getId()%>",
                                           "NombreFormacion": "<%= formacion.getNombre()%>",
                                           "SedePerteneciente": "<%= formacion.getSedeID().getId()%>"
                                           }'></i>
                                    </td>
                                </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </section>

        <!-- Modal Regsitro de Sede -->
        <div class="modal fade" id="ModalRegistroSede" tabindex="-1" aria-labelledby="ModalRegistroSede" aria-hidden="true" style="font-family: monospace">
            <div class="modal-dialog modal-dialog-centered">
                <form action="<%=request.getContextPath()%>/CrudFormacionesSedes" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="ModalRegistro">Registro Sedes</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body mx-auto">
                            <div class="row">
                                <div class="col-8 mx-auto">
                                    <img src="../IMG/codigo-de-barras.webp" alt="alt" width="25px" height="25px"/> 
                                    <label for="IdRegistrarSede" class="form-label">ID de Sede</label>
                                    <input type="number" id="IdRegistrarSede" name="IdRegistrarSede" class="form-control mb-3" max="99999999999" required>
                                </div>
                                <div class="col-8 mx-auto">
                                    <img src="../IMG/marcador-de-posicion.webp" alt="alt" width="25px" height="25px"/> 
                                    <label for="NombreSede" class="form-label">Nombre de Sede</label>
                                    <input type="text" id="NombreSede" name="NombreSede" class="form-control mb-2" maxlength="60" required>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button value="guardarSede" name="btnFormacionesSedes" class="btn btn-success">Guardar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <!-- Modal Modificar Sede -->
        <div class="modal fade" id="ModalRegistroModificar" tabindex="-1" aria-labelledby="ModalRegistroModificar" aria-hidden="true" style="font-family: monospace">
            <div class="modal-dialog modal-dialog-centered">
                <form action="<%=request.getContextPath()%>/CrudFormacionesSedes" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="ModalRegistro">Modificar Sede</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body mx-auto">
                            <div class="row">
                                <div class="col-8 mx-auto">
                                    <img src="../IMG/codigo-de-barras.webp" alt="alt" width="25px" height="25px"/> 
                                    <label for="IdModificarSede" class="form-label">ID de Sede</label>
                                    <input type="number" id="IdModificarSede" name="IdModificarSede" class="form-control mb-3" max="99999999999" required>
                                </div>
                                <div class="col-8 mx-auto">
                                    <img src="../IMG/marcador-de-posicion.webp" alt="alt" width="25px" height="25px"/> 
                                    <label for="NombreSedeModificar" class="form-label">Nombre de Sede</label>
                                    <input type="text" id="NombreSedeModificar" name="NombreSedeModificar" class="form-control mb-2" maxlength="60" required>
                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button value="ModificarSedes" name="btnFormacionesSedes" class="btn btn-warning">Modificar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <!-- Modal Regsitro de Formaciones -->
        <div class="modal fade" id="ModalRegistroFormaciones" tabindex="-1" aria-labelledby="ModalRegistroFormacion" aria-hidden="true" style="font-family: monospace">
            <div class="modal-dialog modal-dialog-centered">
                <form action="<%=request.getContextPath()%>/CrudFormacionesSedes" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="ModalRegistro">Registro Formacion</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body mx-auto">
                            <div class="row">
                                <div class="col-8 mx-auto">
                                    <img src="../IMG/codigo-de-barras.webp" alt="alt" width="25px" height="25px"/> 
                                    <label for="Id" class="form-label">ID de Formacion</label>
                                    <input type="number" id="Id" name="IdRegistroFormacion" class="form-control mb-2" max="99999999999" required>
                                </div>
                                <div class="col-8 mx-auto">
                                    <img src="../IMG/formacion.webp" alt="alt" width="25px" height="25px"/> 
                                    <label for="NombreFormacionRegistrar" class="form-label">Nombre de Formacion</label>
                                    <input type="text" id="NombreFormacionRegistrar" name="NombreFormacionRegistrar" class="form-control mb-2" maxlength="45" required>
                                </div>
                                <div class="col-8 mx-auto">
                                    <img src="../IMG/marcador-de-posicion.webp" alt="alt" width="25px" height="25px"/> 
                                    <label for="SedePerteneciente" class="form-label">Sede perteneciente</label>
                                    <select id="SedePerteneciente" name="SedePerteneciente" class="form-select" required>
                                        <option disabled selected value="">Seleccione una opción</option>
                                        <% for (Sede sede : Listasede) {%>
                                        <option value="<%= sede.getId()%>"><%= sede.getNombre()%></option>
                                        <% }%>
                                    </select>

                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button name="btnFormacionesSedes" value="RegistroFormaciones" class="btn btn-success">Guardar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>


        <!-- Modal Modificar de Formaciones -->
        <div class="modal fade" id="ModalModificarFormaciones" tabindex="-1" aria-labelledby="ModalModificarFormaciones" aria-hidden="true" style="font-family: monospace">
            <div class="modal-dialog modal-dialog-centered">
                <form action="<%=request.getContextPath()%>/CrudFormacionesSedes" method="post">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="ModalRegistro">Modificar Formacion</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body mx-auto">
                            <div class="row">
                                <div class="col-8 mx-auto">
                                    <img src="../IMG/codigo-de-barras.webp" alt="alt" width="25px" height="25px"/> 
                                    <label for="IdFormacionModificar" class="form-label">ID de Formacion</label>
                                    <input type="number" id="IdFormacionModificar" name="IdFormacionModificar" class="form-control mb-2" max="99999999999" required>
                                </div>
                                <div class="col-8 mx-auto">
                                    <img src="../IMG/formacion.webp" alt="alt" width="25px" height="25px"/> 
                                    <label for="NombreFormacionModificar" class="form-label">Nombre de Formacion</label>
                                    <input type="text" id="NombreFormacionModificar" name="NombreFormacionModificar" class="form-control mb-2" maxlength="45" required>
                                </div>
                                <div class="col-8 mx-auto">
                                    <img src="../IMG/marcador-de-posicion.webp" alt="alt" width="25px" height="25px"/> 
                                    <label for="SedePertenecienteModificar" class="form-label">Sede perteneciente</label>
                                    <select id="SedePertenecienteModificar"name="SedePertenecienteModificar" class="form-select" required>
                                        <option  selected disabled value="">Seleccione una opción</option>
                                        <% for (Sede sede : Listasede) {%>
                                        <option value="<%=sede.getId()%>"><%=sede.getNombre()%></option>
                                        <%
                                            }
                                        %>

                                    </select>

                                </div>

                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cerrar</button>
                            <button name="btnFormacionesSedes" value="FormacionesModificar" class="btn btn-warning">Modificar</button>
                        </div>
                    </div>
                </form>
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
                    <p class="contact-info" style="margin-left: 10%; color: white;"> &copy; By Sebastian Navaja - Crystian Peralta
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


    <%
        String res = request.getParameter("respuesta");

        if (res != null) {
            switch (res) {
                case "RegsitroGuardado":
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
                Registro ya existente
            </div>
        </div>
    </div>
    <%                    break;
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
                No se han encontrado cambios!!
            </div>
        </div>
    </div>
    <%
            break;
        case "ModificacionExitosa":
    %>
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header  text-white" style="background: #35C35D">
                <strong class="me-auto ">Exito!!</strong>
                <small>Ahora</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Registro Modificado corectamente!!
            </div>
        </div>
    </div>
    <%
            break;
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
                    break;
            }

        }

    %>


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
<script src="../JS/IniciarToast.js"></script>
</html>

<script>
            //Formaciones Tratamiento de Modal
// DOMContentLoaded Este evento se dispara cuando el documento HTML ha sido completamente cargado y analizado.
            document.addEventListener("DOMContentLoaded", function () {

                // Selecciona todos los botones "Editar" que tienen ciertos atributos específicos.
                var editarButtonsFormacion = document.querySelectorAll('i[data-bs-target="#ModalModificarFormaciones"][data-info*="IdFormacion"]');

                //Creamos un metodo que llenara nuestro ventana emergente con la informacion del votante
                function llenarModal(data) {
                    // Llena los campos del modal con los datos del votante
                    document.getElementById("IdFormacionModificar").value = data.IdFormacion;
                    document.getElementById("NombreFormacionModificar").value = data.NombreFormacion;
                    document.getElementById("SedePertenecienteModificar").value = data.SedePerteneciente;
                }

                // Itera sobre cada botón "Editar".
                editarButtonsFormacion.forEach(function (button) {
                    // Agrega un evento de clic a cada botón "Editar".
                    button.addEventListener("click", function () {
                        // Obtiene la información del votante desde el atributo "data-info" en formato JSON.
                        //RECORDAR JS sabe la data-info porque este esta realizando el evento en cada boton editar y obtendra la info del boton al que se le de click
                        // this.getAttribute("data-info") = De este boton al que se le dio click dame su data-info
                        var data = JSON.parse(this.getAttribute("data-info"));
                        //Con la data recibida del boton se llena el modal con su metodo
                        llenarModal(data);
                    });
                });
            });

</script>

<script>
    //Sede Tratamiento de Modal
// DOMContentLoaded Este evento se dispara cuando el documento HTML ha sido completamente cargado y analizado.
    document.addEventListener("DOMContentLoaded", function () {

        // Selecciona todos los botones "Editar" que tienen ciertos atributos específicos.
        var editarButtonsSede = document.querySelectorAll('i[data-bs-target="#ModalRegistroModificar"][data-info*="IdSede"]');

        //Creamos un metodo que llenara nuestro ventana emergente con la informacion del votante
        function llenarModal(data) {
            // Llena los campos del modal con los datos del votante
            document.getElementById("IdModificarSede").value = data.IdSede;
            document.getElementById("NombreSedeModificar").value = data.NombreSede;

        }

        // Itera sobre cada botón "Editar".
        editarButtonsSede.forEach(function (button) {
            // Agrega un evento de clic a cada botón "Editar".
            button.addEventListener("click", function () {
                // Obtiene la información del votante desde el atributo "data-info" en formato JSON.
                //RECORDAR JS sabe la data-info porque este esta realizando el evento en cada boton editar y obtendra la info del boton al que se le de click
                // this.getAttribute("data-info") = De este boton al que se le dio click dame su data-info
                var data = JSON.parse(this.getAttribute("data-info"));
                //Con la data recibida del boton se llena el modal con su metodo
                llenarModal(data);
            });
        });
    });

</script>