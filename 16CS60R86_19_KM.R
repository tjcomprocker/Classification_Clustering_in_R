km_algo <- function(dataset_org,k)
{
  #temp <- system.time(km <- kmeans(dataset_org,k))
  km <- kmeans(dataset_org,k)
  temp <- c(temp , km$tot.withinss)
  return (temp)
}

dataset_org <- read.csv("household_power_consumption.txt",sep=";")

dataset_org <- dataset_org[1:5000,c(-1,-2)]

for (i in 1:nrow(dataset_org))
{
  for (j in 1:ncol(dataset_org))
  {
    if (is.na(dataset_org[i,j]))
    {
      dataset_org[i,j] <- 0
    }
  }
}

k_value <- c(5:20)
between <- c()

for (i in 5:20)
{
  between <- c(between,km_algo(dataset_org,i))
}
plot(between, type ="o",col="green",xlab="Value of K",ylab="betweenss or Time",main="K-Means Performance" , font.main=4)
