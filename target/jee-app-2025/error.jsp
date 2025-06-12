<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erreur - JEE App 2025</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.0/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
        <div class="container">
            <a class="navbar-brand" href="index.jsp">
                <i class="bi bi-box-seam"></i> JEE App 2025
            </a>
        </div>
    </nav>

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-body text-center">
                        <i class="bi bi-exclamation-triangle display-1 text-warning"></i>
                        <h1 class="card-title mt-3">Oups ! Une erreur s'est produite</h1>
                        
                        <% 
                        Integer statusCode = (Integer) request.getAttribute("javax.servlet.error.status_code");
                        String errorMessage = (String) request.getAttribute("javax.servlet.error.message");
                        %>
                        
                        <% if (statusCode != null && statusCode == 404) { %>
                            <div class="alert alert-warning" role="alert">
                                <h5><i class="bi bi-search"></i> Page non trouvée (404)</h5>
                                <p>La page que vous recherchez n'existe pas ou a été déplacée.</p>
                            </div>
                        <% } else if (statusCode != null && statusCode == 500) { %>
                            <div class="alert alert-danger" role="alert">
                                <h5><i class="bi bi-bug"></i> Erreur serveur (500)</h5>
                                <p>Une erreur interne s'est produite. Veuillez réessayer plus tard.</p>
                            </div>
                        <% } else { %>
                            <div class="alert alert-info" role="alert">
                                <h5><i class="bi bi-info-circle"></i> Erreur</h5>
                                <p>Une erreur inattendue s'est produite.</p>
                                <% if (errorMessage != null) { %>
                                    <small class="text-muted">Détail : <%= errorMessage %></small>
                                <% } %>
                            </div>
                        <% } %>
                        
                        <div class="mt-4">
                            <a href="produits?action=lister" class="btn btn-primary me-2">
                                <i class="bi bi-list-ul"></i> Voir les Produits
                            </a>
                            <a href="index.jsp" class="btn btn-secondary">
                                <i class="bi bi-house"></i> Accueil
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
