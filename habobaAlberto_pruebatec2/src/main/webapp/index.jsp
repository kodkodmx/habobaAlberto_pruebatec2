<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Menu</title>
    </head>
    <body>
        <%
            HttpSession miSesion = request.getSession(false);
            String login;
            if (miSesion.getAttribute("email") != null) {
                login = (String) miSesion.getAttribute("email");
                String mensaje = request.getParameter("mens");%>
        <div class="typewriter">
            <h1>Bienvenido <%=login%></h1>
            <br>
            <%if (mensaje != null) {%>
            <h2 id="alerta"><%=mensaje%></h2>
            <%} else {%>
            <h2>Por Favor Selecciona una opcion:</h2>
        </div>
        <% } %>        
        <div class="button-container" id="retardo7">
            <form action="MenuSv" method="POST" id="logoutForm">
                <button type="submit" name="action" value="logout" class="button">Cerrar sesión</button>
            </form>
            <form action="MenuSv" method="POST" id="menuForm">
                <button type="submit" name="menuAction" value="menu" class="button">Menú Principal</button>
            </form>
        </div>
        <br>
        <form action="GestorTurnosSv" method="POST" id="retardo7">
            <fieldset>
                <legend>Turnos</legend>
                <button type="submit" name="action" value="alta">Alta Turno</button>
                <button type="submit" name="action" value="buscar">Buscar Turno</button>
                <button type="submit" name="action" value="editar">Editar Turno</button>
                <button type="submit" name="action" value="borrar">Borrar Turno</button>
            </fieldset>
        </form>
        <br>
        <form action="GestorCiudadanosSv" method="POST" id="retardo7">
            <fieldset>
                <legend>Ciudadanos</legend>
                <button type="submit" name="action" value="alta">Alta Ciudadano</button>
                <button type="submit" name="action" value="buscar">Buscar Ciudadano</button>
                <button type="submit" name="action" value="editar">Editar Ciudadano</button>
                <button type="submit" name="action" value="borrar">Borrar Ciudadano</button>
            </fieldset>
        </form>
        <br>
        <form action="GestorTramitesSv" method="POST" id="retardo7">
            <fieldset>
                <legend>Tramites</legend>
                <button type="submit" name="action" value="alta">Alta Tramite</button>
                <button type="submit" name="action" value="buscar">Buscar Tramite</button>
                <button type="submit" name="action" value="editar">Editar Tramite</button>
                <button type="submit" name="action" value="borrar">Borrar Tramite</button>
            </fieldset>
        </form>
        <br>
        <form action="GestorUsuariosSv" method="POST" id="retardo7">
            <fieldset>
                <legend>Usuarios</legend>
                <button type="submit" name="action" value="alta">Alta Usuario</button>
                <button type="submit" name="action" value="buscar">Buscar Usuario</button>
                <button type="submit" name="action" value="editar">Editar Usuario</button>
                <button type="submit" name="action" value="baja">Borrar Usuario</button>
            </fieldset>
        </form>
        <% } else {
                response.sendRedirect("login.jsp?mens=Primero Inicia Sesion!");
            }
        %>
        <br>
        <footer>
            <blockquote>
                "La contraseña más segura es aquella que nunca se comparte." - Eugene Kaspersky, fundador de Kaspersky Lab.
            </blockquote>
            <p>© Sistema Desarrollado por Alberto Haboba</p>
        </footer>
    </body>
</html>
