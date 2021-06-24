

##READ IN SHAPEFILES

setwd("C:\\Users\\micha\\OneDrive\\Documents\\R lesson")
library(raster)
library(rgeos)
library(maptools)
library(rgdal)
library(shapefiles)
library(sf)
library(ggplot2)
#1) readShapePoly of the package maptools

x <- CRS("+proj=longlat +ellps=WGS84") # in latitude and longtitude
pa1=readShapePoly("VietnamPA",verbose = TRUE,proj4string = x)
pa1= st_read("C:\\Users\\micha\\OneDrive\\Documents\\R lesson\\VietnamPA.shp")

ggplot() + 
  geom_sf(data = pa1, size = 3, color = "black", fill = "cyan1") + 
  ggtitle("AOI Boundary Plot") + 
  coord_sf()
head(pa1)

#2)readOGR
pa2=readOGR(".","VietnamPA")
plot(pa2)
pa1utm <- st_transform(pa1, CRS("+proj=utm +zone=48 ellps=WGS84"))

pa3=st_read("C:\\Users\\micha\\OneDrive\\Documents\\Work\\Undeveloped_Lands_Mask.shp")










##EXPLORE THY SHAPEFILE
pa1
#what is the extent?
extent(pa1)
#attributes associated with shapefile
names(pa1)

head(pa1)

str(pa1@data)

print(pa1$name)
#check if particular string is in a specified column
"Tam Dao" %in% pa1$name

summary(pa1)

summary(pa1$iucn_cat)
#table functionality puts it into count data. allows bar plot.
icun=table(pa1$iucn_cat)
barplot(icun)

mean(pa1$rep_area)


####SIMPLE VISUALIZATIONS

library(rworldmap)

wn=getMap(resolution = "coarse")
plot(wn)

data(wrld_simpl,package = "maptools")
plot(wrld_simpl,add=T)

viet= st_read("C:\\Users\\micha\\OneDrive\\Documents\\R lesson\\VNM_adm0.shp")
plot(viet,add=T,axes=TRUE,border="red") #will outline the country
plot(pa1,add=T) #will add the PA shapefile to the world map

#### SUBSET AND SPLIT SHAPEFILE

#Subset out Tam Dao from the Rest of the Shapefile

tdao=subset(pa1, pa1$name=="Tam Dao")
plot(tdao,col="blue")

##check where Tam Dao is in Vietnam
plot(viet,axes=TRUE,border='black')

plot(tdao,add=T,col='blue')

iucnm=subset(pa1, pa1$iucn_cat=="II")
plot(iucnm)
iucnm

#break up layer based on indvidual attributes
#basis for spliting up shapefile is wdpaid column
#basic for loop function

(n <- unique(pa1$wdpaid) )
for(i in n[1:168]){
  temp = pa1[pa1$name == i, ]
  writeOGR(temp, dsn = "C:\\Users\\micha\\OneDrive\\Documents\\Output\\split.shp", i, driver="ESRI Shapefile",overwrite_layer = TRUE)
}
plot(y)

#Lecture 28: Basic Analysis on Shapefiles in R
## So what is the area of Vietnam
library(rgeos)
gArea(tdao)

##so what is this 27.9. When we calculate the area of a shapefile which
#is lat long, the area is given in square degrees
## 1 degree=110km

##Area of Vietnam in sq km

gArea(viet)*110*110

#when area is lat/long the area is given in square degrees

VietPA=st_intersection(viet,pa1) #intersection bw area of PAs and Vietnam

plot(VietPA)

##very useful if we have a polygon larger then the country's surface

tamdao=st_read("C:\\Users\\micha\\OneDrive\\Documents\\R lesson\\VietnamPA_name__Tam Dao.shp")

plot(tamdao) #boundary of Tam dao PA
#all below functions can be run with st package.
gLength(tamdao) #circumference of polygon
gCentroid(tamdao) #centroid of the polygon