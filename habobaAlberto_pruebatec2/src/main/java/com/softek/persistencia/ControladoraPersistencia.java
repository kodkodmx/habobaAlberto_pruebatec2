package com.softek.persistencia;

import com.softek.logica.Ciudadano;
import com.softek.logica.Tramite;
import com.softek.logica.Usuario;
import com.softek.persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ControladoraPersistencia {

    UsuarioJpaController usuarioJpa = new UsuarioJpaController();
    TramiteJpaController tramiteJpa = new TramiteJpaController();
    CiudadanoJpaController ciudadanoJpa = new CiudadanoJpaController();

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

    public void modificarUsuario(Usuario usuario) {
        try {
            usuarioJpa.edit(usuario);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearTramite(Tramite tramite) {
        tramiteJpa.create(tramite);
    }

    public void eliminarTramite(long id) throws NonexistentEntityException {
        tramiteJpa.destroy(id);
    }

    public Tramite buscarTramite(String nombre) {
        return tramiteJpa.findTramiteByName(nombre);
    }

    public List<Tramite> traerTramites() {
        return tramiteJpa.findAllTramites();
    }

    public void modificarTramite(Tramite tramite) {
        System.out.println("desde control persi:" + tramite);
        try {
            tramiteJpa.edit(tramite);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void crearCiudadano(Ciudadano ciudadano) {
        ciudadanoJpa.create(ciudadano);
    }

    public Ciudadano buscarCiudadano(String claveIdentificacion) {
        return ciudadanoJpa.findCiudadanoByClaveIdentificacion(claveIdentificacion);
    }

    public List<Ciudadano> traerCiudadanos() {
        return ciudadanoJpa.findAllCiudadanos();
    }

    public void modificarCiudadano(Ciudadano ciudadano) {
        try {
            ciudadanoJpa.edit(ciudadano);
        } catch (Exception ex) {
            Logger.getLogger(ControladoraPersistencia.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void eliminarCiudadano(long id) throws NonexistentEntityException {
        ciudadanoJpa.destroy(id);
    }
}
