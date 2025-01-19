package com.softek.persistencia;

import com.softek.logica.Ciudadano;
import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import com.softek.logica.Turno;
import com.softek.persistencia.exceptions.NonexistentEntityException;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;

public class CiudadanoJpaController implements Serializable {

    public CiudadanoJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Ciudadano ciudadano) {
        if (ciudadano.getTurnos() == null) {
            ciudadano.setTurnos(new ArrayList<Turno>());
        }
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            List<Turno> attachedTurnos = new ArrayList<Turno>();
            for (Turno turnosTurnoToAttach : ciudadano.getTurnos()) {
                turnosTurnoToAttach = em.getReference(turnosTurnoToAttach.getClass(), turnosTurnoToAttach.getId());
                attachedTurnos.add(turnosTurnoToAttach);
            }
            ciudadano.setTurnos(attachedTurnos);
            em.persist(ciudadano);
            for (Turno turnosTurno : ciudadano.getTurnos()) {
                Ciudadano oldElCiudadanoOfTurnosTurno = turnosTurno.getElCiudadano();
                turnosTurno.setElCiudadano(ciudadano);
                turnosTurno = em.merge(turnosTurno);
                if (oldElCiudadanoOfTurnosTurno != null) {
                    oldElCiudadanoOfTurnosTurno.getTurnos().remove(turnosTurno);
                    oldElCiudadanoOfTurnosTurno = em.merge(oldElCiudadanoOfTurnosTurno);
                }
            }
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Ciudadano ciudadano) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Ciudadano persistentCiudadano = em.find(Ciudadano.class, ciudadano.getId());
            List<Turno> turnosOld = persistentCiudadano.getTurnos();
            List<Turno> turnosNew = ciudadano.getTurnos();
            List<Turno> attachedTurnosNew = new ArrayList<Turno>();
            for (Turno turnosNewTurnoToAttach : turnosNew) {
                turnosNewTurnoToAttach = em.getReference(turnosNewTurnoToAttach.getClass(), turnosNewTurnoToAttach.getId());
                attachedTurnosNew.add(turnosNewTurnoToAttach);
            }
            turnosNew = attachedTurnosNew;
            ciudadano.setTurnos(turnosNew);
            ciudadano = em.merge(ciudadano);
            for (Turno turnosOldTurno : turnosOld) {
                if (!turnosNew.contains(turnosOldTurno)) {
                    turnosOldTurno.setElCiudadano(null);
                    turnosOldTurno = em.merge(turnosOldTurno);
                }
            }
            for (Turno turnosNewTurno : turnosNew) {
                if (!turnosOld.contains(turnosNewTurno)) {
                    Ciudadano oldElCiudadanoOfTurnosNewTurno = turnosNewTurno.getElCiudadano();
                    turnosNewTurno.setElCiudadano(ciudadano);
                    turnosNewTurno = em.merge(turnosNewTurno);
                    if (oldElCiudadanoOfTurnosNewTurno != null && !oldElCiudadanoOfTurnosNewTurno.equals(ciudadano)) {
                        oldElCiudadanoOfTurnosNewTurno.getTurnos().remove(turnosNewTurno);
                        oldElCiudadanoOfTurnosNewTurno = em.merge(oldElCiudadanoOfTurnosNewTurno);
                    }
                }
            }
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                long id = ciudadano.getId();
                if (findCiudadano(id) == null) {
                    throw new NonexistentEntityException("The ciudadano with id " + id + " no longer exists.");
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
            Ciudadano ciudadano;
            try {
                ciudadano = em.getReference(Ciudadano.class, id);
                ciudadano.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The ciudadano with id " + id + " no longer exists.", enfe);
            }
            List<Turno> turnos = ciudadano.getTurnos();
            for (Turno turnosTurno : turnos) {
                turnosTurno.setElCiudadano(null);
                turnosTurno = em.merge(turnosTurno);
            }
            em.remove(ciudadano);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Ciudadano> findCiudadanoEntities() {
        return findCiudadanoEntities(true, -1, -1);
    }

    public List<Ciudadano> findCiudadanoEntities(int maxResults, int firstResult) {
        return findCiudadanoEntities(false, maxResults, firstResult);
    }

    private List<Ciudadano> findCiudadanoEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Ciudadano.class));
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

    public Ciudadano findCiudadano(long id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Ciudadano.class, id);
        } finally {
            em.close();
        }
    }

    public int getCiudadanoCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Ciudadano> rt = cq.from(Ciudadano.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
