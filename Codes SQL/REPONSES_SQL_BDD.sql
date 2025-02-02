--1. Quels logements sont disponibles pour une période donnée, selon des critères spécifiques (type, emplacement, prix) ?
SELECT L.idLogement, L.type, L.etat, L.idComplexe, C.Ville
FROM LOGEMENT L
JOIN COMPLEXE C ON L.idComplexe = C.idComplexe  -- 🔹 Jointure pour récupérer la ville
LEFT JOIN RESERVATION R ON L.idLogement = R.idLogement
  AND (R.dateEntree = '2025-02-01' AND R.dateSortie = '2025-03-01')  -- Période recherchée
WHERE R.idReservation IS NULL  -- 🔹 Vérifie que le logement est disponible
  AND L.type = 'Studio'  
  AND C.Ville = 'Paris'  -- 🔹 Filtre sur la ville
  AND L.prix < 1000  
ORDER BY L.idComplexe;

--2. Comment gérer les réservations et attribuer les logements aux nouveaux résidents en optimisant l’occupation ?
CREATE OR REPLACE FUNCTION verifier_reservation_unique_par_resident()
RETURNS TRIGGER AS $$
BEGIN
    -- Vérifier si la réservation d'un résident est unique
    IF EXISTS (
        SELECT 1 
        FROM RESERVATION r JOIN LOGEMENT l
        ON r.idLogement = l.idLogement
        WHERE r.idResident = NEW.idResident
    ) THEN (
        RAISE EXCEPTION 'Ce résident %s a déjà réservé le logement %s.', NEW.idResident, r.idLogement;
    )
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_reservation_unique
BEFORE INSERT ON RESERVATION
FOR EACH ROW
EXECUTE FUNCTION verifier_reservation_unique_par_resident();


--3. Quels résidents partagent actuellement un logement et quelles sont leurs interactions (participation à des événements, conflits signalés) ?
  
  --3.1 Identifier les résidents qui partagent actuellement un même logement
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

-- si on veux croiser les résultats des deux requêtes, tu peux utiliser une requête combinée pour voir uniquement les résidents colocataires qui participent à des événements ensemble :
SELECT DISTINCT R1.idResident AS Resident1, R2.idResident AS Resident2, L.idLogement, E.nom AS NomEvenement, E.date
FROM RESERVATION R1
JOIN RESERVATION R2 ON R1.idLogement = R2.idLogement AND R1.idResident <> R2.idResident
JOIN LOGEMENT L ON R1.idLogement = L.idLogement
JOIN PARTICIPE P1 ON R1.idResident = P1.idResident
JOIN PARTICIPE P2 ON R2.idResident = P2.idResident AND P1.idEvenement = P2.idEvenement
JOIN EVENEMENT E ON P1.idEvenement = E.idEvenement
WHERE CURRENT_DATE BETWEEN R1.dateEntree AND R1.dateSortie
  AND CURRENT_DATE BETWEEN R2.dateEntree AND R2.dateSortie
ORDER BY L.idLogement, E.date;



--4. Quels logements nécessitent le plus d’interventions de maintenance et pourquoi ?

--5. Quels résidents ont prolongé leur séjour, et comment cela impacte les réservations futures ?
SELECT r.Nom, r.Prenom, res.dateEntree, res.dateSortie
FROM RESIDENT r
JOIN RESERVATION res ON r.idResident = res.idResident
WHERE res.dateSortie > CURRENT_DATE
AND res.dateSortie > res.dateEntree + INTERVAL '6 months';  -- Exemple de prolongation
ORDER BY res.dateEntree;


--6. Comment organiser les événements communautaires pour maximiser la participation des résidents dans un logement donné ?

--7. Quels types de logements sont les plus demandés et quelles améliorations peuvent augmenter leur attractivité ?
SELECT l.type, COUNT(res.idReservation) AS nombre_reservations
FROM LOGEMENT l
LEFT JOIN RESERVATION res ON l.idLogement = res.idLogement
GROUP BY l.type
ORDER BY nombre_reservations DESC;

