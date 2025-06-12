package dao;

import java.util.List;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;
import jakarta.persistence.TypedQuery;

import entities.Produit;

public class ProduitDaoImpl implements IProduitDao {
    private EntityManagerFactory emf;
    
    public ProduitDaoImpl() {
        emf = Persistence.createEntityManagerFactory("PERSISTENCE");
    }
    
    @Override
    public void ajouterProduit(Produit produit) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = em.getTransaction();
        
        try {
            transaction.begin();
            em.persist(produit);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Erreur lors de l'ajout du produit", e);
        } finally {
            em.close();
        }
    }
    
    @Override
    public List<Produit> listerProduits() {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Produit> query = em.createQuery("SELECT p FROM Produit p ORDER BY p.id", Produit.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
    
    @Override
    public List<Produit> chercherProduits(String motCle) {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<Produit> query = em.createQuery(
                "SELECT p FROM Produit p WHERE p.designation LIKE :motCle ORDER BY p.id", 
                Produit.class
            );
            query.setParameter("motCle", "%" + motCle + "%");
            return query.getResultList();
        } finally {
            em.close();
        }
    }
    
    @Override
    public Produit obtenirProduit(int id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(Produit.class, id);
        } finally {
            em.close();
        }
    }
    
    @Override
    public void modifierProduit(Produit produit) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = em.getTransaction();
        
        try {
            transaction.begin();
            em.merge(produit);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Erreur lors de la modification du produit", e);
        } finally {
            em.close();
        }
    }
    
    @Override
    public void supprimerProduit(int id) {
        EntityManager em = emf.createEntityManager();
        EntityTransaction transaction = em.getTransaction();
        
        try {
            transaction.begin();
            Produit produit = em.find(Produit.class, id);
            if (produit != null) {
                em.remove(produit);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            throw new RuntimeException("Erreur lors de la suppression du produit", e);
        } finally {
            em.close();
        }
    }
    
    public void fermer() {
        if (emf != null && emf.isOpen()) {
            emf.close();
        }
    }
}
