#!/bin/bash

if [ "$#" -lt 3 ]; then
        echo "Error: You dont have 3 filenames provided"
	exit 1
else
	files=("$@")
fi

time=$(date +"%Y%m%d")
backup_dir="backup_$time"
mkdir -p "$backup_dir"

log=()
       
for i in "${files[@]}"; do
	if [ ! -e "$i" ]; then
		printf "Error no file '$i'"
		continue
	fi

	cp "$i" "$backup_dir/"
	
	filename="$(basename "$i")_$time"
	mv "$backup_dir/$(basename "$i")" "$backup_dir/$filename"

	log+=("$(basename "$i") -> $filename")
done

log="$backup_dir/backup_log.txt"
{
	echo "Backup Log - $(date)"
	echo "---------"
	for entry in "${log[@]}"; do
		echo "$entry"
	done
} > "$log"

echo "DONE" 





