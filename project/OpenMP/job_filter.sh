#!/bin/bash
#PBS -N omp_filter
#PBS -l nodes=1:ppn=64,walltime=10:00:00
#PBS -d /home/odeshmukh/work/project/OpenMP

for i in {1..14}
do
  ./a.out.4 -f $i -x 8192 -y 8192 >> log_filter_4
  ./a.out.16 -f $i -x 8192 -y 8192 >> log_filter_16
  ./a.out.64 -f $i -x 8192 -y 8192 >> log_filter_64
done
