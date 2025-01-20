<%@page import="com.softek.logica.Tramite"%>
<%@page import="com.softek.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Baja Tramites</title>
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
            <h2>Por Favor Ingresa el nombre del Tramite:</h2>
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
            <% Tramite tramite = (Tramite) miSesion.getAttribute("tramite");
                if (tramite == null) {
            %>
            <form action="BajaTramiteSv" method="POST" autocomplete="off" id="retardo7">
                <fieldset>
                    <legend>Nombre del Tramite a Eliminar:</legend>
                    <label for="nombre">Nombre:</label><br>
                    <input type="text" id="nombre" name="nombre" placeholder="Nombre del tramite" required><br><br>
                    <input type="submit" value="Tramite a eliminar">
                </fieldset>
            </form>
            <%} else {%>
            <form action="BajaTramiteSv" method="GET" autocomplete="off" id="retardo7">
                <fieldset>
                    <legend>Confirmar Tramite a Eliminar:</legend>
                    <p><strong>Nombre:</strong> <%= tramite.getNombre()%></p>
                    <p><strong>Descripcion:</strong> <%= tramite.getDescripcion()%></p>
                    <input type="hidden" name="id" value="<%= tramite.getId()%>">                
                    <input type="submit" class="botonrojo" value="Eliminar Tramite">
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
