#!/bin/bash

champEntre(){
	str=`cat tmp | grep $1`
	c=${str:0:${#str}-1}
	if [ -n "$str" ]; then
		echo "Champ nécessaire reconnu"
		set `cat tmp | grep -v $1`
		cat /dev/null > tmp
		for ligne in $*
		do
			echo $ligne >> tmp
		done
		echo "$c""1" >> tmp
	fi
}
verifierChamp(){
	valide=0
	while read ligne
	do
		[[ $ligne == *"0" ]] && { valide=1; break; }
	done < tmp
}

choix=$1
ecrire="@$choix{\n"
champsNecessaires=`cat champsNecessaires.txt | grep ^$choix`
champsPossibles=`cat champsPossibles.txt`
cat /dev/null > tmp
for champ in $champsNecessaires
do
	[ $champ != $choix ] && echo -e "$champ""0" >> tmp
done

echo "Vous pouvez quitter à tout moment en entrant quit ou exit."
continuer="O"
while [ $continuer = "O" ]
do
	echo "Veuillez entrer le nom du champ."
	read champ
	[[ $champ = "quit" || $champ = "exit" ]] && exit 0
	if [[ $champsEntres == *"$champ"* ]]; then
		echo "Vous avez déjà renseigné ce champ."
	else
		champsEntres+=$champ
		echo "Veuillez entrer le contenu du champ."
		read contenu
		if [[ $champsPossibles == *"$champ"* ]]; then
			echo "Champ reconnu"
			ecrire+="\t$champ\t$contenu\n"
			champEntre $champ
		else
			echo "Le champ que vous avez entré n'est pas valable."
		fi
	fi
	verifierChamp
	echo ""
	if [ $valide -eq 0 ]; then
		echo "Tout les champs nécessaires ont été remplis. Voulez-vous continuer (O/n) ?"
		read continuer
	fi
done
rm tmp
echo -e $ecrire >> bd.bib
