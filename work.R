#install.packages(c("ltm", "Amelia", "matrixStats", "car", "tidyerse"))
library("ltm")
library(Amelia)
library(matrixStats)
library(ggplot2)

#Import collected data from google forms in exce format
responses = read.csv("res_og_12.csv")

# clean our data
missmap(responses, main="raw responses data")

brand_switching = responses[,c(5,6)]
cost = responses[,c(9,10,11)]
service_quality = responses[,c(12,13,14)]
product_features = responses[,c(15,16,17)]
brand_image = responses[,c(18,19,20)]

# cronbach's reliability alpha
cronbach.alpha(brand_switching)
cronbach.alpha(cost)
cronbach.alpha(service_quality)
cronbach.alpha(product_features)
cronbach.alpha(brand_image)


cost$factor_average <- rowMeans(cost)
service_quality$factor_average <- rowMeans(service_quality)
product_features$factor_average <- rowMeans(product_features)
brand_image$factor_average <- rowMeans(brand_image)

#append factors to the origiona dataset
responses$cost = cost$factor_average
responses$service_quality = service_quality$factor_average
responses$product_features = product_features$factor_average
responses$brand_image = brand_image$factor_average


# PCA
# cost.pca = prcomp(cost)
# summary(cost.pca)
# service_quality.pca = prcomp(service_quality)
# summary(service_quality.pca)


# Summary of data
colMeans(cost)
colSds(data.matrix(cost))


colMeans(service_quality)
colSds(data.matrix(service_quality))

colMeans(product_features)
colSds(data.matrix(product_features))

colMeans(brand_image)
colSds(data.matrix(brand_image))

colMeans(brand_switching)
colSds(data.matrix(brand_switching))


