library(forecast)
library(cobalt)
library(plotrix)
library(randomForest)
library(dplyr)
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
library(skimr)
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
skimr::skim(df)
sum(is.na(df))

# Supprimer les colonnes inutile (ROWNAMES et PTID) en appelant explictement les noms des colonnes à supprimer
df <- df[, !(colnames(df) %in% c("ROWNAMES", "PTID"))]
colnames(df)

# Renommer les colonnes 
# syntaxe : names(df)[names(df) == "ANCIEN_NOM"] <- "NOUVEAU_NOM"
names(df)[names(df) == "CAT1"] <- "primary_disease_category"
names(df)[names(df) == "CAT2"] <- "secondary_disease_category"
names(df)[names(df) == "CA"] <- "cancer"
names(df)[names(df) == "SADMDTE"] <- "date_admission"
names(df)[names(df) == "DSCHDTE"] <- "date_discharge"
names(df)[names(df) == "DTHDTE"] <- "date_death"
names(df)[names(df) == "LSTCTDTE"] <- "date_last_news"
names(df)[names(df) == "DEATH"] <- "death_180d"

names(df)[names(df) == "CARDIOHX"] <- "comorbidity_cardiovascular"
names(df)[names(df) == "CHFHX"] <- "comorbidity_congestive_heart"
names(df)[names(df) == "DEMENTHX"] <- "comorbidity_dementia"
names(df)[names(df) == "PSYCHHX"] <- "comorbidity_psych"
names(df)[names(df) == "CHRPULHX"] <- "comorbidity_chronic_pulmonary"
names(df)[names(df) == "RENALHX"] <- "comorbidity_renal"
names(df)[names(df) == "LIVERHX"] <- "comorbidity_liver"
names(df)[names(df) == "GIBLEDHX"] <- "comorbidity_upper_gi_bleeding"
names(df)[names(df) == "MALIGHX"] <- "comorbidity_malignancy"
names(df)[names(df) == "IMMUNHX"] <- "comorbidity_immunosuppression"
names(df)[names(df) == "TRANSHX"] <- "comorbidity_transfer"
names(df)[names(df) == "AMIHX"] <- "comorbidity_myocardial_infarction"

names(df)[names(df) == "AGE"] <- "age"
names(df)[names(df) == "SEX"] <- "sex"
names(df)[names(df) == "EDU"] <- "education_years"
names(df)[names(df) == "SURV2MD1"] <- "survival_probability_2mths"
names(df)[names(df) == "DAS2D3PC"] <- "DASI_score"
names(df)[names(df) == "T3D30"] <- "time_to_death_if_death_within_30d"
names(df)[names(df) == "DTH30"] <- "death_30d"

names(df)[names(df) == "APS1"] <- "apache_score"
names(df)[names(df) == "SCOMA1"] <- "glasgow_score"
names(df)[names(df) == "MEANBP1"] <- "mean_blood_pressure"
names(df)[names(df) == "WBLC1"] <- "wbc"
names(df)[names(df) == "HRT1"] <- "heart_rate"
names(df)[names(df) == "RESP1"] <- "respiratory_rate"
names(df)[names(df) == "TEMP1"] <- "temperature"
names(df)[names(df) == "PAFI1"] <- "pa_fi_ratio"
names(df)[names(df) == "ALB1"] <- "albumin"
names(df)[names(df) == "HEMA1"] <- "hematocrit"
names(df)[names(df) == "BILI1"] <- "bilirubin"
names(df)[names(df) == "CREA1"] <- "creatinine"
names(df)[names(df) == "SOD1"] <- "sodium"
names(df)[names(df) == "POT1"] <- "potassium"
names(df)[names(df) == "PACO21"] <- "paco2"
names(df)[names(df) == "PH1"] <- "ph"

names(df)[names(df) == "SWANG1"] <- "rhc"
names(df)[names(df) == "WTKILO1"] <- "weight"
names(df)[names(df) == "DNR1"] <- "dnr_status"
names(df)[names(df) == "NINSCLAS"] <- "insurance_class"

names(df)[names(df) == "RESP"] <- "diagnosis_respiratory"
names(df)[names(df) == "CARD"] <- "diagnosis_cardiovascular"
names(df)[names(df) == "NEURO"] <- "diagnosis_neurological"
names(df)[names(df) == "GASTR"] <- "diagnosis_gastrointestinal"
names(df)[names(df) == "RENAL"] <- "diagnosis_renal"
names(df)[names(df) == "META"] <- "diagnosis_metabolic"
names(df)[names(df) == "HEMA"] <- "diagnosis_hematologic"
names(df)[names(df) == "SEPS"] <- "diagnosis_sepsis"
names(df)[names(df) == "TRAUMA"] <- "diagnosis_trauma"
names(df)[names(df) == "ORTHO"] <- "diagnosis_orthopedic"

names(df)[names(df) == "ADLD3P"] <- "adl_score"
names(df)[names(df) == "URIN1"] <- "urine_output"
names(df)[names(df) == "RACE"] <- "race"
names(df)[names(df) == "INCOME"] <- "income"

# Ajout d'une description des variables
desc <- c(
  primary_disease_category = "Diagnostic principal",
  secondary_disease_category = "Comorbidité principale",
  cancer = "Cancer (No, Yes, Metastatic)",
  date_admission = "Date d'admission",
  date_discharge = "Date de sortie",
  date_death = "Date de décès",
  date_last_news = "Date des dernières nouvelles",
  death_180d = "Décès à 180 jours (Yes/No)",

  comorbidity_cardiovascular = "Antécédent : cardiovasculaire",
  comorbidity_congestive_heart = "Antécédent : insuffisance cardiaque",
  comorbidity_dementia = "Antécédent : démence",
  comorbidity_psych = "Antécédent : psychiatrique",
  comorbidity_chronic_pulmonary = "Antécédent : respiratoire chronique",
  comorbidity_renal = "Antécédent : rénal",
  comorbidity_liver = "Antécédent : hépatique",
  comorbidity_upper_gi_bleeding = "Antécédent : hémorragie digestive haute",
  comorbidity_malignancy = "Antécédent : cancer",
  comorbidity_immunosuppression = "Antécédent : immunodépression",
  comorbidity_transfer = "Transfert (> 24h)",
  comorbidity_myocardial_infarction = "Antécédent : infarctus du myocarde",

  age = "Âge (années)",
  sex = "Sexe",
  education_years = "Niveau d'études (années)",
  survival_probability_2mths = "Probabilité de survie prédite",
  DASI_score = "Score DASI",
  death_30d = "Décès à 30 jours",

  apache_score = "Score APACHE",
  glasgow_score = "Score de Glasgow",
  mean_blood_pressure = "Pression artérielle moyenne",
  wbc = "Leucocytes (x10^9/L)",
  heart_rate = "Fréquence cardiaque (bpm)",
  respiratory_rate = "Fréquence respiratoire (rpm)",
  temperature = "Température (°C)",
  pa_fi_ratio = "Rapport PaO2/FiO2",
  albumin = "Albumine (g/L)",
  hematocrit = "Hématocrite (%)",
  bilirubin = "Bilirubine (mg/L)",
  creatinine = "Créatinine (mg/L)",
  sodium = "Sodium (mmol/L)",
  potassium = "Potassium (mmol/L)",
  paco2 = "PaCO2",
  ph = "pH",

  rhc = "Cathétérisme cardiaque droit (RHC)",
  weight = "Poids (kg)",
  dnr_status = "Statut de non-réanimation (DNR)",
  insurance_class = "Classe d'assurance",

  diagnosis_respiratory = "Diagnostic : respiratoire",
  diagnosis_cardiovascular = "Diagnostic : cardiovasculaire",
  diagnosis_neurological = "Diagnostic : neurologique",
  diagnosis_gastrointestinal = "Diagnostic : gastro-intestinal",
  diagnosis_renal = "Diagnostic : rénal",
  diagnosis_metabolic = "Diagnostic : métabolique",
  diagnosis_hematologic = "Diagnostic : hématologique",
  diagnosis_sepsis = "Diagnostic : sepsis",
  diagnosis_trauma = "Diagnostic : traumatique",
  diagnosis_orthopedic = "Diagnostic : orthopédique",

  adl_score = "Score ADL",
  urine_output = "Diurèse",
  race = "Origine / race (selon codage de la base)",
  income = "Revenu (selon codage de la base)"
)

missing_data_summary <- data.frame(
  variable = names(colSums(is.na(df))),
  missing_nombre = colSums(is.na(df)),
  missing_pourcentage = round(colSums(is.na(df)) / nrow(df) * 100, 1)
)
missing_data_summary <- missing_data_summary[missing_data_summary$missing_nombre > 0, ]
#affichage du tableau des données manquantes avec kableExtra pour un rendu plus lisible
missing_data_summary %>%
  arrange(desc(missing_pourcentage)) %>%
  kable(
    caption = "Résumé des données manquantes par variable",
    col.names = c("Variable", "Nombre de données manquantes", "Pourcentage de données manquantes"),
    align = c("l", "r", "r"),
    row.names = FALSE
  ) %>%
  kable_styling(full_width = FALSE, position = "center")


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

str(df$date_death)
df$date_death <- as.Date(df$date_death, format = "%d/%m/%Y")
str(df$date_death)

# Facteurs et numériques
df$death_180d <- factor(df$death_180d, levels = c("No", "Yes"))

df$primary_disease_category <- factor(
    df$primary_disease_category, 
    levels = c("COPD","MOSF w/Sepsis","MOSF w/Malignancy","ARF","CHF","Coma","Cirrhosis","Lung Cancer","Colon Cancer"), 
    labels = c("BPCO","Choc septique","Choc sur cancer","Insuffisance rénale aiguë","Insuffisance cardiaque","Coma","Cirrhose","Cancer du poumon","Cancer du côlon")
    )
unique(df$primary_disease_category)
table(df$primary_disease_category)

df$secondary_disease_category <- factor(
    df$secondary_disease_category, 
    levels = c("", "MOSF w/Sepsis","MOSF w/Malignancy", "Coma","Cirrhosis","Lung Cancer","Colon Cancer"), 
    labels = c("Pas de comorbidité","Choc septique","Choc sur cancer", "Coma","Cirrhose","Cancer du poumon","Cancer du côlon")
    )

df$comorbidity_cardiovascular <- factor(df$comorbidity_cardiovascular, levels = c(0, 1), labels = c("No", "Yes"))
df$comorbidity_congestive_heart <- factor(df$comorbidity_congestive_heart, levels = c(0, 1), labels = c("No", "Yes"))
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
#recodage de la variable cancer (No, Yes, Metastatic en No, Localisé, Metastatic)
df$cancer <- factor(df$cancer, levels = c("No", "Yes", "Metastatic"), labels = c("No", "Localisé", "Metastatic"))
#créer une variable binaire pour le cancer (Yes/No) à partir de la variable cancer (No, Localisé, Metastatic, codé Yes si Localisé ou Metastatic, No sinon)
df$cancer_YN <- ifelse(df$cancer %in% c("Localisé", "Metastatic"), "Yes", "No")
table(df$cancer_YN)
df$sex <- factor(df$sex, levels = c("Male", "Female"))
df$death_30d <- factor(df$death_30d, levels = c("No", "Yes"))
df$apache_score <- as.numeric(df$apache_score)
df$glasgow_score <- as.numeric(df$glasgow_score)
df$heart_rate <- as.numeric(df$heart_rate)
df$sodium <- as.numeric(df$sodium)
df$dnr_status <- factor(df$dnr_status, levels = c("No", "Yes"))
df$insurance_class <- factor(
    df$insurance_class,
    levels = c(
        "No insurance",
        "Medicaid",
        "Medicare",
        "Medicare & Medicaid",
        "Private",
        "Private & Medicare"
    )
)
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
df$income <- as.character(df$income)
df$income[df$income == "> $50k"] <- "Over $50k"
df$income <- factor(df$income, levels = c("Under $11k", "$11-$25k", "$25-$50k", "Over $50k"))
df$rhc <- factor(df$rhc, levels = c("No RHC", "RHC"))

#recodage en binaire des primary_disease_category et secondary_disease_category (présence ou absence de chaque catégorie de maladie)
df$primary_binaire_BPCO <- ifelse(df$primary_disease_category == "BPCO", "Yes", "No")
df$primary_binaire_choc_septique <- ifelse(df$primary_disease_category == "Choc septique", "Yes", "No")
df$primary_binaire_choc_sur_cancer <- ifelse(df$primary_disease_category == "Choc sur cancer", "Yes", "No")
df$primary_binaire_insuffisance_renale_aigue <- ifelse(df$primary_disease_category == "Insuffisance rénale aiguë", "Yes", "No")
df$primary_binaire_insuffisance_cardiaque <- ifelse(df$primary_disease_category == "Insuffisance cardiaque", "Yes", "No")
df$primary_binaire_coma <- ifelse(df$primary_disease_category == "Coma", "Yes", "No")
df$primary_binaire_cirrhose <- ifelse(df$primary_disease_category == "Cirrhose", "Yes", "No")
df$primary_binaire_cancer_du_poumon <- ifelse(df$primary_disease_category == "Cancer du poumon", "Yes", "No")
df$primary_binaire_cancer_du_colon <- ifelse(df$primary_disease_category == "Cancer du côlon", "Yes", "No")
#recodage de la variable secondary_disease_category en binaire (présence ou absence de chaque catégorie de maladie)
df$secondary_binaire_choc_septique <- ifelse(df$secondary_disease_category == "Choc septique", "Yes", "No")
df$secondary_binaire_choc_sur_cancer <- ifelse(df$secondary_disease_category == "Choc sur cancer", "Yes", "No")
df$secondary_binaire_coma <- ifelse(df$secondary_disease_category == "Coma", "Yes", "No")
df$secondary_binaire_cirrhose <- ifelse(df$secondary_disease_category == "Cirrhose", "Yes", "No")
df$secondary_binaire_cancer_du_poumon <- ifelse(df$secondary_disease_category == "Cancer du poumon", "Yes", "No")
df$secondary_binaire_cancer_du_colon <- ifelse(df$secondary_disease_category == "Cancer du côlon", "Yes", "No")
df$secondary_binaire_pas_de_comorbidite <- ifelse(df$secondary_disease_category == "Pas de comorbidité", "Yes", "No")
str(df)

#vérification du format des datese 
is.Date(df$date_death)
is.Date(df$date_last_news) 
# Vérification de la cohérence entre date_death et date_last_news pour les patients décédés
incoherent_death_dates <- df$death_180d == "Yes" & df$date_death != df$date_last_news
sum(incoherent_death_dates) # Nombre de cas incohérents

# Correction des dates incohérentes
df$date_last_news[incoherent_death_dates] <- df$date_death[incoherent_death_dates]
# Vérification après correction
incoherent_death_dates_after <- df$death_180d == "Yes" & df$date_death != df$date_last_news
sum(incoherent_death_dates_after) # Nombre de cas incohérents après correction (devrait être 0)

# vérification du format des dates
is.Date(df$date_discharge)
is.Date(df$date_last_news)
# Vérification de la cohérence entre date_discharge et date_last_news
incoherent_discharge_dates <- df$date_discharge > df$date_last_news
sum(incoherent_discharge_dates) # Nombre de cas incohérents

# Vérification du patient avec date de sortie d'hospitalisation inconnue
patient_missing_discharge <- is.na(df$date_discharge)
sum(patient_missing_discharge) # Nombre de patients avec date de sortie d'hospitalisation inconnue
# Vérification du statut de décès de ce patient
if (df$death_180d[patient_missing_discharge] == "Yes") {
    df$date_death[patient_missing_discharge]
} else {
    cat("Le patient n'est pas décédé)")
}
# Calcul de la différence entre la date de décès et la date d'admission pour ce patient
days_missing_discharge <- as.numeric(df$date_death[patient_missing_discharge] - df$date_admission[patient_missing_discharge])
days_missing_discharge


n_rows <- nrow(df)
n_cols <- ncol(df)

tab <- data.frame(
    Nom = "df",
    `Nombre d'observations` = n_rows,
    `Nombre de variables` = n_cols,
    check.names = FALSE
)

knitr::kable(tab, booktabs = TRUE)

col_type <- sapply(df, function(x) class(x)[1])
col_type[col_type %in% c("Date", "POSIXct", "POSIXlt")] <- "Date"
col_type[col_type %in% c("factor", "ordered")] <- "factor"
col_type[col_type %in% c("numeric", "integer")] <- "numeric"

type_freq <- sort(table(col_type), decreasing = TRUE)
type_freq_str <- paste(names(type_freq), as.integer(type_freq), sep = " : ", collapse = ", ")

tab <- data.frame(
    Type = names(type_freq),
    `Nombre` = as.integer(type_freq),
    check.names = FALSE
)
knitr::kable(tab, booktabs = TRUE)

cat_cols <- names(col_type)[col_type == "factor"]
cat_cols <- intersect(cat_cols, names(df))
cat_vars_df <- data.frame(
    Variable = cat_cols,
    check.names = FALSE,
    Description = desc[cat_cols],
    row.names = NULL
)
knitr::kable(cat_vars_df, booktabs = TRUE)

# Séparation des variables catégorielles en sous-catégories thématiques
cat_cols_disease_category <- grep("disease_category", cat_cols, value = TRUE)
cat_cols_cancer <- grep("cancer", cat_cols, value = TRUE)
cat_cols_comorbidity <- grep("comorbidity", cat_cols, value = TRUE)
cat_cols_diagnosis <- grep("diagnosis", cat_cols, value = TRUE)
cat_cols_death <- grep("death", cat_cols, value = TRUE)
cat_cols_demographic <- c("sex", "dnr_status", "insurance_class", "race", "income")
cat_cols_RHC <- grep("rhc", cat_cols, value = TRUE)


# Création de deux barplots côte à côte pour les variables de catégorie de maladie principale et de comorbidité principale
df_descriptif <- df

# Calcul des effectifs pour les catégories de maladie principale et de comorbidité principale
counts_primary <- sort(table(df_descriptif$primary_disease_category), decreasing = FALSE)
counts_secondary <- sort(table(df_descriptif$secondary_disease_category), decreasing = FALSE)

# Disposition côte à côte des barplots
op <- par(no.readonly = TRUE)
on.exit(par(op), add = TRUE)
par(mfrow = c(1, 2))
par(mai = c(0.9, 1.75, 0.9, 0.25))  # marge gauche fixe (à ajuster)

# Création des barplots 
barplot(
    counts_primary,
    names.arg = names(counts_primary),
    main = "Diagnostic principal",
    xlab = "Nombre de patients",
    horiz = TRUE,
    col = nord::nord("frost", length(counts_primary)),
    las = 2,
    cex.names = 0.75,
    cex.axis = 0.8,
    cex.lab = 0.9,
    cex.main = 0.9
)

barplot(
    counts_secondary,
    names.arg = names(counts_secondary),
    main = "Comorbidité principale",
    xlab = "Nombre de patients",
    horiz = TRUE,
    col = nord::nord("aurora", length(counts_secondary)),
    las = 2,
    cex.names = 0.75,
    cex.axis = 0.8,
    cex.lab = 0.9,
    cex.main = 0.9
)

# Bar plot pour chacun des diagnostics
par(op, no.readonly = TRUE) # réinitialiser les paramètres graphiques
par(mfrow = c(2, 5))
barplot(
    table(df$diagnosis_respiratory, useNA = "ifany"),
    main = "Respiratoire",
    col = nord::nord("frost", length(table(df$diagnosis_respiratory, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$diagnosis_cardiovascular, useNA = "ifany"),
    main = "Cardiovasculaire",
    col = nord::nord("frost", length(table(df$diagnosis_cardiovascular, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$diagnosis_neurological, useNA = "ifany"),
    main = "Neurologique",
    col = nord::nord("frost", length(table(df$diagnosis_neurological, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$diagnosis_gastrointestinal, useNA = "ifany"),
    main = "Gastro-intestinal",
    col = nord::nord("frost", length(table(df$diagnosis_gastrointestinal, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$diagnosis_renal, useNA = "ifany"),
    main = "Rénal",
    col = nord::nord("frost", length(table(df$diagnosis_renal, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$diagnosis_metabolic, useNA = "ifany"),
    main = "Métabolique",
    col = nord::nord("frost", length(table(df$diagnosis_metabolic, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$diagnosis_hematologic, useNA = "ifany"),
    main = "Hématologique",
    col = nord::nord("frost", length(table(df$diagnosis_hematologic, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$diagnosis_sepsis, useNA = "ifany"),
    main = "Sepsis",
    col = nord::nord("frost", length(table(df$diagnosis_sepsis, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$diagnosis_trauma, useNA = "ifany"),
    main = "Trauma",
    col = nord::nord("frost", length(table(df$diagnosis_trauma, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$diagnosis_orthopedic, useNA = "ifany"),
    main = "Orthopédique",
    col = nord::nord("frost", length(table(df$diagnosis_orthopedic, useNA = "ifany"))),
    border = NA
    )

# Bar plot pour chacune des comorbidités
par(op, no.readonly = TRUE) # réinitialiser les paramètres graphiques
par(mfrow = c(3, 4))
barplot(
    table(df$comorbidity_cardiovascular, useNA = "ifany"),
    main = "Cardiovasculaire",
    col = nord::nord("aurora", length(table(df$comorbidity_cardiovascular, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$comorbidity_congestive_heart, useNA = "ifany"),
    main = "Insuffisance cardiaque",
    col = nord::nord("aurora", length(table(df$comorbidity_congestive_heart, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$comorbidity_dementia, useNA = "ifany"),
    main = "Démence",
    col = nord::nord("aurora", length(table(df$comorbidity_dementia, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$comorbidity_psych, useNA = "ifany"),
    main = "Psychiatrique",
    col = nord::nord("aurora", length(table(df$comorbidity_psych, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$comorbidity_chronic_pulmonary, useNA = "ifany"),
    main = "Respiratoire chronique",
    col = nord::nord("aurora", length(table(df$comorbidity_chronic_pulmonary, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$comorbidity_renal, useNA = "ifany"),
    main = "Rénal",
    col = nord::nord("aurora", length(table(df$comorbidity_renal, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$comorbidity_liver, useNA = "ifany"),
    main = "Hépatique",
    col = nord::nord("aurora", length(table(df$comorbidity_liver, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$comorbidity_upper_gi_bleeding, useNA = "ifany"),
    main = "Hémorragie digestive haute",
    col = nord::nord("aurora", length(table(df$comorbidity_upper_gi_bleeding, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$comorbidity_malignancy, useNA = "ifany"),
    main = "Cancer",
    col = nord::nord("aurora", length(table(df$comorbidity_malignancy, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$comorbidity_immunosuppression, useNA = "ifany"),
    main = "Immunodépression",
    col = nord::nord("aurora", length(table(df$comorbidity_immunosuppression, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$comorbidity_transfer, useNA = "ifany"),
    main = "Transfert (> 24h)",
    col = nord::nord("aurora", length(table(df$comorbidity_transfer, useNA = "ifany"))),
    border = NA
    )
barplot(
    table(df$comorbidity_myocardial_infarction, useNA = "ifany"),
    main = "Infarctus du myocarde",
    col = nord::nord("aurora", length(table(df$comorbidity_myocardial_infarction, useNA = "ifany"))),
    border = NA
    )


cat_cols_comorbidity <- grep("comorbidity", cat_cols, value = TRUE)
cat_cols_diagnosis   <- grep("diagnosis",   cat_cols, value = TRUE)

# création des matrices dans CE chunk
comorbidity_matrix <- as.matrix(df[cat_cols_comorbidity]) == "Yes"
diagnosis_matrix   <- as.matrix(df[cat_cols_diagnosis])   == "Yes"

n <- nrow(df)
bg_grey <- "grey92"

op <- par(no.readonly = TRUE)
on.exit(par(op), add = TRUE)
par(mfrow = c(1, 2))
par(mai = c(0.9, 2.4, 0.9, 0.25))  # un peu plus de marge pour des libellés longs

yes_c <- sort(colSums(comorbidity_matrix, na.rm = TRUE), decreasing = FALSE)

lab_c <- unname(desc[names(yes_c)])
lab_c <- gsub("^Antécédent\\s*:?\\s*", "", lab_c)

barplot(
  rep(n, length(yes_c)),
  names.arg = lab_c,
  main = "Comorbidités",
  xlab = "Nombre de patients",
  horiz = TRUE,
  col = bg_grey,
  border = NA,
  las = 2,
  cex.names = 0.75,
  cex.axis = 0.8,
  cex.lab  = 0.9,
  cex.main = 0.9,
  xlim = c(0, n)
)

barplot(
  yes_c,
  horiz = TRUE,
  col = nord::nord("frost", length(yes_c)),
  border = NA,
  add = TRUE,
  axes = FALSE,
  names.arg = rep("", length(yes_c))
)

# ---- Diagnostics ----
yes_d <- sort(colSums(diagnosis_matrix, na.rm = TRUE), decreasing = FALSE)

lab_d <- unname(desc[names(yes_d)])
lab_d <- gsub("^Diagnostic\\s*:\\s*", "", lab_d)

barplot(
  rep(n, length(yes_d)),
  names.arg = lab_d,
  main = "Diagnostics",
  xlab = "Nombre de patients",
  horiz = TRUE,
  col = bg_grey,
  border = NA,
  las = 2,
  cex.names = 0.75,
  cex.axis = 0.8,
  cex.lab  = 0.9,
  cex.main = 0.9,
  xlim = c(0, n)
)

barplot(
  yes_d,
  horiz = TRUE,
  col = nord::nord("aurora", length(yes_d)),
  border = NA,
  add = TRUE,
  axes = FALSE,
  names.arg = rep("", length(yes_d))
)

op <- par(no.readonly = TRUE)
on.exit(par(op), add = TRUE)
par(mfrow = c(2, 3))

barplot(
    table(df$sex, useNA = "ifany"),
    main = "Sexe",
    col = nord::nord("frost", length(table(df$sex, useNA = "ifany"))),
    border = NA,
    las = 1,
    cex.names = 0.8
    )
barplot(
    table(df$dnr_status, useNA = "ifany"),
    main = "Non-réanimatoire",
    col = nord::nord("frost", length(table(df$dnr_status, useNA = "ifany"))),
    border = NA,
    las = 1,
    cex.names = 0.8
    )
barplot(
    table(df$race, useNA = "ifany"),
    main = "Origine / race",
    col = nord::nord("frost", length(table(df$race, useNA = "ifany"))),
    border = NA,
    las = 1,
    cex.names = 0.6
    )

par(mar = c(4, 12, 3, 1) + 0.1)
barplot(
    table(df$insurance_class, useNA = "ifany"),
    main = "Assurance",
    col = nord::nord("frost", length(table(df$insurance_class, useNA = "ifany"))),
    border = NA,
    horiz = TRUE,
    las = 1,
    cex.names = 0.8
    )

barplot(
    table(df$income, useNA = "ifany"),
    main = "Revenu",
    col = nord::nord("frost", length(table(df$income, useNA = "ifany"))),
    border = NA,
    horiz = TRUE,
    las = 1,
    cex.names = 0.8
    )

# avec pourcentage et effectifs
cancer_yes_count <- sum(df$cancer_YN == "Yes", na.rm = TRUE)
cancer_yes_percentage <- round(mean(df$cancer_YN == "Yes", na.rm = TRUE) * 100, 1)
cancer_localized_count <- sum(df$cancer == "Localisé", na.rm = TRUE)
cancer_metastatic_count <- sum(df$cancer == "Metastatic", na.rm = TRUE)
cancer_localized_percentage <- round(cancer_localized_count / sum(df$cancer_YN == "Yes", na.rm = TRUE) * 100, 1)
cancer_metastatic_percentage <- round(cancer_metastatic_count / sum(df$cancer_YN == "Yes", na.rm = TRUE) * 100, 1
)
cancer_summary_df <- data.frame(
    `Variable` = c("Cancer (Yes/No)", "Cancer localisé", "Cancer métastatique"),
    `Pourcentage` = c(paste0(cancer_yes_percentage, "%"), paste0(cancer_localized_percentage, "%"), paste0(cancer_metastatic_percentage, "%")),
    `Effectifs` = c(paste0(cancer_yes_count, "/", nrow(df)), paste0(cancer_localized_count, "/", sum(df$cancer_YN == "Yes", na.rm = TRUE)), paste0(cancer_metastatic_count, "/", sum(df$cancer_YN == "Yes", na.rm = TRUE))),
    check.names = FALSE
)
knitr::kable(cancer_summary_df, booktabs = TRUE)

barplot(
    table(df$cancer, useNA = "ifany"),
    col = nord::nord("lumina", length(table(df$cancer, useNA = "ifany"))),
    border = NA,
    las = 1,
    cex.names = 0.8
    )

par(op, no.readonly = TRUE) # réinitialiser les paramètres graphiques
par(mfrow = c(1, 2))
barplot(
    table(df$death_30d, useNA = "ifany"),
    main = "Décès à 30 jours",
    col = nord::nord("baie_mouton", length(table(df$death_30d, useNA = "ifany"))),
    border = NA,
    las = 1,
    cex.names = 0.8
    )
barplot(
    table(df$death_180d, useNA = "ifany"),
    main = "Décès à 180 jours",
    col = nord::nord("baie_mouton", length(table(df$death_180d, useNA = "ifany"))),
    border = NA,
    las = 1,
    cex.names = 0.8
)

death_30d_percentage <- round(mean(df$death_30d == "Yes", na.rm = TRUE) * 100, 1)
death_180d_percentage <- round(mean(df$death_180d == "Yes", na.rm = TRUE) * 100, 1)
# affichage aussi des effectifs dans une colonne (n/N)
death_30d_count <- sum(df$death_30d == "Yes", na.rm = TRUE)
death_30d_total <- sum(!is.na(df$death_30d))
death_180d_count <- sum(df$death_180d == "Yes", na.rm = TRUE)
death_180d_total <- sum(!is.na(df$death_180d))
death_summary_df <- data.frame(
    `Variable` = c("Décès à 30 jours", "Décès à 180 jours"),
    `Pourcentage` = c(paste0(death_30d_percentage, "%"), paste0(death_180d_percentage, "%")),
    `Effectifs` = c(paste0(death_30d_count, "/", death_30d_total), paste0(death_180d_count, "/", death_180d_total)),
    check.names = FALSE
)
knitr::kable(death_summary_df, booktabs = TRUE)

barplot(
    table(df$rhc, useNA = "ifany"),
    col = nord::nord("lumina", length(table(df$rhc, useNA = "ifany"))),
    border = NA,
    las = 1,
    cex.names = 0.8
    )

rhc_percentage <- round(mean(df$rhc == "RHC", na.rm = TRUE) * 100, 1)
rhc_count <- sum(df$rhc == "RHC", na.rm = TRUE)
rhc_total <- sum(!is.na(df$rhc))
rhc_summary_df <- data.frame(
    `Variable` = "Cathéterisme cardiaque droit (RHC)",
    `Pourcentage` = paste0(rhc_percentage, "%"),
    `Effectifs` = paste0(rhc_count, "/", rhc_total),
    check.names = FALSE
)
knitr::kable(rhc_summary_df, booktabs = TRUE)

# tableau avec moyenne, SD, médiane, Q1, Q3, min et max pour chacune des variables numériques
numeric_cols <- names(col_type)[col_type == "numeric"]
numeric_cols <- setdiff(numeric_cols, "time_to_death_if_death_within_30d")

#création du tableau récapitulatif des variables numériques
numeric_summary_df <- data.frame(
    Variables = desc[numeric_cols],
    Moyenne = sapply(df[numeric_cols], function(x) round(mean(x, na.rm = TRUE), 2)),
    SD = sapply(df[numeric_cols], function(x) round(sd(x, na.rm = TRUE), 2)),
    Médiane = sapply(df[numeric_cols], function(x) round(median(x, na.rm = TRUE), 2)),
    Q1 = sapply(df[numeric_cols], function(x) round(quantile(x, 0.25, na.rm = TRUE), 2)),
    Q3 = sapply(df[numeric_cols], function(x) round(quantile(x, 0.75, na.rm = TRUE), 2)),
    Min = sapply(df[numeric_cols], function(x) round(min(x, na.rm = TRUE), 2)),
    Max = sapply(df[numeric_cols], function(x) round(max(x, na.rm = TRUE), 2)),
    check.names = FALSE
)

#affichage du tableau
knitr::kable(
    numeric_summary_df,
    booktabs = FALSE,
    row.names = FALSE
) %>%
  kableExtra::column_spec(1, width = "6cm")

# quel pourcentage les valeurs 0 représentent-elles pour chacune de ces variables ?
outlier_summary_df <- data.frame(
    Variable = c("Pression artérielle moyenne", "Leucocytose", "Fréquence cardiaque", "Fréquence respiratoire", "Poids"),
    `Valeur aberrante` = c(sum(df$mean_blood_pressure == 0, na.rm = TRUE), sum(df$wbc == 0, na.rm = TRUE), sum(df$heart_rate == 0, na.rm = TRUE), sum(df$respiratory_rate == 0, na.rm = TRUE), sum(df$weight == 0, na.rm = TRUE)),
    `Pourcentage de valeurs 0` = c(round(mean(df$mean_blood_pressure == 0, na.rm = TRUE) * 100, 2), round(mean(df$wbc == 0, na.rm = TRUE) * 100, 2), round(mean(df$heart_rate == 0, na.rm = TRUE) * 100, 2), round(mean(df$respiratory_rate == 0, na.rm = TRUE) * 100, 2), round(mean(df$weight == 0, na.rm = TRUE) * 100, 2))
)

#affichage du tableau 
knitr::kable(outlier_summary_df, booktabs = TRUE)

# imputation des valeurs 0 par la médiane de chaque variable
df$mean_blood_pressure[df$mean_blood_pressure == 0] <- median(df$mean_blood_pressure[df$mean_blood_pressure > 0], na.rm = TRUE)
df$wbc[df$wbc == 0] <- median(df$wbc[df$wbc > 0], na.rm = TRUE)
df$heart_rate[df$heart_rate == 0] <- median(df$heart_rate[df$heart_rate > 0], na.rm = TRUE)
df$respiratory_rate[df$respiratory_rate == 0] <- median(df$respiratory_rate[df$respiratory_rate > 0], na.rm = TRUE)
df$weight[df$weight == 0] <- median(df$weight[df$weight > 0], na.rm = TRUE)

# tableau avec moyenne, SD, médiane, Q1, Q3, min et max pour chacune des variables numériques après imputation
numeric_cols_imputed <- c(
  "mean_blood_pressure",
  "wbc",
  "heart_rate",
  "respiratory_rate",
  "weight"
)

numeric_summary_imputed_df <- data.frame(
  Variables = numeric_cols_imputed,
  Moyenne = sapply(df[numeric_cols_imputed], function(x) round(mean(x, na.rm = TRUE), 2)),
  SD = sapply(df[numeric_cols_imputed], function(x) round(sd(x, na.rm = TRUE), 2)),
  Médiane = sapply(df[numeric_cols_imputed], function(x) round(median(x, na.rm = TRUE), 2)),
  Q1 = sapply(df[numeric_cols_imputed], function(x) round(quantile(x, 0.25, na.rm = TRUE), 2)),
  Q3 = sapply(df[numeric_cols_imputed], function(x) round(quantile(x, 0.75, na.rm = TRUE), 2)),
  Min = sapply(df[numeric_cols_imputed], function(x) round(min(x, na.rm = TRUE), 2)),
  Max = sapply(df[numeric_cols_imputed], function(x) round(max(x, na.rm = TRUE), 2)),
  check.names = FALSE
)

knitr::kable(
  numeric_summary_imputed_df,
  booktabs = FALSE,
  row.names = FALSE
) %>%
  kableExtra::column_spec(1, width = "6cm")


knitr::kable(
    numeric_summary_imputed_df,
    booktabs = FALSE,
    row.names = FALSE
) %>%
  kableExtra::column_spec(1, width = "6cm")

numeric_cols <- names(col_type)[col_type == "numeric"]

op <- par(no.readonly = TRUE)
on.exit(par(op), add = TRUE)

cols <- viridisLite::viridis(n = max(length(numeric_cols), 1), begin = 0.1, end = 0.95)

par(mfrow = c(4, 6), mar = c(4, 4, 2, 1))

hist(
  df$age, 
  breaks = 20, 
  main = "Âge", 
  xlab = "Âge", 
  ylab = "Fréquence",
  col = cols[1], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$age, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$education_years, 
  breaks = 20, 
  main = "Années d'éducation", 
  xlab = "Années d'éducation", 
  ylab = "Fréquence",
  col = cols[2], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$education_years, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$survival_probability_2mths, 
  breaks = 20, 
  main = "Probabilité de survie", 
  xlab = "Probabilité de survie", 
  ylab = "Fréquence",
  col = cols[3], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$survival_probability_2mths, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$DASI_score, 
  breaks = 20, 
  main = "Score DASI", 
  xlab = "Score DASI", 
  ylab = "Fréquence",
  col = cols[4], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$DASI_score, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$apache_score, 
  breaks = 20, 
  main = "Score APACHE", 
  xlab = "Score APACHE", 
  ylab = "Fréquence",
  col = cols[6], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$apache_score, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$glasgow_score, 
  breaks = 20, 
  main = "score de Glasgow", 
  xlab = "score de Glasgow", 
  ylab = "Fréquence",
  col = cols[7], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$glasgow_score, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$mean_blood_pressure, 
  breaks = 20, 
  main = "PA moyenne", 
  xlab = "PA moyenne (mmHg)", 
  ylab = "Fréquence",
  col = cols[8], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$mean_blood_pressure, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$wbc, 
  breaks = 20, 
  main = "Leucocytose ", 
  xlab = "Leucocytose (10^3/µL)", 
  ylab = "Fréquence",
  col = cols[9], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$wbc, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$heart_rate, 
  breaks = 20, 
  main = "Pouls", 
  xlab = "Pouls (bpm)", 
  ylab = "Fréquence",
  col = cols[10], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$heart_rate, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$respiratory_rate, 
  breaks = 20, 
  main = "Fréquence respiratoire", 
  xlab = "FR (resp/min)", 
  ylab = "Fréquence",
  col = cols[11], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$respiratory_rate, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$temperature, 
  breaks = 20, 
  main = "Température", 
  xlab = "T (°C)", 
  ylab = "Fréquence",
  col = cols[12], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$temperature, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$pa_fi_ratio, 
  breaks = 20, 
  main = "PaO2/FiO2", 
  xlab = "PaO2/FiO2", 
  ylab = "Fréquence",
  col = cols[13], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$pa_fi_ratio, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$albumin, 
  breaks = 20, 
  main = "Albuminémie", 
  xlab = "Albuminémie (g/dL)", 
  ylab = "Fréquence",
  col = cols[14], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$albumin, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$hematocrit, 
  breaks = 20, 
  main = "Hématocrite", 
  xlab = "Hématocrite (%)", 
  ylab = "Fréquence",
  col = cols[15], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$hematocrit, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$bilirubin, 
  breaks = 20, 
  main = "Bilirubinémie", 
  xlab = "Bilirubine (µmol/L)", 
  ylab = "Fréquence",
  col = cols[16], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$bilirubin, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$creatinine, 
  breaks = 20, 
  main = "Créatininémie", 
  xlab = "Créatinine (µmol/L)", 
  ylab = "Fréquence",
  col = cols[17], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$creatinine, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$sodium, 
  breaks = 20, 
  main = "Natrémie", 
  xlab = "Natrémie (mmol/L)", 
  ylab = "Fréquence",
  col = cols[18], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$sodium, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$potassium, 
  breaks = 20, 
  main = "Kalémie", 
  xlab = "Kalémie (mmol/L)", 
  ylab = "Fréquence",
  col = cols[19], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$potassium, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$paco2, 
  breaks = 20, 
  main = "PaCO2", 
  xlab = "PaCO2 (mmHg)", 
  ylab = "Fréquence",
  col = cols[20], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$paco2, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$ph, 
  breaks = 20, 
  main = "pH", 
  xlab = "pH", 
  ylab = "Fréquence",
  col = cols[21], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$ph, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$weight, 
  breaks = 20, 
  main = "Poids", 
  xlab = "Poids (kg)", 
  ylab = "Fréquence",
  col = cols[22], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$weight, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$adl_score, 
  breaks = 20, 
  main = "Score ADL", 
  xlab = "Score ADL", 
  ylab = "Fréquence",
  col = cols[23], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$adl_score, na.rm = TRUE), col = "blue", lwd = 2)
hist(
  df$urine_output, 
  breaks = 20, 
  main = "Diurèse", 
  xlab = "Diurèse (mL)", 
  ylab = "Fréquence",
  col = cols[24], 
  border = TRUE, 
  freq = FALSE
)
lines(density(df$urine_output, na.rm = TRUE), col = "blue", lwd = 2)

qqnorm(
    df$age, 
    main = "QQ-plot pour l'âge"
)
qqline(df$age, col = "red", lwd = 2)

# avec pourcentage de décès à 30 jours et à 180 jours dans les groupes R
# utilisation de tbl_summary de gtsummary pour faire un tableau comparatif des décès à 30 jours et à 180 jours entre les groupes RHC vs non-RHC
summary_table <- df %>%
  select(rhc, death_30d, death_180d) %>%
  tbl_summary(
    by = rhc,
    statistic = list(
      death_30d ~ "{n} ({p}%)",
      death_180d ~ "{n} ({p}%)"
    ),
    label = list(
      death_30d ~ "Décès à 30 jours",
      death_180d ~ "Décès à 180 jours"
    ),
    missing = "no"
  ) %>%
  add_p() %>%
  modify_header(label = "**Variable**")
summary_table

# calcul de l'OR pour le décès à 30 jours
or_30d <- epitools::oddsratio(
  x = table(df$rhc, df$death_30d),
  method = "wald",
  conf.level = 0.95
)
# calcul de l'OR pour le décès à 180 jours
or_180d <- epitools::oddsratio(
  x = table(df$rhc, df$death_180d),
  method = "wald",
  conf.level = 0.95
)
# création d'un tableau récapitulatif des OR
or_summary_df <- data.frame(
  `Critère` = c("Décès à 30 jours", "Décès à 180 jours"),
  `OR` = c(round(or_30d$measure[2, "estimate"], 2), round(or_180d$measure[2, "estimate"], 2)),
  `IC 95%` = c(
    paste0("(", round(or_30d$measure[2, "lower"], 2), ", ", round(or_30d$measure[2, "upper"], 2), ")"),
    paste0("(", round(or_180d$measure[2, "lower"], 2), ", ", round(or_180d$measure[2, "upper"], 2), ")")
  ),
  check.names = FALSE
)
knitr::kable(or_summary_df, booktabs = TRUE)

# Recalcul des temps à partir des dates (suivi "complet")
df$time_to_death <- as.numeric(df$date_death - df$date_admission)
df$time_to_last_news <- as.numeric(df$date_last_news - df$date_admission)

# Événement "décès" selon la présence d'une date de décès
df$event_death <- as.integer(!is.na(df$date_death))

# Temps de suivi complet (décès -> date_death, sinon -> date_last_news)
df$followup_time <- df$time_to_last_news

# Si décès, temps de suivi = temps jusqu'au décès
df$followup_time[df$event_death == 1] <- df$time_to_death[df$event_death == 1]

# Temps d'inclusion : prend le minimum entre le temps de suivi et 180 jours (donc censure après 180 jours)
df$survival_time_180d <- pmin(df$followup_time, 180)

# Événement "décès" à 180 jours : vaut 1 si décès ET temps jusqu'au décès <= 180 jours
df$event_180d <- as.integer(df$event_death == 1 & df$time_to_death <= 180)

# Temps négatifs -> NA
df$survival_time_180d[df$survival_time_180d < 0] <- NA

# création de l'objet de survie
surv_object <- Surv(time = df$survival_time_180d, event = df$event_180d)
# ajustement du modèle de survie de Kaplan-Meier
km_fit <- survfit(surv_object ~ rhc, data = df)
# affichage du graphique de survie
km_plot <- ggsurvplot(
  km_fit,
  data = df,
  pval = TRUE,
  conf.int = TRUE,
  risk.table = TRUE,
  risk.table.height = 0.2,
  risk.table.fontsize = 3.2,
  break.time.by = 30,
  xlim = c(0, 180),
  legend.labs = c("Non-RHC", "RHC"),
  legend.title = "Groupe",
  xlab = "Temps (jours)",
  ylab = "Probabilité de survie",
  title = "Courbe de survie de Kaplan-Meier selon le RHC",
  palette = c(nord::nord("aurora")[1], nord::nord("aurora")[4])
)
print(km_plot)

# utilisation de tbl_summary de gtsummary pour faire un tableau comparatif des caractéristiques basales entre les groupes RHC vs non-RHC
# regroupement des variables
primary_columns <- grep("^(primary_binaire_|secondary_binaire_)", names(df), value = TRUE)
vars_demo <- c("age", "sex", "race", "education_years", "income", "insurance_class")
vars_scores <- c("adl_score", "DASI_score", "glasgow_score", "apache_score", "dnr_status")
vars_comorb <- c(
  "comorbidity_cardiovascular",
  "comorbidity_congestive_heart",
  "comorbidity_myocardial_infarction",
  "comorbidity_chronic_pulmonary",
  "comorbidity_renal",
  "comorbidity_liver",
  "comorbidity_upper_gi_bleeding",
  "comorbidity_dementia",
  "comorbidity_psych",
  "comorbidity_malignancy",
  "comorbidity_immunosuppression",
  "comorbidity_transfer"
)
vars_diag_other <- c(
  "diagnosis_respiratory",
  "diagnosis_cardiovascular",
  "diagnosis_neurological",
  "diagnosis_gastrointestinal",
  "diagnosis_renal",
  "diagnosis_metabolic",
  "diagnosis_hematologic",
  "diagnosis_sepsis",
  "diagnosis_trauma",
  "diagnosis_orthopedic"
)
vars_cancer <- c("cancer_YN", "cancer")
vars_clinical <- c(
  "weight", "mean_blood_pressure", "heart_rate",
  "respiratory_rate", "temperature", "pa_fi_ratio",
  "urine_output"
)
vars_bio <- c(
  "wbc", "albumin", "hematocrit", "bilirubin",
  "creatinine", "sodium", "potassium", "paco2", "ph"
)

# colonnes à inclure
cols_to_include_baseline <- c(
  vars_demo,
  vars_scores,
  vars_comorb,
  primary_columns,
  vars_diag_other,
  vars_cancer,
  vars_clinical,
  vars_bio
)

df_baseline_tbl <- df[, unique(c("rhc", cols_to_include_baseline))]

# répartition des variables en sous groupes pour la mise en forme du tableau
primary_binaire_columns   <- grep("^primary_binaire_", primary_columns, value = TRUE)
secondary_binaire_columns <- grep("^secondary_binaire_", primary_columns, value = TRUE)

var_to_section <- c(
  stats::setNames(rep("Démographie / socio-économique", length(vars_demo)), vars_demo),
  stats::setNames(rep("Statut fonctionnel / scores", length(vars_scores)), vars_scores),
  stats::setNames(rep("Comorbidités", length(vars_comorb)), vars_comorb),
  stats::setNames(rep("Diagnostic principal (CAT1)", length(primary_binaire_columns)), primary_binaire_columns),
  stats::setNames(rep("Comorbidité principale (CAT2)", length(secondary_binaire_columns)), secondary_binaire_columns),
  stats::setNames(rep("Diagnostics", length(vars_diag_other)), vars_diag_other),
  stats::setNames(rep("Cancer", length(vars_cancer)), vars_cancer),
  stats::setNames(rep("Paramètres cliniques", length(vars_clinical)), vars_clinical),
  stats::setNames(rep("Biologie", length(vars_bio)), vars_bio)
)

# Tableau avec gtsummary
baseline_comparison_table <- gtsummary::tbl_summary(
  df_baseline_tbl,
  by = "rhc",
  missing = "no",
  statistic = list(
    gtsummary::all_continuous() ~ "{mean} ({sd})",
    gtsummary::all_categorical() ~ "{n} ({p}%)"
  ),
  label = list(
    age ~ "Âge",
    sex ~ "Sexe",
    race ~ "Ethnie",
    education_years ~ "Années d'éducation",
    income ~ "Revenu",
    insurance_class ~ "Classe d'assurance",
    adl_score ~ "Score ADL",
    DASI_score ~ "Score DASI",
    glasgow_score ~ "Score Coma",
    apache_score ~ "Score APACHE",
    dnr_status ~ "Statut DNR",
    primary_binaire_BPCO ~ "BPCO",
    primary_binaire_choc_septique ~ "Choc septique",
    primary_binaire_choc_sur_cancer ~ "Choc sur cancer",
    primary_binaire_insuffisance_renale_aigue ~ "Insuffisance rénale aiguë",
    primary_binaire_insuffisance_cardiaque ~ "Insuffisance cardiaque",
    primary_binaire_coma ~ "Coma",
    primary_binaire_cirrhose ~ "Cirrhose",
    primary_binaire_cancer_du_poumon ~ "Cancer du poumon",
    primary_binaire_cancer_du_colon ~ "Cancer du colon",
    secondary_binaire_choc_septique ~ "Choc septique",
    secondary_binaire_choc_sur_cancer ~ "Choc sur cancer",
    secondary_binaire_coma ~ "Coma",
    secondary_binaire_cirrhose ~ "Cirrhose",
    secondary_binaire_cancer_du_poumon ~ "Cancer du poumon",
    secondary_binaire_cancer_du_colon ~ "Cancer du colon",
    comorbidity_cardiovascular ~ "Cardiopathie",
    comorbidity_congestive_heart ~ "Insuffisance cardiaque congestive",
    comorbidity_myocardial_infarction ~ "Infarctus du myocarde",
    comorbidity_chronic_pulmonary ~ "Maladie pulmonaire chronique",
    comorbidity_renal ~ "Insuffisance rénale",
    comorbidity_liver ~ "Insuffisance hépatique",
    comorbidity_upper_gi_bleeding ~ "Saignement GI supérieur",
    comorbidity_dementia ~ "Démence",
    comorbidity_psych ~ "Psychologique",
    comorbidity_malignancy ~ "Malignité",
    comorbidity_immunosuppression ~ "Immunosuppression",
    comorbidity_transfer ~ "Transfert",
    diagnosis_respiratory ~ "Diagnostic respiratoire",
    diagnosis_cardiovascular ~ "Diagnostic cardiovasculaire",
    diagnosis_neurological ~ "Diagnostic neurologique",
    diagnosis_gastrointestinal ~ "Diagnostic gastro-intestinal",
    diagnosis_renal ~ "Diagnostic rénal",
    diagnosis_metabolic ~ "Diagnostic métabolique",
    diagnosis_hematologic ~ "Diagnostic hématologique",
    diagnosis_sepsis ~ "Diagnostic sepsis",
    diagnosis_trauma ~ "Diagnostic traumatique",
    diagnosis_orthopedic ~ "Diagnostic orthopédique",
    cancer_YN ~ "Cancer (Oui/Non)",
    cancer ~ "Type de cancer",
    weight ~ "Poids",
    mean_blood_pressure ~ "Pression artérielle moyenne",
    heart_rate ~ "Fréquence cardiaque",
    respiratory_rate ~ "Fréquence respiratoire",
    temperature ~ "Température",
    pa_fi_ratio ~ "Ratio Pa/FI",
    urine_output ~ "Diurèse",
    wbc ~ "Globules blancs",
    albumin ~ "Albumine",
    hematocrit ~ "Hématocrite",
    bilirubin ~ "Bilirubine",
    creatinine ~ "Créatinine",
    sodium ~ "Sodium",
    potassium ~ "Potassium",
    paco2 ~ "PaCO2",
    ph ~ "pH"
  ),
  type = list(adl_score ~ "continuous")
)

#mise en forme du tableau pour rendu quarto vers pdf
baseline_comparison_table <- baseline_comparison_table |>
  gtsummary::add_p(test = list(gtsummary::all_continuous() ~ "t.test")) |>
  gtsummary::modify_header(label = "**Variable**")
tb <- baseline_comparison_table$table_body
tb$.pos <- seq_len(nrow(tb))
section <- unname(var_to_section[tb$variable])
mask <- tb$row_type == "label" & !is.na(section)
first_pos <- tapply(tb$.pos[mask], section[mask], min)
first_pos <- first_pos[order(first_pos)]
sections <- names(first_pos)
pos_cat <- as.numeric(first_pos) - 0.5
template <- tb[1, , drop = FALSE]
template[,] <- NA
stat_cols <- grep("^stat_", names(tb), value = TRUE)
cat_rows <- template[rep(1, length(sections)), , drop = FALSE]
cat_rows$.pos <- pos_cat
cat_rows$row_type <- "category"
cat_rows$label <- sections
cat_rows$variable <- paste0("cat__", make.names(sections))
cat_rows[, stat_cols] <- ""
cat_rows$p.value <- NA_real_
out <- base::rbind(tb, cat_rows)
out <- out[order(out$.pos), , drop = FALSE]
out$.pos <- NULL
baseline_comparison_table$table_body <- out
baseline_comparison_table <- gtsummary::modify_table_styling(
  baseline_comparison_table, columns = "label", rows = row_type == "category", text_format = "bold"
)
baseline_comparison_table <- gtsummary::modify_table_styling(
  baseline_comparison_table, columns = "label", rows = row_type == "category", text_format = "italic"
)
# affichage du tableau pour quarto vers pdf
baseline_comparison_table |>
  gtsummary::as_kable_extra(booktabs = TRUE, longtable = TRUE) |>
  kableExtra::kable_styling(
    font_size = 8,
    latex_options = c("repeat_header", "scale_down")
  ) |>
  kableExtra::row_spec(
    which(baseline_comparison_table$table_body$row_type == "category"),
    bold = TRUE,
    italic = TRUE
  )

# avec bal.tab et love.plot()
# création d'un objet de balance pour les variables basales
balance_baseline <- bal.tab(
  x = as.formula(paste("rhc ~", paste(cols_to_include_baseline, collapse = " + "))),
  data = df,
  estimand = "ATE"
)

# Retirer les lignes de missingness (":<NA>") sans changer les SMD des vraies covariables
balance_baseline_clean <- balance_baseline
if (!is.null(balance_baseline_clean$Balance)) {
  keep <- !grepl(":<NA>$", rownames(balance_baseline_clean$Balance))
  balance_baseline_clean$Balance <- balance_baseline_clean$Balance[keep, , drop = FALSE]
}

#labels pour lisibilité (on reprend les labels du tableau comparatif)
labels_love_plot <- desc

# création du love plot pour les variables basales
love_plot_baseline <- cobalt::love.plot(
  balance_baseline_clean,
  threshold = 0.1,
  var.order = "unadjusted",
  abs = TRUE,
  drop.missing = TRUE,
  line = TRUE,
  colors = c(nord::nord("aurora")[1], nord::nord("aurora")[4]),
  var.names = labels_love_plot
)
print(love_plot_baseline)

# identification des variables avec SMD > 0.1 en valeur absolue
imbalanced_vars <- rownames(balance_baseline_clean$Balance)[abs(balance_baseline_clean$Balance$Diff.Un) > 0.1]
smd_summary_df <- data.frame(
  `Variable` = imbalanced_vars,
  `SMD` = abs(round(balance_baseline_clean$Balance[imbalanced_vars, "Diff.Un"], 3))
)
knitr::kable(smd_summary_df, booktabs = TRUE)

# imputation par la médiane pour les variables score ADL et diurèse
df_imputed <- df
df_imputed$adl_score[is.na(df_imputed$adl_score)] <- median(df_imputed$adl_score, na.rm = TRUE)
df_imputed$urine_output[is.na(df_imputed$urine_output)] <- median(df_imputed$urine_output, na.rm = TRUE)
#vérification de l'imputation
sum(is.na(df_imputed$adl_score))
sum(is.na(df_imputed$urine_output))
sum(is.na(df_imputed))

# calcul du score de propension avec les variables sélectionnées
df_imputed$rhc <- factor(df_imputed$rhc)

vars_propension <- c(
  "age", "sex", "race", "education_years", "income", "insurance_class",
  "primary_disease_category", "secondary_disease_category",
  grep("^diagnosis_", names(df_imputed), value = TRUE),
  grep("^comorbidity_", names(df_imputed), value = TRUE),
  "adl_score", "DASI_score", "dnr_status", "cancer",
  "survival_probability_2mths", "apache_score", "glasgow_score",
  "weight", "temperature", "mean_blood_pressure", "respiratory_rate", "heart_rate", "pa_fi_ratio", "paco2", "ph", "wbc", "hematocrit", "sodium", "potassium", "creatinine", "bilirubin", "albumin", "urine_output")

formula_propension <- paste("rhc ~", paste(vars_propension, collapse = " + "))

#estimation du score de propension
set.seed(123) # pour la reproductibilité
score_propension <- glm(
  formula = as.formula(formula_propension),
  data = df_imputed,
  family = binomial()
)
# ajout du score de propension dans le dataframe
df_imputed$score_propension <- predict(score_propension, type = "response")

# appariement 1:1 sans remplacement avec un caliper de 0.2*SD du score de propension
library(MatchIt)
matchit_out <- MatchIt::matchit(
  formula = as.formula(formula_propension),
  data = df_imputed,
  method = "nearest",
  caliper = 0.2 * sd(df_imputed$score_propension),
  ratio = 1,
  replace = FALSE
)
# création du dataframe apparié
df_matched <- match.data(matchit_out)
# vérification de la taille des groupes appariés
table(df_matched$rhc)

density_plot <- cobalt::bal.plot(
  matchit_out,
  var.name = "distance",
  which = "both",
  type = "density",
  colors = c(nord::nord("aurora")[1], nord::nord("aurora")[4]),
  xlab = "Score de propension",
  ylab = "Densité",
  title = "Distribution du score de propension avant et après appariement"
)
print(density_plot)

labels_love_plot_matched <- desc
love_plot_matched <- love.plot(
  matchit_out,
  stats = "mean.diffs",
  s.d.denom = "pooled",
  binary = "std",
  threshold = 0.1,
  var.order = "unadjusted",
  abs = TRUE,
  line = TRUE,
  var.names = labels_love_plot_matched,
  colors = c(nord("aurora")[1], nord("aurora")[4])
)
print(love_plot_matched)

balance <- cobalt::bal.tab(matchit_out, un = TRUE)$Balance

tab <- data.frame(
  Avant_appariement = sum(abs(balance$Diff.Un) > 0.1, na.rm = TRUE),
  Apres_appariement = sum(abs(balance$Diff.Adj) > 0.1, na.rm = TRUE)
)

knitr::kable(
  tab,
  format = "latex",
  booktabs = TRUE,
  row.names = FALSE
)

# avec pourcentage de décès à 30 jours et à 180 jours dans les groupes R
# utilisation de tbl_summary de gtsummary pour faire un tableau comparatif des décès à 30 jours et à 180 jours entre les groupes RHC vs non-RHC
summary_table <- df_matched %>%
  select(rhc, death_30d, death_180d) %>%
  tbl_summary(
    by = rhc,
    statistic = list(
      death_30d ~ "{n} ({p}%)",
      death_180d ~ "{n} ({p}%)"
    ),
    label = list(
      death_30d ~ "Décès à 30 jours",
      death_180d ~ "Décès à 180 jours"
    ),
    missing = "no"
  ) %>%
  add_p() %>%
  modify_header(label = "**Variable**")
summary_table

# calcul de l'OR pour le décès à 30 jours
or_30d <- epitools::oddsratio(
  x = table(df_matched$rhc, df_matched$death_30d),
  method = "wald",
  conf.level = 0.95
)
# calcul de l'OR pour le décès à 180 jours
or_180d <- epitools::oddsratio(
  x = table(df_matched$rhc, df_matched$death_180d),
  method = "wald",
  conf.level = 0.95
)
# création d'un tableau récapitulatif des OR
or_summary_df <- data.frame(
  `Critère` = c("Décès à 30 jours", "Décès à 180 jours"),
  `OR` = c(round(or_30d$measure[2, "estimate"], 2), round(or_180d$measure[2, "estimate"], 2)),
  `IC 95%` = c(
    paste0("(", round(or_30d$measure[2, "lower"], 2), ", ", round(or_30d$measure[2, "upper"], 2), ")"),
    paste0("(", round(or_180d$measure[2, "lower"], 2), ", ", round(or_180d$measure[2, "upper"], 2), ")")
  ),
  check.names = FALSE
)
knitr::kable(or_summary_df, booktabs = TRUE)

# conversion des dates en format Date
df_matched$date_admission <- as.Date(df_matched$date_admission)
df_matched$date_death <- as.Date(df_matched$date_death)
df_matched$date_last_news <- as.Date(df_matched$date_last_news)


# Recalcul des temps à partir des dates (suivi "complet")
df_matched$time_to_death <- as.numeric(df_matched$date_death - df_matched$date_admission)
df_matched$time_to_last_news <- as.numeric(df_matched$date_last_news - df_matched$date_admission)

df_matched$time_to_death

# Événement "décès" selon la présence d'une date de décès
df_matched$event_death <- as.integer(!is.na(df_matched$date_death))
# Temps de suivi complet (décès -> date_death, sinon -> date_last_news)
df_matched$followup_time <- df_matched$time_to_last_news

# Si décès, temps de suivi = temps jusqu'au décès
df_matched$followup_time[df_matched$event_death == 1] <- df_matched$time_to_death[df_matched$event_death == 1]

# Temps d'inclusion : prend le minimum entre le temps de suivi et 180 jours (donc censure après 180 jours)
df_matched$survival_time_180d <- pmin(df_matched$followup_time, 180)

# Événement "décès" à 180 jours : vaut 1 si décès ET temps jusqu'au décès <= 180 jours
df_matched$event_180d <- as.integer(df_matched$event_death == 1 & df_matched$time_to_death <= 180)

# Temps négatifs -> NA
df_matched$survival_time_180d[df_matched$survival_time_180d < 0] <- NA

# création de l'objet de survie
surv_object <- Surv(time = df_matched$survival_time_180d, event = df_matched$event_180d)
# ajustement du modèle de survie de Kaplan-Meier
km_fit <- survfit(surv_object ~ rhc, data = df_matched)
# affichage du graphique de survie
km_plot <- ggsurvplot(
  km_fit,
  data = df_matched,
  pval = TRUE,
  conf.int = TRUE,
  risk.table = TRUE,
  risk.table.height = 0.2,
  risk.table.fontsize = 3.2,
  break.time.by = 30,
  xlim = c(0, 180),
  legend.labs = c("Non-RHC", "RHC"),
  legend.title = "Groupe",
  xlab = "Temps (jours)",
  ylab = "Probabilité de survie",
  title = "Courbe de survie de Kaplan-Meier selon le RHC",
  palette = c(nord::nord("aurora")[1], nord::nord("aurora")[4])
)
print(km_plot)

# test du log-rank conventionnel
logrank_conventional <- survdiff(surv_object ~ rhc, data = df_matched)
p_logrank_conventional <- 1 - pchisq(logrank_conventional$chisq, df = 1)
# test du log-rank stratifié sur les paires
logrank_stratified <- survdiff(
  surv_object ~ rhc + strata(subclass),
  data = df_matched
)

p_logrank_stratified <- 1 - pchisq(logrank_stratified$chisq, df = 1)

logrank_results <- data.frame(
  Test = c("Log-rank conventionnel", "Log-rank stratifié"),
  p_value = c(p_logrank_conventional, p_logrank_stratified)
)

knitr::kable(logrank_results, booktabs = TRUE)

# ajustement du modèle de Cox avec variance robuste et cluster sur les paires appariées
cox_model <- coxph(
  surv_object ~ rhc,
  data = df_matched,
  cluster = subclass
)
#affichage des résultats du modèle de Cox
cox_summary <- summary(cox_model)
cox_results <- data.frame(
  Variable = rownames(cox_summary$coefficients),
  HR = round(cox_summary$coefficients[, "exp(coef)"], 2),
  `IC 95%` = paste0("(", round(cox_summary$conf.int[, "lower .95"], 2), ", ", round(cox_summary$conf.int[, "upper .95"], 2), ")"),
  p_value = format.pval(cox_summary$coefficients[, "Pr(>|z|)"], digits = 3, eps = 0.001),
  row.names = NULL
)
cox_results$Variable <- "RHC vs No RHC"
knitr::kable(cox_results, booktabs = TRUE)

# vérification de l'hypothèse de proportionalité des risques avec les résidus de Schoenfeld
cox_zph <- cox.zph(cox_model)
plot(cox_zph)

# ajustement du modèle de Cox multivarié
cox_multivariate_model <- coxph(
  Surv(survival_time_180d, event_180d) ~ rhc + age + sex + race + education_years + income + insurance_class +
    primary_disease_category + secondary_disease_category +
    diagnosis_respiratory + diagnosis_cardiovascular + diagnosis_neurological +
    diagnosis_gastrointestinal + diagnosis_renal + diagnosis_metabolic +
    diagnosis_hematologic + diagnosis_sepsis + diagnosis_trauma +
    diagnosis_orthopedic + adl_score + DASI_score + dnr_status + cancer +
    survival_probability_2mths + apache_score + glasgow_score +
    weight + temperature + mean_blood_pressure + respiratory_rate +
    heart_rate + pa_fi_ratio + paco2 + ph + wbc + hematocrit +
    sodium + potassium + creatinine + bilirubin + albumin + comorbidity_cardiovascular + comorbidity_congestive_heart +
    comorbidity_dementia + comorbidity_psych + comorbidity_chronic_pulmonary + comorbidity_renal + comorbidity_liver + comorbidity_upper_gi_bleeding +
    comorbidity_malignancy + comorbidity_immunosuppression + comorbidity_transfer + comorbidity_myocardial_infarction +
    urine_output,
  data = df_imputed
)
#extraction de l'OR pour le RHC et de son intervalle de confiance
cox_multivariate_summary <- summary(cox_multivariate_model)
cox_multivariate_results <- data.frame(
  Variable = rownames(cox_multivariate_summary$coefficients),
  HR = round(cox_multivariate_summary$coefficients[, "exp(coef)"], 2),
  IC95 = paste0("(", round(cox_multivariate_summary$conf.int[, "lower .95"], 2), ", ", round(cox_multivariate_summary$conf.int[, "upper .95"], 2), ")"),
  p_value = format.pval(cox_multivariate_summary$coefficients[, "Pr(>|z|)"], digits = 3, eps = 0.001),
  row.names = NULL
)
cox_multivariate_results <- cox_multivariate_results[cox_multivariate_results$Variable == "rhcRHC", ]


cox_multivariate_results$Variable <- "RHC vs No RHC"

knitr::kable(cox_multivariate_results, booktabs = TRUE)

# calcul des p-values pour les variables basales après appariement
df_baseline_post_matching <- df_matched[, unique(c("rhc", cols_to_include_baseline))]

# Forcer l'affichage des variables binaires sur une seule ligne (compte du "Yes"),
binary_var_names <- setdiff(
  names(df_baseline_post_matching)[
    grepl("^(primary_binaire_|secondary_binaire_|comorbidity_|diagnosis_)|^cancer_YN$", names(df_baseline_post_matching))
  ],
  "rhc"
)

df_baseline_post_matching[binary_var_names] <- lapply(df_baseline_post_matching[binary_var_names], function(x) {
  x_chr <- as.character(x)
  x_chr <- trimws(x_chr)
  x_chr <- dplyr::case_when(
    is.na(x_chr) ~ NA_character_,
    x_chr %in% c("1", "TRUE", "True", "true", "Yes", "YES", "Oui", "OUI") ~ "Yes",
    x_chr %in% c("0", "FALSE", "False", "false", "No", "NO", "Non", "NON") ~ "No",
    TRUE ~ x_chr
  )
  factor(x_chr, levels = c("Yes", "No"))
})

# répartition des variables en sous groupes pour la mise en forme du tableau
primary_binaire_columns   <- grep("^primary_binaire_", primary_columns, value = TRUE)
secondary_binaire_columns <- grep("^secondary_binaire_", primary_columns, value = TRUE)

var_to_section <- c(
  stats::setNames(rep("Démographie / socio-économique", length(vars_demo)), vars_demo),
  stats::setNames(rep("Statut fonctionnel / scores", length(vars_scores)), vars_scores),
  stats::setNames(rep("Comorbidités", length(vars_comorb)), vars_comorb),
  stats::setNames(rep("Diagnostic principal (CAT1)", length(primary_binaire_columns)), primary_binaire_columns),
  stats::setNames(rep("Comorbidité principale (CAT2)", length(secondary_binaire_columns)), secondary_binaire_columns),
  stats::setNames(rep("Diagnostics", length(vars_diag_other)), vars_diag_other),
  stats::setNames(rep("Cancer", length(vars_cancer)), vars_cancer),
  stats::setNames(rep("Paramètres cliniques", length(vars_clinical)), vars_clinical),
  stats::setNames(rep("Biologie", length(vars_bio)), vars_bio)
)

# Tableau avec gtsummary
baseline_comparison_table <- gtsummary::tbl_summary(
  df_baseline_post_matching,
  by = "rhc",
  missing = "no",
  statistic = list(
    gtsummary::all_continuous() ~ "{mean} ({sd})",
    gtsummary::all_dichotomous() ~ "{n} ({p}%)",
    gtsummary::all_categorical() ~ "{n} ({p}%)"
  ),
  label = list(
    age ~ "Âge",
    sex ~ "Sexe",
    race ~ "Ethnie",
    education_years ~ "Années d'éducation",
    income ~ "Revenu",
    insurance_class ~ "Classe d'assurance",
    adl_score ~ "Score ADL",
    DASI_score ~ "Score DASI",
    glasgow_score ~ "Score Coma",
    apache_score ~ "Score APACHE",
    dnr_status ~ "Statut DNR",
    primary_binaire_BPCO ~ "BPCO",
    primary_binaire_choc_septique ~ "Choc septique",
    primary_binaire_choc_sur_cancer ~ "Choc sur cancer",
    primary_binaire_insuffisance_renale_aigue ~ "Insuffisance rénale aiguë",
    primary_binaire_insuffisance_cardiaque ~ "Insuffisance cardiaque",
    primary_binaire_coma ~ "Coma",
    primary_binaire_cirrhose ~ "Cirrhose",
    primary_binaire_cancer_du_poumon ~ "Cancer du poumon",
    primary_binaire_cancer_du_colon ~ "Cancer du colon",
    secondary_binaire_choc_septique ~ "Choc septique",
    secondary_binaire_choc_sur_cancer ~ "Choc sur cancer",
    secondary_binaire_coma ~ "Coma",
    secondary_binaire_cirrhose ~ "Cirrhose",
    secondary_binaire_cancer_du_poumon ~ "Cancer du poumon",
    secondary_binaire_cancer_du_colon ~ "Cancer du colon",
    comorbidity_cardiovascular ~ "Cardiopathie",
    comorbidity_congestive_heart ~ "Insuffisance cardiaque congestive",
    comorbidity_myocardial_infarction ~ "Infarctus du myocarde",
    comorbidity_chronic_pulmonary ~ "Maladie pulmonaire chronique",
    comorbidity_renal ~ "Insuffisance rénale",
    comorbidity_liver ~ "Insuffisance hépatique",
    comorbidity_upper_gi_bleeding ~ "Saignement GI supérieur",
    comorbidity_dementia ~ "Démence",
    comorbidity_psych ~ "Psychologique",
    comorbidity_malignancy ~ "Malignité",
    comorbidity_immunosuppression ~ "Immunosuppression",
    comorbidity_transfer ~ "Transfert",
    diagnosis_respiratory ~ "Diagnostic respiratoire",
    diagnosis_cardiovascular ~ "Diagnostic cardiovasculaire",
    diagnosis_neurological ~ "Diagnostic neurologique",
    diagnosis_gastrointestinal ~ "Diagnostic gastro-intestinal",
    diagnosis_renal ~ "Diagnostic rénal",
    diagnosis_metabolic ~ "Diagnostic métabolique",
    diagnosis_hematologic ~ "Diagnostic hématologique",
    diagnosis_sepsis ~ "Diagnostic sepsis",
    diagnosis_trauma ~ "Diagnostic traumatique",
    diagnosis_orthopedic ~ "Diagnostic orthopédique",
    cancer_YN ~ "Cancer (Oui/Non)",
    cancer ~ "Type de cancer",
    weight ~ "Poids",
    mean_blood_pressure ~ "Pression artérielle moyenne",
    heart_rate ~ "Fréquence cardiaque",
    respiratory_rate ~ "Fréquence respiratoire",
    temperature ~ "Température",
    pa_fi_ratio ~ "Ratio Pa/FI",
    urine_output ~ "Diurèse",
    wbc ~ "Globules blancs",
    albumin ~ "Albumine",
    hematocrit ~ "Hématocrite",
    bilirubin ~ "Bilirubine",
    creatinine ~ "Créatinine",
    sodium ~ "Sodium",
    potassium ~ "Potassium",
    paco2 ~ "PaCO2",
    ph ~ "pH"
  ),
  type = list(adl_score ~ "continuous", all_of(binary_var_names) ~ "dichotomous"),
  value = list(all_of(binary_var_names) ~ "Yes")
)

#mise en forme du tableau pour rendu quarto vers pdf
baseline_comparison_table <- baseline_comparison_table |>
  gtsummary::add_p(test = list(gtsummary::all_continuous() ~ "t.test")) |>
  gtsummary::modify_header(label = "**Variable**")

tb <- baseline_comparison_table$table_body
tb$.pos <- seq_len(nrow(tb))

section <- unname(var_to_section[tb$variable])
mask <- tb$row_type == "label" & !is.na(section)

first_pos <- tapply(tb$.pos[mask], section[mask], min)
first_pos <- first_pos[order(first_pos)]

sections <- names(first_pos)
pos_cat <- as.numeric(first_pos) - 0.5

template <- tb[1, , drop = FALSE]
template[,] <- NA

stat_cols <- grep("^stat_", names(tb), value = TRUE)

cat_rows <- template[rep(1, length(sections)), , drop = FALSE]
cat_rows$.pos <- pos_cat
cat_rows$row_type <- "category"
cat_rows$label <- sections
cat_rows$variable <- paste0("cat__", make.names(sections))
cat_rows[, stat_cols] <- ""
cat_rows$p.value <- NA_real_

out <- base::rbind(tb, cat_rows)
out <- out[order(out$.pos), , drop = FALSE]
out$.pos <- NULL

baseline_comparison_table$table_body <- out
baseline_comparison_table <- gtsummary::modify_table_styling(
  baseline_comparison_table, columns = "label", rows = row_type == "category", text_format = "bold"
)
baseline_comparison_table <- gtsummary::modify_table_styling(
  baseline_comparison_table, columns = "label", rows = row_type == "category", text_format = "italic"
)

# affichage du tableau pour quarto vers pdf
baseline_comparison_table |>
  gtsummary::as_kable_extra(booktabs = TRUE, longtable = TRUE) |>
  kableExtra::kable_styling(
    font_size = 8,
    latex_options = c("repeat_header", "scale_down")
  ) |>
  kableExtra::row_spec(
    which(baseline_comparison_table$table_body$row_type == "category"),
    bold = TRUE,
    italic = TRUE
  )



#insérer le code à la fin du fichier

# lire le fichier code genere
code <- readLines("all_chunks_code.R", warn = FALSE)

	code_wrapped <- code
	
	if (knitr::is_latex_output()) {
  code_safe <- code_wrapped
  code_safe <- gsub("`([^`]*[’'][^`]*)`", "\"\\1\"", code_safe, perl = TRUE)
  code_safe <- gsub("`([^`]*\\s+[^`]*)`", "\"\\1\"", code_safe, perl = TRUE)
  code_safe <- gsub(
      "\\\\(begin|end)\\{lstlisting\\}",
      "\\\\textbackslash \\1{lstlisting}",
      code_safe
  )
  cat("\\begin{lstlisting}\n")
  cat(code_safe, sep = "\n")
  cat("\n\\end{lstlisting}\n")
	} else {
    cat("```r\n")
    cat(code_wrapped, sep = "\n")
    cat("\n```")
}

