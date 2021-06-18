install.packages(c('magrittr', 
                   'data.table',
                   'sf',
                   'dplyr',
                   'maptools',
                   'mapview'))

library(magrittr)   # pipe functions into one another ('%>%' symbol)
library(data.table) # fast manipulation of data in table format (think Excel spreadsheets)
library(dplyr)      # more data manipulation functions
library(sf)         # geospatial functions
library(maptools)   # contains our toy data set
library(mapview) 

toy.data.file <- system.file('shapes/sids.shp', package='maptools')

#Read in shapefile
nc.county.boundaries <- st_read(toy.data.file)
nc.county.boundaries #Look at full dataset
nc.county.boundaries$AREA #Look at the AREA column only

#visualize output
plot(nc.county.boundaries)

mapview(nc.county.boundaries)

st_crs(nc.county.boundaries)

#SET THE CRS
st_crs(nc.county.boundaries) <-4326

nc.county.boundaries <- st_transform(nc.county.boundaries, 4326)

#union all geometries togther
st_union(nc.county.boundaries) %>% mapview(col.regions='red')

#union all geometries together, then buffer by 0.1 arc degrees (final shape is larger than the original)
st_union(nc.county.boundaries) %>% st_buffer(0.1) %>% mapview(col.regions='blue') 

#union all geometries together, then buffer by 0.1 arc degrees (final shape is larger than the original)
st_union(nc.county.boundaries) %>% st_buffer(-0.1) %>% mapview(col.regions='green')

#show effects of union and buffering on combined plot
mapview(st_union(nc.county.boundaries) %>% st_buffer(0.1), col.regions='blue') +
  mapview(nc.county.boundaries, col.regions='red') +
  mapview(st_union(nc.county.boundaries) %>% st_buffer(-.01), col.regions='green')