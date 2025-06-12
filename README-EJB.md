# JEE App 2025 avec EJB - Guide de Déploiement

## 🚀 Nouveautés avec EJB

### Architecture EJB implémentée :

1. **Session Beans Stateless** :
   - `ProduitServiceBean` : Gestion des produits avec logique métier
   - `StatistiqueServiceBean` : Calculs et statistiques

2. **Injection de dépendances** :
   - `@EJB` pour l'injection des services
   - `@Local` pour les interfaces locales

3. **Gestion des transactions** :
   - `@TransactionAttribute` pour contrôler les transactions
   - Transactions automatiques pour les opérations CRUD

## 🛠️ Serveurs d'application compatibles

### WildFly (Recommandé)
\`\`\`bash
# Télécharger WildFly
wget https://github.com/wildfly/wildfly/releases/download/27.0.1.Final/wildfly-27.0.1.Final.zip
unzip wildfly-27.0.1.Final.zip

# Démarrer WildFly
cd wildfly-27.0.1.Final/bin
./standalone.sh

# Déployer l'application
mvn clean package wildfly:deploy
\`\`\`

## 📋 Configuration requise

1. **Java 11+**
2. **Serveur d'application JEE** (WildFly)
3. **PostgreSQL+**
4. **Maven 3.6+**

## 🔧 Avantages des EJB

- ✅ **Gestion automatique des transactions**
- ✅ **Injection de dépendances native**
- ✅ **Pool d'instances géré par le conteneur**
- ✅ **Sécurité intégrée**
- ✅ **Monitoring et gestion**
- ✅ **Scalabilité**

## 📊 Nouvelles fonctionnalités

- **Page Statistiques** : Analyse des données produits
- **Validation métier** : Contrôles dans les EJB
- **Logging avancé** : Traçabilité des opérations
- **Gestion d'erreurs** : Exceptions métier

## 🌐 URLs de l'application

- **Liste des produits** : `http://localhost:8080/jee-app-2025/produits`
- **Statistiques** : `http://localhost:8080/jee-app-2025/produits?action=statistiques`
- **Ajouter produit** : `http://localhost:8080/jee-app-2025/produits?action=nouveau`

## 🐛 Dépannage EJB

### Erreur d'injection EJB
- Vérifier que le serveur supporte les EJB
- S'assurer que `beans.xml` est présent
- Contrôler les annotations `@Local` et `@EJB`

### Problème de transaction
- Vérifier les annotations `@TransactionAttribute`
- S'assurer que la base de données supporte les transactions
- Contrôler la configuration JPA
