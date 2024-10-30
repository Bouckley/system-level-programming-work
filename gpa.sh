#!/usr/bin/env bash

source ./Q3.sh

calc() { 
    awk "BEGIN { print $*}"; 
}

#remainder of script goes here

if [[ $# -eq 0 ]]; then
	file='grades'
else
	file="$1"
fi

letterGrades=($(cut -f 3 "$file"))
total="0"
counter=0

for line in "${letterGrades[@]}"; do
	gpa=$(letter2gp "$line")
       	if [[ "$gpa" == -1 ]]; then
		gpa="0"
	else
		
		total="$total + $gpa"
		counter=$(( counter + 1 ))
	fi
done

calc "($total) / $counter"
