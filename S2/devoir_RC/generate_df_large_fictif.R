set.seed(52)

n_patients <- 38
visits <- c("S0", "S3", "S6", "S8", "S11", "S14")

clamp <- function(x, low, high, digits = 1) {
  round(pmin(pmax(x, low), high), digits)
}

sequence_randomisation <- c(rep("MP", 19), rep("PM", 19))
centre <- rep(c("NIH", "NRH", "WRAMC"), length.out = n_patients)
sexe <- sample(c("Homme", "Femme"), n_patients, replace = TRUE, prob = c(0.6, 0.4))
age_annees <- sample(38:78, n_patients, replace = TRUE)
taille_cm <- clamp(rnorm(n_patients, 168, 9), 148, 195)
poids_kg <- clamp(rnorm(n_patients, 72, 12), 45, 120)
imc <- round(poids_kg / (taille_cm / 100)^2, 1)

baseline_fss <- clamp(rnorm(n_patients, mean = 5.5, sd = 0.8), 4.0, 7.0)
patient_mod_effect <- pmax(rnorm(n_patients, mean = 0.95, sd = 0.25), 0.4)
patient_placebo_effect <- pmax(rnorm(n_patients, mean = 0.20, sd = 0.12), 0.0)
period2_drift <- rnorm(n_patients, mean = 0.05, sd = 0.08)
washout_residual <- rnorm(n_patients, mean = 0.02, sd = 0.08)

fss_by_visit <- setNames(vector("list", length(visits)), visits)

for (v in visits) {
  if (v == "S0") {
    fss_by_visit[[v]] <- clamp(baseline_fss + rnorm(n_patients, 0, 0.12), 1, 7)
  } else if (v == "S8") {
    fss_by_visit[[v]] <- clamp(baseline_fss + washout_residual + period2_drift + rnorm(n_patients, 0, 0.12), 1, 7)
  } else {
    in_period1 <- v %in% c("S3", "S6")
    at_week6 <- v %in% c("S6", "S14")
    if (in_period1) {
      tx <- ifelse(sequence_randomisation == "MP", "Modafinil", "Placebo")
      current_baseline <- baseline_fss
    } else {
      tx <- ifelse(sequence_randomisation == "MP", "Placebo", "Modafinil")
      current_baseline <- baseline_fss + washout_residual + period2_drift
    }

    placebo_delta <- ifelse(at_week6, patient_placebo_effect, 0.6 * patient_placebo_effect)
    modafinil_delta <- ifelse(at_week6, patient_mod_effect, 0.6 * patient_mod_effect)
    treatment_delta <- ifelse(tx == "Modafinil", modafinil_delta, placebo_delta)

    fss_by_visit[[v]] <- clamp(
      current_baseline - treatment_delta + rnorm(n_patients, 0, 0.18),
      1,
      7
    )
  }
}

fss_S0 <- fss_by_visit[["S0"]]
fss_S3 <- fss_by_visit[["S3"]]
fss_S6 <- fss_by_visit[["S6"]]
fss_S8 <- fss_by_visit[["S8"]]
fss_S11 <- fss_by_visit[["S11"]]
fss_S14 <- fss_by_visit[["S14"]]

fis_screening <- clamp(22 * fss_S0 + rnorm(n_patients, 10, 8), 76, 160, digits = 0)

make_vasf <- function(fss) clamp(12 * fss + rnorm(length(fss), 6, 5), 0, 100)
make_fis <- function(fss) clamp(20 * fss + rnorm(length(fss), 8, 10), 0, 160)
make_sf36_pcs <- function(fss) clamp(85 - 8 * fss + rnorm(length(fss), 0, 6), 0, 100)
make_sf36_mcs <- function(fss) clamp(88 - 7 * fss + rnorm(length(fss), 0, 6), 0, 100)
make_sleep <- function(fss, extra = 0) clamp(8.7 - 0.35 * fss + extra + rnorm(length(fss), 0, 0.35), 4, 10)

vasf_S0 <- make_vasf(fss_S0)
vasf_S3 <- make_vasf(fss_S3)
vasf_S6 <- make_vasf(fss_S6)
vasf_S8 <- make_vasf(fss_S8)
vasf_S11 <- make_vasf(fss_S11)
vasf_S14 <- make_vasf(fss_S14)

fis_S0 <- make_fis(fss_S0)
fis_S3 <- make_fis(fss_S3)
fis_S6 <- make_fis(fss_S6)
fis_S8 <- make_fis(fss_S8)
fis_S11 <- make_fis(fss_S11)
fis_S14 <- make_fis(fss_S14)

sf36_pcs_S0 <- make_sf36_pcs(fss_S0)
sf36_pcs_S3 <- make_sf36_pcs(fss_S3)
sf36_pcs_S6 <- make_sf36_pcs(fss_S6)
sf36_pcs_S8 <- make_sf36_pcs(fss_S8)
sf36_pcs_S11 <- make_sf36_pcs(fss_S11)
sf36_pcs_S14 <- make_sf36_pcs(fss_S14)

sf36_mcs_S0 <- make_sf36_mcs(fss_S0)
sf36_mcs_S3 <- make_sf36_mcs(fss_S3)
sf36_mcs_S6 <- make_sf36_mcs(fss_S6)
sf36_mcs_S8 <- make_sf36_mcs(fss_S8)
sf36_mcs_S11 <- make_sf36_mcs(fss_S11)
sf36_mcs_S14 <- make_sf36_mcs(fss_S14)

journal_sommeil_S0 <- rbinom(n_patients, 1, 0.95)
journal_sommeil_S3 <- rbinom(n_patients, 1, 0.93)
journal_sommeil_S6 <- rbinom(n_patients, 1, 0.91)
journal_sommeil_S8 <- rbinom(n_patients, 1, 0.93)
journal_sommeil_S11 <- rbinom(n_patients, 1, 0.91)
journal_sommeil_S14 <- rbinom(n_patients, 1, 0.89)

heures_sommeil_S0 <- make_sleep(fss_S0)
heures_sommeil_S3 <- make_sleep(fss_S3, extra = 0.1)
heures_sommeil_S6 <- make_sleep(fss_S6, extra = 0.2)
heures_sommeil_S8 <- make_sleep(fss_S8)
heures_sommeil_S11 <- make_sleep(fss_S11, extra = 0.1)
heures_sommeil_S14 <- make_sleep(fss_S14, extra = 0.2)

compliance_pct_S3 <- clamp(runif(n_patients, 88, 100), 70, 100)
compliance_pct_S6 <- clamp(runif(n_patients, 84, 100), 70, 100)
compliance_pct_S11 <- clamp(runif(n_patients, 88, 100), 70, 100)
compliance_pct_S14 <- clamp(runif(n_patients, 84, 100), 70, 100)

nb_comprimes_pris_S3 <- pmax(0L, pmin(42L, round(42 * compliance_pct_S3 / 100)))
nb_comprimes_pris_S6 <- pmax(0L, pmin(84L, round(84 * compliance_pct_S6 / 100)))
nb_comprimes_pris_S11 <- pmax(0L, pmin(42L, round(42 * compliance_pct_S11 / 100)))
nb_comprimes_pris_S14 <- pmax(0L, pmin(84L, round(84 * compliance_pct_S14 / 100)))

visit_treatment <- function(seq, visit) {
  if (visit %in% c("S0", "S8")) return("Aucun")
  if (seq == "MP") {
    if (visit %in% c("S3", "S6")) "Modafinil" else "Placebo"
  } else {
    if (visit %in% c("S3", "S6")) "Placebo" else "Modafinil"
  }
}

make_ei <- function(visit) {
  tx <- mapply(visit_treatment, sequence_randomisation, visit)
  prob <- ifelse(tx == "Modafinil", 0.18, 0.10)
  if (visit %in% c("S6", "S14")) prob <- prob + 0.03
  rbinom(n_patients, 1, prob)
}

ei_S3 <- make_ei("S3")
ei_S6 <- make_ei("S6")
ei_S11 <- make_ei("S11")
ei_S14 <- make_ei("S14")
eig_S3 <- rbinom(n_patients, 1, 0.01)
eig_S6 <- rbinom(n_patients, 1, 0.01)
eig_S11 <- rbinom(n_patients, 1, 0.01)
eig_S14 <- rbinom(n_patients, 1, 0.01)
arret_traitement_pour_ei_S3 <- ifelse(ei_S3 == 1L & runif(n_patients) < 0.08, 1L, 0L)
arret_traitement_pour_ei_S6 <- ifelse(ei_S6 == 1L & runif(n_patients) < 0.08, 1L, 0L)
arret_traitement_pour_ei_S11 <- ifelse(ei_S11 == 1L & runif(n_patients) < 0.08, 1L, 0L)
arret_traitement_pour_ei_S14 <- ifelse(ei_S14 == 1L & runif(n_patients) < 0.08, 1L, 0L)

df_large <- data.frame(
  id_patient = 1:n_patients,
  centre = centre,
  sequence_randomisation = sequence_randomisation,
  sexe = sexe,
  age_annees = age_annees,
  taille_cm = taille_cm,
  poids_kg = poids_kg,
  imc = imc,
  pps_confirme = 1L,
  fatigue_plainte_majeure = 1L,
  delai_depuis_polio_ans = sample(15:55, n_patients, replace = TRUE),
  fis_screening = fis_screening,
  elig_fis_sup_75 = 1L,
  sensibilite_modafinil = 0L,
  autre_cause_medicale_fatigue = 0L,
  interaction_medicamenteuse = 0L,
  trouble_sommeil_excluant = 0L,
  depression_excluante = 0L,
  grossesse = 0L,
  allaitement = 0L,
  stimulants_ou_ephedra = 0L,
  cardiopathie_connue = 0L,
  fss_S0 = fss_S0,
  fss_S3 = fss_S3,
  fss_S6 = fss_S6,
  fss_S8 = fss_S8,
  fss_S11 = fss_S11,
  fss_S14 = fss_S14,
  vasf_S0 = vasf_S0,
  vasf_S3 = vasf_S3,
  vasf_S6 = vasf_S6,
  vasf_S8 = vasf_S8,
  vasf_S11 = vasf_S11,
  vasf_S14 = vasf_S14,
  fis_S0 = fis_S0,
  fis_S3 = fis_S3,
  fis_S6 = fis_S6,
  fis_S8 = fis_S8,
  fis_S11 = fis_S11,
  fis_S14 = fis_S14,
  sf36_pcs_S0 = sf36_pcs_S0,
  sf36_pcs_S3 = sf36_pcs_S3,
  sf36_pcs_S6 = sf36_pcs_S6,
  sf36_pcs_S8 = sf36_pcs_S8,
  sf36_pcs_S11 = sf36_pcs_S11,
  sf36_pcs_S14 = sf36_pcs_S14,
  sf36_mcs_S0 = sf36_mcs_S0,
  sf36_mcs_S3 = sf36_mcs_S3,
  sf36_mcs_S6 = sf36_mcs_S6,
  sf36_mcs_S8 = sf36_mcs_S8,
  sf36_mcs_S11 = sf36_mcs_S11,
  sf36_mcs_S14 = sf36_mcs_S14,
  journal_sommeil_S0 = journal_sommeil_S0,
  journal_sommeil_S3 = journal_sommeil_S3,
  journal_sommeil_S6 = journal_sommeil_S6,
  journal_sommeil_S8 = journal_sommeil_S8,
  journal_sommeil_S11 = journal_sommeil_S11,
  journal_sommeil_S14 = journal_sommeil_S14,
  heures_sommeil_S0 = heures_sommeil_S0,
  heures_sommeil_S3 = heures_sommeil_S3,
  heures_sommeil_S6 = heures_sommeil_S6,
  heures_sommeil_S8 = heures_sommeil_S8,
  heures_sommeil_S11 = heures_sommeil_S11,
  heures_sommeil_S14 = heures_sommeil_S14,
  compliance_pct_S3 = compliance_pct_S3,
  compliance_pct_S6 = compliance_pct_S6,
  compliance_pct_S11 = compliance_pct_S11,
  compliance_pct_S14 = compliance_pct_S14,
  nb_comprimes_pris_S3 = nb_comprimes_pris_S3,
  nb_comprimes_pris_S6 = nb_comprimes_pris_S6,
  nb_comprimes_pris_S11 = nb_comprimes_pris_S11,
  nb_comprimes_pris_S14 = nb_comprimes_pris_S14,
  ei_S3 = ei_S3,
  ei_S6 = ei_S6,
  ei_S11 = ei_S11,
  ei_S14 = ei_S14,
  eig_S3 = eig_S3,
  eig_S6 = eig_S6,
  eig_S11 = eig_S11,
  eig_S14 = eig_S14,
  arret_traitement_pour_ei_S3 = arret_traitement_pour_ei_S3,
  arret_traitement_pour_ei_S6 = arret_traitement_pour_ei_S6,
  arret_traitement_pour_ei_S11 = arret_traitement_pour_ei_S11,
  arret_traitement_pour_ei_S14 = arret_traitement_pour_ei_S14,
  check.names = FALSE
)

write.csv(
  df_large,
  file = "S2/devoir_RC/df_large_fictif_38.csv",
  row.names = FALSE
)
