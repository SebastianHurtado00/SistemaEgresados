<%-- 
    Document   : RestablecerPassword
    Created on : 9/04/2024, 04:03:13 PM
    Author     : ASUS
--%>

<%@page import="java.time.ZoneId"%>
<%@page import="java.time.LocalDateTime"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
// Obtener la URL base
    String urlBase = request.getRequestURL().toString();

// Obtener la cadena de consulta (parámetros)
    String queryString = request.getQueryString();

// Combinar la URL base y la cadena de consulta para obtener la URL completa
    String urlCompleta = urlBase + (queryString != null ? "?" + queryString : "");

// Almacenar la URL completa en la sesión
    HttpSession session1 = request.getSession();
    session1.setAttribute("urlAnterior", urlCompleta);

// Recuperar el token de la URL
    String tokenFromURL = request.getParameter("token");

// Recuperar la cédula del usuario de la URL
    int cedula2 = 0; // Inicializamos la cédula a 0 por defecto
    try {
        cedula2 = Integer.parseInt(request.getParameter("cedula"));
    } catch (NumberFormatException e) {
        // Manejo de error si la cédula no se puede convertir a entero
        e.printStackTrace();
    }

// Almacenar el token en la sesión
    session1.setAttribute("sesionToken", tokenFromURL);

// Verificar si el token es nulo o si ha expirado
    if (tokenFromURL == null) {
        // Si el token es nulo, redirigir al usuario a la página de inicio
        response.sendRedirect("../index.jsp");
    } else {
        // Obtener la fecha de expiración del token en milisegundos desde la época
        long expirationMillis = Long.parseLong(request.getParameter("expiration"));

        // Obtener la fecha y hora actual
        LocalDateTime now = LocalDateTime.now();

        // Convertir la fecha y hora actual a milisegundos
        long nowMillis = now.atZone(ZoneId.systemDefault()).toInstant().toEpochMilli();

        System.out.println("className.methodName()" + nowMillis);

        // Verificar si el token ha expirado
        if (nowMillis > expirationMillis) {
            // Si el token ha expirado, redirigir al usuario a la página de inicio
            response.sendRedirect("../index.jsp");
        } else {
            // El token es válido, continuar con el proceso de cambio de contraseña
%>

<html>
    <head>
        <title>Restablecer contraseña</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="shortcut icon" href="../IMG/work-from-home.webp" type="image/x-icon">
        <!-- Bootstrap CSS v5.2.1 -->
        <link rel="shortcut icon" href="" type="image/x-icon">
        <link rel="stylesheet" href="../CSS/HomeAdministrador.css"/>
        <link rel="stylesheet" href="../CSS/Footer.css"/>
        <link rel="stylesheet" href="../CSS/UsuarioConectado.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

    </head>
    <body>
        <!-- Demo header-->
        <section class="section-0 d-flex justify-content-between">
            <h2 class="text-start mt-4" style="margin-left: 7px; font-family: serif">Regional Sucre</h2>
            <img src="../IMG/Logo_Sena_Sin_Fondo.png" width="150px" height="200px" alt="alt" class="align-self-end img-fluid"/>
        </section>

        <!--Menu-->
        <header style="font-family: monospace" class="header">
            <nav class="navbar navbar-expand-md bg-body-tertiary">
                <div class="container-fluid d-flex justify-content-between align-items-center">

                    <!--Items del menu -->
                    <div class="collapse navbar-collapse" id="navbarText">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="RestablecerPassword.jsp">Restablezca su contraseña</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </header>

        <div class="container">
            <div class="card mt-5 mx-auto" style="max-width: 800px;">
                <div class="card-header">
                    <h5 class="card-title">Cambiar Contraseña</h5>
                </div>
                <div class="card-body">
                    <form action="<%=request.getContextPath()%>/RestablecimientosContrase_as" method="post">
                        <div class="mb-3">
                            <label for="numeroDocumento" class="form-label">Número de Documento</label>
                            <input type="text" class="form-control" id="numeroDocumento" value="<%=cedula2%>" name="numeroDocumentoCambio" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="password1" class="form-label">Contraseña Nueva</label>
                            <input type="password" class="form-control" name="PasswordNueva" id="password1" placeholder="Ingrese su contraseña actual" required>
                        </div>
                        <div class="mb-3">
                            <label for="password2" class="form-label">Confirmar Contraseña</label>
                            <input type="password" class="form-control" name="ConfirmacionPassword" id="password2" placeholder="Ingrese su nueva contraseña" required>
                        </div>
                        <button value="RestablecerNewPage" name="BtnRestablecer" class="btn btn-success mt-2">Cambiar Contraseña</button>
                    </form>
                </div>
            </div>
        </div>



    </body>
    <footer style="max-height: 160px; font-family: monospace; text-decoration: black; background-color: #35C35D" class="position-fixed bottom-0 w-100">
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
</html>

<%
        }
    }
// Establecer encabezados para evitar el almacenamiento en caché de la página
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0
    response.setHeader("Expires", "0");
%>