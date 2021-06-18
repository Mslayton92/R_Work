#Lecture 16: Topographic Calculations in R

#1)Read in raster of degitial elevation model (DEM) already stored on hard drive 

setwd("C:\\Users\\micha\\OneDrive\\Documents\\R lesson\\")
dem=raster("vie_dem_srtm.tif")#elevation in m
plot(dem)
#2) Download elevation data from internet
#country code: http://max2.ese.u-psud.fr/epc/conservation/girondot/Pulications/Blog_r/Entrees/2014/11/2_Other_geographic_databases.html
dem2 = getData('alt',country = "VNM")#you can calculate slope from this

#4)Plot areas of a certain value of elevation
plot(dem,zlim=c(1000,3000),main="Elevation 1000m-3000m") #areas where elevation is between 1000-3000m

slope=terrain(dem,opt="slope",unit="degrees")#calc slope in degrees
aspect=terrain(dem,opt="aspect")

x<- terrain(dem, opt = c("slope", "aspect"), unit = "degrees") 
#plot slope and aspect in degrees
plot(x)

hill <- hillshade(slope, aspect, 40, 270)#hillshade
plot(hill)