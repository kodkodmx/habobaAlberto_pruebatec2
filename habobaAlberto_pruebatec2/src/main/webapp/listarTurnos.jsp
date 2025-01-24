<%@page import="com.softek.logica.Turno.EstadoTurno"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="com.softek.logica.Turno" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Listar Turnos</title>
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
            <h1>Bienvenido <%= login%></h1>
            <br>
            <% if (mensaje != null) {%>
            <h2 id="alerta"><%= mensaje%></h2>
            <% } else { %>
            <h2>Listado de Turnos:</h2>
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
            List<Turno> listaTurnos = (List<Turno>) session.getAttribute("listaTurnos");
            if (listaTurnos != null && !listaTurnos.isEmpty()) {
        %>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Ciudadano</th>
                    <th>Trámite - Descripción</th>
                    <th>Fecha</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% for (Turno turno : listaTurnos) {%>
                <tr>
                    <td><%= turno.getId()%></td>
                    <td><%= turno.getElCiudadano().getNombre()%></td>
                    <td><%= turno.getElTramite().getNombre() + " - " + turno.getElTramite().getDescripcion() %></td>
                    <td><%= turno.getFecha()%></td>
                    <td><%= turno.getEstado()%></td>
                    <td>
                        <a href="EditarTurnoSv?id=<%= turno.getId()%>">Editar</a>
                        <a href="GestorTurnosSv?action=baja&id=<%= turno.getId()%>">Eliminar</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <p>No hay turnos disponibles.</p>
        <% } %>


        <% } else {
                response.sendRedirect("login.jsp?mens=Primero Inicia Sesion!");
            }
        %>
        <br>
        <footer>
            <blockquote>
                "La gestión efectiva es clave para un buen servicio." - Richard Branson.
            </blockquote>
            <p>© Sistema Desarrollado por Alberto Haboba</p>
        </footer>
    </body>
</html>
