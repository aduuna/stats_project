library(ggplot2)
sex <- factor(raw.data$Gender)
age <- raw.data$Age
age[is.na(age)] <- mean(age,na.rm=T)
grp <- cut(age, breaks = seq(15, 35, 3), include.lowest = TRUE)
df <- data.frame(age, sex, grp)
ggplot(df, aes(x = grp, fill = sex))+ geom_bar()

ggplot(raw.data, aes(Occupation)) +geom_bar()
income = factor(raw.data[,22])
income = gsub("Â¢", "¢", income)
income = factor(income, levels = c('below ¢500','¢500-¢999','¢1000-¢1499', "¢1500-¢2000","above ¢2000"))
ggplot(raw.data, aes(income)) +geom_bar() + scale_x_discrete(labels = c('below ¢500','¢500-¢999','¢1000-¢1499', "¢1500-¢2000","above ¢2000"))
