#!/bin/bash 

export CUDA_PROFILE=1
echo "CUDA_PROFILE set to: " $CUDA_PROFILE

if [ $# != "2" ] ; then
  echo "Useage: scriptTiming.sh 10 5 OR scriptTiming.sh 20 5,"
  echo "where 5 says how many iterations you want to take"
  exit
fi

if [ $1 = "10" ] ; then
 echo
 echo "Running on hardware compute capability 10"
 nvcc -O3 -gencode arch=compute_10,code=sm_10 testV3.cu -o testV3_10
 for ((i = 0 ; i < $2 ; i++)); do
   ./testV3_10
   cat cuda_profile_0.log >> cuda_profile_V3_10.out
   echo >> cuda_profile_V3_10.out
   echo >> cuda_profile_V3_10.out
 done

 nvcc -O3 -gencode arch=compute_10,code=sm_10 testV4.cu -o testV4_10
 for ((i = 0 ; i < $2 ; i++)); do
   ./testV4_10
   cat cuda_profile_0.log >> cuda_profile_V4_10.out
   echo >> cuda_profile_V4_10.out
   echo >> cuda_profile_V4_10.out
 done
else
 echo
 echo "Running on hardware compute capability 20"
 nvcc -O3 -gencode arch=compute_20,code=sm_20 testV3.cu -o testV3_20
 for ((i = 0 ; i < $2 ; i++)); do
   ./testV3_20
   cat cuda_profile_0.log >> cuda_profile_V3_20.out
   echo >> cuda_profile_V3_20.out
   echo >> cuda_profile_V3_20.out
 done

 echo 
 echo "Doing loop unrolling now"
 nvcc -O3 -gencode arch=compute_20,code=sm_20 testV4.cu -o testV4_20
 for ((i = 0 ; i < $2 ; i++)); do
   ./testV4_20
   cat cuda_profile_0.log >> cuda_profile_V4_20.out
   echo >> cuda_profile_V4_20.out
   echo >> cuda_profile_V4_20.out
 done
fi  

rm -f cuda_profile_0.log

