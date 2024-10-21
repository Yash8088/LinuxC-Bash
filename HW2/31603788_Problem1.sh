#!/bin/bash 
#Problem 1

#1.

grep -Ei '(a[^a]*){3,}' dictionary.txt | wc -l

# ^a at the beginning because we dont want aaaa to only match aaa 


#2.

grep -Ei '(e[^e]+){3}' dictionary.txt | wc -l 

# + sign needed, 1 or more required. in this instance
# 1 or more occurence of not Ee is required after each Ee

#3. 

grep -E 'e{2}' dictionary.txt | grep -o '.\{4\}$' | sort | uniq -c | sort -nr | head -n 3

#sort sorts in alphabetical order
#uniq will filter out dupes, but add numerical count -c
#sort -nr, -n sort numerically, -r reverse order highest to lowest
#head -n 3 only give me the first 3 lines

