#c=Classstat(rc,cellsize = 30, latlon = FALSE)
#head(c)
#above is from previous scripts

###########RESAMPLE RASTER
library(raster)
setwd("C:\\Users\\micha\\OneDrive\\Documents\\R lesson\\")
h=raster("tamd_hill.tif")
n=raster("tamd_ndvi.tif")


plot(n)








#nLL <- projectRaster(n, crs='=proj=longlat')

#n2=resample(nLL,h,"ngb")

