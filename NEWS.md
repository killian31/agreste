# agreste 1.2.0
- ajout de barres de progression dans la console pour suivre l'avancement du 
formatage
- messages d'erreur utilisateur plus clairs et plus précis

# agreste 1.1.4
- correction de bugs affectant l'écriture des données

# agreste 1.1.3
- ajout d'une option pour permettre aux tableaux de dépasser la largeur maximale 
de 83
- possibilité d'utiliser des tableaux de données au format `.ods`
- possibilité de formater des lignes en italique
- correction d'un bug sur le bouton de validation de l'ordre des tableaux dans 
l'interface

# agreste 1.1.2
- Correction de bugs sur l'import de fichiers Rds

# agreste 1.1.1
- refonte avec page d'accueil accueillante
- correction d'une erreur dans la largeur max des tableaux

# agreste 1.1.0
- Ajout d'un sommaire avec chapitres et sous-chapitres
- Première version entièrement fonctionnelle de l'appli

# agreste 1.0.2
- Choix du dossier contenant les fichiers de données à formater
- Ajout de messages utilisateur clairs dans l'interface graphique

# agreste 1.0.1
- Possibilité d'importer un plan dans l'app Shiny, de l'éditer et de formater 
directement ses tableaux

# agreste 0.3.0

- Interface graphique Shiny pour créer un plan de formatage, et utiliser 
la fonction `creer_excel_depuis_plan` par un bouton

# agreste 0.2.9

- Formatage des lignes de niveaux différents de précision (jusqu'à 4)
- Résolution de bugs concernant le formatage des nombres décimaux inférieurs à 1
- Ajout de la possibilité de fusionner des cellules par le plan
- Ajout d'une fonction `read_any_file()` qui permet de lire un fichier de type 
`csv`, `tsv`, `xlsx`, `Rds`, `parquet`, ou un objet `data.frame`

# agreste 0.2.8

- Ajout d'une fonction `taille_colonnes()` pour appliquer une taille de colonnes
pour respecter les consignes de la PAO (taille max du tableau de 89)
- Ajout de messages d'erreur clairs en cas de mauvais paramètres rentrés
- Formatage des lignes de section, sous-total, précision, total

# agreste 0.2

- ajout d'un Addin pour lancer l'app Shiny de formatage

# agreste 0.11

- Ajout de la fonction `app_formatage()` pour utiliser le package par une 
interface graphique.

# agreste 0.1

Les fonctions suivantes ont été ajoutées :

-   ajouter_champ()
-   ajouter_note_lecture()
-   ajouter_source()
-   ajouter_tableau_excel()
-   ajouter_titre_tableau()
-   carte_aplat()
-   carte_rond_proportionnel()
-   creer_excel_depuis_plan()
-   creer_liste_style_excel()
-   donnees_fond_carte()
-   formater_auto()
-   geler()

# agreste 0.0.0.9000

-   Ajout de `NEWS.md` pour suivre les changements du package.
