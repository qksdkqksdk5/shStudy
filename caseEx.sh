#!/bin/bash

case "$1" in
	*.txt)
		less "$1"
		;;
	*.sh)
		nano "$1"
		;;
	*)
		echo "not supported file : $1"
		;;
esac
