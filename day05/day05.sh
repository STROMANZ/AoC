#!/bin/bash

seats=$(cat input.txt | while read line
do
	line=$(sed -e 's,[F|L],0,g' -e  's,[B|R],1,g' <<< ${line})
	row=$(echo ${line} | cut -b -7)
	row=$((2#${row}))
	column=$(echo ${line} | cut -b 8-)
	column=$((2#${column}))
	seatID=$((${row} * 8 + ${column}))
	echo ${seatID}
done)

high=$(echo ${seats} | tr " " "\n" | sort -nr | head -1)
echo ${high}

for i in `seq 2 ${high}`
do
	echo ${seats} | tr " " "\n" | grep -q ${i} || echo ${i}
done

