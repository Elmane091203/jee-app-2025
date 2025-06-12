package ejb;

import java.util.List;
import java.util.logging.Logger;

import jakarta.annotation.PostConstruct;
import jakarta.annotation.PreDestroy;
import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;

import dao.IProduitDao;
import dao.ProduitDaoImpl;
import entities.Produit;

@Stateless
@TransactionAttribute(TransactionAttributeType.REQUIRED)
public class ProduitServiceBean implements IProduitService {
    
    private static final Logger logger = Logger.getLogger(ProduitServiceBean.class.getName());
    private IProduitDao produitDao;
    
    @PostConstruct
    public void init() {
        logger.info("Initialisation du ProduitServiceBean");
        produitDao = new ProduitDaoImpl();
    }
    
    @PreDestroy
    public void cleanup() {
        logger.info("Nettoyage du ProduitServiceBean");
        if (produitDao instanceof ProduitDaoImpl) {
            ((ProduitDaoImpl) produitDao).fermer();
        }
    }
    
    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void ajouterProduit(Produit produit) {
        logger.info("Ajout d'un nouveau produit: " + produit.getDesignation());
        
        // Validation métier
        if (produit.getDesignation() == null || produit.getDesignation().trim().isEmpty()) {
            throw new IllegalArgumentException("La désignation du produit est obligatoire");
        }
        
        if (produit.getPrix() < 0) {
            throw new IllegalArgumentException("Le prix ne peut pas être négatif");
        }
        
        if (produit.getQuantite() < 0) {
            throw new IllegalArgumentException("La quantité ne peut pas être négative");
        }
        
        produitDao.ajouterProduit(produit);
        logger.info("Produit ajouté avec succès: ID=" + produit.getId());
    }
    
    @Override
    @TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public List<Produit> listerProduits() {
        logger.info("Récupération de la liste des produits");
        return produitDao.listerProduits();
    }
    
    @Override
    @TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public List<Produit> chercherProduits(String motCle) {
        logger.info("Recherche de produits avec le mot-clé: " + motCle);
        
        if (motCle == null || motCle.trim().isEmpty()) {
            return listerProduits();
        }
        
        return produitDao.chercherProduits(motCle.trim());
    }
    
    @Override
    @TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public Produit obtenirProduit(int id) {
        logger.info("Récupération du produit avec ID: " + id);
        
        if (id <= 0) {
            throw new IllegalArgumentException("L'ID du produit doit être positif");
        }
        
        return produitDao.obtenirProduit(id);
    }
    
    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void modifierProduit(Produit produit) {
        logger.info("Modification du produit: " + produit.getId());
        
        // Validation métier
        if (produit.getId() <= 0) {
            throw new IllegalArgumentException("L'ID du produit doit être positif");
        }
        
        if (produit.getDesignation() == null || produit.getDesignation().trim().isEmpty()) {
            throw new IllegalArgumentException("La désignation du produit est obligatoire");
        }
        
        if (produit.getPrix() < 0) {
            throw new IllegalArgumentException("Le prix ne peut pas être négatif");
        }
        
        if (produit.getQuantite() < 0) {
            throw new IllegalArgumentException("La quantité ne peut pas être négative");
        }
        
        // Vérifier que le produit existe
        Produit existant = produitDao.obtenirProduit(produit.getId());
        if (existant == null) {
            throw new IllegalArgumentException("Le produit avec l'ID " + produit.getId() + " n'existe pas");
        }
        
        produitDao.modifierProduit(produit);
        logger.info("Produit modifié avec succès: ID=" + produit.getId());
    }
    
    @Override
    @TransactionAttribute(TransactionAttributeType.REQUIRED)
    public void supprimerProduit(int id) {
        logger.info("Suppression du produit avec ID: " + id);
        
        if (id <= 0) {
            throw new IllegalArgumentException("L'ID du produit doit être positif");
        }
        
        // Vérifier que le produit existe
        Produit existant = produitDao.obtenirProduit(id);
        if (existant == null) {
            throw new IllegalArgumentException("Le produit avec l'ID " + id + " n'existe pas");
        }
        
        produitDao.supprimerProduit(id);
        logger.info("Produit supprimé avec succès: ID=" + id);
    }
    
    @Override
    @TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public long compterProduits() {
        logger.info("Comptage du nombre total de produits");
        return listerProduits().size(); // Implémentation simple
    }
    
    @Override
    @TransactionAttribute(TransactionAttributeType.SUPPORTS)
    public List<Produit> obtenirProduitsEnRupture() {
        logger.info("Récupération des produits en rupture de stock");
        return listerProduits().stream()
                .filter(p -> p.getQuantite() == 0)
                .collect(java.util.stream.Collectors.toList());
    }
}
