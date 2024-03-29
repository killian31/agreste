# WARNING - Generated by {fusen} from /dev/flat_export_excel.Rmd: do not edit by hand

test_that("mon_classeur fonctionne correctement et renvoie une erreur quand il le faut", {
  mon_classeur <- openxlsx::createWorkbook()

  expect_error(ajouter_tableau_excel(classeur = "iris",
                                     tableau = iris,
                                     nom_feuille = "tab_iris"),
               "Classeur doit \u00eatre un workbook. Lancer un createWorkbook avant de lancer l'ajout de tableau.")
  expect_error(ajouter_tableau_excel(classeur = mon_classeur,
                                     tableau = "tab_iris",
                                     nom_feuille = "tab_iris"),
               "Le tableau doit \u00eatre un dataframe ou un tibble.")
  expect_error(ajouter_tableau_excel(classeur = mon_classeur,
                                     tableau = iris,
                                     nom_feuille = iris),
               "Le nom de feuille doit \u00eatre une cha\u00eene de caract\u00e8re.")
  expect_error(ajouter_tableau_excel(classeur = mon_classeur,
                                     tableau = iris,
                                     nom_feuille = "tab_iris",
                                     ligne_debut = 0,
                                     col_debut = 2),
               "La ligne de d\u00e9but doit \u00eatre un entier positif.")
  expect_error(ajouter_tableau_excel(classeur = mon_classeur,
                                     tableau = iris,
                                     nom_feuille = "tab_iris",
                                     ligne_debut = 3,
                                     col_debut = 0),
               "La colonne de d\u00e9but doit \u00eatre un entier positif.")
  expect_error(ajouter_tableau_excel(classeur = mon_classeur,
                                     tableau = iris,
                                     nom_feuille = "tab_iris",
                                     ligne_debut = "1",
                                     col_debut = 2),
               "La ligne de d\u00e9but doit \u00eatre un entier positif.")
  expect_error(ajouter_tableau_excel(classeur = mon_classeur,
                                     tableau = iris,
                                     nom_feuille = "tab_iris",
                                     ligne_debut = 3,
                                     col_debut = "2"),
               "La colonne de d\u00e9but doit \u00eatre un entier positif.")

})

test_that("Le tableau ajouté est le même dans le workbook", {
  mon_classeur <- openxlsx::createWorkbook()
  
  ajouter_tableau_excel(classeur = mon_classeur,
                        tableau = iris,
                        nom_feuille = "Iris")
  
  expect_equal(sum(openxlsx::readWorkbook(mon_classeur, colNames = TRUE) == iris), 750)
})

test_that("Les noms de feuille sont les bons", {
  mon_classeur <- openxlsx::createWorkbook()
  for (i in 1:6) {
    ajouter_tableau_excel(classeur = mon_classeur,
                        tableau = iris,
                        nom_feuille = paste("Iris", i))
  }
  expect_true(sum(names(mon_classeur) == c("Iris 1", "Iris 2", "Iris 3", "Iris 4", "Iris 5", "Iris 6")) == 6)
  
})

