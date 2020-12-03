#!/bin/bash

regel=0
right=1	#cut does not start at 0
tree=0

tobo(){
	max=$(cat input.txt | wc -l)
	cat input.txt | while read line
	do
		if [ ${regel} -eq 0 ]
		then
			pos=$(echo ${line} | cut -b 1)
			if [ ${pos} == "#" ]
			then
				tree=$((tree+1))
			fi
		else
			if [[ $(( ${regel} % ${2} )) == 0 ]]
			then
				right=$(expr ${right} + ${1})

				if [ ${right} -gt 31 ]
				then
					right=$((right-31))
				fi
		
				pos=$(echo ${line} | cut -b ${right})

				if [ ${pos} == "#" ]
				then
					tree=$((tree+1))
				fi
			fi
		fi 

		regel=$((regel+1))
		
		if [ ${regel} -eq ${max} ]
		then
			echo ${tree}
		fi
	done
}


tobo 3 1

a=$(tobo 1 1)
b=$(tobo 3 1)
c=$(tobo 5 1)
d=$(tobo 7 1)
e=$(tobo 1 2)

echo $((a * b * c * d * e))
