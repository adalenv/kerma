#!/bin/bash
clear
echo "##############################"
echo "#                            #"
echo "#                            #"
echo "#          kerma             #"
echo "#                            #"
echo "#                            #"
echo "##############################"
#ip=$1
if [ -z "$1" ];then
        ip=$( zenity --entry --text "Type a range or IP " )
	else
		ip=$1
fi

#ip=$( zenity --entry --text "Type a range or IP " )
#ip=$(xclip -out -selection clipboard)
if [ -z "$ip" ];then
	echo "You must specify an IP address or a RANGE !"
	exit 1
fi

if [[ $ip = *"/"* ]]; then
	./multi.sh $ip
	else
		./one.sh $ip
	fi
