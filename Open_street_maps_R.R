#Open street map in R
setwd("C:\\Users\\micha\\OneDrive\\Documents\\R lesson\\")
vir=read.csv("aus_fire.csv")
library(raster)
library(rgeos)
library(maptools)
library(rgdal)
library(shapefiles)
library(sf)
library(ggplot2)
library(tidyverse)

vir8=sample_n(vir, 150) ## randomly sample 80 data points

ggplot(vir8, aes(x= longtitude, y= latitude)) +
  geom_point() +
  coord_equal()+
  xlab('Longtitude') +
  ylab('Latitude')
  
