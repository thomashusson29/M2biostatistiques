# QUICK FORMULAS - Cheat Sheet Ultra-Condensée

## NSN (Nombre de Sujets Nécessaires)

### Moyennes (continues):
```
NSN = 2 × [(z_α + z_β)² × σ²] / δ²
z_α = 1.96 (α=0.05, bilatéral)
z_β = 1.28 (β=0.10, puissance 90%) ou 0.84 (puissance 80%)
```
**PUIS multiplier par (1-dropout)/(1)**

### Proportions (binaires):
```
NSN = [(z_α + z_β)² × (p₀(1-p₀) + p₁(1-p₁))] / (p₀ - p₁)²
```

### Cluster RCT (IMPORTANT!):
```
NSN_cluster = NSN_brut × [1 + (m-1) × ICC]
m = taille cluster
ICC = corrélation intra-cluster (0.01-0.15 typique)
```

---

## Mesures d'Association

### Odds Ratio (OR)
```
OR = (a×d)/(b×c)    [depuis tableau 2×2]

IC95%: exp(ln(OR) ± 1.96 × √(1/a + 1/b + 1/c + 1/d))
```

### Risque Relatif (RR)
```
RR = Risk_expo / Risk_non_expo = [a/(a+b)] / [c/(c+d)]

IC95%: exp(ln(RR) ± 1.96 × √(1/a - 1/(a+b) + 1/c - 1/(c+d)))
```

### Hazard Ratio (HR) - Modèles de survie
```
HR = λ_expo / λ_non_expo  (taux instantané)
Interprétation: similaire à RR mais pour données de temps
Hypothèse critique: PROPORTIONAL HAZARDS sur tout le suivi
```

### Fraction Attribuable chez exposés
```
AF_e = (RR - 1) / RR = (p₁ - p₀) / p₁
Interprétation: % du risque chez exposés dû à l'exposition
```

### Fraction Attribuable Population
```
AF_pop = [P_e × (RR-1)] / [P_e × (RR-1) + 1]
P_e = prévalence exposition
Interprétation: % du risque dans la pop si on enlevait exposition
```

---

## Interaction Additive (RERI)

```
RERI = RR(A+B+) - RR(A+B-) - RR(A-B+) + 1

RERI > 0  → Synergie (plus qu'additif)
RERI = 0  → Additivité strict
RERI < 0  → Antagonisme

Proportion: AP = RERI / RR(A+B+)
```

---

## Tests Statistiques - Quand Les Utiliser

| Données | 2 groupes | >2 groupes | Condition |
|---------|-----------|-----------|-----------|
| **Continues** | T-test (normal) | ANOVA | Normalité + égal variances |
| **Continues** | Wilcoxon | Kruskal-Wallis | Non-normal OU outliers |
| **Binaire** | Chi-carré | Chi-carré | Effectifs ≥ 5 |
| **Binaire** | Fisher Exact | — | ≥1 effectif < 5 |
| **Survie** | Log-rank | — | Groupe simple |
| **Survie+covars** | Cox PH | — | Proportional Hazards |

### Chi-carré
```
χ² = Σ[(O - E)² / E]
E = (Ligne × Colonne) / N
```

---

## Design Effects & Corrections

### Cluster Effect (Design Effect)
```
DE = 1 + (m-1) × ICC
m = cluster size
ICC = intra-class correlation (0-1)
```

### Bonferroni (Multiple comparisons)
```
α_adjusted = α_original / nombre_tests
Exemple: 3 tests → α = 0.05/3 = 0.0167
```

### Complete Case vs ITT
```
ITT (Intention-To-Treat): Tous randomisés, même non-compliant
PP (Per-Protocol): Seulement ceux ayant suivi protocole

RCT: ITT = PRIMARY (conservatif)
Cluster RCT: Complete case souvent acceptable (justifier)
```

---

## Cox Proportional Hazards - Hypothèses

1. **Proportional Hazards**: HR constant dans le temps
   - Test: Interaction exposure × log(time) = NS
   - Graphique: log(-log(S)) vs log(time) → courbes parallèles

2. **Censure Non-Informative**: Perdus vue = même distrib que suivi

3. **Pas de ties**: Temps uniques (correction si beaucoup)

---

## Confounder vs Mediateur vs Effet Modifiant

### CONFOUNDER
- Cause E (exposition) ET O (outcome)
- PAS sur chemin causal E → O
- **Action**: AJUSTER (regression, stratification)
- **Résultat**: Association vraie après ajustement
- **Diagramme**: X ← E, X ← O, X → O

### MEDIATEUR  
- SUR le chemin causal E → O
- Explique le mécanisme
- **Action**: NE PAS AJUSTER (perd le signal)
- **Résultat**: Effet indirect estimé par ajustement
- **Diagramme**: E → X → O

### EFFECT MODIFIER (Interaction)
- Modifie l'ampleur de l'effet E → O
- Pas cause de E ni O
- **Action**: TESTER INTERACTION
- **Résultat**: Effets stratifiés par modificateur
- **Diagramme**: E → O, force dépend de X

---

## Biais Types - 30 secondes each

### Selection Bias
```
Procédure inclusion associée outcome
Exemple: Cases (hôpital) ≠ population générale
Direction: Imprévisible
Mitigation: Critères inclusion clairs, représentatif
```

### Information Bias (Measurement Error)
```
Non-différentiel: Atténue association (biase vers 0)
Différentiel: Direction imprévisible
Exemple: Recall bias en cas-contrôle
Mitigation: Instruments validés, standardisés
```

### Confounding
```
Voir section CONFOUNDER ci-dessus
Mitigation: Randomisation, stratification, ajustement
```

### Ecological Bias
```
Association au niveau groupe ≠ au niveau individu
Exemple: Migration + at level → Education (région), 
        mais migrants eux-mêmes moins éduqués
Mitigation: Data individuelles (cohorte vs registre)
```

### Attrition Bias (Cohort studies)
```
Perdus vue ≠ aléatoire → corrélé outcome
Mitigation: Faible taux attrition, analyse sensibilité
```

---

## Non-Inferiority Trial

```
H₀: HR ≤ -Δ  (pire que contrôle de Δ)
H₁: HR > -Δ  (non-inférieur)

Δ = marge non-infériorité (prédéfini)
   Typique: 15-20% perte tolérable
   DOIT être justifié cliniquement

Population: ITT OBLIGATOIRE (protège marge)
P-value: Unilatéral (1 côté)

Résultat: Non-inférieur ≠ Supérieur
```

---

## Bayesian Approaches

```
Quand pertinent:
- Petits essais (enfants)
- Réutilisation data antérieures (prior)
- Décisions adaptives
- Résultats rares

Prior + Vraisemblance → Posterior
IC: Probabilité posterieure directe (vs fréquentiste)
```

---

## Régression Multi-niveaux (Mixed Models)

```
Y_ij = β₀ + β₁X_ij + u_j + ε_ij

u_j = effet aléatoire niveau j (gère corrélation intra-groupe)
ε_ij = résidu niveau 1

Utilité: Données hiérarchiques
- Patients (i) au sein cliniques (j)
- Mesures répétées patient
- Clusters RCT
```

---

## Analyse Sensibilité - Checklist

- [ ] Retrait une variable à la fois
- [ ] Attrition: assumer 10%, 20%, 30% informative
- [ ] ITT vs Complete Case
- [ ] Inclure vs exclure outliers
- [ ] MCID ± 20%
- [ ] ICC variations si cluster

---

## Essai en Cluster RCT - Points Clés

```
Avantages:
✅ Intervention systémique (santé publique)
✅ Moins contamination inter-bras
✅ Plus facile logistiquement
✅ Ethical si intervention de groupe

Inconvénients:
❌ DOIT ajuster ICC (Design Effect)
❌ NSN très augmenté
❌ Peu clusters = biaisé
❌ Confondeurs cluster-level possible

Analyse:
DOIT inclure random effect cluster dans modèle
Régression mixte obligatoire
```

---

## Étude de Cohorte - Attrition Bias

```
Problème: Perdus vue NON aléatoires
          → Corrélé avec outcome réel

Exemple: Patients abandonnent car se sentent mieux
         → Sous-estime efficacité vraie

Gestion: 
- Modèle Cox: suppose censure non-informative (forte hypothèse)
- Analyse sensibilité: scénarios attrition
- Imputation multiple

Validation: Comparer perdus vue vs complétés
           Prédicteurs attrition?
```

---

## Confustion Génétique - Stratégies

```
1. Ajuster antécédents familiaux
2. Ajuster score génétique risque (si dispo)
3. Negative control: exposition non-causale 
   (même confounding génétique mais pas causal)
4. Sibling comparison: analyser fratrie
   (élimine confounding familial environnemental)

LIMITE: Jamais parfait, combinaisons souvent nécessaires
```

---

## Co-Primary Endpoints - NSN

```
Si 3 critères: TOUS doivent être signifiants
→ Risque α×α×α sans correction!

Solution: Utiliser corrélation si disponible
R package: mpe::power.known.var(K=3, rho=c(0.93,0.68,0.68),
                                 SD=c(2.73,2.58,0.92),
                                 delta=c(1,1,0.32), sig.level=0.025)

Résultat: NSN peut être plus petit que "indépendant"
          car corrélations positives aident
```

---

## Pièges Majeurs À Éviter

1. ❌ **NSN sans ICC cluster** → dramatiquement sous-estimé
2. ❌ **Confondre OR et RR** → interprétation fausse
3. ❌ **Ajuster sur médiateur** → perd le signal
4. ❌ **Pas de relation temporelle cas-contrôle** → causalité ambiguë
5. ❌ **Chi-carré effectifs < 5** → p-value faux, utiliser Fisher
6. ❌ **Cox sans vérifier proportionalité** → biais
7. ❌ **Interaction multiplicatif = additif** → faux, peuvent différer
8. ❌ **Ecological study → inférence individuelle** → biais écologique
9. ❌ **Complete case sans justifier** → sélection bias si RCT
10. ❌ **Non-infériorité en Per-Protocol** → non-protégé marge

---

**Version Ultra-Rapide: Imprimez, mettez en poche, 30 secondes par section! 📋**
