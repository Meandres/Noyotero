awk -v a="$nomfich"	'BEGIN {FS = "[{()}]"}
	/author = / {print $2}' $nomfich | sort | uniq -c
