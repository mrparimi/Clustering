iris_v2 <- read.csv(file = "data/iris_v2.csv",header = TRUE)
set.seed(10)
library(ggplot2)
ggplot(iris_v2,aes(petalLength,petalWidth))+geom_point()
irisCluster <- kmeans(iris_v2[,3:4],5,nstart = 20)
iris_clustered <- data.frame(iris_v2[,3:4],irisCluster$cluster)
ggplot(iris_clustered,aes(petalLength,petalWidth,fill,color=irisCluster.cluster))
+geom_point()

irisCluster1 <- kmeans(iris_v2[,1:4],5,nstart = 20)
iris_clustered1 <- data.frame(iris_v2[,1:4],irisCluster1$cluster)

ggplot(iris_clustered1,aes(sepalLength,sepalWidth,
                         color = petalLength,fill = 
                           petalWidth,size = irisCluster1.cluster))+
  geom_point()+
  scale_color_gradientn(colours = rainbow(5))
plot(iris_clustered1[,1:4],col=iris_clustered1$irisCluster1.cluster)
