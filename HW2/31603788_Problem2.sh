#!/bin/bash 
#Problem 1

#!/bin/bash

if [ $# -ne 1 ]; then
        echo "No arguments"
        exit 1
fi

cfile="$1"

if [ ! -f "$cfile" ]; then
        echo "Not a file"
        exit 1
fi

totalcount=$(wc -l < "$cfile")

grep '(scanf)' "$cfile" >> scanf_log.txt

grep '(printf)' "$cfile" >> printf_log.txt


scanfcount=$(grep 'scanf' "$cfile" | wc -l)
printfcount=$(grep 'printf' "$cfile" | wc -l)

echo "Total lines in file: $totalcount"
echo "Lines with scanf: $scanfcount"
echo "Lines with printf: $printfcount"

scanfpercent=$(echo "scale=2; ($scanfcount/$totalcount)*100" | bc)
printfpercent=$(echo "scale=2; ($printfcount/$totalcount)*100" | bc)

#scanfpercent=($totalcount/$scanfcount)*100 | bc 
#printfpercent=($totalcount/$printfcount)*100 | bc
echo "The percent of files containing scanf is: $scanfpercent%"
echo "The percent of files containing printf is: $printfpercent%"
