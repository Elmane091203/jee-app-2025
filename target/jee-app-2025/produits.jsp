<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Produits - JEE App 2025</title>
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
                <a class="nav-link" href="produits?action=statistiques">
                    <i class="bi bi-graph-up"></i> Statistiques
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <div class="row align-items-center">
                            <div class="col">
                                <h4 class="mb-0">
                                    <i class="bi bi-list-ul"></i> Liste des Produits
                                </h4>
                            </div>
                            <div class="col-auto">
                                <a href="produits?action=nouveau" class="btn btn-light">
                                    <i class="bi bi-plus"></i> Nouveau Produit
                                </a>
                                <a href="produits?action=statistiques" class="btn btn-info">
                                    <i class="bi bi-graph-up"></i> Statistiques
                                </a>
                            </div>
                        </div>
                    </div>
                    
                    <div class="card-body">
                        <!-- Formulaire de recherche -->
                        <form method="get" action="produits" class="mb-4">
                            <input type="hidden" name="action" value="chercher">
                            <div class="row">
                                <div class="col-md-8">
                                    <input type="text" name="motCle" class="form-control" 
                                           placeholder="Rechercher un produit..." 
                                           value="${motCle}">
                                </div>
                                <div class="col-md-4">
                                    <button type="submit" class="btn btn-info me-2">
                                        <i class="bi bi-search"></i> Rechercher
                                    </button>
                                    <a href="produits?action=lister" class="btn btn-secondary">
                                        <i class="bi bi-arrow-clockwise"></i> Tout afficher
                                    </a>
                                </div>
                            </div>
                        </form>

                        <!-- Messages -->
                        <c:if test="${not empty erreur}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="bi bi-exclamation-triangle"></i> ${erreur}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>

                        <c:if test="${not empty message}">
                            <div class="alert alert-success alert-dismissible fade show" role="alert">
                                <i class="bi bi-check-circle"></i> ${message}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>

                        <!-- Tableau des produits -->
                        <c:choose>
                            <c:when test="${empty produits}">
                                <div class="text-center py-5">
                                    <i class="bi bi-inbox display-1 text-muted"></i>
                                    <h5 class="text-muted mt-3">Aucun produit trouvé</h5>
                                    <p class="text-muted">
                                        <c:choose>
                                            <c:when test="${not empty motCle}">
                                                Aucun produit ne correspond à votre recherche "${motCle}"
                                            </c:when>
                                            <c:otherwise>
                                                Commencez par ajouter votre premier produit
                                            </c:otherwise>
                                        </c:choose>
                                    </p>
                                    <a href="produits?action=nouveau" class="btn btn-primary">
                                        <i class="bi bi-plus"></i> Ajouter un produit
                                    </a>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table table-striped table-hover">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>ID</th>
                                                <th>Désignation</th>
                                                <th>Prix</th>
                                                <th>Quantité</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="produit" items="${produits}">
                                                <tr>
                                                    <td><span class="badge bg-secondary">${produit.id}</span></td>
                                                    <td><strong>${produit.designation}</strong></td>
                                                    <td>
                                                        <span class="text-success fw-bold">
                                                            ${produit.prix}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${produit.quantite > 10}">
                                                                <span class="badge bg-success">${produit.quantite}</span>
                                                            </c:when>
                                                            <c:when test="${produit.quantite > 0}">
                                                                <span class="badge bg-warning">${produit.quantite}</span>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <span class="badge bg-danger">${produit.quantite}</span>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <div class="btn-group" role="group">
                                                            <a href="produits?action=modifier&id=${produit.id}" 
                                                               class="btn btn-sm btn-warning" title="Modifier">
                                                                <i class="bi bi-pencil"></i>
                                                            </a>
                                                            <a href="produits?action=supprimer&id=${produit.id}" 
                                                               class="btn btn-sm btn-danger" title="Supprimer"
                                                               onclick="return confirm('Êtes-vous sûr de vouloir supprimer ce produit ?')">
                                                                <i class="bi bi-trash"></i>
                                                            </a>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                                
                                <div class="mt-3">
                                    <small class="text-muted">
                                        <i class="bi bi-info-circle"></i> 
                                        Total : ${produits.size()} produit(s)
                                        <c:if test="${not empty motCle}">
                                            correspondant à "${motCle}"
                                        </c:if>
                                    </small>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
