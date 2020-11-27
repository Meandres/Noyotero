awk	'BEGIN {FS = "[{()}]"}
	/publisher = / {print $2}' test | sort | uniq -c
