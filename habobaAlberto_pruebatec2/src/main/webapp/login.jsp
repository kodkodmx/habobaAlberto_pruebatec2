<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/styles.css" />
        <title>Login</title>
    </head>
    <body>
        <% String mensaje = request.getParameter("mens");  %>
        <div class="typewriter">
            <h1>Bienvenido al sistema de turnos</h1>
            <br>
            <% if (mensaje != null) { %>
            <h2 id="alerta"><%=mensaje%></h2>
            <%} else {%>
            <h2>Ingresa tus datos de usuario:</h2>
            <%}%>
        </div>
        <br>

        <form action="LoginSv" method="POST" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Iniciar sesión</legend>

                <label for="email">Correo electrónico:</label><br>
                <input type="email" id="email" name="email" placeholder="usuario@dominio.com" required><br><br>

                <label for="password">Contraseña:</label><br>
                <input type="password" id="password" name="password" placeholder="Mínimo 4 caracteres" minlength="4" required autocomplete="new-password"><br><br>

                <label>¿Activar animación?</label><br>
                <label>
                    <input type="radio" name="animacion" value="si" checked> Sí
                </label>
                <label>
                    <input type="radio" name="animacion" value="no"> No
                </label>
                <br><br>

                <input type="submit" value="Iniciar sesión">
            </fieldset>
        </form>
        <br>
        <footer>
            <blockquote>
                "La contraseña más segura es aquella que nunca se comparte." - Eugene Kaspersky, fundador de Kaspersky Lab.
            </blockquote>
            <p>© Sistema Desarrollado por Alberto Haboba</p>
        </footer>
    </body>
</html>
