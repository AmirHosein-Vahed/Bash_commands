#!/bin/bash

if [ $# -lt 2 ]; then
	echo "you must sent 2 arguments"
	exit 1
fi

comm=$1
ext=$2

case "$comm" in
	"-c" | "--count" )
		ls *.$ext | awk 'END{print NR}'
		;;
		
	"-s" | "--size" )
		ls -l *.$ext | awk 'BEGIN{size=0} {size += $5} END{print size/1024/1024 " Mb"}'
		;;
		
	"-table" )
		tableName=$ext
		echo "" > $tableName.txt
		for file in $(ls *.txt)
		do
			echo $file " " $(cat $file | wc -w) >> $tableName.txt
		done
		;;
		
	"-z" | "--zip" )
		name=$(date +%y-%m-%d)
		tar -cvf $name.tar . *.$ext
		if ! [ -d "/home/backup" ]; then
			sudo mkdir /home/backup
		fi

		sudo mv $name.tar /home/backup
		;;
	* )
		echo "command must be in : -c|--count , -s|--size , -table , -z|--zip"
		echo "command $comm not found"
		exit 3
		;;
esac
