package entities;

import jakarta.persistence.*;

@Entity
@Table(name = "produits")
public class Produit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    
    @Column(name = "designation", nullable = false, length = 100)
    private String designation;
    
    @Column(name = "prix", nullable = false)
    private int prix;
    
    @Column(name = "quantite", nullable = false)
    private int quantite;
    
    // Constructeurs
    public Produit() {}
    
    public Produit(String designation, int prix, int quantite) {
        this.designation = designation;
        this.prix = prix;
        this.quantite = quantite;
    }
    
    public Produit(int id, String designation, int prix, int quantite) {
        this.id = id;
        this.designation = designation;
        this.prix = prix;
        this.quantite = quantite;
    }
    
    // Getters et Setters
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getDesignation() {
        return designation;
    }
    
    public void setDesignation(String designation) {
        this.designation = designation;
    }
    
    public double getPrix() {
        return prix;
    }
    
    public void setPrix(int prix) {
        this.prix = prix;
    }
    
    public int getQuantite() {
        return quantite;
    }
    
    public void setQuantite(int quantite) {
        this.quantite = quantite;
    }
    
    @Override
    public String toString() {
        return "Produit{" +
                "id=" + id +
                ", designation='" + designation + '\'' +
                ", prix=" + prix +
                ", quantite=" + quantite +
                '}';
    }
}
