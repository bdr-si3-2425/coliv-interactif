-- -----------------------------------------------
-- Jeu de données pour tester mes requêtes
-- Certains données ont étaient obtenu via chatGPT
-- -----------------------------------------------

-- Insérer les complexes
INSERT INTO COMPLEXE (Ville, CodePostal, NomDeRue, NumeroDeRue)
VALUES 
('Paris', '75001', 'Rue de Rivoli', 1),
('Lyon', '69001', 'Avenue des Brotteaux', 2);

-- Insérer les logements associés aux complexes
INSERT INTO LOGEMENT (idComplexe, type, etat)
VALUES
(1, 'Studio', 'Disponible'),
(1, 'T2', 'Occupée'),
(2, 'Studio', 'Disponible'),
(2, 'T3', 'Disponible');

-- Insérer les équipements pour les logements
INSERT INTO EQUIPEMENT (nom, etat, tarifEquipement, idLogement)
VALUES 
('Télévision', 'Bon', 15.00, 1),
('Frigo', 'Bon', 20.00, 1),
('Machine à laver', 'Mauvais', 10.00, 2),
('Four', 'Bon', 25.00, 3);

-- Insérer les résidents
INSERT INTO RESIDENT (Nom, Prenom, NumeroDeTelephone, Email)
VALUES
('Dupont', 'Pierre', '0601020304', 'pierre.dupont@email.com'),
('Martin', 'Sophie', '0605060708', 'sophie.martin@email.com'),
('Lemoine', 'Marc', '0612345678', 'marc.lemoine@email.com');

-- Insérer des réservations
INSERT INTO RESERVATION (dateEntree, dateSortie, idResident, idLogement)
VALUES
('2025-02-05', '2025-02-10', 1, 1),
('2025-02-06', '2025-02-12', 2, 2),
('2025-02-07', '2025-02-15', 3, 3);

-- Insérer des maintenances pour les équipements
INSERT INTO MAINTENANCE (type, urgence, tarifM)
VALUES
('Réparation Frigo', FALSE, 30.00),
('Entretien Machine à laver', TRUE, 40.00),
('Réparation Télévision', FALSE, 20.00);

-- Insérer les associations de maintenance pour les équipements
INSERT INTO EST_MAINTENU (idEquipement, idMaintenance, date)
VALUES
(1, 1, '2025-02-05'),
(2, 2, '2025-02-06'),
(3, 1, '2025-02-07');

-- Insérer des événements
INSERT INTO EVENEMENT (nom, dateEvenement, invite, lieu)
VALUES
('Réunion de Quartier', '2025-02-10', 'Tous les résidents', 'Salle de réunion 1'),
('Soirée Cinéma', '2025-02-15', 'Tous les résidents', 'Salle de cinéma');

-- Insérer des participations aux événements
INSERT INTO PARTICIPE (idResident, idEvenement)
VALUES
(1, 1), -- Pierre participe à la réunion
(2, 1), -- Sophie participe à la réunion
(3, 2); -- Marc participe à la soirée cinéma

-- -----------------------------
-- Tests pour chaque question
-- -----------------------------

-- Question 2 : Tester la vérification de la disponibilité d'un logement avant une réservation
-- Essaie d'insérer une réservation pour un logement déjà occupé (idLogement = 2, déjà occupé)
INSERT INTO RESERVATION (dateEntree, dateSortie, idResident, idLogement)
VALUES ('2025-02-11', '2025-02-14', 1, 2);  
-- Cela échouera normalement avec le trigger en place
----------------------------------------------------------------------------------
-- ERROR:  Le logement est déjà réservé pendant cette période
-- CONTEXT:  fonction PL/pgSQL verifier_disponibilite_logement(), ligne 12 à RAISE 

-- ERREUR:  Le logement est déjà réservé pendant cette période
----------------------------------------------------------------------------------


-- Question 4 : Tester les maintenances les plus fréquentes
WITH MaintenanceCounts AS (
  SELECT l.idLogement, m.type, COUNT(*) AS nombreMaintenance
  FROM LOGEMENT l 
  JOIN EQUIPEMENT e ON l.idLogement = e.idLogement
  JOIN EST_MAINTENU EstM ON e.idEquipement = EstM.idEquipement
  JOIN MAINTENANCE m ON m.idMaintenance = EstM.idMaintenance
  GROUP BY l.idLogement, m.type
)
SELECT mc.idLogement, mc.type, mc.nombreMaintenance
FROM MaintenanceCounts mc
WHERE mc.nombreMaintenance = (SELECT MAX(nombreMaintenance) FROM MaintenanceCounts);

-- Résultats attendu :
----------------------------------------------------------------
--idlogement         "type"                "nombremaintenance"
----------------------------------------------------------------
-- 1          "Entretien Machine à laver"         "1"
-- 1            "Réparation Frigo"                "1"
-- 2            "Réparation Frigo"                "1"
----------------------------------------------------------------

-- Question 6 : Tester la participation aux événements
SELECT e.nom AS evenement, COUNT(p.idResident) AS nombre_participants
FROM EVENEMENT e
LEFT JOIN PARTICIPE p ON e.idEvenement = p.idEvenement
GROUP BY e.idEvenement
ORDER BY nombre_participants DESC;

-- Résultats attendu :
--------------------------------------------------
--      evenement         "nombre_participants"
--------------------------------------------------
-- Réunion de Quartier            "2"
--   Soirée Cinéma                "1"
--------------------------------------------------

-- Tester les résidents qui ne participent à aucun événement
SELECT r.Nom, r.Prenom, r.Email
FROM RESIDENT r
LEFT JOIN PARTICIPE p ON r.idResident = p.idResident
WHERE p.idResident IS NULL;
-- Normalement chacun à participer à au moins 1 évènement donc le résultat devra être vide au cas où vous lancerez ce test

-- Notifier un nouvel événement : Ajouter un nouvel événement pour tester la notification
INSERT INTO EVENEMENT (nom, dateEvenement, invite, lieu)
VALUES ('Atelier Cuisine', '2025-02-20', 'Tous les résidents', 'Salle de loisirs');
-- Sortie : 
---------------------------------------------------------------------
-- NOTICE:  Nouvel événement : Atelier Cuisine prévu le 2025-02-20 !
-- INSERT 0 1

-- Query returned successfully in 112 msec
---------------------------------------------------------------------
