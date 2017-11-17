d<-read.table("E:\\data.txt",header=TRUE,sep='\t')
mydata <- d
data1<-scale(mydata)
wss <- (nrow(data1)-1)*sum(apply(data1,2,var))
for (i in 2:15)
  wss[i] <- sum(kmeans(data1,centers=i)$withinss)
###这里的wss(within-cluster sum of squares)是组内平方和
plot(1:15, wss, type="b", xlab="Number of Clusters",ylab="Within groups sum of squares")
#坐标标记
x=4
y<-round(wss[4],2)
text(x,y,paste("(",x,",",y,")"),pos=1,cex=0.7,col='red')