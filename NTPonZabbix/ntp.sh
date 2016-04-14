#!/bin/bash

SUCCESS=0
E_NOARGS=60
E_ERRARGS=61

NTPQ_ADDR=0

if [ -z "$1" ]
then
	exit $E_NOARGS
fi

if [ eq "connect" ]
then
	ntpq -p | grep -E "^\*" -c
fi

case $1 in
	reach )	
		$NTPQ_ADDR=5;;
	delay )	
		$NTPQ_ADDR=6;;
	offset )	
		$NTPQ_ADDR=7;;
	*)
		exit $E_ERRARGS;; 
esac

ntpq -p | sed -n '/^\*/p' | awk 'FS=" "{print $$NTPQ_ADDR}'


