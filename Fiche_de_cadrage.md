# Fiche de Cadrage du Projet : Gestion de Cabinet Médical

## 1. Contexte et problème à résoudre
Le cabinet médical fait face à une augmentation constante de sa patientèle. Son mode de fonctionnement actuel, entièrement basé sur le papier (agendas manuscrits et dossiers physiques), montre ses limites : temps d'attente excessifs à l'accueil, risques d'erreurs dans la planification des rendez-vous et difficultés d'accès rapide à l'historique médical des patients. 
**Problème à résoudre :** Comment informatiser et centraliser la gestion des patients et des rendez-vous afin de fluidifier l'accueil et sécuriser les données médicales ?

## 2. Périmètre du projet
* **Inclus dans le périmètre :**
  * Gestion des fiches patients (création, modification, recherche rapide).
  * Gestion centralisée de l'agenda et des rendez-vous par médecin.
  * Saisie et consultation de l'historique des consultations et ordonnances.
  * Gestion des droits d'accès (profil Secrétaire, profil Médecin, profil Administrateur).
* **Exclus du périmètre :**
  * La gestion de la comptabilité générale et des fiches de paie du personnel.
  * La gestion des stocks de médicaments ou de matériel médical.
  * Le paiement en ligne par carte bancaire (les règlements restent gérés sur place).

## 3. Acteurs et parties prenantes
| Partie Prenante | Rôle dans le projet | Niveau d'Influence | Niveau d'Intérêt |
| :--- | :--- | :--- | :--- |
| **Directeur du cabinet (MOA)** | Commanditaire et financeur du projet ; valide les choix stratégiques. | **Forte** | **Fort** |
| **Secrétaire médicale** | Utilisatrice principale au quotidien (accueil, création de dossiers, planning). | **Moyenne** | **Fort** |
| **Médecins** | Consultent les dossiers patients et saisissent les comptes-rendus médicaux. | **Forte** | **Fort** |
| **Patients** | Bénéficiaires indirects (réduction de l'attente, prise de rendez-vous facilitée). | **Faible** | **Moyen** |
| **Équipe de développement (MOE)** | Conçoit, développe et déploie la nouvelle application web de gestion. | **Forte** | **Fort** |
| **Responsable administratif / Comptable** | Supervise la facturation des consultations et les statistiques de fréquentation. | **Moyenne** | **Moyen** |

## 4. Objectifs mesurables
* **Objectif 1 (Rapidité) :** Réduire de moitié (50 %) le temps d'enregistrement d'un patient à l'accueil (passer de 6 minutes à moins de 3 minutes).
* **Objectif 2 (Fiabilité) :** Éliminer à 100 % les doubles réservations de créneaux horaires grâce à un agenda numérique partagé en temps réel.
* **Objectif 3 (Accessibilité) :** Permettre aux médecins d'accéder au dossier médical complet d'un patient en moins de 5 secondes.

## 5. Risques et hypothèses
* **Risques identifiés :**
  * *Résistance au changement :* Difficulté d'adaptation du personnel habitué au papier (solution : prévoir une formation simple et une interface ergonomique).
  * *Panne matérielle ou électrique :* Indisponibilité temporaire du système (solution : prévoir des sauvegardes automatiques quotidiennes et un onduleur).
  * *Confidentialité des données :* Risque d'accès non autorisé aux dossiers médicaux (solution : authentification sécurisée et chiffrement des mots de passe).
* **Hypothèses de départ :**
  * Le cabinet dispose déjà d'au moins deux ordinateurs (un à l'accueil, un en salle de consultation) et d'une connexion réseau locale fiable.
  * Le personnel médical se rendra disponible lors des phases de validation du prototype.
