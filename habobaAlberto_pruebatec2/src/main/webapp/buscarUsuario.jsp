<%@page import="java.util.List"%>
<%@page import="com.softek.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Buscar Usuarios</title>
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
                <h2>Por Favor Ingresa el email del Usuario:</h2>
            <% } %>
        </div>
        <form action="" method="POST" id="retardo7">
            <button type="submit" name="action" value="logout">Sign Out</button>
        </form>
        <br>
        <%String ocultar = (String) miSesion.getAttribute("ocultar"); %>
        <% if (ocultar == null) { %>
        <% Usuario user = (Usuario) miSesion.getAttribute("usuario"); %>
        <% if (user == null) { %>
            <form action="BuscarUsuarioSv" method="POST" autocomplete="off" id="retardo7">
                <fieldset>
                    <legend>Correo del Usuario a Buscar:</legend>
                    <label for="email">Correo electrónico:</label><br>
                    <input type="email" id="email" name="email" placeholder="usuario@dominio.com" required><br><br>
                    <input type="submit" value="Buscar Usuario">
                </fieldset>
            </form>
        <% } else { %>
            <div>
                <fieldset>
                    <legend>Datos de <%= user.getEmail() %></legend>
                    <p><strong>Nombre:</strong> <%= user.getNombre() %></p>
                    <p><strong>Apellido:</strong> <%= user.getApellido() %></p>
                    <p><strong>Email:</strong> <%= user.getEmail() %></p>
                </fieldset>
            </div>
        <% }}else{ %>
        <form action="BuscarUsuarioSv" method="GET" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Mostrar todos los Usuarios</legend>
                <%
                    List<Usuario> listaUsuarios = (List<Usuario>) miSesion.getAttribute("listaUsuarios");
                    if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
                %>
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Apellido</th>
                            <th>Email</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (Usuario usuario : listaUsuarios) { %>
                        <tr>
                            <td><%= usuario.getNombre() %></td>
                            <td><%= usuario.getApellido() %></td>
                            <td><%= usuario.getEmail() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                <% } else { %>
                <p>No hay usuarios registrados.</p>
                <% } %>
                <input type="submit" value="Mostrar Todos">
            </fieldset>
        </form>
        <% }} else { 
            response.sendRedirect("login.jsp?mens=Primero Inicia Sesión.");
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
