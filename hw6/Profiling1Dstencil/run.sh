#!/bin/bash 
#PBS -N hw6_q2_omkar
#PBS -l nodes=1:gpus=1,walltime=01:00:00
#PBS -d /home/odeshmukh/work/hw6/Profiling1Dstencil

export CUDA_PROFILE=1
echo "CUDA_PROFILE set to: " $CUDA_PROFILE

 echo "Running V4"
 nvcc -O3 -gencode arch=compute_20,code=sm_20 testV4.cu -o testV4_20
 for ((i = 3 ; i < 9 ; i++)); do
   echo "10^$i"|bc >> cuda_profile_V4_20.out
   ./testV4_20 `echo "10^$i"|bc` >> cuda_profile_V4_20.out
   cat cuda_profile_0.log >> cuda_profile_V4_20.out
   echo >> cuda_profile_V4_20.out
   echo >> cuda_profile_V4_20.out
 done

 echo "Running V5"
 nvcc -O3 -gencode arch=compute_20,code=sm_20 testV5.cu -o testV5_20
 for ((i = 3 ; i < 9 ; i++)); do
   echo "10^$i"|bc >> cuda_profile_V5_20.out
   ./testV5_20 `echo "10^$i"|bc` >> cuda_profile_V5_20.out
   cat cuda_profile_0.log >> cuda_profile_V5_20.out
   echo >> cuda_profile_V5_20.out
   echo >> cuda_profile_V5_20.out
 done

 echo "Running V6"
 nvcc -O3 -gencode arch=compute_20,code=sm_20 testV6.cu -o testV6_20
 for ((i = 3 ; i < 9 ; i++)); do
   echo "10^$i"|bc >> cuda_profile_V6_20.out
   ./testV6_20 `echo "10^$i"|bc` >> cuda_profile_V6_20.out
   cat cuda_profile_0.log >> cuda_profile_V6_20.out
   echo >> cuda_profile_V6_20.out
   echo >> cuda_profile_V6_20.out
 done

rm -f cuda_profile_0.log
