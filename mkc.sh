#!/usr/bin/env bash

#Exits code if there are no arguments
if [ -z "$1" ]; then
	exit 0
fi
input="$1"

#Takes the input of the user and funnels it into tr (takes all lower characters and replaces with upper characters)
inputUpper=$(echo "$input" | tr '[:lower:]' '[:upper:]')

#Using EOL it includes the text between the EOL lines in the file created
cat <<EOL> "$input.h"
#ifndef ${inputUpper}_H
#define ${inputUpper}_H

#endif
EOL

#By pipiing this to a file that does not exist, it creates it
echo "#include \"$input.h\"" > $input.c
