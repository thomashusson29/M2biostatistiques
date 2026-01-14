#satisfaction à l'hopital
satisfaction_hopital <- read.csv2("satisfaction_hopital.csv")

#installer prettyR avec avertissement négatif si déjà installé
if(!require(prettyR)) install.packages("prettyR", dependencies=TRUE)
library(prettyR)


##question 1 : Pour les trois variables catégorielles du fichier (à vous de déterminer de quelles variables il s'agit), présentez les pourcentages de sujets relevant de chacune des modalités.
#voir quelles sont les variables catégorielles
str(satisfaction_hopital)
describe(satisfaction_hopital)

#répartition sexe et pourcentage sexe
table(satisfaction_hopital$sexe)
prop.table(table(satisfaction_hopital$sexe))*100

#répartition et pourcentage profession 
table(satisfaction_hopital$profession)
prop.table(table(satisfaction_hopital$profession))*100

#répartition et pourcentage service
table(satisfaction_hopital$service)
prop.table(table(satisfaction_hopital$service))*100

#question 2 
summary(satisfaction_hopital$age)
summary(satisfaction_hopital$amelioration.sante)
summary(satisfaction_hopital$amelioration.moral)
summary(satisfaction_hopital$recommander)
summary(satisfaction_hopital$score.relation)
summary(satisfaction_hopital$score.information)

#question 3
hist(satisfaction_hopital$score.relation)

#question 4
boxplot(satisfaction_hopital$score.relation~satisfaction_hopital$sexe)

boxplot(satisfaction_hopital$score.relation ~ satisfaction_hopital$sexe,
        xlab = "Sexe",
        ylab = "Score de relation",
        names = c("Hommes", "Femmes"),
        main = "Distribution du score de relation selon le sexe")

