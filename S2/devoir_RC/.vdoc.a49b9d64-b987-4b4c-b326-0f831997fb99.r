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
library(MatchThem)
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
#| echo: false
#| message: false
#| warning: false
#| tbl-cap: "Procédure de screening et d’évaluation préliminaire"
screening <- data.frame(
Examen = c(
    "Anamnèse médicale",
    "Examen physique",
    "Échelle d’évaluation de la fatigue",
    "Électrocardiogramme",
    "Biologie sanguine et urinaire",
    "Électromyogramme (EMG)",
    "Polysomnographie nocturne",
    "Somnolence diurne",
    "Ponction lombaire (optionnelle)"
),
Description = c(
    "Histoire clinique complète; prises médicamenteuses; recherche d'une cause alternative de fatigue",
    "Examen général et neurologique avant randomisation",
    "",
    "Dépistage d'une cardiopathie",
    "β-hCG, NFS, ionogramme, bilan hépatique et rénal, TSH, vitamines D/B9/B12",
    "Électrodes cutanées et aiguille intramusculaire pour enregistrer l'activité électrique",
    "Nuit au NIH avec électrodes gorge/doigt/thorax et ceinture respiratoire; enregistrement cérébral, oculaire, respiratoire, musculaire et cardiaque",
    "Dès 8 h: cinq siestes de 20 min pour mesurer la somnolence diurne",
    "Analyse du LCR pour causes potentielles du syndrome post-polio sous anesthésie locale"
),
check.names = FALSE
)

gt::gt(screening) |>
gt::cols_label(
    Examen = "Examen",
    Description = "Description"
) |>
gt::cols_width(
    Examen ~ gt::pct(35),
    Description ~ gt::pct(65)
) |>
gt::tab_options(
    table.width = gt::pct(100)
) |>
gt::tab_caption("Procédure de screening et d’évaluation préliminaire")
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
#| echo: true
#| message: false
#| warning: false
pwr.t.test(d = 1/1, sig.level = 0.05, power = 0.80, type = "paired")
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
pwr.t.test(d = 1/1, sig.level = 0.05, power = 0.80, type = "two.sample")
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
#| label: dataframe-large-simplifie
#| echo: true
#| message: false
#| warning: false

        df_large_simplifie <- data.frame(
        # =========================
        # Identifiants et caractéristiques générales
        # =========================
        id_patient = integer(),
        centre = factor(levels = c("NIH", "NRH", "WRAMC")),
        sequence_randomisation = factor(levels = c("MP", "PM")),
        sexe = factor(levels = c("Homme", "Femme")),
        age_annees = numeric(),
        taille_cm = numeric(),
        poids_kg = numeric(),
        imc = numeric(),

        # =========================
        # Eligibilité / screening
        # =========================
        pps_confirme = integer(),
        fatigue_plainte_majeure = integer(),
        delai_depuis_polio_ans = numeric(),
        fis_screening = numeric(),
        elig_fis_sup_75 = integer(),
        sensibilite_modafinil = integer(),
        autre_cause_medicale_fatigue = integer(),
        interaction_medicamenteuse = integer(),
        trouble_sommeil_excluant = integer(),
        depression_excluante = integer(),
        grossesse = integer(),
        allaitement = integer(),
        stimulants_ou_ephedra = integer(),
        cardiopathie_connue = integer(),

        # =========================
        # Scores répétés
        # =========================
        fss_S0 = numeric(), fss_S3 = numeric(), fss_S6 = numeric(),
        fss_S8 = numeric(), fss_S11 = numeric(), fss_S14 = numeric(),

        vasf_S0 = numeric(), vasf_S3 = numeric(), vasf_S6 = numeric(),
        vasf_S8 = numeric(), vasf_S11 = numeric(), vasf_S14 = numeric(),

        fis_S0 = numeric(), fis_S3 = numeric(), fis_S6 = numeric(),
        fis_S8 = numeric(), fis_S11 = numeric(), fis_S14 = numeric(),

        sf36_pcs_S0 = numeric(), sf36_pcs_S3 = numeric(), sf36_pcs_S6 = numeric(),
        sf36_pcs_S8 = numeric(), sf36_pcs_S11 = numeric(), sf36_pcs_S14 = numeric(),

        sf36_mcs_S0 = numeric(), sf36_mcs_S3 = numeric(), sf36_mcs_S6 = numeric(),
        sf36_mcs_S8 = numeric(), sf36_mcs_S11 = numeric(), sf36_mcs_S14 = numeric(),

        # =========================
        # Sommeil
        # =========================
        journal_sommeil_S0 = integer(), journal_sommeil_S3 = integer(), journal_sommeil_S6 = integer(),
        journal_sommeil_S8 = integer(), journal_sommeil_S11 = integer(), journal_sommeil_S14 = integer(),

        heures_sommeil_S0 = numeric(), heures_sommeil_S3 = numeric(), heures_sommeil_S6 = numeric(),
        heures_sommeil_S8 = numeric(), heures_sommeil_S11 = numeric(), heures_sommeil_S14 = numeric(),

        # =========================
        # Observance
        # =========================
        compliance_pct_S3 = numeric(), compliance_pct_S6 = numeric(),
        compliance_pct_S11 = numeric(), compliance_pct_S14 = numeric(),

        nb_comprimes_pris_S3 = numeric(), nb_comprimes_pris_S6 = numeric(),
        nb_comprimes_pris_S11 = numeric(), nb_comprimes_pris_S14 = numeric(),

        # =========================
        # Sécurité
        # =========================
        ei_S3 = integer(), ei_S6 = integer(), ei_S11 = integer(), ei_S14 = integer(),
        eig_S3 = integer(), eig_S6 = integer(), eig_S11 = integer(), eig_S14 = integer(),
        arret_traitement_pour_ei_S3 = integer(), arret_traitement_pour_ei_S6 = integer(),
        arret_traitement_pour_ei_S11 = integer(), arret_traitement_pour_ei_S14 = integer(),

        stringsAsFactors = FALSE
        )
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
