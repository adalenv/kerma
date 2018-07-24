#!/bin/bash
nmap_path=`which nmap`
file_name=`echo $1 | awk -F "/" '{print $1}'`
file="tmp/output_$file_name.txt"
if [ -f $file ]; then
	echo -e '\033[0;31mThis range is done!\033[0m'
	while true; do
		read -p "Continue anyway (y/N) ?   " yn
		case $yn in
			[Yy]* ) break ;;
			    * ) exit  ;;
		esac
	done
fi

echo -e '\033[0;32mRunning nmap...\033[0m'

$nmap_path -sP $1 | awk '/is up/ {print up}; {gsub (/\(|\)/,""); up = $NF}'  > tmp/output_`echo $1 | awk -F "/" '{print $1}'`.txt

lines=`cat $file`
for line in $lines; do
	echo "-------------------------------------------" >> bambam.txt
        python3 PoC.py $line  >> bambam.txt
done
tail -n 10 bambam.txt
echo "Done!"
