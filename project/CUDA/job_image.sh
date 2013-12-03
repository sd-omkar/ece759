#!/bin/bash
#PBS -N CUDA_image
#PBS -l nodes=1:gpus=1,walltime=10:00:00
#PBS -d /home/odeshmukh/work/project/CUDA

export CUDA_PROFILE=1

for i in {4000..12000..512}
do
  echo $i >> log_image
  ./a.out $i >> log_image
  cat cuda_profile_0.log >> log_image
  echo >> log_image
done
