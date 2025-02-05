-- Certains de ces données ont été généré par ChatGPT pour nous faciliter les insertions

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

INSERT INTO LOGEMENT (idComplexe, type, etat, prix) VALUES
-- Complexe 1
(1, 'Studio', 'Disponible', 800),
(1, 'Studio', 'Disponible', 820),
(1, 'Appartement T1', 'Disponible', 950),
(1, 'Appartement T1', 'Disponible', 970),
(1, 'Appartement T2', 'Occupée', 1200),
(1, 'Appartement T2', 'Disponible', 1250),
(1, 'Appartement T3', 'Disponible', 1500),
(1, 'Appartement T3', 'Disponible', 1550),
(1, 'Loft', 'Occupée', 2000),
(1, 'Loft', 'Disponible', 2100),
(1, 'Villa', 'Disponible', 3500),
(1, 'Villa', 'Disponible', 3600),
(1, 'Penthouse', 'Occupée', 5000),
(1, 'Penthouse', 'Disponible', 5200),
(1, 'Duplex', 'Disponible', 2800),
(1, 'Duplex', 'Disponible', 2900),
(1, 'Maison de ville', 'Disponible', 3200),
(1, 'Maison de ville', 'Disponible', 3300),
(1, 'Chambre individuelle', 'Disponible', 500),
(1, 'Chambre individuelle', 'Disponible', 520),

-- Complexe 2
(2, 'Studio', 'Disponible', 750),
(2, 'Studio', 'Disponible', 770),
(2, 'Appartement T1', 'Occupée', 920),
(2, 'Appartement T1', 'Disponible', 940),
(2, 'Appartement T2', 'Disponible', 1100),
(2, 'Appartement T2', 'Disponible', 1150),
(2, 'Appartement T3', 'Disponible', 1400),
(2, 'Appartement T3', 'Occupée', 1450),
(2, 'Loft', 'Disponible', 1900),
(2, 'Loft', 'Disponible', 1950),
(2, 'Villa', 'Disponible', 3400),
(2, 'Villa', 'Occupée', 3500),
(2, 'Penthouse', 'Disponible', 4900),
(2, 'Penthouse', 'Disponible', 5000),
(2, 'Duplex', 'Disponible', 2700),
(2, 'Duplex', 'Occupée', 2750),
(2, 'Maison de ville', 'Disponible', 3100),
(2, 'Maison de ville', 'Disponible', 3150),
(2, 'Chambre individuelle', 'Disponible', 480),
(2, 'Chambre individuelle', 'Disponible', 490),

-- Complexe 3 
(3, 'Studio', 'Disponible', 780),
(3, 'Studio', 'Disponible', 800),
(3, 'Appartement T1', 'Disponible', 970),
(3, 'Appartement T1', 'Disponible', 990),
(3, 'Appartement T2', 'Occupée', 1250),
(3, 'Appartement T2', 'Disponible', 1300),
(3, 'Appartement T3', 'Disponible', 1600),
(3, 'Appartement T3', 'Disponible', 1650),
(3, 'Loft', 'Occupée', 2100),
(3, 'Loft', 'Disponible', 2200),
(3, 'Villa', 'Disponible', 3600),
(3, 'Villa', 'Disponible', 3700),
(3, 'Penthouse', 'Occupée', 5300),
(3, 'Penthouse', 'Disponible', 5500),
(3, 'Duplex', 'Disponible', 3000),
(3, 'Duplex', 'Disponible', 3100),
(3, 'Maison de ville', 'Disponible', 3400),
(3, 'Maison de ville', 'Disponible', 3500),
(3, 'Chambre individuelle', 'Disponible', 530),
(3, 'Chambre individuelle', 'Disponible', 550),

-- Complexe 4
(4, 'Studio', 'Disponible', 790),
(4, 'Studio', 'Disponible', 810),
(4, 'Appartement T1', 'Occupée', 980),
(4, 'Appartement T1', 'Disponible', 1000),
(4, 'Appartement T2', 'Disponible', 1270),
(4, 'Appartement T2', 'Disponible', 1320),
(4, 'Appartement T3', 'Disponible', 1650),
(4, 'Appartement T3', 'Occupée', 1700),
(4, 'Loft', 'Disponible', 2150),
(4, 'Loft', 'Disponible', 2250),
(4, 'Villa', 'Disponible', 3650),
(4, 'Villa', 'Occupée', 3750),
(4, 'Penthouse', 'Disponible', 5400),
(4, 'Penthouse', 'Disponible', 5600),
(4, 'Duplex', 'Disponible', 3100),
(4, 'Duplex', 'Occupée', 3200),
(4, 'Maison de ville', 'Disponible', 3500),
(4, 'Maison de ville', 'Disponible', 3600),
(4, 'Chambre individuelle', 'Disponible', 550),
(4, 'Chambre individuelle', 'Disponible', 570),

-- Complexe 5
(5, 'Studio', 'Disponible', 800),
(5, 'Studio', 'Disponible', 820),
(5, 'Appartement T1', 'Disponible', 990),
(5, 'Appartement T1', 'Disponible', 1010),
(5, 'Appartement T2', 'Occupée', 1290),
(5, 'Appartement T2', 'Disponible', 1340),
(5, 'Appartement T3', 'Disponible', 1700),
(5, 'Appartement T3', 'Disponible', 1750),
(5, 'Loft', 'Occupée', 2200),
(5, 'Loft', 'Disponible', 2300),
(5, 'Villa', 'Disponible', 3700),
(5, 'Villa', 'Disponible', 3800),
(5, 'Penthouse', 'Occupée', 5500),
(5, 'Penthouse', 'Disponible', 5700),
(5, 'Duplex', 'Disponible', 3200),
(5, 'Duplex', 'Disponible', 3300),
(5, 'Maison de ville', 'Disponible', 3600),
(5, 'Maison de ville', 'Disponible', 3700),
(5, 'Chambre individuelle', 'Disponible', 570),
(5, 'Chambre individuelle', 'Disponible', 590),

-- Complexe 6
(6, 'Studio', 'Disponible', 810),
(6, 'Studio', 'Disponible', 830),
(6, 'Appartement T1', 'Occupée', 1000),
(6, 'Appartement T1', 'Disponible', 1020),
(6, 'Appartement T2', 'Disponible', 1310),
(6, 'Appartement T2', 'Disponible', 1360),
(6, 'Appartement T3', 'Disponible', 1750),
(6, 'Appartement T3', 'Occupée', 1800),
(6, 'Loft', 'Disponible', 2250),
(6, 'Loft', 'Disponible', 2350),
(6, 'Villa', 'Disponible', 3750),
(6, 'Villa', 'Occupée', 3850),
(6, 'Penthouse', 'Disponible', 5600),
(6, 'Penthouse', 'Disponible', 5800),
(6, 'Duplex', 'Disponible', 3300),
(6, 'Duplex', 'Occupée', 3400),
(6, 'Maison de ville', 'Disponible', 3700),
(6, 'Maison de ville', 'Disponible', 3800),
(6, 'Chambre individuelle', 'Disponible', 590),
(6, 'Chambre individuelle', 'Disponible', 610),

-- Complexe 7
(7, 'Studio', 'Disponible', 820),
(7, 'Studio', 'Disponible', 840),
(7, 'Appartement T1', 'Disponible', 1010),
(7, 'Appartement T1', 'Disponible', 1030),
(7, 'Appartement T2', 'Occupée', 1330),
(7, 'Appartement T2', 'Disponible', 1380),
(7, 'Appartement T3', 'Disponible', 1800),
(7, 'Appartement T3', 'Disponible', 1850),
(7, 'Loft', 'Occupée', 2300),
(7, 'Loft', 'Disponible', 2400),
(7, 'Villa', 'Disponible', 3800),
(7, 'Villa', 'Disponible', 3900),
(7, 'Penthouse', 'Occupée', 5700),
(7, 'Penthouse', 'Disponible', 5900),
(7, 'Duplex', 'Disponible', 3400),
(7, 'Duplex', 'Disponible', 3500),
(7, 'Maison de ville', 'Disponible', 3800),
(7, 'Maison de ville', 'Disponible', 3900),
(7, 'Chambre individuelle', 'Disponible', 610),
(7, 'Chambre individuelle', 'Disponible', 630),

-- Complexe 8
(8, 'Studio', 'Disponible', 830),
(8, 'Studio', 'Disponible', 850),
(8, 'Appartement T1', 'Occupée', 1020),
(8, 'Appartement T1', 'Disponible', 1040),
(8, 'Appartement T2', 'Disponible', 1350),
(8, 'Appartement T2', 'Disponible', 1400),
(8, 'Appartement T3', 'Disponible', 1850),
(8, 'Appartement T3', 'Occupée', 1900),
(8, 'Loft', 'Disponible', 2350),
(8, 'Loft', 'Disponible', 2450),
(8, 'Villa', 'Disponible', 3850),
(8, 'Villa', 'Occupée', 3950),
(8, 'Penthouse', 'Disponible', 5800),
(8, 'Penthouse', 'Disponible', 6000),
(8, 'Duplex', 'Disponible', 3500),
(8, 'Duplex', 'Occupée', 3600),
(8, 'Maison de ville', 'Disponible', 3900),
(8, 'Maison de ville', 'Disponible', 4000),
(8, 'Chambre individuelle', 'Disponible', 630),
(8, 'Chambre individuelle', 'Disponible', 650);





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
('Dufresne', 'Nathalie', '0901234567', 'nathalie.dufresne@example.com'),
('Moreau', 'Thomas', '0912345678', 'thomas.moreau@example.com'),
('Bernard', 'Camille', '0923456789', 'camille.bernard@example.com'),
('Leroy', 'Noah', '0934567890', 'noah.leroy@example.com'),
('Guerin', 'Lucas', '0945678901', 'lucas.guerin@example.com'),
('Blanc', 'Hugo', '0956789012', 'hugo.blanc@example.com'),
('Meyer', 'Chloé', '0967890123', 'chloe.meyer@example.com'),
('Carpentier', 'Léa', '0978901234', 'lea.carpentier@example.com'),
('Garcia', 'Mathieu', '0989012345', 'mathieu.garcia@example.com'),
('Robin', 'Elodie', '0990123456', 'elodie.robin@example.com'),
('Henry', 'Victor', '0991234567', 'victor.henry@example.com'),
('Barbier', 'Sarah', '0992345678', 'sarah.barbier@example.com'),
('Lambert', 'Emma', '0993456789', 'emma.lambert@example.com');


-- Insertion des réservations
INSERT INTO RESERVATION (dateEntree, dateSortie, idResident, idLogement) VALUES
('2025-02-01', '2025-02-28', 1, 153),
('2025-02-01', '2025-02-28', 2, 151),
('2025-02-01', '2025-02-28', 3, 155),
('2025-02-01', '2025-02-28', 4, 157),
('2025-02-01', '2025-02-28', 5, 159),
('2025-02-01', '2025-02-28', 6, 137),
('2025-02-01', '2025-02-28', 7, 133),
('2025-02-01', '2025-02-28', 8, 131),
-- Jean Dupont et Marie Martin partagent le logement 2
('2025-02-01', '2025-02-28', 1, 2),
('2025-02-01', '2025-02-28', 2, 2),

-- Paul Lemoine et Sophie Robert partagent le logement 3
('2025-02-05', '2025-03-05', 3, 3),
('2025-02-10', '2025-03-10', 4, 3),

-- Jean Dupont réserve et prolonge son séjour
('2025-01-01', '2025-01-15', 1, 1),
('2025-01-15', '2025-01-30', 1, 1),

-- Marie Martin réserve **mais elle commence avant que Jean Dupont parte**
('2025-01-28', '2025-02-10', 2, 1), --  CONFLIT : elle arrive avant le départ de Jean Dupont

('2025-02-01', '2025-02-28', 1, 1),
('2025-02-01', '2025-02-28', 2, 1),
('2025-02-01', '2025-02-28', 3, 2),
('2025-02-01', '2025-02-28', 4, 3),
('2025-02-01', '2025-02-28', 5, 4);




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


INSERT INTO EQUIPEMENT (nom, etat, tarifEquipement, idLogement) VALUES
('Climatisation', 'Bon', 200, 1),
('Chauffage', 'Mauvais', 150, 1),
('Réfrigérateur', 'Bon', 300, 2),
('Four', 'Mauvais', 180, 2),
('WiFi', 'Bon', 50, 3),
('Lave-linge', 'Mauvais', 250, 4),
('Climatisation', 'Bon', 200, 1),
('Chauffage', 'Mauvais', 150, 1),
('Réfrigérateur', 'Bon', 300, 2),
('Four', 'Mauvais', 180, 2),
('WiFi', 'Bon', 50, 3),
('Lave-linge', 'Mauvais', 250, 3);
