#!/bin/bash

for i in {1..10}
do
  mpiexec -np 8 ./a.out >> log_4_2
done
