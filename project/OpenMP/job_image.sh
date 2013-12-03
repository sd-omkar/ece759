#!/bin/bash
#PBS -N omp_image
#PBS -l nodes=1:ppn=64,walltime=10:00:00
#PBS -d /home/odeshmukh/work/project/OpenMP

for i in {4000..12000..500}
do
  ./a.out.4 -f 9 -x $i -y $i >> log_image_4
  ./a.out.16 -f 9 -x $i -y $i >> log_image_16
  ./a.out.64 -f 9 -x $i -y $i >> log_image_64
done
