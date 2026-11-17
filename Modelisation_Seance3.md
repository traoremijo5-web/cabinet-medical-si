# Modélisation UML & BPMN — Séance 3 : Gestion de Cabinet Médical

## 1. Diagramme de Cas d'Utilisation (UML)

### 1.1. Acteurs et Cas d'Utilisation (basés sur les exigences *Must*)
* **Acteurs principaux :**
  * **Secrétaire médicale**
  * **Médecin**
* **Cas d'utilisation du système :**
  * **UC-01 :** S'authentifier
  * **UC-02 :** Créer une fiche patient *(Secrétaire)*
  * **UC-03 :** Rechercher un dossier patient *(Secrétaire & Médecin)*
  * **UC-04 :** Planifier un rendez-vous *(Secrétaire)*
  * **UC-05 :** Modifier ou annuler un rendez-vous *(Secrétaire)*
  * **UC-06 :** Consulter l'historique médical *(Médecin)*
  * **UC-07 :** Rédiger un compte-rendu de consultation *(Médecin)*

### 1.2. Relations justifiées (`<<include>>` et `<<extend>>`)
1. **Relation d'inclusion (`<<include>>`) :**
   * *Relation :* Tous les cas d'utilisation métiers (**UC-02** à **UC-07**) incluent **`UC-01 : S'authentifier`**.
   * *Justification :* L'accès aux dossiers médicaux et à l'agenda est strictement confidentiel ; aucune opération ne peut être réalisée sans vérification préalable des identifiants de l'utilisateur.
2. **Relation d'extension (`<<extend>>`) :**
   * *Relation :* **`UC-02 : Créer une fiche patient`** étend **`UC-04 : Planifier un rendez-vous`**.
   * *Justification :* Lors d'une prise de rendez-vous, si le patient est déjà enregistré, la secrétaire sélectionne directement sa fiche. La création d'un nouveau dossier n'est déclenchée qu'en cas de nouveau patient (extension conditionnelle).

---

## 2. Descriptions textuelles détaillées de deux cas clés

### Cas clé n° 1 : Planifier un rendez-vous (UC-04)
* **Acteur principal :** Secrétaire médicale
* **Préconditions :** La secrétaire est authentifiée sur l'application ; l'agenda des médecins est accessible.
* **Scénario nominal :**
  1. La secrétaire ouvre l'agenda numérique partagé.
  2. Elle sélectionne le médecin concerné et la date souhaitée.
  3. Elle recherche et sélectionne le patient dans la base de données.
  4. Elle choisit un créneau horaire libre et valide la réservation.
  5. Le système enregistre le rendez-vous et met à jour l'agenda en temps réel.
* **Scénario alternatif :**
  * *A1 (Nouveau patient — à l'étape 3) :* Le patient n'existe pas encore dans la base. La secrétaire déclenche le cas *UC-02 (Créer une fiche patient)*, saisit ses informations obligatoires (nom, prénom, téléphone, âge), puis reprend la planification à l'étape 4.
* **Scénario d'erreur / d'exception :**
  * *E1 (Créneau déjà occupé — à l'étape 4) :* Un autre poste vient de réserver ce créneau simultanément. Le système bloque l'enregistrement, affiche le message *« Créneau indisponible pour ce médecin »* et invite à choisir un autre horaire.
* **Postconditions :** Le créneau apparaît comme réservé sur l'agenda du médecin.

### Cas clé n° 2 : Rédiger un compte-rendu de consultation (UC-07)
* **Acteur principal :** Médecin
* **Préconditions :** Le médecin est authentifié ; le patient est en consultation et son dossier est ouvert.
* **Scénario nominal :**
  1. Le médecin consulte l'historique médical du patient.
  2. Il clique sur « Nouvelle consultation ».
  3. Il saisit les symptômes observés, le diagnostic et les prescriptions.
  4. Il clique sur « Enregistrer le compte-rendu ».
  5. Le système horodate la saisie (date du jour) et l'ajoute de manière permanente à l'historique du patient.
* **Scénario alternatif :**
  * *A1 (Modification avant clôture — à l'étape 4) :* Le médecin souhaite corriger une saisie avant de quitter le dossier ; il modifie le texte et sauvegarde à nouveau.
* **Scénarios d'erreur / d'exception :**
  * *E1 (Champs obligatoires vides — à l'étape 4) :* Le médecin tente d'enregistrer sans avoir renseigné le diagnostic. Le système bloque la sauvegarde et signale le champ manquant.
  * *E2 (Coupure réseau locale) :* Le système affiche une alerte et conserve temporairement la saisie en mémoire locale jusqu'au rétablissement.
* **Postconditions :** Le nouveau compte-rendu est enregistré en tête de l'historique chronologique du patient.

---

## 3. Modélisation des processus BPMN (« As-Is » vs « To-Be »)

### 3.1. Processus actuel « As-Is » (Fonctionnement papier)
* **Couloirs (Lanes) :** Patient, Secrétaire médicale, Médecin.
* **Déroulement :** Le patient appelle ou se présente à l'accueil → la secrétaire vérifie l'agenda papier manuscrit et note le rendez-vous → à l'arrivée du patient, elle cherche physiquement le dossier dans les armoires (ou crée une fiche papier manuelle) → elle apporte physiquement le dossier au médecin → le médecin ausculte et note ses observations à la main → le dossier papier est restitué au secrétariat pour archivage.

### 3.2. Processus cible « To-Be » (Fonctionnement numérisé)
* **Couloirs (Lanes) :** Patient, Secrétaire médicale, Médecin.
* **Déroulement :** Le patient demande un rendez-vous → la secrétaire s'authentifie, recherche le patient (ou crée sa fiche numérique en < 3 min) et réserve un créneau sur l'agenda partagé avec contrôle anti-doublon → le médecin consulte son agenda en temps réel et ouvre le dossier numérique en < 5 secondes → il saisit directement le compte-rendu dans l'application → le système sauvegarde et horodate automatiquement la consultation en base de données.

### 3.3. Comparaison : Trois gains attendus
1. **Gain de temps à l'accueil :** Réduction de 50 % du temps d'enregistrement d'un patient grâce à la suppression de la recherche physique dans les archives papier.
2. **Fiabilité de la planification :** Élimination totale (100 %) des doubles réservations grâce à la synchronisation en temps réel de l'agenda numérique partagé.
3. **Accès instantané et sécurisé aux données :** Consultation de l'historique médical complet en moins de 5 secondes par le médecin, sans risque de perte ou de détérioration des dossiers.
