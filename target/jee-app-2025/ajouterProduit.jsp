<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ajouter un Produit - JEE App 2025</title>
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

                <a class="nav-link" href="produits?action=lister">
                   Produits
                </a>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-success text-white">
                        <h4 class="mb-0">
                            <i class="bi bi-plus-circle"></i> Ajouter un Nouveau Produit
                        </h4>
                    </div>
                    
                    <div class="card-body">
                        <c:if test="${not empty erreur}">
                            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                                <i class="bi bi-exclamation-triangle"></i> ${erreur}
                                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                            </div>
                        </c:if>

                        <form method="post" action="produits" novalidate>
                            <input type="hidden" name="action" value="ajouter">
                            
                            <div class="mb-3">
                                <label for="designation" class="form-label">
                                    <i class="bi bi-tag"></i> Désignation *
                                </label>
                                <input type="text" class="form-control" id="designation" name="designation" 
                                       required maxlength="100" value="${param.designation}">
                                <div class="invalid-feedback">
                                    Veuillez saisir une désignation valide.
                                </div>
                            </div>
                            
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="prix" class="form-label">
                                            Prix *
                                        </label>
                                        <div class="input-group">
                                            <input type="number" class="form-control" id="prix" name="prix" 
                                                   step="0.01" min="0" required value="${param.prix}">
                                            <span class="input-group-text">FCFA</span>
                                        </div>
                                        <div class="invalid-feedback">
                                            Veuillez saisir un prix valide.
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="quantite" class="form-label">
                                            <i class="bi bi-box"></i> Quantité *
                                        </label>
                                        <input type="number" class="form-control" id="quantite" name="quantite" 
                                               min="0" required value="${param.quantite}">
                                        <div class="invalid-feedback">
                                            Veuillez saisir une quantité valide.
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                                <a href="produits?action=lister" class="btn btn-secondary me-md-2">
                                    <i class="bi bi-arrow-left"></i> Annuler
                                </a>
                                <button type="submit" class="btn btn-success">
                                    <i class="bi bi-check"></i> Ajouter le Produit
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
               </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        // Validation côté client
        (function() {
            'use strict';
            window.addEventListener('load', function() {
                var forms = document.getElementsByClassName('needs-validation');
                var validation = Array.prototype.filter.call(forms, function(form) {
                    form.addEventListener('submit', function(event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>
</body>
</html>
