<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css" />
        <title>Login</title>
    </head>
    <body>
        <div class="typewriter">
            <h1>Bienvenido al sistema de reservación de turnos</h1>
            <br>
            <%
                String usuario = (String) request.getSession().getAttribute("email");
                if (usuario != null) {
            %>
            <h2>Por favor ingresa los datos de la reservación:</h2>
        </div>
        <br>
        <form action="LoginSv" method="GET" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Capturar Nuevo Usuario</legend>

                <label for="email">Correo electronico:</label><br>
                <input type="email" id="email" name="email" placeholder="usuario@dominio.com" required><br><br>

                <label for="password">Contraseña:</label><br>
                <input type="password" id="password" name="password" placeholder="Mínimo 4 caracteres" minlength="4" required autocomplete="new-password"><br><br>

                <input type="submit" value="Iniciar sesión">
            </fieldset>
        </form>
        <% } else {
                response.sendRedirect("login.jsp");
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
