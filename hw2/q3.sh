#!/bin/bash

if [ "$1" = "-g" ]
then
for i in {10..19}
do
	./generate3 -s 26 -n `echo "2^$i"|bc` -o binary/3random.$i.bin
done
fi

if [ "$1" = "-d" ]
then
for i in {10..19}
do
	./dump -i binary/3random.$i.bin > text/3random.$i.txt
done
fi

if [ "$1" = "-c" ]
then
rm -f -v binary/3*
rm -f -v text/3*
fi
