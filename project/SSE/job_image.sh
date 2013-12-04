#!/bin/bash
#PBS -N cpu_image
#PBS -l nodes=1:ppn=1,walltime=10:00:00
#PBS -d /home/odeshmukh/work/project/Base

for i in {4000..16000..1000}
do
  ./a.out -f 16 -x $i -y $i >> log_image
done
