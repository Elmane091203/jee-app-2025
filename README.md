# JEE App 2025 - Gestion des Produits

Application JEE moderne pour la gestion des produits utilisant JPA/Hibernate au lieu de JDBC direct.

## 🚀 Fonctionnalités

- ✅ **CRUD complet** : Créer, Lire, Modifier, Supprimer des produits
- 🔍 **Recherche** : Recherche par désignation avec filtrage
- 📱 **Interface responsive** : Design moderne avec Bootstrap 5
- 🗄️ **Persistance JPA** : Utilisation d'Hibernate pour la gestion des données
- 🎯 **Architecture en couches** : Séparation claire des responsabilités

## 🏗️ Architecture

### Couches de l'application

1. **Couche Entity** (`entities/`)
   - `Produit.java` : Entité JPA avec annotations

2. **Couche DAO** (`dao/`)
   - `IProduitDao.java` : Interface définissant les opérations CRUD
   - `ProduitDaoImpl.java` : Implémentation JPA/Hibernate

3. **Couche Web** (`web/`)
   - `ProduitServlet.java` : Contrôleur principal gérant toutes les requêtes

4. **Couche Vue** (`webapp/`)
   - Pages JSP avec Bootstrap pour l'interface utilisateur

## 🛠️ Technologies utilisées

- **Java EE** : Servlets, JSP, JSTL
- **JPA/Hibernate** : Persistance des données
- **PostegreSQL** : Base de données
- **Bootstrap 5** : Framework CSS
- **Maven** : Gestion des dépendances

## 📋 Prérequis

- Java 11 ou supérieur
- Apache Tomcat 9+
- PostgreSQL 15+
- Maven 3.6+

## 🚀 Installation et déploiement

### 1. Cloner le projet
\`\`\`bash
git clone <repository-url>
cd jee-app-2025
\`\`\`

### 2. Configuration de la base de données

1. Créer la base de données PostgreSQL :
\`\`\`sql
CREATE DATABASE jee_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
\`\`\`

### 3. Compilation et déploiement

\`\`\`bash
# Compilation
mvn clean compile

# Création du WAR
mvn clean package

# Déploiement sur Tomcat (copier le fichier WAR dans webapps/)
cp target/jee-app-2025.war $TOMCAT_HOME/webapps/

# Ou utiliser le plugin Tomcat Maven
mvn tomcat7:run
\`\`\`

### 5. Accès à l'application

Ouvrir un navigateur et aller à : `http://localhost:8080/jee-app-2025`

## 📱 Utilisation

### Page d'accueil
- Vue d'ensemble de l'application
- Liens rapides vers les fonctionnalités principales

### Gestion des produits
- **Lister** : Affichage de tous les produits avec pagination
- **Rechercher** : Filtrage par désignation
- **Ajouter** : Formulaire de création de produit
- **Modifier** : Édition des informations d'un produit
- **Supprimer** : Suppression avec confirmation

## 🗂️ Structure du projet

\`\`\`
jee-app-2025/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   ├── entities/
│   │   │   │   └── Produit.java
│   │   │   ├── dao/
│   │   │   │   ├── IProduitDao.java
│   │   │   │   └── ProduitDaoImpl.java
│   │   │   └── web/
│   │   │       └── ProduitServlet.java
│   │   ├── resources/
│   │   │   └── META-INF/
│   │   │       └── persistence.xml
│   │   └── webapp/
│   │       ├── WEB-INF/
│   │       │   └── web.xml
│   │       ├── index.jsp
│   │       ├── produits.jsp
│   │       ├── ajouterProduit.jsp
│   │       └── modifierProduit.jsp
│   └── scripts/
│       ├── create-database.sql
│       └── seed-data.sql
├── pom.xml
└── README.md
\`\`\`

