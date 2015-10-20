x1 <- rnorm(100, mean=160, sd = 5)
x1[1]
hist(x1, breaks = 10)
x2 <- rnorm(100, mean=160, sd = 5)
x3 <- rnorm(100, mean=160, sd = 5)
x4 <- rnorm(100, mean=160, sd = 5)
x5 <- rnorm(100, mean=160, sd = 5)
hist(x5, breaks = 10)

xbar <- (x1 + x2 + x3 + x4 + x5) / 5
xbar
hist(xbar)
hist(x1)
head(x1)
head(x2)
head(xbar)

hist(x1, breaks = 10)
hist(xbar, breaks = 3)
head(x1, 15)

pnorm(150, mean=160, sd=5)
1 - pnorm(162, mean=160, sd=5)
1 - pnorm(160, mean=160, sd=5)
pnorm(167, mean=160, sd=5) - 
  pnorm(160, mean=160, sd=5)

pnorm(159, mean=160, sd=5)
pnorm(155, mean=160, sd=5)
pnorm(153.6, mean=160, sd=5)
pnorm(150, mean=160, sd=5)
