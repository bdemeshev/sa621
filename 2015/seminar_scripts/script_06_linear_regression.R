x_bar <- 1600
s_var <- 10000
qnorm(0.025)
qnorm(0.975)
x_bar - qnorm(0.975)*sqrt(s_var/100)
x_bar + qnorm(0.975)*sqrt(s_var/100)
z <- (x_bar - 1500)/sqrt(s_var/100)
z
qnorm(0.95)

library("dplyr")
df <- data_frame(weight=c(70,50,80),
                 height=c(160,150,180))
df

model_0 <- lm( data=df, height ~ 0 + weight )
summary(model_0)

model_1 <- lm( data=df, height ~ weight )
summary(model_1)
df
df2 <- mutate(df, weight2 = weight^2)
df
df2
model_2 <- lm( data=df2, height ~ weight + weight2)
summary(model_2)

cars
help(cars)

library("ggplot2")
qplot(data=cars, x=speed, y=dist)
qplot(data=cars, x=speed)
qplot(data=cars, x=speed, binwidth=2)

model_1 <- lm( data=cars, dist~speed)
summary(model_1)

new_df <- data_frame(speed=c(10,50,60))
new_df
predict(model_1, newdata = new_df)

cars2 <- mutate(cars, speed2=speed^2)
cars2
model_2 <- lm( data=cars2, dist~speed+speed2)
summary(model_2)

