library("ggplot2")

diamonds
str(diamonds)
help(diamonds)

head(diamonds)
tail(diamonds)

head(diamonds, 10)

colnames(diamonds)
diamonds[2, 3]
diamonds$color[2]


mean(diamonds$price)
var(diamonds$price)

qplot(data=diamonds, price)
qplot(data=diamonds, carat, price)
qplot(data=diamonds, carat, price,
      geom="hex")
qplot(data=diamonds, cut, price, 
      geom="violin")

library("dplyr")

a <- cos(sin(pi))
pi %>% sin() %>% cos() -> a

diamonds %>% group_by(cut) %>% 
  summarise(average_price=mean(price),
            var_price=var(price)) -> price_sum
price_sum

diamonds %>% filter(carat < 2) %>% group_by(cut) %>% 
  summarise(average_price=mean(price),
            var_price=var(price),
            num_obs=n()) -> price_sum2
price_sum2

100 %>% sqrt()
sqrt(100)

diamonds %>% select(carat, price) -> car_price

str(car_price)

diamonds %>% select(-price) -> noprice

str(noprice)

# BAD UGLY syntax:
#summarise(group_by(filter(diamonds, carat < 2), cut), average_price=mean(price),
#          var_price=var(price),
#          num_obs=n())

wow <- diamonds %>% group_by(clarity) %>%
  summarise(price=mean(price)) %>%
  arrange(price) %>% tail(3) 
wow

library("vcd")
library("psych")

describe(diamonds)

diamonds %>% filter(carat > 2) %>% 
  select(price, x, y, z) %>% 
  describe() -> description

mosaic(data=diamonds, ~cut+clarity)
  
