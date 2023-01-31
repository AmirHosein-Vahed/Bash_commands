#!/bin/bash

if [ $# -ne 4 ]; then
	echo "./script.sh -l /path/to/location -e extension"
	exit 1
fi

if [ $1 != "-l" ] || [ $3 != "-e" ]; then
	echo "./script.sh -l /path/to/location -e extension"
	exit 2
fi

loc=$2
ext=$4

count=$(ls $loc | grep .$ext | awk 'END{print NR}')
size=$(ls -l $loc | grep .$ext | awk 'BEGIN{size=0} {size += $5} END{print size/1024/1024 " Mb"}')

echo "Directory : " $loc
echo "Count of all $ext File : " $count
echo "Size of all $ext file in $loc : " $size
