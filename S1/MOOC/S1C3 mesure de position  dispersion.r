##----1-IMPORT SMP----
setwd("/Users/thomashusson/Documents/R/M2 biostatistiques/MOOC")

#import smp
smp.c <- read.csv2("S1C2 smp1.csv")

htmltools::browsable(
  htmltools::tags$video(
    src = "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/416eaca8-4835-5798-826c-30e1e6e5f5fd/mp4/1585769687_720.mp4",
    type = "video/mp4",
    controls = NA,
    width = "700px"
  )
)

#Fontion summary()
summary(smp.c)
#summary affiche des statistiques descriptives de base pour chaque variable du dataframe

#pour mieux représenter ça : 
describe(smp.c)
#describe() affiche des statistiques descriptives plus détaillées pour chaque variable du dataframe
#mais n'affiche pas les minimum et maximum

#pour afficher des trucs spécifiques : 
describe(smp.c,num.desc=c("mean","sd","median","min","max","valid.n"))
#structure : 
#describ(DATAFRAME, num.desc = c("STATISTIQUES À AFFICHER ENTRE GUILLEMENTS AVEC DES VIRGULES"))

#num.desc permet de choisir les statistiques à afficher
#valid.n sert à afficher le nombre de valeurs non manquantes
#na.rm=TRUE permet de ne pas prendre en compte les valeurs manquantes (NA = Not Available)


#afficher seulement la moyenne de l'âge
mean(smp.c$age,na.rm=TRUE)
#mean() : calcule la moyenne

#afficher seulement l'écart type 
sd(smp.c$age,na.rm=TRUE)
#sd() : calcule l'écart type

#pour variable catégorielle
table(smp.c$prof, deparse.level = 2, useNA = "always")
#table() : calcule le nombre d'individus dans chaque catégorie
#deparse.level = 2 : affiche les noms des catégories (on pourrait ne pas le mettre)
#useNA = "always" : inclut les valeurs manquantes (NA) dans le tableau

