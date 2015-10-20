help(dbinom)

dbinom(10, size=100, prob=0.49)
dbinom(50, size=100, prob=0.51)
pbinom(40, size=100, prob=0.49)
1-pbinom(49, size=100, prob=0.51)
pbinom(50,size=100,prob=0.49) - 
  pbinom(39, size=100, prob=0.49)

dbinom(10, size=50, prob=1/6)
pbinom(5, size=50, prob=1/6)
1-pbinom(39, size=50, prob=1/6)

1-pbinom(19, size=50, prob=1/6)
pbinom(120, size=200, prob=0.8)
pbinom(8, size=33, prob=0.7)

pnorm(150, mean=160, sd=5)
pnorm(170, mean=160, sd=5) -
  pnorm(165, mean=160, sd=5)

1-pnorm(165, mean=160, sd=sqrt(30/100))
sqrt(30/100)
