# agreste 0.3.0

- Interface graphique Shiny pour créer un plan de formatage, et utiliser 
la fonction `creer_excel_depuis_plan` par un bouton

# agreste 0.2.9

- Formatage des lignes de niveaux différents de précision (jusqu'à 4)
- Résolution de bugs concernant le formatage des nombres décimaux inférieurs à 1
- Ajout de la possibilité de fusionner des cellules par le plan
- Ajout d'une fonction `read_any_file()` qui permet de lire un fichier de type `csv`, `tsv`, `xlsx`, `Rds`, `parquet`, ou un objet `data.frame`

# agreste 0.2.8

- Ajout d'une fonction `taille_colonnes()` pour appliquer une taille de colonnes
pour respecter les consignes de la PAO (taille max du tableau de 89)
- Ajout de messages d'erreur clairs en cas de mauvais paramètres rentrés
- Formatage des lignes de section, sous-total, précision, total

# agreste 0.2

- ajout d'un Addin pour lancer l'app Shiny de formatage

# agreste 0.11

- Ajout de la fonction `app_formatage()` pour utiliser le package par une interface graphique.

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
