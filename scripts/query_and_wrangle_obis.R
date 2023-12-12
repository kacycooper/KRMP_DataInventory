library(robis)
library(mregions2)
library(dplyr)
library(sf)

#Make North Pacific US EEZ (~ OBIS area 274)
US_north_pacific_EEZ_concave_hull <-
  mregions2::gaz_geometry(x = gaz_search(x = 8456)) %>% #get US EEZ from marineregions
  sf::st_cast("POLYGON") %>% #split multipolygon to list of polygons
  slice(2) %>% #grab the west coast polygon
  .[["the_geom"]] %>% #grab the geometry
  st_concave_hull(ratio = 0.3) %>% #make into a concave hull to simplify shape for searching
  st_as_text() #make into Well Known Text (WKT)

# Get column names
obis_col_names <- robis::dataset(scientificname = c("Macrocystis pyrifera")) %>% 
  names(.) %>% 
  sort()

#Get data sets and select columns
obis_datasets <-robis::dataset(
    scientificname = c("Macrocystis pyrifera", 
                       "Nereocystis luetkeana"),
    geometry = US_north_pacific_EEZ_concave_hull
  ) %>% 
  select(id,
         url,
         title,
         abstract)