#!/bin/bash
# Problem 4

currYear=2024

file="HW2test4.txt"

if [ ! -f "$file" ]
then
	echo "File does not exist!"
	exit 3
fi

sed -nE 's/^([^,]+), ([0-9]{4}-[0-9]{2}-[0-9]{2}), ([^,]+ [^,]+), .*/\1,\2,\3/p' "$file" | \


while IFS=, read -r name dob city
do
	if [[ "$city" =~ [[:space:]] ]]
	then
		year=$(echo "$dob" | cut -d '-' -f 1)
		age=$((currYear - year))
		echo "$name: $age"
	fi
done | sort -t ':' -k2 -nr
