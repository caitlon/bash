#!/bin/bash

ln -s /etc/hosts sln1
#echo "Zadejte delky retezce:\n"
#read -r x
a=3

for((i=2;i<="$a";++i))
do

        LINKNAME="sln$i"
        LINKNAME1LESS="sln$(($i - 1))"
        ln -s $LINKNAME1LESS $LINKNAME

done
