package ejb;

import entities.Produit;
import jakarta.ejb.EJB;
import jakarta.ejb.Stateless;
import jakarta.ejb.TransactionAttribute;
import jakarta.ejb.TransactionAttributeType;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

@Stateless
@TransactionAttribute(TransactionAttributeType.SUPPORTS)
public class StatistiqueServiceBean implements IStatistiqueService {
    
    private static final Logger logger = Logger.getLogger(StatistiqueServiceBean.class.getName());
    
    @EJB
    private IProduitService produitService;
    
    @Override
    public long getNombreTotalProduits() {
        logger.info("Calcul du nombre total de produits");
        return produitService.compterProduits();
    }
    
    @Override
    public double getValeurTotalStock() {
        logger.info("Calcul de la valeur totale du stock");
        List<Produit> produits = produitService.listerProduits();
        
        return produits.stream()
                .mapToDouble(p -> p.getPrix() * p.getQuantite())
                .sum();
    }
    
    @Override
    public double getPrixMoyen() {
        logger.info("Calcul du prix moyen des produits");
        List<Produit> produits = produitService.listerProduits();
        
        if (produits.isEmpty()) {
            return 0.0;
        }
        
        return produits.stream()
                .mapToDouble(Produit::getPrix)
                .average()
                .orElse(0.0);
    }
    
    @Override
    public long getNombreProduitsEnRupture() {
        logger.info("Calcul du nombre de produits en rupture");
        return produitService.obtenirProduitsEnRupture().size();
    }
    
    @Override
    public Map<String, Object> getStatistiquesGenerales() {
        logger.info("Génération des statistiques générales");
        
        Map<String, Object> stats = new HashMap<>();
        List<Produit> produits = produitService.listerProduits();
        
        stats.put("nombreTotal", produits.size());
        stats.put("valeurTotalStock", getValeurTotalStock());
        stats.put("prixMoyen", getPrixMoyen());
        stats.put("nombreEnRupture", getNombreProduitsEnRupture());
        
        // Produit le plus cher
        produits.stream()
                .max((p1, p2) -> Double.compare(p1.getPrix(), p2.getPrix()))
                .ifPresent(p -> {
                    stats.put("produitPlusCher", p.getDesignation());
                    stats.put("prixMax", p.getPrix());
                });
        
        // Produit le moins cher
        produits.stream()
                .min((p1, p2) -> Double.compare(p1.getPrix(), p2.getPrix()))
                .ifPresent(p -> {
                    stats.put("produitMoinsCher", p.getDesignation());
                    stats.put("prixMin", p.getPrix());
                });
        
        return stats;
    }
}
