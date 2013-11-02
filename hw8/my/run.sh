#!/bin/bash
export CUDA_PROFILE=1
rm -f log

for i in {9..24}
do
    ./a.out `echo "2^$i" | bc` >> log
    cat cuda_profile_0.log >> log
    echo >> log
    echo $i
done
