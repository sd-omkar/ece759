#!/bin/bash
#PBS -n hw5_q2_omkar
#PBS -l nodes=1:gpus=1,walltime=00:01:00
#PBS -d /home/odeshmukh/work/hw5/Scaling

for i in 32 64 128 256 512 1024 2048 4096
do
./q2.out $i $i > data/$i.log
done
