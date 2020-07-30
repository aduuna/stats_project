# graph allvars
pairs(~ cost + service_quality + product_features + brand_image, data=raw.data)

#multicolinearity
car::vif(logit.model)

# run univariate models with each of the predictor variables

uni.logit.model.1 = glm(brand_switching ~ cost, family="binomial", data=raw.data)
summary(uni.logit.model.1)
plot(uni.logit.model.1)

uni.logit.model.2 = glm(brand_switching ~ service_quality, family="binomial", data=raw.data)
summary(uni.logit.model.2)
plot(uni.logit.model.2)

uni.logit.model.3 = glm(brand_switching ~ product_features, family="binomial", data=raw.data)
summary(uni.logit.model.3)
plot(uni.logit.model.3)

uni.logit.model.4 = glm(brand_switching ~ brand_image, family="binomial", data=raw.data)
summary(uni.logit.model.4)
plot(uni.logit.model.4)

