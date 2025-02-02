--1. Quels logements sont disponibles pour une période donnée, selon des critères spécifiques (type, emplacement, prix) ?
SELECT L.idLogement, L.type, L.etat, L.idComplexe, C.Ville
FROM LOGEMENT L
JOIN COMPLEXE C ON L.idComplexe = C.idComplexe  -- Jointure pour récupérer la ville
LEFT JOIN RESERVATION R ON L.idLogement = R.idLogement
  AND (R.dateEntree = '2025-02-01' AND R.dateSortie = '2025-03-01')  -- Période recherchée
WHERE R.idReservation IS NULL  -- Vérifie que le logement est disponible
  AND L.type = 'Studio'  
  AND C.Ville = 'Paris'  -- Filtre sur la ville
  AND L.prix < 1000  
ORDER BY L.idComplexe;

--2. Comment gérer les réservations et attribuer les logements aux nouveaux résidents en optimisant l’occupation ?
  
  --> Vérifier la disponibilité du logement avant une réservation afin d'empêcher une réservation sur un logement non disponible :
CREATE OR REPLACE FUNCTION verifier_disponibilite_logement()
RETURNS TRIGGER AS $$
BEGIN
    --> Vérifier si le logement est déjà réservé pendant la période
    IF EXISTS (
        SELECT 1
        FROM RESERVATION
        WHERE idLogement = NEW.idLogement
        AND (
            (NEW.dateEntree <= dateSortie AND NEW.dateSortie >= dateEntree)
        )
    ) THEN
        RAISE EXCEPTION 'Le logement est déjà réservé pendant cette période';
    END IF;

    --> Si le logement est disponible, on continue
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

  --> Trigger qui appelle la fonction avant chaque insertion dans RESERVATION
CREATE TRIGGER trigger_verifier_disponibilite
BEFORE INSERT ON RESERVATION
FOR EACH ROW
EXECUTE FUNCTION verifier_disponibilite_logement();

  --> Vérifier et mettre à jour l'état d'un logement après la fin d'une réservation
CREATE OR REPLACE FUNCTION verifier_etat_logement_fin_reservation() 
RETURNS TRIGGER AS $$  -- Correction de RETURNS TRIGGER
BEGIN
  --> Vérifier si le logement est "Occupée" et doit être libéré après 13:00 le jour de sortie
  IF EXISTS (
    SELECT 1 
    FROM LOGEMENT l 
    JOIN RESERVATION r ON l.idLogement = r.idLogement
    WHERE l.idLogement = NEW.idLogement
    AND l.etat = 'Occupée' AND r.dateSortie = CURRENT_DATE AND LOCALTIME >= TIME '13:00:00'
  ) THEN 
    RAISE EXCEPTION 'Le logement %s doit être libéré.', NEW.idLogement;
  END IF;

  --> Changer l'état du logement à "Disponible" après la fin de la réservation
  UPDATE LOGEMENT SET etat = 'Disponible' WHERE idLogement = NEW.idLogement;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

  --> Déclencheur pour mettre à jour l'état du logement après une réservation
CREATE TRIGGER trigger_verifier_etat_logement_fin_reservation
BEFORE INSERT OR UPDATE ON RESERVATION  -- Correction de la syntaxe "BEFORE INSERT, UPDATE"
FOR EACH ROW
EXECUTE FUNCTION verifier_etat_logement_fin_reservation();


  --> Afficher les logements disponibles et leurs caractéristiques
SELECT l.idLogement, l.type, l.prix, l.idComplexe
FROM LOGEMENT l 
WHERE l.etat = 'Disponible';




--3. Quels résidents partagent actuellement un logement et quelles sont leurs interactions (participation à des événements, conflits signalés) ?
  
  --3.1 Identifier les résidents qui partagent actuellement un même logement(PAS DE SORTIE)
SELECT R1.idResident AS Resident1, R2.idResident AS Resident2, L.idLogement
FROM RESERVATION R1
JOIN RESERVATION R2 ON R1.idLogement = R2.idLogement AND R1.idResident <> R2.idResident
JOIN LOGEMENT L ON R1.idLogement = L.idLogement
WHERE CURRENT_DATE BETWEEN R1.dateEntree AND R1.dateSortie
  AND CURRENT_DATE BETWEEN R2.dateEntree AND R2.dateSortie
ORDER BY L.idLogement;

  --3.2 Vérifier la participation des résidents à des événements
SELECT DISTINCT R.idResident, E.nom AS NomEvenement, E.date, L.idLogement
FROM PARTICIPE P
JOIN RESIDENT R ON P.idResident = R.idResident
JOIN EVENEMENT E ON P.idEvenement = E.idEvenement
JOIN RESERVATION Res ON R.idResident = Res.idResident
JOIN LOGEMENT L ON Res.idLogement = L.idLogement
WHERE CURRENT_DATE BETWEEN Res.dateEntree AND Res.dateSortie
ORDER BY L.idLogement, E.date;



--4. Quels logements nécessitent le plus d’interventions de maintenance et pourquoi ?
  --> Regrouper les maintenances par logement et type via une CTE(Common Table Expression)
WITH MaintenanceCounts AS (
  SELECT l.idLogement, m.type, COUNT(*) AS nombreMaintenance
  FROM LOGEMENT l 
  JOIN EQUIPEMENT e ON l.idLogement = e.idLogement
  JOIN EST_MAINTENU EstM ON e.idEquipement = EstM.idEquipement
  JOIN MAINTENANCE m ON m.idMaintenace = EstM.idMaintenace
  GROUP BY l.idLogement, m.type
)

  --> Sélectionner les logements ayant le nombre maximal de maintenances avec leur type
SELECT mc.idLogement, mc.type, mc.nombreMaintenance
FROM MaintenanceCounts mc
WHERE mc.nombreMaintenance = (SELECT MAX(nombreMaintenance) FROM MaintenanceCounts);



--5. Quels résidents ont prolongé leur séjour, et comment cela impacte les réservations futures ?
    --5.1 : Identifier les résidents qui ont prolongé leur séjour(PAS DE SORTIE)
SELECT r1.idResident, r1.dateEntree, r1.dateSortie, r2.dateEntree AS nouvelle_dateEntree, r2.dateSortie AS nouvelle_dateSortie
FROM RESERVATION r1
JOIN RESERVATION r2 ON r1.idResident = r2.idResident
WHERE r1.dateSortie < r2.dateEntree  -- Vérifier si la première réservation se termine avant le début de la nouvelle réservation
AND r2.dateEntree > r1.dateEntree  -- Assurer qu'il y a prolongation (pas de nouvelle réservation en dehors de la période initiale)
AND r1.dateSortie < CURRENT_DATE;  -- Les prolongations qui concernent des réservations déjà passées

     --5.2 : Analyser l'impact des prolongations sur les réservations futures(PAS DE SORTIE)
SELECT r1.idResident, l.idLogement, r1.dateEntree, r1.dateSortie, r2.dateEntree AS nouvelle_dateEntree, r2.dateSortie AS nouvelle_dateSortie
FROM RESERVATION r1
JOIN RESERVATION r2 ON r1.idResSELECT DISTINCT R1.idResident AS Resident1, R2.idResident AS Resident2, L.idLogement, E.nom AS NomEvenement, E.date
ident = r2.idResident
JOIN LOGEMENT l ON r1.idLogement = l.idLogement
WHERE r1.dateSortie < r2.dateEntree
AND r2.dateEntree > r1.dateEntree
AND r1.dateSortie < CURRENT_DATE
AND r2.dateEntree > CURRENT_DATE;  -- Vérification  l'impact des prolongations sur les réservations futures
   


--6. Comment organiser les événements communautaires pour maximiser la participation des résidents dans un logement donné ?
  -->Evenements populaires :
SELECT e.nom AS evenement, COUNT(p.idResident) AS nombre_participants
FROM EVENEMENT e
LEFT JOIN PARTICIPE p ON e.idEvenement = p.idEvenement
GROUP BY e.idEvenement
ORDER BY nombre_participants DESC;

  --> Les résidents qui ne participent pas aux événements :
SELECT r.Nom, r.Prenom, r.Email
FROM RESIDENT r
LEFT JOIN PARTICIPE p ON r.idResident = p.idResident  -- Tous les résidents, indépendamment de leur participation
WHERE p.idResident IS NULL; -- Ceux qui ne participent pas
  
  --> Informer sur les prochains événements :
CREATE OR REPLACE FUNCTION notifier_nouvel_evenement()
RETURNS TRIGGER AS $$
BEGIN
  -- Déclencher une nouvelle notice pour informer
    RAISE NOTICE 'Nouvel événement : % prévu le % !', NEW.nom, NEW.dateEvenement; 
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_notifier_evenement
AFTER INSERT ON EVENEMENT -- Après ajout d'un nouvel événement
FOR EACH ROW
EXECUTE FUNCTION notifier_nouvel_evenement();



--7. Quels types de logements sont les plus demandés et quelles améliorations peuvent augmenter leur attractivité ?
  --7. 1 : Identifier les types de logements les plus demandés
SELECT l.type, COUNT(r.idReservation) AS nombreReservations
FROM LOGEMENT l
JOIN RESERVATION r ON l.idLogement = r.idLogement
GROUP BY l.type
ORDER BY nombreReservations DESC;

  --7.2 : Analyser les améliorations possibles pour augmenter l'attractivité des logements(ATTENTION:PAS DE SORTIE)
SELECT l.type, e.idEquipement, COUNT(r.idReservation) AS nombreReservations
FROM LOGEMENT l
JOIN RESERVATION r ON l.idLogement = r.idLogement
JOIN EQUIPEMENT e  ON l.idLogement = e.idLogement
GROUP BY l.type, e.idEquipement
ORDER BY nombreReservations DESC;

  --7.3 : Suggestions d'améliorations pour augmenter l'attractivité
SELECT l.type, COUNT(r.idReservation) AS nombreReservations, 
       AVG(e.tarifEquipement) AS moyennePrix, 
       MAX(e.etat) AS meilleureQualite
FROM LOGEMENT l
JOIN RESERVATION r ON l.idLogement = r.idLogement
JOIN EQUIPEMENT e ON e.idEquipement = e.idEquipement
GROUP BY l.type
ORDER BY nombreReservations DESC;
