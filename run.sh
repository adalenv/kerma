#!/bin/bash
nmap_path=`which nmap`
file_name=`echo $1 | awk -F "/" '{print $1}'`
echo 'Running nmap'
#$nmap_path -T5 -sT -p 8291 --open $1 -oG - | awk '$4=="Ports:"{print $2}' | awk -F "/" '{print $1}' > tmp/output_`echo $1 | awk -F "/" '{print $1}'`.txt
$nmap_path -sP $1 | awk '/is up/ {print up}; {gsub (/\(|\)/,""); up = $NF}'  > tmp/output_`echo $1 | awk -F "/" '{print $1}'`.txt


file="tmp/output_$file_name.txt"
lines=`cat $file`
for line in $lines; do
	echo "-------------------------------------------" >> bambam.txt
        python3 PoC.py $line  >> bambam.txt
done
echo "Finish"
