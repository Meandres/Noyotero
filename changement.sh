#! /bin/bash
echo "Changement de la base en cours."
test -e bd.bib || { echo "La base n'existe pas. Commencez par la créer."; exit 0; }
echo "Veuillez indiquer un nouveau nom pour le fichier de la base actuelle."
read nvnom
while [[ -e nvnom ]]
do
	read -p "Le nom que vous avez choisi est déjà utilisé. Veuillez en choisir un autre." nvnom
done
mv bd.bib $nvnom
touch bd.bib; chmod u+w bd.bib; echo "%Base de donnée de réferences BibTex">bd.bib;
echo "La nouvelle base a bien été créée.";
