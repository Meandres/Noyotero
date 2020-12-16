#!/bin/bash

exportPdf(){
	cp modeleLaTeX.tex references.tex
	while read ligne
	do
		if [[ $ligne == @* ]]; then
			echo '\section{}' >> references.tex
		else
			if [[ $ligne == '}' ]]; then continue
			fi
			contenu=`echo "$ligne" | sed 's/_/$\\\_$/g'`
			echo  $contenu '\\' >> references.tex
		fi
	done < bd.bib
	echo '\end{document}' >> references.tex

	pdflatex references.tex > /dev/null
	mv references.pdf references$1.pdf
	rm references.*
}

exportHtml(){
	cp modeleHtml.html references$1.html
	PLigneLue="n"
	while read ligne
	do
		if [[ $ligne == @* ]]; then
			if [[ $PLigneLue == "n" ]]; then
				PLigneLue="o"
			else
				echo '</p>' >> references$1.html
			fi
			echo '<p>' >> references$1.html
		else
			if [[ $ligne == '}' ]]; then continue
			fi
			echo  $ligne '<br>' >> references$1.html
		fi
	done < bd.bib
	echo '</body>' >> references$1.html
	echo '</html>' >> references$1.html

}

continuer="O"

while [ $continuer = "O" ]
do
	echo "Vers quel format souhaitez-vous exporter (1-2-3) ? (plusieurs choix possibles ex : 1 2)."
	echo "1. Vers un .txt"
	echo "2. Vers un .pdf (en passant par un fichier LaTeX, nécessite pdflatex)"
	echo "3. Vers un .html"
	echo "4. Quitter"
	read choix
	dateExport=`date +"%Y%m%d_%Hh%Mm%S"`
	if [[ $choix == *1* ]]; then
		cp bd.bib references$dateExport.txt
	fi
	if [[ $choix == *2* ]]; then
		exportPdf $dateExport
	fi
	if [[ $choix == *3* ]]; then
		exportHtml $dateExport
	fi
	if [[ $choix == 4 ]]; then
		continuer="n"
	fi
done
