##-----vidéo MOOC S1Lab1------
url <- "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/1712c0ea-fae6-559c-b2e4-1253fc636e03/mp4/1585769713_720.mp4"
#lire dans le viewer Rstudio
htmltools::browsable(
  htmltools::tags$video(
    src = url,
    type = "video/mp4",
    controls = NA,
    width = "700px"
  )
)

#télécharger en mp4
destfile <- file.path(getwd(), "video.mp4")
download.file(url, destfile, mode = "wb")  # "wb" = write binary, indispensable pour fichiers binaires

#--- définir le répertoire de travail----
#insérer le code ici :

#------------------

#--- importer smp----
#insérer le code ici :

#-----correction----
load("smp_v1.rda") #import smp
#------------------

#--- noms des variables----
#insérer le code ici : 

#-----correction----
names(smp) #noms des variables 
#------------------

#--- première valeur de la variable âge----
#insérer le code ici :

#-----correction----
smp$age[1] 
#------------------

#--- première valeur ligne 1, colonne 1----
#insérer le code ici :
smp[1,1]
#-----correction----
smp[1,1] 
#------------------

#--- première valeur ligne 1, colonne age----
#insérer le code ici :
#-----correction----
smp[1,"age"] 
#------------------

#--- premières valeurs de la variable prof----
#insérer le code ici :
head(smp$prof)
#-----correction----
head(smp$prof) 
#------------------

#--- tester si prof == "agriculteur"----
#insérer le code ici :
smp$prof == "agriculteur"
head(smp$prof == "agriculteur")
#-----correction----
head(smp$prof == "agriculteur") 

#------------------

#--- tableau de fréquence TRUE/FALSE----
#insérer le code ici :
#-----correction----
table(smp$prof == "agriculteur") 
#------------------

#--- indices des valeurs TRUE----
#insérer le code ici :
#-----correction----
which(smp$prof == "agriculteur") 
#------------------

#--- âge des agriculteurs----
#insérer le code ici :
#-----correction----
smp$age[which(smp$prof == "agriculteur")] 
#âge des agriculteurs
#which sert à sélectionner les indices des valeurs TRUE
#la syntaxe de which est which(condition) et les [] servent à sélectionner les valeurs
#------------------

#--- âge des agriculteurs avec subset----
#insérer le code ici :
#-----correction----
subset(smp, prof == "agriculteur", age) 
#------------------

#--- 5 premières variables des agriculteurs----
#insérer le code ici :
#-----correction----
subset(smp, prof == "agriculteur", 1:5) 
#------------------

#--- noms des 5 premières variables----
#insérer le code ici :
#-----correction----
names(smp)[1:5] 
#------------------

#--- variables age, duree, discip, n.enfant des agriculteurs----
#insérer le code ici :
#-----correction----
subset(smp, prof == "agriculteur", c(age, duree, discip, n.enfant)) 
#------------------

#--- agriculteurs avec >2 enfants----
#insérer le code ici :
#-----correction----
subset(smp, prof == "agriculteur" & n.enfant > 2, c(age, duree, discip, n.enfant)) 
#------------------

#--- agriculteurs >2 enfants et duree non manquante----
#insérer le code ici :
#-----correction----
subset(smp, prof == "agriculteur" & n.enfant > 2 & complete.cases(duree), c(age, duree, discip, n.enfant)) 
#------------------

#--- fréquence n.enfant.cat----
#insérer le code ici :
#-----correction----
table(smp$n.enfant.cat) 
#------------------

#--- stocker tableau n.enfant.cat----
#insérer le code ici :
#-----correction----
tab <- table(smp$n.enfant.cat) 
#------------------

#--- somme des effectifs----
#insérer le code ici :
#-----correction----
sum(tab) 
#------------------

#--- proportion de chaque modalité----
#insérer le code ici :
#-----correction----
tab / sum(tab) 
#------------------

#--- proportion avec prop.table----
#insérer le code ici :
#-----correction----
prop.table(tab) 
#------------------

#--- proportion arrondie à 3 décimales----
#insérer le code ici :
#-----correction----
round(prop.table(tab),3) 
#------------------

#--- proportion arrondie à 2 décimales----
#insérer le code ici :
#-----correction----
round(prop.table(tab),2) 
#------------------

#--- barplot des %----
#insérer le code ici :
#-----correction----
barplot(prop.table(tab) * 100) 
#------------------

#--- barplot des % avec limite y=30----
#insérer le code ici :
#-----correction----
barplot(prop.table(tab) * 100, ylim=c(0,30)) 
#------------------

#--- barplot des % y=30, labels horizontaux----
#insérer le code ici :
#-----correction----
barplot(prop.table(tab) * 100, ylim=c(0,30), las=1) 
#------------------

#--- premières valeurs âge----
#insérer le code ici :
#-----correction----
head(smp$age) 
#------------------

#--- résumé statistique âge----
#insérer le code ici :
#-----correction----
summary(smp$age) 
#------------------

#--- histogramme âge----
#insérer le code ici :
#-----correction----
hist(smp$age) 
#------------------

#--- histogramme âge avec 8 classes----
#insérer le code ici :
#-----correction----
hist(smp$age, nclass=8) 
#------------------

#--- histogramme âge avec 8 classes + densité----
#insérer le code ici :
#-----correction----
hist(smp$age, nclass=8, prob=TRUE) 
#------------------

#--- histogramme âge + densité + labels horizontaux----
#insérer le code ici :
#-----correction----
hist(smp$age, nclass=8, prob=TRUE, las=1) 
#------------------

#--- ajouter courbe de densité âge----
#insérer le code ici :
#-----correction----
lines(density(smp$age, na.rm=TRUE)) 
#------------------