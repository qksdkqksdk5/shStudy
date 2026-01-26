#!/bin/bash

for file in "$@"
do
	if [ -d "$file" ]; then
		echo "$file is a dir"
		ls "$file"
	elif [ -f "$file" ]; then
		echo "$file is a file"
		head -n 5 "$file"
	fi
done
