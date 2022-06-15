library(data.table)
library(lubridate)
library(tidyverse)
library(usethis)

#' Données géographiques
#' Données des contours des pays, régions, départements
#' @format Un dataset au format .shx
#' @source \url{https://ec.europa.eu/eurostat/web/gisco/geodata/reference-data/administrative-units-statistical-units/nuts}
"data_geo"
data_geo <- sf::st_read("data-raw/carto/NUTS_RG_20M_2021_3035.shx", quiet = TRUE)
usethis::use_data(data_geo,  overwrite = TRUE, internal = FALSE)

#' Permis de construire au niveau régional
#' Les données sur le nombre de permis de construire par région
#' @format Un data frame de 90 lignes et 4 variables
#' @source \url{https://www.data.gouv.fr/fr/datasets/base-des-permis-de-construire-et-autres-autorisations-durbanisme-sitadel/}
"permis_contruire_region"
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

#' Permis de construire au niveau départemental
#' Les données sur le nombre de permis de construire par département
#' @format Un data frame de 480 lignes et 4 variables
#' @source \url{https://www.data.gouv.fr/fr/datasets/base-des-permis-de-construire-et-autres-autorisations-durbanisme-sitadel/}
"permis_construire_dep"
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

#' Plan d'export excel
#' Modèle de plan pour exporter un classeur formaté
#' @format data frame de 4 lignes et 9 variables
"modele_plan"
modele_plan <- openxlsx::read.xlsx("data-raw/excel/modele_plan.xlsx")
usethis::use_data(modele_plan,  overwrite = TRUE, internal = FALSE)

#' Données d'exemple
#' Données d'exemple pour créer un classeur à partir d'un plan
#' @format data frame de 17 lignes et 6 variables
"resultat_1"
resultat_1 <- read.csv("data-raw/excel/resultat_1.csv",
                                  header = TRUE,
                                  check.names = FALSE,
                                  dec = ",")
usethis::use_data(resultat_1,  overwrite = TRUE, internal = FALSE)

#' Données d'exemple
#' Données d'exemple pour créer un classeur à partir d'un plan
#' @format data frame de 5 lignes et 6 variables
"resultat_2"
resultat_2 <- read.csv("data-raw/excel/resultat_2.csv",
                       header = TRUE,
                       check.names = FALSE,
                       dec = ",")
usethis::use_data(resultat_2,  overwrite = TRUE, internal = FALSE)

#' Données d'exemple
#' Données d'exemple pour créer un classeur à partir d'un plan
#' @format data frame de 10 lignes et 4 variables
"resultat_3"
resultat_3 <- read.csv("data-raw/excel/resultat_3.csv",
                       header = TRUE,
                       check.names = FALSE,
                       dec = ",")
usethis::use_data(resultat_3,  overwrite = TRUE, internal = FALSE)
