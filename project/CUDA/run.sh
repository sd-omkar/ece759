#!/bin/bash 
export CUDA_PROFILE=1
make

 for ((i = 4 ; i < 13 ; i++)); do
   echo "2^$i"|bc
   echo >> log 
   ./2D.out `echo "2^$i"|bc` >> log 
   cat cuda_profile_0.log >> log 
 done

rm -f cuda_profile_0.log
