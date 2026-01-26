#!/bin/bash

num=$1
if [ "$num" -gt 3 ] && [ "$num" -lt 6 ]; then
	echo "num > 3 and num < 6"
fi
