#!/bin/bash

exportPdf(){
	cp modeleLaTeX.tex references.tex
	PligneLue="n"
	while read ligne
	do
		preLet=${ligne:0:1}
		[[ $preLet == % ]] & { echo "comm"; continue; }
		if [[ $preLet == @ ]]; then
			echo "blbl"
			if [ $PligneLue = "n" ]; then
				PligneLue="o"
			else	
				echo '\\hline' > references.tex
				echo '\\end{tabular}' > references.tex
			fi
			echo '\\begin{tabular}{| c | c |}' > references.tex
			echo '\\hline' > references.tex
		else
			IFS="="
			set $ligne
			echo  $1 " & " $2 ' \\\\ \\hline' > references.tex
			IFS=" "
		fi
	done < bd.bib
}

continuer="O"

while [ $continuer = "O" ]
do
	echo "Vers quel format souhaitez-vous exporter (1-2-3) ? (plusieurs choix possibles ex : 1 2)."
	echo "1. Vers un .txt"
	echo "2. Vers un .pdf (en passant par un fichier LaTeX)"
	echo "3. Vers un .html"
	read choix
	dateExport=`date +"%Y%m%d_%Hh%Mm%S"`
	if [[ $choix == *1* ]]; then
		cp bd.bib references$dateExport.txt
	fi
	if [[ $choix == *2* ]]; then
		exportPdf
	fi
	if [[ $choix == *3* ]]; then
		exportHtml	
	fi
done
