#code R pour générer Vous disposez d’un jeu de données comprenant une trentaine de variables quantitatives, ordonnées ou binaires, et vous souhaitez vous faire une idée globale sur le niveau d’association de ces variables entre elles. Comment pouvez-vous procéder ?

```{r}
# Générer un jeu de données avec 30 variables quantitatives, ordonnées ou binaires
set.seed(123)
n <- 100
# 30 variables : 10 quantitatives, 10 ordonnées, 10 binaires
variables <- data.frame(
  # 10 quantitatives
  replicate(10, rnorm(n)),
  # 10 ordonnées (scores de 1 à 5)
  replicate(10, sample(1:5, n, replace = TRUE)),
  # 10 binaires (0 ou 1)
  replicate(10, rbinom(n, 1, 0.5))
)
# Donner des noms aux colonnes
colnames(variables) <- paste0(
  rep(c("quant", "ord", "bin"), each=10),
  1:10
)

# représentations graphiques : matrice de corrélation et autres

# matrice de corrélation
cor(variables)

# heatmap
# Heatmap de la matrice de corrélation
library(corrplot)
corr_matrix <- cor(variables)
corrplot(corr_matrix, method="color", addCoef.col = "black", tl.cex = 0.8, number.cex=0.7)

# Network Graph basé sur la corrélation
library(igraph)
threshold <- 0.5 # à ajuster selon le niveau d'association souhaité
adj_matrix <- abs(corr_matrix) > threshold
diag(adj_matrix) <- 0
g <- graph_from_adjacency_matrix(adj_matrix, mode = "undirected", diag = FALSE)
plot(g, vertex.label=colnames(variables), vertex.size=30, vertex.label.cex=0.8)

# Pair plot pour visualisation individuelle des associations
pairs(variables, main="Matrice de ‘scatterplots’ des variables")

# Visualisation des valeurs propres (PCA) pour recherche de structure
pca <- prcomp(variables, scale. = TRUE)
plot(pca, type="l", main="Valeurs propres (PCA)")
biplot(pca, main="Biplot de la PCA")

```

