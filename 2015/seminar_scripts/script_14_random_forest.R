library("titanic")
library("randomForest")

library("dplyr")
library("ggplot2")

tit <- titanic_train
glimpse(tit)

help("titanic_train")

tit2 <- select(tit, -PassengerId, -Name, 
               -Ticket, -Cabin)
glimpse(tit2)

tit2b <- filter(tit2, !Embarked == "")

tit3 <- mutate_each(tit2b, "factor",
    Sex, Survived, Pclass, Embarked)

# tit3 <- mutate(tit2, Sex = factor(Sex), Survived = factor(Survived), ...)

model <- randomForest(data = tit3,
    Survived ~ Pclass + Sex +
      Age + SibSp + Parch + Fare +
      Embarked)
# randomForest does not work with NA
# NA is "Not Available" missing value

# Option 1.
# just omit all observations with NA
tit4 <- na.omit(tit3)
glimpse(tit4)

# goo.gl/ZzZiX7
model <- randomForest(data = tit4,
              Survived ~ Pclass + Sex +
              Age + SibSp + Parch + Fare +
              Embarked)

titanic_test


predict(model, titanic_test)
# the reason of the error:
# factor variables in tit4
# but character variables in titanic_test

glimpse(tit4)
glimpse(titanic_test)

tit_test <- mutate_each(titanic_test,
                        "factor",
                Sex, Pclass, Embarked)
glimpse(titanic_test)

predict(model, tit_test)
predict(model, tit_test, type = "prob")

glimpse(tit_test)
glimpse(tit4)


levels(tit_test$Embarked)
levels(tit4$Embarked)

levels(tit_test$Sex)
levels(tit4$Sex)

levels(tit_test$Pclass)
levels(tit4$Pclass)

table(tit4$Embarked)







