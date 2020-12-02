#!/bin/bash

numbs=$(cat input.txt)

sum2020=$(for nr in ${numbs}
do
	grep ^$(expr 2020 - ${nr})$ <<< ${numbs}
done)

a=$(echo ${sum2020} | awk '{print $1}')
b=$(echo ${sum2020} | awk '{print $2}')
echo $((a * b))

for k in ${numbs}
do
	for l in ${numbs}
	do
		for m in ${numbs}
		do
			sum=$((k + l + m))
			if [ ${sum} -eq 2020 ]; then
				prod=$((k * $l *$m))
				echo "${prod}"
				exit
			fi
		done
	done
done
