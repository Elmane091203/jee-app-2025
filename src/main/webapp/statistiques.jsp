<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Statistiques - JEE App 2025</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="bi bi-box-seam"></i> JEE App 2025
            </a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="index.jsp">
                    <i class="bi bi-house"></i> Accueil
                </a>
                <a class="nav-link" href="produits?action=lister">
                    <i class="bi bi-list-ul"></i> Produits
                </a>
                <a class="nav-link active" href="produits?action=statistiques">
                    <i class="bi bi-graph-up"></i> Statistiques
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <div class="card shadow">
                    <div class="card-header bg-info text-white">
                        <h4 class="mb-0">
                            <i class="bi bi-graph-up"></i> Statistiques des Produits
                        </h4>
                    </div>
                    
                    <div class="card-body">
                        <c:if test="${not empty statistiques}">
                            <div class="row">
                                <!-- Statistiques générales -->
                                <div class="col-md-3 mb-4">
                                    <div class="card bg-primary text-white h-100">
                                        <div class="card-body text-center">
                                            <i class="bi bi-box display-4"></i>
                                            <h3 class="mt-2">${statistiques.nombreTotal}</h3>
                                            <p class="mb-0">Produits Total</p>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-3 mb-4">
                                    <div class="card bg-success text-white h-100">
                                        <div class="card-body text-center">
                                            <i class="bi bi-currency-euro display-4"></i>
                                            <h3 class="mt-2">
                                                <fmt:formatNumber value="${statistiques.valeurTotalStock}" 
                                                                type="currency" currencySymbol="€"/>
                                            </h3>
                                            <p class="mb-0">Valeur Stock</p>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-3 mb-4">
                                    <div class="card bg-warning text-dark h-100">
                                        <div class="card-body text-center">
                                            <i class="bi bi-calculator display-4"></i>
                                            <h3 class="mt-2">
                                                <fmt:formatNumber value="${statistiques.prixMoyen}" 
                                                                type="currency" currencySymbol="€"/>
                                            </h3>
                                            <p class="mb-0">Prix Moyen</p>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-3 mb-4">
                                    <div class="card bg-danger text-white h-100">
                                        <div class="card-body text-center">
                                            <i class="bi bi-exclamation-triangle display-4"></i>
                                            <h3 class="mt-2">${statistiques.nombreEnRupture}</h3>
                                            <p class="mb-0">En Rupture</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Détails des produits -->
                            <div class="row mt-4">
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-header bg-success text-white">
                                            <h5 class="mb-0">
                                                <i class="bi bi-arrow-up-circle"></i> Produit le Plus Cher
                                            </h5>
                                        </div>
                                        <div class="card-body">
                                            <c:if test="${not empty statistiques.produitPlusCher}">
                                                <h6>${statistiques.produitPlusCher}</h6>
                                                <p class="text-success fw-bold">
                                                    <fmt:formatNumber value="${statistiques.prixMax}" 
                                                                    type="currency" currencySymbol="€"/>
                                                </p>
                                            </c:if>
                                            <c:if test="${empty statistiques.produitPlusCher}">
                                                <p class="text-muted">Aucun produit disponible</p>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="card">
                                        <div class="card-header bg-info text-white">
                                            <h5 class="mb-0">
                                                <i class="bi bi-arrow-down-circle"></i> Produit le Moins Cher
                                            </h5>
                                        </div>
                                        <div class="card-body">
                                            <c:if test="${not empty statistiques.produitMoinsCher}">
                                                <h6>${statistiques.produitMoinsCher}</h6>
                                                <p class="text-info fw-bold">
                                                    <fmt:formatNumber value="${statistiques.prixMin}" 
                                                                    type="currency" currencySymbol="€"/>
                                                </p>
                                            </c:if>
                                            <c:if test="${empty statistiques.produitMoinsCher}">
                                                <p class="text-muted">Aucun produit disponible</p>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <!-- Actions -->
                            <div class="row mt-4">
                                <div class="col-12 text-center">
                                    <a href="produits?action=lister" class="btn btn-primary me-2">
                                        <i class="bi bi-list-ul"></i> Voir les Produits
                                    </a>
                                    <a href="produits?action=nouveau" class="btn btn-success">
                                        <i class="bi bi-plus"></i> Ajouter un Produit
                                    </a>
                                </div>
                            </div>
                        </c:if>
                        
                        <c:if test="${empty statistiques}">
                            <div class="text-center py-5">
                                <i class="bi bi-graph-down display-1 text-muted"></i>
                                <h5 class="text-muted mt-3">Aucune statistique disponible</h5>
                                <p class="text-muted">Ajoutez des produits pour voir les statistiques</p>
                                <a href="produits?action=nouveau" class="btn btn-primary">
                                    <i class="bi bi-plus"></i> Ajouter un produit
                                </a>
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
