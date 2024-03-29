# WARNING - Generated by {fusen} from /dev/flat_export_excel.Rmd: do not edit by hand

test_that("mon_classeur fonctionne correctement et renvoie une erreur quand il le faut", {
  mon_classeur <- openxlsx::createWorkbook()

  ajouter_tableau_excel(classeur = mon_classeur,
                      tableau = iris,
                      nom_feuille = "iris",
                      col_debut = 2)

  ajouter_titre_tableau(classeur = mon_classeur,
                        nom_feuille = "iris",
                        titre = "Données fleurs iris",
                        col_debut = 2)
  ajouter_source(classeur = mon_classeur,
                 nom_feuille = "iris",
                 source = "Ceci est une source quelconque",
                 col_debut = 2,
                 avec_note = FALSE)
  ajouter_champ(classeur = mon_classeur,
                nom_feuille = "iris",
                champ = "France métropolitaine",
                col_debut = 2)

  ajouter_tableau_excel(classeur = mon_classeur,
                        tableau = airquality,
                        nom_feuille = "airquality",
                        col_debut = 2)

  ajouter_titre_tableau(classeur = mon_classeur,
                        nom_feuille = "airquality",
                        titre = "Données qualité de l'air",
                        col_debut = 2)
  ajouter_note_lecture(classeur = mon_classeur,
                       nom_feuille = "airquality",
                       note = "blablabla",
                       col_debut = 2)
  ajouter_source(classeur = mon_classeur,
                 nom_feuille = "airquality",
                 source = "Eurostat",
                 col_debut = 2,
                 avec_note = TRUE)
  ajouter_champ(classeur = mon_classeur,
                nom_feuille = "airquality",
                champ = "Daily air quality measurements in New York, May to September 1973.",
                col_debut = 2)


  expect_error(formater_auto(classeur = "workbook",
                             format = "chiffres_et_donnees",
                             liste_feuilles_avec_note = c("airquality"),
                             liste_type_donnees = list(c("decimal",
                                                         "decimal",
                                                         "decimal",
                                                         "decimal",
                                                         "texte"),
                                                       c("numerique",
                                                         "numerique",
                                                         "decimal",
                                                         "numerique",
                                                         "numerique",
                                                         "numerique")),
                             liste_lignes_titre = list(c(1), c(1)),
                             liste_lignes_section = list(c(5, 9),
                                                          c(3, 8)),
                             liste_lignes_sous_total = list(c(4, 8),
                                                             c(2, 7)),
                             liste_lignes_precision_1 = list(c(2,3),
                                                            c(0)),
                             liste_lignes_precision_2 = list(c(0), c(0)),
                             liste_lignes_precision_3 = list(c(0), c(0)),
                             liste_lignes_precision_4 = list(c(0), c(0)),
                             liste_lignes_total = list(c(150),
                                                        c(100)),
                             liste_lignes_italique = list(c(), c()),
                             liste_unif_unites = c(TRUE, TRUE),
                             liste_cellules_fusion = list(c(0), c(0))),
               "Classeur doit \u00eatre un workbook. Lancer un createWorkbook avant de lancer l'ajout de tableau.")
  expect_error(formater_auto(classeur = mon_classeur,
                             format = 2,
                             liste_feuilles_avec_note = c("airquality"),
                             liste_type_donnees = list(c("decimal",
                                                         "decimal",
                                                         "decimal",
                                                         "decimal",
                                                         "texte"),
                                                       c("numerique",
                                                         "numerique",
                                                         "decimal",
                                                         "numerique",
                                                         "numerique",
                                                         "numerique")),
                             liste_lignes_titre = list(c(1), c(1)),
                             liste_lignes_section = list(c(5, 9),
                                                          c(3, 8)),
                             liste_lignes_sous_total = list(c(4, 8),
                                                             c(2, 7)),
                             liste_lignes_precision_1 = list(c(2,3),
                                                            c(0)),
                             liste_lignes_precision_2 = list(c(0), c(0)),
                             liste_lignes_precision_3 = list(c(0), c(0)),
                             liste_lignes_precision_4 = list(c(0), c(0)),
                             liste_lignes_total = list(c(150),
                                                        c(100)),
                             liste_lignes_italique = list(c(), c()),
                             liste_unif_unites = c(TRUE, TRUE),
                             liste_cellules_fusion = list(c(0), c(0))),
               'Le format doit \u00eatre "chiffres_et_donnees" ou "primeur".')
  expect_error(formater_auto(classeur = mon_classeur,
                             format = "chiffres_et_donnees",
                             liste_feuilles_avec_note = c(1,2,3),
                             liste_type_donnees = list(c("decimal",
                                                         "decimal",
                                                         "decimal",
                                                         "decimal",
                                                         "texte"),
                                                       c("numerique",
                                                         "numerique",
                                                         "decimal",
                                                         "numerique",
                                                         "numerique",
                                                         "numerique")),
                             liste_lignes_titre = list(c(1), c(1)),
                             liste_lignes_section = list(c(5, 9),
                                                          c(3, 8)),
                             liste_lignes_sous_total = list(c(4, 8),
                                                             c(2, 7)),
                             liste_lignes_precision_1 = list(c(2,3),
                                                            c(0)),
                             liste_lignes_precision_2 = list(c(0), c(0)),
                             liste_lignes_precision_3 = list(c(0), c(0)),
                             liste_lignes_precision_4 = list(c(0), c(0)),
                             liste_lignes_total = list(c(150),
                                                        c(100)),
                             liste_lignes_italique = list(c(), c()),
                             liste_unif_unites = c(TRUE, TRUE),
                             liste_cellules_fusion = list(c(0), c(0))),
               "La liste des feuilles contenant une note de lecture doit \u00eatre un vecteur contenant des cha\u00eenes de caract\u00e8res.")
  expect_error(formater_auto(classeur = mon_classeur,
                             format = "chiffres_et_donnees",
                             liste_feuilles_avec_note = c("feuille 1"),
                             liste_type_donnees = list(c("decimal",
                                                         "decimal",
                                                         "decimal",
                                                         "decimal",
                                                         "texte"),
                                                       c("numerique",
                                                         "numerique",
                                                         "decimal",
                                                         "numerique",
                                                         "numerique",
                                                         "numerique")),
                             liste_lignes_titre = list(c(1), c(1)),
                             liste_lignes_section = list(c(5, 9),
                                                          c(3, 8)),
                             liste_lignes_sous_total = list(c(4, 8),
                                                             c(2, 7)),
                             liste_lignes_precision_1 = list(c(2,3),
                                                            c(0)),
                             liste_lignes_precision_2 = list(c(0), c(0)),
                             liste_lignes_precision_3 = list(c(0), c(0)),
                             liste_lignes_precision_4 = list(c(0), c(0)),
                             liste_lignes_total = list(c(150),
                                                        c(100)),
                             liste_lignes_italique = list(c(), c()),
                             liste_unif_unites = c(TRUE, TRUE),
                             liste_cellules_fusion = list(c(0), c(0))),
               "La feuille feuille 1 n'est pas une feuille existante.")
  expect_error(formater_auto(classeur = mon_classeur,
                             format = "chiffres_et_donnees",
                             liste_feuilles_avec_note = c("airquality"),
                             liste_type_donnees = c("decimal",
                                                    "decimal",
                                                    "decimal",
                                                    "decimal",
                                                    "texte"),
                             liste_lignes_titre = list(c(1), c(1)),
                             liste_lignes_section = list(c(5, 9),
                                                          c(3, 8)),
                             liste_lignes_sous_total = list(c(4, 8),
                                                             c(2, 7)),
                             liste_lignes_precision_1 = list(c(2,3),
                                                            c(0)),
                             liste_lignes_precision_2 = list(c(0), c(0)),
                             liste_lignes_precision_3 = list(c(0), c(0)),
                             liste_lignes_precision_4 = list(c(0), c(0)),
                             liste_lignes_total = list(c(150),
                                                        c(100)),
                             liste_lignes_italique = list(c(), c()),
                             liste_unif_unites = c(TRUE, TRUE),
                             liste_cellules_fusion = list(c(0), c(0))),
               "La liste des types de donn\u00e9es doit \u00eatre de type list.")
  expect_error(formater_auto(classeur = mon_classeur,
                             format = "chiffres_et_donnees",
                             liste_feuilles_avec_note = c("airquality"),
                             liste_type_donnees = list(c("decimal",
                                                         "decimal",
                                                         "decimal",
                                                         "decimal",
                                                         "texte"),
                                                       c("numerique",
                                                         "numerique",
                                                         "decimal",
                                                         "numerique",
                                                         "numerique",
                                                         "numerique")),
                             liste_lignes_titre = list(c(1), c(1)),
                             liste_lignes_section = list(c(5, 9),
                                                          c(3, 8)),
                             liste_lignes_sous_total = list(c(4, 8),
                                                             c(2, 7)),
                             liste_lignes_precision_1 = list(c(2,3),
                                                            c(0)),
                             liste_lignes_precision_2 = list(c(0), c(0)),
                             liste_lignes_precision_3 = list(c(0), c(0)),
                             liste_lignes_precision_4 = list(c(0), c(0)),
                             liste_lignes_total = list(c(150),
                                                        c(100)),
                             liste_lignes_italique = list(c(), c()),
                             liste_unif_unites = c(TRUE, TRUE),
                             liste_cellules_fusion = list(c(0), c(0)),
                             col_debut = "2"),
               "La colonne de d\u00e9but doit \u00eatre un entier positif.")
  expect_error(formater_auto(classeur = mon_classeur,
                             format = "chiffres_et_donnees",
                             liste_feuilles_avec_note = c("airquality"),
                             liste_type_donnees = list(c("decimal",
                                                         "decimal",
                                                         "decimal",
                                                         "decimal",
                                                         "texte"),
                                                       c("numerique",
                                                         "numerique",
                                                         "decimal",
                                                         "numerique",
                                                         "numerique",
                                                         "numerique")),
                             liste_lignes_titre =list(c(1), c(1)),
                             liste_lignes_section = list(c(5, 9),
                                                          c(3, 8)),
                             liste_lignes_sous_total = list(c(4, 8),
                                                             c(2, 7)),
                             liste_lignes_precision_1 = list(c(2,3),
                                                            c(0)),
                             liste_lignes_precision_2 = list(c(0), c(0)),
                             liste_lignes_precision_3 = list(c(0), c(0)),
                             liste_lignes_precision_4 = list(c(0), c(0)),
                             liste_lignes_total = list(c(150),
                                                        c(100)),
                             liste_lignes_italique = list(c(), c()),
                             liste_unif_unites = c(TRUE, TRUE),
                             liste_cellules_fusion = list(c(0), c(0)),
                             col_debut = 2,
                             avec_titre = "non"),
               "Le param\u00e8tre avec_titre doit \u00eatre TRUE ou FALSE.")

})

test_that("Le classeur est bien modifié pour un c&d", {
  mon_classeur <- openxlsx::createWorkbook()

  ajouter_tableau_excel(classeur = mon_classeur,
                      tableau = iris,
                      nom_feuille = "iris",
                      col_debut = 2)

  ajouter_titre_tableau(classeur = mon_classeur,
                        nom_feuille = "iris",
                        titre = "Données fleurs iris",
                        col_debut = 2)
  ajouter_source(classeur = mon_classeur,
                 nom_feuille = "iris",
                 source = "Ceci est une source quelconque",
                 col_debut = 2,
                 avec_note = FALSE)
  ajouter_champ(classeur = mon_classeur,
                nom_feuille = "iris",
                champ = "France métropolitaine",
                col_debut = 2)

  ajouter_tableau_excel(classeur = mon_classeur,
                        tableau = airquality,
                        nom_feuille = "airquality",
                        col_debut = 2)

  ajouter_titre_tableau(classeur = mon_classeur,
                        nom_feuille = "airquality",
                        titre = "Données qualité de l'air",
                        col_debut = 2)
  ajouter_note_lecture(classeur = mon_classeur,
                       nom_feuille = "airquality",
                       note = "blablabla",
                       col_debut = 2)
  ajouter_source(classeur = mon_classeur,
                 nom_feuille = "airquality",
                 source = "Eurostat",
                 col_debut = 2,
                 avec_note = TRUE)
  ajouter_champ(classeur = mon_classeur,
                nom_feuille = "airquality",
                champ = "Daily air quality measurements in New York, May to September 1973.",
                col_debut = 2)
  
  expect_equal(length(openxlsx::getStyles(mon_classeur)), 7)
  
  formater_auto(classeur = mon_classeur,
                format = "chiffres_et_donnees",
                liste_feuilles_avec_note = c("airquality"),
                liste_type_donnees = list(c("decimal",
                                            "decimal",
                                            "decimal",
                                            "decimal",
                                            "texte"),
                                           c("numerique",
                                             "numerique",
                                             "decimal",
                                             "numerique",
                                             "numerique",
                                             "numerique")),
                 liste_lignes_titre = list(c(1), c(1)),
                 liste_lignes_section = list(c(5, 9),
                                              c(3, 8)),
                 liste_lignes_sous_total = list(c(4, 8),
                                                 c(2, 7)),
                 liste_lignes_precision_1 = list(c(2,3),
                                                c(0)),
                 liste_lignes_precision_2 = list(c(0), c(0)),
                 liste_lignes_precision_3 = list(c(0), c(0)),
                 liste_lignes_precision_4 = list(c(0), c(0)),
                 liste_lignes_total = list(c(150),
                                            c(100)),
                liste_lignes_italique = list(c(), c()),
                 liste_unif_unites = c(TRUE, TRUE),
                 liste_cellules_fusion = list(c(0), c(0)))
  expect_equal(length(openxlsx::getStyles(mon_classeur)), 76)
})

test_that("Le classeur est bien modifié pour un primeur", {
  mon_classeur <- openxlsx::createWorkbook()

  ajouter_tableau_excel(classeur = mon_classeur,
                      tableau = iris,
                      nom_feuille = "iris",
                      col_debut = 2,
                      ligne_debut = 5)

  ajouter_titre_tableau(classeur = mon_classeur,
                        nom_feuille = "iris",
                        titre = "Données fleurs iris",
                        col_debut = 2,
                        format = "primeur")
  ajouter_source(classeur = mon_classeur,
                 nom_feuille = "iris",
                 source = "Ceci est une source quelconque",
                 col_debut = 2,
                 avec_note = FALSE,
                 format = "primeur",
                 avec_titre = FALSE)
  ajouter_champ(classeur = mon_classeur,
                nom_feuille = "iris",
                champ = "France métropolitaine",
                col_debut = 2,
                format = "primeur",
                avec_titre = FALSE)

  ajouter_tableau_excel(classeur = mon_classeur,
                        tableau = airquality,
                        nom_feuille = "airquality",
                        col_debut = 2,
                        ligne_debut = 5)

  ajouter_titre_tableau(classeur = mon_classeur,
                        nom_feuille = "airquality",
                        titre = "Données qualité de l'air",
                        col_debut = 2,
                        format = "primeur")
  ajouter_note_lecture(classeur = mon_classeur,
                       nom_feuille = "airquality",
                       note = "blablabla",
                       col_debut = 2,
                       format = "primeur")
  ajouter_source(classeur = mon_classeur,
                 nom_feuille = "airquality",
                 source = "Eurostat",
                 col_debut = 2,
                 avec_note = TRUE,
                 format = "primeur")
  ajouter_champ(classeur = mon_classeur,
                nom_feuille = "airquality",
                champ = "Daily air quality measurements in New York, May to September 1973.",
                col_debut = 2,
                format = "primeur")
  ajouter_titre_primeur(classeur = mon_classeur,
                                 titre = "Exemple")
  
  expect_equal(length(openxlsx::getStyles(mon_classeur)), 9)
  
  formater_auto(classeur = mon_classeur,
                format = "primeur",
                liste_feuilles_avec_note = c("airquality"),
                liste_type_donnees = list(c("decimal",
                                            "decimal",
                                            "decimal",
                                            "decimal",
                                            "texte"),
                                           c("numerique",
                                             "numerique",
                                             "decimal",
                                             "numerique",
                                             "numerique",
                                             "numerique")),
                 liste_lignes_titre = list(c(1), c(1)),
                 liste_lignes_section = list(c(5, 9),
                                              c(3, 8)),
                 liste_lignes_sous_total = list(c(4, 8),
                                                 c(2, 7)),
                 liste_lignes_precision_1 = list(c(2,3),
                                                c(0)),
                 liste_lignes_precision_2 = list(c(0), c(0)),
                 liste_lignes_precision_3 = list(c(0), c(0)),
                 liste_lignes_precision_4 = list(c(0), c(0)),
                 liste_lignes_total = list(c(150),
                                            c(100)),
                liste_lignes_italique = list(c(), c()),
                 liste_unif_unites = c(TRUE, TRUE),
                 liste_cellules_fusion = list(c(0), c(0)))
  expect_equal(length(openxlsx::getStyles(mon_classeur)), 76)
})
