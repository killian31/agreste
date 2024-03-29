% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ajouter_titre_tableau.R
\name{ajouter_titre_tableau}
\alias{ajouter_titre_tableau}
\title{Ajouter le titre du tableau dans la première cellule d'une feuille}
\usage{
ajouter_titre_tableau(
  classeur,
  nom_feuille,
  titre,
  col_debut = 2,
  format = "chiffres_et_donnees",
  fusion = TRUE
)
}
\arguments{
\item{classeur}{workbook créé avec openXLSX}

\item{nom_feuille}{nom de la feuille}

\item{titre}{le titre à ajouter}

\item{col_debut}{la colonne de départ (2eme par défaut)}

\item{format}{CHAR le type de publication : "chiffres_et_donnees" ou "primeur"}

\item{fusion}{LGL si les cellules sont à fusionner ou pas (TRUE par défaut)}
}
\value{
Rien n'est renvoyé mais la feuille du classeur est modifiée
}
\description{
Cette fonction permet d'ajouter un titre dans la cellule A1 d'une feuille
}
\examples{

library(openxlsx)
library(agreste)

## Création d'un classeur

mon_classeur <- createWorkbook()

mes_styles <- creer_liste_style_excel(format = "chiffres_et_donnees")

start_ligne = 3
start_col = 2
nb_col = ncol(iris)

ajouter_tableau_excel(classeur = mon_classeur,
                      tableau = iris,
                      nom_feuille = "iris")

## Formatage

addStyle(wb = mon_classeur,
         sheet = "iris",
         style = mes_styles$ligne_titre,
         rows = start_ligne,
         cols = start_col:(nb_col+start_col-1))
addStyle(wb = mon_classeur,
         sheet = "iris",
         style = mes_styles$decimal,
         rows = (start_ligne+1):(nrow(iris)+start_ligne),
         cols = 2)
addStyle(wb = mon_classeur,
         sheet = "iris",
         style = mes_styles$decimal,
         rows = (start_ligne+1):(nrow(iris)+start_ligne),
         cols = 3)
addStyle(wb = mon_classeur,
         sheet = "iris",
         style = mes_styles$decimal,
         rows = (start_ligne+1):(nrow(iris)+start_ligne),
         cols = 4)
addStyle(wb = mon_classeur,
         sheet = "iris",
         style = mes_styles$decimal_italique,
         rows = (start_ligne+1):(nrow(iris)+start_ligne),
         cols = 5)
addStyle(wb = mon_classeur,
         sheet = "iris",
         style = mes_styles$texte,
         rows = (start_ligne+1):(nrow(iris)+start_ligne),
         cols = 6)

## Ajout du titre 

ajouter_titre_tableau(classeur = mon_classeur,
                      nom_feuille = "iris",
                      titre = "Données fleurs iris",
                      col_debut = 2,
                      format = "chiffres_et_donnees")

## Deuxième feuille

start_ligne = 3
start_col = 2
nb_col = ncol(airquality)

ajouter_tableau_excel(classeur = mon_classeur,
                      tableau = airquality,
                      nom_feuille = "airquality")

addStyle(wb = mon_classeur,
         sheet = "airquality",
         style = mes_styles$ligne_titre,
         rows = start_ligne,
         cols = start_col:(nb_col+start_col-1))
addStyle(wb = mon_classeur,
         sheet = "airquality",
         style = mes_styles$numerique,
         rows = (start_ligne+1):(nrow(airquality)+start_ligne),
         cols = 2)
addStyle(wb = mon_classeur,
         sheet = "airquality",
         style = mes_styles$numerique,
         rows = (start_ligne+1):(nrow(airquality)+start_ligne),
         cols = 3)
addStyle(wb = mon_classeur,
         sheet = "airquality",
         style = mes_styles$decimal,
         rows = (start_ligne+1):(nrow(airquality)+start_ligne),
         cols = 4)
addStyle(wb = mon_classeur,
         sheet = "airquality",
         style = mes_styles$numerique,
         rows = (start_ligne+1):(nrow(airquality)+start_ligne),
         cols = 5)
addStyle(wb = mon_classeur,
         sheet = "airquality",
         style = mes_styles$numerique,
         rows = (start_ligne+1):(nrow(airquality)+start_ligne),
         cols = 6)
addStyle(wb = mon_classeur,
         sheet = "airquality",
         style = mes_styles$numerique,
         rows = (start_ligne+1):(nrow(airquality)+start_ligne),
         cols = 7)

ajouter_titre_tableau(classeur = mon_classeur,
                      nom_feuille = "airquality",
                      titre = "Données qualité de l'air",
                      col_debut = 2)

saveWorkbook(wb = mon_classeur,
             file = "tableau.xlsx",
             overwrite = TRUE)

browseURL("tableau.xlsx")

}
