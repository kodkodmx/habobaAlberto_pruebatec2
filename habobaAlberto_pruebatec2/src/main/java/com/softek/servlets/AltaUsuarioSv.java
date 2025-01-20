package com.softek.servlets;

import com.softek.logica.ControladoraLogica;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AltaUsuarioSv", urlPatterns = {"/AltaUsuarioSv"})
public class AltaUsuarioSv extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String password2 = request.getParameter("password2");

        if (password.equals(password2)) {
            control.crearUsuario(nombre, apellido, email, password);
        } else {
            response.sendRedirect("altaUsuario.jsp?mens=La Contrasenia no Coincide. Intenta Nuevamente!");
        }
        response.sendRedirect("index.jsp?mens=Usuario Creado Exitosamente!");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
