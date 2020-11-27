awk	'BEGIN {FS = "[{()}]"}
	/year = / {print $2}' test | sort | uniq -c | cut -c7- > nombreSurPeriode.dat
