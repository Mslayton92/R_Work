setwd("C:\\Users\\micha\\OneDrive\\Documents\\R lesson\\")
library(raster)


h=raster("tamd_hill.tif") #Hillshade raster TAm Dao
n=raster("tamd_ndvi.tif") #NDVI of Tam Dao
n2=raster('ndvill.tif') #ndvi raster of Tam dao in lat long

##we can get descriptive stats on out raster
summary(n)

summary(n2)

hist(h)

x=stack(n2,h)
head(x)
#function with get values to remove na's
valuetable <- getValues(x)

valuetable <- na.omit(valuetable)

valuetable <- as.data.frame(valuetable)

head(valuetable, n = 10)

str(valuetable)
# make 750 random obervations to reduce data load
mysample <- valuetable[sample(1:nrow(valuetable), 750, replace=FALSE),]

head(mysample)

#peerson co-relation between variables. Is statistically sig or not

cor.test(mysample$ndvill,mysample$tamd_hill)
#fit in a linear regression. look at adjusted r squared
fit=lm(ndvill~tamd_hill, data=mysample)
summary(fit)

#Extract via points

pt=read.csv("points1.csv")
head(pt)

plot(n2)
points(pt,col='blue')#

dat1=extract(x, pt)

head(dat1)

dat1=as.data.frame(dat1)
dat1=na.omit(dat1)
cor.test(dat1$ndvill,dat1$tamd_hill)
