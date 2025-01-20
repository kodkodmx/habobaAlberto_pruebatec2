package com.softek.logica;

import com.softek.persistencia.ControladoraPersistencia;
import com.softek.persistencia.exceptions.NonexistentEntityException;
import java.util.List;

public class ControladoraLogica {

    ControladoraPersistencia controlPersis = new ControladoraPersistencia();

    public boolean validarAcceso(String email, String password) {

        Usuario usu = controlPersis.buscarUsuario(email);

        if (usu != null) {
            if (usu.getEmail().equals(email)) {
                if (usu.getPassword().equals(password)) {
                    return true;
                }
            }
        }
        return false;
    }

    public void crearUsuario(String nombre, String apellido, String email, String password) {
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setEmail(email);
        usuario.setPassword(password);
        controlPersis.crearUsuario(usuario);
    }

    public Usuario buscaUsuario(String email) {
        return controlPersis.buscarUsuario(email);
    }

    public void eliminaUsuario(long id) throws NonexistentEntityException {
        controlPersis.eliminarUsuario(id);
    }

    public List<Usuario> traerTodosLosUsuarios() {
        return controlPersis.traerUsuarios();
    }

    public void modificarUsuario(Usuario usuario) {
        controlPersis.modificarUsuario(usuario);
    }

    public void crearTramite(String nombre, String descripcion) {
        Tramite tramite = new Tramite();
        tramite.setNombre(nombre);
        tramite.setDescripcion(descripcion);
        controlPersis.crearTramite(tramite);
    }

    public void eliminaTramite(long id) throws NonexistentEntityException {
        controlPersis.eliminarTramite(id);
    }

    public Tramite buscaTramite(String nombre) {
        return controlPersis.buscarTramite(nombre);
    }

    public List<Tramite> traerTodosLosTramites() {
        return controlPersis.traerTramites();
    }

    public void modificarTramite(Tramite tramite) throws Exception {
        controlPersis.modificarTramite(tramite);
    }

    public void crearCiudadano(Ciudadano ciudadano) {
        controlPersis.crearCiudadano(ciudadano);
    }

    public Ciudadano buscarCiudadano(String claveIdentificacion) {
        return controlPersis.buscarCiudadano(claveIdentificacion);
    }

    public List<Ciudadano> traerTodosLosCiudadanos() {
        return controlPersis.traerCiudadanos();
    }
}
