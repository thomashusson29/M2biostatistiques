af_J0 <- factanal(
    na.omit(hdrs_J0[hdrs_items]),
    factors = 3,
    rotation = "varimax"
)


#afficher résultats
print(af_J0)




alpha_values <- c(
    cronbach(hdrs_J0[,hdrs_items])$alpha,
    cronbach(hdrs_J0[,c("8_ralentissement","12_symptomes_gastro","14_symptomes_genitaux","16_perte_poids")])$alpha,
    cronbach(hdrs_J0[,c("4_insomnie_debut","13_symptomes_generaux")])$alpha,
    cronbach(hdrs_J0[,c("1_humeur_depressive","2_sentim_culpabilite","3_suicide","5_insomnie_milieu","6_insomnie_matin","7_travail_activite","9_agitation","10_anxiete_psychique","11_anxiete_somatique","15_hypochondrie","17_prise_conscience")])$alpha
)
alpha_ci_lower <- c(
    boot.ci(boot_alpha_global, type = "bca")$bca[4],
    boot.ci(boot_alpha_f1, type = "bca")$bca[4],
    boot.ci(boot_alpha_f2, type = "bca")$bca[4],
    boot.ci(boot_alpha_f3, type = "bca")$bca[4]
)
alpha_ci_upper <- c(
    boot.ci(boot_alpha_global, type = "bca")$bca[5],
    boot.ci(boot_alpha_f1, type = "bca")$bca[5],
    boot.ci(boot_alpha_f2, type = "bca")$bca[5],
    boot.ci(boot_alpha_f3, type = "bca")$bca[5]
)
alpha_labels <- c("Global", "Facteur 1", "Facteur 2", "Facteur 3")
alpha_df <- data.frame(
    alpha = alpha_values,
    alpha_ci_lower = alpha_ci_lower, 
    alpha_ci_upper = alpha_ci_upper,
    labels = alpha_labels
)
alpha_df$labels <- factor(alpha_df$labels, levels = alpha_labels)
library(ggplot2)
ggplot(alpha_df, aes(x = labels, y = alpha)) +
    geom_point(size = 3, color = "blue") +
    geom_errorbar(aes(ymin = alpha_ci_lower, ymax = alpha_ci_upper), width = 0.2, color = "blue") +
    ylim(0, 1) +
    labs(title = "Alpha de Cronbach des items de l'échelle de Hamilton à J0",
            x = "Dimensions",
            y = "Alpha de Cronbach") +
        theme_minimal()

```
