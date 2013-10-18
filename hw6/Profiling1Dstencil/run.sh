#!/bin/bash 
export CUDA_PROFILE=1
echo "CUDA_PROFILE set to: " $CUDA_PROFILE

 echo
 nvcc -O3 -gencode arch=compute_20,code=sm_20 testV4.cu -o testV4_20
 for ((i = 3 ; i < 8 ; i++)); do
   echo $i >> cuda_profile_V4_20.out
   ./testV4_20 `echo "10^$i"|bc` >> cuda_profile_V4_20.out
   cat cuda_profile_0.log >> cuda_profile_V4_20.out
   echo >> cuda_profile_V4_20.out
   echo >> cuda_profile_V4_20.out
 done
rm -f cuda_profile_0.log
