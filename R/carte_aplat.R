# WARNING - Generated by {fusen} from /dev/flat_carte.Rmd: do not edit by hand

#' Créer une carte représentant les volumes en aplat de couleurs
#'
#' @return une carte de type ggplot 2
#' @export
#' @importFrom magrittr %>% 
#' @importFrom dplyr left_join
#' @importFrom ggplot2 ggplot
#' @importFrom ggplot2 geom_sf
#' @importFrom ggplot2 geom_point
#' @importFrom ggplot2 aes
#' @importFrom ggplot2 theme_void
#' @importFrom ggplot2 scale_fill_gradient
#' @importFrom ggplot2 labs
#' @importFrom ggplot2 theme
#' @importFrom ggplot2 guides
#' @importFrom ggplot2 guide_legend
#' @importFrom ggplot2 element_blank
#' @importFrom ggplot2 margin
#' @importFrom ggplot2 guide_none
#' @importFrom ggtext element_markdown
#' @importFrom ggtext element_textbox_simple
#' @importFrom ggplot2 ggsave
#' @importFrom assertthat assert_that 
#' @param df dataframe avec les données à afficher sur la carte
#' @param colonne_code_zone_geo nom de la colonne contenant les id de la zone géo : code région, n° de département...
#' @param colonne_volume nom de la colonne contenant les données de volume
#' @param titre_carte CHAR Titre à afficher en haut de la carte
#' @param sous_titre_carte CHAR Sous-titre à afficher en haut de la carte, en dessous du titre
#' @param titre_legende_volume CHAR Titre à afficher en haut de la légende
#' @param note_sous_carte CHAR Note à afficher sous la carte
#' @param legend.position CHAR choit de la position de la carte "right", "left", "bottom", "top"
#' @param zone_geographique CHAR indiquant la zone retenue pour la carte : "france", "ue" ou "monde"
#' @param niveau_representation CHAR indiquant le niveau de représentation : "pays", "region_metro" ou "departement_metro"
#' @param couleur_fond_carte CHAR couleur de fond la carte "nom_couleur" ou "#code_couleur_html"
#' @param couleur_limite_zone CHAR couleur des lignes de séparation de zone géographique "nom_couleur" ou "#code_couleur_html"
#' @param taille_limite_zone NUM épaisseur des lignes de séparation de zone géographique
#' @param couleur_max CHAR couleur à utiliser pour la plus haute valeur de nuance de l'aplat "nom_couleur" ou "#code_couleur_html"
#' @param couleur_min CHAR couleur à utiliser pour la plus basse valeur de nuance de l'aplat "nom_couleur" ou "#code_couleur_html"
#' @param hauteur_cm NUM hauteur de la carte en cm
#' @param largeur_cm NUM largeur de la carte en cm
#' @param save_carte LGL TRUE si export de la carte au format png, FALSE par défaut (simple plot de la carte)
#' @param path_carte CHAR chemin vers l'image à sauvegarder
#' 
#' @examples
#' library(agreste)
#' library(dplyr)
#' ### récupération des données de permis de construire de SITADEL 
#' permis_construire_region_2020 <- agreste::permis_construire_region %>% 
#'   filter(annee_autorisation == 2020)
#' 
#' ### création de la carte et plot
#' carte_pc_2020 <- carte_aplat(df = permis_construire_region_2020, colonne_code_zone_geo = REG, colonne_volume = PC, titre_carte = "Carte 1", sous_titre_carte = "Nombre de permis de construire délivré en 2020 par région", titre_legende_volume = "Nombre de permis de construire", save_carte = FALSE)
#' 
carte_aplat <- function(df,
           colonne_code_zone_geo,
           colonne_volume,
           titre_carte = "Carte 1",
           sous_titre_carte = "sous titre de la carte",
           titre_legende_volume = "titre de la legende",
           note_sous_carte = "Source : Agreste",
           legend.position = "right",
           zone_geographique = "france",
           niveau_representation = "region_metro",
           couleur_fond_carte = "white",
           couleur_limite_zone = "black",
           taille_limite_zone = 0.3,
           couleur_max = "#E66A64",
           couleur_min = "white",
           hauteur_cm = 8,
           largeur_cm = 8,
           save_carte = FALSE,
           path_carte = "carte.png") {
  
  data_geo <- donnees_fond_carte(zone_geographique = zone_geographique , niveau_representation = niveau_representation)
  
  if (niveau_representation == "region_metro") {
    df <- df %>% 
      mutate(code_region = as.character({{colonne_code_zone_geo}}))
  } else if (niveau_representation == "departement_metro") {
    df <- df %>% 
      mutate(code_dep = as.character({{colonne_code_zone_geo}}))
  }
  
  if (niveau_representation == "region_metro") {
    
    carte <- data_geo %>% 
      left_join(df, by= "code_region") %>% 
      ggplot() + 

            geom_sf(fill = couleur_fond_carte, 
              color = couleur_limite_zone, 
              size = taille_limite_zone) +

            geom_sf(aes(fill = {{colonne_volume}})) +
      scale_fill_gradient(name = titre_legende_volume,
                          low = couleur_min,
                          high = couleur_max) +
      
      labs(title = titre_carte,
           subtitle = sous_titre_carte,
           caption = note_sous_carte) +
      theme_void() 
      
    
  } else if (niveau_representation == "departement_metro") {
  
    carte <- data_geo %>% 
      left_join(df, by= "code_dep") %>% 
      ggplot() + 

            geom_sf(fill = couleur_fond_carte, 
              color = couleur_limite_zone, 
              size = taille_limite_zone) +

            geom_sf(aes(fill = {{colonne_volume}})) +
      scale_fill_gradient(name = titre_legende_volume,
                            low = couleur_min,
                            high = couleur_max) +
      
      labs(title = titre_carte,
           subtitle = sous_titre_carte,
           caption = note_sous_carte) +
      
      theme_void() 
  }
  
  if(isTRUE(save_carte)){
    
    ggsave(filename = path_carte,
           plot = carte, 
           width = largeur_cm, 
           height = hauteur_cm, 
           units = "cm" )
  } else {
    plot(carte)
  }
  
  return(carte)
}
