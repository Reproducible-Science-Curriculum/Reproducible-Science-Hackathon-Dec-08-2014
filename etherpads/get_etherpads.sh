#!/bin/bash

# Downloads all of the etherpads mentioned a given markdown document

inputfile=$1

for etherpad in `grep -ho 'etherpad.mozilla.org\/[a-zA-Z0-9]\{10\}' $1`
do
	echo $etherpad
	padnumber=`echo $etherpad | sed 's|.*\([a-zA-Z0-9]\{10\}\)$|\1|'`
	curl $etherpad > "etherpad_$padnumber.txt"
done
