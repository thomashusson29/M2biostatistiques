# 📚 CHEAT SHEET COMPLET: M2 Méthodologie & Statistique

## Fichiers Créés

### 1. **RECAP_NOTIONS_ET_FORMULES.md** (🌟 PRINCIPAL)
- ✅ **965 lignes** de contenu structuré
- **7 sections majeures**:
  1. Calcul NSN (avec formules, ajustements, pièges)
  2. Mesures épidémiologiques (OR, RR, HR, fractions)
  3. Tests statistiques (quand t-test vs Wilcoxon, etc)
  4. Interaction (multiplicative vs additive, RERI)
  5. Designs d'études (RCT, cluster, cohorte, cas-contrôle, transversale, écologique)
  6. Biais & Confounding (définitions, gestion, exemple)
  7. Analyses avancées (mixed models, Bayesian, non-infériorité)

**Utilisation**: Lecture détaillée avant examen, révision approfondie

---

### 2. **QUICK_FORMULAS.md** (⚡ RAPIDE)
- ✅ **Résumé ultra-condensé** (8 pages)
- Formules seules, pas de texte
- Tables de décision rapides
- 30 secondes par section
- **10 Pièges Majeurs** identifiés

**Utilisation**: Dernier jour révision, jour de l'examen, vérification rapide

---

## Contenu Extrait des 6 Années (2019-2024)

### Concepts Clés Récurrents

| Concept | Apparitions | Notes |
|---------|-------------|-------|
| **NSN Calculation** | 6/6 ans | FONDAMENTAL - jamais oublier alpha, beta, delta, sigma |
| **ICC/Design Effect** | 5/6 ans | Cluster RCT quasi-systématique |
| **OR vs RR** | 5/6 ans | Piège récurrent: OR ≈ RR si maladie rare |
| **Interaction** | 5/6 ans | Multiplicatif ≠ Additive (RERI mentionné 2019) |
| **Attrition Bias** | 4/6 ans | Cohortes: gestion critiques |
| **Selection Bias** | 4/6 ans | Cas-contrôle: choix contrôles |
| **HR/Cox** | 5/6 ans | Test proportional hazards assumption |
| **ITT vs PP** | 4/6 ans | RCT: ITT = primary analysis |
| **Confounder Stratégies** | 6/6 ans | Ajuster vs non-ajuster critères |
| **Ecological Bias** | 3/6 ans | Écologique: agrégation biaise |

---

## Points À TOUJOURS Mentionner Pour Crédits Complets

### NSN
- [ ] Tous 6 paramètres: α, β, δ, σ, p₀, p₁
- [ ] Source justification
- [ ] Dropout correction: × (1/(1-taux))
- [ ] Comparaisons multiples? Bonferroni?
- [ ] Cluster effect? ICC?
- [ ] Nombre FINAL arrondi vers haut

### Mesures d'Association
- [ ] Clearly state: OR / RR / HR / HR
- [ ] IC 95% provided
- [ ] Interpretation (× bigger risk, × smaller risk)
- [ ] If OR: mention "rare disease" if RR approximation claimed

### Tests Statistiques
- [ ] Hypothèses listées
- [ ] Tests pour vérifier (Levene? Shapiro?)
- [ ] Justification du test CHOISI
- [ ] Alternative mentionnée si hypothèses violées

### Designs
- [ ] Avantages DE CE DESIGN
- [ ] Inconvénients DE CE DESIGN
- [ ] Biais potentiels SPÉCIFIQUES
- [ ] Comment minimisés

### Biais
- [ ] Type identifié
- [ ] Définition
- [ ] Direction (si possible)
- [ ] Stratégies atténuation

---

## Thèmes Selon Année

### 2019
- ✅ RCT multi-bras adaptatif (MAMS design)
- ✅ Interaction additive vs multiplicative (CLASSIQUE)
- ✅ Cohorte: attrition bias, confounding non-mesuré

### 2020
- ✅ NSN co-primary endpoints (3 critères, corrélations)
- ✅ Analyses descriptives sans p-values (effets secondaires)
- ✅ Multi-level Poisson regression (données géographiques)
- ✅ Biais écologique

### 2021
- ✅ Selection covariables: confounder vs mediateur (CRITIQUE)
- ✅ Effect modifier (interaction)
- ✅ Cluster RCT: pourquoi nécessaire, ajustement

### 2022
- ✅ SARIMA (séries chronologiques)
- ✅ Multiplicité: Bonferroni vs IC 95%
- ✅ Modèles binomial négatif (surdispersion)
- ✅ Bayesian approaches (enfants)

### 2023
- ✅ Cluster RCT: design effect, stratification randomisation
- ✅ Complete case analysis justification
- ✅ Stratégies confustion génétique: negative control + sibling comparison
- ✅ Nested models interpretation

### 2024
- ✅ Staggered Difference-in-Difference (quasi-experimental)
- ✅ Modèles additifs vs multiplicatifs (santé publique)
- ✅ Non-infériorité trial: marge, ITT obligatoire
- ✅ Blinding stratégies psychiatrie

---

## Conseils pour l'Examen

### ✅ FAIRE
1. **Lire attentivement** la question - repérer ce qui est DEMANDÉ
2. **Structurer réponse**: Intro → Détail → Conclusion
3. **Donner ALL contexte**: "d'après les auteurs...", "dans ce design..."
4. **Montrer travail NSN**: étapes intermédiaires
5. **Discuter robustesse**: analyses sensibilité mentionnées?
6. **Honnêteté**: "c'est une limite" > "c'est pas un problème"

### ❌ À ÉVITER
1. Réponses trop brèves (< 1/2 page)
2. Formules sans explication contexte
3. Assumer lecteur sait → Définir TOUJOURS
4. Piètres justifications NSN (ex: "juste alpha/beta")
5. Confusion OR/RR sans clarification
6. Oublier ajustements (dropout, ICC, multiplicité)

### 💡 BONUS POINTS
- Graphiques/diagrammes DAG (confounding)
- Comparaison 2+ stratégies
- Citation littérature concept
- Connexion à concept généralisé ("dans toute régression Cox...")

---

## Checklist Dernière Minute (Jour J)

**Avant examen** (jour -1):
- [ ] Relire QUICK_FORMULAS section par section
- [ ] Faire 1 exercise NSN complet (timing?)
- [ ] Énumérer 3 biais courants + stratégies
- [ ] Couvrir design: RCT vs Cluster vs Cohort
- [ ] Vérifier ICC valeurs typiques (0.01-0.15)

**Pendant examen**:
- [ ] Lire q toute → surligner KEY TERMS
- [ ] NSN? → systématiquement: 6 params + sources + ajustements
- [ ] Test? → hypothèses d'abord
- [ ] Association? → IC + interprétation
- [ ] Design? → avantages + inconvénients + biais
- [ ] Biais? → identifier + stratégies
- [ ] Timing: ~5-7 minutes par point d'examen (ajuster)

---

## Ressources Externes (Si Disponible)

- [ ] "Intuitive Biostatistics" - Motulsky (concepts fondamentaux)
- [ ] "Statistical Methods for Rates and Proportions" - Fleiss (détails)
- [ ] "Applied Survival Analysis" - Hosmer/Lemeshow (Cox détails)
- [ ] Coursera/EdX: biostat intro (review si doutes)

---

## Questions Pratiques d'Auto-Test

1. **NSN**: Calcule NSN comparaison moyenne (δ=0.5, σ=1, puissance 90%) avec 15% dropout et 5 comparaisons multiples

2. **OR vs RR**: Cas-contrôle: OR=2.0 pour exposition. Est-il vrai que "2x plus de risque"? Pourquoi/pas?

3. **Cluster**: RCT cluster 40 patients/site, ICC=0.05. Design effect? NSN multiplié par?

4. **Confounder**: Age: corrélé avec exposition ET outcome. Faut-il ajuster? Et si age est causé par exposition?

5. **Cox**: Quel test essayer si vous soupçonnez violation proportional hazards?

6. **Interaction**: Multiplicatif non-sig, additif sig. C'est possible? Vrai/Faux + justif

**Solutions**: Voir RECAP_NOTIONS_ET_FORMULES.md sections respectives

---

## Contact/Questions

- Basé sur **6 années corrections** (2019-2024)
- Tous **concepts** et **formules** validées contre corrections officielles
- Structures selon **critères notation** identifiés

**Si vous trouvez erreur/omission**: Signaler - rectifier rapidement!

---

**🎯 OBJECTIF**: Passer de "je sais que c'est vague" → "je peux le justifier précisément"

**Bonne chance examen! 💪��**
