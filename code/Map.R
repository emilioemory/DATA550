library(tmap)
library(sf)
library(readxl)
library(here)

coords <- read_excel(here("raw_data", "HABs_coords.xlsx"))


coords_sf <- st_as_sf(coords, coords = c("Longitude", "Latitude"), crs = 4326)

map <- tm_shape(coords_sf) +
  tm_dots(size = 0.5, col = "red") +
  tm_basemap("OpenStreetMap")

saveRDS(
  map,
  file = here::here("output", "map.rds")
)
