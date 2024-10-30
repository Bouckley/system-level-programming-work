#!/usr/bin/env bash

file=$(realpath $1)

for file in "$@"; do
	#Read file lines into new array
	mapfile -t lines < "$file"

	#Print lines backwards from the new array
	for ((i=${#lines[@]}-1; i>=0; i--)); do
	  echo "${lines[$i]}"
	done
done
