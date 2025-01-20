<%@page import="java.util.List"%>
<%@page import="com.softek.logica.Ciudadano"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Buscar Ciudadanos</title>
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
            <h2>Por Favor Ingresa los datos del Ciudadano:</h2>
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
                Ciudadano ciudadano = (Ciudadano) miSesion.getAttribute("ciudadano");
                if (ciudadano != null) { %>
        <div id="retardo7">
            <fieldset>
                <legend>Datos de <%= ciudadano.getClaveIdentificacion() %></legend>
                <p><strong>Nombre:</strong> <%= ciudadano.getNombre() %></p>
                <p><strong>Apellido:</strong> <%= ciudadano.getApellido() %></p>
                <p><strong>Clave de Identificación:</strong> <%= ciudadano.getClaveIdentificacion() %></p>
            </fieldset>
        </div>
        <% } else { %>
        <form action="BuscarCiudadanoSv" method="POST" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Clave de Identificación del Ciudadano a Buscar:</legend>
                <label for="claveIdentificacion">Clave de Identificación:</label><br>
                <input type="text" id="claveIdentificacion" name="claveIdentificacion" placeholder="1234567890" required><br><br>
                <input type="submit" value="Buscar Ciudadano">
            </fieldset>
        </form>
        <% } %>
        <% } %>

        <form action="BuscarCiudadanoSv" method="GET" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Mostrar todos los Ciudadanos</legend>
                <%
                    List<Ciudadano> listaCiudadanos = (List<Ciudadano>) miSesion.getAttribute("listaCiudadanos");
                    if (listaCiudadanos != null && !listaCiudadanos.isEmpty()) {
                %>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Clave de Identificación</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Ciudadano ciudadano : listaCiudadanos) { %>
                        <tr>
                            <td><%= ciudadano.getNombre() %></td>
                            <td><%= ciudadano.getApellido() %></td>
                            <td><%= ciudadano.getClaveIdentificacion() %></td>
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
