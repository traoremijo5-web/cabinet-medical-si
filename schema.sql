CREATE DATABASE IF NOT EXISTS cabinet_medical_db
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;
USE cabinet_medical_db;

CREATE TABLE utilisateurs (
    id_utilisateur INT AUTO_INCREMENT PRIMARY KEY,
    login VARCHAR(60) NOT NULL UNIQUE,
    mot_de_passe_hash VARCHAR(255) NOT NULL,
    role_utilisateur VARCHAR(20) NOT NULL,
    CONSTRAINT chk_role CHECK (role_utilisateur IN ('SECRETAIRE', 'MEDECIN', 'ADMIN'))
) ENGINE=InnoDB;

CREATE TABLE medecins (
    id_medecin INT AUTO_INCREMENT PRIMARY KEY,
    nom_medecin VARCHAR(80) NOT NULL,
    prenom_medecin VARCHAR(80) NOT NULL,
    specialite VARCHAR(100) NOT NULL,
    id_utilisateur INT UNIQUE,
    CONSTRAINT fk_medecin_utilisateur
        FOREIGN KEY (id_utilisateur) REFERENCES utilisateurs(id_utilisateur)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE patients (
    id_patient INT AUTO_INCREMENT PRIMARY KEY,
    nom_patient VARCHAR(80) NOT NULL,
    prenom_patient VARCHAR(80) NOT NULL,
    date_naissance DATE NOT NULL,
    telephone_patient VARCHAR(25) NOT NULL,
    antecedents TEXT
) ENGINE=InnoDB;

CREATE TABLE rendez_vous (
    id_rdv INT AUTO_INCREMENT PRIMARY KEY,
    date_heure_rdv DATETIME NOT NULL,
    motif VARCHAR(200),
    statut_rdv VARCHAR(20) NOT NULL DEFAULT 'PLANIFIE',
    id_patient INT NOT NULL,
    id_medecin INT NOT NULL,
    CONSTRAINT chk_statut_rdv CHECK (statut_rdv IN ('PLANIFIE', 'HONORE', 'ANNULE')),
    CONSTRAINT uq_medecin_creneau UNIQUE (id_medecin, date_heure_rdv),
    CONSTRAINT fk_rdv_patient
        FOREIGN KEY (id_patient) REFERENCES patients(id_patient)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_rdv_medecin
        FOREIGN KEY (id_medecin) REFERENCES medecins(id_medecin)
        ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE consultations (
    id_consultation INT AUTO_INCREMENT PRIMARY KEY,
    date_consultation DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    observations TEXT,
    diagnostic TEXT NOT NULL,
    id_patient INT NOT NULL,
    id_medecin INT NOT NULL,
    id_rdv INT UNIQUE,
    CONSTRAINT fk_consult_patient
        FOREIGN KEY (id_patient) REFERENCES patients(id_patient)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_consult_medecin
        FOREIGN KEY (id_medecin) REFERENCES medecins(id_medecin)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_consult_rdv
        FOREIGN KEY (id_rdv) REFERENCES rendez_vous(id_rdv)
        ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB;

CREATE TABLE ordonnances (
    id_ordonnance INT AUTO_INCREMENT PRIMARY KEY,
    date_emission DATE NOT NULL,
    contenu_prescription TEXT NOT NULL,
    id_consultation INT NOT NULL,
    CONSTRAINT fk_ordo_consultation
        FOREIGN KEY (id_consultation) REFERENCES consultations(id_consultation)
        ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB;
