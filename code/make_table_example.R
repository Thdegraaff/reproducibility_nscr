library(stargazer)

## 2 OLS models
linear.1 <- lm(rating ~ complaints + privileges + learning + raises + critical,
               data=attitude)
linear.2 <- lm(rating ~ complaints + privileges + learning, data=attitude)
## create an indicator dependent variable, and run a probit model
attitude$high.rating <- (attitude$rating > 70)
probit.model <- glm(high.rating ~ learning + critical + advance, data=attitude,
                    family = binomial(link = "probit"))

stargazer(linear.1, linear.2, probit.model, type =  "text", title="Results", align=TRUE)



