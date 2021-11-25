## Exercise 10

rm(list=ls())

setwd("/Users/johnkalemkerian/Desktop/r-novice-inflammation/data/Biocomp-Exercise10")


## 1. Find some data on two variables that you would expect to be related to each other. 
## These data can come from your own research, your daily life, or the internet. 
## Enter those data into a text file or Excel and then save a text file, 
## and write a script that loads this text file and produces a scatter plot 
## of those two variables that includes a trend line.

# load a package every time you wish to use it
library(ggplot2)
library(cowplot)

wallace <- read.csv("wallace.csv", header=TRUE, sep=",", stringsAsFactors = FALSE)


ggplot(data = wallace, aes(x = FG., y = PTS)) + 
  theme_classic() +
  geom_point() +
  stat_smooth(method = "loess") + 
  coord_cartesian(xlim = c(0.3,0.7), ylim = c(0,15)) +
  xlab("Field Goal Percentage") +
  ylab("Points") 
  
## This chart shows Ben Wallace's field goal percentage and point per game by season




## 2. Given the data in “data.txt”. 
## Write a script that generates two figures that sumamrize the data. 
## First, show a barplot of the means of the four populations. 
## Second, show a scatter plot of all of the observations. 
## You may want to “jitter” the points (geom_jitter()) to make it easier 
## to see all of the observations within a population in your scatter plot. 
## Alternatively, you could also try setting the alpha argument in geom_scatterplot() to 0.1. 
## Do the bar and scatter plots tell you different stories? Why?


data <- read.table(file = "data.txt", sep = ",", header = TRUE)

##bar graph
ggplot(data, aes(x = region, y = observations)) + 
  stat_summary(fun = mean, geom = "bar")

##scatter plot
ggplot(data, aes(x = region, y = observations)) +
  geom_jitter()

## The two plots tell very different stories. Looking solely at the bar graph,
## one would think that the populations were all very similar given their
## nearly identical means. However, the scatter plot shows that each population
## is very different. South has two distinct groups, east and west have wide variations
## spread relatively evenly, and north is clustered right around the mean.








