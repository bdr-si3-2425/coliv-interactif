--1. Quels logements sont disponibles pour une période donnée, selon des critères spécifiques (type, emplacement, prix) ?
SELECT l.idLogement, l.type, l.idComplexe, c.Ville, c.CodePostale, e.tarifEquipement
FROM LOGEMENT l
JOIN COMPLEXE c ON l.idComplexe = c.idComplexe
JOIN EQUIPEMENT e ON e.idLogement = l.idLogement
WHERE l.idLogement NOT IN (
    SELECT idLogement
    FROM RESERVATION
    WHERE (dateEntree <= '2025-05-01' AND dateSortie >= '2025-04-01')
)
AND l.type = 'Studio'  -- Exemple de filtre sur le type
AND c.Ville = 'Paris'  -- Exemple de filtre sur l'emplacement
AND e.tarifEquipement <= 100  -- Exemple de filtre sur le prix
ORDER BY c.Ville, l.idLogement;

--2. Comment gérer les réservations et attribuer les logements aux nouveaux résidents en optimisant l’occupation ?


--3. Quels résidents partagent actuellement un logement et quelles sont leurs interactions (participation à des événements, conflits signalés) ?
SELECT r.Nom, r.Prenom, l.type, e.nom AS evenement, p.date
FROM RESIDENT r
JOIN RESERVATION res ON r.idResident = res.idResident
JOIN LOGEMENT l ON res.idLogement = l.idLogement
LEFT JOIN PARTICIPE p ON r.idResident = p.idResident
LEFT JOIN EVENEMENT e ON p.idEvenement = e.idEvenement
WHERE res.dateSortie > CURRENT_DATE
ORDER BY res.dateEntree, l.idLogement;


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

