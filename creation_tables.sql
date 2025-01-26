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
    idResident SERIAL PRIMARY KEY,
    Nom VARCHAR(100),
    Prenom VARCHAR(100),
    NumeroTelephone VARCHAR(15),
    Email VARCHAR(255)
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
    idMaintenance SERIAL PRIMARY KEY,
    type VARCHAR(100),
    urgence VARCHAR(50),
    tarifM DECIMAL(10, 2)
    );


-- Création de la table EVENEMENT

   CREATE TABLE EVENEMENT (
    idEvenement SERIAL PRIMARY KEY,
    nom VARCHAR(255),
    date DATE,
    invité VARCHAR(255),
    lieu VARCHAR(255)
);


-- Création de la table PARTICIPE (relation entre RESIDENT et EVENEMENT)
CREATE TABLE PARTICIPE (
    idResident INT,
    idEvenement INT,
    PRIMARY KEY (idResident, idEvenement),
    FOREIGN KEY (idResident) REFERENCES RESIDENT(idResident),
    FOREIGN KEY (idEvenement) REFERENCES EVENEMENT(idEvenement)
);

-- Création de la table EST_MAINTENU (relation entre EQUIPEMENT et MAINTENANCE)
CREATE TABLE EST_MAINTENU (
    idEquipement INT,
    idMaintenance INT,
    date DATE,
    PRIMARY KEY (idEquipement, idMaintenance),
    FOREIGN KEY (idMaintenance) REFERENCES MAINTENANCE(idMaintenance)
    -- Une référence pour idEquipement peut être ajoutée si une table EQUIPEMENT existe
);
