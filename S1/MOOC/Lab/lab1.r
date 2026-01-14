setwd("~/Documents/R/M2 biostatistiques/MOOC/Lab")

##-----vidéo MOOC S1Lab1------
url <- "https://ff933736-7b27-4cb8-b59e-a1b7af5eaab3.svc.edge.scw.cloud/aws/5ed75b79-7279-5f18-a73a-ea14a290f15c/mp4/1585769704_720.mp4"
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

##-----lab-----

##import des données
smp <- read.csv2("smp2.csv")

#afficher données 
str(smp) #structure
head(smp) #première ligne 

summary(smp) #résumé des variables numériques
summary(smp$age) #accéder à la variable âge
min(smp$age, na.rm = FALSE) #minimum de la variable âge 
min(smp$age, na.rm = TRUE) #minimum de la variable âge en ignorant les NA

summary(smp$abus) #traitée comme une variable quantitative alors que c'est une qualitative binaire (Y/N)

abus <- factor(smp$abus, levels = c(0,1), labels = c("No", "Yes")) #transformer en facteur avec des labels
table(abus)

table(smp$n.enfant) #nombre d'enfants sur le smb

table(smp$n.enfant > 4) #nombre d'enfants > 4 (avec TRUE/FALSE en résultat)

smp$n.enfant.cat <- factor(smp$n.enfant)

levels(smp$n.enfant.cat)
nlevels(smp$n.enfant.cat)

levels(smp$n.enfant.cat)[6:13] <- "5+"
#sert à regrouper les modalités 5 à 13 en une seule modalité "5+"
table(smp$n.enfant.cat)


save(smp,file="smp_v1.rda")
