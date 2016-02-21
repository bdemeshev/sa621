library(GGally)
library("dplyr")
library("car")
ggpairs(cars)
quartz()
ggpairs(swiss)
dev.off()

library(titanic)
tit <- titanic_train
tit <- mutate_each(tit, "as.factor", Sex, Survived, Pclass, SibSp, Parch)

?ggpairs

table(tit$SibSp)
table(tit$Parch)

tit$Parch <- recode(tit$Parch, "2:6='2+'")
tit$SibSp <- recode(tit$SibSp, "2:8='2+'")

glimpse(titanic_train)

ggpairs(tit, columns = c(2:3, 6:8, 10))
