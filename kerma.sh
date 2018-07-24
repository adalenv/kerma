#!/bin/bash
clear
echo "##############################"
echo "#                            #"
echo "#                            #"
echo "#          kerma             #"
echo "#                            #"
echo "#                            #"
echo "##############################"

if [ -z "$1" ];then
	echo "You must specify an IP address or a RANGE !"
	exit 1
fi

if [[ $1 = *"/"* ]]; then
	./multi.sh $1
	else
		./one.sh $1
	fi
