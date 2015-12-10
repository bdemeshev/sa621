library("HH")
library("dplyr")
library("reshape2")

help(USAge.df)
t <- filter(USAge.df, Year==1950)
glimpse(USAge.df)
View(USAge.df)

glimpse(t)
t2 <- dcast(t, Age~Sex, 
            value.var = "Population")
glimpse(t2)
head(t2, 15)
t3 <- t2 %>% arrange(-Age) %>% select(-Age)
# t3 <- select(t2, -Age)

plot_data <- as.likert(t3)
plot(plot_data)

plot(plot_data, main="Hi, Ada Lovelace!",
     xlab="Population in mlns",
     ylab="Age (usa, 1950)")

scales <- list(
  y = list(
    limits=c(0,76),
    at=seq(0,75, by=5),
    labels=seq(0,75, by=5), tck=1 ))

# some comment :)

plot(plot_data, main="Hi, Ada Lovelace!",
     xlab="Population in mlns",
     ylab="Age (usa, 1950)", scales=scales)
?plot.likert
