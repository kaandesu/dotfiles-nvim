#!/bin/bash

pid=""
if [ $# -lt 1 ]; then
	echo "Not enough arguments, usage ./vmrss.sh <PID>, enter PID:"
	read -r $pid
else
	pid=$1
fi

if [[ "$pid" == "--help" || "$pid" == "-h" ]]; then
	echo "usage: vmrss [PID]"
	echo "gets the virtual memory size of the process"
	exit 0
fi

result=$(ps -o pid,rss -p "$pid" | tail -n +2 | tr -s " " | cut -d " " -f 2)

if [ "$result" == "" ]; then
	echo "Invalid PID"
	exit 1
fi

echo "[$pid] - $result KB"
