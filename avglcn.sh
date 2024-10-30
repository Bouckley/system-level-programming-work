#!/usr/bin/env bash

#Error Checking
if [ "$#" -eq 0 ]; then
	echo "Usage: avglcn.sh FILE1 [FILE]..." 
	exit 1
fi

#Getting number of lines and last line to find the total files and average lines
linesSum=$(wc -l "$@" | tail -n 1 | ./triml.sh | cut -d ' ' -f 1)
totalFiles=$#
linesAVG=$((linesSum/totalFiles))

echo "$linesAVG"
