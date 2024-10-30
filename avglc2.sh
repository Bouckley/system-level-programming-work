
#!/bin/bash/env bash

lines1=$(wc -l < "$1" | ./triml.sh)
lines2=$(wc -l < "$2" | ./triml.sh)

#Calculating the average lines
linesSum=$((lines1 + lines2))
linesAVG=$((linesSum/2))

#return/print the average
echo "$linesAVG"
