#! /bin/bash
choix=O
echo "Création de la base en cours."
test -f bd.bib && 
{ echo "Une base existe déjà. Voulez-vous la remplacer (O/n ? (cela effacera son contenu).";
read choix; }
[[ $choix != O ]] && { echo "Annulation"; exit 0; }

touch bd.bib; chmod u+w bd.bib; echo "%Base de donnée de reférences BibTex">bd.bib; echo "La base a bien été créée"
