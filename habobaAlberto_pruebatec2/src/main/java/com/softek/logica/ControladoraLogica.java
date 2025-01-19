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
        Usuario usuario = new Usuario(nombre, apellido, email, password);
        controlPersis.crearUsuario(usuario);

    }

    public Usuario buscaUsuario(String email) {

        Usuario usuario = controlPersis.buscarUsuario(email);

        return usuario;

    }

    public void eliminaUsuario(long id) throws NonexistentEntityException {

        controlPersis.eliminarUsuario(id);
    }

    public List<Usuario> traerTodosLosUsuarios() {
        return controlPersis.traerUsuarios();
    }

}
