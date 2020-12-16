#!/bin/bash

echo "Importation depuis un fichier .xml (nécessite libxml-xpath-perl)"
echo "Entrez le nom du fichier depuis lequel vous voulez importer les references : (sans l'extension)"
read nomfic
LecRef="n"
while read ligne
do
	[[ $ligne == "<reference>" ]] && { LecRef="o"; echo '@Article {' >> bd.bib; continue; }
	[[ $ligne == *"</reference>" ]] && { LecRef="n"; echo '}' >> bd.bib; continue; }
	if [[ $LecRef == "o" ]]; then
		contenu=`echo $ligne | tr "<>" " "`
		IFS="/"
		set $contenu
		contenu=$1
		echo $contenu | sed "s/ //" | sed "s/ /=\"/" | sed "s/$/\"/g" >> bd.bib
		IFS=" "
	fi
done < $nomfic
IFS=" "
