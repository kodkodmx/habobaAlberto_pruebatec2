package com.softek.persistencia;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.softek.logica.Usuario;
import com.softek.logica.Tramite;
import com.softek.logica.Ciudadano;
import com.softek.logica.Turno;
import com.softek.persistencia.exceptions.NonexistentEntityException;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

public class TurnoJpaController implements Serializable {

    public TurnoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Turno turno) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Usuario elUsuario = turno.getElUsuario();
            if (elUsuario != null) {
                elUsuario = em.getReference(elUsuario.getClass(), elUsuario.getId());
                turno.setElUsuario(elUsuario);
            }
            Tramite elTramite = turno.getElTramite();
            if (elTramite != null) {
                elTramite = em.getReference(elTramite.getClass(), elTramite.getId());
                turno.setElTramite(elTramite);
            }
            Ciudadano elCiudadano = turno.getElCiudadano();
            if (elCiudadano != null) {
                elCiudadano = em.getReference(elCiudadano.getClass(), elCiudadano.getId());
                turno.setElCiudadano(elCiudadano);
            }
            em.persist(turno);
            if (elUsuario != null) {
                elUsuario.getTurnos().add(turno);
                elUsuario = em.merge(elUsuario);
            }
            if (elTramite != null) {
                elTramite.getTurnos().add(turno);
                elTramite = em.merge(elTramite);
            }
            if (elCiudadano != null) {
                elCiudadano.getTurnos().add(turno);
                elCiudadano = em.merge(elCiudadano);
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Turno turno) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Turno persistentTurno = em.find(Turno.class, turno.getId());
            Usuario elUsuarioOld = persistentTurno.getElUsuario();
            Usuario elUsuarioNew = turno.getElUsuario();
            Tramite elTramiteOld = persistentTurno.getElTramite();
            Tramite elTramiteNew = turno.getElTramite();
            Ciudadano elCiudadanoOld = persistentTurno.getElCiudadano();
            Ciudadano elCiudadanoNew = turno.getElCiudadano();
            if (elUsuarioNew != null) {
                elUsuarioNew = em.getReference(elUsuarioNew.getClass(), elUsuarioNew.getId());
                turno.setElUsuario(elUsuarioNew);
            }
            if (elTramiteNew != null) {
                elTramiteNew = em.getReference(elTramiteNew.getClass(), elTramiteNew.getId());
                turno.setElTramite(elTramiteNew);
            }
            if (elCiudadanoNew != null) {
                elCiudadanoNew = em.getReference(elCiudadanoNew.getClass(), elCiudadanoNew.getId());
                turno.setElCiudadano(elCiudadanoNew);
            }
            turno = em.merge(turno);
            if (elUsuarioOld != null && !elUsuarioOld.equals(elUsuarioNew)) {
                elUsuarioOld.getTurnos().remove(turno);
                elUsuarioOld = em.merge(elUsuarioOld);
            }
            if (elUsuarioNew != null && !elUsuarioNew.equals(elUsuarioOld)) {
                elUsuarioNew.getTurnos().add(turno);
                elUsuarioNew = em.merge(elUsuarioNew);
            }
            if (elTramiteOld != null && !elTramiteOld.equals(elTramiteNew)) {
                elTramiteOld.getTurnos().remove(turno);
                elTramiteOld = em.merge(elTramiteOld);
            }
            if (elTramiteNew != null && !elTramiteNew.equals(elTramiteOld)) {
                elTramiteNew.getTurnos().add(turno);
                elTramiteNew = em.merge(elTramiteNew);
            }
            if (elCiudadanoOld != null && !elCiudadanoOld.equals(elCiudadanoNew)) {
                elCiudadanoOld.getTurnos().remove(turno);
                elCiudadanoOld = em.merge(elCiudadanoOld);
            }
            if (elCiudadanoNew != null && !elCiudadanoNew.equals(elCiudadanoOld)) {
                elCiudadanoNew.getTurnos().add(turno);
                elCiudadanoNew = em.merge(elCiudadanoNew);
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                long id = turno.getId();
                if (findTurno(id) == null) {
                    throw new NonexistentEntityException("The turno with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(long id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Turno turno;
            try {
                turno = em.getReference(Turno.class, id);
                turno.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The turno with id " + id + " no longer exists.", enfe);
            }
            Usuario elUsuario = turno.getElUsuario();
            if (elUsuario != null) {
                elUsuario.getTurnos().remove(turno);
                elUsuario = em.merge(elUsuario);
            }
            Tramite elTramite = turno.getElTramite();
            if (elTramite != null) {
                elTramite.getTurnos().remove(turno);
                elTramite = em.merge(elTramite);
            }
            Ciudadano elCiudadano = turno.getElCiudadano();
            if (elCiudadano != null) {
                elCiudadano.getTurnos().remove(turno);
                elCiudadano = em.merge(elCiudadano);
            }
            em.remove(turno);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Turno> findTurnoEntities() {
        return findTurnoEntities(true, -1, -1);
    }

    public List<Turno> findTurnoEntities(int maxResults, int firstResult) {
        return findTurnoEntities(false, maxResults, firstResult);
    }

    private List<Turno> findTurnoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Turno.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public Turno findTurno(long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Turno.class, id);
        } finally {
            em.close();
        }
    }

    public int getTurnoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Turno> rt = cq.from(Turno.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
