<%-- 
    Document   : CerradoSession
    Created on : 26/03/2024, 10:00:29 AM
    Author     : ASUS
--%>

<%
    HttpSession sessionCerrar = request.getSession(false); // Obt�n la sesi�n sin crear una nueva si no existe.
    if (sessionCerrar != null) {
        sessionCerrar.invalidate(); // Invalida la sesi�n actual
    }
    response.sendRedirect("index.jsp"); // Redirige al �ndice
%>
