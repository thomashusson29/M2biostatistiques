# Prompts Parfaits Pour Les Articles 2025

But:
- extraire le maximum d'informations utiles pour l'examen,
- en ciblant ce que les annales corrigees montrent comme reellement attendu,
- sans rester dans un resume generique d'article.

## 1. Prompt parfait pour l'article RC

Utiliser ce prompt avec:
- `article_RC.pdf`
- `article_RC_protocol.pdf`

```text
Tu es un enseignant-examinateur expert en recherche clinique et en statistiques appliquees aux essais therapeutiques.

Je te donne 2 documents a analyser ensemble:
1. l'article principal `article_RC.pdf`
2. le protocole / SAP `article_RC_protocol.pdf`

Ta mission n'est PAS de resumer l'article.
Ta mission est d'extraire tout ce qui est potentiellement examinable dans l'esprit d'un examen de M2 de methodologie / biostatistiques, en te basant sur le type de questions qu'on pose classiquement sur des articles de RC.

Je veux une analyse ULTRA CIBLEE EXAMEN, structuree en 10 parties obligatoires:

1. Identification precise de l'article
- titre complet
- question de recherche
- type exact de design
- population
- intervention
- comparateur

2. Fiche methodologique complete
- randomisation: methode exacte, niveau, ratio, stratification
- aveugle: qui est en aveugle, qui ne l'est pas, consequences
- centres / multicentrique
- criteres d'inclusion / exclusion importants
- logique generale du design

3. Critere principal et criteres secondaires
- definition exacte
- mode de mesure
- forces
- faiblesses
- pertinence clinique
- que penser du choix du critere principal dans CET essai precis

4. Analyse statistique
- population d'analyse
- modele principal
- hypotheses statistiques
- gestion des donnees manquantes
- gestion de la censure
- analyses secondaires
- sous-groupes
- ce qui est ajuste et pourquoi

5. Calcul du nombre de sujets necessaires
- reconstitue le plus precisement possible la logique du NSN
- donne toutes les hypothese retrouvees
- distingue ce qui vient de l'article et ce qui vient du protocole
- explique les interim analyses
- explique la logique de l'alpha-spending
- explique la hierarchie des tests

6. Resultats
- donne tous les resultats importants avec les chiffres exacts
- PFS
- OS
- ORR / DCR / DOR si utiles
- securite
- PRO / qualite de vie si utiles
- interpretation clinique et pas seulement statistique

7. Ce qui est LE PLUS EXAMINABLE dans cet article
- liste les notions methodologiques specifiques a cet article
- pour chacune: explique pourquoi elle est tombable

8. Les 15 questions d'examen les plus probables
- formule chaque question comme un vrai sujet d'examen
- classe-les par probabilite decroissante
- pour chaque question, donne:
  - ce qu'il faut absolument dire
  - les erreurs a eviter

9. Les critiques intelligentes attendues d'un bon etudiant
- pas des critiques generiques
- je veux les vraies zones discutables de CET article
- distingue:
  - critiques fortes
  - critiques secondaires
  - critiques qui ont l'air intelligentes mais sont en fait faibles

10. Synthese finale ultra-utile pour reviser
- 20 points a memoriser
- 10 chiffres a connaitre
- 5 pieges probables

Contraintes:
- sois tres precis
- n'invente rien
- distingue toujours:
  - "fact direct de l'article"
  - "fact direct du protocole"
  - "inference raisonnable"
- ne fais pas un simple resume narratif
- adopte une logique d'examen et de correction
- quand un point technique est discutable, dis-le explicitement
- si un element du protocole semble different de l'article publie, signale-le
```

## 2. Prompt parfait pour l'article EPI

Utiliser ce prompt avec:
- `article_epi_1.pdf`

```text
Tu es un enseignant-examinateur expert en epidemiologie analytique, inférence causale observationnelle et biostatistiques.

Je te donne un article d'epidemiologie a analyser pour un examen de M2 de methodologie / biostatistiques.

Ta mission n'est PAS de faire un resume classique.
Ta mission est d'extraire tout ce qui est potentiellement examinable, en ciblant la logique des annales corrigees: design, biais, confusion, causalite, modeles, interpretation, critiques intelligentes.

Je veux une analyse ULTRA CIBLEE EXAMEN, structuree en 10 parties obligatoires:

1. Identification precise de l'article
- titre complet
- question de recherche
- type exact de design
- source des donnees
- population
- exposition
- outcome principal

2. Ce que les auteurs essaient vraiment d'estimer
- cible causale exacte
- definition de l'ATE
- difference entre effectivite et efficacite dans ce papier
- role de la triangulation avec les RCTs

3. Hypotheses causales
- liste toutes les hypotheses explicites et implicites
- consistency
- no interference
- positivity
- confusion completement mesuree
- bonne specification des dependances
- pour chacune:
  - definition courte
  - application au papier
  - fragilite probable

4. Variables et outcome
- comment est defini l'outcome principal
- forces et faiblesses du PHQ-9 change score
- que penser du choix de mettre un changement a 0 si une seule mesure
- impact du dropout sur l'interpretation

5. Analyse statistique
- explique clairement TMLE
- explique le role des super learners
- explique G-computation et AIPTW
- explique la double robustesse
- explique pourquoi les auteurs n'ont pas inclus le baseline PHQ-9 dans l'analyse principale
- explique les sensibilites

6. Resultats
- donne les chiffres exacts utiles
- difference brute
- ATE
- IC95%
- sensibilites
- taille d'effet
- importance clinique potentielle

7. Critique methodologique forte
- quelles sont les principales menaces a l'interpretation causale
- quelles confusions non mesurees restent plausibles
- en quoi les deux groupes ne different pas seulement par le mode de delivrance
- que vaut la conclusion finale des auteurs

8. Les 15 questions d'examen les plus probables
- formule-les comme de vrais sujets
- classe-les par probabilite
- pour chaque question, donne:
  - la structure de bonne reponse
  - les erreurs frequentes

9. Les critiques intelligentes attendues d'un bon etudiant
- je veux les critiques les plus pertinentes pour CET article
- distingue:
  - critiques majeures
  - critiques secondaires
  - critiques faussement sophistiquees

10. Synthese finale ultra-utile pour reviser
- 20 points a memoriser
- 10 chiffres a connaitre
- 5 pieges probables

Contraintes:
- reste centre sur l'examen
- ne fais pas un simple resume
- distingue toujours:
  - fait explicite du papier
  - inference raisonnable
  - point fragile / discutable
- sois exigeant sur la causalite
- n'assimile jamais sophistication statistique et preuve causale absolue
```

## 3. Prompt combine si tu veux tout traiter d'un coup

```text
Je vais te donner deux articles d'examen:
- un article de recherche clinique
- un article d'epidemiologie

Je veux que tu les analyses comme un examinateur de M2 biostatistiques / methodologie, pas comme un resumateur d'articles.

Pour CHAQUE article, produis:

1. une fiche methodologique complete
2. les notions specifiques tombables
3. les chiffres a connaitre
4. les biais / limites / critiques intelligentes
5. les 15 questions d'examen les plus probables
6. le squelette de bonne reponse pour chacune

Puis termine par:

7. une comparaison des deux articles
- ce qui releve plutot de RC
- ce qui releve plutot de l'EPI
- les notions transversales
- les pieges de confusion entre les deux

Contraintes:
- pas de resume generique
- logique d'examen uniquement
- si un protocole existe pour l'article RC, integre-le a l'analyse
- distingue toujours faits, inférences, et points discutables
```

## 4. Comment je te conseille de t'en servir

Ordre conseille:

1. lancer d'abord le prompt `RC` avec `article_RC.pdf` + `article_RC_protocol.pdf`
2. lancer ensuite le prompt `EPI` avec `article_epi_1.pdf`
3. comparer les questions les plus probables sorties pour les deux articles
4. seulement apres, faire une fiche de revision ultra-condensee

## 5. Ce que ces prompts doivent t'apporter concretement

- une extraction orientee examen
- pas un simple article club
- les calculs reconstructibles
- les critiques vraiment attendues
- les questions probables
- les points a memoriser prioritairement

Autrement dit:
- article -> extraction exam -> questions probables -> revision

Pas:
- article -> resume -> impression vague de comprehension
