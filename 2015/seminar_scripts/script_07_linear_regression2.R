library("ggplot2")
library("dplyr")

cars
qplot(data=cars, x=speed, y=dist)

# estimate the regression
# dist = b_1 + b_2 * speed
model <- lm(data=cars, dist~speed)
summary(model)

new_data <- data_frame(speed=c(45, 55))
cars
new_data
predict(model, newdata = new_data)
base <- qplot(data=cars, x=speed, y=dist)
base + stat_smooth(method = "lm")


cars_subset <- cars[1:20, ]
cars_subset
model_2 <- lm(data=cars_subset, dist~speed)
summary(model_2)

t_cr <- qnorm(0.975)
t_cr
confint(model_2)
confint(model_2, level = 0.99)


swiss
help(swiss)

model_f <- lm(data=swiss, 
      Fertility~Agriculture+Catholic)
summary(model_f)



