# Adaptation Ciblee A L'Article EPI 2025

Support utilise:
- `article_epi_1.pdf`

## 1. Identite exacte de l'article

- Titre: `Efficacy and effectiveness of therapist-guided internet versus face-to-face cognitive behavioural therapy for depression via counterfactual inference using naturalistic registers and machine learning in Finland: a retrospective cohort study`
- Revue: `The Lancet Psychiatry`
- Annee / volume: `2025;12:189-197`
- Design revendique: `retrospective cohort study`
- Coeur methodologique reel: registres naturalistes relies + inference causale contrefactuelle + `TMLE` + `super learner`

## 2. Ce que cet article est, exactement

- etude observationnelle
- cohorte retrospective sur registres
- comparaison non randomisee de `guided iCBT` versus `face-to-face CBT`
- visee explicitement causale
- usage massif de covariables de registres
- estimation d'un `ATE`
- triangulation revendiquee avec les `RCTs`
- forte dependance a des hypotheses non testables

Conclusion pratique:
- c'est un article `EPI` contemporain, techniquement riche et tres examinable.
- il est particulierement fertile pour des questions sur:
  - causalite observationnelle
  - confusion
  - selection des covariables
  - dropout
  - `TMLE`
  - validite des conclusions

## 3. Les notions SPECIFIQUES a cet article qui paraissent tres tombables

### 3.1 Design

- cohorte retrospective
- registres naturalistes
- comparaison non randomisee
- etude de routine clinique
- lien entre efficacite (`efficacy`) et effectivite (`effectiveness`)
- inferential target: `ATE`

Question plausible:
- "De quel type d'etude s'agit-il et qu'apporte-t-elle par rapport a un essai randomise ?"

### 3.2 Question causale explicite

- question centrale du papier:
  - que se passerait-il si les memes patients recevaient tous `fCBT` versus tous `iCBT` ?
- formulation contrefactuelle explicite
- revendication de "causal triangulation"

Questions plausibles:
- qu'est-ce qu'un `ATE` ?
- quel est l'interet d'un raisonnement contrefactuel ici ?

### 3.3 Hypotheses causales

L'article les ecrit presque noir sur blanc:

- tous les confondeurs pertinents sont observes
- `consistency`
- `no interference`
- `positivity`
- specification suffisamment correcte des dependances modelees

Questions plausibles:
- definir chacune de ces hypotheses
- dire lesquelles sont les plus fragiles ici

Hypotheses particulierement fragiles ici:
- `positivity`, vu les differences d'eligibilite et de region
- absence de confusion non mesuree
- `consistency`, car les traitements ne different pas uniquement par le canal de delivrance

### 3.4 Population et comparabilite

Groupe `fCBT`:
- registre `FPQR`
- soins ambulatoires externalises
- patients adultes
- traitements jusqu'a `20` sessions typiques, parfois beaucoup plus

Groupe `iCBT`:
- registre `HUS-iCBT`
- prise en charge nationale
- programme standardise en `7 sessions`
- criteres d'inclusion et d'exclusion differents
- exclusion de certains troubles interferant avec le traitement en ligne

Point methodologique majeur:
- les deux traitements ne different pas seulement par le mode de delivrance
- ils different aussi par le contexte, les therapists, la standardisation, l'intensite, la duree, la zone geographique et les criteres d'eligibilite

Tres probable a l'examen:
- "Quelles menaces cela fait-il peser sur l'interpretation causale ?"

### 3.5 Outcome principal

- `change in PHQ-9`
- du baseline a la derniere mesure immediatement apres traitement
- si un patient n'a qu'une seule mesure, changement fixe a `0`
- ce choix penalise le dropout

Questions plausibles:
- est-ce un bon outcome ?
- que penser du fait de fixer le changement a `0` en cas de mesure unique ?
- cela favorise-t-il ou penalise-t-il un groupe ?

Forces:
- outcome clinique usuel, valide, interpretable
- seuil de `1.7` points presente comme detectabilite subjective

Faiblesses:
- outcome derive d'un score auto-rapporte
- sensibilite au calendrier de mesure
- penalisation du dropout discutable cliniquement
- forte dependance a la facon de definir la fin de traitement

### 3.6 Dropout

- sujet central de ce papier
- `iCBT` a beaucoup plus de dropout
- le papier choisit de penaliser ce dropout
- plusieurs sensibilites changent la facon de traiter les manquants

Questions plausibles:
- le dropout est-il ici un echec de traitement ?
- la strategie "no change if only one PHQ-9" est-elle defendable ?
- les auteurs minimisent-ils trop le probleme du dropout ?

Point fin:
- les auteurs disent qu'on ne doit pas toujours attribuer un sens clinique particulier au dropout
- ils invoquent aussi une logique de `stepped care`
- c'est defendable, mais discutable

### 3.7 Selection des covariables

- `OASIS` en baseline
- nombreuses covariables issues de registres:
  - diagnostics psy precedents
  - diagnostics somatiques
  - medicaments
  - statut socioeconomique
  - famille / fratrie
  - arrets maladie
  - etc.
- categories avec cellules <10 regroupees pour confidentialite et stabilite

Questions plausibles:
- quel est l'interet d'avoir autant de covariables ?
- est-ce une garantie contre la confusion ?
- quelles variables importantes peuvent manquer ?

Tres bon angle critique:
- `digital affinity`
- preferences patient
- motivation
- severite clinique fine non captee
- indications therapeutiques implicites

### 3.8 TMLE et super learner

Notions attendues:
- `TMLE`
- `super learner`
- double robustesse asymptotique
- optimisation biais-variance pour l'`ATE`
- modele d'assignation du traitement
- modele d'outcome
- validation croisee

Questions plausibles:
- expliquez brievement ce qu'est un `TMLE`
- pourquoi l'article le presente comme "state of the art" ?
- quelles sont ses forces et ses limites pedagogiques / pratiques ?

Point critique attendu:
- la methode est puissante, mais "black box"
- l'article le reconnait lui-meme

### 3.9 Sensibilites

- `G-computation`
- `AIPTW`
- `simple TMLE`
- inclusion ou non du baseline `PHQ-9`
- restriction a la region `Uusimaa`
- imputations multiples

Questions plausibles:
- pourquoi autant d'analyses de sensibilite ?
- que penser du fait que certaines analyses deviennent beaucoup moins convaincantes quand on inclut le baseline `PHQ-9` ?

Point tres examinable:
- les auteurs n'incluent pas le baseline `PHQ-9` dans l'analyse principale pour eviter la dependance artificielle avec un outcome en score de changement
- c'est methodologiquement defendable
- mais cela peut aussi devenir un point de discussion critique

### 3.10 Puissance, precision, taille d'effet

Ce n'est pas un `NSN` de RCT, mais cela reste examinable.

- echantillon tres grand
- objectif de precision:
  - `IC` de largeur inferieure a `1.7` points `PHQ-9`
- resultat principal:
  - `ATE 0.745`
  - `IC95% 0.156-1.334`

Point tres important:
- l'effet est statistiquement compatible avec une petite superiorite de `iCBT`
- mais il reste modeste
- il est inferieur au seuil de `1.7` points discute par les auteurs comme difference subjectivement detectee

Question probable:
- "Le resultat principal est-il cliniquement important ?"

Bonne reponse attendue:
- probablement faible en intensite
- mais compatible avec "au moins aussi efficace"
- interpretation clinique prudente

### 3.11 Validite externe et representativite

Forces:
- donnees de routine
- tres grande taille
- contexte reel

Limites:
- `fCBT` surtout `Uusimaa`
- `iCBT` nationale
- therapistes differents
- filieres de soins differentes
- donnees privees moins bien captees

Questions plausibles:
- la generalisation est-elle meilleure que dans un `RCT` ?
- oui sur certains points, non sur d'autres

### 3.12 Conclusion et ton de l'article

Le papier conclut:
- `short first-line treatments with therapist-guided iCBT are at least as effective and efficacious as fCBT`

Ce qu'il faut etre capable de dire:
- la conclusion est globalement coherente avec l'ensemble `RCT + registres + sensibilites`
- mais elle reste conditionnee a des hypotheses fortes
- la part "causale" est defendable, pas blindee
- l'effet estime est modeste
- les differences structurelles entre groupes empechent une lecture trop naive de "seul le mode de delivrance change"

## 4. Donnees numeriques a connaitre

- entrees de registres evaluees: `32 343`
- analyse naturaliste:
  - `392` patients `fCBT`
  - `5467` patients `iCBT`
- analyse contrefactuelle principale:
  - `388` patients `fCBT`
  - `5446` patients `iCBT`
- outcome principal:
  - `ATE 0.745`
  - `IC95% 0.156-1.334`
- difference brute moyenne:
  - `1.120` points
- difference brute en incluant certains exclus / definitions alternatives:
  - devient beaucoup plus faible
- seuil discute de detectabilite subjective:
  - `1.7` points `PHQ-9`
- performance modele assignation:
  - `AUC 0.77`
- prediction outcome:
  - `R²` faible, autour de `0.03`

## 5. Les 15 questions d'examen les plus plausibles pour CET article

1. Quel est le design exact de l'etude et quels en sont les avantages et limites ?
2. Qu'est-ce qu'un `ATE` et pourquoi est-ce la cible ici ?
3. Expliquez le principe du `TMLE` et du `super learner`.
4. Quelles hypotheses causales doivent etre acceptees pour interpreter l'`ATE` ?
5. Que pensez-vous du choix du `PHQ-9 change score` comme outcome principal ?
6. Comment interpreter la decision de mettre un changement a `0` chez les patients avec une seule mesure ?
7. Pourquoi les auteurs n'ont-ils pas inclus le baseline `PHQ-9` dans l'analyse principale ?
8. Que changent les analyses de sensibilite incluant le baseline `PHQ-9` ?
9. Les deux traitements sont-ils reellement comparables si seul le mode de delivrance etait suppose changer ?
10. Quelles confusions non mesurees restent plausibles ?
11. La conclusion "at least as effective" est-elle defendable ?
12. La taille d'effet observee est-elle cliniquement importante ?
13. Que vaut l'argument de triangulation avec les `RCTs` ?
14. Qu'apporte un registre par rapport a un `RCT`, et que perd-on ?
15. Quelle est selon vous la principale faiblesse methodologique de l'etude ?

## 6. Ce qu'un bon correcteur attendrait probablement dans les reponses

- comprendre que l'article est observationnel, meme s'il parle beaucoup causal
- ne pas confondre sophistication statistique et verite causale garantie
- savoir discuter les hypotheses, pas seulement la methode
- voir que la taille d'effet est plutot petite
- voir que les groupes different au baseline
- voir que les traitements different par plus d'un aspect
- voir que le dropout est central

## 7. Ce qu'il faut absolument demander a un LLM quand on lui donne CET article

- identifier les hypotheses causales explicites
- expliquer `TMLE`, `AIPTW`, `G-computation`, `super learner`
- separer efficacite, effectivite et revendication causale
- discuter l'outcome principal et la gestion du dropout
- dire si l'effet est cliniquement important ou seulement statistiquement compatible avec une petite difference
- identifier les confondeurs residuels plausibles
- proposer les questions d'examen les plus probables

## 8. Point d'attention particulier

Cet article ne doit surtout pas etre traite comme:
- un simple article de registres,
- ni un simple article de machine learning,
- ni un quasi-RCT deja "prouve".

La bonne lecture d'examen est:
- etude observationnelle ambitieuse,
- tres bien equipee methodologiquement,
- informative,
- mais encore conditionnee a des hypotheses fortes et a des differences structurelles entre groupes.
