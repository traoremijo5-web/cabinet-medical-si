# Modélisation des Données — Séance 4 : Gestion de Cabinet Médical

## 1. Dictionnaire de données (20 données)

| Champ | Désignation | Type | Règle de gestion / Contrainte |
| :--- | :--- | :--- | :--- |
| `id_patient` | Identifiant unique patient | INT | Clé primaire, auto-incrémenté, obligatoire |
| `nom_patient` | Nom du patient | VARCHAR(80) | Obligatoire, non vide |
| `prenom_patient` | Prénom du patient | VARCHAR(80) | Obligatoire, non vide |
| `date_naissance` | Date de naissance | DATE | Obligatoire, antérieure à la date du jour |
| `sexe_patient` | Sexe du patient | VARCHAR(15) | Obligatoire (`M`, `F` ou valeur définie) |
| `telephone_patient` | Téléphone du patient | VARCHAR(25) | Obligatoire |
| `adresse_patient` | Adresse / quartier | VARCHAR(180) | Optionnel |
| `antecedents` | Antécédents médicaux | TEXT | Optionnel |
| `id_medecin` | Identifiant unique médecin | INT | Clé primaire, auto-incrémenté, obligatoire |
| `nom_medecin` | Nom du médecin | VARCHAR(80) | Obligatoire, non vide |
| `prenom_medecin` | Prénom du médecin | VARCHAR(80) | Obligatoire, non vide |
| `specialite` | Spécialité médicale | VARCHAR(100) | Obligatoire |
| `id_utilisateur` | Identifiant compte | INT | Clé primaire, auto-incrémenté, obligatoire |
| `login` | Identifiant de connexion | VARCHAR(60) | Obligatoire, unique |
| `mot_de_passe_hash` | Mot de passe haché | VARCHAR(255) | Obligatoire, jamais en clair |
| `role_utilisateur` | Rôle utilisateur | VARCHAR(20) | Obligatoire (`SECRETAIRE`, `MEDECIN`, `ADMIN`) |
| `id_rdv` | Identifiant rendez-vous | INT | Clé primaire, auto-incrémenté, obligatoire |
| `date_heure_rdv` | Date et heure du RDV | DATETIME | Obligatoire, unique par médecin |
| `statut_rdv` | Statut du RDV | VARCHAR(20) | Obligatoire (`PLANIFIE`, `HONORE`, `ANNULE`) |
| `diagnostic` | Diagnostic médical | TEXT | Obligatoire lors de la création d'une consultation |

## 2. MCD (Entités et cardinalités)
* **UTILISATEUR** `(0,1)` — correspond à — `(1,1)` **MEDECIN**
* **PATIENT** `(1,1)` — prend — `(0,n)` **RENDEZ_VOUS**
* **MEDECIN** `(1,1)` — assure — `(0,n)` **RENDEZ_VOUS**
* **RENDEZ_VOUS** `(0,1)` — donne lieu à — `(0,1)` **CONSULTATION**
* **PATIENT** `(1,1)` — fait l'objet de — `(0,n)` **CONSULTATION**
* **MEDECIN** `(1,1)` — rédige — `(0,n)` **CONSULTATION**
* **CONSULTATION** `(1,1)` — génère — `(0,1)` **ORDONNANCE**

## 3. Schéma relationnel (MLD)
* **UTILISATEUR** (<u>id_utilisateur</u>, login, mot_de_passe_hash, role_utilisateur)
* **MEDECIN** (<u>id_medecin</u>, nom_medecin, prenom_medecin, specialite, *#id_utilisateur*)
* **PATIENT** (<u>id_patient</u>, nom_patient, prenom_patient, date_naissance, telephone_patient, antecedents)
* **RENDEZ_VOUS** (<u>id_rdv</u>, date_heure_rdv, motif, statut_rdv, *#id_patient*, *#id_medecin*)
* **CONSULTATION** (<u>id_consultation</u>, date_consultation, observations, diagnostic, *#id_patient*, *#id_medecin*, *#id_rdv*)
* **ORDONNANCE** (<u>id_ordonnance</u>, date_emission, contenu_prescription, *#id_consultation*)

## 4. Normalisation (3FN)
* **1FN :** Attributs atomiques et clés primaires définies sur chaque table.
* **2FN :** Clés primaires simples sans dépendance partielle.
* **3FN :** Aucune dépendance transitive entre attributs non clés (la spécialité reste dans `MEDECIN`, les informations patient restent dans `PATIENT`).
