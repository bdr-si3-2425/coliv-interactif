-- Suppression des tables si elles existent déjà (dans l'ordre inverse des dépendances)
DROP TABLE IF EXISTS EST_MAINTENU CASCADE;
DROP TABLE IF EXISTS PARTICIPE CASCADE;
DROP TABLE IF EXISTS RESERVATION CASCADE;
DROP TABLE IF EXISTS EQUIPEMENT CASCADE;
DROP TABLE IF EXISTS LOGEMENT CASCADE;
DROP TABLE IF EXISTS MAINTENANCE CASCADE;
DROP TABLE IF EXISTS EVENEMENT CASCADE;
DROP TABLE IF EXISTS RESIDENT CASCADE;
DROP TABLE IF EXISTS COMPLEXE CASCADE;

-- Création de la table COMPLEXE
CREATE TABLE COMPLEXE (
    idComplexe SERIAL PRIMARY KEY,
    Ville VARCHAR(100) NOT NULL,
    CodePostale VARCHAR(10) NOT NULL,
    NomDeRue VARCHAR(100),
    NumeroDeRue INT
);

-- Création de la table LOGEMENT
CREATE TABLE LOGEMENT (
    idLogement SERIAL PRIMARY KEY,
    idComplexe INT NOT NULL,
    type VARCHAR(50),
    CONSTRAINT fk_complexe FOREIGN KEY (idComplexe) REFERENCES COMPLEXE(idComplexe) ON DELETE CASCADE
);

-- Création de la table EQUIPEMENT
CREATE TABLE EQUIPEMENT (
    idEquipement SERIAL PRIMARY KEY,
    nom VARCHAR(100),
    etat VARCHAR(50),
    tarifEquipement NUMERIC(10, 2),
    idLogement INT NOT NULL,
    CONSTRAINT fk_logement FOREIGN KEY (idLogement) REFERENCES LOGEMENT(idLogement) ON DELETE CASCADE
);

-- Création de la table RESIDENT
CREATE TABLE RESIDENT (
    -- Mettez ici vos modifications pour cette table
);

-- Création de la table RESERVATION
CREATE TABLE RESERVATION (
    idReservation SERIAL PRIMARY KEY,
    dateEntree DATE NOT NULL,
    dateSortie DATE NOT NULL,
    idResident INT NOT NULL,
    idLogement INT NOT NULL,
    CONSTRAINT fk_resident FOREIGN KEY (idResident) REFERENCES RESIDENT(idResident) ON DELETE CASCADE,
    CONSTRAINT fk_logement_reservation FOREIGN KEY (idLogement) REFERENCES LOGEMENT(idLogement) ON DELETE CASCADE
);

-- Création de la table MAINTENANCE
CREATE TABLE MAINTENANCE (
    -- Mettez ici vos modifications pour cette table
);

-- Création de la table EVENEMENT
CREATE TABLE EVENEMENT (
    -- Mettez ici vos modifications pour cette table
);

-- Création de la table PARTICIPE (relation entre RESIDENT et EVENEMENT)
CREATE TABLE PARTICIPE (
    -- Mettez ici vos modifications pour cette table
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
