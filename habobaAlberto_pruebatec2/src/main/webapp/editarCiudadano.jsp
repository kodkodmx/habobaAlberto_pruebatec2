<%@page import="com.softek.logica.Ciudadano"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Editar Ciudadanos</title>
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
            <h2>Modificar Ciudadano:</h2>
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
        <% Ciudadano ciudadano = (Ciudadano) miSesion.getAttribute("ciudadano");
            if (ciudadano == null) {
        %>
        <form action="EditarCiudadanoSv" method="GET" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Clave de Identificación del Ciudadano a Editar:</legend>
                <label for="claveIdentificacion">Clave de Identificación:</label><br>
                <input type="text" id="claveIdentificacion" name="claveIdentificacion" placeholder="Clave de Identificación" required><br><br>
                <input type="submit" value="Ciudadano a editar">
            </fieldset>
        </form>
        <%} else {%>
        <form action="EditarCiudadanoSv" method="POST" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Modificar Ciudadano:</legend>

                <label for="nombre"><strong>Nombre:</strong></label>
                <input type="text" id="nombre" name="nombre" value="<%= ciudadano.getNombre() %>" required><br><br>

                <label for="apellido"><strong>Apellido:</strong></label>
                <input type="text" id="apellido" name="apellido" value="<%= ciudadano.getApellido() %>" required><br><br>

                <label for="claveIdentificacion"><strong>Clave de Identificación:</strong></label>
                <input type="text" id="claveIdentificacion" name="claveIdentificacion" value="<%= ciudadano.getClaveIdentificacion() %>" required><br><br>

                <input type="hidden" name="id" value="<%= ciudadano.getId() %>">
                <input type="submit" value="Editar Ciudadano">
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
