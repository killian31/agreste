library(shiny)
library(agreste)
library(openxlsx)
library(shinycssloaders)
library(shinyalert)
library(shinyWidgets)
library(bs4Dash)
library(magrittr)


wb <- createWorkbook()
list_sheets_with_note <- c(" ")
list_col_data_types <- list()
index_current_sheet <- 0

wd <- getwd()