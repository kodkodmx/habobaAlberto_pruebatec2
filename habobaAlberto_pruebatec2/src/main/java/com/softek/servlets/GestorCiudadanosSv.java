package com.softek.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "GestorCiudadanosSv", urlPatterns = {"/GestorCiudadanosSv"})
public class GestorCiudadanosSv extends HttpServlet {
    

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        switch (action) {
            case "alta":
                response.sendRedirect("altaCiudadano.jsp");
                break;
            case "editar":
                response.sendRedirect("editarCiudadano.jsp");
                break;
            case "buscar":
                response.sendRedirect("buscarCiudadano.jsp");
                break;
            case "borrar":
                response.sendRedirect("bajaCiudadano.jsp");
                break;
            default:
                response.sendRedirect("error.jsp");
                break;
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
