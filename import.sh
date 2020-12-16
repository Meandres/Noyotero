#!/bin/bash

echo "Importation depuis un fichier .xml (nécessite libxml-xpath-perl)"
echo "Entrez le nom du fichier depuis lequel vous voulez importer les references : (sans l'extension)"
read nomfic
LecRef="n"
while read ligne
do
	echo "_"$ligne"_"
	[[ $ligne == *"<reference>"* ]] & { LecRef="o"; echo '@Article {' >> testimport.bib; }
	[[ $ligne == *"</reference>"* ]] & { LecRef="n"; echo '}' >> testimport.bib; }
	echo $LecRef
	if [[ $LecRef == "o" ]]; then
		echo "ligne"
		contenu=`echo $ligne | tr "<>" " "`
		IFS="/"
		set $contenu
		contenu=$1
		echo $contenu | sed "s/ //" | sed "s/ /=/" >> testimport.bib
	fi
done < $nomfic
IFS=" "
