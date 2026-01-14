#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| label: setup
#| include: false
#| echo: false
library(forecast)
library(plotrix)
library(randomForest)
library(tidyr)
library(epiR)
library(viridisLite)
library(ggplot2)
library(binom)
library(survminer)
library(pROC)
library(treemap)
library(psy)
library(MASS)
library(rpart)
library(rpart.plot)
library(plotly)
library(lmerTest)
library(psych)
library(lme4)
library(prettyR)
library(kableExtra)
library(gtsummary)
library(dplyr)
library(lattice)
library(survey)
library(mice)
library(qgraph)
library(nlme)
library(pwr)
library(ape)
library(survival)
library(gmodels)
library(httpgd)
library(e1071)
library(psy)
library(reshape2)
knitr::opts_chunk$set(echo = TRUE)
knitr::opts_chunk$set(fig.height = 6)
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| label: import données
#| echo: false
#| results: hide
#| message: false
#| warning: false
library(readxl)
scl90 <- read_excel("/Users/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/outils autoeval.xls")
groupe <- read_excel("/Users/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/outils groupe.xls")
hdrs <- read_excel("/Users/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/outils hdrs.xls")
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| label: gestion scl90
#| echo: false #affiche le code
#| eval: true #execute le code
#| results: hide # CACHE le résultat texte
#| message: false # cache les messages de chargement
#| warning: false #  Cache les avertissements
describe(scl90)
summary(scl90)

# ordonne chronologiquement les visites pour chaque patient
scl90$VISIT <- factor(scl90$VISIT,
                        levels = c("J0", "J4", "J7", "J14", "J21", "J28", "J42", "J56"),
                        ordered = TRUE)

# ordonner les visites en fonction du numéro de patient
scl90 <- scl90[order(scl90$NUMERO, scl90$VISIT), ] 

# identification des doublons 
scl90$NUMERO[duplicated(scl90)]

# nombre de patients uniques
length(unique(scl90$NUMERO))

# visualisation des données aberrantes
apply(scl90, 2, table, useNA = "always")
scl90[, 3:92][scl90[, 3:92] > 4] <- NA
apply(scl90, 2, table, useNA = "always")

# données manquantes
sum(is.na(scl90))
# proportion : 
sum(is.na(scl90)) / (nrow(scl90) * ncol(scl90))*100

#imputation par le mode pour chaque question 
scl_questions <- c(names(select(scl90,starts_with("Q"))))
for (question in scl_questions) {
    original <- scl90[[question]]
    factorized <- as.factor(original)
    mode_value <- as.integer(names(which.max(table(factorized))))
    imputed <- original
    imputed[is.na(imputed)] <- mode_value
    scl90[[question]] <- imputed
}
# vérifier qu'il n'y a plus de NA
sum(is.na(scl90))

# création des scores moyens par dimension
scl90$somatisation <- apply(scl90[,c(3,6,14,29,44,50,51,54,55,58,60,42)],1,mean,na.rm=TRUE)
scl90$symptomes_obsession <- apply(scl90[,c(11,12,30,40,5,47,48,53,57,67)],1,mean,na.rm=TRUE)
scl90$vulnerabilite <- apply(scl90[,c(8,23,36,38,39,43,63,71,75)],1,mean,na.rm=TRUE)
scl90$depression <- apply(scl90[,c(7,16,17,22,24,28,31,32,33,34,56,73,81)],1,mean,na.rm=TRUE)
scl90$anxiete <- apply(scl90[,c(4,19,25,35,41,59,74,80,82,88)],1,mean,na.rm=TRUE)
scl90$hostilite <- apply(scl90[,c(13,26,65,69,76,83)],1,mean,na.rm=TRUE)
scl90$phobies <- apply(scl90[,c(15,27,49,72,77,84,52)],1,mean,na.rm=TRUE)
scl90$paranoia <- apply(scl90[,c(10,20,45,70,78,85)],1,mean,na.rm=TRUE)
scl90$psychotique <- apply(scl90[,c(9,18,37,64,79,86,87,89,92,90)],1,mean,na.rm=TRUE)
scl90$sympt_divers <- apply(scl90[,c(21,46,61,62,66,68,91)],1,mean,na.rm=TRUE)

# création d'un nouveau dataframe avec uniquement les 10 dimensions
dimensions <- c("somatisation", "symptomes_obsession", "vulnerabilite", "depression", "anxiete", "hostilite", "phobies", "paranoia", "psychotique", "sympt_divers")
scl90_dim <- scl90[, c("NUMERO", "VISIT", dimensions)]
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#| label: gestion hdrs
#| echo: false #affiche le code
#| eval: true #execute le code
#| results: hide # CACHE le résultat texte
#| message: false # cache les messages de chargement
#| warning: false #  Cache les avertissements
hdrs$VISIT <- factor(hdrs$VISIT,
                        levels = c("J0", "J4", "J7", "J14", "J21", "J28", "J42", "J56"),
                        ordered = TRUE)

# ordonner les visites en fonction du numéro de patient
hdrs <- hdrs[order(hdrs$NUMERO, hdrs$VISIT), ] 

# identification des doublons 
hdrs$NUMERO[duplicated(hdrs)]

# nombre de patients uniques
length(unique(hdrs$NUMERO))

# fusion des variables HAMD16A et HAMD16B en une seule variable HAMD16
hdrs$HAMD16 <- ifelse(!is.na(hdrs$HAMD16A), hdrs$HAMD16A, hdrs$HAMD16B)
table(hdrs$HAMD16, useNA = "ifany")

# calcul du score total HDRS
items <- c("HAMD1","HAMD2","HAMD3","HAMD4","HAMD5","HAMD6",
            "HAMD7","HAMD8","HAMD9","HAMD10","HAMD11","HAMD12",
            "HAMD13","HAMD14","HAMD15", "HAMD16", "HAMD17")

#renommer la colonne hdrs$HAMD1 en hdrs$humeur_depressive
colnames(hdrs)[colnames(hdrs) == "HAMD1"] <- "1_humeur_depressive"
colnames(hdrs)[colnames(hdrs) == "HAMD2"] <- "2_sentim_culpabilite"
colnames(hdrs)[colnames(hdrs) == "HAMD3"] <- "3_suicide"
colnames(hdrs)[colnames(hdrs) == "HAMD4"] <- "4_insomnie_debut"
colnames(hdrs)[colnames(hdrs) == "HAMD5"] <- "5_insomnie_milieu"
colnames(hdrs)[colnames(hdrs) == "HAMD6"] <- "6_insomnie_matin"
colnames(hdrs)[colnames(hdrs) == "HAMD7"] <- "7_travail_activite"
colnames(hdrs)[colnames(hdrs) == "HAMD8"] <- "8_ralentissement"
colnames(hdrs)[colnames(hdrs) == "HAMD9"] <- "9_agitation"
colnames(hdrs)[colnames(hdrs) == "HAMD10"] <- "10_anxiete_psychique"
colnames(hdrs)[colnames(hdrs) == "HAMD11"] <- "11_anxiete_somatique"
colnames(hdrs)[colnames(hdrs) == "HAMD12"] <- "12_symptomes_gastro"
colnames(hdrs)[colnames(hdrs) == "HAMD13"] <- "13_symptomes_generaux"
colnames(hdrs)[colnames(hdrs) == "HAMD14"] <- "14_symptomes_genitaux"
colnames(hdrs)[colnames(hdrs) == "HAMD15"] <- "15_hypochondrie"
colnames(hdrs)[colnames(hdrs) == "HAMD16"] <- "16_perte_poids"
colnames(hdrs)[colnames(hdrs) == "HAMD17"] <- "17_prise_conscience"

# calcul du score total HDRS
items <- c("1_humeur_depressive","2_sentim_culpabilite","3_suicide","4_insomnie_debut","5_insomnie_milieu","6_insomnie_matin","7_travail_activite","8_ralentissement","9_agitation","10_anxiete_psychique","11_anxiete_somatique","12_symptomes_gastro","13_symptomes_generaux","14_symptomes_genitaux","15_hypochondrie","16_perte_poids","17_prise_conscience")

hdrs$score <- rowSums(hdrs[, items], na.rm = TRUE)
#
#
#
#
#
#| label: gestion groupes
#| echo: false #affiche le code
#| eval: true #execute le code
#| results: hide # CACHE le résultat texte
#| message: false # cache les messages de chargement
#| warning: false #  Cache les avertissements
summary(groupe)
describe(groupe)
groupe$NUMERO[duplicated(groupe)]
length(unique(groupe$NUMERO))

# ordonner en fonction du numéro de patient
groupe <- groupe[order(groupe$NUMERO), ] # Questions 1 et 2
#
#
#
#
#
#
#
