x <- c("spring", "winter",
       "winter", "autumn")
str(x)
x <- factor(x)
str(x)
x
x + x
levels(x)

library("titanic") # Titanic dataset
library("dplyr") # data transform
# library("car") # transform levels of factor vars
library("vcd") # mosaic plot
library("GGally") # scatter plot matrix
library("psych") # descriptive stats, plots
library("mfx")

tit <- titanic_train
glimpse(tit)
describe(tit)
help("titanic_train")

tit2 <- mutate_each(tit, "factor",
  Survived, Pclass, Sex, Embarked)
glimpse(tit2)
describe(tit2)

tit3 <- select(tit2,
      -PassengerId, -Name,
      -Ticket, -Cabin)
glimpse(tit3)

table(tit3$Survived)
table(tit3$Pclass)

pairs.panels(tit3) # for numeric variables
tit4 <- select(tit3,
      -Fare, -Embarked)
ggpairs(tit4)

table(tit4$Parch)
tit5 <- mutate(tit4,
  Parch2 = ifelse(Parch > 2, 2, Parch))
tit6 <- mutate(tit5,
  SibSp2 = ifelse(SibSp > 2, 2, SibSp))
tit7 <- select(tit6, -SibSp, -Parch)
ggpairs(tit7)
tit8 <- mutate(tit7,
    Parch2 = factor(Parch2),
    SibSp2 = factor(SibSp2))
ggpairs(tit8)

# goo.gl/gLfSTf

mosaic(data = tit8,
       ~ Survived + Pclass + Sex,
       shade = TRUE)

mosaic(data = tit8,
  ~ Pclass + Sex + Parch2 + Survived,
  shade = TRUE)

#
pairs.panels(swiss)
cors <- cor(swiss)
cor.plot(cors)

# back to Titanic!!!

model <- logitmfx(data = tit8,
      Survived ~ Sex + Pclass + Age)
model

# goo.gl/wefcrJ

fit <- model$fit

library("broom")
library("ggplot2")
glimpse(tit8)
new <- data_frame(Age = 1:100,
                  Sex = factor("male"),
                  Pclass = factor(2))
glimpse(new)
fit2 <- augment(fit, newdata = new,
        type.predict = "response")
glimpse(fit2)
qplot(data = fit2,
      x = Age, y = .fitted, geom = "line")

