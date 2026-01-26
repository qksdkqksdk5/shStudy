#!/bin/bash

logdir=~/myapp/logs

if [ -d "$logdir" ]; then
	echo "로그 디렉터리: $logdir"
else
	echo " [ERROR]로그 디렉터리가 존재하지 않습니다."
fi
