package com.softek.persistencia;

import com.softek.logica.Usuario;
import com.softek.logica.UsuarioJpaController;

public class ControladoraPersistencia {
    
    UsuarioJpaController usuarioJpa = new UsuarioJpaController();

 
    public Usuario buscarUsuario(String email) {
        return usuarioJpa.findUserByEmail(email);
    }

    public void crearPersona(Usuario usuario) {
        usuarioJpa.create(usuario);
    }
    
}
