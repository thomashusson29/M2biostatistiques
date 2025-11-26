#setwd("C:\\Users\\Jimmy\\ownCloud - jimmy@owncloud.mullaert.fr\\Jimmy\\Cours\\M2MSR")
setwd("D:\\owncloudKS3\\Jimmy\\Cours\\M2MSR")
alzh = read.csv("alzheimer.csv")

###############################
# 0. Data management rudimentaire
###############################

alzh$Group = 1*(alzh$Group %in% c("Demented","Converted")) # On regroupe deux catégories pour obtenir une variable binaire (adaptée pour la régression logistique)
alzh$nWBV = 100*alzh$nWBV # On convertit en "%" la proportion du volume intracrânien occupée par le cerveau

alzh$M.F = factor(alzh$M.F) # Recodage du sexe en facteur
names(alzh)[names(alzh)=="M.F"] = "Sex" # On change le nom de la variable pour une plus explicite

alzh$SES = factor(alzh$SES) # Recodage du statut socio-économique en facteur

###############################
# 1. Construction du tableau descriptif
###############################

# Les effectifs en présence : 
table(alzh$Group)

# Les données manquantes par variable : 
sapply(alzh,function(x) sum(is.na(x)))

  
# Fonction permettant de formater correctement la description sous forme mediane (Q1-Q3) d'une variable quantitative
# La fonction suppose que le dataset s'appelle alzh
# La variable à décrire est passée dans l'argument "v"
# Le nombre de chiffres à garder dans l'affichage est passé dans l'argument "dig"
# La fonction décrit la variable pour un sous-groupe de patients : celui dont la variable "Group" vaut la valeur de l'argument "gr"
report_quanti = function(gr,v,dig){
	med = median(alzh[[v]][alzh$Group==gr],na.rm=TRUE) # Je calcule la médiane, sans les NA
	mm =  format(med,digits=dig) # Je la formate au bon nombre de chiffres
	quant = quantile(alzh[[v]][alzh$Group==gr],probs=c(0.25,0.75),na.rm=TRUE) # Je fais de même avec les quantiles 0.25 et 0.75
	iqr = paste(format(quant,digits=dig),collapse="-") # Un peu de formatage : les deux quantiles sont séparés par un tiret
	paste(mm," (",iqr,")",sep="") # Je renvoie med (Q1-Q3)
}

vars = c("Age","EDUC","MMSE","eTIV","nWBV") # Liste des variables quantitatives à décrire
dig = c(1,1,1,3,1)	# Le nombre de chiffre souhaité pour chaque variable
c1 = mapply(report_quanti,gr=0,v=vars,dig=dig)	# On appelle la fonction pour chaque variable dans le groupe "0"
c2 = mapply(report_quanti,gr=1,v=vars,dig=dig)	# Même chose dans le groupe "1"
tab = cbind(c1,c2)	# Enfin, on juxtapose les deux colonnes.
write.table(tab,file="clipboard",sep="\t",quote=F,col.names=F,row.names=F) # Et on envoie cela dans le presse-papier
# Il s'agit alors juste de coller le résultat dans un tableau Excel.


# Fonction permettant de formater correctement la description sous forme N (%) d'une variable binaire
# le N correspondra à la première modalité de la variable (rappel : ces variables sont généralement décrite sur une seule ligne : seul l'effectif d'une des deux modalités apparait dans le tableau)
# La fonction suppose que le dataset s'appelle alzh
# La variable à décrire est passée dans l'argument "v"
# La fonction décrit la variable pour un sous-groupe de patients : celui dont la variable "Group" vaut la valeur de l'argument "gr"
report_bin = function(gr,v){
	N = table(alzh[[v]][alzh$Group==gr])[1] # Effectif
	pc = mean(alzh[[v]][alzh$Group==gr] == levels(alzh[[v]][alzh$Group==gr])[1]) # Pourcentage calculé sur les valeurs disponibles
	pc = format(100*pc,digits=1) # On convertit en pourcentage et on arrondi à l'unité
	paste(N, " (",pc,")",sep="")
}
tab2 = cbind(report_bin(0,"Sex"),report_bin(1,"Sex"))	# Enfin, on juxtapose les deux colonnes.
write.table(tab2,file="clipboard",sep="\t",quote=F,col.names=F,row.names=F) # Et on envoie cela dans le presse-papier

# Remarque : ici pas besoin de faire de structure répétitive car il n'y a qu'une variable binaire dans la base.

# Fonction permettant de formater correctement la description sous forme N (%) d'une variable catégorielle à >2 modalités
# La fonction suppose que le dataset s'appelle alzh
# La variable à décrire est passée dans l'argument "v"
# La fonction décrit la variable pour un sous-groupe de patients : celui dont la variable "Group" vaut la valeur de l'argument "gr"

report_quali = function(gr,v){
	N = table(alzh[[v]][alzh$Group==gr]) # Effectifs de toutes les modalités
	pc = table(alzh[[v]][alzh$Group==gr])/sum(!is.na(alzh[[v]][alzh$Group==gr])) # Pourcentage calculé sur les valeurs disponibles
	pc = sapply(100*pc,format,digits=1) # On convertit en pourcentage et on arrondi à l'unité
	paste(N, " (",pc,")",sep="")
}

tab3 = cbind(report_quali(0,"SES"),report_quali(1,"SES"))
write.table(tab3,file="clipboard",sep="\t",quote=F,col.names=F,row.names=F) # Et on envoie cela dans le presse-papier


###############################
# 2. Regressions logistiques univariables
###############################

# Fonction qui réalise une régression logistique univariable avec une variable explicative quantitative
# Le dataset est fixé à alzh et la variable expliquée est Group
# La fonction renvoie OR (95%CI) correctement formaté et la p-value du test LRT
# Pour les variables quantitatives, l'option scale permet d'avoir un OR "lisible" en l'exprimant dans une unité différente
rlogquanti = function(v,sc=1){
	ff = as.formula(paste("Group~I(",v,"/sc)",sep="")) # On construit la formule : la variable v sera divisée par le facteur d'échelle
	mod = glm(ff,data=alzh,family=binomial) # On réalise la regression logistique univariable
	or = sprintf("%.1f",exp(coefficients(mod))[-1]) # formatage de l'OR (1 chiffre après la virgule)
	# le [-1] sert à retirer l'intercept, qui ne nous intéresse pas ici
	ci = sapply(exp(confint(mod))[-1,], sprintf, fmt="%.1f") # on formate les intervalles de confiance
	c3 = paste(or," (",paste(ci,collapse=";"),")",sep="")
	# première colonne : OR (95%CI)
	c4 = format(anova(mod,test="Chisq")["Pr(>Chi)"][2,1],digits=2)
	# deuxième colonne : p-value du test LRT
	cbind(c3,c4)
}

# Fonction qui réalise une régression logistique univariable avec une variable explicative catégorielle
# Le dataset est fixé à alzh et la variable expliquée est Group
# La fonction renvoie OR (95%CI) correctement formaté et la p-value du test LRT
rlogquali = function(v){
	ff = as.formula(paste("Group~`",v,"`",sep=""))
	mod = glm(ff,data=alzh,family=binomial) # On réalise la regression logistique univariable
	c1 = levels(alzh[[v]]) # Première colonne : les noms des modalités
	or = sprintf("%.1f",exp(coefficients(mod))[-1])
	ci = apply(exp(confint(mod))[-1,,drop=F],1,function(x) paste(sprintf("%.1f",x),collapse=";"))
	c2 = c("1 (ref)", paste(or," (",ci,")",sep=""))
	# Deuxième colonne : les OR et leur IC95% bien formatés
	c3 = c(format(anova(mod,test="Chisq")["Pr(>Chi)"][2,1],digits=2),rep("",length(levels(alzh[[v]]))-1))
	# Troisième colonne : la p-value du test LRT
	cbind(c1,c2,c3)
}

listvar1 = c("Age","EDUC","MMSE","eTIV","nWBV")
sc = c(10,1,10,100,10)
t(mapply(rlogquanti,v=listvar1,sc=sc))
tab = t(mapply(rlogquanti,v=listvar1,sc=sc))
write.table(tab, "clipboard", sep="\t", row.names=FALSE,col.names=FALSE)


listvar2 = c("Sex","SES")
tab = do.call(rbind,lapply(listvar2,rlogquali))
write.table(tab, "clipboard", sep="\t", row.names=FALSE,col.names=FALSE)


