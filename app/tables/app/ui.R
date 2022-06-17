ui = dashboardPage(
  skin = "light",
  title = "Mise en forme de tableaux",
  
  header = dashboardHeader(title = "Mise en forme de tableaux"),
  
  sidebar = dashboardSidebar(
    skin = "light",
    
    fileInput(
      inputId = "file1",
      label = "Choisir un fichier CSV",
      multiple = TRUE,
      accept = c("text/csv",
                 "text/comma-separated-values,text/plain",
                 ".csv")),
    
    # Horizontal line ----
    tags$hr(),
    
    # Input: Checkbox if file has header ----
    checkboxInput("header", "Header", TRUE),
    
    # Input: Select separator ----
    radioButtons("sep", "Separateur",
                 choices = c(Virgule = ",",
                             "Point Virgule" = ";",
                             Tab = "\t"),
                 selected = ","),
    
    # Input: Select quotes ----
    radioButtons("quote", "Guillemets",
                 choices = c(Aucun = "",
                             "Doubles Guillemets" = '"',
                             "Simples Guillemets" = "'"),
                 selected = '"'),
    
    # Horizontal line ----
    tags$hr(),
    
    # Input: Select number of rows to display ----
    radioButtons("disp", "Afficher",
                 choices = c(Head = "head",
                             Tout = "all"),
                 selected = "head"),
    
    radioButtons("virg", "Type de virgule",
                 choices = c(Virgule = ",",
                             Point = "."),
                 selected = ","),
  ),
  # controlbar = dashboardControlbar(),
  footer = dashboardFooter(),
  body = dashboardBody(
    prettyRadioButtons(inputId = "format",
                       label = "Format",
                       choices = c("Chiffres et données" = "chiffres_et_donnees",
                                   Primeur = "primeur"),
                       selected = "chiffres_et_donnees"),
    textInput("feuille", "Nom de la feuille :"),
    textInput("title", "Titre du tableau :"),
    # Output: Data file ----
    tableOutput("contents") %>% withSpinner(),
    uiOutput("deroul"),
    tags$hr(),
    textInput("note", "Note de lecture :"),
    textInput("source", "Source"),
    textInput("champ", "Champ"),
    tags$hr(),
    actionButton("validate", "Valider"),
    textInput("output_file", "Nom du fichier de sortie", value = "output.xlsx"),
    actionButton("enreg", "Enregistrer le fichier Excel")
  ),
  
)