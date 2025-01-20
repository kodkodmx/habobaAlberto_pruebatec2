<%@page import="com.softek.logica.Tramite"%>
<%@page import="java.util.List"%>
<%@page import="com.softek.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Buscar Tramites</title>
    </head>
    <body>
        <%
            HttpSession miSesion = request.getSession(false);
            String login;
            if (miSesion != null && miSesion.getAttribute("email") != null) {
                login = (String) miSesion.getAttribute("email");
                String mensaje = request.getParameter("mens");
        %>
        <div class="typewriter">
            <h1>Bienvenido <%= login %></h1>
            <br>
            <% if (mensaje != null) { %>
            <h2 id="alerta"><%= mensaje %></h2>
            <% } else { %>
            <h2>Por Favor Ingresa el nombre del Tramite:</h2>
            <% } %>
        </div>
        <div class="button-container" id="retardo7">
            <form action="MenuSv" method="POST" id="logoutForm"">
                <button type="submit" name="action" value="logout" class="button">Cerrar sesión</button>
            </form>
            <form action="MenuSv" method="POST" id="menuForm">
                <button type="submit" name="menuAction" value="menu" class="button">Menú Principal</button>
            </form>
        </div>
        <br>

        <%
            String ocultar = (String) miSesion.getAttribute("ocultar");
            if (ocultar == null) {
                Tramite tramite = (Tramite) miSesion.getAttribute("tramite");
                if (tramite != null) { %>
        <div id="retardo7">
            <fieldset>
                <legend>Datos de <%= tramite.getNombre() %></legend>
                <p><strong>Nombre:</strong> <%= tramite.getNombre() %></p>
                <p><strong>Descripcion:</strong> <%= tramite.getDescripcion() %></p>
            </fieldset>
        </div>
        <% } else { %>
        <form action="BuscarTramiteSv" method="POST" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Nombre del Tramite a Buscar:</legend>
                <label for="nombre">Nombre:</label><br>
                <input type="text" id="nombre" name="nombre" placeholder="Nombre de Tramite" required><br><br>
                <input type="submit" value="Buscar Tramite">
            </fieldset>
        </form>
        <% } %>
        <% } %>

        <form action="BuscarTramiteSv" method="GET" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Mostrar todos los Tramites</legend>
                <%
                    List<Tramite> listaTramites = (List<Tramite>) miSesion.getAttribute("listaTramites");
                    if (listaTramites != null && !listaTramites.isEmpty()) {
                %>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Descripcion</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Tramite tramite : listaTramites) { %>
                        <tr>
                            <td><%= tramite.getNombre() %></td>
                            <td><%= tramite.getDescripcion() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <% } %>
                <input type="submit" value="Mostrar Todos">
            </fieldset>
        </form>
        <% } else {
            response.sendRedirect("login.jsp?mens=Primero Inicia Sesion.");
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
