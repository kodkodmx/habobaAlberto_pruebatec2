<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Alta Usuarios</title>
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
            <h2>Por Favor Ingresa los datos del Usuario:</h2>
        </div>

        <%}
            String action = request.getParameter("action");
            if ("logout".equals(action)) {
                if (miSesion != null) {
                    miSesion.removeAttribute("email");
                    response.sendRedirect(request.getRequestURI());
                }
            }
        %>
        <form action="" method="GET" id="retardo7">
            <button type="submit" name="action" value="logout">Sign Out</button>
        </form>
        <br>
        <form action="AltaUsuarioSv" method="POST" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Capturar Nuevo Usuario</legend>

                <label for="nombre">Nombre:</label><br>
                <input type="text" id="nombre" name="nombre" placeholder="Nombre" required><br><br>

                <label for="apellido">Apellido:</label><br>
                <input type="text" id="apellido" name="apellido" placeholder="Apellido" required ><br><br>


                <label for="email">Correo electronico:</label><br>
                <input type="email" id="email" name="email" placeholder="usuario@dominio.com" required><br><br>

                <label for="password">Contraseña:</label><br>
                <input type="password" id="password" name="password" placeholder="Mínimo 4 caracteres" minlength="4" required autocomplete="off"><br><br>


                <input type="submit" value="Agregar Usuario">
            </fieldset>
        </form>
        <%} else {
                response.sendRedirect("login.jsp?mens=Primero Inicia Sesion!");
            }
        %>
        <br>
        <footer>
            <blockquote>
                "El mejor servicio al cliente es aquel que supera las expectativas." - Richard Branson, fundador de Virgin Group.
            </blockquote>
            <p>© Sistema Desarrollado por Alberto Haboba</p>
        </footer>
    </body>
</html>
