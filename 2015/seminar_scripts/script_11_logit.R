library("mfx")
library("titanic")
library("ggplot2")
library("dplyr")

# ctrl + enter / cmd + enter to execute a line
# save script my_file_name.R

# look at the dataset:
glimpse(titanic_train)
tit <- titanic_train

# Sex = "male" / "female"
# Male = 1 / 0

tit2 <- mutate(tit,
      Male = ifelse(Sex == "male", 1, 0))
glimpse(tit2)

model <- logitmfx(data = tit2,
          Survived ~ Age + Male)
# P(Survived = 1) =
# = F(beta_1 + beta_2 * Age + beta_3 * Male)
model$fit

newdata <- data_frame(Age = c(35, 22),
                      Male = c(1, 0))
newdata

# u = beta_1 + beta_2 * Age + beta_3 * Male
predict(model$fit, newdata)
# P(surv = 1) = F(u)
predict(model$fit, newdata, type = "response")

exp(-0.005)
# for small beta_hat (around zero)
# odds_ratio = exp(beta_hat) ~ 1 + beta_hat
# if age increases by 1 (year)
# odds of survival will decrease by 0.5%

model

























