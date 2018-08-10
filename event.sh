#!/bin/bash
clear
echo "##############################"
echo "#                            #"
echo "#                            #"
echo "#          kerma             #"
echo "#                            #"
echo "#                            #"
echo "##############################"

function test0(){
	#ip=$1
	#ip=$( zenity --entry --text "Type a range or IP " )
	ip=$(xclip -out -selection clipboard)
	lastip=$(cat tmp.txt)

	res=$( ./validateIp.sh $ip)
	if [ $res == "ok" ];then
		if [ $lastip != $ip ];then
			echo $ip >> tmp/one.txt
			python3 PoC.py $ip  >> bambam.txt
				
		fi
		echo $ip > tmp.txt
	fi
	sleep 1
}

while true; do
test0
done




