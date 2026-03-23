# Guide Ultra-Complet Des Informations Attendues A Partir D'un Article D'Examen RC/EPI

Base de travail: annales corrigees `2019` a `2024` du dossier `exam_mars/`.

Objectif du document: transformer la logique implicite des corrections en une grille d'extraction et de critique reutilisable pour de nouveaux articles d'examen.

Ce document n'est pas un resume des annales. C'est un mode d'emploi pour savoir:
- quoi reperer dans l'article,
- quoi comprendre,
- quoi critiquer,
- et quel type de question est susceptible de tomber a l'examen.

## 1. Idee generale: ce que les corrections attendent vraiment

Les corrections montrent qu'on n'attend pas seulement une lecture "article club". On attend surtout:

- l'identification correcte du design,
- la comprehension de la logique du design,
- la capacite a justifier ou critiquer les choix methodologiques,
- l'interpretation des resultats en termes de taille d'effet, precision, pertinence clinique ou de sante publique,
- la distinction entre significativite statistique, pertinence pratique et plausibilite causale,
- la capacite a dire ce que l'article permet de conclure, et surtout ce qu'il ne permet pas de conclure,
- la capacite a discuter les biais, les donnees manquantes, la confusion, la mediation, les interactions, la multiplicite et la generalisation,
- la capacite a utiliser les supplements, annexes et appendices quand ils existent.

Tendances fortes des corrections:

- Les questions partent souvent d'un element technique explicitement cite par l'article: `SARIMA`, `minimisation`, `cluster randomised`, `multi-level Poisson`, `difference-in-difference`, `effect modifier`, `non-inferiority`, etc.
- Il ne suffit presque jamais de definir un concept. Il faut expliquer ce qu'il veut dire ici, dans cet article.
- Le correcteur valorise beaucoup la critique de la conclusion et de l'abstract.
- Les `p-values` ne sont pas traitees comme un fetiche. Dans plusieurs corrections, les tailles d'effet et les `IC95%` comptent davantage.
- Un resultat "non significatif" n'est pas automatiquement un "resultat negatif".
- Un essai randomise n'est pas automatiquement simple a interpreter: cluster, ouvert, co-criteres, design adaptatif, non-inferiorite, analyses intermediaires, tout cela complique.
- En epidemiologie, la discussion de la confusion, de la mediation, de la temporalite et de la validite causale est centrale.

## 2. Ce qu'il faut extraire de tout article, quel qu'il soit

Pour chaque article, il faut pouvoir reconstituer au minimum la fiche suivante.

### 2.1 Identification generale

- Titre complet.
- Domaine principal: `RC`, `EPI`, ou article hybride.
- Question de recherche en une phrase.
- Pourquoi cette question est importante cliniquement, epidemiologiquement, ou en sante publique.

### 2.2 Nature du design

- Type exact d'etude.
- Unite randomisee ou observee: patient, centre, service, region, etat, fratrie, vague d'enquete, etc.
- Nature prospective ou retrospective.
- Caractere individuel, agrégé, multi-niveaux, longitudinal, transversal repete, quasi-experimental, etc.
- Presence d'un supplement, appendice, annexe, protocole ou plan d'analyse statistique.

### 2.3 Population et source des donnees

- Population source.
- Critere d'inclusion et d'exclusion.
- Mode de recrutement ou de constitution de la base.
- Taille initiale, taille analysee, pertes.
- Representativite et generalisabilite.
- Fiabilite des variables si base administrative, registre, dossier clinique, auto-questionnaire, score psychometrique, adjudication, capteur, etc.

### 2.4 Variables principales

- Variable a expliquer / outcome principal.
- Exposition principale ou intervention principale.
- Comparateur ou groupe controle.
- Eventuels outcomes secondaires, exploratoires, de securite, qualitatifs.
- Echelle de mesure.
- Temporalite de mesure.
- Caractere objectif, subjectif, composite, co-primaire, surrogat, patient-centred, physiopathologique, etc.

### 2.5 Strategie d'analyse

- Population analysee: `ITT`, `mITT`, `PP`, `complete case`, cas disponibles, analyses de sensibilite.
- Modele principal.
- Variables d'ajustement.
- Gestion de la multiplicite.
- Donnees manquantes et attrition.
- Analyses de sous-groupes.
- Analyses intermediaires.
- Analyses de sensibilite.

### 2.6 Resultats et interpretation

- Mesure d'effet principale.
- Ordre de grandeur de l'effet.
- Precision: `IC95%`.
- Sens statistique et sens clinique.
- Cohesion entre resultats, abstract, discussion et conclusion.
- Principales limites reconnues ou non reconnues par les auteurs.

## 3. Grille ultra-complete pour un article de recherche clinique

## 3.1 Architecture de l'essai

Si l'article est un essai, il faut reperer:

- `superiority`, `non-inferiority`, `equivalence`, `pragmatic`, `adaptive`, `MAMS`, `cluster`, `cross-over`, `matched-pair cluster`, etc.
- nombre de bras,
- parallelisme ou non,
- niveau de randomisation,
- methode de randomisation: simple, blocs, stratification, minimisation,
- existence d'un bras controle unique ou de controles differents selon les periodes,
- justification pratique ou ethique du design.

Ce qui est attendu:

- savoir definir le design,
- expliquer pourquoi il a ete choisi ici,
- exposer ses avantages et ses inconvenients,
- dire si le design complique l'interpretation.

Exemples de questions typiques:

- "A quoi correspond une randomisation par minimisation ?"
- "Pourquoi un essai randomise en cluster ici ?"
- "Que penser d'une approche `MAMS` ?"
- "Que permettait reellement ce design inhabituel de conclure ?"

## 3.2 Aveugle et faisabilite

Les corrections montrent qu'il faut distinguer:

- aveugle des patients,
- aveugle des investigateurs,
- aveugle des evaluateurs,
- impossibilite pratique de l'aveugle,
- impact de l'absence d'aveugle selon la nature du critere.

Ce qui est attendu:

- ne pas dire automatiquement qu'un essai ouvert est "mauvais",
- mais discuter si l'absence d'aveugle pose un vrai probleme ici,
- relier cette discussion au type de critere: `OS`, rechute adjudiquee, score subjectif, qualite de vie, douleur, etc.

Question implicite frequente:

- si le critere est subjectif et l'essai ouvert, la robustesse devient plus discutable.

## 3.3 Population, intervention, comparateur

Il faut relever:

- qui est inclus exactement,
- ce qui est compare a quoi,
- dose, frequence, duree,
- intervention individuelle ou systemique,
- co-interventions possibles,
- adherence ou exposition reelle a l'intervention.

Ce qui est attendu:

- dire si le comparateur est pertinent,
- dire si l'intervention est reproductible,
- dire si le design mesure l'efficacite "ideale" ou plutot le benefice reel en pratique.

## 3.4 Critere principal: c'est une cible privilegiee des examinateurs

A extraire a chaque fois:

- definition precise,
- instrument de mesure,
- moment de mesure,
- justification clinique,
- sensibilite au changement,
- part objective / subjective,
- lien direct ou indirect avec ce qui importe au patient.

Cas a detecter explicitement:

- critere unique,
- co-criteres primaires,
- critere composite,
- critere d'activite plutot que vrai critere de benefice patient,
- critere de securite,
- critere de non-inferiorite.

Ce que les corrections attendent:

- les forces,
- les faiblesses,
- la pertinence clinique,
- la difficulte d'interpretation si le critere est composite,
- la discussion d'un critere alternatif plausible.

Tres recurrent:

- ne pas confondre "frequent dans la litterature" et "bon critere".
- ne pas confondre "significatif" et "cliniquement important".

## 3.5 Co-criteres, composites, multiplicite

Quand l'article contient plusieurs criteres principaux ou beaucoup de tests:

- verifier si le plan exige la positivite de tous les co-criteres, ou d'un seul,
- distinguer co-primaire et composite,
- verifier si une hierarchie de tests existe,
- verifier comment le risque alpha est gere,
- verifier si l'abstract "vend" des resultats secondaires ou exploratoires.

Ce qui est attendu:

- expliquer les consequences sur l'interpretation,
- comprendre l'effet sur le `NSN`,
- savoir dire pourquoi certains `IC95%` peuvent rester a `95%` meme si l'alpha de test est ajuste,
- refuser les conclusions trop fortes sur des resultats multiples mal controles.

## 3.6 Calcul du nombre de sujets necessaires

La reconstruction du `NSN` tombe souvent.

Toujours extraire:

- hypothese principale testee,
- `alpha`,
- `beta` / puissance,
- difference cible ou marge cliniquement pertinente,
- variance / ecart-type,
- eventuel taux d'evenement attendu,
- correlation entre co-criteres,
- surdispersion,
- attrition anticipee,
- `ICC` ou inflation de design si cluster,
- marge de non-inferiorite si pertinente.

Ce qui est attendu:

- retrouver la logique generale meme si le calcul exact est impossible,
- dire ce qui manque si l'article ne permet pas la reproduction,
- expliquer pourquoi un `NSN` cluster est plus grand,
- expliquer pourquoi un `NSN` pour co-criteres peut augmenter,
- expliquer pourquoi un modele binomial negatif ou un design adaptatif complique le calcul.

Important:

- le correcteur accepte souvent une reconstitution raisonnable si elle est coherente et justifiee.

## 3.7 Population analysee et donnees manquantes

Toujours verifier:

- `ITT`, `mITT`, `PP`, `complete case`, "all treated", etc.
- ce que signifie concretement la population analysee ici,
- l'ampleur des donnees manquantes,
- si la population analysee est encore proche de la population randomisee,
- si les sujets inclus dans l'analyse sont aussi ceux qui ont reellement suivi l'intervention.

Ce qui est attendu:

- savoir expliquer pourquoi `complete case` peut etre choquant dans un RCT classique,
- mais aussi pourquoi la situation peut etre plus nuancee en cluster ou en intervention complexe,
- discuter le compromis entre validite pragmatique et purete methodologique.

## 3.8 Modele statistique principal

Il faut etre capable d'identifier:

- quelle variable est expliquee,
- quelle est la variable explicative principale,
- quel modele est utilise: `Cox`, modele lineaire, modele mixte, binomial negatif, etc.
- pourquoi ce modele est adapte au type de donnees,
- ce que font les effets aleatoires,
- ce que font les variables d'ajustement,
- quel est le role de la valeur baseline du critere,
- si des covariables ont ete choisies a priori ou a posteriori.

Ce qui est attendu:

- ne pas reciter le modele en theorie uniquement,
- dire en quoi le choix du modele est defendable ou non pour cet article,
- relever les variables surprenantes ou insuffisamment justifiees.

## 3.9 Sous-groupes et interactions

Si l'article conclut surtout via des sous-groupes:

- verifier si l'analyse etait pre-specifiee,
- verifier s'il y a un vrai test d'interaction,
- regarder la puissance,
- distinguer resultat d'exploration et conclusion robuste.

Ce qui est attendu:

- beaucoup de prudence,
- capacite a dire "on n'achete pas la conclusion" si la revendication depasse le support empirique.

## 3.10 Analyses intermediaires

Si l'article mentionne des analyses intermediaires:

- demander si elles visent l'efficacite, la securite, ou la futilite,
- demander a quel stade du developpement elles s'inscrivent,
- demander ce qu'elles changent en pratique.

Ce qui est attendu:

- comprendre la logique, pas seulement citer le nombre d'analyses,
- discuter leur utilite reelle,
- voir si elles complexifient beaucoup le design pour un gain incertain.

## 3.11 Effets indesirables et securite

Quand un tableau d'effets indesirables n'a pas de `p`:

- penser d'abord a une presentation descriptive,
- rappeler que l'enjeu est souvent de ne pas rater un signal,
- noter qu'une logique de test inferentiel pur n'est pas forcement la plus pertinente ici.

Ce qui est attendu:

- savoir justifier l'absence de `p-values`,
- discuter le rapport benefice/risque, pas seulement l'efficacite.

## 3.12 Interpretation finale en RC

Toujours finir par:

- la taille d'effet est-elle importante ou microscopique ?
- l'effet depasse-t-il une `MCID` ou un seuil de pertinence pratique ?
- l'etude montre-t-elle un vrai benefice patient ou seulement un signal statistique ?
- l'abstract va-t-il trop loin ?
- la conclusion est-elle en phase avec le design, les biais et la multiplicite ?

## 4. Grille ultra-complete pour un article d'epidemiologie

## 4.1 Identifier la famille exacte du design

Les corrections montrent que cette etape est fondamentale.

Il faut savoir reconnaitre et discuter:

- cohorte prospective,
- cohorte retrospective,
- etude de registre,
- base administrative,
- etude transversale repetee,
- serie temporelle interrompue,
- etude ecologique,
- quasi-experimental de type `difference-in-difference`,
- comparaison negative control,
- comparaison intrafamiliale / fratrie,
- analyse multi-niveaux.

Ce qui est attendu:

- dire ce que ce design permet de faire,
- dire ce qu'il ne permet pas de faire,
- exposer ses conditions de validite.

Exemples de questions typiques:

- avantages et limites d'une etude transversale repetee versus cohorte,
- qu'est-ce qu'un biais ecologique,
- qu'est-ce qu'un `staggered difference-in-difference`,
- pourquoi utiliser une comparaison dans une fratrie,
- comment un registre aide ou limite l'analyse.

## 4.2 Population source et qualite des donnees

Toujours extraire:

- d'ou viennent les donnees,
- pourquoi elles ont ete recueillies,
- si elles ont ete pensees pour la question posee ou non,
- comment sont classes cas, expositions, outcomes,
- si une validation existe,
- quelles erreurs de classement sont plausibles.

Ce qui est attendu:

- une vision nuancee des registres et bases administratives,
- savoir dire qu'une grande taille n'efface pas une mauvaise qualite de variable,
- discuter sensibilite, specificite, valeur predictive positive quand c'est pertinent.

## 4.3 Exposition et outcome

Pour l'exposition:

- definition exacte,
- moment de mesure,
- continu ou categorise,
- seuils arbitraires ou non,
- plausibilite d'une causalite inverse,
- risque de mauvais classement.

Pour l'outcome:

- definition exacte,
- pertinence clinique ou de sante publique,
- mode de mesure,
- validation,
- possible flou conceptuel.

Point tres important issu des corrections:

- si un score continu est decoupe en categories, il faut pouvoir discuter la legitimite de ce decoupage.

## 4.4 Temporalite, causalite, mediation, confusion

C'est probablement le coeur des attentes en `EPI`.

Toujours distinguer:

- facteur de confusion,
- facteur de mediation,
- modificateur d'effet / interaction,
- evenement exogene concurrent,
- causalite inverse.

Ce qui est attendu:

- justifier une strategie "theory-driven" de selection des covariables,
- comprendre pourquoi on n'ajuste pas volontiers sur un mediateur si l'on veut estimer un effet total,
- reconnaitre qu'un facteur de confusion non mesure peut ruiner une interpretation causale,
- discuter avec nuance les termes utilises par les auteurs, surtout quand ils parlent de causalite.

## 4.5 Facteurs de confusion non mesures

Quand l'article comporte des astuces pour les contourner, il faut les relever explicitement:

- `negative control exposure` ou `negative control outcome`,
- comparaison au sein d'une fratrie,
- analyses de sensibilite,
- ajustements successifs,
- exposition temporellement voisine mais causalement improbable.

Ce qui est attendu:

- expliquer la logique de ces strategies,
- dire ce qu'elles reduisent,
- dire aussi ce qu'elles ne suppriment pas forcement.

## 4.6 Attrition, suivi, censure, donnees manquantes

Dans une cohorte:

- verifier les perdus de vue,
- verifier si la censure est supposee non informative,
- regarder la difference entre sujets potentiellement inclus et sujets analyses,
- regarder si les auteurs discutent reellement ce point.

Ce qui est attendu:

- ne pas ignorer l'attrition,
- relier ce sujet au modele employe, par exemple un `Cox`.

## 4.7 Taille d'effet et precision

Les corrections insistent beaucoup sur ce point:

- dans une grande cohorte, la puissance est rarement le vrai probleme,
- l'enjeu principal est souvent l'ordre de grandeur de l'effet,
- il faut regarder les `IC95%`,
- il faut discuter si l'effet a un sens pratique,
- il faut se mefier des effets faibles sensibles a la confusion residuelle.

Ce qui est attendu:

- ne pas s'arreter a "c'est significatif",
- discuter si l'effet est fort, faible, credible, fragile, utile.

## 4.8 Modeles statistiques courants a savoir expliquer

Les questions tombent souvent sur un modele cite noir sur blanc dans l'article.

Il faut pouvoir expliquer, dans le papier, ce que fait:

- un `Cox`,
- une regression de `Poisson`,
- une `multi-level Poisson regression`,
- un modele additif versus multiplicatif,
- un `SARIMA`,
- un `difference-in-difference`,
- un modele lineaire avec effet aleatoire,
- un estimateur robuste de variance,
- une analyse en interaction,
- un modele emboite.

Ce qui est attendu:

- une definition courte,
- le role concret du modele dans cet article,
- ses hypotheses de validite,
- ses limites d'interpretation.

## 4.9 Conclusion, abstract et pretention causale

Tres souvent, les corrections demandent de juger la facon dont les auteurs concluent.

Toujours verifier:

- si l'abstract dit plus que ce que montrent les resultats,
- si les auteurs melangent resultat numerique et affirmation causale,
- si des resultats secondaires ou exploratoires sont "vendus" comme robustes,
- si un resultat "negatif" est traite comme preuve d'absence d'association,
- si la prudence est coherente avec les biais plausibles.

Ce qui est attendu:

- une critique argumentee,
- capable de dire a la fois "ce n'est pas completement faux" et "c'est tendancieux",
- ou "l'histoire racontee est elegante mais reste epistemologiquement fragile".

## 4.10 Suites de recherche

Les corrections montrent aussi qu'on peut te demander:

- quelle etude complementaire proposer,
- comment approfondir un resultat surprenant,
- quel protocole qualitatif imaginer,
- quelle alternative de design aurait mieux repondu a la question.

Ce qui est attendu:

- un protocole simple, realiste et coherent avec la question qui reste ouverte.

## 5. Si l'article contient X, il faut t'attendre a Y

Cette section est la plus directement exploitable pour preparer un nouvel article.

### 5.1 S'il y a un supplement, un appendice, une annexe ou un protocole

Attendre des questions sur:

- calcul du `NSN`,
- details de randomisation,
- definition exacte des outcomes,
- hierarchie des tests,
- analyses de sensibilite,
- sous-groupes,
- methode de gestion des donnees manquantes,
- analyses intermediaires.

Regle pratique:

- ne jamais se contenter du PDF principal si un supplement existe.

### 5.2 S'il y a un critere composite ou co-primaire

Attendre des questions sur:

- forces et faiblesses,
- pertinence clinique,
- sensibilite au changement,
- interpretation difficile,
- multiplicite,
- retentissement sur le `NSN`.

### 5.3 S'il y a un essai en cluster

Attendre des questions sur:

- pourquoi randomiser des clusters,
- contamination,
- faisabilite,
- cout,
- augmentation du `NSN`,
- `ICC`,
- effet aleatoire `cluster`,
- persistance possible de confusion a l'echelle individuelle,
- difficulte de l'aveugle,
- `ITT` versus `complete case` ou autres populations.

### 5.4 S'il y a un essai ouvert avec critere subjectif

Attendre des questions sur:

- risque de biais d'evaluation,
- ce qui a ete fait pour aveugler les evaluateurs,
- pertinence du critere choisi dans ce contexte,
- robustesse des conclusions.

### 5.5 S'il y a un design adaptatif ou `MAMS`

Attendre des questions sur:

- logique des etapes,
- difference entre activite, efficacite et securite,
- analyses de futilite,
- gain d'efficacite contre complexite du design,
- validite des conclusions si sous-groupes ou etapes multiples.

### 5.6 S'il y a un objectif de non-inferiorite

Attendre des questions sur:

- justification de la marge,
- logique clinique de la non-inferiorite,
- interpretation de ce que l'essai etait susceptible d'apporter,
- relation avec d'autres outcomes plus "positifs" comme fonctionnement ou qualite de vie,
- pertinence globale du choix de design.

### 5.7 S'il y a une etude de registre ou base administrative

Attendre des questions sur:

- avantages logistiques,
- grande taille,
- representativite relative,
- profondeur temporelle,
- cout marginal faible,
- mais aussi sur qualite imparfaite des variables,
- variables manquantes pour la question,
- erreurs de classement,
- lourdeur de gestion,
- limites de generalisation.

### 5.8 S'il y a une cohorte avec pertes de vue

Attendre des questions sur:

- attrition,
- censure informative ou non,
- difference entre inclus potentiels et analyses,
- impact sur la validite.

### 5.9 S'il y a une comparaison d'interactions

Attendre des questions sur:

- interaction additive versus multiplicative,
- mesure sur l'echelle du risque ou du log-risque,
- sens epidemiologique de l'interaction,
- interpretation prudente.

### 5.10 S'il y a un score continu que les auteurs dichotomisent

Attendre des questions sur:

- pertinence du seuil,
- perte d'information,
- cout en puissance,
- possible utilite pragmatique,
- rarete d'un vrai effet de seuil.

### 5.11 S'il y a une serie temporelle interrompue ou un `SARIMA`

Attendre des questions sur:

- decomposition du modele,
- saisonnalite,
- autocorrelation,
- evenement declencheur,
- "change points",
- evenements exogenes concurrents,
- difficulte de l'interpretation causale,
- nature ecologique des donnees.

### 5.12 S'il y a un `difference-in-difference`, surtout staggered

Attendre des questions sur:

- effet temps,
- effet groupe,
- terme d'interaction d'interet,
- adoption echelonnée dans le temps,
- hypothese de tendances paralleles,
- heterogeneite des effets selon les lieux,
- spillover,
- risque de conclusion trop politique ou trop forte.

### 5.13 S'il y a un modele additif

Attendre des questions sur:

- difference avec un modele multiplicatif,
- niveau modele: risque brut versus log / logit,
- interet eventuel en sante publique,
- limites techniques et interpretatives,
- fausse idee selon laquelle "multiplicatif" voudrait dire "synergie".

### 5.14 S'il y a un negative control ou une comparaison en fratrie

Attendre des questions sur:

- logique anti-confusion non mesuree,
- ce que la strategie controle vraiment,
- ce qu'elle ne controle pas,
- difference d'interpretation entre modeles marginaux et conditionnels si la correction s'y prete.

### 5.15 S'il y a plusieurs modeles emboites

Attendre des questions sur:

- pourquoi les auteurs presentent une succession de modeles,
- ce que chaque ajout de covariable est cense raconter,
- utilite narrative plus qu'obligation theorique stricte.

### 5.16 S'il y a un abstract tres positif

Attendre presque toujours une question du type:

- "Que pensez-vous de la conclusion ?"

Reflexe a avoir:

- comparer l'abstract au tableau de resultats,
- verifier multiplicite,
- verifier l'amplitude des effets,
- verifier les biais majeurs,
- verifier si l'abstract transforme un signal numerique en affirmation solide.

## 6. Points de doctrine implicites dans les corrections

Ces points ne sont pas des lois universelles, mais ce sont des tendances nettes des corrections lues.

- Il faut privilegier les tailles d'effet et la precision, surtout dans les grandes cohortes.
- Il faut se mefier des conclusions trop appuyees sur des sous-groupes.
- Il faut discuter la pertinence clinique des criteres, pas seulement leur validite formelle.
- Il faut etre prudent avec les resultats secondaires, exploratoires, multiples.
- Il faut distinguer "numeriquement different", "statistiquement different" et "important pour le patient".
- Il faut distinguer "association", "histoire causale plausible" et "preuve causale".
- Il faut etre capable de dire qu'un design est ingenieux mais encombrant, ou elegant mais fragile.
- Il faut savoir reconnaitre les zones ou l'article ne donne pas assez d'information pour conclure.

## 7. Fiche d'extraction ideale a remplir pour un nouvel article

Tu peux reutiliser cette fiche telle quelle.

### 7.1 Resume de base

- Reference complete:
- Type d'article: `RC` / `EPI`
- Question de recherche:
- Pourquoi cette question importe:
- Presence d'un supplement / appendice / annexe:

### 7.2 Design

- Type exact de design:
- Unite analysee:
- Unite randomisee ou niveau d'exposition:
- Prospective / retrospective / quasi-experimentale:
- Principales forces du design:
- Principales limites du design:

### 7.3 Population et donnees

- Population source:
- Inclusion / exclusion:
- Taille initiale:
- Taille analysee:
- Pertes / donnees manquantes:
- Representativite:
- Qualite et fiabilite des donnees:

### 7.4 Variables

- Outcome principal:
- Comment il est mesure:
- Forces du critere:
- Faiblesses du critere:
- Exposition / intervention principale:
- Comparateur:
- Outcomes secondaires importants:
- Variables de securite:

### 7.5 Analyse statistique

- Population analysee:
- Modele principal:
- Pourquoi ce modele:
- Variables d'ajustement:
- Multiplicite:
- Sous-groupes:
- Analyses intermediaires:
- Analyses de sensibilite:
- Strategie pour confusion / mediation / interaction:

### 7.6 Resultats

- Mesure d'effet principale:
- Taille d'effet:
- `IC95%`:
- Significativite:
- Importance clinique ou sante publique:
- Coherence entre resultats et conclusion:

### 7.7 Critique

- Biais principaux:
- Validite interne:
- Validite externe:
- Ce que l'article permet vraiment de conclure:
- Ce qu'il ne permet pas de conclure:
- Ce qui est potentiellement exagere dans l'abstract:
- Quelle question d'examen je poserais a partir de cet article:

## 8. Forme attendue d'une bonne reponse d'examen

Une bonne reponse ressemble souvent a ceci:

1. definition courte du concept,
2. application immediate au papier,
3. un ou deux arguments de force,
4. un ou deux arguments de limite,
5. une conclusion nette et nuancee.

Formule implicite tres rentable:

- "En theorie..."
- "Ici..."
- "L'avantage est..."
- "La limite est..."
- "Au total..."

Ce qu'il faut eviter:

- la recitation scolaire pure,
- la paraphrase de l'abstract,
- la fascination pour la seule `p-value`,
- la critique generique qui pourrait s'appliquer a n'importe quel papier.

## 9. Priorites absolues si tu manques de temps devant un nouvel article

Si tu dois extraire le maximum d'informations rapidement, commence par:

- identifier le design exact,
- trouver le critere principal ou l'outcome principal,
- reperer le modele statistique principal,
- reperer la logique du `NSN` si essai,
- reperer les principaux biais ou menaces causales,
- lire l'abstract puis verifier s'il force le trait,
- lire tout supplement disponible,
- noter ce qui est le plus discutable dans la conclusion.

## 10. Conclusion operationnelle

A partir des annales corrigees, il faut preparer un nouvel article non pas comme un simple resume, mais comme une matrice de defense orale ou ecrite:

- "Quel est le design ?"
- "Pourquoi ce design ici ?"
- "Quel est le vrai critere d'interet ?"
- "Le modele est-il coherent ?"
- "Que valent les resultats ?"
- "Quels biais menacent l'interpretation ?"
- "L'abstract et la conclusion sont-ils honnetes ?"
- "Qu'est-ce que je reponds si on me demande une critique methodologique, un calcul de `NSN`, une discussion de confusion, ou une alternative de design ?"

Si tu sais remplir cette matrice pour un article, tu es aligne avec l'esprit des corrections `2019-2024`.

## 11. Inventaire Exhaustif Des Notions Effectivement Attendues Dans Les Corrections

Cette section ne reformule pas les conseils du guide. Elle liste, de facon aussi exhaustive que possible, les notions methodologiques effectivement mobilisees dans les corrections `2019-2024`.

Utilisation conseillee:

- si une notion ci-dessous apparait dans ton article, elle est potentiellement examinable,
- si elle n'apparait pas textuellement mais que sa logique est mobilisee par le papier, elle reste potentiellement examinable,
- cette liste sert de checklist brute avant de construire le prompt d'extraction.

### 11.1 Notions de design d'etude

- essai randomise controle,
- essai de phase 3,
- essai ouvert,
- essai pragmatique,
- essai randomise en cluster,
- essai randomise en cluster par paires appariees,
- essai multi-bras,
- design adaptatif,
- approche `MAMS` (`Multi-Arm Multi-Stage`),
- hypothese de superiorite,
- hypothese de non-inferiorite,
- design hybride associant superiorite et non-inferiorite,
- cohorte prospective,
- cohorte retrospective,
- etude longitudinale,
- etude de registre,
- base de donnees administrative / clinique,
- etude transversale repetee,
- serie temporelle interrompue,
- etude ecologique ou avec composante ecologique,
- design quasi-experimental,
- `difference-in-difference`,
- `staggered difference-in-difference`,
- comparaison `negative control`,
- comparaison dans une fratrie,
- analyse multi-niveaux,
- protocole qualitatif complementaire.

### 11.2 Notions de randomisation, allocation et comparabilite

- randomisation par minimisation,
- equilibre des facteurs pronostiques entre bras,
- stratification de la randomisation,
- randomisation au niveau du cluster plutot qu'au niveau individuel,
- contamination entre groupes,
- comparabilite a baseline,
- persistance possible de desequilibres malgre randomisation en cluster,
- necessite d'ajuster sur des covariables malgre randomisation quand le niveau de randomisation et le niveau d'analyse different,
- bras controle unique partage dans un design adaptatif,
- differents comparateurs selon les periodes d'un essai multi-bras evolutif.

### 11.3 Notions d'aveugle et de faisabilite

- absence d'aveugle des patients,
- absence d'aveugle des investigateurs,
- aveugle des evaluateurs,
- adjudication en aveugle,
- impossibilite pratique de l'aveugle,
- relation entre absence d'aveugle et nature objective ou subjective du critere,
- difference conceptuelle entre randomisation et aveugle,
- difficulte particuliere de l'aveugle en psychiatrie,
- difficulte de l'aveugle dans les interventions procedurales ou systemiques.

### 11.4 Notions de criteres de jugement et de variables principales

- critere principal d'efficacite,
- outcome principal en epidemiologie,
- variable a expliquer,
- exposition principale,
- comparateur principal,
- critere clinique,
- critere de sante publique,
- critere de securite,
- critere de substitution / surrogat,
- critere patient-centred,
- critere objectif,
- critere subjectif,
- critere multidimensionnel,
- critere fonctionnel,
- critere de douleur,
- critere de qualite de vie,
- critere composite,
- co-criteres primaires,
- critere d'activite,
- critere d'efficacite,
- pertinence clinique du critere,
- sensibilite au changement,
- fiabilite de la mesure,
- validite de l'instrument,
- `MCID` (`minimal clinically important difference`),
- critique d'un critere trop eloigne de ce qui importe au patient,
- proposition d'outcomes alternatifs plausibles,
- opposition entre pensee clinique et pensee de sante publique.

### 11.5 Notions de multiplicite et de strategie de test

- multiplicite des tests,
- inflation du risque alpha,
- inflation du risque beta quand plusieurs conditions doivent etre remplies,
- hierarchie des tests,
- co-primary endpoint,
- difference conceptuelle entre critere composite et co-criteres,
- positivite exigee sur toutes les composantes d'un co-critere,
- correction du risque de premiere espece,
- comparaison multiple entre bras,
- interpretation critique de resultats secondaires ou exploratoires non controles,
- discussion des `IC95%` malgre une strategie de controle de l'alpha,
- distinction entre cadre de Neyman-Pearson et logique des intervalles de confiance.

### 11.6 Notions de calcul de puissance et de nombre de sujets necessaires

Oui, cette partie etait deja presente dans le guide, mais elle est maintenant explicitee ici comme rubrique autonome.

Notions effectivement attendues:

- `NSN` (`nombre de sujets necessaires`),
- calcul de puissance,
- puissance statistique,
- risque alpha,
- risque beta,
- choix de la difference minimale d'interet,
- choix de la variance ou de l'ecart-type,
- taux d'evenement attendu dans le groupe controle,
- taux d'evenement attendu dans le groupe intervention,
- correlation entre co-criteres,
- impact des co-criteres sur le `NSN`,
- impact d'un design en cluster sur le `NSN`,
- inflation pour pertes attendues / attrition,
- prise en compte des comparaisons multiples,
- marge de non-inferiorite,
- formule de comparaison de proportions,
- formule simplifiee pour variable continue,
- difficulte de reconstruction du `NSN` avec un modele binomial negatif,
- surdispersion dans des donnees de comptage,
- difficulte de reconstruction du `NSN` quand tous les elements ne sont pas donnes dans l'article,
- lien entre puissance et precision des estimations,
- idee que dans de tres grandes cohortes le probleme n'est souvent pas la puissance mais l'interpretation des tailles d'effet.

Notions techniques explicitement croisees dans les corrections:

- package `mpe`,
- fonction `power.known.var`,
- correlation connue entre co-criteres,
- design effect implicite des essais en cluster,
- ajustement grossier pour attrition,
- hypothese de reduction relative du risque,
- approximation du `NSN` pour une hypothese de non-inferiorite.

### 11.7 Notions de modeles statistiques

- modele de `Cox`,
- interpretation d'un `HR`,
- regression de `Poisson`,
- `multi-level Poisson regression`,
- modele lineaire,
- modele lineaire mixte,
- effet aleatoire `cluster` ou `centre`,
- estimateur robuste de variance,
- modele marginal,
- modele conditionnel,
- `flexible parametric models`,
- modele binomial negatif,
- regression logistique,
- echelle additive,
- echelle multiplicative,
- interaction additive,
- interaction multiplicative,
- modele `SARIMA`,
- composantes `AR`, `MA`, `I`, `S`,
- integration de covariables dans une serie temporelle,
- `change point`,
- algorithme `PELT`,
- terme d'interaction en `difference-in-difference`,
- series de modeles emboites,
- choix `theory-driven` des covariables,
- ajustement sur la valeur baseline du critere,
- ajustement sur les variables de stratification,
- ajustement sur des variables techniques de mesure,
- difficulte d'interpretation de certains modeles additifs.

### 11.8 Notions de donnees manquantes, attrition et population analysee

- perdus de vue,
- attrition,
- censure,
- censure non informative,
- difference entre sujets potentiellement inclus et sujets analyses,
- `complete case analysis`,
- `ITT`,
- `PP`,
- tension entre population randomisee et population effectivement exposee,
- validite d'une analyse en cas complets dans un essai,
- exception ou nuance dans les essais en cluster,
- definition operationnelle pas toujours claire d'un "cas complet",
- impact des donnees manquantes sur validite interne et interpretation.

### 11.9 Notions de biais, validite et causalite

- biais ecologique,
- erreurs de classement,
- sensibilite,
- specificite,
- valeur predictive positive,
- confusion,
- confusion non mesuree,
- mediation,
- ajustement inapproprie sur un mediateur,
- causalite inverse,
- `effect modifier`,
- interaction comme modification d'effet,
- evenements exogenes concurrents,
- plausibilite causale,
- limite causale des etudes observationnelles,
- relation entre temporalite et causalite,
- risques de contamination,
- risques de spillover,
- heterogeneite des effets,
- heterogeneite entre etats / centres / clusters,
- limites de validite d'un `staggered DiD`,
- hypothese de tendances paralleles,
- non-generalisation,
- validite externe limitee,
- validite interne fragilisee par les biais residuels.

### 11.10 Notions propres aux sources de donnees

- registre de population,
- donnees du soin courant,
- base NHS / base administrative similaire,
- score psychometrique,
- entretien semi-structure,
- validation sur sous-echantillon,
- adjudication clinique,
- donnees capteurs / port d'un dispositif,
- lourdeur de gestion des registres,
- disponibilite immediate des donnees de registre,
- cout marginal faible d'une question supplementaire sur registre,
- profondeur historique des registres,
- variables non construites pour la question posee,
- manque possible de variables cles.

### 11.11 Notions d'interpretation des resultats

- taille d'effet,
- precision des estimations,
- interpretation d'un `HR` en tenant compte de la frequence d'exposition,
- fractions attribuables,
- difference entre significativite statistique et importance clinique,
- difference entre signification numerique et preuve robuste,
- effet microscopique mais statistiquement detecte,
- conclusion fondee sur sous-groupe,
- fragilite d'une analyse de sous-groupe,
- importance des `IC95%`,
- idee qu'un resultat non significatif n'est pas forcement un resultat negatif,
- idee qu'un resultat statistiquement significatif n'est pas forcement cliniquement interessant,
- analyse critique du rapport benefice/risque,
- interpretation politique ou tendancieuse d'une conclusion,
- evaluation de l'honnetete de l'abstract,
- conflit possible entre narration elegante et rigueur inferentielle.

### 11.12 Notions d'epidemiologie analytique specifiques

- outcome incident,
- preponderance de la precision sur le test dans les grandes cohortes,
- interpretation des expositions de longue duree,
- ajustements successifs et attenuation des effets,
- discussion des facteurs genetiques comme confusion residuelle,
- utilisation d'un score de risque genetique,
- exposition continue versus exposition dichotomisee,
- perte d'information lors du decoupage d'un score,
- existence eventuelle mais rare d'un effet de seuil,
- selection a priori des covariables,
- variables sur le chemin causal a exclure du modele principal,
- negative control exposure,
- comparaison intrafamiliale,
- recit causal construit par contraste entre resultats positifs et negatifs.

### 11.13 Notions de recherche qualitative et d'etudes complementaires

- proposition d'une etude qualitative complementaire,
- theorisation ancree,
- echantillonnage heterogene / raisonne,
- entretiens individuels semi-structures,
- guide d'entretien,
- enregistrement et retranscription,
- double lecture / double codage,
- validation croisee,
- codage iteratif,
- analyse axiale,
- articulation entre resultats quantitatifs et approfondissement qualitatif.

### 11.14 Notions d'innovation methodologique ou d'alternatives de design

- utilisation d'information anterieure adulte pour alleger un essai pediatrique,
- approche bayesienne,
- prior informative bruittee selon plausibilite,
- petit essai complementaire puis integration des evidences,
- `AMM` conditionnelle,
- etude pharmaco-epidemiologique de suivi,
- registre post-autorisation,
- cross-over comme idee a discuter,
- alternative consistant a estimer simplement un risque de rechute plutot que de tester formellement une non-inferiorite.

### 11.15 Notions de questions meta-methodologiques implicites

- "Qu'est-ce que le papier mesure vraiment ?"
- "Qu'est-ce que ce critere prouve reellement ?"
- "Le design etait-il le seul possible ?"
- "Les auteurs racontent-ils une histoire convaincante mais trop belle ?"
- "L'abstract dit-il plus que les resultats ?"
- "Le papier confond-il absence de preuve et preuve d'absence ?"
- "Le choix methodologique releve-t-il en partie d'un arbitrage politique, clinique ou pragmatique ?"

### 11.16 Version ultra-condensee: checklist de notions a connaitre avant lecture d'un nouvel article

- design exact,
- niveau de randomisation ou d'observation,
- aveugle,
- critere principal,
- pertinence clinique / sante publique,
- composite ou co-primaire,
- `NSN` / puissance,
- population analysee,
- modele principal,
- ajustements,
- confusion / mediation / interaction,
- donnees manquantes,
- biais majeurs,
- taille d'effet et `IC95%`,
- sous-groupes,
- multiplicite,
- abstract et conclusion,
- generalisabilite,
- alternatives de design ou d'etude complementaire.
