#!/bin/bash

choix=$1
ecrire="@$choix{\n"
set `cat champsNecessaires.txt | grep $choix`
shift
champsPossibles=`cat champsPossibles.txt`
for champ in $*
do
	champsNecessaires[$champ]=0
done
echo "Vous pouvez quitter à tout moment en entrant quit ou exit."
continuer="O"
while [ $continuer = "O" ]
do
	echo "blbl"
	echo "Veuillez entrer le nom du champ."
	read champ		
	echo "Veuillez entrer le contenu du champ."
	read contenu

	[ $champ="quit" -o $champ="exit" ] && exit 0
	if [ $champsPossibles = *$champ* ] then
		ecrire=$ecrire + "$champ = $contenu"
		#[ $champ in $* ] && champsNecessaires[$champ]=1
	else
		echo "Le champ que vous avez entré n'est pas valide."
	fi
	correct="true"
	for champ in $*
	do
		[ champsNecessaires[$champ] -eq 0 ] && correct="false"
	done
	if [ $correct = "true" ] then
		echo "Tout les champs nécessaires ont été remplis. Voulez-vous continuer (O/n) ?"
		read continuer
	fi
done
echo $ecrire
