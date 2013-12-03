#!/bin/bash 
export CUDA_PROFILE=1
make clean
make
./convolutionSeparable >> log_image
echo "---------------" >> log_image
cat cuda_profile_0.log >> log_image
echo "---------------" >> log_image

rm -f cuda_profile_0.log
