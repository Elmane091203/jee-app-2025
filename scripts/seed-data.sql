-- Insertion de données de test dans la table produits
USE jee_db;

-- Suppression des données existantes (optionnel)
-- TRUNCATE TABLE produits;

-- Insertion de produits de démonstration
INSERT INTO produits (designation, prix, quantite) VALUES
('Ordinateur Portable Dell XPS 13', 1299.99, 15),
('Smartphone Samsung Galaxy S24', 899.50, 25),
('Casque Audio Sony WH-1000XM5', 349.99, 30),
('Tablette iPad Air', 649.00, 12),
('Clavier Mécanique Logitech', 129.99, 40),
('Souris Gaming Razer', 79.99, 35),
('Écran 4K LG 27 pouces', 399.99, 8),
('Webcam Logitech C920', 89.99, 20),
('Disque SSD Samsung 1To', 149.99, 50),
('Chargeur USB-C Anker', 29.99, 100),
('Enceinte Bluetooth JBL', 199.99, 18),
('Câble HDMI 2m', 19.99, 75),
('Hub USB-C 7 ports', 59.99, 22),
('Support Laptop Ergonomique', 45.99, 28),
('Batterie Externe 20000mAh', 39.99, 45);

-- Vérification des données insérées
SELECT COUNT(*) as 'Nombre de produits' FROM produits;

-- Affichage des premiers produits
SELECT * FROM produits ORDER BY id LIMIT 5;

-- Statistiques sur les produits
SELECT 
    MIN(prix) as 'Prix minimum',
    MAX(prix) as 'Prix maximum',
    AVG(prix) as 'Prix moyen',
    SUM(quantite) as 'Stock total'
FROM produits;
