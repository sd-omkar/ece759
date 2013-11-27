#!/bin/bash

for i in {1..10}
do
  mpiexec -np 1 ./a.out >> log_1_1
  mpiexec -np 4 ./a.out >> log_1_4
  mpiexec -np 8 ./a.out >> log_1_8
done
