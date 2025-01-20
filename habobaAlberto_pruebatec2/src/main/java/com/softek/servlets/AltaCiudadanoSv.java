package com.softek.servlets;

import com.softek.logica.ControladoraLogica;
import com.softek.logica.Ciudadano;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "AltaCiudadanoSv", urlPatterns = {"/AltaCiudadanoSv"})
public class AltaCiudadanoSv extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String claveIdentificacion = request.getParameter("claveIdentificacion");

        Ciudadano ciudadano = new Ciudadano(nombre, apellido, claveIdentificacion, null, true);


        control.crearCiudadano(ciudadano);

        response.sendRedirect("index.jsp?mens=Ciudadano Creado Exitosamente!");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para dar de alta un nuevo Ciudadano";
    }
}
