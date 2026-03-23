# 🎯 GUIDE ULTRA COMPLET : Extraction d'Informations pour les Examens EPI & RC
**Basé sur l'analyse de 6 années d'annales (2019-2024) et de leurs corrigés**

Ce document recense TOUTES les informations qu'un étudiant doit extraire d'un article *avant* même de lire les questions de l'examen. Si vous remplissez cette grille, vous aurez la réponse à 90% des questions possibles.

---

## ⚡️ LA RÈGLE D'OR : L'EXTRACTION EN 15 MINUTES
Ne lisez pas les questions d'abord. Les étudiants qui réussissent extraient ces données systématiquement :

### 1. IDENTIFICATION DE L'ÉTUDE (PICO)
*   **Population (P)** :
    *   Critères d'inclusion (TOUS)
    *   Critères d'exclusion (TOUS)
    *   Nombre de patients : N recrutés, N randomisés, N analysés.
    *   Lieu/Sites : Monocentrique ou multicentrique ? Pays ?
    *   Dates de l'étude : Début et fin d'inclusion (pas juste la date de publication).
*   **Intervention (I)** :
    *   Nom exact du médicament/procédure.
    *   Posologie, mode d'administration, durée, règles d'arrêt.
*   **Comparateur (C)** :
    *   Détails précis (Placebo ? Traitement standard ? Autre dose ?).
    *   Si placebo : est-il identique en apparence ?
*   **Outcome (O - Critère de Jugement Principal)** :
    *   Définition EXACTE (ex: "Survie sans progression à 3 ans" et pas juste "Survie").
    *   Moment de la mesure (Timing).
    *   Méthode de mesure (Qui mesure ? Avec quel outil ?).
    *   Nature de la variable (Binaire, Continue, Censurée/Survie).

### 2. MÉTHODOLOGIE (DÉTAILS CRUCIAUX)
*   **Type d'étude** :
    *   RC : Essai contrôlé randomisé (ECR) ? Phase (II/III) ? Non-infériorité ou Supériorité ?
    *   EPI : Cohorte ? Cas-témoins ? Transversale ? Nichée ?
*   **Randomisation (pour RC)** :
    *   Méthode : Simple ? Stratifiée (par quels facteurs) ? En blocs ? Minimisation ?
    *   Assignation secrète (Allocation concealment) : Comment est-elle garantie ? (ex: serveur centralisé = bien).
*   **Aveugle (Blinding)** :
    *   Qui est aveugle ? Patient ? Médecin ? Évaluateur ? Statisticien ?
    *   "Double aveugle" ne suffit pas, précisez QUI.
*   **Calcul de la taille d'échantillon (NSN)** :
    *   Risque alpha (souvent 5%), Puissance (1-beta, souvent 80-90%).
    *   Hypothèse d'effet (Delta attendu).
    *   Ajustements éventuels (perdus de vue, effet grappe/cluster, tests multiples).

### 3. STATISTIQUES
*   **Population d'analyse** : ITT (Intention de Traiter) vs Per-Protocol (PP). Le corrigé demande souvent de justifier pourquoi l'ITT est préférée (préserve la randomisation).
*   **Tests statistiques** :
    *   Quel test pour le critère principal ? (ex: Log-rank, Cox, Chi-2, T-test).
    *   Ajustements : Multivarié ? Quels facteurs d'ajustement (confondeurs) ?
*   **Gestion des données manquantes** : Imputation ? Analyse de cas complets ?

### 4. RÉSULTATS CLÉS
*   **Critère Principal** :
    *   Estimation ponctuelle (HR, OR, Différence moyenne).
    *   Intervalle de Confiance à 95% (IC95%).
    *   Petit p (p-value).
    *   Conclusion clinique : Significatif ET pertinent ?
*   **Balance à l'inclusion** : Le tableau 1 montre-t-il des différences significatives entre les groupes ?
*   **Effets indésirables** : Grade 3-4 ? Différence entre les groupes ?

---

## 🔍 FOCUS SPÉCIFIQUE : EPI vs RC

### 🏥 Pour la Recherche Clinique (RC)
Les questions pièges récurrentes (Top 5) :
1.  **Validité du critère de jugement** : Est-ce un critère clinique ou de substitution (surrogate) ? Est-il objectif ou subjectif ?
2.  **Schéma de non-infériorité** : Si c'est le cas, avez-vous bien noté la marge de non-infériorité ? L'analyse Per-Protocol est-elle présentée (importante en non-infériorité) ?
3.  **Analyses intermédiaires** : Y a-t-il eu des règles d'arrêt précoce (O'Brien-Fleming) ?
4.  **Effet cluster** : Si randomisation par centre/école, le calcul du NSN a-t-il pris en compte l'ICC (Intra-Class Correlation) ?
5.  **Validité externe** : Les critères d'exclusion sont-ils trop stricts ? (Patients "trop parfaits").

### 📊 Pour l'Épidémiologie (EPI)
Les questions pièges récurrentes (Top 5) :
1.  **Biais de sélection** : Comment la cohorte a-t-elle été constituée ? (Volontaires sains ? Travailleurs ?).
2.  **Biais de classement** : L'exposition ou la maladie sont-elles mal mesurées ? (Biais de mémoire dans les cas-témoins).
3.  **Confondeurs** : Liste des facteurs de confusion potentiels. Ont-ils été mesurés ? Ajustés ?
4.  **Interaction** : Y a-t-il une modification d'effet (ex: l'effet du tabac est plus fort chez les femmes) ? Le test d'interaction est-il significatif ?
5.  **Causalité** : Discussion des critères de Bradford Hill (Force de l'association, relation dose-effet, temporalité).

---

## 📝 MODÈLES DE RÉPONSE TYPES (PHRASES À TROUS)

**Pour justifier le design (RC) :**
> "Il s'agit d'un essai contrôlé randomisé de phase III, en double aveugle, multicentrique, de non-infériorité. La randomisation permet d'assurer la comparabilité des groupes (contrôle des biais de confusion). Le double aveugle limite les biais de classement (surtout pour les critères subjectifs) et de suivi."

**Pour le calcul de taille d'échantillon :**
> "Le calcul est basé sur le critère principal [NOM]. Pour mettre en évidence une différence de [DELTA] (ou un HR de [X]) avec une puissance de [80/90]% et un risque alpha de 5%, il fallait inclure [N] patients. Ce calcul prend en compte [X]% de perdus de vue."

**Pour l'analyse des biais (EPI) :**
> "Un biais de sélection est possible car [RAISON, ex: recrutement volontaire]. Cela pourrait [SURESTIMER/SOUS-ESTIMER] l'association. Un biais de classement de l'exposition est probable car [RAISON, ex: auto-questionnaire], ce qui entraînerait un biais [NON DIFFÉRENTIEL VERS LE NUL]."

