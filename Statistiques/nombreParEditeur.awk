awk	'BEGIN {FS = "[{()}]"}
	/publisher = / {print $2}' $nomfich | sort | uniq -c
