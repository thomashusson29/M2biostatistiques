# Extraction NSN : questions et corrections

## Périmètre

- Corpus principal : questions demandant explicitement de calculer, retrouver ou expliquer le calcul du nombre de sujets nécessaires (NSN) ou du nombre de sujets à inclure.
- Corpus connexe : questions parlant de puissance statistique ou de critique du NSN, sans demande directe de calcul.
- Source de travail : les fichiers `DOCX` du dossier, car ce sont ceux qui contiennent les énoncés et, quand ils existent, les corrections.

## Corpus principal : questions NSN stricto sensu

### 2012

- Source : `exam_2012_Epi_RC.docx`
- Question :

> Essayez de retrouver approximativement le nombre de sujet nécessaire.

- Correction :

> Aucune correction retrouvée dans le dossier.

### 2020

- Source : `exam_2020_Epi_RC_avec_corrigé.docx`
- Question :

> Dans l’étude il est calculé un nombre de sujets à inclure égal à 3*230. Proposez de votre côté un calcul de ce paramètre.

- Correction :

> Dans l’article, les auteurs nous ont précisé le delta et le SD pris en compte dans les calculs.
>
> Si ces endpoints étaient à analyser séparément, on aurait pensé qu’un nombre de 165 sujets/bras aurait pu garantir la puissance de 90% à chaque fois. Mais les auteurs ont calculé un NSN de 230/bras. Pourquoi ?
>
> Parce que le critère de jugement principal est en fait un critère MULTIPLE : la survenue d’un changement significatif de chacun de ces 3 co-primary endpoints est nécessaire pour coter le critère de jugement comme positif. Autrement dit, il y a un seul résultat où l’étude d’un bras sera considérée positive, c’est lorsque les 3 composantes du critère de jugement principal sont toutes les 3 positives. Avec ce risque d’inflation du risque beta et donc un risque de diminution de puissance, on s’attend que le NSN soit plus grand que celui qu’on vient de calculer.
>
> En fait, on doit prendre en considération la corrélation entre ces co-primary endpoints, pour corriger le NSN. Le plus « grave » (c’est-à-dire le plus couteux pour le NSN) c’est lorsque c’est critères sont indépendants. Or, dans le plan d’analyse, on voit que ces 3 co-critères ne sont pas indépendants : les auteurs nous ont donné la corrélation entre ces co-critères : r=0.93 et r=0.68
>
> Et en effet, le logiciel R nous propose un package très utile : « mpe » avec une commande power.known.var (Multiple Co-Primary Endpoints with Known Covariance). C’est une librairie qui calcule le NSN en prenant en considération que le critère de jugement est multiple library (mpe) power.known.var(K=3,power=0.9,rho=c(0.93,0.68,0.68),SD=c(2.73,2.58,0.92), delta=c(1,1,0.32),sig.level = 0.025)
>
> [K: nbr de bras, power :puissance, rho :structure de corrélation, delta : MCID]
>
> ce qui nous donne n=195 dans chaque bras, donc 585 sujets en total car l’étude renferme 3 bras (K=3).
>
> Dans l’étude, les auteurs ont inclus n=230 sujets dans chaque bras, donc 690 sujets en total, ce qui n’est pas loin du chiffre qu’on vient d’estimer, et en pus, il est plus grand, ce qui peut nous rassurer.

### 2021

- Source : `exam_2021_Epi_RC_avec_corrigé.docx`
- Question :

> Si le design avait été celui d’un essai randomisé standard, combien de patients aurait-il fallu inclure pour obtenir une puissance statistique « convenable » (partant des mêmes hypothèses d’effet attendu que les auteurs) ?

- Correction :

> Les auteurs partent sur la base de 60% d’outcome (=P1) dans le bras contrôle et d’une réduction de 50% dans le bras intervention (P2=60%/2=30%).
>
> A partir de P1 et P2 et de la formule du NSN vue en cours on trouve un peu moins de 50 patients par bras

### 2022

- Source : `exam_2022_Epi_RC_corrigé.docx`
- Question :

> Expliquez les modalités de calcul du nombre de sujets nécessaires

- Correction :

> Pas facile avec un modèle binomial négatif. Les auteurs d’ailleurs ne disent pas dans le papier lui-même comment ils ont fait, d’où une difficulté à reproduire leur calcul.
>
> Sinon comme d’habitude il faut alpha, beta, une différence « à côté de laquelle on ne veut pas passer », une variance. Ici il y a en plus une surdispersion (non indépendance de survenue de chaque évènement) à parier.

### 2023

- Source : `exam_2023_Epi_RC_corrigé.docx`
- Question :

> Si l’essai avait randomisé des sujets et non des clusters, quel aurait été le nombre de sujets à inclure (avec les mêmes hypothèses que dans l’article) ?

- Correction :

> (1,96+1,645)^2 * 2 * sigma^2 / delta^2
>
> = 10,5 * 2 * 90^2 / 60^2 = 48 (on va dire 50)
>
> À multiplier par 3 = 150
>
> À augmenter de 30% = 200 (en gros)
>
> On ne tient pas compte des comparaisons multiples. En fait c’est négligeable : si on fait Bonferroni il faut utiliser (2,25+1,645)^2 au lieu de (1,96+1,645)^2, ça ne fait qu’augmenter de 20%...

- Complément NSN présent juste avant cette question :

> Le calcul du nombre de sujets nécessaire est complexe, pas très fiable. Et le nombre de sujets nécessaire à inclure est plus grand.

### 2024

- Source : `exam_2024_Epi_RC_corrigés.docx`
- Question :

> Essayez, dans la mesure du possible, de retrouver le « Nombre de Sujets Nécessaires » que les auteurs calculent pour le test de l’hypothèse de non-infériorité.

- Correction :

> Si on utilise la formule
>
> 2(za+zb)^2 [p1(1-p1) + p1(1-p1)]/(p1-p2)^2
>
> Avec :
>
> (za+zb)^2 = 10
>
> p1=10%
>
> p2=20%
>
> On trouve 360 sujets en tout ce qui colle assez bien…

### 2025

- Source : `exam_2025_Epi_RC.docx`
- Question :

> A l’aide des données disponibles dans l’article, essayez de retrouver au moins approximativement une estimation du nombre de sujets à inclure dans l’essai.

- Correction :

> Aucune correction retrouvée dans le dossier.

## Corpus connexe : puissance statistique ou remarques liées au NSN

Ces questions touchent au même champ méthodologique, mais ne demandent pas directement un calcul de NSN.

### 2011

- Source : `exam_2011_Epi_RC.docx`

> Dans la mesure du possible calculez une puissance a posteriori.

### 2012

- Source : `exam_2012_Epi_RC.docx`

> Il est indiqué dans le texte que: “The low number of events limited the statistical power of the study”. Pouvez-vous retrouver au moins approximativement cette puissance statistique ?

### 2011

- Source : `exam_2011_Epi_RC.docx`

> L’analyse est réalisée en ITT et le nombre de sujets nécessaire est calculé en tenant compte d’un nombre de perdus de vue possible. Qu’en pensez-vous ?

### 2013

- Source : `exam_2013_Epi_RC.docx`

> Dans l’article on ne trouve pas de justification de la taille de l’échantillon. A posteriori, il n’est pas facile de calculer une puissance statistique. Essayez tout de même de proposer un tel calcul, même très rudimentaire. (5 points)

### 2014

- Source : `exam_2014_Epi_RC.docx`

> Dans l’article on ne trouve pas de justification de la taille de l’échantillon. A posteriori, il n’est pas facile de calculer une puissance statistique. Essayez tout de même de proposer un tel calcul, même très rudimentaire.

### 2016

- Source : `exam_2016_Epi_RC.docx`

> Comment aborder la question de la puissance statistique dans une telle étude ?

### 2019

- Source : `exam_2019_Epi_RC_avec_corrections.docx`

> Dans une cohorte de cette taille, comment se discute la question de la puissance statistique ?

> Vu la taille et vu la fréquence élevée des expositions d’intérêt et de la maladie (même si là on s’intéresse aux cas incidents), aucun pb de puissance. En fait on se fiche des « p » et on devrait juste regarder les IC95%. Pour des cohortes de ce type et pour un objectif pareil, les tests n’ont pas beaucoup de sens ce sont les tailles d’effet qui compte et la précision de l’estimation de ces effets.

## Synthèse rapide

- Questions NSN strictes retrouvées : 7 occurrences (2012 RC, 2020, 2021, 2022, 2023, 2024, 2025).
- Corrections disponibles dans le dossier : 5 occurrences (2020 à 2024).
- Questions connexes récurrentes : puissance a posteriori, faibles nombres d’événements, très grandes cohortes, distinction entre arrêt de traitement et vraie perte de suivi.
- Variantes récurrentes du thème : co-primary endpoints, cluster randomization, surdispersion, non-infériorité.
