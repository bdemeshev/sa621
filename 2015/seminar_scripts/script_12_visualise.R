library("titanic") # data on titanic passangers
library("mfx") # logit models
library("dplyr") # data manipulation
library("broom") # easy syntax for prediction and summarising models
library("ggplot2") # plots

help(cars)
glimpse(cars)

# model 1
# dist = beta_1 + beta_2 * speed + epsilon
model_1 <- lm(data = cars, dist ~ speed)
summary(model_1)

# original data on the plot
ggplot() + geom_point(data = cars, aes(x = speed, y = dist))

# create new data frame
cars_new <- data_frame(speed = seq(from = 4, to = 25, by = 1))
# look at it
cars_new
# make predictions
# "augment" will add new columns to the cars_new
cars_pred <- augment(model_1, newdata = cars_new)
# look at it
cars_pred

# line for estimated model
ggplot() + geom_line(data = cars_pred, aes(x = speed, y = .fitted))

# now we add two layers:
ggplot() +
  geom_point(data = cars, aes(x = speed, y = dist)) + # points
  geom_line(data = cars_pred, aes(x = speed, y = .fitted)) # line
# Note: first two lines should end with '+'
# If a line ends with '+' then R understand that it is not the end


# model 2
# dist = beta_1 + beta_2 * speed + beta_3 * speed^2 + epsilon
model_2 <- lm(data = cars, dist ~ speed + I(speed^2) )
summary(model_2)
# dist_hat = 2.47 + 0.91 * speed + 0.099 * speed^2

# new predictions
cars_pred_2 <- augment(model_2, newdata = cars_new)

ggplot() +
  geom_point(data = cars, aes(x = speed, y = dist)) + # points
  geom_line(data = cars_pred_2, aes(x = speed, y = .fitted)) + # line
  xlab("Speed of the car [mph]") +
  ylab("Stopping distance [feet]") +
  ggtitle("Historical data of 1930")

# course page:
# http://bdemeshev.github.io/sa621/








