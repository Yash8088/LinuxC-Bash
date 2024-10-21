#!/bin/bash 

subCount=0
fileCount=0
 


if [ -z "$1" ]; then
	echo -n "Enter Your File/Directory Name "
        read name
else
	name="$1"
fi
      
if [ -d $name ]; then
	if [ ! -r $name ] || [ ! -x $name ]; then
		printf "Warning: You need read and execute permissions\n"
	fi

	for  i in "$name"/*; do
		if [ -d "$i" ]; then
			subCount=$((subCount+1))
		elif [ -f "$i" ]; then
			fileCount=$((fileCount+1))
		fi
	done

	printf "You have '$subCount' SubDirectories\n"
	printf "You have '$fileCount' SubFiles\n"

	ls -lh "$name"

elif [ -f $name ]; then
	echo "'$name' is a file"

	if [ ! -r $name ]; then
		printf "Warning: You dont have read permissions"
	else 
		printf "Line Count: $(wc -l < "$name")\n"
		printf "Word Count: $(wc -w < "$name")\n"
		CharCount=$(wc -m < "$name")
		printf "Character Count: $CharCount\n"

		if [ "$CharCount" -gt 10000 ]; then
			printf "Text Heavy"
		elif [ "$CharCount" -ge 1000 ] && [ "$CharCount" -le 10000 ]; then
			printf "Moderately Sized"
		elif [ "$CharCount" -lt 1000 ]; then
			printf "Light File"
		fi
	fi
else 
	echo "'$name' is not a file or directory."
fi	



