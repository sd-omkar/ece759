#!/bin/bash

if [ "$1" = "-g" ]
then
for i in {5..12}
do
	./generate4 -s 26 -n `echo "2^$i"|bc` -o binary/4random.$i.bin
done
fi

if [ "$1" = "-d" ]
then
for i in {5..12}
do
	./dump -i binary/4random.$i.bin > text/4random.$i.txt
done
fi

if [ "$1" = "-c" ]
then
rm -f -v binary/4*
rm -f -v text/4*
fi
