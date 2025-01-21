<%@page import="com.softek.logica.Ciudadano"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Baja Ciudadanos</title>
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
            <h2>Por Favor Ingresa la Clave de Identificación del Ciudadano:</h2>
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
            <% Ciudadano ciudadano = (Ciudadano) miSesion.getAttribute("ciudadano");
                if (ciudadano == null) {
            %>
            <form action="BajaCiudadanoSv" method="POST" autocomplete="off" id="retardo7">
                <fieldset>
                    <legend>Clave de Identificación del Ciudadano a Eliminar:</legend>
                    <label for="claveIdentificacion">Clave de Identificación:</label><br>
                    <input type="text" id="claveIdentificacion" name="claveIdentificacion" placeholder="Clave de Identificación" required><br><br>
                    <input type="submit" value="Ciudadano a eliminar">
                </fieldset>
            </form>
            <%} else {%>
            <form action="BajaCiudadanoSv" method="GET" autocomplete="off" id="retardo7">
                <fieldset>
                    <legend>Confirmar Ciudadano a Eliminar:</legend>
                    <p><strong>Nombre:</strong> <%= ciudadano.getNombre()%></p>
                    <p><strong>Apellido:</strong> <%= ciudadano.getApellido()%></p>
                    <p><strong>Clave de Identificación:</strong> <%= ciudadano.getClaveIdentificacion()%></p>
                    <input type="hidden" name="id" value="<%= ciudadano.getId()%>">                
                    <input type="submit" class="botonrojo" value="Eliminar Ciudadano">
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
