package dao;

import entities.Produit;
import java.util.List;

public interface IProduitDao {
    void ajouterProduit(Produit produit);
    List<Produit> listerProduits();
    List<Produit> chercherProduits(String motCle);
    Produit obtenirProduit(int id);
    void modifierProduit(Produit produit);
    void supprimerProduit(int id);
}
