#!/bin/bash

addr=$1

if [ ! -f $addr ] && [ ! -d $addr ]; then
	echo "your address not exist"
	exit 1
fi

if [ $# -eq 0 ]; then
	addr=$(pwd)
fi

tar -cvf file.tar $addr

if [ ! -d "/home/backup" ]; then
	sudo mkdir /home/backup
fi

sudo mv file.tar /home/backup
