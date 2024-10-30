#!/usr/bin/env bash

source ./Q3.sh

calc() {
    awk "BEGIN { print $*}";
}

#remainder of script goes here

if [[ $# -eq 0 ]]; then
        file='grades'
	echo "USAGE: g4yr.sh yr [gradefile]"
	exit 1
elif [[ $# -eq 1 ]]; then
	file='grades'
elif [[ $# -ge 3 ]]; then
	echo "g4yr.sh: expecting one or two arguments, ignoring extra arguments"
	file="$2"
else
        file="$2"
fi

if [[ ! -f $2 ]]; then
	echo "g4yr.sh: $2 is not a regular file"
	exit 2
elif [[ ! -r $2 ]]; then
	echo "g4yr.sh: grades is not readable"
	exit 2
fi

year="$1"
mapfile -t semester < <(cut -f 2 "$file")
mapfile -t letterGrades < <(cut -f 3 "$file")
total="0"
counter=0

for (( i=0; i < "${#semester[@]}"; i++ )); do
	if [[ "${semester[i]}" == "$year F" ]]; then
		gpa=$(letter2gp "${letterGrades[i]}")
        	if [[ "$gpa" == -1 ]]; then
                	gpa="0"
                else
                        total="$total + $gpa"
                        counter=$(( counter + 1 ))
                fi
	elif [[ "${semester[i]}" == "$(($year+1)) W" ]]; then
		gpa=$(letter2gp "${letterGrades[i]}")
                if [[ "$gpa" == -1 ]]; then
                        gpa="0"
                else
                        total="$total + $gpa"
                        counter=$(( counter + 1 ))
                fi
	elif [[ "${semester[i]}" == "$(($year+1)) S" ]]; then
		gpa=$(letter2gp "${letterGrades[i]}")
                if [[ "$gpa" == -1 ]]; then
                        gpa="0"
                else
                        total="$total + $gpa"
                        counter=$(( counter + 1 ))
                fi
        fi
done

if [[ $counter -ne 0 ]]; then
	calc "($total) / $counter"
fi
