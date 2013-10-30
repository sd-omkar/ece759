#!/bin/bash
for i in {1..30}
do
    ./a.out `echo "2^$i" | bc` >> log
done
