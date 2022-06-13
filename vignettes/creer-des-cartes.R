## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(agreste)

## ----examples-donnees_fond_carte----------------------------------------------
data_geo_france_region_metreo <- donnees_fond_carte(zone_geographique = "france", niveau_representation = "region_metro")

## ----examples-carte-rond-proportionnel----------------------------------------
library(agreste)
library(dplyr)
### rÃ©cupÃ©ration des donnÃ©es de permis de construire de SITADEL 
permis_construire_region_2020 <- agreste::permis_construire_region %>% 
  filter(annee_autorisation == 2020)

### crÃ©ation de la carte et sauvegarde du fichier carte
carte_pc_2020 <- carte_rond_proportionnel(df = permis_construire_region_2020, colonne_code_zone_geo = REG, colonne_volume = PC, titre_carte = "Carte 1", sous_titre_carte = "Nombre de permis de construire dÃ©livrÃ© en 2020 par rÃ©gion", titre_legende_volume = "Nombre de permis de construire", save_carte = TRUE, path_carte = "carte.png")

### ouverture de la carte
browseURL("carte.png")


