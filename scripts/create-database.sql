-- Création de la base de données jee_db
CREATE DATABASE IF NOT EXISTS jee_db 
CHARACTER SET utf8mb4 
COLLATE utf8mb4_unicode_ci;

-- Utilisation de la base de données
USE jee_db;

-- Création de la table produits
CREATE TABLE IF NOT EXISTS produits (
    id INT AUTO_INCREMENT PRIMARY KEY,
    designation VARCHAR(100) NOT NULL,
    prix DECIMAL(10,2) NOT NULL,
    quantite INT NOT NULL DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Index pour améliorer les performances de recherche
CREATE INDEX idx_designation ON produits(designation);
CREATE INDEX idx_prix ON produits(prix);
CREATE INDEX idx_quantite ON produits(quantite);

-- Affichage de la structure de la table
DESCRIBE produits;
