#!/bin/bash

if [ "$1" = "-g" ]
then
for i in {10..19}
do
	./generate -s 26 -n `echo "2^$i"|bc` -o binary/random.$i.bin
done
fi

if [ "$1" = "-d" ]
then
for i in {10..19}
do
	./dump -i binary/random.$i.bin > text/random.$i.txt
done
fi

if [ "$1" = "-c" ]
then
rm -f -v binary/*
rm -f -v text/*
fi
