package com.softek.servlets;

import com.softek.logica.ControladoraLogica;
import com.softek.logica.Ciudadano;
import com.softek.persistencia.exceptions.NonexistentEntityException;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "BajaCiudadanoSv", urlPatterns = {"/BajaCiudadanoSv"})
public class BajaCiudadanoSv extends HttpServlet {

    private final ControladoraLogica control = new ControladoraLogica();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String claveIdentificacion = request.getParameter("claveIdentificacion");
        Ciudadano ciudadano = control.buscarCiudadano(claveIdentificacion);
        HttpSession miSesion = request.getSession();
        if (ciudadano != null) {
            miSesion.setAttribute("ciudadano", ciudadano);
            response.sendRedirect("bajaCiudadano.jsp?mens=Ciudadano encontrado!"); 
        } else {
            response.sendRedirect("bajaCiudadano.jsp?mens=Ciudadano no encontrado!");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            String idString = request.getParameter("id");
            long id = Long.parseLong(idString);
        try {
            control.eliminarCiudadano(id);
        } catch (NonexistentEntityException ex) {
            Logger.getLogger(BajaCiudadanoSv.class.getName()).log(Level.SEVERE, null, ex);
        }
            
            response.sendRedirect("index.jsp?mens=Ciudadano eliminado con Exito!");
    }

    @Override
    public String getServletInfo() {
        return "Servlet para gestionar la eliminación de ciudadanos.";
    }
}
