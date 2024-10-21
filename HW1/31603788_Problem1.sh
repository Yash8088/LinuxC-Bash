printf "Welcome to Rock Paper Scissors: \n
3b. Scissors beat paper (by cutting it). \n
3c. paper beats rock (by covering it). \n\n"

win=0
while [ "$win" -eq 0 ]
do
	echo -n "Enter Your Move (rock paper or scissors): "
	read move
	compMove=$((RANDOM % 3))

	if [ "$move" == "rock" ]; then
        	move=0
	elif [ "$move" == "paper" ]; then
        	move=1
	elif [ "$move" == "scissors" ]; then
        	move=2
	else
        	echo "invalid"
		continue
	fi

	if [ "$compMove" -eq 0 ]; then
        	echo "computer picks rock"
	elif [ "$compMove" -eq 1 ]; then
        	echo "computer picks paper"
	elif [ "$compMove" -eq 2 ]; then
        	echo "computer picks scissors"
	fi





	if [ "$move" -eq "$compMove" ]; then
        	echo "tie"

	elif [ "$move" -eq "0" ] && [ "$compMove" -eq "1" ]; then
        	echo "computer wins"
		win=1
	elif [ "$move" -eq "1" ] && [ "$compMove" -eq "2" ]; then
       		echo "computer wins"
		win=1
	elif [ "$move" -eq "2" ] && [ "$compMove" -eq "0" ]; then
        	echo "computer wins"
		win=1
	else
        	echo "You Win"
		win=1
	fi
done

check_directory() {
	dir="$1"

	if [ -r "$dir" ] && [ -x "$dir" ]; then

		file_count=$(find "$dir" -type f | wc -l)
		subdir_count=$(find "$dir" -type d | wc -l)

		echo "Directory '$dir' contains:"
		echo "$file_count files"
		echo "subdir_count subdirectories"

		echo "Contents of '$dir':"
		ls -lh "$dir"
	else 
		echo "Warning: You do not have read and/or execute permissions on the directory '$dir'Here's a Bash script that performs all the steps as outlined:

```bash
#!/bin/bash

# Function to check directory permissions and list contents
check_directory() {
    dir="$1"

    # Check read and execute permissions
    if [ -r "$dir" ] && [ -x "$dir" ]; then
        # Count the number of files and subdirectories
        file_count=$(find "$dir" -type f | wc -l)
        subdir_count=$(find "$dir" -type d | wc -l)

        echo "Directory '$dir' contains:"
        echo "$file_count files"
        echo "$subdir_count subdirectories"

        # List files and subdirectories with sizes
        echo "Contents of '$dir':"
        ls -lh "$dir"
    else
        echo "Warning: You do not have read and/or execute permissions on the directory '$dir'."
    fi
}



