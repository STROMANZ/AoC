#!/bin/bash

cat input.txt | awk 'BEGIN { RS = ""; OFS = " "} {$1 = $1; print }' | \
while read line
do
	line=$(echo ${line} | tr " " "\n" | sort | tr "\n" " ")
	awk '/byr:/ && /iyr:/ && /eyr:/ && /hgt:/ && /hcl:/ && /ecl:/ && /pid:/' <<< ${line}
done | wc -l

cat input.txt | awk 'BEGIN { RS = ""; OFS = " "} {$1 = $1; print }' | \
while read line
do
        line=$(echo ${line} | tr " " "\n" | sort | tr "\n" " ")
	echo ${line} | sed -Ern '/^byr:(19[2-9][0-9]|200[0-2]).*ecl:(amb|blu|brn|gry|grn|hzl|oth)\ eyr:(202[0-9]|2030)\ hcl:(#[0123456789abcdef]{6})\ hgt\:((1[5-8][0-9]|19[0-3])cm|(59|6[0-9]|7[0-6])in)\ iyr\:(201[0-9]|2020)\ pid:([0-9]{9})$/p' 
done | wc -l
