# Questions-Reponses Article EPI 2025

Support:
- `article_epi_1.pdf`

Principe:
- questions formulees comme des sujets d'examen plausibles,
- reponses types redigees,
- calibrees sur l'esprit des annales corrigees.

Ce ne sont pas des corrections officielles. Ce sont des reponses modele, fondees sur l'article.

Convention de lecture:
- je privilegie le francais;
- quand le terme anglais est important parce qu'il apparait dans l'article, je le garde entre parentheses;
- je conserve ensuite les sigles du papier pour que tu puisses faire le lien facilement avec le PDF.

## Glossaire des sigles et termes indispensables

- `iCBT` : therapie cognitivo-comportementale sur internet guidee par un therapeute (`therapist-guided internet-delivered cognitive behavioural therapy`).
- `fCBT` : therapie cognitivo-comportementale en face a face (`face-to-face cognitive behavioural therapy`).
- `PHQ-9` : questionnaire de sante du patient en 9 items (`Patient Health Questionnaire-9`), utilise ici pour mesurer les symptomes depressifs.
- `ATE` : effet moyen du traitement (`average treatment effect`), c'est-a-dire la difference moyenne de resultat si tout le monde recevait un traitement plutot que l'autre.
- `ATT` : effet moyen du traitement chez les traites (`average treatment effect on the treated`).
- `TMLE` : estimation ciblee du maximum de vraisemblance (`targeted maximum likelihood estimation`), methode d'inference causale.
- `super learner` : super-apprenant (`super learner`), c'est-a-dire un meta-algorithme qui combine plusieurs modeles predictifs.
- `RCTs` : essais randomises controles (`randomized controlled trials`).
- `DAG` : graphe acyclique dirige (`directed acyclic graph`).
- `AIPTW` : ponderation inversee de la probabilite de traitement augmentee (`augmented inverse-probability-of-treatment weighting`).
- `G-computation` : g-computation (`g-computation`), methode d'estimation causale fondee sur un modele de resultat.
- `IPW` : ponderation par l'inverse de la probabilite (`inverse probability weighting`).
- `AUC` : aire sous la courbe (`area under the curve`).
- `R²` : coefficient de determination (`R-squared`).
- `efficacy` : efficacite en conditions controlees ou ideales.
- `effectiveness` : efficacite en conditions reelles.
- `counterfactual` : contrefactuel, c'est-a-dire un monde possible non observe.
- `consistency` : hypothese de coherence des versions du traitement (`consistency`).
- `no interference` : absence d'interference entre patients (`no interference`).
- `positivity` : positivite, ou recouvrement suffisant des profils de patients entre groupes (`positivity`).
- `baseline` : valeur initiale, mesure faite avant le traitement.
- `dropout` : abandon en cours de prise en charge (`dropout`).
- `stepped care` : prise en charge par paliers (`stepped care`).
- `black box` : boite noire (`black box`), c'est-a-dire une methode difficile a lire intuitivement.
- `standardized mean differences` : differences moyennes standardisees (`standardized mean differences`).
- `digital affinity` : aisance numerique (`digital affinity`).
- score de propension (`propensity score`) : probabilite estimee de recevoir un traitement en fonction des covariables observees.

## Q1. De quel type d'etude s'agit-il exactement ?

Il s'agit d'une etude observationnelle analytique, plus precisement d'une cohorte retrospective sur registres, comparant des patients recevant une therapie cognitivo-comportementale sur internet guidee par un therapeute (`guided iCBT`) a des patients recevant une therapie cognitivo-comportementale en face a face (`face-to-face CBT`). Les auteurs ne se contentent pas d'une comparaison descriptive: ils essayent d'estimer une quantite causale, l'`ATE`, au moyen d'une approche contrefactuelle avec `TMLE` et `super learner`. Ce n'est donc ni un essai randomise, ni une simple etude de registres descriptive.

## Q2. Qu'apporte cette etude par rapport aux `RCTs` existants ?

Les `RCTs` montrent l'efficacite dans des contextes controles mais peuvent manquer de representativite. Ici, l'interet est double: utiliser des donnees de routine, donc plus proches de la pratique reelle, et essayer de repondre a la meme question causale que les `RCTs` au moyen d'une methode observationnelle sophistiquee. L'etude cherche donc a completer les `RCTs`, pas a les remplacer. C'est la logique de la triangulation: si plusieurs sources de preuve de nature differente convergent, la confiance augmente.

## Q3. Qu'est-ce que l'`ATE` dans cet article ?

L'`ATE`, ou effet moyen du traitement (`average treatment effect`), correspond a la difference moyenne de resultat qu'on observerait si l'ensemble des patients recevait `iCBT` plutot que `fCBT`, ou inversement, toutes choses egales par ailleurs. C'est une quantite contrefactuelle: on compare deux mondes possibles qui ne peuvent pas etre observes simultanement chez les memes patients. Ici, le critere de jugement principal (`outcome`) est la variation du score `PHQ-9`, donc l'`ATE` porte sur la reduction moyenne des symptomes depressifs sous une strategie versus l'autre.

## Q4. Quelle est la question causale centrale du papier ?

La question implicite est: si on pouvait allouer les memes patients soit a une therapie cognitivo-comportementale sur internet guidee par un therapeute (`guided iCBT`), soit a une therapie cognitivo-comportementale en face a face, obtiendrait-on le meme effet moyen sur les symptomes depressifs ? C'est une question de type contrefactuel, tres differente d'une simple comparaison brute de groupes deja formes. Tout l'effort methodologique du papier consiste a essayer de rendre cette comparaison observationnelle aussi informative que possible causalement.

## Q5. Pourquoi les auteurs parlent-ils a la fois d'efficacite en conditions controlees (`efficacy`) et d'efficacite en conditions reelles (`effectiveness`) ?

L'efficacite en conditions controlees (`efficacy`) renvoie plutot a ce qu'on observe dans des conditions controlees, typiquement les `RCTs`. L'efficacite en conditions reelles (`effectiveness`) renvoie a l'effet en pratique courante. Les auteurs veulent montrer que l'equivalence observee dans les `RCTs` pourrait aussi se retrouver dans des donnees de routine. Leur argument est qu'en utilisant des methodes contrefactuelles sur les registres, ils peuvent parler a la fois de routine clinique et, sous hypotheses fortes, de la question causale elle-meme. C'est ambitieux, mais il faut rester prudent car cela depend d'hypotheses non testables.

## Q6. Quelles sont les grandes forces des registres utilises ici ?

Leur grande force est la taille, la richesse et le caractere naturaliste des donnees. Les registres permettent de capter des patients de routine, avec beaucoup d'informations cliniques, sociales, familiales et de consommation de soins. Cela augmente potentiellement la representativite et permet d'ajuster sur de nombreux facteurs. Les registres nordiques ont aussi une profondeur temporelle interessante et une qualite generalement bonne pour les evenements administratifs et de soins.

## Q7. Quelles sont les grandes limites de ces registres ?

Ils ne sont pas construits pour repondre a cette question de recherche precise. Certaines variables cruciales peuvent manquer, etre mesurees imparfaitement ou differer selon le contexte de soin. En particulier, des facteurs comme l'affinite numerique, la motivation pour un traitement en ligne, les preferences patient, ou la finesse clinique de certaines indications peuvent etre mal captes. De plus, les donnees privees semblent moins bien capturees que certaines donnees publiques.

## Q8. Qu'est-ce qu'un `TMLE` et pourquoi l'utiliser ici ?

Le `TMLE` est une methode d'inference causale semiparametrique qui combine un modele d'assignation du traitement et un modele de resultat (`outcome`) afin d'estimer une quantite cible, ici l'`ATE`. Son interet est de pouvoir utiliser des modeles flexibles et d'etre asymptotiquement doublement robuste dans certains cadres. Ici, il sert a tirer parti de nombreuses covariables et a mieux gerer la complexite des relations que ne le ferait une regression simple. C'est donc une methode adaptee a un article de registres riche et ambitieux causalement.

## Q9. Quel est le role du `super learner` dans cet article ?

Le `super learner` est un ensemble de modeles qui combine plusieurs algorithmes pour produire une prediction plus performante qu'un seul modele fixe. Ici, un `super learner` predit l'allocation de traitement et un autre predit le resultat (`outcome`). L'idee est de limiter le risque qu'un modele trop rigide soit mal specifie. En pratique, cela rend l'approche plus flexible, mais aussi plus opaque pedagogiquement, ce que les auteurs reconnaissent eux-memes en parlant d'un certain caractere de boite noire (`black box`).

## Q10. Quelles hypotheses causales explicites faut-il accepter pour interpreter l'`ATE` ?

L'article explicite notamment:
- que les confondeurs pertinents sont observes,
- la `consistency`,
- la `no interference`,
- la `positivity`.

Il faut aussi accepter que les dependances entre covariables, traitement et resultat (`outcome`) soient suffisamment bien modelisees. Sans ces hypotheses, l'`ATE` n'est plus interpretable comme effet causal. Ce point est central: la sophistication statistique ne dispense pas des hypotheses causales.

## Q11. Que signifie l'hypothese de `consistency` ici ?

La `consistency` signifie qu'il n'existe pas plusieurs "versions" heterogenes et non equivalentes du traitement sous une meme etiquette analytique. Or ici, cette hypothese est fragile, car `iCBT` et `fCBT` ne different pas seulement par le canal de delivrance. Ils different aussi par le contexte de prise en charge, les therapeutes, la standardisation, la duree et meme certains criteres d'eligibilite. Donc la question "internet versus face a face" n'isole pas un facteur simple aussi proprement qu'un essai pharmacologique.

## Q12. Que signifie l'hypothese de `no interference` ?

Elle signifie que le resultat d'un patient ne depend pas du traitement recu par un autre patient. Dans ce contexte, cette hypothese est probablement moins problematique que d'autres. On peut raisonnablement penser qu'un patient en `iCBT` ne modifie pas directement la reponse d'un patient en `fCBT`. Ce n'est pas l'hypothese la plus fragile du papier.

## Q13. Que signifie l'hypothese de `positivity` et pourquoi est-elle discutable ici ?

La `positivity` signifie qu'a profil de covariables donne, il existe une probabilite non nulle de recevoir chacun des deux traitements. Or ici, `fCBT` est surtout delivree dans la region de `Uusimaa`, alors que `iCBT` est nationale; de plus, `iCBT` a des criteres d'exclusion supplementaires. Il est donc plausible que certains profils de patients aient en pratique une chance quasi nulle de recevoir l'un des deux traitements. Cela fragilise l'interpretation causale, car l'estimation peut reposer sur des extrapolations.

## Q14. Quelle est selon vous l'hypothese causale la plus fragile de l'article ?

La plus fragile est probablement l'absence de confusion non mesuree, suivie de tres pres par la `consistency`. Meme avec beaucoup de covariables, il reste plausible que des facteurs importants comme les preferences de traitement, l'autonomie numerique, la severite clinique fine, la motivation, ou des elements de selection clinician-driven ne soient pas pleinement observes. Le papier en est conscient et cite notamment la `digital affinity` comme variable d'interet non mesuree.

## Q15. Comment le critere de jugement principal (`primary outcome`) est-il defini ?

Le critere de jugement principal (`primary outcome`) est la variation du score `PHQ-9` entre la valeur initiale (`baseline`) et la derniere mesure disponible immediatement apres traitement. Les auteurs ne retiennent pas ici les suivis automatises a `3 mois` apres `iCBT`. Si un patient n'a qu'une seule mesure `PHQ-9`, son changement est fixe a `0`. C'est donc un critere de jugement cliniquement interpretable, mais tres dependant du calendrier de mesure et de la facon de gerer les abandons.

## Q16. Que pensez-vous du choix de la variation du `PHQ-9` (`PHQ-9 change score`) comme critere de jugement principal ?

C'est un choix defendable, car le `PHQ-9` est un instrument valide, bref et largement utilise. Le score de changement est intuitif et parle cliniquement. En revanche, il a aussi des limites: il est auto-rapporte, sensible a la frequence des mesures, et sa construction peut poser des problemes analytiques, notamment lorsqu'on discute l'ajustement sur la valeur initiale (`baseline`). C'est donc un bon critere de jugement pratique, mais pas un critere de jugement exempt de difficultes methodologiques.

## Q17. Que penser du fait d'attribuer un changement de `0` aux patients avec une seule mesure ?

C'est une strategie conservative qui penalise les traitements avec beaucoup d'abandons (`dropout`). Les auteurs disent clairement qu'elle penalise surtout `iCBT`, qui a davantage d'abandons. Cette approche est defendable si l'on considere que quitter precocement sans second score traduit l'absence de preuve d'amelioration. Mais elle est aussi discutable, car certains abandons peuvent correspondre a d'autres situations: guerison rapide, changement de filiere, probleme logistique, ou simplement mesure manquante. Donc c'est une convention analytique utile, pas une verite clinique.

## Q18. L'abandon en cours de prise en charge (`dropout`) doit-il etre interprete comme un echec therapeutique ici ?

Pas automatiquement. Les auteurs soulignent a juste titre qu'en psychiatrie et en prise en charge par paliers (`stepped care`), un abandon ou une absence de seconde mesure ne signifie pas toujours une absence de benefice. Toutefois, dans une analyse comparative, on ne peut pas ignorer l'abandon (`dropout`) quand il differencie fortement les groupes. La bonne position d'examen est donc nuancee: le traiter comme un echec est trop fort, mais l'ignorer serait methodologiquement encore pire.

## Q19. Pourquoi les auteurs n'incluent-ils pas le `PHQ-9` initial (`baseline`) dans l'analyse principale ?

Ils expliquent qu'inclure la valeur initiale (`baseline`) du `PHQ-9` dans un modele dont le critere de jugement (`outcome`) est deja un score de changement peut creer une dependance artificielle, surtout en presence d'erreur de mesure. C'est un argument classique. Ils preferent donc ne pas l'utiliser dans l'analyse principale et le reservent a des sensibilites. Ce choix est defendable, mais il est lui-meme examinable, car beaucoup de lecteurs auraient intuitivement voulu ajuster sur la valeur initiale et constateront que les resultats s'attenuent lorsqu'on le fait.

## Q20. Que montrent justement les analyses de sensibilite quand on inclut le `PHQ-9` initial (`baseline`) ?

Elles montrent que les estimations deviennent beaucoup moins convaincantes et parfois proches de zero. Cela ne detruit pas necessairement la conclusion, mais cela montre que l'effet estime n'est pas completement indifferent aux choix de modelisation. A l'examen, il faut voir ce point comme un signal de fragilite relative, pas comme un simple detail technique.

## Q21. Quel est le resultat principal a connaitre ?

L'`ATE` principal indique que le score `PHQ-9` decline d'environ `0.745` point de plus dans le groupe `iCBT` que dans le groupe `fCBT`, avec un `IC95%` de `0.156 a 1.334`. La difference brute moyenne est plus grande, autour de `1.120` point, mais l'estimation causale ajustee est plus faible. Cela suggere un leger avantage de `iCBT`, ou au minimum l'absence de desavantage clair.

## Q22. Ce resultat est-il cliniquement important ?

Probablement pas de facon spectaculaire. Les auteurs rappellent qu'une baisse de `1.7` point du `PHQ-9` correspond a peu pres a une amelioration subjectivement detectee. Or l'`ATE` estime est inferieur a ce seuil. Donc, meme si statistiquement le resultat est compatible avec une petite superiorite de `iCBT`, son importance clinique moyenne parait modeste. En revanche, cela soutient bien l'idee que `iCBT` n'est pas cliniquement inferieure.

## Q23. Les analyses de sensibilite vont-elles globalement dans le meme sens ?

Oui, globalement. Les auteurs presentent des estimations par `G-computation`, `AIPTW` et des versions plus simples du `TMLE`, ainsi que des analyses avec imputations ou restriction geographique. L'ensemble est plutot convergent vers l'idee d'une efficacite similaire ou legerement favorable a `iCBT`. Cependant, la stabilite n'est pas parfaite, notamment avec certains ajustements incluant la valeur initiale (`baseline`) du `PHQ-9`. Cela invite a une lecture prudente mais pas sceptique au point de rejeter tout le papier.

## Q24. Pourquoi restreindre une analyse a la region `Uusimaa` ?

Parce que le groupe `fCBT` provient essentiellement de cette region, alors que `iCBT` est nationale. Restreindre `iCBT` a `Uusimaa` ameliore la comparabilite geographique et diminue un peu les problemes de `positivity` ou de differences structurelles de prise en charge. C'est donc une sensibilite intelligente. Le fait que le signal global reste voisin dans cette analyse est rassurant.

## Q25. Que valent les performances des modeles rapportees dans le papier ?

Le modele d'assignation du traitement a une `AUC` autour de `0.77`, ce qui signifie qu'il est informatif: les groupes sont effectivement differents a l'etat initial (`baseline`). Le modele de resultat (`outcome`) a un `R²` faible, autour de `0.03`, ce qui n'est pas choquant en psychiatrie ou le resultat individuel est difficile a predire. A l'examen, cela peut servir a rappeler que:
- l'ajustement est necessaire car les groupes ne sont pas comparables spontanement,
- mais meme de gros algorithmes ne captent qu'une fraction limitee de la variabilite du resultat.

## Q26. Quelles sont les principales differences a l'etat initial (`baseline`) entre les groupes ?

Les patients `fCBT` paraissent plus ages, avec davantage de soins psychiatriques anterieurs et plus de comorbidites ou de consommation de soins sur plusieurs variables. Cela suggere que les groupes n'ont pas du tout la meme structure clinique initiale. Cette observation renforce l'interet de l'ajustement, mais elle renforce aussi la suspicion de confusion residuelle: si les differences visibles sont si nombreuses, il est plausible que des differences invisibles subsistent.

## Q27. Les deux traitements different-ils seulement par le mode de delivrance ?

Clairement non. C'est une critique majeure du papier. `fCBT` est dispensee dans un autre cadre, avec des therapeutes differents, une duree differente, un nombre de sessions beaucoup plus grand, une possibilite d'adaptation therapeutique plus large, et une region de recrutement differente. `iCBT` est au contraire fortement standardisee, plus courte, plus facilement extensible (`scalable`), et depend de l'autonomie numerique du patient. Donc l'effet estime ne capture pas seulement "internet versus face a face", mais un ensemble de differences de strategie de soin.

## Q28. Que pensez-vous de la revendication de `causal triangulation` ?

L'idee est interessante et meme assez elegante: si `RCTs`, meta-analyses et inference causale sur registres convergent, la conclusion devient plus cred ible. Mais il ne faut pas transformer cet argument en preuve absolue. La triangulation est une strategie de renforcement, pas un passe-droit pour oublier les hypotheses propres a chaque methode. Ici, elle ajoute de la valeur, mais ne supprime pas les limites de l'observationnel.

## Q29. Quelle est la principale faiblesse methodologique de cet article ?

La principale faiblesse est que les groupes comparees ne different pas seulement par l'exposition d'interet, et que l'absence de confusion non mesuree reste tres fragile. On peut formuler cela de deux manieres:
- soit comme un probleme de confusion residuelle,
- soit comme un probleme de `consistency`, au sens ou les "versions" de `fCBT` et `iCBT` encapsulent d'autres differences structurelles que le seul canal de delivrance.

Cette critique est plus intelligente que de dire simplement "ce n'est pas randomise".

## Q30. Que penser du fait que l'etude ne soit pas pre-enregistree ?

C'est une limite. L'absence de preregistration augmente le risque de flexibilite analytique a posteriori, surtout dans un papier techniquement riche ou beaucoup de choix sont possibles. Les auteurs compensent en partie par la transparence sur les sensibilites et par la coherence globale des resultats. Mais a l'examen, il faut le signaler comme un vrai point de vigilance.

## Q31. Pourquoi les auteurs parlent-ils d'un aspect de boite noire (`black box`) du `TMLE` ?

Parce que meme si la methode est mathematiquement sophistiquee et attractive, elle peut devenir difficile a suivre pour un lecteur non specialiste. De nombreux algorithmes sont combines, les poids sont determines automatiquement, et la logique d'estimation n'est plus celle d'une regression lineaire simple. Cette opacite n'invalide pas la methode, mais elle augmente l'exigence de transparence, de sensibilites et de modestie interpretative.

## Q32. Que penser de la conclusion finale des auteurs ?

La conclusion est globalement defendable: l'article ne montre pas que `iCBT` est massivement superieure, mais il soutient bien l'idee qu'elle est au moins comparable, avec possiblement un leger avantage moyen. Compte tenu du cout et du temps therapist beaucoup plus faibles, c'est une conclusion importante. En revanche, il faut toujours la recontextualiser: cette conclusion vaut sous des hypotheses causales fortes et dans un cadre ou les deux groupes ne sont pas parfait ement comparables.

## Q33. Quel serait un bon angle critique sur la taille d'effet ?

Le bon angle critique n'est pas de dire que l'effet n'est "pas significatif", puisque l'`IC` principal exclut a peine zero. Le bon angle est de dire que la taille d'effet moyenne estimee est petite, probablement sous le seuil de pertinence clinique moyenne directe, et que la force du papier est davantage de soutenir l'absence de desavantage clair de `iCBT` que de prouver une superiorite cliniquement majeure.

## Q34. Si on te demandait une conclusion orale en 30 secondes, que dirais-tu ?

Je dirais que c'est une cohorte retrospective sur registres, tres ambitieuse causalement, qui compare la therapie cognitivo-comportementale sur internet guidee par un therapeute et la therapie cognitivo-comportementale en face a face chez des patients depressifs a l'aide d'un `TMLE` et d'un `ATE`. Le resultat suggere que `iCBT` est au moins aussi efficace, avec peut-etre une petite superiorite moyenne, mais l'effet est modeste et l'interpretation causale repose sur des hypotheses fortes, en particulier l'absence de confusion residuelle et la comparabilite reelle des deux strategies de soin.

## Q35. Proposez et justifiez un `DAG` simple pour cet article.

Un `DAG` raisonnable aurait:
- des covariables de base vers l'exposition (`iCBT` vs `fCBT`),
- les memes covariables vers le resultat (`outcome`, ici la `variation du PHQ-9`),
- une fleche de l'exposition vers le resultat.

Les covariables incluraient au minimum:
- age,
- sexe,
- severite anxieuse ou depressive de base,
- antecedents psychiatriques,
- consommation de soins,
- statut socioeconomique,
- variables familiales ou de sante associees.

Le point cle a justifier est que les covariables peuvent influencer a la fois le choix du traitement et l'evolution clinique. Le `DAG` sert ici a formaliser l'idee de confusion et la cible causale de l'ajustement. Une bonne reponse doit aussi signaler qu'un `DAG` complet pourrait inclure des variables non observees comme l'affinite numerique ou la preference du patient.

## Q36. Decrivez la procedure d'echantillonnage / de selection des patients et qu'en pensez-vous.

Les auteurs partent de deux registres differents, appliquent des criteres d'eligibilite propres a chaque filiere de soin, excluent de nombreux dossiers, retirent les patients sans valeur initiale (`baseline`) de `PHQ-9`, puis construisent deux groupes: `fCBT` et `iCBT`. Cette procedure est methodologiquement lisible, mais elle fabrique deux groupes qui ne viennent pas exactement du meme univers clinique. Le principal probleme n'est donc pas tant la taille d'echantillon que la comparabilite structurelle des groupes, notamment sur la region, les therapeutes, la standardisation du soin et certains criteres d'exclusion.

## Q37. Que pensez-vous du tableau 1 ?

Le tableau 1 montre des differences a l'etat initial (`baseline`) tres nombreuses entre les groupes. C'est informatif, car cela prouve qu'une comparaison brute serait insuffisante. En revanche, l'usage de `p-values` dans ce tableau est discutable, surtout avec un `n` aussi grand dans un groupe. Des differences minimes peuvent devenir "significatives" et des differences importantes cliniquement peuvent etre noyees. Des differences moyennes standardisees (`standardized mean differences`) auraient souvent ete plus utiles pour juger la comparabilite que des `p-values`.

## Q38. Si vous deviez resumer les resultats par un seul nombre, lequel choisiriez-vous ?

Le meilleur resume est l'`ATE` principal, soit environ `0.745` point de difference de reduction du `PHQ-9` en faveur de `iCBT`, avec son `IC95%`. C'est le nombre qui correspond le mieux a la question causale revendiquee par les auteurs. Une bonne reponse doit toutefois ajouter que ce nombre est modeste et probablement en dessous du seuil de changement moyen subjectivement tres perceptible.

## Q39. Comment sont gerees les donnees manquantes dans cet article ?

La gestion est multiple:
- les patients avec valeur initiale (`baseline`) manquante sont exclus des analyses contrefactuelles principales,
- les patients n'ayant qu'une seule mesure `PHQ-9` sont codes comme ayant un changement de `0` dans l'analyse principale,
- des analyses de sensibilite avec imputations multiples sont ensuite realisees.

Cette strategie est relativement transparente, mais elle n'est pas neutre. Elle penalise fortement les situations d'abandon (`dropout`), surtout dans `iCBT`, et elle transforme des manquants en hypothese clinique implicite. C'est defendable, mais clairement discutable.

## Q40. L'effet therapeute pourrait-il etre un probleme ici ?

Oui, c'est une vraie question, probablement sous-estimee si on ne relit pas les annales recentes. Les `fCBT` sont delivrees par des psychotherapeutes externalises, alors que les `iCBT` sont guidees par d'autres types de professionnels dans un cadre plus standardise. Cet effet "therapist / setting" peut etre vu soit comme un facteur de confusion, soit comme une composante inseparable de la strategie de soin comparee. Dans les deux cas, il complique l'interpretation d'un effet attribue au seul mode de delivrance.

## Q41. En quoi le modele d'assignation du traitement ressemble-t-il a un score de propension ?

Le modele d'assignation estime la probabilite d'etre dans `fCBT` ou `iCBT` en fonction des covariables. C'est tres proche de la logique d'un score de propension (`propensity score`), meme si l'article s'inscrit dans un cadre plus large de `TMLE`. On peut donc dire que le papier mobilise, entre autres, une logique proche d'un score de propension (`propensity-like`), integree ensuite dans une procedure d'estimation causale plus riche.

## Q42. Faut-il raisonner ici en termes de puissance statistique ou plutot de precision ?

Plutot de precision. Les auteurs ont un echantillon tres large et proposent meme un raisonnement en largeur d'intervalle de confiance, avec un seuil de `1.7` point de `PHQ-9` comme ordre de grandeur interpretable. Dans un tel contexte, demander une "puissance a posteriori" serait souvent moins utile que de regarder la precision de l'estimation et son importance clinique. C'est exactement l'esprit de plusieurs annales.

## Q43. L'absence de groupe non traite est-elle un probleme ?

Pas pour la question que posent les auteurs. Ils ne cherchent pas a savoir si la psychotherapie est meilleure que rien, mais si deux modalites de psychotherapie sont comparables. Donc l'absence de groupe sans traitement n'est pas un defaut en soi. En revanche, elle empeche toute conclusion sur l'efficacite absolue des prises en charge.

## Q44. Quelles analyses alternatives auraient pu etre proposees ?

On aurait pu imaginer:
- un appariement sur score de propension,
- une ponderation `IPW` plus classique,
- une regression plus simple,
- une analyse stratifiee par region,
- eventuellement une approche instrumentale si un instrument credible existait, ce qui n'est pas evident ici.

L'avantage de ces alternatives serait une meilleure lisibilite pedagogique. Leur limite est qu'elles ne captent pas forcement aussi bien la complexite des donnees que le `TMLE`. Le papier a d'ailleurs fait une partie du travail en proposant `G-computation`, `AIPTW` et `simple TMLE` en sensibilite.

## Q45. Quels sont les problemes clinimetriques potentiels lies au `PHQ-9` dans cette etude ?

Le `PHQ-9` est un bon instrument, mais cela ne le rend pas parfait. Ici, plusieurs points sont discutables:
- auto-questionnaire donc sensible au contexte de remplissage,
- repetition des mesures non strictement comparable entre les filieres,
- usage du score de changement plutot qu'un modele longitudinal complet,
- choix de fixer a `0` certains cas sans deuxieme mesure,
- question de la signification clinique d'une petite variation moyenne.

Ce n'est pas une faiblesse redhibitoire, mais c'est un angle de discussion intelligent.

## Q46. Y a-t-il un risque de "sur-interpretation causale" dans la conclusion ?

Oui, un peu. Les auteurs sont plus prudents que beaucoup d'articles observationnels et invoquent la triangulation, ce qui est bien. Mais des formulations comme "our findings eliminate error sources" sont plus fortes que ce qu'une etude observationnelle peut raisonnablement garantir. Une bonne copie doit reconnaitre la qualite methodologique du travail sans lui attribuer une preuve causale de niveau essai randomise.

## Q47. Que penser de l'exclusion des patients `iCBT` prescrits mais n'ayant jamais renseigne de `PHQ-9` ?

C'est un vrai angle critique, facile a manquer. L'article montre que beaucoup de patients `iCBT` ont ete exclus faute de score initial exploitable, et il rappelle qu'en les comptant comme absence d'amelioration la baisse moyenne du `PHQ-9` serait plus faible. Autrement dit, l'analyse principale porte moins sur "tous les patients a qui l'on propose `iCBT`" que sur ceux qui entrent effectivement dans le processus de mesure. Cela ne rend pas l'etude invalide, mais cela rapproche l'estimand d'un effet chez les patients engageables / engages plutot que d'un effet populationnel pur de l'offre de soin.

## Q48. Pourquoi les auteurs n'utilisent-ils pas les suivis automatises a `3 mois` apres `iCBT`, et est-ce defendable ?

Oui, c'est defendable, mais cela se discute. Les auteurs veulent comparer les traitements pendant leur phase de prise en charge, or les suivis automatises post-traitement existent surtout pour `iCBT` et pas de facon symetrique pour `fCBT`. Les inclure aurait introduit une asymetrie de mesure. Leur choix ameliore donc la comparabilite, mais il a un cout: on apprend moins bien la durabilite de l'effet, les rechutes et la persistance a moyen terme. Une bonne reponse doit dire "bon choix pour la comparabilite immediate, perte d'information pour la trajectoire ulterieure".

## Q49. Les fenetres de suivi sont-elles vraiment comparables entre `iCBT` et `fCBT` ?

Pas parfaitement. Pour `iCBT`, l'article donne des delais moyens d'environ `7.7` a `9.4` semaines selon la definition retenue, alors que pour `fCBT` l'intervalle moyen start-end estime est beaucoup plus long, autour de `35` semaines, avec une qualite de mesure moins bonne. Cela signifie qu'on ne compare pas seulement deux modalites de soin, mais aussi des rythmes et des horizons temporels differents. C'est un point methodologique important: un score de changement n'a pas tout a fait le meme sens s'il est mesure apres une prise en charge breve et standardisee ou apres une psychotherapie plus longue et plus flexible.

## Q50. Le recueil du `PHQ-9` est-il symetrique entre les deux filieres de soin ?

Non, et c'est un point tres fin. Dans `iCBT`, la progression dans le programme suppose de renseigner les symptomes; dans `fCBT`, les therapeutes etaient seulement encourages a faire renseigner les scores. Donc le mecanisme de production du resultat (`outcome`) fait presque partie de l'intervention dans `iCBT`, alors qu'il est plus lache en `fCBT`. Les auteurs tentent de compenser cela en codant a `0` les patients avec une seule mesure, mais l'asymetrie de mesure et d'engagement ne disparait pas completement. C'est a la fois un probleme de donnees manquantes et un probleme de comparabilite des procedures d'evaluation.

## Q51. L'`ATE` est-il l'estimand le plus naturel ici, ou un `ATT` aurait-il pu etre defendu ?

L'`ATE` est coherent avec la question de politique de soin implicite du papier: que se passerait-il si tous les patients eligibles recevaient `iCBT` plutot que `fCBT`, ou l'inverse ? Mais ce n'est pas le seul choix possible. Un `ATT` aurait pu etre defendu si l'on voulait estimer l'effet chez les patients qui ont effectivement recu l'une des deux prises en charge, surtout dans un contexte de fort desequilibre des tailles de groupes et d'overlap imparfait. Donc l'`ATE` n'est pas "le" bon estimand par essence; c'est un choix qui privilegie une lecture systeme / allocation plutot qu'une lecture strictement clinique chez les traites.

## Q52. Que penser du desequilibre massif des effectifs `5446` contre `388` ?

Ce n'est pas un biais en soi, mais c'est un signal d'alerte methodologique. Avec un groupe `fCBT` relativement petit face a un groupe `iCBT` tres large, l'estimation causale repose davantage sur le modele d'assignation et sur la qualite de l'overlap. Le grand `n` ne compense pas une `positivity` fragile ou une confusion residuelle. En pratique, cela veut dire qu'une grande precision numerique peut donner une illusion de solidite alors que la vraie faiblesse est structurelle: certains profils ressemblent surtout a des patients `iCBT`, pas a des patients `fCBT`.

## Q53. Que penser de la regle imposant un debut de traitement au moins `3 mois` avant la fin du registre ?

C'est une regle pragmatique plutot intelligente, car elle evite d'inclure des traitements tellement recents qu'ils n'ont materiellement pas eu le temps d'etre observes. Autrement dit, elle limite une troncature administrative evidente. Mais elle ne standardise pas completement le suivi entre les groupes, surtout si `fCBT` dure plus longtemps que `iCBT`. Donc cette regle ameliore la lisibilite du jeu de donnees sans suffire a recreer un vrai suivi cible parfaitement comparable.
