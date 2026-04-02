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



-   Targeting : ajuste les prédictions du modèle de résultat pour correspondre à la distribution du traitement observé, afin d'obtenir une estimation non biaisée de l'effet du traitement.

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

#### Article épi : pas de pré-enregistrement

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

#### Article épi : différences iCBT vs fCBT = 2 "paquets de soins" différents

-   Pas une comparaison simple du type "même thérapie, seul le support change"

-   2 modalités de PEC différentes : 

    -   format : internet vs face à face

    -   territoire de soins : Uusima pour fCBT vs Finlande entière pour iCBT

    -   organisation du parcours, standardisation des séances, accessibilité

