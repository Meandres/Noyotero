awk	'BEGIN {FS = "[{\"()}]"}
	/^@/ {print $1}' $nomfich | sort | uniq
