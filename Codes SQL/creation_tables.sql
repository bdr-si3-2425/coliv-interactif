-- Suppression des tables si elles existent déjà (ordre inverse des dépendances)
DROP TABLE IF EXISTS EST_MAINTENU CASCADE;
DROP TABLE IF EXISTS PARTICIPE CASCADE;
DROP TABLE IF EXISTS RESERVATION CASCADE;
DROP TABLE IF EXISTS EQUIPEMENT CASCADE;
DROP TABLE IF EXISTS MAINTENANCE CASCADE;
DROP TABLE IF EXISTS EVENEMENT CASCADE;
DROP TABLE IF EXISTS RESIDENT CASCADE;
DROP TABLE IF EXISTS LOGEMENT CASCADE;
DROP TABLE IF EXISTS COMPLEXE CASCADE;

-- Création de la table COMPLEXE
CREATE TABLE COMPLEXE (
    idComplexe SERIAL PRIMARY KEY,
    Ville VARCHAR(100) NOT NULL,
    CodePostal VARCHAR(10) NOT NULL,
    NomDeRue VARCHAR(100),
    NumeroDeRue INT
);

-- Création de la table LOGEMENT
CREATE TABLE LOGEMENT (
    idLogement SERIAL PRIMARY KEY,
    idComplexe INT NOT NULL,
    type VARCHAR(50) NOT NULL,
    etat VARCHAR(10) DEFAULT 'Disponible' CHECK (etat IN ('Disponible', 'Occupée')),
    CONSTRAINT fk_complexe FOREIGN KEY (idComplexe) REFERENCES COMPLEXE(idComplexe) ON DELETE CASCADE
);

-- Création de la table EQUIPEMENT
CREATE TABLE EQUIPEMENT (
    idEquipement SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    etat VARCHAR(10) DEFAULT 'Bon' CHECK (etat IN ('Bon', 'Mauvais')),
    tarifEquipement NUMERIC(10, 2) CHECK (tarifEquipement >= 0),
    idLogement INT NOT NULL,
    CONSTRAINT fk_logement FOREIGN KEY (idLogement) REFERENCES LOGEMENT(idLogement) ON DELETE CASCADE
);

-- Création de la table RESIDENT
CREATE TABLE RESIDENT (
    idResident SERIAL PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Prenom VARCHAR(50) NOT NULL,
    NumeroDeTelephone VARCHAR(15) UNIQUE,
    Email VARCHAR(100) UNIQUE NOT NULL
);

-- Création de la table RESERVATION
CREATE TABLE RESERVATION (
    idReservation SERIAL PRIMARY KEY,
    dateEntree DATE NOT NULL,
    dateSortie DATE NOT NULL,
    idResident INT NOT NULL,
    idLogement INT NOT NULL,
    CONSTRAINT fk_resident FOREIGN KEY (idResident) REFERENCES RESIDENT(idResident) ON DELETE CASCADE,
    CONSTRAINT fk_logement_reservation FOREIGN KEY (idLogement) REFERENCES LOGEMENT(idLogement) ON DELETE CASCADE,
    CONSTRAINT check_dates CHECK (dateSortie > dateEntree) -- Empêcher une date de sortie avant l’entrée
);

-- Création de la table MAINTENANCE
CREATE TABLE MAINTENANCE (
    idMaintenance SERIAL PRIMARY KEY,
    type VARCHAR(50) NOT NULL,
    urgence BOOLEAN DEFAULT FALSE,
    tarifM NUMERIC(10, 2) CHECK (tarifM >= 0)
);

-- Création de la table EVENEMENT
CREATE TABLE EVENEMENT (
    idEvenement SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    date DATE NOT NULL,
    invite VARCHAR(100),
    lieu VARCHAR(100)
);

-- Création de la table PARTICIPE (relation entre RESIDENT et EVENEMENT)
CREATE TABLE PARTICIPE (
    idResident INT NOT NULL,
    idEvenement INT NOT NULL,
    PRIMARY KEY (idResident, idEvenement),
    CONSTRAINT fk_resident_participe FOREIGN KEY (idResident) REFERENCES RESIDENT(idResident) ON DELETE CASCADE,
    CONSTRAINT fk_evenement_participe FOREIGN KEY (idEvenement) REFERENCES EVENEMENT(idEvenement) ON DELETE CASCADE
);

-- Création de la table EST_MAINTENU (relation entre EQUIPEMENT et MAINTENANCE)
CREATE TABLE EST_MAINTENU (
    idEquipement INT NOT NULL,
    idMaintenance INT NOT NULL,
    date DATE NOT NULL,
    PRIMARY KEY (idEquipement, idMaintenance),
    CONSTRAINT fk_equipement FOREIGN KEY (idEquipement) REFERENCES EQUIPEMENT(idEquipement) ON DELETE CASCADE,
    CONSTRAINT fk_maintenance FOREIGN KEY (idMaintenance) REFERENCES MAINTENANCE(idMaintenance) ON DELETE CASCADE
);

-- 1. Vérifier qu'un résident n'est pas déjà enregistré
CREATE OR REPLACE FUNCTION verifier_resident_unique()
RETURNS TRIGGER AS $$
BEGIN
    IF EXISTS (
        SELECT 1 FROM RESIDENT
        WHERE Nom = NEW.Nom
          AND Prenom = NEW.Prenom
          AND Email = NEW.Email
    ) THEN
        RAISE EXCEPTION 'Le résident % est déjà enregistré.', NEW.Email;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_resident_unique
BEFORE INSERT ON RESIDENT
FOR EACH ROW
EXECUTE FUNCTION verifier_resident_unique();

-- 2. Empêcher une réservation sur un logement non disponible
CREATE OR REPLACE FUNCTION verifier_logement_disponible()
RETURNS TRIGGER AS $$
BEGIN
    -- Vérifier si le logement est bien "Disponible"
    IF (SELECT etat FROM LOGEMENT WHERE idLogement = NEW.idLogement) <> 'Disponible' THEN
        RAISE EXCEPTION 'Le logement % n'"est pas disponible pour une réservation.', NEW.idLogement;
    END IF;

    -- Changer l'état du logement à "Occupée" après réservation
    UPDATE LOGEMENT SET etat = 'Occupée' WHERE idLogement = NEW.idLogement;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trigger_verifier_logement_disponible
BEFORE INSERT ON RESERVATION
FOR EACH ROW
EXECUTE FUNCTION verifier_logement_disponible();