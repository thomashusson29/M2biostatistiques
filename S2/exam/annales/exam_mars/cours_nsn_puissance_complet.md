# Cours complet : calcul du nombre de sujets nécessaires, puissance, et réponses aux annales

## Objectif du document

Ce document sert de **cours de référence** pour répondre à toutes les questions d’annales du dossier qui portent sur :

- le **calcul du nombre de sujets nécessaires** ;
- la **puissance statistique** ;
- les cas où un vrai NSN n’est pas calculable et où il faut raisonner en **précision**, en **nombre d’événements**, ou en **critique méthodologique**.

L’idée centrale est simple :

- dans un essai planifié, on calcule un **NSN a priori** ;
- dans une étude déjà faite, on peut parfois seulement discuter la **puissance a posteriori** ou, mieux, la **précision** ;
- dans les études observationnelles, la vraie question est souvent moins “la puissance” que la **largeur des IC**, le **nombre d’événements**, et le **risque de biais**.

## 1. Commencer par reconnaître le type de question

Avant de calculer quoi que ce soit, il faut classer la question dans une des catégories suivantes.

### A. Vrai calcul de NSN prospectif

C’est le cas typique des essais randomisés.

Indices dans l’énoncé :

- « combien de sujets faut-il inclure ? »
- « retrouvez le nombre de sujets nécessaires »
- « si l’essai avait randomisé des sujets et non des clusters »
- « hypothèse de non-infériorité »
- « log-rank », « relapse-free », « nombre d’événements »

Exemples d’annales :

- 2020 RC
- 2021 RC
- 2022 RC
- 2023 RC
- 2024 RC
- 2025 RC
- 2012 RC

### B. Discussion de puissance a posteriori

Ici, l’étude est déjà réalisée, souvent observationnelle, et la question demande un raisonnement après coup.

Indices dans l’énoncé :

- « calculez une puissance a posteriori »
- « le faible nombre d’événements a limité la puissance »
- « comment discuter la puissance dans une telle étude ? »

Exemples d’annales :

- 2011 EPI
- 2012 EPI
- 2013 EPI
- 2014 EPI
- 2016 EPI
- 2019 EPI

### C. Critique méthodologique autour du NSN

Ici, on ne vous demande pas un calcul pur, mais une discussion sur :

- les **perdus de vue** ;
- l’**ITT** ;
- la **multiplicité** ;
- l’**ICC** ;
- le **design effect** ;
- la différence entre **co-primary endpoint** et **composite endpoint**.

Exemples :

- 2011 RC
- 2020 RC
- 2023 RC

## 2. Les paramètres qu’il faut toujours rechercher

Un bon calcul de NSN repose presque toujours sur les mêmes briques.

| Paramètre | Symbole | Question à se poser |
|---|---|---|
| Risque de première espèce | `alpha` | Quel faux positif accepte-t-on ? |
| Risque de deuxième espèce | `beta` | Quel faux négatif accepte-t-on ? |
| Puissance | `1 - beta` | Quelle probabilité veut-on de détecter l’effet s’il existe ? |
| Différence minimale pertinente | `delta` | Quel effet veut-on détecter ? |
| Variabilité | `sigma`, `p(1-p)`, taux d’événements | Quelle dispersion ou quelle fréquence de base ? |
| Allocation | `r`, `p` | 1:1 ? 2:1 ? 3 bras ? cluster ? |
| Durée et recrutement | accrual/follow-up | Très important en survie |
| Pertes prévues | dropout | Faut-il gonfler l’effectif ? |
| Multiplicité | `alpha` ajusté | Plusieurs comparaisons ? plusieurs critères ? |
| Structure de corrélation | `ICC`, `rho`, dispersion | Cluster ? co-primary ? comptages ? |

En pratique, en examen, on écrit presque toujours une phrase du type :

> Pour calculer un NSN, il me faut au minimum un alpha, une puissance, une taille d’effet cliniquement pertinente, et une mesure de la variabilité ou du risque de base.

## 3. Les valeurs usuelles à connaître par cœur

| Situation | Valeur de `z` |
|---|---|
| `alpha = 0,05` bilatéral | `1,96` |
| `alpha = 0,05` unilatéral | `1,645` |
| `alpha = 0,025` unilatéral | `1,96` |
| puissance 80% | `0,84` |
| puissance 85% | `1,04` environ |
| puissance 90% | `1,28` |

À savoir dire en toutes lettres :

- `alpha` contrôle le risque de faux positif ;
- `beta` contrôle le risque de faux négatif ;
- la puissance est `1 - beta` ;
- `delta` doit être **cliniquement** et pas seulement statistiquement pertinent.

## 4. Les formules de base

## 4.1. Comparaison de deux moyennes

Si on compare deux groupes indépendants, variance commune, allocation 1:1 :

```text
n par bras = 2 * (z_(1-alpha/2) + z_(1-beta))^2 * sigma^2 / delta^2
```

Où :

- `sigma` = écart-type attendu ;
- `delta` = différence minimale pertinente.

Cette formule est utile quand le critère principal est continu.

Exemple d’annale proche :

- 2023 RC utilise explicitement une forme de cette logique avec `sigma = 90` et `delta = 60`.

## 4.2. Comparaison de deux proportions

Formule standard, deux bras, allocation 1:1 :

```text
n par bras =
[ z_(1-alpha/2) * sqrt(2 * pbar * (1-pbar))
  + z_(1-beta) * sqrt(p1*(1-p1) + p2*(1-p2)) ]^2
/ (p1 - p2)^2
```

avec :

- `p1` = risque attendu dans le groupe contrôle ;
- `p2` = risque attendu dans le groupe intervention ;
- `pbar = (p1 + p2)/2`.

Exemple utile :

- 2021 RC : contrôle 60%, intervention 30%, donc différence absolue 30 points.

## 4.3. Essais de survie : log-rank / Cox

Ici, le plus important est souvent le **nombre d’événements requis**, pas seulement le nombre de sujets.

Formule type de Schoenfeld :

```text
D = (z_(1-alpha/2) + z_(1-beta))^2 / [ p*(1-p) * (log(HR))^2 ]
```

où :

- `D` = nombre d’événements nécessaires ;
- `p` = proportion allouée à un groupe (`0,5` si allocation 1:1) ;
- `HR` = hazard ratio visé.

Ensuite, on convertit `D` en nombre de sujets à partir :

- du taux d’événements attendu ;
- de la durée de recrutement ;
- de la durée de suivi ;
- des pertes de vue.

Exemples d’annales :

- 2012 RC
- 2025 RC

Point clé :

- si l’article dit “event-driven trial”, il faut commenter le **nombre d’événements** avant même de parler du nombre de sujets.

## 5. Les ajustements qu’il ne faut jamais oublier

## 5.1. Pertes de vue et abandons

Si l’on prévoit un taux de pertes `q`, on gonfle l’effectif :

```text
n ajusté = n calculé / (1 - q)
```

Exemple :

- si `n = 100` par bras et `q = 15%`, alors `n ajusté = 100 / 0,85 = 117,6`, donc `118` par bras.

Piège fondamental :

- **arrêt du traitement** n’est pas synonyme de **perte de vue** ;
- en ITT, un sujet qui arrête le traitement reste analysable si son critère principal continue d’être recueilli.

C’est exactement le point méthodologique de 2011 RC.

## 5.2. Cluster randomization

Quand l’unité de randomisation est le centre, l’école, le cabinet, le service, etc., les individus d’un même cluster se ressemblent davantage entre eux. Il faut donc corriger par le **design effect** :

```text
DE = 1 + (m - 1) * ICC
```

où :

- `m` = taille moyenne des clusters ;
- `ICC` = coefficient de corrélation intra-cluster.

Puis :

```text
n cluster-ajusté = n individuel * DE
```

Exemple de logique :

- 2021 RC demande ce qu’aurait été le NSN si l’essai avait randomisé des sujets individuellement ;
- 2023 RC fait exactement ce cheminement : calcul individuel, puis inflation liée au design.

## 5.3. Plusieurs bras ou plusieurs comparaisons

Deux problèmes différents peuvent se poser.

Premier problème :

- il faut parfois calculer un `n` **par comparaison**, puis multiplier par le nombre de bras.

Deuxième problème :

- il peut falloir ajuster `alpha` pour la multiplicité.

Bon réflexe d’examen :

- demander s’il y a plusieurs bras ;
- demander si le critère principal repose sur plusieurs tests ;
- demander si l’on compare chaque bras au placebo ;
- demander si l’alpha a été corrigé.

Exemple :

- 2023 RC : trois bras, donc on passe d’un `n` individuel d’environ 50 à 150 avant majoration pour pertes.

## 5.4. Co-primary endpoints

Ne pas confondre :

- **critère composite** : un seul critère “global”, souvent positif si un des composants survient ;
- **co-primary endpoints** : plusieurs critères principaux, chacun ayant son importance propre.

Dans certaines situations, pour considérer le traitement efficace, il faut que **tous** les co-critères soient significatifs. Cela change fortement le calcul.

Conséquences :

- le NSN augmente ;
- la corrélation entre critères devient importante ;
- il faut parfois utiliser une méthode ou un logiciel dédié.

Exemple central :

- 2020 RC.

Le message à dire :

> Si les trois endpoints étaient indépendants, le coût en sujets serait plus élevé. S’ils sont corrélés, le NSN est moindre que dans le pire des cas, mais reste plus grand que pour un critère unique.

## 5.5. Comparaisons multiples et alpha

Quand on fait plusieurs tests, le risque global de faux positif augmente.

Réponse standard :

```text
alpha ajusté = alpha / m
```

où `m` est le nombre de comparaisons.

C’est la correction de Bonferroni. Elle est simple, souvent acceptable en examen, mais parfois un peu conservatrice.

Exemples où il faut y penser :

- 2020 RC
- 2023 RC
- 2022 RC

## 5.6. Surdispersion et modèle binomial négatif

Quand on travaille sur des **comptages** et que la variance dépasse la moyenne, un modèle de Poisson est trop optimiste. Il faut une correction pour la **surdispersion**, souvent via un modèle binomial négatif.

Conséquence :

- le NSN augmente par rapport à un calcul Poisson naïf.

À dire en examen :

- il faut `alpha`, `beta`, un effet cliniquement pertinent, un taux d’événements de base, une durée de suivi, et un paramètre de surdispersion ;
- sans ce paramètre, on ne peut pas reconstruire exactement le calcul.

Exemple :

- 2022 RC.

## 5.7. Non-infériorité

Ici, la question n’est pas “le traitement est-il meilleur ?” mais “est-il **pas trop pire** qu’un comparateur de référence ?”.

Il faut alors :

- une **marge de non-infériorité** ;
- souvent un **alpha unilatéral** ;
- une hypothèse sur le risque dans chaque groupe ;
- parfois un raisonnement sur une différence de proportions ;
- parfois un raisonnement en temps jusqu’à événement.

Point capital :

- la marge doit être **cliniquement justifiée**, pas choisie au hasard.

Exemple :

- 2024 RC.

## 5.8. Essais event-driven

Certains essais sont planifiés non pas sur un nombre fixe de sujets, mais sur un nombre d’événements attendus.

Dans ce cas :

- on fixe `D` événements ;
- puis on déduit un nombre approximatif de sujets ;
- l’effectif dépend alors beaucoup du recrutement, du suivi et du taux d’événements réel.

Exemples :

- 2012 RC
- 2025 RC

## 6. Quand le NSN classique n’est pas la bonne réponse

## 6.1. Cohortes observationnelles très grandes

Dans une énorme cohorte, parler de “manque de puissance” n’a souvent plus beaucoup de sens pour l’effet principal.

Il faut alors privilégier :

- le nombre d’événements ;
- la largeur des IC95% ;
- le biais de confusion ;
- la plausibilité causale.

Exemples :

- 2014 EPI
- 2019 EPI

Réponse-type :

> Avec des dizaines de milliers de sujets et des milliers d’événements, la puissance pour le critère principal est très élevée. La vraie limite n’est pas la puissance mais la validité de l’interprétation causale.

## 6.2. Peu d’événements

Là, au contraire, il faut dire que la puissance est limitée, même si l’effectif brut semble grand.

Exemple :

- 2012 EPI : énorme cohorte, mais très peu d’événements chez les exposés actuels.

La phrase attendue :

> Ce n’est pas le nombre total de sujets qui manque, c’est le nombre d’événements informatifs dans le groupe pertinent.

## 6.3. Étude transversale sans hypothèse principale unique

Dans ce cas, un NSN a posteriori est souvent artificiel.

Il faut plutôt discuter :

- la précision d’une proportion ;
- la stabilité d’un modèle multivarié ;
- la faisabilité ;
- la représentativité.

Exemple :

- 2013 EPI.

## 6.4. Cohorte historique ou analyses de tendances

Dans une cohorte sur plusieurs décennies, la puissance n’est pas la même partout :

- elle peut être bonne globalement ;
- mais limitée dans les premières périodes ou certains sous-groupes.

Exemple :

- 2016 EPI.

## 7. Comment faire un calcul “a posteriori” si l’examinateur l’exige

Ce n’est pas idéal, mais on peut proposer un calcul grossier.

## 7.1. À partir d’un estimateur et de son IC95%

Si on a un `HR`, `RR` ou `OR` avec IC95%, on peut récupérer une erreur standard.

Pour un hazard ratio :

```text
SE(log(HR)) ≈ [log(borne haute) - log(borne basse)] / 3,92
```

Puis :

```text
z ≈ |log(HR)| / SE(log(HR))
```

Et, très grossièrement, avec `alpha = 0,05` bilatéral :

```text
puissance observée ≈ Phi(z - 1,96)
```

Cette méthode est approximative, mais suffisante en examen pour dire :

- puissance très faible ;
- puissance intermédiaire ;
- puissance très élevée.

## 7.2. Mieux encore : raisonner en précision

En général, une bonne copie dit plutôt :

- “la puissance a posteriori est discutable” ;
- “l’IC95% est plus informatif” ;
- “cet IC95% exclut / n’exclut pas un effet cliniquement pertinent”.

Exemple :

- 2012 EPI : l’IC95% monte jusqu’à 1,85, donc on n’exclut pas un sur-risque important.

## 8. Où regarder dans un article pour retrouver le NSN

Quand on vous donne un article et qu’on vous demande de retrouver le NSN, chercher dans cet ordre :

1. `Methods`
2. `Statistical analysis`
3. `Sample size calculation`
4. protocole ou supplément
5. abstract si les méthodes détaillées sont pauvres

Les mots-clés à repérer :

- sample size
- power
- alpha
- beta
- log-rank
- hazard ratio
- expected event rate
- dropout
- non-inferiority margin
- ICC
- cluster
- co-primary
- overdispersion

## 9. Comment rédiger une réponse d’examen complète

Quand une question de NSN tombe, votre réponse doit suivre une logique stable.

### Trame universelle

1. Dire quel **type de calcul** convient.
2. Lister les **paramètres nécessaires**.
3. Dire ceux que l’article **fournit réellement**.
4. Faire le **calcul** si possible.
5. Ajouter les **ajustements** nécessaires.
6. Conclure avec un **nombre final arrondi vers le haut**.
7. Si le calcul exact est impossible, donner un **ordre de grandeur** et expliquer pourquoi.

### Phrase modèle

> Le calcul exact n’est pas entièrement reconstructible car il manque [paramètre], mais on peut retrouver la logique : les auteurs supposent [effet], avec [alpha], [puissance], [taux de base], [durée], [dropout], ce qui conduit à un effectif d’environ [ordre de grandeur].

## 10. Traduction directe pour chaque annale

## 2011 EPI

Question-clé :

- puissance a posteriori dans une étude quasi-expérimentale de dépistage.

Ce qu’il faut dire :

- post hoc power discutable ;
- effet brut très significatif, donc puissance élevée ;
- effet net attribuable au dépistage plus faible et non significatif, donc puissance modeste ;
- l’IC95% est plus utile que la puissance observée.

## 2011 RC

Question-clé :

- ITT + inflation du NSN pour perdus de vue.

Ce qu’il faut dire :

- ne pas confondre arrêt de traitement et vraie perte de suivi ;
- en ITT, on garde les randomisés ;
- l’inflation pour pertes de vue est légitime seulement si le critère principal devient manquant ;
- ici le suivi des événements a été maintenu, donc majoration surtout conservatrice.

## 2012 EPI

Question-clé :

- faible nombre d’événements malgré une grande cohorte.

Ce qu’il faut dire :

- très peu d’événements chez les exposés ;
- IC95% très large ;
- puissance faible pour des effets modérés ;
- l’étude ne peut pas exclure proprement un sur-risque important.

## 2012 RC

Question-clé :

- essai event-driven.

Ce qu’il faut dire :

- cible principale = 800 événements ;
- puissance 85% ;
- alpha unilatéral 2,5% ;
- effet visé = réduction de 25% ;
- ordre de grandeur du NSN = environ 3500 randomisés.

## 2013 EPI

Question-clé :

- pas de NSN classique, étude transversale.

Ce qu’il faut dire :

- faisabilité plutôt que vrai calcul a priori ;
- minimum 25 sujets par site ;
- total 1082 ;
- raisonner en précision des proportions et stabilité du modèle.

## 2014 EPI

Question-clé :

- énorme cohorte, très grand nombre d’événements.

Ce qu’il faut dire :

- puissance très élevée ;
- l’enjeu n’est pas la puissance mais la confusion et le biais ;
- si on insiste, la puissance a posteriori est quasi 100% pour l’association principale.

## 2016 EPI

Question-clé :

- cohorte historique avec tendances sur plusieurs décennies.

Ce qu’il faut dire :

- pas de NSN classique ;
- raisonner via nombre d’événements et largeur des IC ;
- puissance correcte globalement ;
- limitée pour certaines périodes anciennes et certains sous-groupes.

## 2019 EPI

Question-clé :

- cohorte immense.

Ce qu’il faut dire :

- aucun vrai problème de puissance ;
- intérêt des IC95% plus que des p-values ;
- l’effet et sa précision sont plus importants que le test.

## 2020 RC

Question-clé :

- co-primary endpoints et corrélation.

Ce qu’il faut dire :

- un critère multiple demande plus de sujets qu’un critère unique ;
- la corrélation entre endpoints modifie le calcul ;
- si tous les critères doivent être positifs, risque de perte de puissance ;
- logiciel dédié possible.

## 2021 RC

Question-clé :

- essai qui aurait été individuel plutôt que cluster.

Ce qu’il faut dire :

- partir de `p1` et `p2` ;
- calculer un NSN standard individuel ;
- on obtient un peu moins de 50 par bras dans la correction ;
- ensuite discuter pourquoi le cluster augmente l’effectif nécessaire.

## 2022 RC

Question-clé :

- comptages et binomial négatif.

Ce qu’il faut dire :

- pas de calcul exact sans hypothèses supplémentaires ;
- il faut alpha, beta, différence pertinente, taux/variance ;
- il faut aussi un paramètre de surdispersion ;
- le NSN est plus grand qu’en Poisson simple.

## 2023 RC

Question-clé :

- calcul individuel, puis inflation.

Ce qu’il faut dire :

- calcul standard continu : environ 48, arrondi 50 ;
- multiplier par 3 bras = 150 ;
- majorer de 30% = environ 200 ;
- la multiplicité existe mais son impact est ici secondaire dans la correction proposée.

## 2024 RC

Question-clé :

- non-infériorité sur proportion d’événements.

Ce qu’il faut dire :

- identifier le risque de base et la marge acceptable ;
- utiliser un alpha adapté à la non-infériorité ;
- le calcul de la correction retrouve environ 360 sujets au total.

## 2025 RC

Question-clé :

- log-rank avec hypothèses explicitement données.

Ce qu’il faut dire :

- test du log-rank bilatéral ;
- 48 mois d’étude, 36 mois de recrutement ;
- 12% de dropouts ;
- patients sans rechute : 50% vers 70% ;
- alpha 5%, puissance 80% ;
- résultat : 300 sujets, 150 par bras.

## 11. Pièges classiques à citer si vous voulez des points

1. Ne jamais confondre **abandon de traitement** et **perte de suivi**.
2. Toujours préciser si l’on parle d’un **NSN a priori** ou d’une **puissance a posteriori**.
3. Dans les cohortes, ne pas répondre trop vite “pas de puissance” ou “manque de puissance” sans regarder le **nombre d’événements**.
4. En cluster randomization, ne pas oublier l’**ICC**.
5. En non-infériorité, ne pas oublier la **marge** et le caractère souvent **unilatéral** du test.
6. En co-primary endpoints, ne pas raisonner comme pour un critère composite simple.
7. En présence de surdispersion, un calcul Poisson naïf **sous-estime** souvent l’effectif nécessaire.
8. Si le calcul exact est impossible, un **ordre de grandeur argumenté** vaut mieux qu’un faux calcul précis.

## 12. Mini-checklist à réciter le jour de l’examen

- Quel est le design ?
- Le critère principal est-il continu, binaire, en temps jusqu’à événement, ou en comptage ?
- Ai-je `alpha` et la puissance ?
- Ai-je l’effet attendu (`delta`, `HR`, `p1/p2`) ?
- Ai-je la variabilité ou le taux de base ?
- Faut-il corriger pour dropout ?
- Faut-il corriger pour cluster, multiplicité, surdispersion, ou co-primary endpoints ?
- Si c’est observationnel, faut-il plutôt parler de précision que de NSN ?

## 13. Conclusion pratique

Pour réussir les questions d’annales sur ce thème, il faut retenir trois réflexes.

Premier réflexe :

- commencer par identifier **le bon cadre** : NSN prospectif, event-driven, post hoc power, ou simple discussion de précision.

Deuxième réflexe :

- citer explicitement les paramètres du calcul : `alpha`, `beta`, effet attendu, variabilité, risque de base, suivi, pertes, et ajustements.

Troisième réflexe :

- si le calcul exact n’est pas possible, ne pas paniquer : expliquer **pourquoi**, donner un **ordre de grandeur**, et montrer que l’on comprend la **logique méthodologique**.

Si ces trois réflexes sont présents, vous pouvez traiter correctement toutes les variantes rencontrées dans les annales du dossier.
