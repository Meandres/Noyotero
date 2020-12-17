awk -v a="$n1" -v b="$n2" 'BEGIN {FS = "[{\"()}]"}
	{if($1 ~ "year" && $2 >= a && $2 <= b) print $2}' $nomfich | sort | uniq -c | cut -c7- > nombreSurPeriode.dat
