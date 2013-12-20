#!/bin/bash
g++ -O3 -o main.o -DAMD_OS_LINUX -c main.cpp -I/opt/AMDAPP/include/ -fopenmp
g++ -O3 -o Timer.o -DAMD_OS_LINUX -c Timer.cpp -I/opt/AMDAPP/include/ -fopenmp
g++ -O3 -o a.out main.o Timer.o -lOpenCL -L/opt/AMDAPP/lib/x86_64/ -fopenmp

