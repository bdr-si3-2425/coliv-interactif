-- Insertion des 8 complexes
INSERT INTO COMPLEXE (Ville, CodePostal, NomDeRue, NumeroDeRue) VALUES
('Paris', '75001', 'Rue de Rivoli', 10),
('Lyon', '69001', 'Rue de la République', 20),
('Marseille', '13001', 'Cours Belsunce', 30),
('Bordeaux', '33000', 'Place des Quinconces', 40),
('Toulouse', '31000', 'Avenue de la République', 50),
('Nice', '06000', 'Promenade des Anglais', 60),
('Nantes', '44000', 'Boulevard de la Liberté', 70),
('Strasbourg', '67000', 'Rue du Vieux Marché aux Poissons', 80);


-- Insertion des 160 logements (20 par complexe)

-- Complexe 1 (Paris)
INSERT INTO LOGEMENT (idComplexe, type, etat) VALUES
(1, 'Studio', 'Disponible'),
(1, 'Appartement T1', 'Occupée'),
(1, 'Appartement T2', 'Disponible'),
(1, 'Loft', 'Occupée'),
(1, 'Appartement T1', 'Disponible'),
(1, 'Appartement T2', 'Occupée'),
(1, 'Studio', 'Disponible'),
(1, 'Appartement T3', 'Occupée'),
(1, 'Loft', 'Disponible'),
(1, 'Appartement T2', 'Occupée'),
(1, 'Appartement T1', 'Disponible'),
(1, 'Studio', 'Occupée'),
(1, 'Appartement T3', 'Disponible'),
(1, 'Loft', 'Occupée'),
(1, 'Studio', 'Disponible'),
(1, 'Appartement T2', 'Occupée'),
(1, 'Appartement T1', 'Disponible'),
(1, 'Loft', 'Occupée'),
(1, 'Appartement T3', 'Disponible'),
(1, 'Studio', 'Occupée');

-- Complexe 2 (Lyon)
INSERT INTO LOGEMENT (idComplexe, type, etat) VALUES
(2, 'Appartement T1', 'Disponible'),
(2, 'Appartement T2', 'Occupée'),
(2, 'Studio', 'Disponible'),
(2, 'Loft', 'Occupée'),
(2, 'Appartement T3', 'Disponible'),
(2, 'Appartement T2', 'Occupée'),
(2, 'Studio', 'Disponible'),
(2, 'Appartement T1', 'Occupée'),
(2, 'Loft', 'Disponible'),
(2, 'Appartement T3', 'Occupée'),
(2, 'Studio', 'Disponible'),
(2, 'Appartement T1', 'Occupée'),
(2, 'Appartement T3', 'Disponible'),
(2, 'Appartement T2', 'Occupée'),
(2, 'Studio', 'Disponible'),
(2, 'Appartement T3', 'Occupée'),
(2, 'Loft', 'Disponible'),
(2, 'Appartement T1', 'Occupée'),
(2, 'Appartement T2', 'Disponible'),
(2, 'Studio', 'Occupée');

-- Complexe 3 (Marseille)
INSERT INTO LOGEMENT (idComplexe, type, etat) VALUES
(3, 'Appartement T1', 'Disponible'),
(3, 'Appartement T2', 'Occupée'),
(3, 'Loft', 'Disponible'),
(3, 'Studio', 'Occupée'),
(3, 'Appartement T3', 'Disponible'),
(3, 'Appartement T1', 'Occupée'),
(3, 'Loft', 'Disponible'),
(3, 'Appartement T2', 'Occupée'),
(3, 'Appartement T3', 'Disponible'),
(3, 'Studio', 'Occupée'),
(3, 'Appartement T1', 'Disponible'),
(3, 'Appartement T2', 'Occupée'),
(3, 'Loft', 'Disponible'),
(3, 'Studio', 'Occupée'),
(3, 'Appartement T1', 'Disponible'),
(3, 'Appartement T3', 'Occupée'),
(3, 'Loft', 'Disponible'),
(3, 'Appartement T2', 'Occupée'),
(3, 'Studio', 'Disponible'),
(3, 'Appartement T1', 'Occupée');

-- Complexe 4 (Bordeaux)
INSERT INTO LOGEMENT (idComplexe, type, etat) VALUES
(4, 'Appartement T1', 'Disponible'),
(4, 'Appartement T2', 'Occupée'),
(4, 'Studio', 'Disponible'),
(4, 'Loft', 'Occupée'),
(4, 'Appartement T3', 'Disponible'),
(4, 'Appartement T2', 'Occupée'),
(4, 'Studio', 'Disponible'),
(4, 'Appartement T1', 'Occupée'),
(4, 'Loft', 'Disponible'),
(4, 'Appartement T3', 'Occupée'),
(4, 'Studio', 'Disponible'),
(4, 'Appartement T1', 'Occupée'),
(4, 'Appartement T3', 'Disponible'),
(4, 'Appartement T2', 'Occupée'),
(4, 'Studio', 'Disponible'),
(4, 'Appartement T3', 'Occupée'),
(4, 'Loft', 'Disponible'),
(4, 'Appartement T1', 'Occupée'),
(4, 'Appartement T2', 'Disponible'),
(4, 'Studio', 'Occupée');

-- Complexe 5 (Toulouse)
INSERT INTO LOGEMENT (idComplexe, type, etat) VALUES
(5, 'Appartement T1', 'Disponible'),
(5, 'Appartement T2', 'Occupée'),
(5, 'Loft', 'Disponible'),
(5, 'Studio', 'Occupée'),
(5, 'Appartement T3', 'Disponible'),
(5, 'Appartement T1', 'Occupée'),
(5, 'Loft', 'Disponible'),
(5, 'Appartement T2', 'Occupée'),
(5, 'Appartement T3', 'Disponible'),
(5, 'Studio', 'Occupée'),
(5, 'Appartement T1', 'Disponible'),
(5, 'Appartement T2', 'Occupée'),
(5, 'Loft', 'Disponible'),
(5, 'Studio', 'Occupée'),
(5, 'Appartement T1', 'Disponible'),
(5, 'Appartement T3', 'Occupée'),
(5, 'Loft', 'Disponible'),
(5, 'Appartement T2', 'Occupée'),
(5, 'Studio', 'Disponible'),
(5, 'Appartement T1', 'Occupée');

-- Complexe 6 (Nice)
INSERT INTO LOGEMENT (idComplexe, type, etat) VALUES
(6, 'Appartement T1', 'Disponible'),
(6, 'Appartement T2', 'Occupée'),
(6, 'Loft', 'Disponible'),
(6, 'Studio', 'Occupée'),
(6, 'Appartement T3', 'Disponible'),
(6, 'Appartement T1', 'Occupée'),
(6, 'Loft', 'Disponible'),
(6, 'Appartement T2', 'Occupée'),
(6, 'Appartement T3', 'Disponible'),
(6, 'Studio', 'Occupée'),
(6, 'Appartement T1', 'Disponible'),
(6, 'Appartement T2', 'Occupée'),
(6, 'Loft', 'Disponible'),
(6, 'Studio', 'Occupée'),
(6, 'Appartement T1', 'Disponible'),
(6, 'Appartement T3', 'Occupée'),
(6, 'Loft', 'Disponible'),
(6, 'Appartement T2', 'Occupée'),
(6, 'Studio', 'Disponible'),
(6, 'Appartement T1', 'Occupée');

-- Complexe 7 (Nantes)
INSERT INTO LOGEMENT (idComplexe, type, etat) VALUES
(7, 'Appartement T1', 'Disponible'),
(7, 'Appartement T2', 'Occupée'),
(7, 'Loft', 'Disponible'),
(7, 'Studio', 'Occupée'),
(7, 'Appartement T3', 'Disponible'),
(7, 'Appartement T1', 'Occupée'),
(7, 'Loft', 'Disponible'),
(7, 'Appartement T2', 'Occupée'),
(7, 'Appartement T3', 'Disponible'),
(7, 'Studio', 'Occupée'),
(7, 'Appartement T1', 'Disponible'),
(7, 'Appartement T2', 'Occupée'),
(7, 'Loft', 'Disponible'),
(7, 'Studio', 'Occupée'),
(7, 'Appartement T1', 'Disponible'),
(7, 'Appartement T3', 'Occupée'),
(7, 'Loft', 'Disponible'),
(7, 'Appartement T2', 'Occupée'),
(7, 'Studio', 'Disponible'),
(7, 'Appartement T1', 'Occupée');

-- Complexe 8 (Strasbourg)
INSERT INTO LOGEMENT (idComplexe, type, etat) VALUES
(8, 'Appartement T1', 'Disponible'),
(8, 'Appartement T2', 'Occupée'),
(8, 'Loft', 'Disponible'),
(8, 'Studio', 'Occupée'),
(8, 'Appartement T3', 'Disponible'),
(8, 'Appartement T1', 'Occupée'),
(8, 'Loft', 'Disponible'),
(8, 'Appartement T2', 'Occupée'),
(8, 'Appartement T3', 'Disponible'),
(8, 'Studio', 'Occupée'),
(8, 'Appartement T1', 'Disponible'),
(8, 'Appartement T2', 'Occupée'),
(8, 'Loft', 'Disponible'),
(8, 'Studio', 'Occupée'),
(8, 'Appartement T1', 'Disponible'),
(8, 'Appartement T3', 'Occupée'),
(8, 'Loft', 'Disponible'),
(8, 'Appartement T2', 'Occupée'),
(8, 'Studio', 'Disponible'),
(8, 'Appartement T1', 'Occupée');


-- Insertion des équipements pour les logements
INSERT INTO EQUIPEMENT (nom, etat, tarifEquipement, idLogement) VALUES
('Chaise', 'Bon', 25.00, 1),
('Table', 'Bon', 50.00, 1),
('Réfrigérateur', 'Bon', 150.00, 1),
('Chaise', 'Bon', 25.00, 2),
('Table', 'Bon', 50.00, 2),
('Réfrigérateur', 'Bon', 150.00, 2),
('Chaise', 'Mauvais', 15.00, 3),
('Table', 'Mauvais', 30.00, 3),
('Réfrigérateur', 'Bon', 150.00, 3),
('Chaise', 'Bon', 25.00, 4),
('Table', 'Bon', 50.00, 4),
('Réfrigérateur', 'Bon', 150.00, 4),
('Chaise', 'Bon', 25.00, 5),
('Table', 'Mauvais', 40.00, 5),
('Réfrigérateur', 'Bon', 150.00, 5),
('Chaise', 'Bon', 25.00, 6),
('Table', 'Bon', 50.00, 6),
('Réfrigérateur', 'Mauvais', 120.00, 6),
('Chaise', 'Mauvais', 15.00, 7),
('Table', 'Bon', 50.00, 7),
-- Répétez pour les autres logements (160 équipements pour 160 logements)
('Réfrigérateur', 'Bon', 150.00, 8),
('Chaise', 'Bon', 25.00, 8),
('Table', 'Bon', 50.00, 8);



-- Insertion des résidents
INSERT INTO RESIDENT (Nom, Prenom, NumeroDeTelephone, Email) VALUES
('Dupont', 'Jean', '0123456789', 'jean.dupont@example.com'),
('Martin', 'Marie', '0234567890', 'marie.martin@example.com'),
('Durand', 'Pierre', '0345678901', 'pierre.durand@example.com'),
('Lemoine', 'Paul', '0456789012', 'paul.lemoine@example.com'),
('Robert', 'Sophie', '0567890123', 'sophie.robert@example.com'),
('Dubois', 'Lucie', '0678901234', 'lucie.dubois@example.com'),
('Garnier', 'Julien', '0789012345', 'julien.garnier@example.com'),
('Lemoine', 'Claire', '0890123456', 'claire.lemoine@example.com'),
-- Ajoutez jusqu'à 160 résidents selon votre besoin
('Dufresne', 'Nathalie', '0901234567', 'nathalie.dufresne@example.com');



-- Insertion des réservations
INSERT INTO RESERVATION (dateEntree, dateSortie, idResident, idLogement) VALUES
('2025-02-01', '2025-02-28', 1, 153),
('2025-02-01', '2025-02-28', 2, 151),
('2025-02-01', '2025-02-28', 3, 155),
('2025-02-01', '2025-02-28', 4, 157),
('2025-02-01', '2025-02-28', 5, 159),
('2025-02-01', '2025-02-28', 6, 137),
('2025-02-01', '2025-02-28', 7, 133),
('2025-02-01', '2025-02-28', 8, 131);


-- Insertion des maintenances
INSERT INTO MAINTENANCE (type, urgence, tarifM) VALUES
('Réparation de plomberie', TRUE, 100.00),
('Réparation de chauffage', FALSE, 80.00),
('Réparation de réfrigérateur', TRUE, 120.00),
('Peinture', FALSE, 50.00),
('Réparation électrique', TRUE, 150.00);




-- Insertion des événements
INSERT INTO EVENEMENT (nom, date, invite, lieu) VALUES
('Réunion des résidents', '2025-02-10', 'Tous les résidents', 'Salle commune du complexe 1'),
('Soirée barbecue', '2025-02-15', 'Tous les résidents', 'Jardin du complexe 2'),
('Atelier peinture', '2025-02-20', 'Résidents intéressés', 'Salle des loisirs du complexe 3'),
('Soirée cinéma', '2025-02-25', 'Tous les résidents', 'Salle commune du complexe 4'),
('Chasse au trésor', '2025-02-28', 'Tous les résidents', 'Terrains de sport du complexe 5');



-- Insertion des participations
INSERT INTO PARTICIPE (idResident, idEvenement) VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4);


-- Insertion des maintenances sur les équipements
INSERT INTO EST_MAINTENU (idEquipement, idMaintenance, date) VALUES
(3, 3, '2025-02-05'),
(10, 1, '2025-02-06'),
(12, 2, '2025-02-07'),
(17, 5, '2025-02-08');
