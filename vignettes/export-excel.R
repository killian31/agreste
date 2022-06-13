## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(agreste)

## ----examples_style-----------------------------------------------------------
library(agreste)
mes_styles <- creer_liste_style_excel()

#exemples
mes_styles$titre
mes_styles$numerique_total






## ----examples_ajout_tableau_excel---------------------------------------------

# CrÃ©ation d'un classeur avec une feuille contenant iris
# Sauvegarde du classeur
# Ouverture du classeur
library(openxlsx)
library(agreste)
mon_classeur <- createWorkbook()

mes_styles <- creer_liste_style_excel()

ajouter_tableau_excel(classeur = mon_classeur, tableau = iris, nom_feuille = "iris")
addStyle(wb = mon_classeur, sheet = "iris", style = mes_styles$ligne_titre, rows = 1, cols = 1:5)
addStyle(wb = mon_classeur, sheet = "iris", style = mes_styles$decimal, rows = 2:(nrow(iris)+1), cols = 1)
addStyle(wb = mon_classeur, sheet = "iris", style = mes_styles$decimal, rows = 2:(nrow(iris)+1), cols = 2)
addStyle(wb = mon_classeur, sheet = "iris", style = mes_styles$decimal, rows = 2:(nrow(iris)+1), cols = 3)
addStyle(wb = mon_classeur, sheet = "iris", style = mes_styles$decimal_italique, rows = 2:(nrow(iris)+1), cols = 4)
addStyle(wb = mon_classeur, sheet = "iris", style = mes_styles$texte, rows = 2:(nrow(iris)+1), cols = 5)

ajouter_tableau_excel(classeur = mon_classeur, tableau = airquality, nom_feuille = "airquality")
addStyle(wb = mon_classeur, sheet = "airquality", style = mes_styles$ligne_titre, rows = 1, cols = 1:6)
addStyle(wb = mon_classeur, sheet = "airquality", style = mes_styles$numerique, rows = 2:(nrow(airquality)+1), cols = 1)
addStyle(wb = mon_classeur, sheet = "airquality", style = mes_styles$numerique, rows = 2:(nrow(airquality)+1), cols = 2)
addStyle(wb = mon_classeur, sheet = "airquality", style = mes_styles$decimal, rows = 2:(nrow(airquality)+1), cols = 3)
addStyle(wb = mon_classeur, sheet = "airquality", style = mes_styles$numerique, rows = 2:(nrow(airquality)+1), cols = 4)
addStyle(wb = mon_classeur, sheet = "airquality", style = mes_styles$numerique, rows = 2:(nrow(airquality)+1), cols = 5)
addStyle(wb = mon_classeur, sheet = "airquality", style = mes_styles$numerique, rows = 2:(nrow(airquality)+1), cols = 6)

saveWorkbook(wb = mon_classeur, file = "tableau.xlsx", overwrite = TRUE)

browseURL("tableau.xlsx")


