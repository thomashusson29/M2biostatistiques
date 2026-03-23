suppressMessages(library(dplyr))
suppressMessages(library(lmerTest))
df_large_simplifie <- read.csv("df_large_fictif_38.csv", stringsAsFactors = FALSE)
id_vars <- names(df_large_simplifie)[!grepl("_(S0|S3|S6|S8|S11|S14)$", names(df_large_simplifie))]
df_long_simplifie <- reshape2::melt(df_large_simplifie, id.vars = id_vars, variable.name = "variable_visite", value.name = "valeur") %>%
  mutate(variable = sub("_(S0|S3|S6|S8|S11|S14)$", "", variable_visite), visite = sub("^.*_(S0|S3|S6|S8|S11|S14)$", "\\1", variable_visite)) %>%
  reshape2::dcast(formula = as.formula(paste(paste(c(id_vars, "visite"), collapse = " + "), "~ variable")), value.var = "valeur", fun.aggregate = function(x) x[1]) %>%
  mutate(visite = factor(visite, levels = c("S0", "S3", "S6", "S8", "S11", "S14"), ordered = TRUE), periode = case_when(visite %in% c("S0", "S3", "S6") ~ 1L, visite %in% c("S8", "S11", "S14") ~ 2L), traitement = case_when(sequence_randomisation == "MP" & periode == 1L ~ "Modafinil", sequence_randomisation == "MP" & periode == 2L ~ "Placebo", sequence_randomisation == "PM" & periode == 1L ~ "Placebo", sequence_randomisation == "PM" & periode == 2L ~ "Modafinil"), traitement = factor(traitement, levels = c("Placebo", "Modafinil")))
cols_num <- c("fss", "vasf", "fis", "sf36_pcs", "sf36_mcs", "ei")
df_long_simplifie[cols_num] <- lapply(df_long_simplifie[cols_num], as.numeric)

cat("\n--- FSS ---\n")
print(summary(lmer(fss ~ traitement + periode + sequence_randomisation + (1 | id_patient), data = subset(df_long_simplifie, visite %in% c("S6", "S14"))))$coefficients)

cat("\n--- VASF ---\n")
print(summary(lmer(vasf ~ traitement + periode + visite + (1 | id_patient), data = subset(df_long_simplifie, visite %in% c("S3", "S6", "S11", "S14"))))$coefficients)

cat("\n--- FIS ---\n")
print(summary(lmer(fis ~ traitement + periode + visite + (1 | id_patient), data = subset(df_long_simplifie, visite %in% c("S3", "S6", "S11", "S14"))))$coefficients)

cat("\n--- SF36 PCS ---\n")
print(summary(lmer(sf36_pcs ~ traitement + periode + visite + (1 | id_patient), data = subset(df_long_simplifie, visite %in% c("S3", "S6", "S11", "S14"))))$coefficients)

cat("\n--- EI ---\n")
print(summary(glmer(ei ~ traitement + periode + visite + (1 | id_patient), data = subset(df_long_simplifie, visite %in% c("S3", "S6", "S11", "S14")), family = binomial()))$coefficients)
