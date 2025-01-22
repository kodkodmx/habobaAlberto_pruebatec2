<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="com.softek.logica.Ciudadano" %>
<%@ page import="com.softek.logica.Tramite" %>
<%@ page import="java.io.IOException" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/<%= session.getAttribute("css") != null ? session.getAttribute("css") : "styles.css"%>">
        <title>Alta Turno</title>
    </head>
    <body>
        <%
            HttpSession miSesion = request.getSession(false);
            String usuarioEmail = (String) miSesion.getAttribute("email");
            List<Ciudadano> listaCiudadanos = (List<Ciudadano>) miSesion.getAttribute("listaCiudadanos");
            List<Tramite> listaTramites = (List<Tramite>) miSesion.getAttribute("listaTramites");
            String mensaje = request.getParameter("mens");
        %>

        <div class="typewriter">
            <h1>Bienvenido <%= usuarioEmail %></h1>
            <br>
            <% 
                if (usuarioEmail != null) {
                    if (mensaje != null) {
            %>
                        <h2 id="alerta"><%= mensaje %></h2>
            <% 
                    } else { 
            %>
                        <h2>Por Favor Ingresa los datos del Turno:</h2>
            <% 
                    }
                } else {
                    response.sendRedirect("login.jsp?mens=Primero Inicia Sesion!");
                    return; 
                }
            %>
        </div>

        <div class="button-container" id="retardo7">
            <form action="MenuSv" method="POST" id="logoutForm">
                <button type="submit" name="action" value="logout" class="button">Cerrar sesión</button>
            </form>
            <form action="MenuSv" method="POST" id="menuForm">
                <button type="submit" name="menuAction" value="menu" class="button">Menú Principal</button>
            </form>
        </div>

        <form action="AltaTurnoSv" method="POST" autocomplete="off" id="retardo7">
            <fieldset>
                <legend>Capturar Nuevo Turno</legend>

                <label for="ciudadano">Ciudadano:</label><br>
                <select id="ciudadano" name="ciudadano" required>
                    <% 
                        if (listaCiudadanos != null) {
                            for (Ciudadano ciudadano : listaCiudadanos) {
                                out.println("<option value=\"" + ciudadano.getClaveIdentificacion() + "\">" + ciudadano.getNombre() + " " + ciudadano.getApellido() + "</option>");
                            }
                        }
                    %>
                </select><br><br>

                <label for="tramite">Trámite:</label><br>
                <select id="tramite" name="tramite" required>
                    <% 
                        if (listaTramites != null) {
                            for (Tramite tramite : listaTramites) {
                                out.println("<option value=\"" + tramite.getId() + "\">" + tramite.getNombre() + "</option>");
                            }
                        }
                    %>
                </select><br><br>

                <label for="fecha">Fecha:</label><br>
                <input type="date" id="fecha" name="fecha" required><br><br>

                <input type="submit" value="Crear Turno">
            </fieldset>
        </form>

        <br>
        <footer>
            <blockquote>
                "El mejor servicio al cliente es aquel que supera las expectativas." - Richard Branson, fundador de Virgin Group.
            </blockquote>
            <p>© Sistema Desarrollado por Alberto Haboba</p>
        </footer>
    </body>
</html>
