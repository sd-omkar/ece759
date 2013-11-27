#!/bin/bash

for i in {1..10}
do
  mpiexec -np 64 ./a.out 60000000 5 >> log
done
