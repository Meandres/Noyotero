#!/usr/bin/gnuplot
set terminal png size 800,600
set output 'graphe_periode.png'
set datafile separator " "

set title "Publications en fonction de l'année"

set xlabel "Années"

set ylabel "Nombre de publications"
set ytics 1
set yrange [ 0 : ]

#Definition du graphe en barre
set boxwidth 0.5
set style fill solid

set key off
set grid

show variables

plot 'nombreSurPeriode.dat' using 2:1 with boxes
