<%-- 
    Document   : obtener_correos
    Created on : 15/04/2024, 05:35:18 PM
    Author     : ASUS
--%>

<%@page import="com.google.gson.Gson"%>
<%@page import="Controladores.EgresadoJpaController"%>
<%@page import="Entidades.Egresado"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    //Integer sexoId = Integer.parseInt(sexo);
    String sexoStr = request.getParameter("sexo");
    int sexo = 0; // Valor por defecto en caso de que no se pueda convertir
    if (sexoStr != "" && !sexoStr.isEmpty()) {
        sexo = Integer.parseInt(sexoStr);
    }
    
    String sedeStr = request.getParameter("sede");
    int sede = 0;
    if (sedeStr != "" && !sedeStr.isEmpty()) {
        sede = Integer.parseInt(sedeStr);
    }
    
    String formacionStr = request.getParameter("formacion");
    int formacion = 0;
    if (formacionStr != "" && !formacionStr.isEmpty()) {
        formacion = Integer.parseInt(formacionStr);
    }
    
    String experienciaStr = request.getParameter("experiencia");
    int experiencia = 0;
    if (experienciaStr != "" && !experienciaStr.isEmpty()) {
        experiencia = Integer.parseInt(experienciaStr);
    }
    
    String laborandoStr = request.getParameter("laborando");
    int laborando = 0;
    if (laborandoStr != "" && !laborandoStr.isEmpty()) {
        laborando = Integer.parseInt(laborandoStr);
    }
    
    String ciudadStr = request.getParameter("ciudad");
    int ciudad = 0;
    if (ciudadStr != "" && !ciudadStr.isEmpty()) {
        ciudad = Integer.parseInt(ciudadStr);
    }

// Repite este patrón para los demás parámetros
    EgresadoJpaController controlEgresado = new EgresadoJpaController();

// Lógica para obtener los correos filtrados desde la base de datos utilizando tu controlador de correo
    List<String> correos = controlEgresado.obtenerCorreosFiltrados(sexo, sede, formacion, experiencia, laborando, ciudad);
    
    if (correos.isEmpty()) {
        out.print("No existen correos");
    } else {
        String correosJson = new Gson().toJson(correos);
        out.print(correosJson);
    }
    

%>