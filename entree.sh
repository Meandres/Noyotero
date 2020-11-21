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
	echo "Veuillez entrer le nom du champ."
	read champ		
	echo "Veuillez entrer le contenu du champ."
	read contenu
	echo $champsPossibles " " $champ
	grep $champ <<< $champsPossibles
	[ $champ="quit" -o $champ="exit" ] && exit 0
	if grep -q "$champ" <<< $champsPossibles; then
		echo "champ reconnu"
		ecrire+="\t $champ \t $contenu \n";
		[ $champ in ${!champsNecessaires[*]} ] && champsNecessaires[$champ] = 1 
	else
		"Le champ que vous avez entré n'est pas valable."
	fi
	correct="true"
	for requis in ${champsNecessaires[*]}
	do
		[ requis -eq 0 ] && correct="false"
	done
	if [ $correct = "true" ]; then
		echo "Tout les champs nécessaires ont été remplis. Voulez-vous continuer (O/n) ?"
		read continuer
	fi
done
echo $ecrire
