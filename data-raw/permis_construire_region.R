# Données permis de construire régionales ---------------

library(data.table)
library(lubridate)
library(tidyverse)
library(usethis)

dpt_france <- fread(input = "data-raw/carto/departement2021.csv")
permis_construire_region <- fread(input = "data-raw/carto/PC_DP_creant_locaux_2017_2021.csv") %>%
  mutate(annee_autorisation = year(ymd(DATE_REELLE_AUTORISATION))) %>%
  select(-REG) %>%
  left_join(dpt_france %>% select(DEP, REG), by="DEP") %>%
  group_by(REG, Type_DAU, annee_autorisation) %>%
  count() %>%
  ungroup() %>%
  pivot_wider(names_from = Type_DAU, values_from = n)

usethis::use_data(permis_construire_region, overwrite = TRUE, internal = FALSE)
