package web;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

import jakarta.ejb.EJB;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import ejb.IProduitService;
import ejb.IStatistiqueService;
import entities.Produit;

@WebServlet(name = "ProduitServlet", urlPatterns = {"/produits"})
public class ProduitServlet extends HttpServlet {
    
    private static final Logger logger = Logger.getLogger(ProduitServlet.class.getName());
    
    @EJB
    private IProduitService produitService;
    
    @EJB
    private IStatistiqueService statistiqueService;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        if (action == null) {
            action = "lister";
        }
        
        try {
            switch (action) {
                case "lister":
                    listerProduits(request, response);
                    break;
                case "chercher":
                    chercherProduits(request, response);
                    break;
                case "nouveau":
                    request.getRequestDispatcher("/ajouterProduit.jsp").forward(request, response);
                    break;
                case "modifier":
                    afficherModifierProduit(request, response);
                    break;
                case "supprimer":
                    supprimerProduit(request, response);
                    break;
                case "statistiques":
                    afficherStatistiques(request, response);
                    break;
                default:
                    listerProduits(request, response);
            }
        } catch (Exception e) {
            logger.severe("Erreur dans ProduitServlet: " + e.getMessage());
            request.setAttribute("erreur", "Une erreur s'est produite: " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String action = request.getParameter("action");
        
        try {
            if ("ajouter".equals(action)) {
                ajouterProduit(request, response);
            } else if ("modifier".equals(action)) {
                modifierProduit(request, response);
            }
        } catch (Exception e) {
            logger.severe("Erreur dans ProduitServlet POST: " + e.getMessage());
            request.setAttribute("erreur", "Une erreur s'est produite: " + e.getMessage());
            
            if ("ajouter".equals(action)) {
                request.getRequestDispatcher("/ajouterProduit.jsp").forward(request, response);
            } else {
                afficherModifierProduit(request, response);
            }
        }
    }
    
    private void listerProduits(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        logger.info("Affichage de la liste des produits");
        List<Produit> produits = produitService.listerProduits();
        request.setAttribute("produits", produits);
        request.getRequestDispatcher("/produits.jsp").forward(request, response);
    }
    
    private void chercherProduits(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String motCle = request.getParameter("motCle");
        logger.info("Recherche de produits avec le mot-clé: " + motCle);
        
        List<Produit> produits = produitService.chercherProduits(motCle);
        request.setAttribute("produits", produits);
        request.setAttribute("motCle", motCle);
        request.getRequestDispatcher("/produits.jsp").forward(request, response);
    }
    
    private void ajouterProduit(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        String designation = request.getParameter("designation");
        int prix = Integer.parseInt(request.getParameter("prix"));
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        
        Produit produit = new Produit(designation, prix, quantite);
        produitService.ajouterProduit(produit);
        
        logger.info("Produit ajouté avec succès: " + designation);
        request.setAttribute("message", "Produit ajouté avec succès!");
        response.sendRedirect("produits?action=lister");
    }
    
    private void afficherModifierProduit(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Produit produit = produitService.obtenirProduit(id);
        
        if (produit != null) {
            request.setAttribute("produit", produit);
            request.getRequestDispatcher("/modifierProduit.jsp").forward(request, response);
        } else {
            request.setAttribute("erreur", "Produit non trouvé");
            listerProduits(request, response);
        }
    }
    
    private void modifierProduit(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String designation = request.getParameter("designation");
        int prix = Integer.parseInt(request.getParameter("prix"));
        int quantite = Integer.parseInt(request.getParameter("quantite"));
        
        Produit produit = new Produit(id, designation, prix, quantite);
        produitService.modifierProduit(produit);
        
        logger.info("Produit modifié avec succès: ID=" + id);
        response.sendRedirect("produits?action=lister");
    }
    
    private void supprimerProduit(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        produitService.supprimerProduit(id);
        
        logger.info("Produit supprimé avec succès: ID=" + id);
        response.sendRedirect("produits?action=lister");
    }
    
    private void afficherStatistiques(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        logger.info("Affichage des statistiques");
        Map<String, Object> stats = statistiqueService.getStatistiquesGenerales();
        request.setAttribute("statistiques", stats);
        request.getRequestDispatcher("/statistiques.jsp").forward(request, response);
    }
}
