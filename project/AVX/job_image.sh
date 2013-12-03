#!/bin/bash
#PBS -N sse_image
#PBS -l nodes=1:ppn=1,walltime=10:00:00
#PBS -d /home/odeshmukh/work/project/SSE

for i in {4000..12000..500}
do
  ./a.out -f 9 -x $i -y $i >> log_image
done
