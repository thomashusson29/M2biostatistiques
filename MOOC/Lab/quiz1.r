#quiz 1
min(smp)

z <- c("prof", "agriculteur", "métier", NA, NA)

sum(table(z))
table(smp$dur.interv)
summary(smp$dur.interv)


factor(smp$n.fratrie >= 5, labels = c("moins de 5", "5 et plus"))

smp$n.fratrie
smp$fratrie5 <- factor(smp$n.fratrie >= 5, labels = c("moins de 5", "5 et plus"))

smp$n.fratrie[smp$n.fratrie < 5] <-'<5' ; smp$n.fratrie[smp$n.fratrie >= 5] <- '5+'

#Donnez le nombre de lignes du tableau de données pour lesquelles la variable ecole vaut 1, 2 ou 3:
nrow(smp[smp$ecole %in% c(1, 2, 3), ])
#nrow sert à compter le nombre de lignes
#smp est le nom du tableau de données
#les [] servent à faire une sélection dans le tableau de données smp
#(smp[smp$ecole veut dire que je sélectionne les lignes du tableau smp où la variable ecole remplit une certaine condition
#smp$ecole %in% c(1, 2, 3) sert à sélectionner les lignes où la variable ecole vaut 1, 2 ou 3
# %in% c(1, 2, 3) signifie "est dans le vecteur c(1, 2, 3)"
 

#autre façon serait de faire
vector123 <- c(1, 2, 3)
nrow(smp[smp$ecole %in% vector123, ])



smp$prof

sansemploi <- "sans emploi"
nrow(smp[smp$prof %in% sansemploi, ])
