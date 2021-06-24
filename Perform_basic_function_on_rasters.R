library(raster)

rasters

s=calc(rasters,sum)#will sum up all raster bands

func <- function(x)  ##apply a custom function to your stack
{
  x[x<300]<-NA
  return(x)
}
rc2 <- calc(s,func)

s2=s[s<300]<-NA
# (NIR-Red)/(NIR+Red)

ndvi=(rasters$band4-rasters$band3)/(rasters$band3+rasters$band4)
plot(ndvi)