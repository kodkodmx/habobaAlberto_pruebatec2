<%@page import="com.softek.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Baja Usuarios</title>
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
            <h2>Por Favor Ingresa el Email del Usuario:</h2>
            <%}%>
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
            <form action="BajaUsuarioSv" method="POST" autocomplete="off" id="retardo7">
                <fieldset>
                    <legend>Correo del Usuario a Eliminar:</legend>
                    <label for="email">Correo electronico:</label><br>
                    <input type="email" id="email" name="email" placeholder="usuario@dominio.com" required><br><br>
                    <input type="submit" value="Usuario a eliminar">
                </fieldset>
            </form>
            <%} else {%>
            <form action="BajaUsuarioSv" method="GET" autocomplete="off" id="retardo7">
                <fieldset>
                    <legend>Confirmar Usuario a Eliminar:</legend>
                    <p><strong>Nombre:</strong> <%= user.getNombre()%></p>
                    <p><strong>Apellido:</strong> <%= user.getApellido()%></p>
                    <p><strong>Email:</strong> <%= user.getEmail()%></p>
                    <input type="hidden" name="id" value="<%= user.getId()%>">                
                    <input type="submit" class="botonrojo" value="Eliminar Usuario">
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
