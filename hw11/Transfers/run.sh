#!/bin/bash
for i in {0..28}
do
    echo $i
    mpiexec -np 2 ./a.out `echo "2^$i" | bc` >> log
done
