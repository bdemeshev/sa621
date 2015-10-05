height <- c(160, 170, NA, 150)

height[2]

mean(height)

mean(height, na.rm=TRUE)

weight <- c(50, 100, 60, 40)
mean(weight)
max(weight)
min(weight)

z <- 5:20
z

w <- rep("male", 30)
w

very_long_vector <- rep(3, 10^7)
very_long_vector[75]

random_vector_1 <- runif(100, min=3, max=7)
random_vector_1

A <- 6
a <- 8

A
a

friends <- sample(c("male","female"), size=100, replace=TRUE)
friends

numbers <- sample(1:10, size=5, replace=FALSE)
numbers

answer <- sample(3:7, size=100, replace=TRUE)
answer
answer[17]