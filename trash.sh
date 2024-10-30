#!/usr/bin/env bash

if [ "$#" -eq 0 ]; then
	exit 0
fi

if [ ! -f "$1" ]; then
	echo "trash.sh: cannot remove a non-regular file"
	exit 1

else
	relDir=$(dirname "$(realpath --relative-to=$HOME $1)")

	if [[ "$(echo $relDir | cut -d "/" -f 2)" != ".." ]]; then
		
		if [[ -w $HOME/$relDir ]] && [[ -x $HOME/$relDir ]]; then

			if ! [[ -d $HOME/.trash/$relDir ]]; then
				mkdir -p $HOME/.trash/$relDir
			fi

			mv $1 $HOME/.trash/$relDir/"$(basename $1)"

		else
			echo "trash.sh: directory missing write and/or execute permission"
			exit 3
		fi
	
	else
		echo "trash.sh: cannot remove a file not found below $HOME"
		exit 2
	fi
fi

