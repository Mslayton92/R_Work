library(raster)

band1=raster("band1.tif")
band1


plot(band1)

band2=raster("band2.img")
band2

b3=raster('CA2015_new.rst')
writeRaster(b3,"ConvertToTif.tif",overwrite=TRUE)

setwd("C:\\Users\\micha\\OneDrive\\Documents\\R lesson\\bands")

rlist=list.files(pattern='tif$', full.names=TRUE)
#Create Raster Stack
rasters = stack(rlist)

#Examine your raster stack
names(rasters)
rasters
plot(rasters)

###Modify Raster stack

band1=raster('band1.tif')
band1

band3=raster("band3.tif")
band3

band4=raster("band4.tif")
band4

stackR=stack(band1,band3,band4)
plot(stackR)

br=brick(band1,band2,band3)
names(stackR)

plot(br$band1)

setwd("C:\\Users\\micha\\OneDrive\\Documents\\R lesson\\bands")

rlist=list.files(pattern="tif$", full.names=TRUE)
#Create raster stack
rasters = stack(rlist)
rasters

#Drop layers: from a given stack,specify the index of the layer to be removed.
#in this case,drop the 6th layer
rastersD1=dropLayer(rasters,6)
names(rastersD1)

rastersD2=dropLayer(rasters,c(1,6))#specify indices 1 and 6 

rastAdd=addLayer(rastersD2,band1) #add b1 to the stack


###########False Colour Composites

rasters

plotRGB(rasters,r=3,g=2,b=1, stretch = 'hist')

plotRGB(rasters,r=3,g=2,b=1, scale=800,stretch = 'Lin')

plotRGB(rasters,r=4,g=3,b=2, stretch = 'hist')