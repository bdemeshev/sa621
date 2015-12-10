library("HH")
library("dplyr")
library("plotrix")
library("latticeExtra")
library("reshape2")

glimpse(USAge.df) # short description
View(USAge.df) # full data frame
head(USAge.df) # top 6 observations

max(USAge.df$Year)
min(USAge.df$Year)
pop_1950 <- filter(USAge.df,  Year == 1950)
pop_1950

pop_1950b <- select(pop_1950, -Year)
head(pop_1950b)

pop_1950_wide <- dcast(pop_1950b, 
                       Age~Sex, 
          value.var = "Population")
head(pop_1950_wide)

p <- pop_1950_wide
pyramid.plot(p$Male, 
             p$Female, 
             p$Age)
help("pyramid.plot")

pyramid.plot(lx = p$Male, 
             rx = p$Female,
             labels = p$Age,
             main="US population 1950",
             gap = 0.3)

### Aggregating...
pop_1950c <- mutate(pop_1950b, 
                    Age2 = floor(Age/5))

# rounding functions:
round(3.5)
floor(3.5)
ceiling(3.5)

head(pop_1950c, n = 20)

pop_1950d <- group_by(pop_1950c, Age2, Sex) %>%
  summarise(Population = sum(Population))

head(pop_1950d, 10)
### making wide table 
pop_1950d_wide <- dcast(pop_1950d, 
                       Age2~Sex, 
                       value.var = "Population")
pd <- pop_1950d_wide
pyramid.plot(pd$Male, pd$Female, pd$Age2)

seq(0,70, by=5)
seq(4,74, by=5)
pd$group <- paste0(seq(0,70, by=5), " - ", seq(4,74,by=5))
head(pd)
p <- pop_1950_wide
pyramid.plot(pd$Male, pd$Female, pd$group, gap=3)


