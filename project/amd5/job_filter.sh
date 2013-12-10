#!/bin/bash
#PBS -N omp_filter
#PBS -l nodes=1:ppn=64,walltime=10:00:00
#PBS -d /home/odeshmukh/work/project/OpenMP

for i in {4..24..4}
do
  ./a.out -f $i -x 8192 -y 8192 >> log_filter
done
