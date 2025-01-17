package com.softek.logica;

import com.softek.persistencia.ControladoraPersistencia;

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
    
    public void crearUsuario(String email, String password) {
        
        Usuario pers = new Usuario (email, password); 
        controlPersis.crearPersona(pers);
        
    }
    
}
