#!/bin/bash 

echo -n "Enter Your Directory Name "
read directory

if [ ! -e "$directory" ]; then
	mkdir "$directory"
	echo "Created '$directory'"
else
	cd "$directory"
	echo "Went into '$directory'"
fi


ls -h

echo -n "Enter Your Directory/File Name "
read name

lineNum=0

max=$(wc -l < "$name")

if [ -f "$name" ]; then
	while true; do
	        head -n $((lineNum + 10)) "$name" | tail -n 10
		lineNum=$((lineNum + 10))

		if [ "$lineNum" -ge "$max" ]; then
			echo "EOF"
			break
		fi

		echo -n "Do you want to display more (Y/N): "
		read response

		if [ ! response -eq "Y" ]; then
			break
		fi

	done
elif [ -d "$name" ]; then
	cd "$name"
	queue=("$PWD") 
	modified_files=()

	while [ ${#queue[@]} -ne 0 ]; do
        	current_dir="${queue[0]}"
        	queue=("${queue[@]:1}")  # Remove the first element

        	# Loop through files in the current directory
        	for file in "$current_dir"/*; do
            		if [ -f "$file" ]; then
                	# Check if the file has been modified in the last 24 hours
                		if [ $(( $(date +%s) - $(stat -c %Y "$file") )) -le 86400 ]; then
                    			modified_files+=("$file")
                		fi
            		fi
        	done

        	# Add subdirectories to the queue
        	for subdir in "$current_dir"/*; do
            		if [ -d "$subdir" ]; then
                		queue+=("$subdir")
            		fi
        	done
    	done

	# Present the list of modified files to the user
    	if [ ${#modified_files[@]} -eq 0 ]; then
        	echo "No files modified in the last 24 hours."
    	else
        	echo "Files modified in the last 24 hours:"
        	for i in "${!modified_files[@]}"; do
            		echo "$((i + 1)). ${modified_files[$i]}"
        	done

        	echo -n "Select a file number to view: "
        	read file_selection
		selectedfile=${modified_files[$((file_selection - 1))]}
		lineNum=0
		max=$(wc -l < "$selected_files")

        	while true; do
                	head -n $((lineNum + 10)) "$selected_files" | tail -n 10
                	lineNum=$((lineNum + 10))

                	if [ "$lineNum" -ge "$max" ]; then
                        	echo "EOF"
                       		break
               		fi

                	echo -n "Do you want to display more (Y/N): "
                	read res

                	if [ ! res -eq "Y" ]; then
                        	break
                	fi

       	 	done

    	fi
fi





