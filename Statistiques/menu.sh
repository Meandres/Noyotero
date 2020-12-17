#!/bin/bash

choix=("Le nombre de références par auteur" "Le nombre de références par éditeur" "Le nombre de références par type" "Le nombre de références sur une période" "Les types de références disponibles" "Choix du fichier" "Quitter")
nomfich="fichier"
export nomfich
PS3='Choisissez une option : '
select script in "${choix[@]}"
do
	case $script in
		"Le nombre de références par auteur")
			./Statistiques/nombreParAuteur.awk
		;;
		"Le nombre de références par éditeur")
			./Statistiques/nombreParEditeur.awk
		;;
		"Le nombre de références par type")
			./Statistiques/nombreParType.awk
		;;
		"Le nombre de références sur une période")
			read -p 'Donnez l`année inférieure : ' n1
			if [[ "$n1" =~ ^[0-9]+$ ]] ; 
 			then 	export n1
				read -p 'Donnez l`année supérieure : ' n2
				if [[ "$n2" =~ ^[0-9]+$ ]] ; 
 				then	export n2
					./Statistiques/nombreSurPeriode.awk
					./Statistiques/periodeAvecGraphe.sh
				fi
			fi
		;;
		"Les types de références disponibles")
			./Statistiques/typeReference.awk
		;;
		"Choix du fichier")
			read -p 'Donnez le nom du fichier à utiliser : ' nomfich
			export nomfich
		;;
		"Quitter")
			break
		;;
		*) echo "Erreur, le choix n°$REPLY est erroné"
		;;
	esac
done
