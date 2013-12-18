#!/bin/bash
#PBS -N cpu_image
#PBS -l nodes=1:ppn=1,walltime=10:00:00
#PBS -d /home/odeshmukh/work/project/Base

for i in {3968..17000..1024}
do
  ./a.out $i >> log_image
done
