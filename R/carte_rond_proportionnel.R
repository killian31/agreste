# WARNING - Generated by {fusen} from /dev/flat_carte.Rmd: do not edit by hand

#' Créer une carte représentant les volumes en ronds proportionnels
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
#' @importFrom ggplot2 scale_size_area
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
#' @param couleur_fond_rond CHAR couleur de remplissage des ronds affichés "nom_couleur" ou "#code_couleur_html"
#' @param couleur_contour_rond CHAR couleur de contour des ronds "nom_couleur" ou "#code_couleur_html"
#' @param taille_max_rond NUM taille du rond correspondant au plus grand volume
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
#' ### création de la carte et sauvegarde du fichier carte
#' carte_pc_2020 <- carte_rond_proportionnel(df = permis_construire_region_2020, colonne_code_zone_geo = REG, colonne_volume = PC, titre_carte = "Carte 1", sous_titre_carte = "Nombre de permis de construire délivré en 2020 par région", titre_legende_volume = "Nombre de permis de construire", save_carte = TRUE, path_carte = "carteReg.png")
#' 
#' ### ouverture de la carte
#' browseURL("carteReg.png")
#' 
#' # Pour faire par département :
#' permis_construire_dep_2020 <- agreste::permis_construire_dep %>%
#'   filter(annee_autorisation == 2020)
#' 
#' carte_pc_2020 <- carte_rond_proportionnel(df = permis_construire_dep_2020, colonne_code_zone_geo = DEP, colonne_volume = PC, niveau_representation = "departement_metro", titre_carte = "Carte 2", sous_titre_carte = "Nombre de permis de construire délivré en 2020 par département", titre_legende_volume = "Nombre de permis de construire", save_carte = TRUE, path_carte = "carteDEP.png", taille_max_rond = 3)
#' 
#' browseURL("carteDEP.png")
#' 
carte_rond_proportionnel <- function(df,
           colonne_code_zone_geo,
           colonne_volume,
           titre_carte = "Carte 1",
           sous_titre_carte = "sous titre de la carte",
           titre_legende_volume = "titre de la legende",
           note_sous_carte = "Lecture : bla bla bla <br> <br> Source : Agreste",
           legend.position = "right",
           zone_geographique = "france",
           niveau_representation = "region_metro",
           couleur_fond_carte = "white",
           couleur_limite_zone = "black",
           taille_limite_zone = 0.3,
           couleur_fond_rond = "#E66A64",
           couleur_contour_rond = "darkgray",
           taille_max_rond = 9,
           hauteur_cm = 8,
           largeur_cm = 8,
           save_carte = FALSE,
           path_carte = "carte.png"
  ) {
  
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

            geom_point(
              aes(size = {{colonne_volume}},
                     geometry = centre,
                     fill = couleur_fond_rond),
              color = couleur_contour_rond,
              stat = "sf_coordinates",
              shape = 21) +

      theme_void() +
      scale_size_area(name = titre_legende_volume, max_size = taille_max_rond, labels = function(x) format(x, big.mark = " ")) +

      labs(title = glue("<b>{titre_carte}</b>"),
           subtitle = glue("<b>{sous_titre_carte}</b>"),
                      caption = note_sous_carte)+
      theme(axis.ticks.y = element_blank(),
            axis.text.y = element_blank(),
            axis.ticks.x = element_blank(),
            axis.text.x = element_blank(),
            plot.title = element_textbox_simple(),
            legend.title = element_markdown(size = hauteur_cm*0.8),
            legend.text = element_markdown(size = hauteur_cm*0.7),
            plot.title.position= 'plot',
            plot.subtitle = element_markdown(size = hauteur_cm*0.8),
            plot.caption = element_markdown(size = hauteur_cm*0.6),
            plot.margin = margin(2,2,1,2),
            legend.position = legend.position)+
      guides(size= guide_legend(order = 1), fill = guide_none())
    
  } else if (niveau_representation == "departement_metro") {
    
    carte <- data_geo %>% 
      left_join(df, by= "code_dep") %>% 
      ggplot() + 

            geom_sf(fill = couleur_fond_carte, 
              color = couleur_limite_zone, 
              size = taille_limite_zone) + 

      geom_point(aes(size = {{colonne_volume}},
                     geometry = centre,
                     fill = couleur_fond_rond,
                     
                     ),
        color = couleur_contour_rond,
        stat = "sf_coordinates",
        shape = 21)+

      theme_void() +
      scale_size_area(name = titre_legende_volume, max_size = taille_max_rond, labels = function(x) format(x, big.mark = " ")) +

      labs(title = glue("<b>{titre_carte}</b>"),
           subtitle = glue("<b>{sous_titre_carte}</b>"),
                      caption = note_sous_carte)+
      theme(axis.ticks.y = element_blank(),
            axis.text.y = element_blank(),
            axis.ticks.x = element_blank(),
            axis.text.x = element_blank(),
            plot.title = element_textbox_simple(),
            legend.title = element_markdown(size = hauteur_cm*0.8),
            legend.text = element_markdown(size = hauteur_cm*0.7),
            plot.title.position= 'plot',
            plot.subtitle = element_markdown(size = hauteur_cm*0.8),
            plot.caption = element_markdown(size = hauteur_cm*0.6),
            plot.margin = margin(2,2,1,2),
            legend.position = legend.position)+
      guides(size= guide_legend(order = 1), fill = guide_none())
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
