#!/bin/bash

echo "Importation depuis un fichier .xml (nécessite libxml-xpath-perl)"
echo "Entrez le nom du fichier depuis lequel vous voulez importer les references : (sans l'extension)"
read nomfic
[ ! $nomfic -f ] & { echo "Le nom que vous avez entré n'est pas valide."; exit 0; }
LecRef="n"
while read ligne
do
  [[ $ligne == "<reference>" ]] & { LecRef="o"; echo '@Article {' >> bd.bib; }
  [[ $ligne == "</reference>" ]] & { LecRef="n"; echo '}' >> bd.bib; }
  if [[ $LecRef == "o" ]]; then
    contenu=`echo $ligne | tr "<>" " "`
    IFS="/"
    set $contenu
    contenu=$1
    echo $contenu | sed "s/ //" | sed "s/ /=/" >> bd.bib
  fi
done < $nomfic
IFS=" "
