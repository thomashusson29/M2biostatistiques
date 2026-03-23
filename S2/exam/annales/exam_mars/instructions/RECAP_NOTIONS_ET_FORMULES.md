# RECAP: TOUTES LES NOTIONS ATTENDUES & FORMULES
## Feuille de triche pour l'examen - M2 Méthodologie et Statistique en Recherche Biomédicale

---

## TABLE DES MATIÈRES
1. [Calcul du Nombre de Sujets Nécessaires (NSN)](#nsnsamples)
2. [Mesures d'Association Épidémiologiques](#epidmeasures)
3. [Tests Statistiques & Conditions d'Utilisation](#tests)
4. [Interaction (Multiplicative vs Additive)](#interaction)
5. [Designs d'Études](#designs)
6. [Biais & Confusion](#biasnconfound)
7. [Analyses Avancées](#advanced)

---

## 1. CALCUL DU NOMBRE DE SUJETS NÉCESSAIRES (NSN) {#nsnsamples}

### Concept Fondamental
**Définition**: Le NSN est le nombre minimum de participants nécessaires pour détecter une différence cliniquement pertinente avec une puissance statistique adéquate.

### Paramètres TOUJOURS Requis
Pour obtenir les **POINTS COMPLETS**, votre justification DOIT mentionner:

| Paramètre | Symbole | Définition | Valeurs Typiques |
|-----------|---------|-----------|------------------|
| **Risque alpha** | α | Risque d'erreur de type I (faux positif) | 0.05 (test bilatéral: 0.025/côté) |
| **Risque beta** | β | Risque d'erreur de type II (faux négatif) | 0.10-0.20 (puissance = 1-β = 80-90%) |
| **Différence clinique pertinente** | δ (delta) ou Δ | MCID (Minimal Clinically Important Difference) - l'effet attendu | Variable selon le critère |
| **Variance/Écart-type** | σ | Variabilité attendue dans la population | Basée sur données antérieures ou littérature |
| **Taux baseline** | p₀ | Fréquence de l'outcome dans le groupe contrôle | Études pilotes ou littérature |
| **Taux attendu** | p₁ | Fréquence attendue dans le groupe intervention | Basée sur hypothèse d'effet |

### Formules Fondamentales

#### Test de comparaison de moyennes (données continues)
```
NSN par bras = 2 × [(z_α + z_β)² × σ²] / δ²

Où:
- z_α = valeur de z pour α (bilatéral: 1.96)
- z_β = valeur de z pour β (puissance 90%: 1.28; 80%: 0.84)
- σ = écart-type
- δ = différence cliniquement pertinente
```

**Example**: Pour détecter une différence de 10 points (δ=10) dans un score avec σ=20:
```
NSN = 2 × [(1.96 + 1.28)² × 400] / 100 = 2 × [10.49 × 400] / 100 ≈ 84 sujets/bras
```

#### Test de comparaison de proportions (données binaires)
```
NSN par bras = [(z_α + z_β)² × (p₀(1-p₀) + p₁(1-p₁))] / (p₀ - p₁)²
```

**Example**: Réduction de 60% → 30%
```
NSN = [(1.96 + 1.28)² × (0.6×0.4 + 0.3×0.7)] / (0.6-0.3)² ≈ 50 sujets/bras
```

### Ajustements Essentiels pour les Points

#### 1. **Perdus de vue / Dropout**
- **Formule**: NSN ajusté = NSN / (1 - taux_attrition)
- **Valeurs Typiques**: 10-20% selon la durée de suivi
- **Points perdus si oublié**: -2 points généralement

#### 2. **Comparaisons Multiples**
- **Bonferroni Correction**: Réduire α de 0.05 à 0.05/nombre de tests
- **Exemple**: 3 comparaisons → α = 0.0167 → augmente NSN de ~20%
- **Types**:
  - Co-primary endpoints: tous les critères DOIVENT être significatifs
  - Critère composite: UN seul critère significatif suffit

#### 3. **Effet Cluster (Essais Randomisés en Cluster)**
- **Concept**: Les sujets au sein d'un cluster sont corrélés (ICC = Intraclass Correlation Coefficient)
- **Design Effect (DE)**: DE = 1 + (cluster_size - 1) × ICC
- **Formule**: NSN ajusté = NSN brut × DE
- **Valeurs ICC**: 0.01-0.10 selon le contexte (santé publique/comportement)
- **Importance pour les points**: CRITIQUE - oublie systématique d'ajustement

#### 4. **Effet Cluster: Formule Complète**
```
NSN par cluster = 2 × [(z_α + z_β)² × σ² × (1 + (m-1)×ICC)] / δ²

Où:
- m = nombre de sujets par cluster
- ICC = coefficient de corrélation intra-cluster
```

**PIÈGE COMMUN**: Les candidats oublient l'ICC - cela résulte en NSN GROSSIÈREMENT SOUS-ESTIMÉ.

### Co-Primary Endpoints (Critères Multiples)
- **Définition**: TOUS les critères doivent être significatifs simultanément
- **Correction**: Utiliser r=corrélation entre les critères si disponible
- **Logiciel R**: Package `mpe` → `power.known.var(K=nombre, rho=correlations, SD=écarts, delta=différences)`
- **Points clés**:
  - Sans correction: risque β augmente exponentiellement
  - Avec correction: NSN plus petit que estimation "indépendante"

### Analyses Intermédiaires
- **Futilité**: Arrêt précoce si peu probable que l'intervention fonctionne
- **Efficacité**: Arrêt si significatif très tôt
- **Sécurité**: Arrêt si effet indésirable majeur
- **Impact NSN**: Augmente généralement le NSN total de 5-10% (réévaluation)

**À retenir pour NSN**:
- ✅ TOUJOURS mentionner les 6 paramètres de base (α, β, δ, σ, p₀, p₁)
- ✅ TOUJOURS justifier la source de vos paramètres (littérature, étude pilote)
- ✅ JAMAIS oublier ajustements: dropout, comparaisons multiples, clusters
- ❌ PIÈGE: Confondre ICC avec autres mesures de similitude
- ❌ PIÈGE: Oublier que delta c'est l'EFFET MINIMAL (pas l'effet réaliste)

---

## 2. MESURES D'ASSOCIATION ÉPIDÉMIOLOGIQUES {#epidmeasures}

### Odds Ratio (OR)

**Définition**: Rapport des odds (cotes) d'exposition entre les cas et les non-cas.

**Formule**:
```
OR = (a × d) / (b × c)

Tableau de contingence:
         Maladie+  Maladie-
Expo+         a         b
Expo-         c         d
```

**Utilisation**:
- Études cas-contrôle (mesure naturelle)
- Régression logistique (modèle multiplicatif)

**Interprétation**:
- OR = 1.0 → Pas d'association
- OR = 2.0 → 2x plus de odds d'exposition chez les cas
- OR = 0.5 → 50% moins de odds d'exposition

**IC 95%**: 
```
log(OR) ± 1.96 × SE(log(OR))
SE(log(OR)) = √(1/a + 1/b + 1/c + 1/d)
```

**PIÈGE COMMUN**: 
- Confondre OR et RR dans les études de cohorte
- Affirmer que OR ≈ RR sans vérifier que la maladie est rare

### Risque Relatif (RR) ou Hazard Ratio (HR)

**Risque Relatif (RR)**:
```
RR = R_expo / R_non_expo
   = [a/(a+b)] / [c/(c+d)]
   = Risque chez les exposés / Risque chez les non-exposés
```

**Utilisation**:
- Études de cohorte (mesure naturelle)
- Régression de Poisson (données de comptage)
- Comparaison de proportions/incidences

**Interprétation**:
- RR = 1.0 → Pas d'association
- RR = 2.0 → 2x plus de risque chez les exposés
- RR = 0.5 → 50% moins de risque (protection)

**Hazard Ratio (HR)**:
```
HR = λ_expo(t) / λ_non_expo(t)
Où λ = taux instantané d'événement (force de morbidité)
```
- Utilisé dans modèles de survie (Cox)
- Interprétation similaire à RR mais pour les taux
- Suppose **proportionalité des risques** sur toute la période

### Comparaison OR vs RR

| Aspect | OR | RR |
|--------|----|----|
| **Calcul** | Rapport des odds | Rapport des risques |
| **Design** | Cas-contrôle naturel | Cohorte naturel |
| **Interprétation** | Plus difficile | Plus intuitive |
| **Relation** | OR ≈ RR si maladie rare | Exact toujours |
| **Régression** | Logistique (multiplicatif) | Poisson (multiplicatif) |

**Approximation**: Si incidence < 10%, alors OR ≈ RR

### Mesures de Fréquence

#### Incidence
```
Incidence = Nombre de cas NEW / Population à risque × période
            = [a / (N - cas préexistants)] × 1/an
```
- Mesure **prospective**
- Approche temporelle claire
- Pour maladies chroniques: souvent par 100,000 par an

#### Prévalence
```
Prévalence = Nombre de cas EXISTANTS / Population totale
           = (maladies présentes à un moment T) / N
```
- Mesure **transversale** (instantané)
- Utile pour planning des services
- Produit sensible à incidence ET durée maladie

**Lien**: Prévalence ≈ Incidence × Durée (modèle stable)

### Fractions Attribuables

#### Fraction Attribuable chez les Exposés (AFₑ)
```
AF_e = (RR - 1) / RR = (p₁ - p₀) / p₁

Interprétation: % de risque chez les exposés attribuable à l'exposition
```

#### Fraction Attribuable Populationnelle (AF)
```
AF = [P_e × (RR - 1)] / [P_e × (RR - 1) + 1]
   = P_e × AF_e

Où P_e = prévalence de l'exposition dans la population
```

**Utilité**: Prioriser interventions de santé publique

### Interaction: Mesures Additives vs Multiplicatives

#### Relative Excess Risk due to Interaction (RERI)
```
RERI = RR(A+B+) - RR(A+B-) - RR(A-B+) + 1

RERI > 0 → Interaction positive (synergie)
RERI < 0 → Interaction négative (antagonisme)
RERI = 0 → Pas d'interaction additive
```

#### Attributable Proportion (AP) ou Synergy Index
```
AP = RERI / RR(A+B+)
```

**Points critiques**:
- ✅ TOUJOURS vérifier multiplicatif (OR dans régression logistique) vs additif
- ✅ Possible d'avoir interaction multiplicative SANS additive (fréquent!)
- ❌ PIÈGE: Supposer que multiplicatif = additif

---

## 3. TESTS STATISTIQUES & CONDITIONS D'UTILISATION {#tests}

### Données Quantitatives (Continues)

#### T-test Student vs Wilcoxon Mann-Whitney

| Condition | T-test (Paramétrique) | Wilcoxon (Non-paramétrique) |
|-----------|----------------------|---------------------------|
| **Normalité** | OUI (distribution normale) | NON requise |
| **Effectif** | n > 30 OK; sinon vérifier | Préféré si n < 30 |
| **Homogénéité variances** | OUI (Levene test) | NON requise |
| **Données appairées** | T-test apparié | Wilcoxon signed-rank |
| **Puissance** | Plus forte si conditions respectées | Moins puissant (20% perte) |
| **Interprétation** | Moyenne | Médiane (tendance centrale) |

**CHOIX**:
- ✅ T-test si: Normalité confirmée + variances homogènes
- ✅ Wilcoxon si: Distribution asymétrique OU outliers importants
- ✅ T-test robuste si n > 30-50 (par TCL)

**Hypothèses pour T-test**:
1. Observations indépendantes
2. Distribution normale (ou n > 30)
3. Égalité des variances (vérifier Levene: p > 0.05)

**Hypothèses pour Wilcoxon**:
1. Observations indépendantes
2. Données ordinales au minimum (peuvent être continues)

#### ANOVA vs Kruskal-Wallis

| Aspect | ANOVA | Kruskal-Wallis |
|--------|-------|-----------------|
| **Nombre groupes** | ≥ 3 groupes | ≥ 3 groupes |
| **Normalité** | OUI requise | NON requise |
| **Test post-hoc** | Tukey, Bonferroni | Dunn test |
| **Paramètres** | Moyenne | Rang/Médiane |

### Données Catégoriques (Discrètes)

#### Chi-carré (χ²) vs Fisher Exact

| Condition | Chi-carré | Fisher Exact |
|-----------|-----------|--------------|
| **Effectifs attendus** | Tous ≥ 5 | ≥ 1 cellule < 5 |
| **Tableau** | 2×2 ou plus | Surtout 2×2 |
| **Taille échantillon** | N > 40 | N < 40 recommandé |
| **Calcul** | Approximation | Exact |
| **Biais** | Léger si n petit | Aucun |

**CHOIX**:
- ✅ Chi-carré si: Tous effectifs attendus ≥ 5
- ✅ Fisher si: ≥ 1 effectif attendu < 5 (exact et correct)

**Formule Chi-carré**:
```
χ² = Σ [(observé - attendu)² / attendu]

Attendu = (total_ligne × total_colonne) / N_total
```

### Analyses de Survie

#### Log-Rank vs Cox Proportional Hazards

| Aspect | Log-Rank | Cox Regression |
|--------|----------|-----------------|
| **Variable dépendante** | Temps jusqu'événement | Temps jusqu'événement |
| **Nombre groupes** | Idéal 2 groupes | Continu ou catégorique |
| **Ajustement** | NON (test simple) | OUI (covariances) |
| **Proportionalité** | NON requise | OUI CRITIQUE |
| **Interprétation** | P-value | HR + IC + p-value |
| **Censure** | Gérée automatiquement | Gérée automatiquement |

**Quand utiliser quoi**:
- ✅ Log-Rank: Comparaison brute 2 groupes, absence interaction
- ✅ Cox: Ajustement covariables, interactions multiples

**ASSOMPTION CRITIQUE de Cox**: **Proportional Hazards**
- Les risques relatifs sont constants dans le temps
- Vérification: Graphiques log(-log(S)) vs temps
- Test: Interaction exposure × log(temps) doit être non-significatif
- Si violée: Modèle stratifié ou Cox-stratifiée par la variable

#### Censure non-informative
```
Hypothèse: Les sujets censurés auraient la même distribution
           d'événements que les sujets non censurés (si suivis suffisamment)

Si violée: BIAIS - Cox donne estimations biaisées
```

### Régression Linéaire vs Logistique

| Aspect | Régression Linéaire | Régression Logistique |
|--------|---------------------|----------------------|
| **Variable Y** | Continue | Binaire (0/1) |
| **Prédiction** | Moyenne Y | Probabilité P(Y=1) |
| **Modèle** | Y = β₀ + β₁X | log(p/(1-p)) = β₀ + β₁X |
| **Coefficient** | Diff. moyenne | log(OR) |
| **Interprétation** | Différence unités | OR = exp(β) |
| **Homoscédasticité** | OUI requise | NON requise |

**Points clés**:
- Linéaire: Paramètres (β) directement interprétables
- Logistique: Transformer OR = e^β pour interprétation

#### Régression de Poisson (données de comptage)
```
log(λ) = β₀ + β₁X
λ = nombre d'événements
OR = exp(β)
```
- Utilisée pour: Taux, incidences, avec offset = time at risk
- Gère surdispersion (quasi-Poisson)

### Régression Multi-niveaux
```
Modèle linéaire généralisé avec effets aléatoires
Exemple: Cox avec random effect = centre
```

**Utilité**: Données hiérarchiques
- Patients au sein de cliniques
- Mesures répétées au sein de patients
- Clusters (RCT en cluster)

**Effet aléatoire**: Absorbe corrélation intra-groupe

---

## 4. INTERACTION (Multiplicative vs Additive) {#interaction}

### Concept Fondamental

Une **interaction** existe quand l'effet d'une exposition sur l'outcome est modifié par une tierce variable.

#### Exemple Classique
```
Facteur A (exposition) + Facteur B (modificateur d'effet)

Modèle Multiplicatif (régression logistique/Cox):
log(odds) = β₀ + β₁×A + β₂×B + β₃×A×B

Modèle Additif (risque absolu):
Risque = p + α₁×A + α₂×B + α₃×A×B
```

### Interaction Multiplicative

**Définition**: OR₁₁ ≠ OR₁₀ × OR₀₁ (OR se MULTIPLIENT avec interaction)

**Test**:
- Inclusion terme interaction dans Cox: X₁ × X₂
- Coefficient interaction = 0 → Pas d'interaction
- p-value > 0.05 pour interaction → Pas d'interaction multiplicative

**Exemple**:
```
Exposition travail nuit:    HR = 1.5
Hygiène de vie mauvaise:    HR = 2.0

Sans interaction: HR attendu = 1.5 × 2.0 = 3.0
Avec interaction multiplicative: HR observé = 4.0 (par ex)
```

### Interaction Additive

**Définition**: Risque n'est PAS additif. RERI ≠ 0

**Formule (Cas binaire)**:
```
Groupe de référence (A-B-):     Risk_00 = p₀
A+ seulement:                   Risk_10 = p₀ + α
B+ seulement:                   Risk_01 = p₀ + β
A+ ET B+:                       Risk_11 = ?

Additivité attendue:            Risk_11 = p₀ + α + β
Interaction additive:           Risk_11 ≠ p₀ + α + β
```

**Mesure**: **RERI = Risk₁₁ - (Risk₁₀ - Risk₀₀) - (Risk₀₁ - Risk₀₀) - Risk₀₀**

Simplifié: **RERI = RR₁₁ - RR₁₀ - RR₀₁ + 1**

**Interprétation**:
- RERI > 0 → Synergie (plus qu'additif)
- RERI < 0 → Antagonisme (moins qu'additif)
- RERI = 0 → Additivité stricte

### Points Critiques pour l'Examen

✅ **Reconnaître le paradoxe**:
- Possible d'avoir interaction multiplicative (OR) SANS interaction additive
- Cela arrive fréquemment
- Dépend de l'échelle d'analyse (logit vs risque absolu)

✅ **Reporting**:
- TOUJOURS tester multiplicatif (terme interaction × dans le modèle)
- Si intéressé par additif: calculer RERI avec ses IC

❌ **PIÈGES**:
- Confondre interaction et confounding
- Oublier que interaction additif ≠ multiplicatif
- Reporter seulement un sans l'autre

✅ **Quand l'évaluer**:
- Hypothèse prédéfinie (pas exploration post-hoc)
- Graphique interaction très informatif
- Les épidémiologistes valorisent RERI (plus pertinent santé publique)

---

## 5. DESIGNS D'ÉTUDES {#designs}

### Essai Randomisé Contrôlé (RCT)

#### Définition
Allocation ALÉATOIRE des sujets à intervention vs contrôle.

#### Avantages
- ✅ Élimine confondeurs connus ET inconnus jusqu'à randomisation
- ✅ Établit causalité si bien conduit
- ✅ Puissance statistique bien définie
- ✅ Analyse ITT (Intention To Treat) standard

#### Inconvénients
- ❌ Coûteux
- ❌ Limité aspects ethiques
- ❌ Problèmes compliance
- ❌ Populations souvent sélectionnées (non représentatives)

#### Randmization Methods
- Allocation aléatoire simple
- Stratifiée (par facteurs pronostiques)
- **Minimisation**: Équilibre probabiliste des facteurs pronostiques (80% au bras qui les rapproche)

**Points pour examen**:
- Minimisation = rend bras plus similaires sur caractéristiques pronostiques
- Pas un vrai problème d'aveugle si outcome objectif

### Essai Randomisé en Cluster (Cluster RCT)

**Définition**: Randomise **groupes** (clusters) plutôt que patients individuels.

#### Avantages
- ✅ Intervention systémique (santé publique, organisationnelle)
- ✅ Moins de contamination entre bras
- ✅ Moins cher, plus facile logistiquement
- ✅ Parfois seul design éthiquement acceptable

#### Inconvénients
- ❌ Analyse DOIT tenir compte corrélation intra-cluster
- ❌ NSN augmente substantiellement (Design Effect)
- ❌ Peu de clusters → biaisé (randomisation au niveau groupe)
- ❌ Potentiel confondeurs au niveau cluster

#### Design Effect & ICC
```
Design Effect (DE) = 1 + (m - 1) × ICC

NSN ajusté = NSN brut × DE

Où:
m = taille cluster (patients par cluster)
ICC = coefficient corrélation intra-cluster (0 à 1)
```

**Valeurs ICC typiques**:
- Mesures comportementales: 0.05-0.15
- Mesures géographiques: 0.01-0.05
- Mesures cliniques objectives: < 0.01

**PIÈGE MAJEUR**: Oublier ICC → NSN dramatiquement sous-estimé

#### Analyse
- DOIT inclure **effet aléatoire cluster** dans le modèle
- Régression mixte (fixed + random effects)
- Essai randomisé au niveau cluster → analyser au niveau patient AVEC correction

### Études de Cohorte

**Définition**: Suivi prospectif (ou rétrospectif) de groupes exposés vs non-exposés.

#### Avantages
- ✅ Plusieurs outcomes possibles
- ✅ Relation temporelle claire (exposition → outcome)
- ✅ Calcul direct du RR
- ✅ Bon pour maladies rares d'exposition

#### Inconvénients
- ❌ **Attrition bias** (perdus de vue)
- ❌ Coûteux et long
- ❌ Confondeurs doivent être mesurés
- ❌ Drift des critères de jugement

#### Attrition Bias
```
Définition: Les perdus de vue ne sont PAS aléatoires
           → Corrélation entre perdus de vue et outcome

Exemple: Patients qui abandonnent traitement car se sentent mieux
         → Difficulté à évaluer efficacité réelle
```

**Gestion en analyse**:
- Modèle Cox: censure considérée non-informative (FORTE hypothèse)
- Analyse sensibilité: assumer différents scénarios attrition
- Imputation multiple (avancé)

#### Critères pour analyse temporelle
- Toujours vérifier relation temporelle: exposition DOIT précéder outcome
- Délai biologiquement plausible

### Études Cas-Contrôle

**Définition**: Sélection rétrospective de cas (avec outcome) et contrôles (sans outcome), puis mesure exposition passée.

#### Avantages
- ✅ Rapide et bon marché
- ✅ Efficace pour maladies rares
- ✅ Plusieurs expositions mesurées

#### Inconvénients
- ❌ Relation temporelle souvent ambiguë
- ❌ **Information bias** (recall bias de l'exposition)
- ❌ **Selection bias** (choix des contrôles critique)
- ❌ Mesure OR (pas directement RR)

#### Sélection des Contrôles
- **Critères**: Provenance même population que cas
- **Appariement**: Souvent sur âge, sexe, etc
- **Problème**: Surappariement peut éliminer signal (perte puissance)

**Biais de sélection cas-contrôle**:
- Cas hospitalisés vs population générale → non représentatif
- Contrôles sains volunteers vs cas → sélection bias

### Études Transversales

**Définition**: Mesure exposition ET outcome au même moment (snapshot).

#### Avantages
- ✅ Rapide et peu coûteux
- ✅ Prévalence descriptive
- ✅ Génération d'hypothèses

#### Inconvénients
- ❌ Relation temporelle IMPOSSIBLE à établir
- ❌ Biais de prévalence (overrepresent durée maladie)
- ❌ Ne mesure pas causalité

#### Transversales Répétées (Baromètres)
- Mêmes mesures à plusieurs temps
- Bonne pour tendances populationnelles
- PAS une cohorte (différentes personnes chaque vague)

**Avantage vs Cohorte**:
- Moins coûteux (pas suivi individuel)
- Moins d'attrition
- Mais perd relation temporelle précise

### Études Écologiques

**Définition**: Analyse au niveau **groupe/population**, pas individus.

**Données**: Taux, moyennes par région/pays/temps

#### Avantage
- ✅ Données existantes (registres, statistiques nationales)
- ✅ Rapide, peu coûteux

#### Inconvénients majeurs
- ❌ **BIAIS ÉCOLOGIQUE**: Association au niveau groupe ≠ au niveau individuel
- ❌ Impossible causalité
- ❌ Confusion majorée par agrégation

#### Exemple Biais Écologique
```
Niveau groupe: Migration + → Éducation + → OR positif
Niveau individu: Migrants ont moins d'éducation → OR négatif

Parce que migrants choisissent régions très éduquées
(mais eux-mêmes ne le sont pas)
```

---

## 6. BIAIS & CONFUSION {#biasnconfound}

### Définition Confounder (Facteur de Confusion)

Un facteur X est confondeur SI:

1. **Associé à l'exposition** E (corrélé)
2. **Associé à l'outcome** O (cause indépendante)
3. **PAS sur le chemin causal** E → O (pas médiateur)

```
Modèle DAG (Directed Acyclic Graph):
        X
       / \
      E   O
       \ /

X confond la relation E → O
```

### Distinction: Confounder vs Médiateur

| Aspect | Confounder | Médiateur |
|--------|-----------|-----------|
| **Position** | Cause commune E et O | Sur le chemin E → O |
| **Ajustement** | OUI (nécessaire) | NON (rompt le signal) |
| **Impact** | Biaise l'association | Explique le mécanisme |
| **Exemple** | Age cause à la fois exposition et outcome | Age → autre facteur → outcome |

**Points clés**:
- Ajuster sur confounder → estime association vraie
- Ajuster sur médiateur → perd l'association (faux négatif)
- Ce n'est pas toujours clair théoriquement

### Types de Biais

#### Biais de Sélection (Selection Bias)

**Définition**: Procédure de sélection participantes associée à l'exposition/outcome

**Types**:
- **Berkson bias**: Cas hospitalisés ≠ population générale
- **Healthy worker effect**: Travailleurs sont sélectionnés plus sains
- **Volunteer bias**: Volontaires différents de population générale

**Conséquence**: Association observée ≠ association réelle
- Direction imprévisible

#### Biais d'Information (Information Bias)

**Erreur de mesure** exposée ou outcome

**Types**:
- **Recall bias**: Cas se souviennent mieux expositions passées que contrôles
- **Misclassification**: Erreur dans classification expo/outcome
- **Observer bias**: Différences systématiques selon groupe

**Conséquence**:
- Non-différentiel → atténue association (biase vers null)
- Différentiel → direction imprévisible

#### Biais de Confusion (Confounding Bias)

Voir section "Confounder" ci-dessus

**Conséquence**: Association observée biaisée (direction dépend corrélation)

#### Biais Écologique

Voir section "Études Écologiques"

### Gestion des Confondeurs

#### 1. **Randomisation (Meilleur)**
- RCT élimine confondeurs connus ET inconnus
- Conditionné sur randomisation faite correctement

#### 2. **Stratification**
- Analyser séparément par strates du confounder
- Test Mantel-Haenszel pour combiner

**Formule Mantel-Haenszel (OR commun)**:
```
OR_MH = Σ(a_i × d_i / N_i) / Σ(b_i × c_i / N_i)
```

#### 3. **Ajustement (Regression)**
- Inclure confounder dans le modèle
- Cox, logistique, linéaire: toutes ajustent

**Vérification**: 
- Coefficient brut vs ajusté
- Changement > 10% → confounder important

#### 4. **Appariement** (cas-contrôle)
- Selecter contrôles similaires cas sur confounder
- **ATTENTION**: Surappariement élimine signal

### Facteurs Génétiques Confondeurs

**Problème**: Très difficiles à mesurer

**Stratégies d'étude**:
1. Ajuster sur antécédents familiaux (simplifié)
2. Ajuster sur score génétique de risque (si disponible)
3. **Negative Control**: Comparer exposition non-causale (même confounding génétique)
4. **Sibling Comparison**: Analyser au sein des fratries (élimine confounding familial)

**Limitation**: Jamais parfait

---

## 7. ANALYSES AVANCÉES {#advanced}

### Multi-level Analysis (Mixed Models)

**Utilité**: Données hiérarchiques avec corrélation intra-groupe

**Modèle**:
```
Y_ij = β₀ + β₁X_ij + u_j + ε_ij

Où:
u_j = effet aléatoire groupe j (corrélation intra-groupe)
ε_ij = résidu au niveau individu
```

**Exemples**:
- Patients au sein cliniques (centre effect)
- Mesures répétées au sein patients (temps effect)
- Cluster RCT (cluster effect)

**Avantages**:
- Gère corrélation sans nécessité complétude
- Estimation efficace paramètres fixes
- Permet IC vs simple moyenne

### Modèles Paramétriques de Survie

**Vs Cox (semi-paramétrique)**:
- Suppose distribution spécifique (Weibull, lognormal, exponentielle)
- Estime plus de paramètres
- Plus flexible pour prédiction

**Utile quand**:
- Distribution claire (ex: lognormal pour survie long-terme)
- Besoin prédictions extrapolées au-delà suivi
- Médiane/moyenne survie critiques

**Flexible Parametric Models** (ex: Royston-Parmar):
- Capture la baseline hazard flexiblement
- Permet departures proportionalité
- Meilleur que Cox pur pour médiane

### Analyses de Sensibilité

**Définition**: Tester robustesse résultats à hypothèses alternatives

**Types**:
1. **Retrait variables**: Enlever covariables une par une
2. **Attrition scenarios**: Assumer différents mécanismes perdus vue
3. **Complete case vs ITT**: Comparer analyses
4. **Paramètres**: Varier MCID, ICC, etc.

**Importance**: Montrer résultats robustes vs cas de base

### Intention-To-Treat (ITT) vs Per-Protocol (PP)

| Aspect | ITT | PP |
|--------|-----|-----|
| **Population** | Tous randomisés | Ceux ayant suivi protocole |
| **Non-compliance** | Inclus (conservatif) | Exclus |
| **Bias** | Protégé contre compliance bias | Vulnérable bias sélection |
| **Puissance** | Réduite (dilution) | Augmentée (si complet) |
| **Causalité** | Réelle intention → treat | Effet du traitement reçu |
| **Standard** | PRIMARY (RCT) | Sensibilité seulement |

**Points clés**:
- ITT est l'analyse de principe (préservé avantage randomisation)
- PP peut être utile pour comprendre biologie mais moins rigoureux
- Cluster RCT complique ITT (randomisé cluster, pas patients)

### Bayesian Approaches

**Quand pertinent**:
1. Petits essais chez enfants
2. Réutilisation données antérieures (prior information)
3. Décisions adaptives
4. Résultats rares

**Avantages**:
- Intègre prior knowledge élégamment
- IC directement interprétables (probabilité posterieure)
- Flexible pour designs adaptatifs

**Désavantages**:
- Plus complexe, moins familier
- Prior choix crucial

### Multiplicité & Correction Alpha

**Problème**: Plus tests → plus risque faux positif (inflation α)

**Corrections**:
1. **Bonferroni**: α/nombre tests (très conservatrice)
2. **Holm-Bonferroni**: Séquentielle (moins conservatrice)
3. **Hierarchical testing**: Priorité tests (moins d'inflation si structure logique)
4. **Co-primary endpoints**: Tous DOIVENT être significatifs

**Points clés**:
- ✅ PRÉ-SPÉCIFIER tests et hiérarchie
- ✅ ITT + co-primary si objectifs multiples
- ❌ ÉVITER exploration post-hoc non-déclarée
- ✅ Rapporter IC (moins influencé par multiplicité que p-values)

### Non-Infériorité Trials

**Concept**: Montrer que nouveau traitement n'est pas PIRE que standard

**Hypothèse**: 
```
H₀: HR ≤ -Δ (traitement PIRE de Δ)
H₁: HR > -Δ (traitement NON-INFÉRIEUR)
```

**Points critiques**:
1. **Marge Δ**: Cliniquement pertinent maximum acceptable loss
   - Doit être prédéfini
   - Typ 15-20% loss tolerable
   
2. **Population**: DOIT être ITT (pas PP)
   - Protège marge
   - PP peut masquer infériorité vraie

3. **P-value**: Unilatéral (test > non-infériorité) vs bilatéral

**Formule NSN**:
```
Non-infériority threshold for superiority test différent
Utilisé formule unilatérale
```

**PIÈGE**: Non-infériorité est PAS absence supériorité
- Peut être non-inférieur et ne pas être supérieur
- Vs supériorité qui clame réellement mieux

---

## RÉSUMÉ: POINTS CLÉ PAR SECTION

### ✅ NSN - Ne PAS Oublier
- [ ] Alpha, Beta, Delta, Sigma
- [ ] Source des paramètres (littérature?)
- [ ] Dropout adjustment
- [ ] Comparaisons multiples (Bonferroni?)
- [ ] Effet cluster (ICC) si applicable
- [ ] ROUNDING: NSN doit être un entier, arrondir vers haut

### ✅ Mesures - Ne PAS Confondre
- [ ] OR ≈ RR seulement si maladie rare
- [ ] OR vient naturellement de cas-contrôle
- [ ] RR vient naturellement de cohorte
- [ ] HR suppose proportionalité sur temps
- [ ] Interaction multiplicative ≠ additive

### ✅ Tests - Vérifier Hypothèses
- [ ] T-test: normalité + homoscédasticité
- [ ] Wilcoxon: si doutes normalité
- [ ] Chi-carré: effectifs attendus ≥ 5
- [ ] Fisher: effectifs < 5
- [ ] Cox: proportional hazards
- [ ] Log-rank: simple, pas ajustement

### ✅ Designs - Reconnaître Avantages/Limites
- [ ] RCT: gold standard, mais limite pratique
- [ ] Cluster: nécessaire si intervention systémique
- [ ] Cohorte: relation temporelle, mais attrition
- [ ] Cas-contrôle: rapide, mais temporal ambiguous
- [ ] Transversale: snapshot, pas causalité
- [ ] Écologique: association groupe ≠ individu

### ✅ Biais - À Systématiquement Discuter
- [ ] Confounder: cause E et O, PAS sur chemin causal
- [ ] Médiateur: SUR le chemin, ne PAS ajuster
- [ ] Selection bias: procédure sélection associée outcome
- [ ] Information bias: erreur mesure différentielle
- [ ] Biais écologique: data agrégées biaisent inférence

### ✅ Analyse - Points Critiques
- [ ] ITT primary, PP sensibilité
- [ ] Complete case acceptable si RCT + peu perdus vue
- [ ] Multiply imputation pour MAR missing
- [ ] Stratification si cluster randomization
- [ ] Ajustement confounder, PAS médiateur

---

## CHECKLIST RÉDACTION EXAMEN

Quand vous répondez à une question, vérifiez:

- [ ] **NSN question**: Mentionné tous 6 paramètres + source + ajustements
- [ ] **Test stats**: Hypothèses vérifiées ET expliquées choix test
- [ ] **Association**: OR/RR/HR clairement labellisé + IC 95% + interprétation
- [ ] **Design**: Avantages ET inconvénients discutés
- [ ] **Biais**: Identifiés ET stratégies atténuation proposées
- [ ] **Limites**: Reconnaissance honest de faiblesse méthodologie
- [ ] **Conclusion**: Prudente ET justifiée par données

---

## RESSOURCES CLÉS CONSULTÉES
- Corrections 2019-2024 (6 ans données)
- Conceptualisations élèves problématiques récurrentes
- Critères notation: profondeur conceptuelle > calculs bruts

---

**DERNIÈRE MISE À JOUR**: Basé sur 6 années d'examen M2 Méthodologie
**VERSION**: 1.0 - Feuille de triche complète

*Bonne révision! 📊*
