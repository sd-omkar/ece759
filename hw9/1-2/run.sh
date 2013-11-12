#!/bin/bash
for i in {1..8}
do
    ./q1-2.out `echo "10^$i" | bc` >> log
done
