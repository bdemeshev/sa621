library("psych")
library("dplyr")
library("readr")
library("ggplot2")

setwd("D:/sa621")

df <- read_csv2("data_sem_01.csv")
df

describe(df)

df

df[2,1]

df[2,] # second row

df[,2] # second column

df[1:2,3] # rows 1 and 2 in column 3

df$weight
df$sex

?mean
