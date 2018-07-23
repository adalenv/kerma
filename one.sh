#!/bin/bash
grep -rn  $1  tmp/
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

python3 PoC.py $1  >> bambam.txt
echo "Done"
