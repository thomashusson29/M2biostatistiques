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
library(lattice)
library(survey)
library(corrplot)
library(mice)
library(paletteer)
library(nord)
library(wesanderson)
library(lubridate)
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
detect_qmd_path <- function() {
    candidates <- c(
        knitr::current_input(),
        Sys.getenv("QUARTO_DOCUMENT_PATH", ""),
        Sys.getenv("QUARTO_INPUT_FILE", ""),
        "devoir_epidemio.qmd",
        file.path("S2", "devoir_epidemio", "devoir_epidemio.qmd")
    )
    candidates <- unique(candidates[nzchar(candidates)])
    for (p in candidates) {
        if (file.exists(p)) return(normalizePath(p, winslash = "/", mustWork = TRUE))
    }
    NA_character_
}

file_qmd <- detect_qmd_path()
if (is.na(file_qmd)) {
    warning("Extraction des chunks R sautée : impossible de localiser le .qmd (problème de working directory / IDE).")
} else {
    lines <- readLines(file_qmd, warn = FALSE)

    # trouver les débuts de chunks R
    starts <- grep("^```\\{r\\b", lines)
    code_r <- character(0)

    for (s in starts) {
        if (s >= length(lines)) next
        rel_end <- which(grepl("^```\\s*$", lines[(s + 1):length(lines)]))[1]
        if (is.na(rel_end)) {
            warning("Extraction des chunks R partielle : fin de chunk manquante après la ligne ", s, ".")
            next
        }
        e <- s + rel_end

        # lignes à l’intérieur du chunk (excluant les balises de début et fin)
        chunk_lines <- lines[(s + 1):(e - 1)]
        # filtrer : garder seulement les lignes qui **ne sont pas des options Quarto**
        real_code <- chunk_lines[!grepl("^\\s*#\\|", chunk_lines)]
        code_r <- c(code_r, real_code, "")
    }

    outfile <- file.path(dirname(file_qmd), "all_chunks_code.R")
    cat(code_r, file = outfile, sep = "\n")
}

# Charger les données
df <- read.csv2("/Users/thomashusson/Documents/Projets/M2biostatistiques/S2/devoir_epidemio/rhc devoir épidémio-RC csv.csv", header = TRUE, stringsAsFactors = FALSE)
summary(df)
colnames(df)
str(df)

# Supprimer les colonnes inutile (ROWNAMES et PTID) en appelant explictement les noms des colonnes à supprimer
df <- df[, !(colnames(df) %in% c("ROWNAMES", "PTID"))]
colnames(df)

# Renommer les colonnes 
# syntaxe : names(df)[names(df) == "ANCIEN_NOM"] <- "NOUVEAU_NOM"
names(df)[names(df) == "CAT1"]     <- "primary_disease_category"
names(df)[names(df) == "CAT2"]     <- "secondary_disease_category"
names(df)[names(df) == "CA"]       <- "cancer"
names(df)[names(df) == "SADMDTE"]  <- "date_admission"
names(df)[names(df) == "DSCHDTE"]  <- "date_discharge"
names(df)[names(df) == "DTHDTE"]   <- "date_death"
names(df)[names(df) == "LSTCTDTE"] <- "date_last_news"
names(df)[names(df) == "DEATH"]    <- "death_180d"

names(df)[names(df) == "CARDIOHX"] <- "comorbidity_cardio"
names(df)[names(df) == "CHFHX"]    <- "comorbidity_chf"
names(df)[names(df) == "DEMENTHX"] <- "comorbidity_dementia"
names(df)[names(df) == "PSYCHHX"]  <- "comorbidity_psych"
names(df)[names(df) == "CHRPULHX"] <- "comorbidity_chronic_pulmonary"
names(df)[names(df) == "RENALHX"]  <- "comorbidity_renal"
names(df)[names(df) == "LIVERHX"]  <- "comorbidity_liver"
names(df)[names(df) == "GIBLEDHX"] <- "comorbidity_upper_gi_bleeding"
names(df)[names(df) == "MALIGHX"]  <- "comorbidity_malignancy"
names(df)[names(df) == "IMMUNHX"]  <- "comorbidity_immunosuppression"
names(df)[names(df) == "TRANSHX"]  <- "comorbidity_transfer"
names(df)[names(df) == "AMIHX"]    <- "comorbidity_myocardial_infarction"

names(df)[names(df) == "AGE"]      <- "age"
names(df)[names(df) == "SEX"]      <- "sex"
names(df)[names(df) == "EDU"]      <- "education_years"
names(df)[names(df) == "SURV2MD1"] <- "survival_probability"
names(df)[names(df) == "DAS2D3PC"] <- "DASI_score"
names(df)[names(df) == "T3D30"]    <- "time_to_death_or_censoring"
names(df)[names(df) == "DTH30"]    <- "death_30d"

names(df)[names(df) == "APS1"]     <- "apache_score"
names(df)[names(df) == "SCOMA1"]   <- "coma_score"
names(df)[names(df) == "MEANBP1"]  <- "mean_blood_pressure"
names(df)[names(df) == "WBLC1"]    <- "wbc"
names(df)[names(df) == "HRT1"]     <- "heart_rate"
names(df)[names(df) == "RESP1"]    <- "respiratory_rate"
names(df)[names(df) == "TEMP1"]    <- "temperature"
names(df)[names(df) == "PAFI1"]    <- "pa_fi_ratio"
names(df)[names(df) == "ALB1"]     <- "albumin"
names(df)[names(df) == "HEMA1"]    <- "hematocrit"
names(df)[names(df) == "BILI1"]    <- "bilirubin"
names(df)[names(df) == "CREA1"]    <- "creatinine"
names(df)[names(df) == "SOD1"]     <- "sodium"
names(df)[names(df) == "POT1"]     <- "potassium"
names(df)[names(df) == "PACO21"]   <- "paco2"
names(df)[names(df) == "PH1"]      <- "ph"

names(df)[names(df) == "SWANG1"]   <- "rhc"
names(df)[names(df) == "WTKILO1"]  <- "weight"
names(df)[names(df) == "DNR1"]     <- "dnr_status"
names(df)[names(df) == "NINSCLAS"] <- "insurance_class"

names(df)[names(df) == "RESP"]     <- "diagnosis_respiratory"
names(df)[names(df) == "CARD"]     <- "diagnosis_cardiovascular"
names(df)[names(df) == "NEURO"]    <- "diagnosis_neurological"
names(df)[names(df) == "GASTR"]    <- "diagnosis_gastrointestinal"
names(df)[names(df) == "RENAL"]    <- "diagnosis_renal"
names(df)[names(df) == "META"]     <- "diagnosis_metabolic"
names(df)[names(df) == "HEMA"]     <- "diagnosis_hematologic"
names(df)[names(df) == "SEPS"]     <- "diagnosis_sepsis"
names(df)[names(df) == "TRAUMA"]   <- "diagnosis_trauma"
names(df)[names(df) == "ORTHO"]    <- "diagnosis_orthopedic"

names(df)[names(df) == "ADLD3P"]   <- "adl_score"
names(df)[names(df) == "URIN1"]    <- "urine_output"
names(df)[names(df) == "RACE"]     <- "race"
names(df)[names(df) == "INCOME"]   <- "income"

# Conversion des dates (les chaînes vides -> NA pour éviter les warnings)
df$date_admission[df$date_admission == ""] <- NA
df$date_discharge[df$date_discharge == ""] <- NA
df$date_death[df$date_death == ""] <- NA
df$date_last_news[df$date_last_news == ""] <- NA

# Conversion en format date
df$date_admission <- as.Date(df$date_admission, format = "%d/%m/%Y")
df$date_discharge <- as.Date(df$date_discharge, format = "%d/%m/%Y")
df$date_death <- as.Date(df$date_death, format = "%d/%m/%Y")
df$date_last_news <- as.Date(df$date_last_news, format = "%d/%m/%Y")

# Facteurs et numériques
df$death_180d <- factor(df$death_180d, levels = c("No", "Yes"))
df$primary_disease_category <- factor(df$primary_disease_category)
df$secondary_disease_category <- factor(df$secondary_disease_category)
df$comorbidity_cardio <- factor(df$comorbidity_cardio, levels = c(0, 1), labels = c("No", "Yes"))
df$comorbidity_chf <- factor(df$comorbidity_chf, levels = c(0, 1), labels = c("No", "Yes"))
df$comorbidity_dementia <- factor(df$comorbidity_dementia, levels = c(0, 1), labels = c("No", "Yes"))
df$comorbidity_psych <- factor(df$comorbidity_psych, levels = c(0, 1), labels = c("No", "Yes"))
df$comorbidity_chronic_pulmonary <- factor(df$comorbidity_chronic_pulmonary, levels = c(0, 1), labels = c("No", "Yes"))
df$comorbidity_renal <- factor(df$comorbidity_renal, levels = c(0, 1), labels = c("No", "Yes"))
df$comorbidity_liver <- factor(df$comorbidity_liver, levels = c(0, 1), labels = c("No", "Yes"))
df$comorbidity_upper_gi_bleeding <- factor(df$comorbidity_upper_gi_bleeding, levels = c(0, 1), labels = c("No", "Yes"))
df$comorbidity_malignancy <- factor(df$comorbidity_malignancy, levels = c(0, 1), labels = c("No", "Yes"))
df$comorbidity_immunosuppression <- factor(df$comorbidity_immunosuppression, levels = c(0, 1), labels = c("No", "Yes"))
df$comorbidity_transfer <- factor(df$comorbidity_transfer, levels = c(0, 1), labels = c("No", "Yes"))
df$comorbidity_myocardial_infarction <- factor(df$comorbidity_myocardial_infarction, levels = c(0, 1), labels = c("No", "Yes"))
df$cancer <- factor(df$cancer, levels = c("No", "Yes", "Metastatic"))
df$sex <- factor(df$sex, levels = c("Male", "Female"))
df$time_to_death_or_censoring <- as.numeric(df$time_to_death_or_censoring)
df$death_30d <- factor(df$death_30d, levels = c("No", "Yes"))
df$apache_score <- as.numeric(df$apache_score)
df$coma_score <- as.numeric(df$coma_score)
df$heart_rate <- as.numeric(df$heart_rate)
df$sodium <- as.numeric(df$sodium)
df$dnr_status <- factor(df$dnr_status, levels = c("No", "Yes"))
df$insurance_class <- factor(df$insurance_class)
df$diagnosis_respiratory <- factor(df$diagnosis_respiratory, levels = c("No", "Yes"))
df$diagnosis_cardiovascular <- factor(df$diagnosis_cardiovascular, levels = c("No", "Yes"))
df$diagnosis_neurological <- factor(df$diagnosis_neurological, levels = c("No", "Yes"))
df$diagnosis_gastrointestinal <- factor(df$diagnosis_gastrointestinal, levels = c("No", "Yes"))
df$diagnosis_renal <- factor(df$diagnosis_renal, levels = c("No", "Yes"))
df$diagnosis_metabolic <- factor(df$diagnosis_metabolic, levels = c("No", "Yes"))
df$diagnosis_hematologic <- factor(df$diagnosis_hematologic, levels = c("No", "Yes"))
df$diagnosis_sepsis <- factor(df$diagnosis_sepsis, levels = c("No", "Yes"))
df$diagnosis_trauma <- factor(df$diagnosis_trauma, levels = c("No", "Yes"))
df$diagnosis_orthopedic <- factor(df$diagnosis_orthopedic, levels = c("No", "Yes"))
df$adl_score <- as.numeric(df$adl_score)
df$race <- factor(df$race)
df$income <- factor(df$income, levels = c("Under $11k", "$11-$25k", "$25-$50k", "Over $50k"))
df$rhc <- factor(df$rhc, levels = c("No RHC", "RHC"))
str(df)

#vérification du format des datese 
is.Date(df$date_death)
is.Date(df$date_last_news) 
# Vérification de la cohérence entre date_death et date_last_news pour les patients décédés
incoherent_dates <- df$death_180d == "Yes" & df$date_death > df$date_last_news
sum(incoherent_dates) # Nombre de cas incohérents

# Correction des dates incohérentes
df$date_last_news[incoherent_dates] <- df$date_death[incoherent_dates]
# Vérification après correction
incoherent_dates_after <- df$death_180d == "Yes" & df$date_death > df$date_last_news
sum(incoherent_dates_after) # Nombre de cas incohérents après correction (devrait être 0)


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

