# Cahier des Charges v1 : Gestion de Cabinet Médical

## 1. Contexte et objectifs (rappel du cadrage)
Le cabinet médical souhaite moderniser sa gestion actuellement basée sur le papier (agendas manuscrits et dossiers physiques) afin de réduire les temps d'attente et sécuriser les informations médicales[cite: 3].
* **Objectif 1 :** Réduire de 50 % le temps d'enregistrement d'un patient à l'accueil (passer de 6 à moins de 3 minutes)[cite: 2].
* **Objectif 2 :** Éliminer à 100 % les doubles réservations grâce à un agenda numérique partagé.
* **Objectif 3 :** Permettre aux médecins d'accéder au dossier complet d'un patient en moins de 5 secondes.

---

## 2. Préparation d'entretien client (8 questions clés)
1. Quels sont actuellement vos plus grands retards ou blocages dans la gestion quotidienne des patients ?
2. Comment gérez-vous les absences ou les annulations de dernière minute ?
3. Quelles informations devez-vous retrouver instantanément sur la fiche d'un patient lors de sa consultation ?
4. Quels sont les différents rôles et niveaux d'accès nécessaires pour le personnel (secrétaire, médecin, administrateur) ?
5. Avez-vous besoin d'un historique complet des anciennes ordonnances et diagnostics de chaque patient ?
6. Souhaitez-vous que l'application gère des rappels de rendez-vous (SMS ou e-mail) ?
7. Comment les médecins souhaitent-ils saisir leurs comptes-rendus de consultation (saisie libre ou modèles pré-remplis) ?
8. Quelles sont vos contraintes en matière de sécurité et de confidentialité des données médicales ?

---

## 3. Tableau des exigences (User Stories & Exigences non fonctionnelles)

| ID | Énoncé | Type | Priorité (MoSCoW) | Critère d'acceptation |
| :--- | :--- | :--- | :--- | :--- |
| **US-01** | En tant que secrétaire, je veux créer une nouvelle fiche patient afin de réduire le temps d'attente. | Fonctionnelle | **Must** | Fiche enregistrée en base de données en moins de 3 minutes avec nom, prénom, téléphone et âge obligatoires. |
| **US-02** | En tant que secrétaire, je veux rechercher un patient par nom ou téléphone afin de retrouver son dossier. | Fonctionnelle | **Must** | La liste des résultats correspondants s'affiche dès la saisie des 3 premiers caractères. |
| **US-03** | En tant que secrétaire, je veux planifier un rendez-vous dans un agenda partagé afin d'éviter les doublons. | Fonctionnelle | **Must** | Le système bloque toute tentative de réservation sur un créneau déjà occupé pour le même médecin. |
| **US-04** | En tant que secrétaire, je veux modifier ou annuler un rendez-vous afin de libérer le créneau. | Fonctionnelle | **Must** | Le créneau annulé redevient immédiatement disponible et visible sur l'agenda du médecin. |
| **US-05** | En tant que médecin, je veux consulter l'historique médical complet d'un patient avant l'auscultation. | Fonctionnelle | **Must** | L'ensemble des consultations passées et diagnostics s'affiche par ordre chronologique inversé. |
| **US-06** | En tant que médecin, je veux rédiger et enregistrer le compte-rendu d'une consultation en cours. | Fonctionnelle | **Must** | Le compte-rendu est sauvegardé avec la date du jour et lié de manière permanente au dossier du patient. |
| **US-07** | En tant que médecin, je veux générer et imprimer une ordonnance normalisée. | Fonctionnelle | **Should** | Génération d'un document PDF propre prêt à l'impression contenant l'en-tête du cabinet et les prescriptions. |
| **US-08** | En tant qu'administrateur, je veux gérer les comptes et droits d'accès du personnel. | Fonctionnelle | **Should** | Une secrétaire ne peut pas accéder aux diagnostics détaillés ; seul un administrateur crée un compte. |
| **US-09** | En tant qu'administrateur, je veux exporter des statistiques de fréquentation du cabinet. | Fonctionnelle | **Could** | Exportation d'un tableau récapitulatif mensuel du nombre de consultations par médecin au format CSV. |
| **US-10** | En tant que patient, je veux recevoir un rappel automatique de mon rendez-vous. | Fonctionnelle | **Won't** | *(Exclu de la v1 — prévu pour une version ultérieure avec passerelle SMS).* |
| **ENF-01** | Performance et temps de réponse du système. | Non fonctionnelle | **Must** | 95 % des recherches et chargements de dossiers s'exécutent en moins de 2 secondes. |
| **ENF-02** | Sécurisation des accès et confidentialité. | Non fonctionnelle | **Must** | Authentification obligatoire par identifiant/mot de passe chiffré (hashage sécurisé en base). |
| **ENF-03** | Sauvegarde et intégrité des données médicales. | Non fonctionnelle | **Must** | Sauvegarde automatique quotidienne de la base de données à minuit sans interruption de service. |
| **ENF-04** | Disponibilité de l'application. | Non fonctionnelle | **Should** | Système opérationnel 99,5 % du temps pendant les heures d'ouverture du cabinet (8h - 19h). |
| **ENF-05** | Ergonomie et prise en main rapide. | Non fonctionnelle | **Should** | Une nouvelle secrétaire réalise l'enregistrement d'un patient et la prise de RDV après 30 min de formation. |

---

## 4. Backlog produit ordonné (avec estimation relative)
*Échelle d'estimation : Points de complexité (Suite de Fibonacci : 1, 2, 3, 5, 8, 13).*

1. **[ENF-02] Authentification et gestion des sessions sécurisées** — *Estimation : 5 points* (Priorité : Must)
2. **[US-01] Création et enregistrement des fiches patients** — *Estimation : 3 points* (Priorité : Must)
3. **[US-02] Recherche rapide multicritère de patients** — *Estimation : 3 points* (Priorité : Must)
4. **[US-03] Planification de rendez-vous et contrôle anti-doublon** — *Estimation : 8 points* (Priorité : Must)
5. **[US-04] Modification et annulation de rendez-vous** — *Estimation : 3 points* (Priorité : Must)
6. **[US-05] Consultation de l'historique médical du patient** — *Estimation : 5 points* (Priorité : Must)
7. **[US-06] Saisie et sauvegarde des comptes-rendus de consultation** — *Estimation : 5 points* (Priorité : Must)
8. **[ENF-01 / ENF-03] Optimisation des requêtes (< 2s) et script de sauvegarde quotidienne** — *Estimation : 5 points* (Priorité : Must)
9. **[US-08] Gestion des rôles et droits d'accès (Admin / Médecin / Secrétaire)** — *Estimation : 5 points* (Priorité : Should)
10. **[US-07] Génération d'ordonnances médicales au format PDF** — *Estimation : 8 points* (Priorité : Should)
11. **[US-09] Tableau de bord et export CSV des statistiques** — *Estimation : 5 points* (Priorité : Could)

**Justification des « Must » :** Les éléments classés *Must* constituent le noyau vital du système (sécurité d'accès, gestion des patients, agenda sans doublon et suivi médical). Sans eux, le cabinet ne peut pas abandonner le papier ni atteindre l'objectif principal de réduction du temps d'attente à l'accueil.

---

## 5. Choix de la démarche (5 lignes)
Pour ce projet, nous adoptons une **démarche Agile (méthode Scrum)** car les besoins des utilisateurs en matière d'ergonomie et d'organisation des écrans vont s'affiner au fil des démonstrations. Cette approche itérative permet de livrer rapidement un premier produit viable contenant les fonctionnalités *Must* dès les premiers sprints, tout en intégrant facilement les retours réguliers des médecins et secrétaires avant la mise en service finale[cite: 3].
