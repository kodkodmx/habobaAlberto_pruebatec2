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
                if (usuario == null) {
            %>
            <h2>Por favor ingresa tus datos de usuario:</h2>
        </div>
        <br>
        <form action="LoginSv" method="GET" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Iniciar sesión</legend>

                <label for="email">Correo electronico:</label><br>
                <input type="email" id="email" name="email" placeholder="usuario@dominio.com" required><br><br>

                <label for="password">Contraseña:</label><br>
                <input type="password" id="password" name="password" placeholder="Mínimo 4 caracteres" minlength="4" required autocomplete="new-password"><br><br>

                <input type="submit" value="Iniciar sesión">
            </fieldset>
        </form>
        <% } else { %>
        <%
            HttpSession miSesion = request.getSession(false);
            String email;
            if (miSesion != null) {
                email = (String) miSesion.getAttribute("email");
        %>
                <p id="retardo4">Hola <%=email%> bienvenido...</p>
 
        <%}
            
            String action = request.getParameter("action");
            if ("logout".equals(action)) {
                if (miSesion != null) {
                    miSesion.removeAttribute("email");
                    response.sendRedirect(request.getRequestURI());
                }
            }
        %>
        <br>
        <form action="" method="GET" id="retardo4">
            <button type="submit" name="action" value="logout">Sign Out</button>
        </form>
        <br>
        <form action="gestionarUsuarios.jsp" id="retardo4">
            <fieldset>
                <legend>Usuarios</legend>
                <input type="submit" value="Gestionar Usuarios">                           
            </fieldset>          
        </form>
        <br>
        <form action="index.jsp" id="retardo4">
            <fieldset>
                <legend>Turnos</legend>
                <input type="submit" value="Gestionar Turnos">                
            </fieldset>          
        </form>
        <% }%>
        <br>
        <footer>
            <blockquote>
                "La contraseña más segura es aquella que nunca se comparte." - Eugene Kaspersky, fundador de Kaspersky Lab.
            </blockquote>
            <p>© Sistema Desarrollado por Alberto Haboba</p>
        </footer>
    </body>
</html>
