#!/bin/bash 
make clean
make
./convolutionSeparable >> log_filter
echo "---------------" >> log_filter
