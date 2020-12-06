#!/bin/bash

yes=0

while read line
do
	line=$(echo ${line} | tr " " "\n" | sort | tr "\n" " ")
	answers=$(echo ${line} | sed -e 's/[^a-z ]//g' | sed 's,\ ,,g' | sed 's/\(.\)/\1\n/g'  | sed 's,\ ,,g' | sort | uniq )
	ans_yes=$(echo ${answers} | sed 's,\ ,,g' | wc -m)
	yes=$((yes + ans_yes - 1))
done <<< $(cat -b input.txt | awk 'BEGIN { RS = ""; OFS = " "} {$1 = $1; print }' )  && echo ${yes}

yes=0
while read line
do
	line=$(echo ${line} | tr " " "\n" | sort | tr "\n" " ")
	unique_id=$(echo ${line} | sed -e 's/[^0-9 ]//g')
	group_size=$(echo ${unique_id} | wc -w)
	answers=$(echo ${line} | sed -e 's/[^a-z ]//g' | sed 's,\ ,,g' | sed 's/\(.\)/\1\n/g'  | sed 's,\ ,,g' | sort | uniq -c )
	echo ${answers} | sed 's,^..\(.*\),\1,' | sed 's,\([a-z]\),\1\n,g' | awk '{print $1}' | while read count
	do
		if [[ ! -z ${count} && ${count} -eq ${group_size} ]]
		then
			echo yes
		fi
	done
	
done <<< $(cat -b input.txt | awk 'BEGIN { RS = ""; OFS = " "} {$1 = $1; print }' ) | wc -l
