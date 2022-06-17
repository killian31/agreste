source("global.R")

server = function(input, output) {
  
  # track_usage(
  #   storage_mode = store_null(console = FALSE),
  #   what = "input"
  # )
  
  options(shiny.maxRequestSize=15*1024^2) # set maximum file size to 15MB
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, head of that data file by default,
    # or all rows if selected, will be shown.
    
    req(input$file1)
    
    df <- read.csv(input$file1$datapath,
                   header = input$header,
                   sep = input$sep,
                   quote = input$quote,
                   check.names = FALSE,
                   dec = input$virg)
    
    
    if(input$disp == "head") {
      return(head(df, n = 4L))
    }
    else {
      return(df)
    }
    
  })
  
  output$deroul <- renderUI({
    req(input$file1)
    
    df <- read.csv(input$file1$datapath,
                   header = input$header,
                   sep = input$sep,
                   quote = input$quote,
                   check.names = FALSE,
                   dec = input$virg)
    
    lapply(1:ncol(df), function(i) {
      div(style="display: inline-block;vertical-align:top; width: 100px;",
          selectInput(inputId = paste("col_",
                                      as.character(i),
                                      sep = ""),
                      label = paste("Colonne",
                                    as.character(i),
                                    sep = " "),
                      choices = c("Texte" = "texte",
                                  "Entier" = "numerique",
                                  "Décimal" = "decimal")))
    })
  })
  
  observeEvent(input$validate, {
    # print(input$.shinylogs_input$inputs[[(length(input$.shinylogs_input$inputs) - 1)]])
    req(input$file1)
    vec_data_types <- c()
    new_sheet <- TRUE
    df <- read.csv(input$file1$datapath,
                   header = input$header,
                   sep = input$sep,
                   quote = input$quote,
                   check.names = FALSE,
                   dec = input$virg)
    
    for (i in 1:ncol(df)) {
      id <- eval(parse(text = paste("input$col_", as.character(i), sep = "")))
      vec_data_types <- append(vec_data_types, id)
    }
    
    
    df <- read.csv(input$file1$datapath,
                   header = input$header,
                   sep = input$sep,
                   quote = input$quote,
                   check.names = FALSE,
                   dec = input$virg)
    
    if (input$feuille != "" & input$title != "") {
      # showModal(modalDialog("Écriture...", footer = NULL))
      # remove sheet before adding it again (fastest way to clean it)
      if (input$feuille %in% names(wb)) {
        removeWorksheet(wb, input$feuille)
        new_sheet <- FALSE
      } else {
        new_sheet <- TRUE
      }
      start_line <- switch (input$format,
                            "chiffres_et_donnees" = 3,
                            "primeur" = 5
      )
      ajouter_tableau_excel(wb, df, input$feuille, ligne_debut = start_line)
      
      removeCellMerge(wb, input$feuille, 2:(ncol(df)+2-1), 1)
      ajouter_titre_tableau(wb,
                            input$feuille,
                            input$title,
                            fusion = TRUE,
                            format = input$format)
      
      if (input$note != "") {
        list_sheets_with_note <<- append(list_sheets_with_note, input$feuille)
        ajouter_note_lecture(wb, input$feuille, input$note, format = input$format)
        ajouter_source(wb, input$feuille, input$source, avec_note = TRUE, format =input$format)
      } else if (input$source != "") {
        ajouter_source(wb, input$feuille, input$source, avec_note = FALSE, format = input$format)
      }
      if (input$champ != "") {
        ajouter_champ(wb, input$feuille, input$champ, format = input$format)
      }
      
      
      if (isTRUE(new_sheet)) {
        index_current_sheet <<- index_current_sheet + 1
      }
      list_col_data_types[[index_current_sheet]] <<- vec_data_types
      
      # removeModal()
    } else {
      shinyalert("Veuillez indiquer un nom de feuille et de titre avant de valider.", type = "error")
      print("Veuillez indiquer un nom de feuille et de titre avant de valider.")
    }
    
  })
  
  observeEvent(input$enreg, {
    req(input$file1)
    req(input$feuille)
    req(input$title)
    
    # showModal(modalDialog("Enregistrement...", footer = NULL))
    # formatting
    if (input$source != "" & input$champ != "") {
      formater_auto(classeur = wb,
                    format = input$format,
                    liste_feuilles_avec_note = list_sheets_with_note,
                    liste_type_donnees = list_col_data_types)
      # save
      saveWorkbook(wb, file = paste("~", input$output_file, sep = "/"), overwrite = TRUE)
      # removeModal()
      shinyalert(title = "Enregistrement réussi", type = "success")
      print("Enregistrement réussi.")
      # } else if (input$.shinylogs_input[(length(input$.shinylogs_input) - 1)]$name != "validate") {
      #   shinyalert("Veuillez valider vos modifications avant d'enregistrer", type = "warning")
    } else {
      shinyalert("Veuillez indiquer une source et un champ avant d'enregistrer", type = "error")
    }
  })
}