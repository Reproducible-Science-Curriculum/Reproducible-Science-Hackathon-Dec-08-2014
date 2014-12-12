#!/bin/bash

# Downloads all of the etherpads mentioned a given markdown document

https://etherpad.mozilla.org/ep/pad/export/vPGhZc6aBh/latest?format=txt

inputfile=$1
echo $inputfile

for etherpad in `grep -ho 'https:\/\/etherpad.mozilla.org\/[a-zA-Z0-9]\{10\}' $1`
do
	echo $etherpad
	padnumber=`echo $etherpad | sed 's|.*\([a-zA-Z0-9]\{10\}\)$|\1|'`
	#echo "https://etherpad.mozilla.org/ep/pad/export/$padnumber/latest?format=txt"
	curl "https://etherpad.mozilla.org/ep/pad/export/$padnumber/latest?format=txt" > "etherpad_$padnumber.txt"
done
