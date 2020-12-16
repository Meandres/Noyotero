#!/bin/bash

while true
do
	echo "*** Menu Principal ***"
	echo "1. Creation d'une base"
	echo "2. Changement de base"
	echo "3. Ajouter une reference à la main"
	echo "4. Importer des references depuis un fichier (xml)"
	echo "5. Exporter la base vers un autre fichier"
	echo "6. Faire des statistiques"
	echo "7. Quitter"
	echo "Veuillez saisir votre choix."
	read choix
	case $choix in
		"1")
			./creation.sh
		;;
		"2")
			./changement.sh
		;;
		"3")
			./ajoutRef.sh
		;;
		"4")
			./import.sh
		;;
		"5")
			./export.sh
		;;
		"6")
			./Statistiques/menu.sh
		;;
		"7")
			exit 0;
		*)
	esac
done
