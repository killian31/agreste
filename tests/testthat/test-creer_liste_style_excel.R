# WARNING - Generated by {fusen} from /dev/flat_export_excel.Rmd: do not edit by hand

test_that("L'objet retourné est une liste", {
  expect_true(class(creer_liste_style_excel()) == "list")
})
test_that('Les styles définis sont bien de type "Style"', {
  mes_styles <- creer_liste_style_excel()
  for (st in mes_styles) {
    expect_true(class(st) == "Style")
  }
})
