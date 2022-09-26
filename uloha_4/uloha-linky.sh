#!/bin/bash

if [ $1 -lt 1 ]; then
 exit 1;
fi

if [[ ! -h "sln1" ]]; then
 ln -s "/etc/hosts" "sln1";
fi

unset i;
for (( i = 2 ; i <= $1 ; i++ ));
do
 if [[ ! -h "sln$i" ]]; then
PREV=$(( $i - 1 ));
ln -s "sln$PREV" "sln$i";
fi
done
