---
title: "QUARTO BIG NOTES"
format:
    pdf:
        toc: true
        toc-depth: 2
        number-sections: true
        mainfont: Ubuntu
        header-includes: |
            \usepackage{fontspec}
            \setmainfont{Ubuntu}
            \usepackage[dvipsnames]{xcolor}
            \definecolor{myblue}{rgb}{0.0078,0.0078,0.549}
            \definecolor{mygreen}{rgb}{0,0.2745,0}
            \definecolor{mybrown}{rgb}{0.392,0.094,0.094}
            \definecolor{mypurple}{rgb}{0.286,0,0.286}
            \usepackage{sectsty}
            \sectionfont{\color{black}\Large}
            \subsectionfont{\color{myblue}\large}
            \subsubsectionfont{\color{mygreen}\normalsize}
            % Assure une vraie hiérarchie (### vs ####) dans le PDF
            \setcounter{secnumdepth}{5}
            \setcounter{tocdepth}{5}
            % Avec KOMA-Script (scrartcl), éviter titlesec (incompatible) et
            % redéclarer paragraph/subparagraph pour qu'ils soient en "block".
            \RedeclareSectionCommand[
                beforeskip=1.5ex plus .5ex minus .2ex,
                afterskip=.6ex,
                font=\normalfont\small\bfseries\color{mybrown}
            ]{paragraph}
            \RedeclareSectionCommand[
                beforeskip=1.2ex plus .4ex minus .2ex,
                afterskip=.5ex,
                font=\normalfont\footnotesize\bfseries\color{mypurple}
            ]{subparagraph}
    html:
        toc: true
        toc-location: left
        toc-expand: true
        css: heading-colors.css
        include-after-body: markmap-link.html
        post-render:
            - "python3 post-render.py"
post-render:
    - "python3 post-render.py"
---


# Résumé statistique

## Position

### Moyenne

-   = centre de gravité des valeurs

-   suppose **équivalence de la quantité** : 1 euro voit 1 euro quelque soit sa position sur la droite des réels.

### Médiane

-   Partage la distribution en 2 parts égales

-   Si distribution symétrique : moyenne = médiane

### Mode

-   = Valeur la plus fréquente

## Dispersion

### Empan

-   = différence entre valeur minimale et valeur maximale

### Écart interquartile

-   = Q3 - Q1

### Variance

-   = Variance = moyenne des carrés des écarts à la moyenne

$$
\text{v} = \frac{(\text{ecart}_1 - \mu)² + (\text{ecart}_2 - \mu)² + \dots + (\text{ecart}_n - \mu)²}{\text{nombre d'observation}}
$$

### Écart type

-   = racine carrée de la variance

-   = racine carrée des carrés des écarts à la moyenne

-   Avantages variances et écarts types :

    -   Carrés : positive écarts négatifs et accentue écarts importants

    -   Variance de deux variables indépendantes est égales à la somme de leurs variances

    -   Dans le cas d'une distribution normale :

        -   2/3 des observations se situent dans un intervalle de ±1 écart type autour de la moyenne

        -   95% des observations se situent dans un intervalle de ±2 écart type autour de la moyenne

### Fonction R pour tout ça :

-   `summary()` donne la moyenne, médiane, min, max, 1er et 3e quartile

-   `describe()` pas mal de trucs aussi

## Dépendance, liaison et association

-   Définition de la dépendance : deux variables sont dépendantes si la connaissance de la valeur de l'une permet de mieux prédire la valeur de l'autre

-   Par exemple : taille et poids sont dépendantes (plus on est grand, plus on pèse lourd)

### Variables quantitatives

-   3 types de liaisons entre variables quantitatives :

    -   Dépendance : connaître X permet de mieux prédire Y

    -   Dépendance monotone : X et Y varient dans le même sens (croissant ou décroissant)

        -   Dépendance linéaire : relation de proportionnalité entre X et Y

        -   Corrélation linéaire (coefficient de corrélation linéaire de Pearson) = $\text{r}$ : mesure de la force de la dépendance linéaire entre X et Y

        -   Coefficient de détermination = variance partagée $\text{r}^2$ : proportion de la variance de Y expliquée par la variance de X dans une relation linéaire

    -   Concordance : X et Y varient dans le même sens mais pas forcément de façon linéaire

        -   Coefficient intraclasse : mesure de la concordance entre plusieurs mesures de la même variable

+-------------+-------------------------------------+--------------------+-----------------------------------------------------------------------------------------------------+
| **Mesure**  | **Paramètre**                       | **Symbole**        | **Interprétation**                                                                                  |
+-------------+-------------------------------------+--------------------+-----------------------------------------------------------------------------------------------------+
| Dépendance  | Coefficient de corrélation linéaire | r                  | Mesure la direction et la force de la dépendance linéaire entre deux variables quantitatives.       |
|             |                                     |                    |                                                                                                     |
|             |                                     |                    | Varie entre -1 et 1.                                                                                |
+-------------+-------------------------------------+--------------------+-----------------------------------------------------------------------------------------------------+
| Dépendance  | Coefficient de détermination        | r²                 | Mesure la proportion de la variance de Y expliquée par la variance de X dans une relation linéaire. |
|             |                                     |                    |                                                                                                     |
|             | = variance partagée                 |                    | Varie entre 0 et 1.                                                                                 |
+-------------+-------------------------------------+--------------------+-----------------------------------------------------------------------------------------------------+
| Concordance | Coefficient intraclasse             | ICC                | Mesure la concordance entre plusieurs mesures de la même variable.                                  |
|             |                                     |                    |                                                                                                     |
|             |                                     |                    | Varie entre 0 et 1.                                                                                 |
+-------------+-------------------------------------+--------------------+-----------------------------------------------------------------------------------------------------+
| *Autre*     | *Covariance*                        | Cov($\text{X, Y}$) | *Mesure comment deux variables varient ensemble (positive: ensemble ; négative : sens inverse)*     |
+-------------+-------------------------------------+--------------------+-----------------------------------------------------------------------------------------------------+

#### Dépendance entre variables quantitatives

-   Pas de paramètre estimant parfaitement la dépendance ou l'indépendance entre deux variables quantitatives

#### Dépendance monotone ou linéaire entre variables quantitatives

-   Mesure de la direction dépendance linéaire : coefficient de corrélation linéaire de Pearson ($\rho$ ou $\text{r}$)

    -   Varie entre -1 ($\text{X} et \text{Y}$ parfaitement négativement corrélées) et 1 ($\text{X} et \text{Y}$ parfaitement positivement corrélées)

    -   0 : pas de corrélation linéaire entre X et Y = indépendance linéaire

    -   **NB : le coefficient de corrélation ne mesure pas vraiment la force de la dépendance entre X et Y mais son type de dépendance !!** *en pratique, mesure un peu la force quand même mais il n'y a pas d'unité pour l'exprimer*

-   Mesure de la force de la dépendance linéaire : **coefficient de détermination** ($\text{r}^2$)

    -   Varie entre 0 (pas de dépendance) et 1 (dépendance parfaite)

    -   Indique la proportion de la variance de Y expliquée par la variance de X dans une relation linéaire

    -   Par exemple : $\text{r} = 0.8$ $\Rightarrow$ $\text{r}^2 = 0.64$ : 64% de la variance de Y est expliquée par la variance de X dans une relation linéaire (et ce n'est pas $\text{r}^2$ des valeurs de Y sont expliquées par X !!)

-   Petit tableau recapitulatif coéfficient de corrélation / variance partagée / covariane

+-------------------------------------+------------+-----------------------------------------------------------------------------------------------------+
| Paramètre                           | Symbole    | Interprétation                                                                                      |
+=====================================+============+=====================================================================================================+
| Coefficient de corrélation linéaire | r          | Mesure la direction et la force de la dépendance linéaire entre deux variables quantitatives.       |
|                                     |            |                                                                                                     |
|                                     |            | Varie entre -1 et 1.                                                                                |
+-------------------------------------+------------+-----------------------------------------------------------------------------------------------------+
| Coefficient de détermination        | r²         | Mesure la proportion de la variance de Y expliquée par la variance de X dans une relation linéaire. |
|                                     |            |                                                                                                     |
|                                     |            | Varie entre 0 et 1.                                                                                 |
+-------------------------------------+------------+-----------------------------------------------------------------------------------------------------+
| Covariance                          | Cov(X, Y)  | Mesure la tendance conjointe de deux variables à varier ensemble.                                   |
|                                     |            |                                                                                                     |
|                                     |            | Peut être positive, négative ou nulle.                                                              |
+-------------------------------------+------------+-----------------------------------------------------------------------------------------------------+

#### Concordance entre variables quantitatives

-   Mesure de la concordance entre variables quantitatives : **coefficient intraclasse** (ICC)

-   Varie entre 0 (pas de concordance) et 1 (concordance parfaite)

-   Indique la proportion de la variance totale attribuable à la variance entre les sujets

-   Calcul : $\text{ICC} = \frac{\text{variance entre sujets}}{\text{variance entre sujets + variance entre examinateurs + variance résiduelle}}$

    -   En gros : $\text{ICC} = \frac{\text{vrai signal}}{\text{vrai signal} + \text{bruit}}$

    -   Vaut 1 quand aucun bruit (variance examinateurs et résiduelle = 0); vaut 0 quand tout est bruit (variance entre sujets = 0)

    -   Par exemple : ICC = 0.75 : 75% de la variance totale est attribuable à la variance entre les sujets

-   ICC le plus classiquement utilisé : 2-way random effects, absolute agreement, single rater/measurement

### Variables catégorielles

#### Dépendance entre variables catégorielles

-   Mesure de la dépendance entre variables catégorielles : **chi-carré de Pearson** ($\chi^2$)

    -   Existe-t-il une association entre deux variables catégorielles ?

    -   Le *test du Chi-carré d'indépendance* permet de tester l'hypothèse nulle d'indépendance entre deux variables catégorielles, c'est à dire l'absence de relation entre elles.

    -   Méthode :

-   Pour évaluer la force de la relation : **transformation normalisée du chi-carré**

    -   **Coefficient phi** ($\phi$) :

        -   Utile surtout pour un tableau $2 \times 2$ (deux variables binaires)

        -   $|\phi| = \sqrt{\chi^2 / n}$ où $n$ = taille de l'échantillon

        -   Correspond à la corrélation de Pearson entre deux variables binaires codées 0/1 (version signée entre -1 et 1)

    -   **V de Cramér** ($V$) :

        -   Utile pour un tableau $r \times c$ (variables nominales, possiblement $> 2$ modalités)

        -   $V = \sqrt{\chi^2 / (n (k - 1))}$ avec $k = \min(r, c)$

        -   Varie entre 0 (pas d'association) et 1 (association parfaite)

    -   **Coefficient de contingence de Pearson** ($C$) :

        -   $C = \sqrt{\chi^2 / (\chi^2 + n)}$

        -   Utilisable pour des tableaux $r \times c$, mais l'échelle dépend de la taille du tableau : $C$ ne peut pas atteindre 1 et n'est pas directement comparable entre tableaux de dimensions différentes

        -   Varie entre 0 et $C_{max}$ avec $C_{max} = \sqrt{(k-1)/k}$ (donc $C<1$), où $k = \min(r, c)$

        -   Lien avec $\phi$ (cas $2 \times 2$) : $C$ est juste un re-calage de $|\phi|$ : $C = \frac{|\phi|}{\sqrt{1+\phi^2}}$ (donc même ordre/monotonie, mais valeurs plus “compressées”)

    -   **Coefficient de corrélation de Spearman** $\rho_s$ :

        -   Pour des variables **ordinales** (ou une relation **monotone** non linéaire entre deux quantitatives)

        -   = corrélation de Pearson calculée sur les rangs, varie entre -1 et 1

+-----------------------------------+---------------------------------------------+-------------------------------------------------------------------------------------------+
| **Mesure**                        | **Paramètre**                               | **Interprétation**                                                                        |
+===================================+=============================================+===========================================================================================+
| Dépendance                        | Chi-carré de Pearson                        | Mesure l'association entre deux variables catégorielles.                                  |
|                                   |                                             |                                                                                           |
|                                   |                                             | Valeur plus élevée indique une association plus forte.                                    |
+-----------------------------------+---------------------------------------------+-------------------------------------------------------------------------------------------+
| Dépendance (2 variables binaires) | Coefficient phi (φ)                         | Varie entre -1 et 1.                                                                      |
+-----------------------------------+---------------------------------------------+-------------------------------------------------------------------------------------------+
| Dépendance (variables nominales)  | V de Cramér (V)                             | Mesure la force de l'association entre deux variables nominales.                          |
|                                   |                                             |                                                                                           |
|                                   |                                             | Varie entre 0 et 1.                                                                       |
+-----------------------------------+---------------------------------------------+-------------------------------------------------------------------------------------------+
| Dépendance (variables nominales)  | Coefficient de contingence (C)              | Varie entre 0 et C_max (dépendant de la taille du tableau).                               |
+-----------------------------------+---------------------------------------------+-------------------------------------------------------------------------------------------+
| Dépendance (variables ordinales)  | Coefficient de corrélation de Spearman (ρs) | Mesure la force et la direction de l'association monotone entre deux variables ordinales. |
|                                   |                                             |                                                                                           |
|                                   |                                             | Varie entre -1 et 1.                                                                      |
+-----------------------------------+---------------------------------------------+-------------------------------------------------------------------------------------------+

#### Dépendance monotone

-   Uniquement pour des variables ordinales (ou une relation monotone non linéaire entre deux quantitatives)

-   Mesure de la dépendance monotone entre variables ordinales : **coefficient de corrélation de Spearman** ($\rho_s$)

    -   = corrélation de Pearson calculée sur les rangs

    -   Varie entre -1 (dépendance monotone négative parfaite) et 1 (dépendance monotone positive parfaite)

    -   0 : pas de dépendance monotone entre X et Y = indépendance monotone

#### Concordance entre variables catégorielles

-   Mesure de la concordance entre variables catégorielles : **kappa de Cohen** ($\kappa$)

    -   Pour deux évaluateurs classant des sujets dans des catégories (variables nominales ou ordinales)

    -   Varie entre -1 (désaccord parfait) et 1 (accord parfait)

    -   0 : accord équivalent au hasard

    -   $\kappa = \frac{\text{concordance observee } - \text{ concordance due au hasard}}{1\ - \text{ concordance due au hasard}}$

#### OR et RR pour variables binaires

Pour un tableau de contingence $2 \times 2$ :

+-------------------+-------------------+-------------------+
|                   | Événement présent | Événement absent  |
+===================+===================+===================+
| Groupe exposé     | a                 | b                 |
+-------------------+-------------------+-------------------+
| Groupe non exposé | c                 | d                 |
+-------------------+-------------------+-------------------+

-   **Odds Ratio (OR)** :

    -   Mesure la force de l'association entre deux variables binaires

    -   = (odds d'un événement dans le groupe exposé) / (odds d'un événement dans le groupe non exposé)

    -   = $\frac{a/b}{c/d} = \frac{a \times d}{b \times c}$

    -   Interprétation :

        -   OR = 1 : pas d'association entre exposition et événement

        -   OR \> 1 : exposition associée à une augmentation des odds de l'événement

        -   OR \< 1 : exposition associée à une diminution des odds de l'événement

    -   Attention 1 : les odds ne sont pas des probabilités !

    -   Attention 2 : pour des événements fréquents, l'OR peut surestimer la force de l'association par rapport au RR

-   **Risque relatif (RR)** :

    -   Mesure la force de l'association entre deux variables binaires

    -   = (risque d'un événement dans le groupe exposé) / (risque d'un événement dans le groupe non exposé)

    -   = $\frac{a/(a+b)}{c/(c+d)}$

    -   Interprétation :

        -   RR = 1 : pas d'association entre exposition et événement

        -   RR \> 1 : exposition associée à une augmentation du risque de l'événement

        -   RR \< 1 : exposition associée à une diminution du risque de l'événement

    -   Le RR est souvent plus intuitif que l'OR, surtout pour des événements fréquents

    -   Cependant, le RR ne peut être estimé directement que dans des études de cohorte ou essais cliniques, pas dans des études cas-témoins

-   Rapport entre OR et RR :

    -   Pour des événements rares (incidence \<= 10%), OR ≈ RR

    -   Pour des événements fréquents, OR peut diverger significativement de RR

#### Sensibilité et spécificité, VPP et VPN

-   Le kappa de Cohen mesure une **concordance globale et symétrique** entre deux évaluateurs, mais ne distingue pas les types d'erreurs (faux positifs vs faux négatifs)

-   Pour évaluer la performance d'un test diagnostique binaire, on utilise des mesures spécifiques :

    -   Sensibilité = proportion de vrais positifs parmi les cas positifs réels = $\text{P}(\text{Y} = 1 | \text{X} = 1)$

    -   Spécificité = proportion de vrais négatifs parmi les cas négatifs réels = $\text{P}(\text{Y} = 0 | \text{X} = 0)$

-   Le problème de la sensibilité et spécificité est qu'elles ne tiennent pas compte de la prévalence de la condition dans la population (par exemple, dans le dépistage d'une maladie rare, un test peut avoir une haute sensibilité et spécificité mais produire beaucoup de faux positifs)

    -   VPP = proportion de vrais positifs parmi les résultats positifs du test = $\text{P}(\text{X} = 1 | \text{Y} = 1)$

    -   VPN = proportion de vrais négatifs parmi les résultats négatifs du test = $\text{P}(\text{X} = 0 | \text{Y} = 0)$

Dans un tableau de contingence $2 \times 2$ :

+-----------------------+---------------------+-----------------------+
|                       | Condition présente  | Condition absente     |
+=======================+=====================+=======================+
| Test positif          | a                   | b                     |
+-----------------------+---------------------+-----------------------+
| Test négatif          | c                   | d                     |
+-----------------------+---------------------+-----------------------+

-   Sensibilité = a / (a + c)

-   Spécificité = d / (b + d)

-   VPP = a / (a + b)

-   VPN = d / (c + d)

\newpage

# Tests statistiques

## Comment les utiliser ?

### Intérêt

-   Outils d'inférence : passer de ce qui est observé sur un échantillon à une affirmation sur une population plus large

-   Langage commun de la communauté scientifique

### Légitimité

-   Usage légitime si répond à une question scientifique précise, formulée a priori

-   Usage illégitime si utilisé pour “fouiller” les données à la recherche d'effets significatifs :

    -   Test de normalité (Shapiro-Wilk, Kolmogorov-Smirnov, etc.) sur chaque variable

    -   Tester les caractristiques des perdus de vue...

-   Donc n'est pas un substitut au raisonnement scientifique

## Types de tests

### Comparaison de pourcentages

#### Test du Chi-carré d'indépendance

-   Compare la **répartition des fréquences** observées dans un tableau de contingence à celles attendues sous l'hypothèse d'indépendance entre les variables

-   En fait, il teste l'hypothèse nulle d'indépendance entre deux variables catégorielles

-   Conditions de validité :

    -   Effectifs théoriques \>= 5 dans chque case des tableaux

    -   Observations indépendantes

    -   Distribution des effectifs suit une loi du Chi-carré (c'est à dire que les effectifs sont suffisamment grands pour que la distribution asymptotique du Chi-carré soit une bonne approximation de la distribution réelle des effectifs sous l'hypothèse nulle)

-   Si conditions non remplies : test exact de Fisher (pour tableaux $2 \times 2$)

-   Rapport Chi-2 et OR :

    -   Le test du Chi-carré teste l'hypothèse nulle d'indépendance entre deux variables catégorielles, ce qui est équivalent à tester si l'odds ratio (OR) est égal à 1 dans un tableau de contingence $2 \times 2$.

    -   Donc la p-value du test du chi-carré et celle du test "OR=1" sont identiques.

    -   Si chi-carré est significatif, ça vaut le coup de calculer l'OR pour quantifier la force de l'association entre les variables.

#### Test exact de Fisher

-   Compare la **répartition des fréquences** dans des petits échantillons

-   Utilisé quand les effectifs théoriques sont trop petits pour le test du Chi-carré

#### Comparaison d'un pourcentage à une valeur théorique

-   Test exact de binomial

-   Situation peu fréquente en pratique ! Par exemple équiprobabilité des naissances garçons/filles

#### Comparaison de 3 pourcentages ou plus

-   Situation peu fréquente non plus !

-   Idem avec un test du Chi-carré d'indépendance

-   Le problème pour l'interprétation de la p-value : si significatif, on ne sait pas où est la différence

-   Il faut dans ce cas faire un *Chi-carré de tendance*

### Comparaison de moyennes

-   Test t de Student

-   test de Welch

-   test t de Student apparié

-   test non paramétrique de Wilcoxon

    -   test de Mann-Whitney pour échantillons indépendants

    -   test de Wilcoxon pour échantillons appariés

::: callout-note
**Résumé des tests de comparaison de moyennes**

-   Comparaison de moyennes avec test t de Student :

    -   Effectif : \> 30 par groupe ou à peu près égaux (11 et 12 par exemple)

    -   Distribution : symétrique (approximativement normale) et variances à peu près égales

-   Si échantillons appariés : test t apparié, ou Wilcoxon apparié (= signed rank)

-   Si distribution très asymétrique : test non paramétrique de Mann-Whitney (= Wilcoxon non apparié = rank sum)

-   Si effectifs très inégaux ou variances très différentes : test de Welch
:::

#### Test t de Student

-   Compare les moyennes de deux échantillons indépendants

-   Conditions de validité :

    -   Variable continue

    -   Distribution normale dans chaque groupe (en pratique : n \>= 30 par groupe)

    -   Homogénéité des variances entre les groupes = homoscédasticité, **appréciée par QQplot !!**

-   Si conditions non remplies : test de Welch (si variances inégales) ou test non paramétrique de Mann-Whitney (si distribution non normale)

#### Test de Welch

-   Compare les moyennes de deux échantillons indépendants

-   Variante du test t de Student qui ne suppose pas l'homogénéité des variances entre les groupes

#### Test t de Student apparié

-   Compare les moyennes de deux échantillons appariés (mêmes sujets mesurés deux fois, ou sujets appariés par paires)

#### Test non paramétrique de Wilcoxon

-   Compare les distributions de deux échantillons indépendants ou appariés

-   Ne suppose pas la normalité des distributions : utilise les rangs des données plutôt que les valeurs brutes

-   Échantillons indépendants : test de Mann-Whitney

-   Échantillons appariés : test de Wilcoxon

#### Comparaison de 3 moyennes ou plus

-   Comparaison pas si fréquente !

-   Comparasion de moyennes avec ANOVA :

    -   Si une variable à une distribution égale dans plusieurs groupes, alors la variance intra-groupe est proche de la variance inter-groupe

    -   On passe par la comparaison des variances car pas de test t pour plus de 2 groupes

    -   ANOVA : calcule le ratio de la variance inter-groupe sur la variance intra-groupe

-   Conditions de validité :

    -   Indépendance des observations

    -   Normalité des distributions dans chaque groupe et homogénéité des variances entre les groupes (homoscédasticité appréciée par QQplot)

-   Si conditions non remplies : test non paramétrique de Kruskal-Wallis

-   Sur R : il faut passer par une régression linéaire (`lm`ou `lmer`) pour faire une ANOVA car :

    -   ANOVA est un cas particulier de régression linéaire quand les variables explicatives sont catégorielles

    -   La régression linéaire et l'ANOVA utilisent toutes les deux le même principe : analyser la variance totale en variance expliquée par le modèle et variance résiduelle.

### Test de nullité d'un coefficient de corrélation

-   Les coefficients de corrélation (Pearson, Spearman, etc.) mesurent la force et la direction de la relation entre deux variables

-   Coefficients de corrélation :

    -   Variables quantitatives :

        -   Coefficient de corrélation linéaire de Pearson (variables continues). Varie entre -1 et 1.

        -   Coefficient de corrélation de Spearman (variables ordinales). Varie entre -1 et 1. Basé sur les rangs.

    -   Variables catégorielles :

        -   Coefficient phi (φ) pour tableaux $2 \times 2$. Varie entre -1 et 1.

        -   V de Cramér (V) pour tableaux $r \times c$. Varie entre 0 et 1.

    -   Accord entre évaluateurs :

        -   Coefficient de corrélation intraclasse (ICC(2,1)). Varie entre -∞ et 1 (en pratique 0 à 1).

        -   Kappa de Cohen (κ). Varie entre -1 et 1.

-   Test de nullité d'un coefficient de corrélation :

    -   Permet de tester l'hypothèse nulle selon laquelle il n'y a pas de relation entre les variables

    -   Coefficient : pas forcément égal à 0 dans la population !!

### Tests appariés

-   Utilisés lorsque les observations sont liées ou dépendantes

-   Exemple : mesures répétées sur les mêmes sujets, ou sujets appariés par paires

-   Tests appariés courants :

    -   Sur des moyennes :

        -   Test t de Student apparié : compare les moyennes de deux échantillons appariés

        -   Test de Wilcoxon apparié : compare les distributions de deux échantillons appariés (non paramétrique)

    -   Sur des pourcentages :

        -   Test du Chi2 de McNemar : compare les proportions dans des échantillons appariés (variables binaires)

        -   Test exact du Chi2 de McNemar : version exacte du test de McNemar pour petits échantillons

\newpage
## Calcul de $\beta$ et du nombre de sujets à inclure

-   Dans la théorie de Neyman et Pearson, on fixe un seuil de risque de première espèce ($\alpha$) et un seuil de risque de deuxième espèce ($\beta$)

-   $\alpha$ : probabilité de rejeter l'hypothèse nulle alors qu'elle est vraie (faux positif)

-   $\beta$ : probabilité de ne pas rejeter l'hypothèse nulle alors qu'elle est fausse (faux négatif)

-   La puissance d'un test est égale à $1 - \beta$ : probabilité de rejeter l'hypothèse nulle quand elle est fausse (vrai positif)

-   $\beta$ varie selon :

    -   La différence vraie : plus la différence vraie est grande, plus la puissance est élevée (et $\beta$ faible)

    -   Le nombre de sujets inclus : plus le nombre de sujets est grand, plus la puissance est élevée (et $\beta$ faible)

    -   La variabilité des données : plus la variabilité est faible, plus la puissance est élevée (et $\beta$ faible)

    -   $\text{H}_1$ choisi : plus $\text{H}_1$ est éloigné de $\text{H}_0$, plus la puissance est élevée (et $\beta$ faible).

        -   S'ils sont proches, il est plus difficile de les distinguer donc $\beta$ est plus élevé

\newpage
## Tests uni- ou bilatéraux

-   Selon Fisher : 

    -   L'inférence statistique est **bilatérale** par nature : 

        -   on cherche à apprécier l'adéquation entre un échantillon observé et une population hypothétique infinie sous-jacente

        -   donc test si l'estimateur issu de l'échantillon est supérieur ou inférieur à la valeur hypothétique

-   Selon Neyman et Pearson :

    -   inférence statistique **unilatérale** ou **bilatérale** selon le choix des hypothèses $\H_0$ et $\H_1$

\newpage
## Intervalles de confiance

-   Définitions : 

    -   IC = intervalle estimé à partir des données d'un échantillon, qui a une probabilité donnée (le niveau de confiance) de contenir la vraie valeur du paramètre dans la population.

    -   IC à 95% = si on répétait l'expérience de prélèvement d'échantillons et de calcul d'IC plusieurs fois, environ 95% des IC ainsi obtenus contiendraient la vraie moyenne de la population.

-   **Ça ne veut pas dire "95% des valeurs sont dans l'IC" !!**

\newpage
# Modèles

## Modèle linéaire

### Définition

-   Modèle statistique qui décrit la relation linéaire entre une variable dépendante (Y) et une ou plusieurs variables indépendantes (X)

-   Modèle linéaire = modèle de régression linéaire = régression linéaire.

-   Utilisé quand la variable dépendante $\text{Y}$ est continue et suit une distribution normale

-   Forme générale : $\text{Y} = \alpha_0 + \alpha_1 \text{X}_1 + \alpha_2 \text{X}_2 + \dots + \alpha_p \text{X}_p + \epsilon$

    -   $\text{Y}$ : variable dépendante

    -   $\text{X}_1, \text{X}_2, ..., \text{X}_p$ : variables indépendantes (prédicteurs)

    -   $\alpha_0$ : intercept (valeur de Y quand toutes les X sont nulles)

    -   $\alpha_1, \alpha_2, ..., \alpha_p$ : coefficients de régression (effet de chaque X sur Y)

    -   $\epsilon$ : terme d'erreur (variabilité non expliquée par le modèle)

-   Méthode des moindres carrés pour estimer les coefficients : minimise la somme des carrés des écarts entre les valeurs observées et les valeurs prédites par le modèle

    -   En gros : estimer les coefficients de régression ($\alpha_0, \alpha_1, ..., \alpha_p$) pour que la ligne de régression soit la "meilleure" possible, c'est à dire pour que $\epsilon$ soit le plus petit possible

-   Relation avec ANOVA : l'ANOVA est un cas particulier du modèle linéaire où les variables indépendantes sont catégorielles.

-   Conditions de validité :

    -   Linéarité : relation linéaire entre chaque X et Y

    -   Indépendance des erreurs, normalité des erreurs, variance constante des erreurs (erreurs = résidus du modèle)

-   Interprétation : 

    -   Chaque coefficient de régression ($\alpha_i$) représente l'effet moyen d'une unité de changement dans la variable indépendante $\text{X}_i$ sur la variable dépendante $\text{Y}$, en maintenant toutes les autres variables indépendantes constantes.

    -   Par exemple, si $\alpha_1 = 2$, cela signifie qu'une augmentation de 1 unité de $\text{X}_1$ est associée à une augmentation moyenne de 2 unités de $\text{Y}$, toutes choses égales par ailleurs.

### Corrélation et modèle linéaire

