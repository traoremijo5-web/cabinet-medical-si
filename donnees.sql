USE cabinet_medical_db;

INSERT INTO utilisateurs (login, mot_de_passe_hash, role_utilisateur) VALUES
('sec_accueil', '$2y$10$exemplehashsecurise01', 'SECRETAIRE'),
('dr_traore', '$2y$10$exemplehashsecurise02', 'MEDECIN'),
('dr_diallo', '$2y$10$exemplehashsecurise03', 'MEDECIN'),
('admin_si', '$2y$10$exemplehashsecurise04', 'ADMIN');

INSERT INTO medecins (nom_medecin, prenom_medecin, specialite, id_utilisateur) VALUES
('Traoré', 'Moussa', 'Médecine générale', 2),
('Diallo', 'Aminata', 'Pédiatrie', 3);

INSERT INTO patients (nom_patient, prenom_patient, date_naissance, telephone_patient, antecedents) VALUES
('Coulibaly', 'Fatoumata', '1992-04-12', '76010001', 'Aucun antécédent notable'),
('Keita', 'Sekou', '1985-11-23', '76010002', 'Hypertension légère'),
('Sissoko', 'Mariam', '2001-02-08', '76010003', 'Allergie pénicilline'),
('Koné', 'Boubacar', '1978-07-19', '76010004', 'Diabète type 2'),
('Sidibé', 'Awa', '2018-09-30', '76010005', 'Suivi pédiatrique normal'),
('Dembélé', 'Ibrahim', '1995-01-15', '76010006', 'Asthme léger'),
('Camara', 'Kadiatou', '1988-06-27', '76010007', 'Migraines récurrentes'),
('Cissé', 'Oumar', '1965-12-03', '76010008', 'Suivi cardiologique'),
('Sangare', 'Rokia', '1999-03-11', '76010009', 'Aucun'),
('Ballo', 'Modibo', '2015-05-21', '76010010', 'Vaccination à jour');

INSERT INTO rendez_vous (date_heure_rdv, motif, statut_rdv, id_patient, id_medecin) VALUES
('2026-11-23 08:30:00', 'Consultation générale', 'PLANIFIE', 1, 1),
('2026-11-23 09:00:00', 'Contrôle tension', 'PLANIFIE', 2, 1),
('2026-11-23 09:30:00', 'Bilan allergie', 'HONORE', 3, 1),
('2026-11-23 10:00:00', 'Suivi glycémie', 'PLANIFIE', 4, 1),
('2026-11-23 08:30:00', 'Consultation pédiatrique', 'PLANIFIE', 5, 2),
('2026-11-23 09:15:00', 'Renouvellement traitement', 'ANNULE', 6, 1),
('2026-11-23 10:30:00', 'Céphalées', 'PLANIFIE', 7, 1),
('2026-11-23 11:00:00', 'Contrôle annuel', 'PLANIFIE', 8, 1),
('2026-11-23 09:45:00', 'Fièvre enfant', 'HONORE', 9, 2),
('2026-11-23 10:15:00', 'Visite médicale', 'PLANIFIE', 10, 2);
