<%@page import="com.softek.logica.Tramite"%>
<%@page import="com.softek.logica.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Editar Tramites</title>
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
            <h2>Modificar Tramite:</h2>
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
        <% Tramite tramite = (Tramite) miSesion.getAttribute("tramite");
            if (tramite == null) {
        %>
        <form action="EditarTramiteSv" method="GET" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Nombre del Tramite a Editar:</legend>
                <label for="nombre">Nombre:</label><br>
                <input type="text" id="nombre" name="nombre" placeholder="Nombre del tramite" required><br><br>
                <input type="submit" value="Tramite a editar">
            </fieldset>
        </form>
        <%} else {%>
        <form action="EditarTramiteSv" method="POST" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Modificar Tramite:</legend>

                <label for="nombre"><strong>Nombre:</strong></label>
                <input type="text" id="nombre" name="nombre" value="<%= tramite.getNombre()%>" required><br><br>

                <label for="descripcion"><strong>Descripcion:</strong></label>
                <textarea id="descripcion" name="descripcion" rows="4" cols="50" required><%= tramite.getDescripcion()%></textarea><br><br>


                <input type="hidden" name="id" value="<%= tramite.getId()%>">
                <input type="submit" value="Editar Tramite">
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
