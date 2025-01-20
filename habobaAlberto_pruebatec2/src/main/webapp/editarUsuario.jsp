<%@page import="com.softek.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Editar Usuarios</title>
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
            <h1>Bienvenido <%=login%></h1>
            <br>
            <%if (mensaje != null) {%>
            <h2 id="alerta"><%=mensaje%></h2>
            <%} else {%>
            <h2>Modificar Usuario:</h2>
            <%}%>
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
        <% Usuario user = (Usuario) miSesion.getAttribute("usuario");
            if (user == null) {
        %>
        <form action="EditarUsuarioSv" method="GET" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Correo del Usuario a Editar:</legend>
                <label for="email">Correo electronico:</label><br>
                <input type="email" id="email" name="email" placeholder="usuario@dominio.com" required><br><br>
                <input type="submit" value="Usuario a editar">
            </fieldset>
        </form>
        <%} else {%>
        <form action="EditarUsuarioSv" method="POST" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Modificar Usuario:</legend>

                <label for="nombre"><strong>Nombre:</strong></label>
                <input type="text" id="nombre" name="nombre" value="<%= user.getNombre()%>" required><br><br>

                <label for="apellido"><strong>Apellido:</strong></label>
                <input type="text" id="apellido" name="apellido" value="<%= user.getApellido()%>" required><br><br>

                <label for="email"><strong>Email:</strong></label>
                <input type="email" id="email" name="email" value="<%= user.getEmail()%>" required><br><br>

                <label for="password"><strong>Contraseña:</strong></label>
                <input type="password" id="password" name="password" value="<%= user.getPassword()%>" required><br><br>

                <label for="password2"><strong>Repetir Contraseña:</strong></label>
                <input type="password" id="password2" name="password2" value="Repetir la Contraseña" required><br><br>

                <input type="hidden" name="id" value="<%= user.getId()%>">
                <input type="submit" value="Editar Usuario">
            </fieldset>
        </form>
        <%}%>
        <%} else {
                response.sendRedirect("login.jsp?mens=Primero Inicia Sesion!");
            }%>
        <br>
        <footer>
            <blockquote>
                "El mejor servicio al cliente es aquel que supera las expectativas." - Richard Branson, fundador de Virgin Group.
            </blockquote>
            <p>© Sistema Desarrollado por Alberto Haboba</p>
        </footer>
    </body>
</html>
