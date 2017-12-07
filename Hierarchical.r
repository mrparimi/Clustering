library(dendextend)
library(colorspace)
library(circlize)
iris_v3 <- iris[,-5]
iris_species_v3 <- iris[,5]
species_col <- rev(rainbow_hcl(3))[as.numeric(iris_species_v3)]
distance_iris <- dist(iris_v3,method = "euclidean")
hc_iris <- hclust(distance_iris,method = "complete")
iris_specie_hc <- rev(levels(iris[,5]))
iris_dend <- as.dendrogram(hc_iris)
iris_dend <- rotate(iris_dend,1:150)
iris_dend <- color_branches(iris_dend,k=3)
labels_colors(iris_dend)
rainbow_hcl(3)[sort_levels_values(as.numeric(iris[,5])[order.dendrogram(iris_dend)])]
labels(iris_dend) <- paste(as.character(iris[,5])[order.dendrogram(iris_dend)],
                           "(",labels(iris_dend),")",sep = "")
dend_iris <-set(iris_dend,"labels_cex",0.5)
par(mar = c(3,3,3,7))
plot(iris_dend,main="Clustered Iris data set(the labels give the true flower species)",
     horiz = TRUE,nodePar=list(cex =.007))
legend("topleft",legend = iris_specie_hc,fill = rainbow_hcl(3))
