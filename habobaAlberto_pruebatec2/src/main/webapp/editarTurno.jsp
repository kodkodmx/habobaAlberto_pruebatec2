<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.softek.logica.Turno" %>
<%@ page import="java.util.List" %>
<%@page import="com.softek.logica.Ciudadano"%>
<%@page import="com.softek.logica.Tramite"%>
<%@page import="com.softek.logica.Turno.EstadoTurno"%>


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Editar Turno</title>
    </head>
    <body>
        <%
            HttpSession miSesion = request.getSession(false);
            String login;
            if (miSesion.getAttribute("email") != null) {
                login = (String) miSesion.getAttribute("email");
                String mensaje = request.getParameter("mens");
        %>
        <div class="typewriter">
            <h1>Bienvenido <%= login %></h1>
            <br>
            <% if (mensaje != null) { %>
            <h2 id="alerta"><%= mensaje %></h2>
            <% } else { %>
            <h2>Modificar Turno:</h2>
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

        <%
            Turno turno = (Turno) miSesion.getAttribute("turno");
            List<Ciudadano> listaCiudadanos = (List<Ciudadano>) miSesion.getAttribute("listaCiudadanos");
            List<Tramite> listaTramites = (List<Tramite>) miSesion.getAttribute("listaTramites");
            if (turno == null) {
        %>

        <form action="EditarTurnoSv" method="GET" autocomplete="off">
            <fieldset>
                <legend>Turno a Editar:</legend>
                <label for="id">ID del Turno:</label><br>
                <input type="text" id="id" name="id" placeholder="ID del turno" required><br><br>
                <input type="submit" value="Buscar Turno">
            </fieldset>
        </form>

        <% } else { %>

        <form action="EditarTurnoSv" method="POST" autocomplete="off">
            <fieldset>
                <legend>Modificar Turno:</legend>

                <label for="ciudadano"><strong>Ciudadano:</strong></label>
                <select id="ciudadano" name="ciudadano" required>
                    <% 
                        for (Ciudadano ciudadano : listaCiudadanos) {
                            String selected = ciudadano.getClaveIdentificacion().equals(turno.getElCiudadano().getClaveIdentificacion()) ? "selected" : "";
                            out.println("<option value=\"" + ciudadano.getClaveIdentificacion() + "\" " + selected + ">" + ciudadano.getNombre() + " " + ciudadano.getApellido() + "</option>");
                        }
                    %>
                </select><br><br>

                <label for="tramite"><strong>Trámite:</strong></label>
                <select id="tramite" name="tramite" required>
                    <% 
                        for (Tramite tramite : listaTramites) {
                            String selected = tramite.getId() == turno.getElTramite().getId() ? "selected" : "";
                            out.println("<option value=\"" + tramite.getId() + "\" " + selected + ">" + tramite.getNombre() + "</option>");
                        }
                    %>
                </select><br><br>

                <label for="fecha"><strong>Fecha:</strong></label>
                <input type="date" id="fecha" name="fecha" value="<%= turno.getFecha() %>" required><br><br>

                <label for="estado"><strong>Estado:</strong></label>
                <select id="estado" name="estado" required>
                    <option value="EN_ESPERA" <%= "EN_ESPERA".equals(turno.getEstado().name()) ? "selected" : "" %>>En espera</option>
                    <option value="YA_ATENDIDO" <%= "YA_ATENDIDO".equals(turno.getEstado().name()) ? "selected" : "" %>>Atendido</option>
                </select><br><br>

                <input type="hidden" name="id" value="<%= turno.getId() %>">
                <input type="submit" value="Guardar Cambios">
            </fieldset>
        </form>

        <% } %>
        <% } else {
                response.sendRedirect("login.jsp?mens=Primero Inicia Sesion!");
            } %>

        <br>
        <footer>
            <blockquote>
                "El mejor servicio al cliente es aquel que supera las expectativas." - Richard Branson.
            </blockquote>
            <p>© Sistema Desarrollado por Alberto Haboba</p>
        </footer>
    </body>
</html>
