#!/bin/bash

choix=("Le nombre de références par auteur" "Le nombre de références par éditeur" "Le nombre de références par type" "Le nombre de références sur une période" "Les types de références disponibles" "Quit")

PS3='Choisissez une option : '
select script in "${choix[@]}"
do
	case $script in
		"Le nombre de références par auteur")
			./nombreParAuteur.awk
		;;
		"Le nombre de références par éditeur")
			./nombreParEditeur.awk
		;;
		"Le nombre de références par type")
			./nombreParType.awk
		;;
		"Le nombre de références sur une période")
			read -p 'Donnez l`année inférieur : ' n1
			if [[ "$n1" =~ ^[0-9]+$ ]] ; 
 			then 	export n1
				read -p 'Donnez l`année supérieur : ' n2
				if [[ "$n2" =~ ^[0-9]+$ ]] ; 
 				then	export n2
					./nombreSurPeriode.awk
					./periodeAvecGraphe.sh
				fi
			fi
		;;
		"Les types de références disponibles")
			./typeReference.awk
		;;
		"Quit")
			break
		;;
		*) echo "Erreur, le choix n°$REPLY est erroné"
		;;
	esac
done
