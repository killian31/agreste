# Geographic data ---------------

library(data.table)
library(lubridate)
library(tidyverse)
library(usethis)

data_geo <- sf::st_read("data-raw/carto/NUTS_RG_20M_2021_3035.shx", quiet = TRUE)
usethis::use_data(data_geo,  overwrite = TRUE, internal = FALSE)
