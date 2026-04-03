#### Article ÉPI : effectiveness vs efficacy

-   **Effectiveness** : en conditions réelles

-   **Efficacy** : en conditions idéales (ici approchée par une comparaison contrefactuelle)

-   Ici : le papier renseigne sur les deux, mais **fait quand même mieux l'effectiveness**. L'efficacy est approchée par des méthodes statistiques d'ajustement, mais ne peut pas garantir l'absence de biais de sélection ou de confusion résiduelle (pas comme dans un essai randomisé).

#### Article ÉPI : Différence brute vs ATE

-   la différence observée brute de changement de PHQ-9 : 1,120

-   l’ATE estimé par TMLE : 0,745

-   Différence brute : qu’a-t-on observé dans les deux groupes tels qu’ils existaient ?

-   ATE : que se serait-il passé, en moyenne, si ces patients avaient tous reçu iCBT ou tous reçu fCBT ? (donc en contrôlant pour les déséquilibres de base entre groupes)

#### Article ÉPI : Définition ATE ?

-   ATE : Average Treatment Effect

#### Article ÉPI : définition TMLE ?

-   Objectif : raisonnement contrefactuel causal : "que se serait-il passé dans un scénario alternatif, scénario qui n'a pas été observé ?"

-   Combine un modèle d'assignation au traitement (**score de propension**)

    -   quelles caractéristiques de base sont associées à la probabilité de recevoir iCBT vs fCBT ?

-   Et un modèle de résultat (ici **G computation**)

    -   compte tenu des caractéristiques de base, que serait le résultat attendu (changement de PHQ-9) pour chaque patient s'il avait reçu iCBT ou s'il avait reçu fCBT ?

-   Targeting : ajuste les prédictions initiales du modèle de résultat pour correspondre à la distribution obtenue par le modèle de traitement, afin d'obtenir une meilleure estimation de l'effet du traitement (ici le paramètre causal ciblé = l'ATE)

-   Ici utilisation de "Super Learner" pour sélectionner les meilleurs modèles prédictifs pour les deux étapes (score de propension et modèle de résultat)

#### Article ÉPI : définition Super learner ?

-   = empilement d’algorithmes : régressions généralisées, lasso, elastic net, arbres, boosting, splines, highly adaptive lasso, etc.

-   Un prédit l’assignation au traitement ;

-   Autre prédit l’outcome ;

-   Pondération des apprenants choisie par validation croisée.

-   Avantages : 

    -   Moins d’arbitraire qu’un seul modèle ;

    -   Plus de souplesse face aux relations non linéaires ;

    -   Meilleure robustesse prédictive.

-   Ne permet pas de garantir l’absence de biais de sélection 

-   Ne permet pas de mesurer directement des variables absentes comme l’affinité numérique ou certaines préférences thérapeutiques.

#### Article ÉPI : 4 hypothèses de l'inférence causale

1.  **Consistance** : suppose que "recevoir iCBT" ou "recevoir fCBT" sont bien définis et suffisamment stables pour permettre une comparaison des résultats entre les 2 méthodes

2.  **Positivité** : suppose que tous les patients ont une probabilité non nulle de recevoir iCBT ou fCBT, ce qui permet d'estimer l'effet du traitement pour tous les types de patients. S'il existe une séparation parfaite entre les groupes en fonction d'une variable (ex : les patients les plus sévères ne reçoivent que du fCBT), alors la positivité est violée et l'estimation de l'effet du traitement peut être biaisée.

3.  **Échangeabilité** : suppose que, après ajustement pour les covariables mesurées, il n'existe pas de facteurs de confusion non mesurés qui pourraient influencer à la fois le choix du traitement (iCBT vs fCBT) et les résultats (changement de PHQ-9). Si des facteurs de confusion non mesurés existent, l'estimation de l'effet du traitement peut être biaisée. En pratique, c'est l'hypothèse la plus difficile à vérifier, car il est souvent impossible de mesurer tous les facteurs de confusion potentiels.

4.   **Non interférence** : suppose que le traitement reçu par un patient n'affecte pas les résultats d'un autre patient. Par exemple, si un patient reçoit iCBT et partage des informations ou des expériences avec un autre patient qui reçoit fCBT, cela pourrait violer l'hypothèse de non interférence et introduire un biais dans l'estimation de l'effet du traitement.

#### Article ÉPI : avantages des données "naturelles"

-   Population large, proche du soin réel

-   Augmente **validité externe** (généralisabilité)

-   Mais risque de biais de sélection (par sélection des patients inclus dans la base de données) et de confusion (par déséquilibres de base entre groupes, même après ajustement)

#### Article ÉPI : avantages de l'approche contrefactuelle

-   Définition : comparer les résultats observés dans le groupe iCBT à ce que seraient les résultats dans ce même groupe si ces patients avaient reçu fCBT (et vice versa)

-   Méthode : ajustement pour les covariables de base (score de propension, modèle de résultat) pour tenter de contrôler les biais de sélection et de confusion

-   Permet d'estimer l'effet du traitement dans des conditions plus proches de la causalité, même si les données sont observationnelles

-   Mais ne peut pas garantir l'absence de biais de sélection ou de confusion résiduelle, notamment par des facteurs non mesurés (ex : affinité numérique, préférences thérapeutiques)

#### Article ÉPI : Flow-chart 

-   Représente surtout les patients avec des données **exploitables** (c'est à dire avec des données de base complètes et au moins une mesure de PHQ-9 après le début du traitement)

-   392 patients *fCBT* vs 5467 patients *iCBT* après sélection : ratio 1:14 !

#### Article ÉPI : pas de pré-enregistrement

-   Plusieurs problèmes : 

    -   *p-hacking* : risque de tester plusieurs analyses différentes et de ne rapporter que celles qui sont significatives, ce qui peut conduire à des résultats biaisés ou non reproductibles.

    -   *HARKing* (Hypothesizing After the Results are Known) : risque de formuler des hypothèses a posteriori, après avoir vu les résultats, ce qui peut également introduire un biais dans l'interprétation des résultats.

    -   Biais de confirmation : les chercheurs peuvent être tentés de se concentrer sur les résultats qui confirment leurs hypothèses initiales, ce qui peut conduire à une interprétation biaisée des données.

    -   Inflation du taux de FP : sans pré-enregistrement, il est plus facile de tester plusieurs analyses différentes et de ne rapporter que celles qui sont significatives, ce qui peut conduire à une inflation du taux de faux positifs (FP) et à des résultats non reproductibles.

-   Ce que font les auteurs pour limiter l'impact :

    -   Nombreuses analyses de sensibility (G-computation, AIPTW, versions simplifiées de TMLE, restriction géographique (Uusimaa)) : permettent de vérifier la **convergence** des résultats

    -   Fournissent le script R d'analyse

    -   2 chercheurs indépendant ont vérifié et recalulé les résultats sur données brutes

    -   Interprétation en lien avec littérature existante

#### Article ÉPI : différences iCBT vs fCBT = 2 "paquets de soins" différents

-   Pas une comparaison simple du type "même thérapie, seul le support change"

-   2 modalités de PEC différentes : 

    -   format : internet vs face à face

    -   territoire de soins : Uusima pour fCBT vs Finlande entière pour iCBT

    -   organisation du parcours, standardisation des séances, accessibilité

#### Article ÉPI : analyses de sensibilité

-   Incluent G-computation, AIPTW, versions simplifiées de TMLE, restriction géographique (Uusimaa)

-   Objectif : améliorer la **robustesse** des résultats en vérifiant la **convergence** des différentes méthodes d'estimation de l'effet du traitement

-   G-computation : modèle de résultat ajusté pour les covariables de base, puis calcul de l'effet du traitement en comparant les résultats prédits pour chaque patient s'il avait reçu iCBT vs s'il avait reçu fCBT

-   AIPTW : combine un modèle de traitement (score de propension) et un modèle de résultat, et utilise une approche d'estimation robuste pour ajuster les prédictions du modèle de résultat en fonction de la distribution obtenue par le modèle de traitement

    -   Différence avec TMLE : AIPTW ne fait pas de "targeting" pour ajuster les prédictions du modèle de résultat, ce qui peut conduire à une estimation moins précise de l'effet du traitement, surtout si les modèles de traitement et de résultat sont mal spécifiés.

#### Article ÉPI : validation croisée 

-   Évite de choisir un modèle sur des données et l'évaluer sur les mêmes données.

-   "Nested 10 fold validation" : 10 sous-échantillons 

    -   1 sous-échantillon à part pour le test final (pli externe)

    -   9 sous-échantillons pour entraîner et comparer les algorithmes (pli interne)

        -   Dans les 9 : nouveau découpage pour entraîner et comparer les algorithmes

        -   En gros : entraîneemnt et sélection des algorithmes sur les 9 plis internes, 

    -   puis évaluation finale sur le pli externe qui n'a jamais été utilisé pour choisir les algorithmes

-   Autrement dit, la validation croisée **interne** sert à répondre à la question : "Parmi tous les algorithmes disponibles, lesquels prédisent le mieux et avec quels poids faut-il les combiner ?"

-   La validation croisée **externe** sert à répondre à une autre question : "Une fois ce choix fait, est-ce que la procédure reste performante sur des données qui n'ont jamais servi à choisir le modèle ?"

-   En résumé : 

    -   Dans le papier, cette logique est utilisée pour les deux briques du TMLE :

        -   le super learner qui prédit le traitement ;
        
        -   le super learner qui prédit l’outcome.

    -   Enfin, l’article précise aussi que les poids des base learners sont attribués automatiquement par une régression de type non-negative least squares. Donc la procédure complète est vraiment :

        -   plusieurs algorithmes candidats ;

        -   validation croisée ;

        -   pondération automatique ;

        -   évaluation sur des plis externes séparés.

#### Article ÉPI : imputation

-   Analyse principale : pas d'imputation (si une seule mesure initiale, $\Delta_\text{PHQ-9} = 0$ si pas de mesure après le début du traitement)

-   Imputation multiple comme analyse de senibilité avec superMICE (inclue super learner dans le processus d'imputation). 

#### Article ÉPI : DAG

-   DAG = Directed Acyclic Graph : outil de représentation visuelle des relations causales entre variables

-   Variables liées à la fois au choix du traitement (iCBT vs fCBT) et à l’outcome (changement de PHQ-9) sont des confondeurs potentiels qui peuvent biaiser l’estimation de l’effet du traitement si elles ne sont pas correctement ajustées.

-   Âge, sexe, sévérité dépressive initiale, anxiété (OASIS), antécédents psychiatriques, statut social et professionnel, région, affinité numérique et préférences thérapeutiques sont des variables qui peuvent influencer à la fois le choix du traitement et l’évolution clinique.

-   **Confondeur** : variable qui influence à la fois le traitement et l’outcome, et qui peut introduire un biais de confusion si elle n’est pas ajustée.

    -   Par exemple : la sévérité initiale peut influencer la probabilité d’être orienté vers iCBT ou fCBT, et peut aussi influencer l’ampleur du changement de PHQ-9..

    -   Autre exemple : la région peut influencer l’accès au type de soin, mais aussi la qualité du parcours, la disponibilité des thérapeutes, le niveau socio-économique moyen ou le profil clinique des patients.

-   **Médiateur** : variable située après le traitement sur le chemin causal menant à l’outcome. 

    -   Si l’on ajustait naïvement sur cette variable, on risquerait de couper une partie de l’effet réel du traitement que l’on cherche justement à estimer.

    -   Par exemple, l’adhésion effective au programme peut être influencée par le type de traitement, et à son tour influencer l’amélioration du PHQ-9.

    -   Dropout : peut être un médiateur partiel (le format de soin peut favoriser ou défavoriser la poursuite du suivi) mais aussi un collider si on conditionne dessus de manière maladroite. 

-   **Collider** : variable influencée par deux causes différentes.

    -   Par exemple, le dropout peut être influencé à la fois par le traitement reçu et par l’évolution clinique réelle ou des facteurs non mesurés comme la motivation ou l’affinité numérique.

    -   Si l’on analyse seulement les patients qui ont complété le suivi, ou si l’on ajuste directement sur une variable de complétion post-traitement sans précaution, on peut ouvrir artificiellement un chemin de biais entre traitement et outcome.

    -   Autre exemple de collider potentiel : la complétion du suivi, qui peut être influencée à la fois par le traitement et par des facteurs non mesurés liés à l’évolution clinique ou à la motivation.

#### Article ÉPI : Analyse de contrôlé négatif

-   Exposition ou outcome non lié causalement à l'effet étudié

-   Permet de vérifier la présence de biais de confusion non mesuré : si on trouve un effet significatif pour une association qui ne devrait pas exister, cela suggère que des facteurs de confusion non mesurés pourraient biaiser les résultats.

-   **Negative outcome** : outcome pour lequel on ne s'attend pas à un résultat. Par exemple, changement de PHQ-9 avant de commencer le traitement ou changement non psychiatrique (ex : changement de poids).

-   **Negative exposure** : exposition pour laquelle on ne s'attend pas à un résultat. Par exemple, un traitement qui n'est pas censé influencer le PHQ-9 (ex : un traitement pour une condition médicale non liée à la santé mentale).

#### Article ÉPI : Problème du dropout

-   Problème.: on n'est pas sur que les données manquantes soient "MAR" : il est possible que les patients aient abandonné car ça ne leur plaisit pas !! Donc potentiel risque de sélection de patients plus motivés ou plus satisfaits dans les analyses complètes, ce qui pourrait biaiser les résultats en faveur du traitement qui a le plus de dropout.

#### Article ÉPI : Taille d'effet intra-groupe

-   Effet intra-groupe : changement de PHQ-9 dans le groupe iCBT ou dans le groupe fCBT, sans comparaison entre les groupes

-   Amélioration peut refléter : 

    -   un effet réel du traitement ;

    -   un effet placebo ou de régression vers la moyenne (c'est à dire que les patients avec des scores de PHQ-9 plus élevés au départ ont plus de marge de progression, même sans traitement efficace) ;

    -   évolution naturelle

    -   sélection des patients qui complètent

#### Article ÉPI : Exclusion du PHQ-9 initial dans les covariables du modèle de résultat

-   Modèle : sur **changement** de PHQ-9 et pas sur PHQ-9 final

-   Donc si on inclue le PHQ-9 initial comme covariable, on ajuste pour une variable qui est déjà incluse dans le résultat (changement de PHQ-9 = PHQ-9 final - PHQ-9 initial), ce qui peut introduire des problèmes de colinéarité et rendre l'estimation de l'effet du traitement moins stable.

#### Article ÉPI : PHQ-9 baseline plus bas dans le groupe fCBT par rapport au groupe iCBT

-   PHQ-9 initial est plus bas en fCBT (11,57) qu’en iCBT (13,31)

-   Outcome : $\Delta_\text{PHQ-9} = \text{PHQ-9}_\text{fin} - \text{PHQ-9}_\text{début}$

-   Score initial plus élevé dans le groupe iCBT donc plus de marge de progression dans le groupe iCBT, même sans traitement efficace (régression vers la moyenne)

-   **Confusion par indication** : plus sévères orientés vers iCBT, moins sévères vers fCBT. 

-   Problème d'inclure : dépendance artificielle entre la variable et l'outcome qui contient déjà cette variable. 

-   D'où la tentative d'inclure le PHQ-9 initial dans les covariables du modèle de résultat pour tenter de contrôler ce biais, mais finalement pas retenu à cause d'artefact statistique. 

-   Les analyses de sensibilité dans lesquelles le PHQ-9 initial est inclus atténuent fortement l'effet, jusqu'à un ATE proche de 0 dans le TMLE complet

-   Point méthodologique le plus fragile : estimation de l'ATE très sensible à l'inclusion ou non du PHQ-9 initial dans les covariables du modèle de résultat, ce qui suggère que le biais de confusion par indication est un problème majeur dans cette étude. Il n'est pas sur que les méthodes d'ajustement utilisées soient suffisantes pour contrôler ce biais.

#### Article ÉPI : Autre méthode sur données "naturalistes"

-   Changer d'estimand ! et passe à $\text{PHQ9}_\text{fin}$ comme outcome, et inclure $\text{PHQ9}_\text{initial}$ comme covariable du modèle de résultat

-   Avantage : permet de contrôler plus efficacement le biais de confusion par indication lié à la sévérité initiale, en ajustant directement pour le PHQ-9 initial dans le modèle de résultat.

-   Inconvénient : on perd la dimension "changement" qui est plus intuitive pour les cliniciens, et on suppose que l'effet du traitement est constant quel que soit le niveau initial de sévérité, ce qui peut ne pas être le cas.

-   D'autant plus que le "changement" a été validé précédement comme outcome pertinent, donc perte de la **triangulation** qui est un avantage majeure de l'article.

#### Article ÉPI : Biais écologique : c'est quoi, possible dans cet article ? 

-   Biais survenant en cas de données AGRÉGÉES

-   Ici : plutôt confusion liée à la différence de territoire de soins (Uusimaa pour fCBT vs Finlande entière pour iCBT)

#### Article ÉPI : facteurs génétiques ?

-   Plausible

-   PEC des antécédents familiaux dans les registres, qui sont des proxys imparfaits de la charge génétique

#### Article ÉPI : Digital afifnity ?

-   Confondeur non mesuré très plausible

-   Confondeur : c'est à dire qu'il est lié à la fois au choix du traitement (iCBT vs fCBT) et à l'outcome (changement de PHQ-9)

-   NB : 

    -   mediator = variable située après le traitement sur le chemin causal menant à l’outcome, qui peut être influencée par le traitement et influencer l’outcome, mais qui n'est pas un confondeur car elle ne préexiste pas au traitement (par exemple, l'adhésion effective au programme peut être influencée par le type de traitement, et à son tour influencer l'amélioration du PHQ-9, mais elle ne préexiste pas au choix du traitement)

   -   collider = variable influencée par deux causes différentes, qui peut introduire un biais de sélection si on conditionne dessus de manière maladroite (par exemple, le dropout peut être influencé à la fois par le traitement et par des facteurs non mesurés liés à l’évolution clinique ou à la motivation, et si l’on analyse seulement les patients qui ont complété le suivi, on peut introduire un biais de sélection).

 