/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controladores;

import Controladores.exceptions.NonexistentEntityException;
import Entidades.Bitacoraaccesos;
import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

/**
 *
 * @author ASUS
 */
public class BitacoraaccesosJpaController implements Serializable {

    public BitacoraaccesosJpaController() {
       this.emf = Persistence.createEntityManagerFactory("SistemaEgresadosPU");
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Bitacoraaccesos bitacoraaccesos) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(bitacoraaccesos);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Bitacoraaccesos bitacoraaccesos) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            bitacoraaccesos = em.merge(bitacoraaccesos);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = bitacoraaccesos.getId();
                if (findBitacoraaccesos(id) == null) {
                    throw new NonexistentEntityException("The bitacoraaccesos with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            Bitacoraaccesos bitacoraaccesos;
            try {
                bitacoraaccesos = em.getReference(Bitacoraaccesos.class, id);
                bitacoraaccesos.getId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The bitacoraaccesos with id " + id + " no longer exists.", enfe);
            }
            em.remove(bitacoraaccesos);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<Bitacoraaccesos> findBitacoraaccesosEntities() {
        return findBitacoraaccesosEntities(true, -1, -1);
    }

    public List<Bitacoraaccesos> findBitacoraaccesosEntities(int maxResults, int firstResult) {
        return findBitacoraaccesosEntities(false, maxResults, firstResult);
    }

    private List<Bitacoraaccesos> findBitacoraaccesosEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Bitacoraaccesos.class));
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

    public Bitacoraaccesos findBitacoraaccesos(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Bitacoraaccesos.class, id);
        } finally {
            em.close();
        }
    }

    public int getBitacoraaccesosCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Bitacoraaccesos> rt = cq.from(Bitacoraaccesos.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
