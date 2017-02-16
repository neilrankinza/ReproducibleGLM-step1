# logit

library(stargazer)

model1 <- glm(survived ~ sex*age + as.factor(parch), data = titanic_all)
summary(model1)

model2 <- glm(survived ~ sex + age + I(age^2) + as.factor(parch), data = titanic_all)
summary(model2)

model3 <- glm(survived ~ sex*age + sex*I(age^2) + as.factor(parch) + sex*log(fare+0.1), data = titanic_all)
summary(model3)

model4 <- glm(survived ~ sex + age + sex + I(age^2) + as.factor(parch) + sex*log(fare+0.1), data = titanic_all)
summary(model4)

model5 <- glm(survived ~ pclass + embarked, data = titanic_all)
summary(model5)


stargazer(model1, model2, model3, model4, type="text",  out="table.txt")

summary(titanic_all)


family_name <- stringr::str_split(titanic_all$name, ",", n=1)


