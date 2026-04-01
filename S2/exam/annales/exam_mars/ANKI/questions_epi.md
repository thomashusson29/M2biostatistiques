#### Article ÉPI : effectiveness vs efficacy

-   **Effectiveness** : en conditions réelles

-   **Efficacy** : en conditions idéales (ici approchée par une comparaison contrefactuelle)

#### Article ÉPI : Différence brute vs ATE

-   la différence observée brute de changement de PHQ-9 : 1,120

-   l’ATE estimé par TMLE : 0,745

-   Différence brute : qu’a-t-on observé dans les deux groupes tels qu’ils existaient ?

-   ATE : que se serait-il passé, en moyenne, si ces patients avaient tous reçu iCBT ou tous reçu fCBT ? (donc en contrôlant pour les déséquilibres de base entre groupes)

#### Article ÉPI : Définition ATE ?

-   ATE : Average Treatment Effect

#### Article ÉPI : définition TMLE ?

-   Combine un modèle d'assignation au traitement (score de propension)

-   Et un modèle de résultat (ici G computation)

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