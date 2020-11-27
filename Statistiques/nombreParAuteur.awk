awk	'BEGIN {FS = "[{()}]"}
	/author = / {print $2}' test | sort | uniq -c
