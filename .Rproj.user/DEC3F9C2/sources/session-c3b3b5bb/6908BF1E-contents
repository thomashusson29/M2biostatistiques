##-----vidéo MOOC S1C2 Représentations graphiques------
htmltools::browsable(
  htmltools::tags$video(
    src = "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/3cc566f6-889c-5777-a083-a7cd8b844613/mp4/1585769678_720.mp4",
    type = "video/mp4",
    controls = NA,
    width = "700px"
  )
)

##----1-IMPORT SMP----
setwd("/Users/thomashusson/Documents/R/M2 biostatistiques/MOOC")
#import smp
smp.c <- read.csv2("S1C2 smp1.csv")



#str smp
str(smp.c)
table(smp.c)
head(smp.c)
summary(smp.c)
dim(smp.c)
names(smp.c)

##----2-REPRÉSENTATIONS VARIABLES QUALITATIVES----
barplot(table(smp.c$prof))
#table() : nécessaire pour calculer le nombre dans chaque professions
#barplot () : représente les hauteurs de chacun des nombres
#smp.c$prof : sélectionne la colonne $ au sein du dataframe smp.c

pie(table(smp.c$prof))
#pie() : crée un graphique en secteurs
#table() : calcule le nombre d'individus dans chaque profession
#smp.c$prof : sélectionne la colonne $ au sein du dataframe smp.c

##----3-REPRÉSENTATIONS VARIABLES QUANTITATIVES----
hist(smp.c$age)
#hist() : crée un histogramme
#smp.c$age : sélectionne la colonne $ au sein du dataframe smp.c

hist(smp.c$age)
#hist() : crée un histogramme
#smp.c$age : sélectionne la colonne $ au sein du dataframe smp.c

hist(smp.c$age,col="grey",main="Répartition des âges",xlab="age")
#col : couleur des barres
#main : titre du graphique
#xlab : nom de l'axe des x
#ylab : nom de l'axe des y

boxplot(smp.c$age,xlab="age")
#boxplot() : crée un diagramme en boîte
#smp.c$age : sélectionne la colonne $ au sein du dataframe smp.c
#xlab : nom de l'axe des x

#représenter variable quantitative selon sous groupe
#tilde ~ s'obtient en faisant option + n 
boxplot(smp.c$age~smp.c$rs,ylab="age",xlab="Recherche de sensation")
#boxplot() : crée un diagramme en boîte
#smp.c$age~smp.c$rs : crée des boîtes pour chaque modalité de la variable rs (= recherche de sensation)
#~ : # Le symbole ~ est l’« opérateur de formule » en R : on lit “réponse ~ prédicteur(s)”.
#   gauche (lhs)  = la variable numérique à représenter (ici smp.c$age)
#   droite (rhs)  = la/les variable(s) de regroupement (ici smp.c$rs) qui définissent les boîtes.
# Concrètement : smp.c$age ~ smp.c$rs → une boîte par modalité (niveau) de rs.


plot(smp.c$age,smp.c$n.enfant)
#plot() : crée un nuage de points
#smp.c$age : sélectionne la colonne $ au sein du dataframe smp.c : sera celle affichée en abscisse 
#smp.c$n.enfant : sélectionne la colonne $ au sein du dataframe smp : sera celle affichée en ordonnée
#revient au même donc que plot(smp.c$n.enfant ~ smp.c$age, data = smp.c)
#nuage de points : permet de visualiser la relation entre deux variables quantitatives
#chaque point représente un individu
#utile pour visualiser la corrélation entre deux variables quantitatives
#corrélation : mesure de la force et de la direction de la relation linéaire
#corrélation positive : les deux variables augmentent ensemble
#corrélation négative : une variable augmente tandis que l'autre diminue
#corrélation nulle : pas de relation linéaire entre les deux variables
#ajouter une droite de régression
abline(lm(smp.c$n.enfant~smp.c$age),col="red")

plot(jitter(smp.c$age),jitter(smp.c$n.enfant))
#jitter() : ajoute un bruit aléatoire aux données pour éviter la superposition des points
#utile lorsque les données sont discrètes ou ont peu de valeurs distinctes
#permet de mieux visualiser la densité des points







##----4-REPRÉSENTATIONS TEMPORELLES----
#import repdat
repdat <-read.csv2("S1C2 outils_hdrs.csv")

#str repdat
str(repdat)


library(gplots)
install.packages("gplots") #si pas encore installé
#library() : charge le package gplots
#package gplots : contient des fonctions pour créer des graphiques avancés, y compris des heatmaps

plotmeans(repdat$HDRS~repdat$VISIT,gap=0,barcol="black")
#plotmeans() : crée un graphique des moyennes avec des barres d'erreur
#repdat$HDRS~repdat$VISIT : calcule les moyennes de HDRS pour chaque visite (VISIT)
#~ : tilde = opérateur de formule qui spécifie que HDRS est la variable dépendante et VISIT la variable indépendante
#gap=0 : pas d'espace entre les barres
#barcol="black" : couleur des barres d'erreur en noir
#utile pour visualiser l'évolution d'une variable quantitative (HDRS) au fil du temps (VISIT)
#chaque point représente la moyenne de HDRS pour une visite donnée
#les barres d'erreur représentent la variabilité des données (intervalle de confiance ou écart-type)


interaction.plot(repdat$VISIT,repdat$NUMERO,repdat$HDRS,lty=1,legend=FALSE)
#interaction.plot() : crée un graphique d'interaction entre deux variables
#repdat$VISIT : variable indépendante 1 (VISIT)
#repdat$NUMERO : variable indépendante 2 (NUMERO, identifiant unique pour chaque individu)
#repdat$HDRS : variable dépendante (HDRS)
#lty=1 : type de ligne (1 = ligne continue)
#legend=FALSE : pas de légende
#utile pour visualiser comment la variable dépendante (HDRS) change en fonction des deux variables indépendantes (VISIT et NUMERO)
#chaque ligne représente un individu (NUMERO différent)