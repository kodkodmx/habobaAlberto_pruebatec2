<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.softek.logica.Turno" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Baja Turno</title>
    </head>
    <body>
        <%
            HttpSession miSesion = request.getSession(false);
            String login;
            if (miSesion.getAttribute("email") != null) {
                login = (String) miSesion.getAttribute("email");
                String mensaje = request.getParameter("mens");
                List<Turno> listaTurnos = (List<Turno>) miSesion.getAttribute("listaTurnos");
        %>
        <div class="typewriter">
            <h1>Bienvenido <%= login %></h1>
            <br>
            <% if (mensaje != null) { %>
            <h2 id="alerta"><%= mensaje %></h2>
            <% } else { %>
            <h2>Seleccione el turno a eliminar:</h2>
            <% } %>
        </div>

        <div class="button-container" id="retardo7">
            <form action="MenuSv" method="POST" id="logoutForm">
                <button type="submit" name="action" value="logout" class="button">Cerrar sesión</button>
            </form>
            <form action="MenuSv" method="POST" id="menuForm">
                <button type="submit" name="menuAction" value="menu" class="button">Menú Principal</button>
            </form>
        </div>
        <br>

        <form action="BajaTurnoSv" method="POST" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Borrar Turno</legend>

                <label for="turno">Turno:</label><br>
                <select id="turno" name="turno" required>
                    <% 
                        if (listaTurnos != null && !listaTurnos.isEmpty()) {
                            for (Turno turno : listaTurnos) {
                                out.println("<option value=\"" + turno.getId() + "\">" + " Clave Identificacion: " + turno.getElCiudadano().getClaveIdentificacion() + " / Tramite: " + turno.getElTramite().getNombre() +" / Fecha: " + turno.getFecha() + "</option>");
                            }
                        } else {
                    %>
                    <option value="" disabled>No hay turnos disponibles</option>
                    <% } %>
                </select><br><br>

                <input type="submit" value="Eliminar Turno">
            </fieldset>
        </form>
        <% } else {
                response.sendRedirect("login.jsp?mens=Primero Inicia Sesion!");
            } %>

        <br>
        <footer>
            <blockquote>
                "El mejor servicio al cliente es aquel que supera las expectativas." - Richard Branson, fundador de Virgin Group.
            </blockquote>
            <p>© Sistema Desarrollado por Alberto Haboba</p>
        </footer>
    </body>
</html>
