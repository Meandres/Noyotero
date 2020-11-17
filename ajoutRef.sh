#!/bin/bash

test -f bd.bib || { echo "Le fichier de la base n'est pas créé. Veuillez commencer par le créer"; exit 0; }
while true
do
	echo "Ajout d'une reférence. Quelle type de réference voulez-vous ajouter ?"
	echo "1. Article\n2. Livre\n3. Petit livre (booklet)\n4. Chapitre\n5. Documentation (manuel)\n"
	echo "6. Mémoire\n7. Autre\n8. Quitter\n"
	read choix
	choix=`echo $choix | tr "[A-Zé]" "[a-ze]"`
	echo $choix
	case $choix in
		1 | "article" )
			choix="article"
			break
			;;
		2 | "livre" )
			choix="livre"
			break
			;;
		3 | "petit livre" )
			choix="petit livre"
			break
			;;
		4 | "chapitre" )
			choix="chapitre"
			break
			;;
		5 | "documentation" )
			choix="documentation"
			break
			;;
		6 | "memoire" )
			choix="memoire"
			break
			;;
		7 | "autre" )
			choix="autre"
			break
			;;
		8 | "exit" | "quit" | "quitter" )
			echo "Fin de l'ajout"
			exit 0
			;;
		* )
			echo "Non reconnu. Veuillez entrer un motif valable.";;
	esac
	./entree.sh $choix
done
