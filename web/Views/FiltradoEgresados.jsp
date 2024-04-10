<%-- 
    Document   : FiltradoEgresados
    Created on : 19/03/2024, 07:35:48 AM
    Author     : ASUS
--%>

<%@page import="Controladores.EgresadoJpaController"%>
<%@page import="Entidades.Egresado"%>
<%@page import="Entidades.Formacion"%>
<%@page import="Entidades.Ciudad"%>
<%@page import="Entidades.NivelFormacion"%>
<%@page import="Entidades.Sede"%>
<%@page import="Entidades.TipoPoblacion"%>
<%@page import="Entidades.Sexo"%>
<%@page import="java.util.List"%>
<%@page import="Entidades.Tipodocumento"%>
<%@page import="Controladores.NivelFormacionJpaController"%>
<%@page import="Controladores.TipoPoblacionJpaController"%>
<%@page import="Controladores.CiudadJpaController"%>
<%@page import="Controladores.FormacionJpaController"%>
<%@page import="Controladores.SexoJpaController"%>
<%@page import="Controladores.TipodocumentoJpaController"%>
<%@page import="Controladores.SedeJpaController"%>
<%@page import="Entidades.Usuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<head>
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

    <title>Filtrado de Egresados</title>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS v5.2.1 -->
    <link rel="shortcut icon" href="../IMG/graduado.webp" type="image/x-icon">
    <link rel="stylesheet" href="../CSS/HomeAdministrador.css"/>
    <link rel="stylesheet" href="../CSS/Footer.css"/>
    <link rel="stylesheet" href="../CSS/UsuarioConectado.css"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <link rel="stylesheet" href="../CSS/TableScroll.css"/>
    <link rel="stylesheet" href="../CSS/ButtonSend.css"/>
    <script src="https://kit.fontawesome.com/0702706600.js" crossorigin="anonymous"></script>
</head>
<html>
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

        <section class="mt-3 p-5">
            <div class="card mx-auto p-2" style="font-family: monospace" >
                <h5 class="card-title text-center mt-4" > <img src="../IMG/formacion.webp" alt="alt" width="30px" height="30px"/> Filtrado de egresados</h5>
                <div class="input-group mb-3 mt-2 p-2">
                    <i id="start-btn" class="fa-solid fa-microphone-lines btn btn-success py-3" onclick="voz()"></i>
                    <input type="text" class="form-control" placeholder="Busqueda de Egresados"
                           name="Dato_User" id="filtro">
                </div>

                <div class="row">
                    <div class="col-md-4">
                        <img src="../IMG/sexo.webp" alt="alt" width="25px" height="25px"/> 
                        <label for="sexo" class="form-label">Sexo</label>
                        <select id="sexo" class="form-select mb-3" onchange="filtrarTabla()" >
                            <option value="" selected  ">Seleccione una opción</option>
                            <%
                                for (Sexo sex : listaSexo) {
                            %>
                            <option value="<%=sex.getId()%>"><%=sex.getNombre()%></option>
                            <%                                }
                            %>
                        </select>
                        <img src="../IMG/marcador-de-posicion.webp" alt="alt" width="25px" height="25px"/> 
                        <label for="sede" class="form-label">Sede</label>
                        <select id="sede" class="form-select mb-3"onchange="filtrarTabla()" >
                            <option value="" selected >Seleccione una opción</option>
                            <%
                                for (Sede sede : ListaSedes) {
                            %>
                            <option value="<%=sede.getId()%>"><%=sede.getNombre()%></option>
                            <%                                }
                            %>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <img src="../IMG/formacion.webp" alt="alt" width="25px" height="25px"/> 
                        <label for="formacion" class="form-label">Formacion</label>
                        <select id="formacion" class="form-select mb-3" onchange="filtrarTabla()"> 
                            <option value="" selected >Seleccione una opción</option>
                            <%
                                for (Formacion forma : listaFormacion) {
                            %>
                            <option value="<%=forma.getId()%>"><%=forma.getNombre()%></option>
                            <%                                }
                            %>
                        </select>

                        <img src="../IMG/experiencia.webp" alt="alt" width="25px" height="25px"/> 
                        <label for="Experiencia" class="form-label">Experiencia</label>
                        <select id="Experiencia" class="form-select mb-3"onchange="filtrarTabla()">
                            <option value="" selected >Seleccione una opción</option>
                            <option value="1">Si</option>
                            <option value="0">No</option>
                        </select>
                    </div>
                    <div class="col-md-4">
                        <img src="../IMG/labor.webp" alt="alt" width="25px" height="25px"/> 
                        <label for="Labrando" class="form-label">Laborando</label>
                        <select id="Laborando" class="form-select mb-3"onchange="filtrarTabla()">
                            <option value="" selected >Seleccione una opción</option>
                            <option value="1">Si</option>
                            <option value="0">No</option>
                        </select>

                        <img src="../IMG/edificios.webp" alt="alt" width="25px" height="25px"/> 
                        <label for="Ciudad" class="form-label">Ciudad</label>
                        <select id="Ciudad" class="form-select mb-3" onchange="filtrarTabla()">
                            <option value="" selected >Seleccione una opción</option>
                            <%
                                for (Ciudad ciudad : listaCiudades) {
                            %>
                            <option value="<%=ciudad.getId()%>"><%=ciudad.getNombre()%></option>
                            <%
                                }
                            %>
                        </select>
                    </div>
                </div>
                <div class="table-responsive" >
                    <div class="table-wrapper-scroll-y my-custom-scrollbar p-2">
                        <table id="miTabla" class="table table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">N° Cedula</th>
                                    <th scope="col">Tipo Documento</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Apellido</th>
                                    <th scope="col">Sexo</th>                             
                                    <th scope="col">Tipo Poblacion</th>
                                    <th scope="col">Sede</th>
                                    <th scope="col">Formacion</th>
                                    <th scope="col">Ciudad</th>
                                    <th scope="col" >Correo</th>
                                    <th scope="col">Contacto</th>
                                    <th>Experiencia</th>
                                    <th>¿Trabajando?</th>
                                    <th>Configuracion</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%
                                    EgresadoJpaController controlEgresados = new EgresadoJpaController();
                                    List<Egresado> listaEgresados = controlEgresados.findEgresadoEntities();
                                    for (Egresado egresados : listaEgresados) {

                                %>

                                <tr>
                                    <td><%=egresados.getNumeroCedula()%></td>
                                    <td><%=egresados.getTipoDocumentoID().getNombre()%></td>
                                    <td><%=egresados.getNombre()%></td>
                                    <td><%=egresados.getApellido()%></td>
                                    <td><%=egresados.getSexoID().getNombre()%></td>
                                    <td><%=egresados.getTipoPoblacionID().getNombre()%></td>
                                    <td><%=egresados.getSedeID().getNombre()%></td>
                                    <td><%=egresados.getFormacionID().getNombre()%></td>
                                    <td><%=egresados.getCiudadID().getNombre()%></td>
                                    <td><%=egresados.getCorreo()%></td>
                                    <td><%=egresados.getNumeroTelefono()%></td>
                                    <td>
                                        <% if (egresados.getExperiencia()) { %>
                                        Sí
                                        <% } else { %>
                                        No
                                        <% }%>
                                    </td>
                                    <td>
                                        <% if (egresados.getTrabajando()) { %>
                                        Sí
                                        <% } else { %>
                                        No
                                        <% }%>
                                    </td>
                                    <td><i class="fa-solid fa-gear fa-lg mx-5" type="button" data-bs-toggle="modal"
                                           data-bs-target="#ModalModificacion" data-info = '{
                                           "Cedula" : "<%=egresados.getNumeroCedula()%>",
                                           "nombre" : "<%=egresados.getNombre()%>",
                                           "apellido" : "<%=egresados.getApellido()%>",
                                           "tipoDocumento" : "<%=egresados.getTipoDocumentoID().getId()%>",
                                           "sexo" : "<%=egresados.getSexoID().getId()%>",
                                           "correo" : "<%=egresados.getCorreo()%>",
                                           "telefono" : "<%=egresados.getNumeroTelefono()%>"
                                           }'></i></td>
                                </tr>

                                <%                                    }
                                %>
                            </tbody>
                        </table>
                    </div>
                </div>

                <!-- Modal -->
                <div class="modal fade" id="ModalModificacion" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered">
                        <form action="<%=request.getContextPath()%>/ModificacionEgresado" method="">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h1 class="modal-title fs-5" id="exampleModalLabel">Modificacion Datos Basicos</h1>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <img src="../IMG/id-facial.webp" alt="alt" width="30px" height="30px"/>
                                            <label for="numeroDocumento" class="form-label">N° Documento</label>
                                            <input type="text" name="numeroDocumentoModal" id="numeroDocumentoModal" class="form-control mb-3" readonly max="99999999999">

                                            <img src="../IMG/nombre.webp" alt="alt" width="30px" height="30px"/>
                                            <label for="nombres" class="form-label">Nombres</label>
                                            <input type="text" name="nombresModal" id="nombresModal" class="form-control mb-3" maxlength="45">

                                            <img src="../IMG/etiqueta-de-nombre.webp" alt="alt" width="30px" height="30px"/>
                                            <label for="apellidos" class="form-label">Apellidos</label>
                                            <input type="text"  id="apellidos"name="apellidos" class="form-control mb-3" maxlength="45">

                                        </div>

                                        <div class="col-md-6">
                                            <img src="../IMG/tarjeta-de-identificacion.webp" alt="alt" width="30px" height="30px"/>
                                            <label for="tipoDocumento" class="form-label">Tipo de Documento</label>
                                            <select name="tipoDocumentoModal" id="tipoDocumentoModal" class="form-select mb-3" required>
                                                <% for (Tipodocumento TipoDoc : listaTipoDoc) {

                                                %>
                                                <option value="<%=TipoDoc.getId()%>"><%=TipoDoc.getNombre()%></option>
                                                <%

                                                    }
                                                %>
                                            </select>

                                            <img src="../IMG/sexo.webp" alt="alt" width="30px" height="30px"/>
                                            <label for="sexo" class="form-label">Sexo</label>
                                            <select  name="sexoModal" id="sexoModal" class="form-select mb-3" required>
                                                <%
                                                    for (Sexo sex : listaSexo) {

                                                %>
                                                <option value="<%=sex.getId()%>"><%=sex.getNombre()%></option>
                                                <%

                                                    }
                                                %>
                                            </select>

                                            <img src="../IMG/atencion-al-cliente.webp" alt="alt" width="30px" height="30px"/>
                                            <label for="telefonoModal" class="form-label">Telefono</label>
                                            <input name="telefonoModal" type="number" id="telefonoModal" class="form-control mb-3" >
                                        </div>

                                        <div class="mx-auto">
                                            <img src="../IMG/gmail.webp" alt="alt" width="30px" height="30px"/>
                                            <label for="correoModal" class="form-label">Correo</label>
                                            <input name="correoModal" type="email" id="correoModal" class="form-control mb-3"  maxlength="45">
                                        </div>

                                    </div>

                                </div>
                                <div class="modal-footer">
                                    <button  name="BtnEgresados" value="eliminar" type="button" class="btn btn-danger" onclick="eliminar()">Eliminar</button>
                                    <button name="BtnEgresados" value="ModificarAdmin" class="btn btn-warning">Modificar</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="d-grid gap-2 d-md-flex justify-content-md-end justify-content-sm-end mt-2 " style="margin-right: 2%">
                    <button class="correos" data-bs-toggle="modal" data-bs-target="#exampleModal">
                        <div class="svg-wrapper-1">
                            <div class="svg-wrapper">
                                <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    width="24"
                                    height="24"
                                    >
                                <path fill="none" d="M0 0h24v24H0z"></path>
                                <path
                                    fill="currentColor"
                                    d="M1.946 9.315c-.522-.174-.527-.455.01-.634l19.087-6.362c.529-.176.832.12.684.638l-5.454 19.086c-.15.529-.455.547-.679.045L12 14l6-8-8 6-8.054-2.685z"
                                    ></path>
                                </svg>
                            </div>
                        </div>
                        <span>Correo</span>
                    </button>
                </div>



                <div class="mx-auto">
                    <button class="btn btn-outline-danger mb-2">Descargar Reporte PDF Filtrado <i class="fa-regular fa-file-pdf"></i></i></button>
                </div>
            </div>

            <!-- Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" style="font-family:monospace">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel">Enviar Correo Masivo</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-body">
                            <label for="mensajeCorreo" class="form-label">Escriba un mensaje para los aprendices filtrados</label>
                            <textarea id="id" name="name" rows="5" cols="10" class="form-control"></textarea>
                        </div>
                        <div class="modal-footer mt-3 mb-2">

                            <i class="fa-regular fa-xl fa-paper-plane" style="color: #B197FC; margin-right: 5%"></i>
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
                No se encontraron Cambios!!
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
                Modificacion Exitosa!!
            </div>
        </div>
    </div>
    <%                        break;
        case "EliminacionExitosa":
    %>
    <div class="toast-container position-fixed bottom-0 end-0 p-3">
        <div id="liveToast" class="toast" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="toast-header  text-white" style="background: #35C35D">
                <strong class="me-auto ">Exito!!</strong>
                <small>Ahora</small>
                <button type="button" class="btn-close" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
            <div class="toast-body">
                Eliminacion Exitosa!!
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
    <script src="../JS/ReconocimientoVoz.js"></script>
    <script src="../JS/FiltradoTablas.js"></script>
    <script src="../JS/FiltrarTablaEgresados.js"></script>
    <script src="../JS/IniciarToast.js"></script>

</html>
<script>

                                        function eliminar() {
                                            Swal.fire({
                                                title: "Desea eliminar",
                                                text: "¿Está seguro de eliminar este Egresado?",
                                                icon: "warning",
                                                showCancelButton: true,
                                                confirmButtonColor: "#3085d6",
                                                cancelButtonColor: "#d33",
                                                confirmButtonText: "Si, Eliminar!"
                                            }).then((result) => {
                                                if (result.isConfirmed) {
                                                    // Obtener el ID del documento
                                                    var documentoID = document.getElementById("numeroDocumentoModal").value;
                                                    // Redirigir automáticamente a la página de eliminación con el ID del documento
                                                    window.location.href = "../ModificacionEgresado?ID=" + documentoID + "&BtnEgresados=eliminar";
                                                }
                                            });
                                        }


</script>

<script>
// DOMContentLoaded Este evento se dispara cuando el documento HTML ha sido completamente cargado y analizado.
    document.addEventListener("DOMContentLoaded", function () {

        // Selecciona todos los botones "Editar" que tienen ciertos atributos específicos.
        var editarButtons = document.querySelectorAll('i[data-bs-target="#ModalModificacion"][data-info*="Cedula"]');

        //Creamos un metodo que llenara nuestro ventana emergente con la informacion del votante
        function llenarModal(data) {
            // Llena los campos del modal con los datos del votante
            document.getElementById("numeroDocumentoModal").value = data.Cedula;
            document.getElementById("nombresModal").value = data.nombre;
            document.getElementById("apellidos").value = data.apellido;
            document.getElementById("tipoDocumentoModal").value = data.tipoDocumento;
            document.getElementById("sexoModal").value = data.sexo;
            document.getElementById("telefonoModal").value = data.telefono;
            document.getElementById("correoModal").value = data.correo;
        }

        // Itera sobre cada botón "Editar".
        editarButtons.forEach(function (button) {
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