#!/bin/bash

if [ $# -eq 0 ]; then
	echo "Help:"
	echo "./HW2.sh /addr/to/your/path/               -->  list all dirs and files"
	echo "./HW2.sh -o output.txt /addr/to/your/path/ -->  store files and dirs name in output.txt"
	echo "./HW2.sh -z output.tar /addr/to/your/path/ -->  archive *.txt files in . path"
	exit 1
fi

case $1 in
	"-o" )
		if [ $# -ne 3 ]; then
			echo "./HW2.sh -o output.txt /addr/to/your/path/"
			exit 2
		fi

		ls -p $3 | grep / > $2
		ls -p $3 | grep -v / >> $2
		;;

	"-z" )
		if [ $# -ne 3 ]; then
			echo "./HW2.sh -z output.tar /addr/to/your/path/"
			exit 3
		fi

		tar -cvf $2 $3*.txt
		;;

	* )
		Files=$(ls -p $1 | grep -v /)
		Direcs=$(ls -p $1 | grep /)
		echo $Direcs
		echo $Files
		;;
esac

