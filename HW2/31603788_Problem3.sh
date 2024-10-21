#!/bin/bash
# problem 3

:
function traverse()
{
	echo $1

	if [ ! -d "$1" ]
	then 
		return
	fi
	if [ `ls "$1" | wc -l` -eq 0 ]
	then
		return
	fi

	local id=("$1"/*)
	local ids

	unique="unique_emails.txt"

	for ids in "${id[@]}"
	do
		if [ -d "$ids" ]
		then
			traverse "$ids"
		elif [ -f "$ids" ] && [[ "$ids" == *.txt ]]
		then
			grep -Eo '[^@[:space:]]+@[a-zA-Z]+\.[a-zA-Z]+' "$ids" >> "$unique" 
		fi
	done
	
	sort -u "$unique" -o "$unique"
}
traverse "$1"

