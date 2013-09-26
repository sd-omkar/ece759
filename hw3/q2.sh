#!/bin/bash

rm -f q2_32.dat
touch q2_32.dat
for i in {10..20}
do
    ./q2_32.out `echo "2^$i" | bc` >> q2_32.dat
done

rm -f q2_1024.dat
touch q2_1024.dat
for i in {10..20}
do
    ./q2_1024.out `echo "2^$i" | bc` >> q2_1024.dat
done
