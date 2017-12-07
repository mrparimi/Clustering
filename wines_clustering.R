wines7<-read.csv(file = "data/wines_v5.csv",header = TRUE)
set.seed(10)
library(ggplot2)
wines7Cluster <- kmeans(wines7[,2:14],5,nstart = 20)
wines7_clustered <- data.frame(wines7[,2:14],wines7Cluster$cluster)
plot(wines7_clustered,col=wines7_clustered$wines7Cluster.cluster)
ggplot(wines7_clustered,aes(x=Alcohol,y=Malic.acid,size=Ash,
                            color=as.factor(wines7Cluster.cluster),
                            shape=as.factor(wines7Cluster.cluster))) + geom_point()

require(vegan)

# distance matrix
dune_dist <- dist(wines7)

# Multidimensional scaling
cmd <- cmdscale(dune_dist)

# plot MDS, with colors by groups from kmeans
groups <- levels(factor(wines7Cluster$cluster))
ordiplot(cmd, type = "n")
cols <- c("steelblue", "darkred", "darkgreen", "pink","red")
for(i in seq_along(groups)){
  points(cmd[factor(wines7Cluster$cluster) == groups[i], ],  pch = 16)
}

# add spider and hull
ordispider(cmd, factor(wines7Cluster$cluster), label = TRUE)
ordihull(cmd, factor(wines7Cluster$cluster), lty = "dotted")
x=vector()
for (i in 1:20) {
  wines7Cluster_loop <- kmeans(wines7[,2:14],i,nstart = 20)
  x[i]=wines7Cluster_loop$tot.withinss
  i=i+1
}
print(x)
k=1:20
plot(k,x)
