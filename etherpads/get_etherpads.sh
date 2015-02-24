#!/bin/bash

# Downloads all of the etherpad.mozilla.org-hosted etherpads hosted mentioned a given markdown document.
# At present, does not to authentication, so pads need to be public.

inputfile=$1
echo "Reading etherpads from $inputfile"

for etherpad in `grep -ho 'https:\/\/etherpad.mozilla.org\/[a-zA-Z0-9]\{10\}' $1`
do
	echo $etherpad
	padnumber=`echo $etherpad | sed 's|.*\([a-zA-Z0-9]\{10\}\)$|\1|'`
	#echo "https://etherpad.mozilla.org/ep/pad/export/$padnumber/latest?format=txt"
	curl -L "https://etherpad.mozilla.org/ep/pad/export/$padnumber/latest?format=txt" > "etherpad_$padnumber.txt"
done
