/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package servlet;

import Controladores.TipoPoblacionJpaController;
import Controladores.TipodocumentoJpaController;
import Controladores.UsuariosJpaController;
import Entidades.Tipodocumento;
import Entidades.Usuarios;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "CrudAdministradores", urlPatterns = {"/CrudAdministradores"})
public class CrudAdministradores extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter res = response.getWriter();
        String BtnRecibido = request.getParameter("BtnAdmin");

        switch (BtnRecibido) {
            case "BtnGuardarAdmin":
                // res.print("Guardado de admin");
                RegistroAdmin(request, response);
                break;
            default:
                throw new AssertionError();
        }
    }

    public void RegistroAdmin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        TipodocumentoJpaController controlTipoDocumento = new TipodocumentoJpaController();
        UsuariosJpaController controlUsuarios = new UsuariosJpaController();
        //Obtencion de datos
        int CedulaAdmin = Integer.parseInt(request.getParameter("CedulaAdmin"));
        String NombreAdmin = request.getParameter("NombreAdmin");
        String EmailAdmin = request.getParameter("EmailAdmin");
        String ApellidoAdmin = request.getParameter("ApellidoAdmin");
        Long TelefonoAdmin = Long.parseLong(request.getParameter("TelefonoAdmin"));
        String password = request.getParameter("PasswordAdmin");

        //Encontramos Tipo de documento
        int TipoDocSeleccionado = Integer.parseInt(request.getParameter("TipodocumentAdmin"));
        Tipodocumento TipoDocEncontrado = controlTipoDocumento.findTipodocumento(TipoDocSeleccionado);
        //Validamos que la Cedula ingresada no esta ya registrada

        Usuarios validacionUsuario = controlUsuarios.findUsuarios(CedulaAdmin);
        String MensajeUrl;
        if (validacionUsuario == null) {

            //Procede al guardado
            Usuarios AdminGuardar = new Usuarios();
            //Encriptasmos contraseña
            String passwordEncriptada = AdminGuardar.EncryptarClave(String.valueOf(CedulaAdmin));
            AdminGuardar.setCedula(CedulaAdmin);
            AdminGuardar.setNombre(NombreAdmin);
            AdminGuardar.setApellido(ApellidoAdmin);
            AdminGuardar.setTipoDocID(TipoDocEncontrado);
            AdminGuardar.setCorreo(EmailAdmin);
            AdminGuardar.setTelefono(TelefonoAdmin);
            AdminGuardar.setPassword(passwordEncriptada);
            AdminGuardar.setRol(0);
            try {
                controlUsuarios.create(AdminGuardar);
                MensajeUrl = "AdminGuaradado";
                response.sendRedirect("Views/HomeSuperAdmin.jsp?respuesta=" + MensajeUrl);
            } catch (Exception ex) {
                Logger.getLogger(CrudAdministradores.class.getName()).log(Level.SEVERE, null, ex);
            }

        } else {
            MensajeUrl = "CCRegistrada";
            response.sendRedirect("Views/HomeSuperAdmin.jsp?respuesta=" + MensajeUrl);
        }

    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
