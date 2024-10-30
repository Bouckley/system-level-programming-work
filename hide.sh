#!/usr/bin/env bash

#Checks if there's an argument
if [ "$#" -ne 1 ]; then
	echo "Usage: hide.sh FILE"
	exit 1

else	#This prompts the user if the file already exists, otherwise it doesn't 
	if [ -e "$(dirname $1)"/."$(basename $1)" ]; then
		mv -i "$1" "$(dirname $1)"/."$(basename $1)"

	else
		mv "$1" "$(dirname $1)"/."$(basename $1)"
	fi
fi

