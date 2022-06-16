# Données permis de construire départementales ---------------

library(data.table)
library(lubridate)
library(tidyverse)
library(usethis)

dpt_france <- fread(input = "data-raw/carto/departement2021.csv")
permis_construire_dep <- fread(input = "data-raw/carto/PC_DP_creant_locaux_2017_2021.csv") %>%
  mutate(annee_autorisation = year(ymd(DATE_REELLE_AUTORISATION))) %>%
  select(-REG) %>%
  left_join(dpt_france %>% select(DEP, REG), by="DEP") %>%
  group_by(DEP, Type_DAU, annee_autorisation) %>%
  count() %>%
  ungroup() %>%
  pivot_wider(names_from = Type_DAU, values_from = n) %>%
  filter(if_any(DEP, ~ !(.x %in% c("971", "972", "973", "974", "975", "976"))))

usethis::use_data(permis_construire_dep, overwrite = TRUE, internal = FALSE)
