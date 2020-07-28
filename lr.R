# check for class bias i the response variable
raw.data <- responses
table(raw.data$brand_switching)

# dealing with class bias of more 1's than 0's
zeros = raw.data[which(raw.data$brand_switching == 0), ]
ones = raw.data[which(raw.data$brand_switching == 1), ]

# split data into train and test data
sample_obs <- function(data, train_fraction){
  sample(1:nrow(data), train_fraction * nrow(data));
}
set.seed(300)
samp = sample_obs(zeros, 0.9); train_zeros = zeros[samp, ]; test_zeros = zeros[-samp, ]
samp = sample_obs(ones, 0.9); train_ones = ones[samp, ]; test_ones = ones[-samp, ]

train_data = rbind(train_ones, train_zeros)
test_data = rbind(test_ones, test_zeros)

logit.model = glm(brand_switching ~ cost + service_quality + product_features + brand_image, family="binomial", data=train_data)
summary(logit.model)

predicted <- plogis(predict(logit.model, test_data))
predicted = ifelse(predicted > 0.5, 1, 0)
accuracy = mean(predicted == test_data$brand_switching)
print(accuracy)

par(mfrow=c(2,2))
plot(logit.model)

# this should bearound 0
mean(logit.model$residuals)
