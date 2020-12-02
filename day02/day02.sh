#!/bin/bash

check_count(){
	true_count=0
	min=$(echo ${1} | awk -F\- '{print $1}')
	max=$(echo ${1} | awk -F\- '{print $2}')
	letter=$(echo ${2} | awk -F\: '{print $1}')
	true_count=$(echo ${3} | sed 's,\r\n$,,' | sed 's/\(.\)/\1\n/g' | sort | uniq -c | grep ${letter} | awk '{print $1}')
	if [ ! -z ${true_count} ]; then
		if [[ ${true_count} -ge ${min} && ${true_count} -le ${max} ]]; then
			echo valid
		fi
	fi
}

check_pos(){
	first_letter=""
	second_letter=""
	first=$(echo ${1} | awk -F\- '{print $1}')
	second=$(echo ${1} | awk -F\- '{print $2}')
	letter=$(echo ${2} | awk -F\: '{print $1}')
	first_letter=$(echo ${3} | cut -b ${first})
	second_letter=$(echo ${3} | cut -b ${second})

	if [ ${first_letter} == ${second_letter} ]; then
		return 1
	fi

	if [ ${first_letter} == ${letter} ]; then
		echo valid
		return 0
	fi

	if [ ${second_letter} == ${letter} ]; then
		echo valid
		return 0
	fi
}

ans1=$(cat input.txt | while read line
do
	check_count ${line}
done | wc -l)

ans2=$(cat input.txt | while read line
do
        check_pos ${line}
done | grep ^valid | wc -l)


echo ${ans1}
echo ${ans2}
