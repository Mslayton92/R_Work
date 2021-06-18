#Cliping Rasters in R

library(raster)
setwd("C:\\Users\\micha\\OneDrive\\Documents\\R lesson\\")
hill=raster('1hillshade.tif')
plot(hill)

e <- extent(105.6, 105.7,20.5,21.5) # longtitude, latitude

abs=crop(hill,e)
plot(abs)

e2=drawExtent()#--this is a dynamic clipping tool. It has been ## for compilation

library(rgdal)
tdao=readOGR(".","VietnamPA_name__Tam Dao")
plot(tdao,add=T)

A=mask(hill,tdao)
plot(A)

pa1=readOGR(".","VietnamPA")
plot(pa1,add=T)
dat <- extract(hill, pa1,fun=mean, na.rm=TRUE)
head(dat)