
df <- read.table(file = "flats_moscow.txt",
                 header = TRUE,
                 dec = ".", sep = "\t")
str(df)
library("ggplot2")
library("dplyr")

base <- qplot(data=df, x=livesp, y=price)
base
qplot(data=df, x=livesp, y=price,
      xlab="Living span (square meters)",
      ylab="Price (thousand usd)",
      main="Sample of 2040 Moscow flats in 2007")

qplot(data=df, x=log(livesp), 
      y=log(price) )
str(df)
View(df)


m_1 <- lm(data = df, price ~ totsp) 
m_2 <- lm(data = df, 
  price ~ totsp + livesp + kitsp)
summary(m_1)
summary(m_2)

cor(df$price, df$kitsp)

df2 <- mutate(df, 
  etcsp = totsp - livesp - kitsp)
df2$etcsp
m_3 <- lm(data = df2, 
  price ~ livesp + kitsp + etcsp)

summary(m_3)
m_4 <- lm(data = df, 
          price ~ kitsp)
summary(m_4)

df3 <- mutate(df2, kitsp2 = kitsp^2)
m_5 <- lm(data=df3, 
  price~kitsp+kitsp2)
summary(m_5)
max(df$kitsp)

cor(df$price, df$totsp)
cor(df)

m_3 # long, UR
m_4 # short, R
anova(m_4, m_3)
# conclusion
# H0: short is true (and long is also true)
# Ha: short is false (but long is true)
# H0 is rejected as p-value < significance level



