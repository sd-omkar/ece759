#!/bin/bash
#PBS -n hw4_q2_omkar
#PBS -l nodes=1:gpus=1,walltime=00:01:00
#PBS -d /home/odeshmukh/work/hw4/q2

./q2.out > log
