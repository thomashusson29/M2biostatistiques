# Corrections proposées pour les questions sans corrigé officiel

## Statut du document

Ce document contient des **corrections proposées**, pas des corrigés officiels. Elles sont construites à partir :

- des corrigés disponibles sur les années récentes ;
- des articles sources présents dans le dossier ;
- des règles classiques de calcul de NSN, de puissance, et d’interprétation de la précision.

Quand un article ne donne pas assez d’éléments pour reconstruire exactement le calcul, je donne une **réponse défendable d’examen**, avec un **ordre de grandeur** et la **logique méthodologique attendue**.

## 2011 EPI

- Source question : `exam_2011_Epi_RC.docx`
- Source article : `Exam_2011_Epi.pdf`
- Question : « Dans la mesure du possible calculez une puissance a posteriori. »

### Correction proposée

Une puissance a posteriori n’est pas la meilleure façon de discuter ce papier, car une fois que l’on a l’estimation d’effet et son intervalle de confiance, la “puissance observée” n’apporte pas beaucoup plus que le résultat lui-même. Il faut donc d’abord le dire.

Si on fait malgré tout un calcul grossier, deux lectures sont possibles. Si l’on prend la comparaison brute entre le groupe “screening” et son groupe historique, l’effet observé est important et précis : rate ratio = 0,72, IC95% 0,63 à 0,81, p<0,001. Dans cette lecture, la puissance a posteriori est très élevée, pratiquement de 100%.

Mais la vraie question scientifique est plutôt l’effet **attribuable spécifiquement au dépistage**, après prise en compte de l’amélioration générale de la prise en charge. Les auteurs concluent alors à une réduction relative d’environ 10%, avec IC95% de -4% à 24%, donc non significative. Avec cet effet net beaucoup plus modeste, la puissance a posteriori devient faible, de l’ordre de 30%. C’est probablement cette lecture qu’il faut privilégier ici.

La bonne conclusion est donc : **l’étude est grande, mais elle n’a pas une très bonne capacité à isoler un effet propre du dépistage quand les progrès thérapeutiques réduisent déjà la mortalité en parallèle**. En examen, il faut insister sur le fait que l’intervalle de confiance est plus informatif qu’une puissance calculée après coup.

## 2011 RC

- Source question : `exam_2011_Epi_RC.docx`
- Source article : `Exam_2011_RC.pdf`
- Question : « L’analyse est réalisée en ITT et le nombre de sujets nécessaire est calculé en tenant compte d’un nombre de perdus de vue possible. Qu’en pensez-vous ? »

### Correction proposée

L’idée générale est acceptable, mais il faut distinguer deux choses qui sont souvent mélangées : **l’arrêt du traitement** et la **perte de l’information de suivi**.

Dans une analyse en ITT, tous les sujets randomisés restent analysés dans leur bras initial, même s’ils arrêtent le traitement. Donc, en théorie, on n’a pas à majorer le NSN simplement parce qu’on anticipe de la non-observance ou des arrêts de traitement. En revanche, il est légitime d’augmenter le NSN si l’on prévoit de **vraies pertes de vue** ou des données manquantes sur le critère principal.

Dans cet essai, les auteurs prévoyaient 9000 sujets, 2160 événements, 80% de puissance, un alpha bilatéral de 5%, et ils supposaient aussi 30% de discontinuation du traitement. Le point important est que le critère principal est un critère de temps jusqu’à événement, et que le suivi des événements a été poursuivi même après arrêt du traitement. D’ailleurs, les pertes de vue effectives après randomisation semblent faibles au regard de la taille de l’essai : 47 dans le bras sibutramine et 58 dans le bras placebo.

La réponse attendue est donc la suivante : **prévoir un peu de marge pour les vraies pertes d’information est cohérent, mais il ne faut pas confondre cela avec les simples arrêts de traitement**. Avec une vraie stratégie ITT et un bon suivi des événements, l’inflation du NSN pour “perdus de vue” doit rester limitée. Le calcul ici est plutôt conservateur, ce qui n’est pas absurde, mais conceptuellement la distinction devait être explicitée.

## 2012 EPI

- Source question : `exam_2012_Epi_RC.docx`
- Source article : `Exam_2012_Epi.pdf`
- Question : « Il est indiqué dans le texte que: “The low number of events limited the statistical power of the study”. Pouvez-vous retrouver au moins approximativement cette puissance statistique ? »

### Correction proposée

La remarque des auteurs est justifiée. Le problème majeur est le **très faible nombre d’événements** chez les sujets exposés au traitement : 7 événements seulement chez les current users, contre 49 chez les non-users, avec un hazard ratio ajusté de 0,75 et un IC95% très large, de 0,31 à 1,85.

Si l’on fait un calcul très grossier de puissance a posteriori à partir de l’effet observé, on trouve une puissance très faible, de l’ordre de **10%** seulement. Ce chiffre ne doit pas être surinterprété, mais il montre bien que l’étude n’avait pas la capacité de conclure finement sur un effet modéré.

Autre façon de le dire, souvent plus intelligente en examen : l’intervalle de confiance est compatible avec **l’absence d’augmentation du risque**, mais aussi avec **une augmentation substantielle**, allant jusqu’à presque un doublement du risque. Donc l’étude rassure contre un effet massif, mais elle **n’exclut pas proprement un sur-risque modéré à important**.

On peut même dire qu’avec aussi peu d’événements chez les exposés actuels, la puissance pour détecter un hazard ratio de 1,5 serait faible, et qu’elle resterait seulement moyenne même pour un hazard ratio de 2. La bonne conclusion est donc : **faible puissance, surtout pour des effets modestes, ce qui explique la largeur de l’IC95%**.

## 2012 RC

- Source question : `exam_2012_Epi_RC.docx`
- Source article : `Exam_2012_RC.pdf`
- Question : « Essayez de retrouver approximativement le nombre de sujet nécessaire. »

### Correction proposée

Ici, il faut d’abord remarquer que le raisonnement n’est pas présenté comme un NSN “simple” à deux proportions, mais comme un **essai event-driven**. Les auteurs disent qu’ils attendaient **800 événements primaires adjudiqués** sur un suivi moyen de 4,6 ans, ce qui devait donner **85% de puissance** pour détecter une **réduction de 25%** du critère principal révisé, avec un **alpha unilatéral de 2,5%**.

Du coup, le plus honnête est de répondre que le nombre de sujets nécessaire ne peut pas être reconstruit exactement sans les hypothèses détaillées d’incidence, de recrutement étalé, et de censure. En revanche, on retrouve bien un **ordre de grandeur de quelques milliers de patients**.

L’article a finalement randomisé **3414 patients** (1718 niacine, 1696 placebo). Si l’on fait un calcul de coin de table à partir de la cible de 800 événements et d’un risque cumulé de l’ordre de 20% sur la durée de suivi, on retombe sur un besoin d’environ **3400 à 3800 sujets randomisés**, soit autour de **1700 à 1900 par bras**.

La bonne correction est donc : **NSN approximatif autour de 3500 patients randomisés**, avec la précision que le vrai paramètre de planification était surtout un **nombre d’événements attendus**, pas seulement un nombre fixe de sujets.

## 2013 EPI

- Source question : `exam_2013_Epi_RC.docx`
- Source article : `Exam_2013_Epi.pdf`
- Question : « Dans l’article on ne trouve pas de justification de la taille de l’échantillon. A posteriori, il n’est pas facile de calculer une puissance statistique. Essayez tout de même de proposer un tel calcul, même très rudimentaire. »

### Correction proposée

Le premier point à dire est qu’un calcul classique de puissance est ici assez mal adapté. Il s’agit d’une **étude transversale descriptive et analytique**, sans vrai groupe contrôle expérimental, et l’article ne formule pas une hypothèse principale unique sur laquelle un NSN a priori aurait été construit. D’ailleurs, le papier précise surtout une contrainte de **faisabilité**, avec au moins **25 sujets par site**, ce qui a conduit à **1082 participants** au total.

Dans ce contexte, la meilleure réponse n’est pas un “NSN” au sens strict, mais un raisonnement de **précision**. Par exemple, pour le résultat principal, 855 participants sur 1082, soit environ **79%**, rapportent une discrimination vécue dans au moins un domaine. L’erreur standard de cette proportion est faible, et l’IC95% est grossièrement de **76,6% à 81,4%**. Donc, pour décrire la fréquence de ce phénomène, la précision est bonne.

On peut ajouter que pour les analyses multivariées, l’effectif global est également confortable : plus de mille sujets, plusieurs centaines d’événements, et un nombre de variables explicatives raisonnable. Le vrai problème n’est donc pas tellement la puissance globale, mais plutôt l’absence d’un **objectif principal unique** et d’un **calcul a priori formalisé**.

La réponse attendue est donc : **pas de calcul de puissance standard vraiment pertinent ; à défaut, on peut montrer que l’effectif permet une estimation assez précise des proportions principales et des modèles multivariés stables**.

## 2014 EPI

- Source question : `exam_2014_Epi_RC.docx`
- Source article : `Exam_2014_Epi.pdf`
- Question : « Dans l’article on ne trouve pas de justification de la taille de l’échantillon. A posteriori, il n’est pas facile de calculer une puissance statistique. Essayez tout de même de proposer un tel calcul, même très rudimentaire. »

### Correction proposée

Comme en 2013, il faut d’abord dire qu’un calcul de puissance a posteriori n’est pas la meilleure manière de juger cette étude, car il s’agit d’une **très grande cohorte observationnelle** et non d’un essai planifié autour d’une hypothèse unique.

Cela étant dit, l’article inclut **76 464 femmes** et **42 498 hommes**, pour plus de **3 millions de personnes-années** de suivi et **27 429 décès**. Avec un tel nombre d’événements, il n’y a clairement **pas de problème de puissance** pour l’analyse principale. Par exemple, pour la consommation la plus élevée de noix versus jamais, le hazard ratio multivarié est d’environ **0,80**, avec un **IC95% 0,73 à 0,86**, donc un intervalle étroit et un résultat très précis.

Si l’on insistait malgré tout pour faire une “puissance observée”, elle serait pratiquement de **100%** pour l’effet principal étudié. Mais la bonne discussion méthodologique est ailleurs : dans une cohorte aussi grande, l’enjeu principal n’est pas la puissance, c’est la **validité causale**, donc la confusion résiduelle, les biais de mesure, et l’interprétation causale.

La bonne conclusion d’examen est donc : **effectif énorme, nombre d’événements énorme, puissance très élevée ; la limite de l’étude n’est pas un manque de puissance mais le risque de biais et de confusion**.

## 2016 EPI

- Source question : `exam_2016_Epi_RC.docx`
- Source article : `exam_epi_20152016.pdf`
- Question : « Comment aborder la question de la puissance statistique dans une telle étude ? »

### Correction proposée

Dans cette étude de cohorte issue du Framingham Heart Study, la question de la puissance ne s’aborde pas comme dans un essai randomisé avec un NSN a priori. Il faut raisonner à partir du **nombre de sujets**, du **nombre d’événements**, des **sous-groupes**, et de la **précision** des estimations.

Ici, l’effectif global est important : **9511 participants**, **202 417 personnes-années**, et **1544 cas incidents** de fibrillation atriale. Pour les analyses globales de fréquence et pour les grands facteurs de risque, on peut considérer que la puissance est globalement bonne.

En revanche, les auteurs disent eux-mêmes que les premières décennies comportaient peu de cas et que cela entraînait de **larges erreurs standard** et une **puissance restreinte pour détecter des tendances au fil des décennies**. Donc la bonne réponse n’est pas “l’étude est puissante” ou “l’étude n’est pas puissante”, mais : **la puissance est correcte pour les analyses principales, et plus faible pour certaines comparaisons temporelles fines, certains sous-groupes, ou certaines complications rares**.

En examen, il faut donc dire qu’on juge ici la puissance surtout par le **nombre d’événements observés** et par la **largeur des intervalles de confiance**, pas par un calcul de NSN classique.

## 2025 RC

- Source question : `exam_2025_Epi_RC.docx`
- Source article : `Article_RC2025.pdf`
- Question : « A l’aide des données disponibles dans l’article, essayez de retrouver au moins approximativement une estimation du nombre de sujets à inclure dans l’essai. »

### Correction proposée

Ici, la correction est en fait directement reconstructible à partir de l’article. Les auteurs précisent que le calcul repose sur un **test du log-rank bilatéral**, avec :

- une **durée totale d’étude de 48 mois** ;
- un **recrutement pendant les 36 premiers mois** ;
- **12% de dropouts dans chaque bras** ;
- une proportion de patients sans rechute passant de **50% dans le groupe contrôle à 70% dans le groupe traité** pendant la première année ;
- une **puissance de 80%** ;
- un **alpha de 5%**.

Avec ces hypothèses, les auteurs concluent qu’il faut **300 sujets au total**, soit **150 par bras**. L’essai en a finalement randomisé **305**, ce qui est parfaitement cohérent avec ce calcul.

La réponse attendue est donc simple : **environ 300 patients, soit 150 dans chaque groupe**.
