package com.softek.servlets;

import com.softek.logica.ControladoraLogica;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginSv", urlPatterns = {"/LoginSv"})
public class LoginSv extends HttpServlet {

    ControladoraLogica control = new ControladoraLogica();
    
      protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        boolean autorizado = control.validarAcceso(email,password);
        
        if (autorizado == true) {
            HttpSession miSesion = request.getSession();
            miSesion.setAttribute("email", email);
            response.sendRedirect("login.jsp");
        }
        else {
            response.sendRedirect("login.jsp");
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
