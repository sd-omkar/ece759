#!/bin/bash 

export CUDA_PROFILE=1
echo "CUDA_PROFILE set to: " $CUDA_PROFILE

if [ $# != "1" ] ; then
  echo "Useage: scriptTiming.sh 10 5 OR scriptTiming.sh 20 5,"
  echo "where 5 says how many iterations you want to take"
  exit
fi

if [ $1 = "10" ] ; then
 echo
 echo "Running on hardware compute capability 10"
 nvcc -O3 -gencode arch=compute_10,code=sm_10 testV4.cu -o testV4_10
 for ((i = 3 ; i < 9 ; i++)); do
   ./testV4_10 `echo "10^$i"|bc` >> cuda_profile_V4_10.out
   cat cuda_profile_0.log >> cuda_profile_V4_10.out
   echo >> cuda_profile_V4_10.out
   echo >> cuda_profile_V4_10.out
 done

 nvcc -O3 -gencode arch=compute_10,code=sm_10 testV5.cu -o testV5_10
 for ((i = 3 ; i < 9 ; i++)); do
   ./testV5_10 `echo "10^$i"|bc` >> cuda_profile_V5_10.out
   cat cuda_profile_0.log >> cuda_profile_V5_10.out
   echo >> cuda_profile_V5_10.out
   echo >> cuda_profile_V5_10.out
 done

 echo
 nvcc -O3 -gencode arch=compute_10,code=sm_10 testV6.cu -o testV6_10
 for ((i = 3 ; i < 9 ; i++)); do
   ./testV6_10 `echo "10^$i"|bc` >> cuda_profile_V6_10.out
   cat cuda_profile_0.log >> cuda_profile_V6_10.out
   echo >> cuda_profile_V6_10.out
   echo >> cuda_profile_V6_10.out
 done

else
 echo
 echo "Running on hardware compute capability 20"
 nvcc -O3 -gencode arch=compute_20,code=sm_20 testV4.cu -o testV4_20
 for ((i = 3 ; i < 9 ; i++)); do
   ./testV4_20 `echo "10^$i"|bc` >> cuda_profile_V4_20.out
   cat cuda_profile_0.log >> cuda_profile_V4_20.out
   echo >> cuda_profile_V4_20.out
   echo >> cuda_profile_V4_20.out
 done

 echo 
 nvcc -O3 -gencode arch=compute_20,code=sm_20 testV5.cu -o testV5_20
 for ((i = 3 ; i < 9 ; i++)); do
   ./testV5_20 `echo "10^$i"|bc` >> cuda_profile_V5_20.out
   cat cuda_profile_0.log >> cuda_profile_V5_20.out
   echo >> cuda_profile_V5_20.out
   echo >> cuda_profile_V5_20.out
 done

 echo
 nvcc -O3 -gencode arch=compute_20,code=sm_20 testV6.cu -o testV6_20
 for ((i = 3 ; i < 9 ; i++)); do
   ./testV6_20 `echo "10^$i"|bc` >> cuda_profile_V6_20.out
   cat cuda_profile_0.log >> cuda_profile_V6_20.out
   echo >> cuda_profile_V6_20.out
   echo >> cuda_profile_V6_20.out
 done
fi  

rm -f cuda_profile_0.log

