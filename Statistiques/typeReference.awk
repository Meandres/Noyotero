awk	'BEGIN {FS = "[{()}]"}
	/^@/ {print $1}' test | sort | uniq
