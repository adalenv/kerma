#!/bin/bash
grep -rn  $1  tmp/ &> /dev/null
chk=$?
if [ "$chk" -eq 0 ]; then
	echo -e '\033[0;31mThis IP is done!\033[0m'
	while true; do
		read -p "Continue anyway (y/N) ?   " yn
		case $yn in
			[Yy]* ) break ;;
			    * ) exit  ;;
		esac
	done
fi
echo $1 >> tmp/one.txt
python3 PoC.py $1  >> bambam.txt
tail -n 10 bambam.txt
echo "Done"
