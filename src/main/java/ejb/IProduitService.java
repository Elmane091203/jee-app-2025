package ejb;

import entities.Produit;
import jakarta.ejb.Local;
import java.util.List;

@Local
public interface IProduitService {
    void ajouterProduit(Produit produit);
    List<Produit> listerProduits();
    List<Produit> chercherProduits(String motCle);
    Produit obtenirProduit(int id);
    void modifierProduit(Produit produit);
    void supprimerProduit(int id);
    long compterProduits();
    List<Produit> obtenirProduitsEnRupture();
}
