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
library(zoo)
library(kableExtra)
library(gtsummary)
library(dplyr)
library(lattice)
library(survey)
library(corrplot)
library(mice)
library(paletteer)
library(nord)
library(wesanderson)
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

#file_qmd <- "/Users/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/devoir_stats_avancees.qmd"

#extraction du code R pour le mettre à la fin du quarto md
file_qmd <- knitr::current_input()
if (is.null(file_qmd) || file_qmd == "") {
    file_qmd <- "devoir_stats_avancees.qmd"
}
if (!file.exists(file_qmd)) {
    stop(paste("Fichier Quarto introuvable:", file_qmd))
}
lines <- readLines(file_qmd, warn = FALSE)

# trouver les debuts de chunks R
starts <- grep("^```\\{r", lines)
# trouver les fins de chunks
ends   <- grep("^```\\s*$", lines)

if (length(starts) != length(ends)) {
    stop("Extraction des chunks R impossible : démarcations incohérentes")
}

code_r <- character(0)

for (i in seq_along(starts)) {
    # lignes à l’intérieur du chunk (excluant les balises de début et fin)
    chunk_lines <- lines[(starts[i] + 1):(ends[i] - 1)]
    # filtrer : garder seulement les lignes qui **ne sont pas des options Quarto**
    real_code <- chunk_lines[!grepl("^\\s*#\\|", chunk_lines)]
    # ajouter au vecteur final
    code_r <- c(code_r, real_code, "")
}

outfile <- file.path(dirname(file_qmd), "all_chunks_code.R")
cat(code_r, file = outfile, sep = "\n")

library(readxl)
#scl90 <- read_excel("/Users/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/outils autoeval.xls")
#groupe <- read_excel("/Users/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/outils groupe.xls")
#hdrs <- read_excel("/Users/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/outils hdrs.xls")

scl90 <- read_excel("/home/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/outils autoeval.xls")
groupe <- read_excel("/home/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/outils groupe.xls")
hdrs <- read_excel("/home/thomashusson/Documents/Projets/M2biostatistiques/devoir_stats_avancees/outils hdrs.xls")

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
hdrs_items <- c("1_humeur_depressive","2_sentim_culpabilite","3_suicide","4_insomnie_debut","5_insomnie_milieu","6_insomnie_matin","7_travail_activite","8_ralentissement","9_agitation","10_anxiete_psychique","11_anxiete_somatique","12_symptomes_gastro","13_symptomes_generaux","14_symptomes_genitaux","15_hypochondrie","16_perte_poids","17_prise_conscience")

hdrs$score <- rowSums(hdrs[, hdrs_items], na.rm = TRUE)

# supprimer la ligne 741 de hdrs car les données sont manquantes
hdrs <- hdrs[-741, ]

# supprimer HAMD16A et HAMD16B si présentes
hdrs <- hdrs[, setdiff(names(hdrs), c("HAMD16A", "HAMD16B"))]

summary(groupe)
describe(groupe)
groupe$NUMERO[duplicated(groupe)]
length(unique(groupe$NUMERO))

# ordonner en fonction du numéro de patient
groupe <- groupe[order(groupe$NUMERO), ] # Questions 1 et 2

# fusion des 3 dataframes
hdrs_groupe <- merge(hdrs, groupe, by = "NUMERO", all.x = TRUE)
scl90_groupe <- merge(scl90, groupe, by = "NUMERO", all.x = TRUE)
df_total_wide <- merge(hdrs_groupe, scl90, by = c("NUMERO", "VISIT"), all.x = TRUE)

library(reshape2)

## HDRS -> wide
hdrs_wide <- reshape2::dcast(
    hdrs_groupe,
    NUMERO + GROUPE ~ VISIT,
    value.var = "score"
)

hdrs_long <- melt(
    hdrs_groupe,
    id.vars = c("NUMERO", "VISIT", "GROUPE"),
    variable.name = "item",
    value.name = "value"
)


## SCL90 -> long
scl90_long <- melt(
    scl90_groupe,
    id.vars = c("NUMERO", "VISIT", "GROUPE"),
    variable.name = "item",
    value.name = "value"
)

## TOTAL (HDRS + SCL90) -> long
df_total_long <- melt(
    df_total_wide,
    id.vars = c("NUMERO", "VISIT", "GROUPE"),
    variable.name = "item",
    value.name = "value"
)


hdrs_J0 <- subset(hdrs_groupe, VISIT == "J0")

# Vraie palette Nord (package nord)
# On prend une palette qualitative (frost) et on l’étend à 5 couleurs
cols_nord <- nord::nord("frost", 5)

# Première série de graphiques (9 au maximum)
par(mfrow = c(3, 3), mar = c(2, 2, 2, 1))
items1 <- hdrs_items[1:min(9, length(hdrs_items))]
for (item in items1) {
    val <- na.omit(hdrs_J0[[item]])
    if (length(val) > 0) {
        m <- max(val)
        hist(val,
            main = item,
            xlab = "Score",
            col = cols_nord[1:(m + 1)],
            border = "white",
            breaks = seq(-0.5, m + 0.5, 1),
            xaxt = "n")
        axis(1, at = 0:m)
    } else {
        plot.new()
        title(main = paste(item, "(pas de données)"))
    }
    }
par(mfrow = c(1, 1))

# Deuxième série de graphiques (8 au maximum, de 10 à 17)
if (length(hdrs_items) > 9) {
    par(mfrow = c(3, 3), mar = c(2, 2, 2, 1))
    items2 <- hdrs_items[10:min(17, length(hdrs_items))]
    for (item in items2) {
        val <- na.omit(hdrs_J0[[item]])
        if (length(val) > 0) {
        m <- max(val)
        hist(val,
            main = item,
            xlab = "Score",
            col = cols_nord[1:(m + 1)],
            border = "white",
            breaks = seq(-0.5, m + 0.5, 1),
            xaxt = "n")
        axis(1, at = 0:m)
        } else {
        plot.new()
        title(main = paste(item, "(pas de données)"))
        }
    }
    par(mfrow = c(1, 1))
}

hdrs_J0_matrix <- hdrs_J0[, hdrs_items]
corr_matrix_J0 <- cor(hdrs_J0_matrix, use = "pairwise.complete.obs")

corrplot(corr_matrix_J0,
            method = "color",
            type = "upper",
            tl.col = "black",
            addCoef.col = "white",
            number.cex = 0.35,
            tl.cex = 0.6,
            tl.srt = 45,
            col = viridis::plasma(100)
            )

#renommer les noms des variables dans un nouveau df copié pour éviter la superposition
hdrs_J0_PCA <- hdrs_J0[,c(hdrs_items)]
colnames(hdrs_J0_PCA) <- c("1","2","3","4","5","6",
                            "7","8","9","10","11","12",
                            "13","14","15", "16", "17")
mdspca(hdrs_J0_PCA)

head(hdrs_J0[,c(hdrs_items)])
scree.plot(hdrs_J0[,c(hdrs_items)], simu=20, use = "P")

af_J0 <- factanal(
    na.omit(hdrs_J0[hdrs_items]),
    factors = 3,
    rotation = "varimax"
)

# Extraction propre des loadings
loadings_df <- as.data.frame(unclass(af_J0$loadings))

# Création explicite de la colonne Variable à partir des rownames
loadings_df$Variable <- rownames(loadings_df)

# Suppression des rownames pour éviter toute ambiguïté
rownames(loadings_df) <- NULL

# Réorganisation : Variable en première colonne
loadings_df <- loadings_df[, c("Variable", colnames(loadings_df)[1:3])]

# Arrondi
loadings_df[, -1] <- round(loadings_df[, -1], 3)

# Affichage LaTeX
knitr::kable(
    loadings_df,
    caption = "Contribution des facteurs à la variance de la réponse à chaque item du score de Hamilton évalué à J0 (analyse factorielle avec rotation varimax à 3 facteurs)",
    booktabs = TRUE,
    align = "lccc"
)

hdrs_J0$f1_somatique <- rowMeans(hdrs_J0[,c("8_ralentissement","12_symptomes_gastro","14_symptomes_genitaux","16_perte_poids")], na.rm=TRUE)
hdrs_J0$f2_asthenie <- rowMeans(hdrs_J0[,c("4_insomnie_debut","13_symptomes_generaux")], na.rm=TRUE)
hdrs_J0$f3_depressif <- rowMeans(hdrs_J0[,c("1_humeur_depressive","2_sentim_culpabilite","3_suicide","5_insomnie_milieu","6_insomnie_matin","7_travail_activite","9_agitation","10_anxiete_psychique","11_anxiete_somatique","15_hypochondrie","17_prise_conscience")], na.rm=TRUE)

hdrs_J0_subscores <- hdrs_J0[,c("f1_somatique","f2_asthenie","f3_depressif")]
colnames(hdrs_J0_subscores) <- c("F1_somatique","F2_asthenie","F3_depressif")
mdspca(hdrs_J0_subscores)

df_fpca <- data.frame(
    score_total = hdrs_J0$score,
    hdrs_J0_subscores
)

fpca(
    score_total ~ .,
    data = df_fpca
)

cronbach(hdrs_J0[,hdrs_items])
cronbach(hdrs_J0[,c("8_ralentissement","12_symptomes_gastro","14_symptomes_genitaux","16_perte_poids")])
cronbach(hdrs_J0[,c("4_insomnie_debut","13_symptomes_generaux")])
cronbach(hdrs_J0[,c("1_humeur_depressive","2_sentim_culpabilite","3_suicide","5_insomnie_milieu","6_insomnie_matin","7_travail_activite","9_agitation","10_anxiete_psychique","11_anxiete_somatique","15_hypochondrie","17_prise_conscience")])

#estimation des IC par bootstrap 
set.seed(123)
alpha_bootstrap <- function(data, indices) {
    d <- data[indices, ]
    return(cronbach(d)$alpha)
}
library(boot)
# Alpha global
boot_alpha_global <- boot(hdrs_J0[,hdrs_items], alpha_bootstrap, R = 1000)
boot.ci(boot_alpha_global, type = "bca")
# Facteur 1
boot_alpha_f1 <- boot(hdrs_J0[,c("8_ralentissement","12_symptomes_gastro","14_symptomes_genitaux","16_perte_poids")], alpha_bootstrap, R = 1000)
boot.ci(boot_alpha_f1, type = "bca")
# Facteur 2
boot_alpha_f2 <- boot(hdrs_J0[,c("4_insomnie_debut","13_symptomes_generaux")], alpha_bootstrap, R = 1000)
boot.ci(boot_alpha_f2, type = "bca")
# Facteur 3
boot_alpha_f3 <- boot(hdrs_J0[,c("1_humeur_depressive","2_sentim_culpabilite","3_suicide","5_insomnie_milieu","6_insomnie_matin","7_travail_activite","9_agitation","10_anxiete_psychique","11_anxiete_somatique","15_hypochondrie","17_prise_conscience")], alpha_bootstrap, R = 1000)
boot.ci(boot_alpha_f3, type = "bca")

#représentation des alpha de Cronbach avec IC en tableau
alpha_df <- data.frame(
    Scale = c("Global", "F1_somatique", "F2_asthenie", "F3_depressif"),
    Alpha = c(
        round(cronbach(hdrs_J0[,hdrs_items])$alpha, 3),
        round(cronbach(hdrs_J0[,c("8_ralentissement","12_symptomes_gastro","14_symptomes_genitaux","16_perte_poids")])$alpha, 3),
        round(cronbach(hdrs_J0[,c("4_insomnie_debut","13_symptomes_generaux")])$alpha, 3),
        round(cronbach(hdrs_J0[,c("1_humeur_depressive","2_sentim_culpabilite","3_suicide","5_insomnie_milieu","6_insomnie_matin","7_travail_activite","9_agitation","10_anxiete_psychique","11_anxiete_somatique","15_hypochondrie","17_prise_conscience")])$alpha, 3)
    ),
    CI_lower = c(
        round(boot.ci(boot_alpha_global, type = "bca")$bca[4], 3),
        round(boot.ci(boot_alpha_f1, type = "bca")$bca[4], 3),
        round(boot.ci(boot_alpha_f2, type = "bca")$bca[4], 3),
        round(boot.ci(boot_alpha_f3, type = "bca")$bca[4], 3)
    ),
    CI_upper = c(
        round(boot.ci(boot_alpha_global, type = "bca")$bca[5], 3),
        round(boot.ci(boot_alpha_f1, type = "bca")$bca[5], 3),
        round(boot.ci(boot_alpha_f2, type = "bca")$bca[5], 3),
        round(boot.ci(boot_alpha_f3, type = "bca")$bca[5], 3)
    )
)
knitr::kable(
    alpha_df,
    caption = "Alpha de Cronbach et intervalles de confiance à 95% pour l'échelle de Hamilton à J0 et ses sous-échelles",
    booktabs = TRUE,
    align = "lccc"
)

#création fichier large avec hdrs_J0 et scl90_dim à J0
scl90_J0 <- subset(scl90_dim, VISIT == "J0")
scl90_J0 <- scl90_J0[,c("NUMERO","VISIT",dimensions)]
scl90_J0 <- scl90_J0[order(scl90_J0$NUMERO), ]
hdrs_J0 <- hdrs_J0[order(hdrs_J0$NUMERO), ]
hdrs_scl90_J0 <- merge(hdrs_J0, scl90_J0, by = c("NUMERO", "VISIT"), all.x = TRUE)

# Matrice de corrélation complète
corr_validite_J0 <- cor(
    hdrs_scl90_J0[, c("score", dimensions)],
    use = "pairwise.complete.obs"
)

# Corrplot
corrplot(
    corr_validite_J0["score", , drop = FALSE],
    method = "color",
    type = "full",
    tl.col = "black",
    addCoef.col = "white",
    number.cex = 0.5,
    tl.cex = 0.4,
    tl.srt = 30,
    col = viridis::plasma(100)
)

corr_validité_sousscores_J0 <- cor(hdrs_scl90_J0[,c("f1_somatique","f2_asthenie","f3_depressif", dimensions)], use = "pairwise.complete.obs")

# Corrplot
corrplot(
    corr_validité_sousscores_J0[c("f1_somatique","f2_asthenie","f3_depressif"), , drop = FALSE],
    method = "color",
    type = "full",
    tl.col = "black",
    addCoef.col = "white",
    number.cex = 0.5,
    tl.cex = 0.4,
    tl.srt = 30,
    col = viridis::plasma(100)
)

n_J56 <- nrow(subset(hdrs_groupe, VISIT == "J56"))
n_J56
n_J0 <- nrow(subset(hdrs_groupe, VISIT == "J0"))
n_J0
pct_present_J56 <- (n_J56 / n_J0) * 100
pct_present_J56


hdrs_J56 <- subset(hdrs_groupe, VISIT == "J56")
# Vraie palette Nord (package nord)
# On prend une palette qualitative (aurora) et on l’étend à 5 couleurs
cols_nord <- nord::nord("aurora", 5)
# Première série de graphiques (9 au maximum)
par(mfrow = c(3, 3), mar = c(2, 2, 2, 1))
items1 <- hdrs_items[1:min(9, length(hdrs_items))]
for (item in items1) {
    val <- na.omit(hdrs_J56[[item]])
    if (length(val) > 0) {
        m <- max(val)
        hist(val,
            main = item,
            xlab = "Score",
            col = cols_nord[1:(m + 1)],
            border = "white",
            breaks = seq(-0.5, m + 0.5, 1),
            xaxt = "n")
        axis(1, at = 0:m)
    } else {
        plot.new()
        title(main = paste(item, "(pas de données)"))
    }
    }
par(mfrow = c(1, 1))
# Deuxième série de graphiques (8 au maximum, de 10 à 17)
if (length(hdrs_items) > 9) {
    par(mfrow = c(3, 3), mar = c(2, 2, 2, 1))
    items2 <- hdrs_items[10:min(17, length(hdrs_items))]
    for (item in items2) {
        val <- na.omit(hdrs_J56[[item]])
        if (length(val) > 0) {
        m <- max(val)
        hist(val,
            main = item,
            xlab = "Score",
            col = cols_nord[1:(m + 1)],
            border = "white",
            breaks = seq(-0.5, m + 0.5, 1),
            xaxt = "n")
        axis(1, at = 0:m)
        } else {
        plot.new()
        title(main = paste(item, "(pas de données)"))
        }
    }
    par(mfrow = c(1, 1))
}

hdrs_J56_matrix <- hdrs_J56[, hdrs_items]
corr_matrix_J56 <- cor(hdrs_J56_matrix, use = "pairwise.complete.obs")

corrplot(corr_matrix_J56,
            method = "color",
            type = "upper",
            tl.col = "black",
            addCoef.col = "white",
            number.cex = 0.35,
            tl.cex = 0.6,
            tl.srt = 45,
            col = viridis::plasma(100)
            )

#renommer les noms des variables dans un nouveau df copié pour éviter la superposition
hdrs_J56_PCA <- hdrs_J56[,c(hdrs_items)]
colnames(hdrs_J56_PCA) <- c("1","2","3","4","5","6",
                            "7","8","9","10","11","12",
                            "13","14","15", "16", "17")
mdspca(hdrs_J56_PCA)

head(hdrs_J56[,c(hdrs_items)])
scree.plot(hdrs_J56[,c(hdrs_items)], simu=20, use = "P")

af_J56 <- factanal(
    na.omit(hdrs_J56[hdrs_items]),
    factors = 1,
    rotation = "varimax"
)
# Extraction propre des loadings
loadings_df_J56 <- as.data.frame(unclass(af_J56$loadings))
# Création explicite de la colonne Variable à partir des rownames
loadings_df_J56$Variable <- rownames(loadings_df_J56)
# Suppression des rownames pour éviter toute ambiguïté
rownames(loadings_df_J56) <- NULL
# Réorganisation : Variable en première colonne
loadings_df_J56 <- loadings_df_J56[, c("Variable", colnames(loadings_df_J56)[1])]
# Arrondi
loadings_df_J56[, -1] <- round(loadings_df_J56[, -1], 3)
# Affichage LaTeX
knitr::kable(
    loadings_df_J56,
    caption = "Contribution du facteur unique à la variance de la réponse à chaque item du score de Hamilton évalué à J56 (analyse factorielle avec rotation varimax à 1 facteur)",
    booktabs = TRUE,
    align = "lccc"
)

cronbach(hdrs_J56[,hdrs_items])

#estimation des IC par bootstrap
set.seed(123)
boot_alpha_J56 <- boot(hdrs_J56[,hdrs_items], alpha_bootstrap, R = 1000)
boot.ci(boot_alpha_J56, type = "bca")

#représentation des alpha de Cronbach avec IC en tableau
alpha_J56_df <- data.frame(
    Scale = c("Global"),
    Alpha = c(
        round(cronbach(hdrs_J56[,hdrs_items])$alpha, 3)
    ),
    CI_lower = c(
        round(boot.ci(boot_alpha_J56, type = "bca")$bca[4], 2)
    ),
    CI_upper = c(
        round(boot.ci(boot_alpha_J56, type = "bca")$bca[5], 2)
    )
)
knitr::kable(
    alpha_J56_df,
    caption = "Alpha de Cronbach et intervalle de confiance à 95% pour l'échelle de Hamilton à J56",
    booktabs = TRUE,
    align = "lccc"
)

#création fichier large avec hdrs_J56 et scl90_dim à J56
scl90_J56 <- subset(scl90_dim, VISIT == "J56")
scl90_J56 <- scl90_J56[,c("NUMERO","VISIT",dimensions)]
scl90_J56 <- scl90_J56[order(scl90_J56$NUMERO), ]
hdrs_J56 <- hdrs_J56[order(hdrs_J56$NUMERO), ]
hdrs_scl90_J56 <- merge(hdrs_J56, scl90_J56, by = c("NUMERO", "VISIT"), all.x = TRUE)

# Matrice de corrélation complète
corr_validite_J56 <- cor(
    hdrs_scl90_J56[, c("score", dimensions)],
    use = "pairwise.complete.obs"
)
# Corrplot
corrplot(
    corr_validite_J56["score", , drop = FALSE],
    method = "color",
    type = "full",
    tl.col = "black",
    addCoef.col = "white",
    number.cex = 0.65,
    tl.cex = 0.4,
    tl.srt = 25,
    col = viridis::magma(100)
)

df_fpca_J56 <- data.frame(
    score_total = hdrs_scl90_J56$score,
    hdrs_scl90_J56[, dimensions]
)

fpca(
    score_total ~ .,
    data = df_fpca_J56
)

library(dplyr)
hdrs_J0_grouped <- hdrs_J0 %>%
    group_by(GROUPE) %>%
    summarise(
        N = n(),
        Moyenne = round(mean(score, na.rm = TRUE), 1),
        "Écart type" = round(sd(score, na.rm = TRUE), 2),
        Médiane = round(median(score, na.rm = TRUE), 2),
        Q1 = round(quantile(score, 0.25, na.rm = TRUE), 2),
        Q3 = round(quantile(score, 0.75, na.rm = TRUE), 2)
    )
knitr::kable(
    hdrs_J0_grouped,
    caption = "Scores bruts de l'échelle de Hamilton à J0 par groupe de traitement",
    booktabs = TRUE,
    align = "lcccccc"
)

par(mfrow = c(1, 2), mar = c(4, 4, 2, 1))
# Histogramme des scores bruts par groupe (côté à côte)
hist(hdrs_J0$score[hdrs_J0$GROUPE == 0], 
        col = "#bf616a", 
        main = " ", 
        xlab = "Score brut Hamilton", 
        ylab = "Fréquence", 
        xlim = range(hdrs_J0$score), 
        ylim = c(0, max(table(cut(hdrs_J0$score, breaks = 4)))))
hist(hdrs_J0$score[hdrs_J0$GROUPE == 1], 
        col = paste0("#88c0d0", "80"),
        add = TRUE, #permet de superposer les histogrammes
        breaks = 4)
legend("topright", legend = c("Groupe 0", "Groupe 1"), 
        fill = c("#bf616a", "#88c0d0"))
# Boxplot
boxplot(score ~ GROUPE,
    data = hdrs_J0,
    main = " ",
    xlab = "Groupe de traitement",
    ylab = "Score brut Hamilton",
    col = c("#bf616a", "#88c0d0"),
    names = c("Groupe 0", "Groupe 1")
)
par(mfrow = c(1, 1))

t_test_J0 <- hdrs_J0 %>%
    tbl_summary(
        include = score,
        by = GROUPE,
        statistic = all_continuous() ~ "{mean} ({sd})",
        digits = all_continuous() ~ 2
    ) %>%
    add_p(
        test = all_continuous() ~ "t.test",
        test.args = all_continuous() ~ list(var.equal = TRUE)
    )
t_test_J0


visits <- c("J0", "J4", "J7", "J14", "J21", "J28", "J42", "J56")

tableau_patients_jours <- table(
    hdrs_groupe$GROUPE,
    factor(hdrs_groupe$VISIT, levels = visits)
)

knitr::kable(
    tableau_patients_jours,
    caption = "Nombre de patients par groupe de traitement et visite",
    booktabs = TRUE,
    align = c("lcccccccc")
)

par(mfrow = c(1, 2), mar = c(4, 4, 2, 1))
# Groupe 0
hdrs_groupe0 <- subset(hdrs_groupe, GROUPE == 0)
boxplot(score ~ VISIT,
    data = hdrs_groupe0,
    main = "Groupe 0",
    xlab = "",
    ylab = "Score brut Hamilton",
    col = "#bf616a"
)
# Groupe 1
hdrs_groupe1 <- subset(hdrs_groupe, GROUPE == 1)
boxplot(score ~ VISIT,
    data = hdrs_groupe1,
    main = "Groupe 1",
    xlab = "",
    ylab = "",
    col = "#88c0d0"
)
par(mfrow = c(1, 1))

# utilisation de ggplot2 pour les diagrammes en spaghetti avec ggparcoord
library(ggplot2)
library(GGally)
palette_nord <- c("#bf616a", "#88c0d0")

hdrs_wide <- reshape2::dcast(
    hdrs_groupe,
    NUMERO + GROUPE ~ VISIT,
    value.var = "score"
)
hdrs_wide$GROUPE <- factor(hdrs_wide$GROUPE)
ggparcoord(
    data = hdrs_wide,
    columns = 3:10,
    groupColumn = "GROUPE",
    scale = "globalminmax",
    missing = "exclude"
) +
    theme_minimal() +
    labs(
        title = " ",
        x = " ",
        y = "Score brut Hamilton",
        color = "Groupe"
    ) +
    scale_color_manual(
        values = palette_nord,
        labels = c("Groupe 0", "Groupe 1")
    )

hdrs_J56 <- subset(hdrs_groupe, VISIT %in% c("J56"))
boxplot(score ~ GROUPE,
    data = hdrs_J56,
    main = " ",
    xlab = " ",
    ylab = "Score brut Hamilton",
    col = c("#bf616a", "#88c0d0"),
    names = c("Groupe 0", "Groupe 1")
)

#on reprend hdrs_wide créé précédemment (hdrs au format large, qui contient les scores à chaque visite en colonnes)
hdrs_wide

hdrs_wide_locf <- hdrs_wide
#fonction na.locf de zoo pour imputer les valeurs manquantes par la dernière valeur observée
hdrs_wide_locf[, visits] <- t(zoo::na.locf(t(as.matrix(hdrs_wide[, visits])), na.rm = FALSE))
#vérification de l'imputation (format wide)
hdrs_wide_locf

# ajout d'une variable "difference" qui correspond à la différence entre le score à J56 et le score à J0 (après imputation LOCF)
hdrs_wide_locf$difference <- hdrs_wide_locf$J56 - hdrs_wide_locf$J0

# retour au format long après imputation LOCF
head(hdrs_wide_locf)
hdrs_groupe_locf <- reshape(
    data = hdrs_wide_locf,
    idvar = c("NUMERO", "GROUPE"),
    varying = visits,
    times = visits,
    v.names = "score",
    timevar = "VISIT",
    direction = "long"
)
head(hdrs_groupe_locf)


# garder aussi le score observé (avant imputation) dans le même df
hdrs_groupe_obs <- reshape(
    data = hdrs_wide,
    idvar = c("NUMERO", "GROUPE"),
    varying = visits,
    times = visits,
    v.names = "score_obs",
    timevar = "VISIT",
    direction = "long"
)

# Effectifs après LOCF (toutes les visites existent maintenant)
tableau_patients_jours_locf <- table(hdrs_groupe_locf$GROUPE, hdrs_groupe_locf$VISIT)
tableau_patients_jours_locf


knitr::kable(
    tableau_patients_jours_locf,
    caption = "Nombre de patients par groupe de traitement et visite après imputation LOCF",
    booktabs = TRUE,
    align = c("lcccccccc")
)

par(mfrow = c(1, 2), mar = c(4, 4, 2, 1))
hist(hdrs_wide_locf$difference,
    main = " ",
    xlab = "Différence de score (J56 - J0)",
    col = "#81a1c1",
    border = "white",
    breaks = 10,
    freq = FALSE
)
curve(dnorm(x, mean = mean(hdrs_wide_locf$difference), sd = sd(hdrs_wide_locf$difference)),
    col = "red",
    lwd = 2,
    add = TRUE
)
qqnorm(hdrs_wide_locf$difference,
    main = " ",
    col = "#81a1c1"
)
qqline(hdrs_wide_locf$difference, col = "red")
par(mfrow = c(1, 1))

t_test_diff_locf <- hdrs_wide_locf %>%
    tbl_summary(
        include = difference,
        by = GROUPE,
        statistic = all_continuous() ~ "{mean} ({sd})",
        digits = all_continuous() ~ 2
    ) %>%
    add_p(
        test = all_continuous() ~ "t.test",
        test.args = all_continuous() ~ list(var.equal = TRUE)
    )
t_test_diff_locf

# ordonner les niveaux de VISIT pour avoir J0 en référence et J56 en dernier
# ne pas faire sur les données imputées (données AVANT LOCF)
hdrs_groupe$VISIT <- factor(as.character(hdrs_groupe$VISIT),
                            levels = c("J0","J4","J7","J14","J21","J28","J42","J56"))

modele_mixte_sans_interaction <- lmer(
            score ~ VISIT + GROUPE + (1 | NUMERO), 
            data = hdrs_groupe
            )

summary(modele_mixte_sans_interaction)

# Extraction des coefficients, IC et p-values
coef_summary <- summary(modele_mixte_sans_interaction)$coefficients
conf_int <- confint(modele_mixte_sans_interaction, level = 0.95, parm = "beta_")
p_values <- coef_summary[, "Pr(>|t|)"]
p_values_fmt <- ifelse(
    p_values < 0.001,
    "< 0.001",
    ifelse(
        p_values < 0.01,
        "< 0.01",
        ifelse(p_values < 0.05, "< 0.05", sprintf("%.4f", p_values))
    )
)
# Création du tableau récapitulatif
modele_mixte_sans_interaction_df <- data.frame(
    Coefficient = rownames(coef_summary),
    Estimate = round(coef_summary[, "Estimate"], 3),
    Std_Error = round(coef_summary[, "Std. Error"], 3),
    t_value = round(coef_summary[, "t value"], 3),
    CI_lower = round(conf_int[, 1], 3),
    CI_upper = round(conf_int[, 2], 3),
    p_value = p_values_fmt
)
# Affichage LaTeX
knitr::kable(
    modele_mixte_sans_interaction_df,
    caption = "Estimation des coefficients du modèle mixte sans interaction entre VISIT (facteur) et GROUPE",
    booktabs = TRUE,
    align = "lcccccc",
    row.names = FALSE
)

# convertir VISIT en variable numérique (jours)
hdrs_groupe$VISIT_num <- as.numeric(sub("J", "", as.character(hdrs_groupe$VISIT))) 
modele_mixte_sans_interaction_continu <- lmer(
            score ~ VISIT_num + GROUPE + (1 | NUMERO), 
            data = hdrs_groupe
            )
summary(modele_mixte_sans_interaction_continu)

# Extraction des coefficients, IC et p-values
coef_summary_continu <- summary(modele_mixte_sans_interaction_continu)$coefficients
conf_int_continu <- confint(modele_mixte_sans_interaction_continu, level = 0.95, parm = "beta_")
p_values_continu <- coef_summary_continu[, "Pr(>|t|)"]
p_values_continu_fmt <- ifelse(
    p_values_continu < 0.001,
    "< 0.001",
    ifelse(
        p_values_continu < 0.01,
        "< 0.01",
        ifelse(p_values_continu < 0.05, "< 0.05", sprintf("%.4f", p_values_continu))
    )
)
# Création du tableau récapitulatif
modele_mixte_sans_interaction_continu_df <- data.frame(
    Coefficient = rownames(coef_summary_continu),
    Estimate = round(coef_summary_continu[, "Estimate"], 3),
    Std_Error = round(coef_summary_continu[, "Std. Error"], 3),
    t_value = round(coef_summary_continu[, "t value"], 3),
    CI_lower = round(conf_int_continu[, 1], 3),
    CI_upper = round(conf_int_continu[, 2], 3),
    p_value = p_values_continu_fmt
)
# Affichage LaTeX
knitr::kable(
    modele_mixte_sans_interaction_continu_df,
    caption = "Estimation des coefficients du modèle mixte sans interaction entre VISIT (continue) et GROUPE",
    booktabs = TRUE,
    align = "lcccccc",
    row.names = FALSE
)

modele_mixte_avec_interaction <- lmer(
            score ~ VISIT * GROUPE + (1 | NUMERO), 
            data = hdrs_groupe
            )
summary(modele_mixte_avec_interaction)

# Extraction des coefficients, IC et p-values
coef_summary <- summary(modele_mixte_avec_interaction)$coefficients
p_values <- coef_summary[, "Pr(>|t|)"]
p_values_fmt <- ifelse(
    p_values < 0.001,
    "< 0.001",
    ifelse(
        p_values < 0.01,
        "< 0.01",
        ifelse(p_values < 0.05, "< 0.05", sprintf("%.4f", p_values))
    )
)
# Création du tableau récapitulatif
modele_mixte_interaction_df <- data.frame(
    Coefficient = rownames(coef_summary),
    Estimate = round(coef_summary[, "Estimate"], 3),
    Std_Error = round(coef_summary[, "Std. Error"], 3),
    t_value = round(coef_summary[, "t value"], 3),
    p_value = p_values_fmt
)
# Affichage LaTeX
knitr::kable(
    modele_mixte_interaction_df,
    caption = "Estimation des coefficients du modèle mixte avec interaction entre VISIT (facteur) et GROUPE",
    booktabs = TRUE,
    align = "lcccc",
    row.names = FALSE
)

modele_mixte_avec_interaction_continu <- lmer(
            score ~ VISIT_num * GROUPE + (1 | NUMERO), 
            data = hdrs_groupe
            )
summary(modele_mixte_avec_interaction_continu)

# Extraction des coefficients, IC et p-values
coef_summary_continu <- summary(modele_mixte_avec_interaction_continu)$coefficients
p_values_continu <- coef_summary_continu[, "Pr(>|t|)"]
p_values_continu_fmt <- ifelse(
    p_values_continu < 0.001,
    "< 0.001",
    ifelse(
        p_values_continu < 0.01,
        "< 0.01",
        ifelse(p_values_continu < 0.05, "< 0.05", sprintf("%.4f", p_values_continu))
    )
)
# Création du tableau récapitulatif
modele_mixte_interaction_continu_df <- data.frame(
    Coefficient = rownames(coef_summary_continu),
    Estimate = round(coef_summary_continu[, "Estimate"], 3),
    Std_Error = round(coef_summary_continu[, "Std. Error"], 3),
    t_value = round(coef_summary_continu[, "t value"], 3),
    p_value = p_values_continu_fmt
)
# Affichage LaTeX
knitr::kable(
    modele_mixte_interaction_continu_df,
    caption = "Estimation des coefficients du modèle mixte avec interaction entre VISIT (continue) et GROUPE",
    booktabs = TRUE,
    align = "lcccc",
    row.names = FALSE
)

test_interaction <- drop1(
    modele_mixte_avec_interaction_continu,
    test = "F"
)

num_df <- if ("NumDF" %in% colnames(test_interaction)) {
    test_interaction$NumDF
} else if ("Df" %in% colnames(test_interaction)) {
    test_interaction$Df
} else {
    rep(NA_integer_, nrow(test_interaction))
}
den_df <- if ("DenDF" %in% colnames(test_interaction)) {
    test_interaction$DenDF
} else {
    rep(NA_integer_, nrow(test_interaction))
}
f_value <- if ("F value" %in% colnames(test_interaction)) {
    test_interaction$`F value`
} else if ("F" %in% colnames(test_interaction)) {
    test_interaction$F
} else {
    rep(NA_real_, nrow(test_interaction))
}
test_interaction_df <- data.frame(
    Term = rownames(test_interaction),
    NumDF = num_df,
    DenDF = den_df,
    F_value = round(f_value, 3),
    p_value = ifelse(
        test_interaction$`Pr(>F)` < 0.001,
        "< 0.001",
        ifelse(
            test_interaction$`Pr(>F)` < 0.01,
            "< 0.01",
            ifelse(test_interaction$`Pr(>F)` < 0.05, "< 0.05", sprintf("%.4f", test_interaction$`Pr(>F)`))
        )
    )
)
knitr::kable(
    test_interaction_df,
    caption = "Test F de l'effet d'interaction entre VISIT (continue) et GROUPE",
    booktabs = TRUE,
    align = "lcccc",
    row.names = FALSE
)

par(mfrow = c(1, 2))
residus <- resid(modele_mixte_avec_interaction_continu)
hist(residus,
    main = " ",
    xlab = "Résidus",
    col = "#81a1c1",
    border = "white",
    breaks = 100,
    freq = FALSE
)
qqnorm(residus,
    main = " ",
    col = "#81a1c1"
)
qqline(residus, col = "red")
par(mfrow = c(1, 1))

# on repart de hdrs_wide (scores HDRS par visite)
hdrs_wide_reponse <- hdrs_wide
hdrs_wide_reponse$score_J0 <- hdrs_wide_reponse$J0

# extraire la dernière visite observée (non manquante) par patient
visits_matrix <- as.matrix(hdrs_wide_reponse[, visits])
valid <- rowSums(!is.na(visits_matrix)) > 0

# index de la dernière valeur non manquante sur la ligne
last_idx <- max.col(!is.na(visits_matrix), ties.method = "last")
last_idx[!valid] <- NA

# stocker la dernière visite et le dernier score observé
hdrs_wide_reponse$derniere_visite <- NA
hdrs_wide_reponse$score_dernier <- NA
hdrs_wide_reponse$derniere_visite[valid] <- visits[last_idx[valid]]
hdrs_wide_reponse$score_dernier[valid] <- visits_matrix[cbind(which(valid), last_idx[valid])]

# critère binaire de réponse: chute >= 50% par rapport à J0
hdrs_wide_reponse$reponse <- ifelse(
    !is.na(hdrs_wide_reponse$score_dernier) &
        hdrs_wide_reponse$score_dernier <= 0.5 * hdrs_wide_reponse$score_J0,
    1,
    0
)

# fusionner la réponse avec les données au format long
hdrs_groupe_reponse <- merge(
    hdrs_groupe,
    hdrs_wide_reponse[, c("NUMERO", "GROUPE", "score_J0", "derniere_visite", "score_dernier", "reponse")],
    by = c("NUMERO", "GROUPE")
)

# verification rapide du resultat (aperçu)
head(hdrs_groupe_reponse)

# verifier que hdrs_groupe et hdrs_groupe_reponse ne diffèrent pas hors colonnes ajoutées
cols_added <- c("score_J0", "derniere_visite", "score_dernier", "reponse")
common_cols <- setdiff(names(hdrs_groupe_reponse), cols_added)
hdrs_groupe_sorted <- hdrs_groupe[order(hdrs_groupe$NUMERO, hdrs_groupe$GROUPE), common_cols]
hdrs_groupe_reponse_base <- hdrs_groupe_reponse[order(hdrs_groupe_reponse$NUMERO, hdrs_groupe_reponse$GROUPE), common_cols]
coerce_like <- function(x, template) {
    if (is.factor(template)) return(factor(x, levels = levels(template)))
    if (is.integer(template)) return(as.integer(x))
    if (is.numeric(template)) return(as.numeric(x))
    if (is.character(template)) return(as.character(x))
    if (is.logical(template)) return(as.logical(x))
    x
}
for (col in common_cols) {
    hdrs_groupe_reponse_base[[col]] <- coerce_like(hdrs_groupe_reponse_base[[col]], hdrs_groupe_sorted[[col]])
}
all.equal(hdrs_groupe_sorted, hdrs_groupe_reponse_base, check.attributes = FALSE)

# prop.table: chute < 50% a la derniere visite (dans hdrs_groupe via jointure)
tmp_resp <- hdrs_wide_reponse[, c("NUMERO", "GROUPE", "score_J0", "score_dernier")]
tmp_resp$chute_lt_50 <- with(tmp_resp, !is.na(score_dernier) & score_dernier > 0.5 * score_J0)
hdrs_groupe_check <- merge(hdrs_groupe, tmp_resp[, c("NUMERO", "GROUPE", "chute_lt_50")], by = c("NUMERO", "GROUPE"), all.x = TRUE)
prop.table(table(hdrs_groupe_check$chute_lt_50, useNA = "ifany"))

# prop.table: reponse binaire dans hdrs_groupe_reponse
prop.table(table(hdrs_groupe_reponse$reponse, useNA = "ifany"))

# convertir les visites en jours
visit_days <- c(J0 = 0, J4 = 4, J7 = 7, J14 = 14, J21 = 21, J28 = 28, J42 = 42, J56 = 56)
# calculer temps_suivi et evenement (réponse)
scores_mat <- as.matrix(hdrs_wide_reponse[, visits])
follow_mat <- scores_mat[, -1, drop = FALSE]
score_j0 <- hdrs_wide_reponse$score_J0

# position de la première visite manquante (censure à la visite précédente)
na_mat <- is.na(follow_mat)
na_any <- rowSums(na_mat) > 0
na_pos <- max.col(na_mat, ties.method = "first")
na_pos[!na_any] <- NA

# position de la première réponse (chute >= 50% par rapport à J0)
resp_mat <- sweep(follow_mat, 1, 0.5 * score_j0, "<=")
resp_mat[is.na(resp_mat)] <- FALSE
resp_any <- rowSums(resp_mat) > 0
resp_pos <- max.col(resp_mat, ties.method = "first")
resp_pos[!resp_any] <- NA

# par défaut : censuré à J56
temps_suivi <- rep(visit_days["J56"], nrow(follow_mat))
evenement <- rep(0, nrow(follow_mat))

# réponse avant la première NA
event_before_censor <- !is.na(resp_pos) & (is.na(na_pos) | resp_pos < na_pos)
temps_suivi[event_before_censor] <- visit_days[visits[-1][resp_pos[event_before_censor]]]
evenement[event_before_censor] <- 1

# censure avant réponse
censor_before_event <- !is.na(na_pos) & (is.na(resp_pos) | na_pos < resp_pos)
temps_suivi[censor_before_event] <- visit_days[visits[na_pos[censor_before_event]]]

hdrs_wide_reponse$temps_suivi <- temps_suivi
hdrs_wide_reponse$evenement <- evenement
# vérifier les temps de suivi
head(hdrs_wide_reponse[, c("NUMERO", "temps_suivi", "evenement", "reponse")])
# distribution des événements par temps (doit montrer des réponses avant J56)
table(hdrs_wide_reponse$evenement, hdrs_wide_reponse$temps_suivi, useNA = "ifany")

tableau_temps_suivi <- table(
    hdrs_wide_reponse$GROUPE,
    hdrs_wide_reponse$temps_suivi
)
knitr::kable(
    tableau_temps_suivi,
    caption = "Temps de suivi (en jours) par groupe de traitement",
    booktabs = TRUE,
    align = c("lcccccccc")
)

# créer l'objet Survival
surv_obj_reponse <- Surv(time = hdrs_wide_reponse$temps_suivi, event = hdrs_wide_reponse$evenement)
# ajuster le modèle de survie de Kaplan-Meier par groupe
km_fit_reponse <- survfit(surv_obj_reponse ~ GROUPE, data = hdrs_wide_reponse)
# test de log-rank
logrank_test_reponse <- survdiff(surv_obj_reponse ~ GROUPE, data = hdrs_wide_reponse)
logrank_test_reponse

# tracer les courbes de survie
ggsurvplot(km_fit_reponse,
            data = hdrs_wide_reponse,
            pval = TRUE,
            conf.int = TRUE,
            risk.table = TRUE,
            risk.table.col = "strata",
            xlim = c(0, 56),
            break.time.by = 7,
            surv.scale = "percent",
            legend.labs = c("Groupe 0", "Groupe 1"),
            palette = c("#bf616a", "#88c0d0"),
            xlab = "Temps (jours)",
            ylab = "Probabilité de survie",
)

# ajuster le modèle de Cox
cox_model_reponse <- coxph(surv_obj_reponse ~ GROUPE, data = hdrs_wide_reponse)

# Extraction des coefficients, HR, IC et p-values
coef_summary_cox <- summary(cox_model_reponse)$coefficients
conf_int_cox <- confint(cox_model_reponse, level = 0.95)
# Création du tableau récapitulatif
cox_model_reponse_df <- data.frame(
    Coefficient = rownames(coef_summary_cox),
    Estimate = round(coef_summary_cox[, "coef"], 3),
    HR = round(exp(coef_summary_cox[, "coef"]), 3),
    CI_lower = round(exp(conf_int_cox[, 1]), 3),
    CI_upper = round(exp(conf_int_cox[, 2]), 3),
    p_value = round(coef_summary_cox[, "Pr(>|z|)"], 4)
)
# Affichage LaTeX
knitr::kable(
    cox_model_reponse_df,
    caption = "Estimation des coefficients du modèle de Cox pour le critère binaire de réponse au traitement",
    booktabs = TRUE,
    align = "lccccc",
    row.names = FALSE
)

plot(cox.zph(cox_model_reponse), main = "Risques proportionnels - Modèle de Cox binaire")


#insérer le code à la fin du fichier

# lire le fichier code genere
code <- readLines("all_chunks_code.R", warn = FALSE)

code_wrapped <- code

if (knitr::is_latex_output()) {
    code_safe <- gsub(
        "\\\\(begin|end)\\{lstlisting\\}",
        "\\\\textbackslash \\1{lstlisting}",
        code_wrapped
    )
    cat("\\begin{lstlisting}\n")
    cat(code_safe, sep = "\n")
    cat("\n\\end{lstlisting}\n")
} else {
    cat("```r\n")
    cat(code_wrapped, sep = "\n")
    cat("\n```")
}

