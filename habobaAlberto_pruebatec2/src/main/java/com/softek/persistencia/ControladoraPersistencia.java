package com.softek.persistencia;

import com.softek.logica.Usuario;
import com.softek.persistencia.exceptions.NonexistentEntityException;
import java.util.List;

public class ControladoraPersistencia {

    UsuarioJpaController usuarioJpa = new UsuarioJpaController();

    public Usuario buscarUsuario(String email) {
        return usuarioJpa.findUserByEmail(email);
    }

    public void crearUsuario(Usuario usuario) {
        usuarioJpa.create(usuario);
    }

    public void eliminarUsuario(long id) throws NonexistentEntityException {
        usuarioJpa.destroy(id);
    }

    public List<Usuario> traerUsuarios() {
        return usuarioJpa.findAllUsuarios();
    }

}
