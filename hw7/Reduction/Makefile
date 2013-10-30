COOL=-Xcompiler -ftree-vectorize -Xcompiler -msse2 -Xcompiler -ftree-vectorizer-verbose=1 -Xcompiler -ffast-math -Xcompiler -funsafe-loop-optimizations -Xcompiler -ftree-loop-linear -Xcompiler -ftree-loop-distribution -Xcompiler -fprefetch-loop-arrays

debug:
	nvcc -g -G -gencode arch=compute_20,code=sm_20 vector_reduction.cu vector_reduction_gold.cpp -o q2.out

O3:
	nvcc -O3 -gencode arch=compute_20,code=sm_20 vector_reduction.cu vector_reduction_gold.cpp -o q2.out

fast:
	nvcc -O3 -gencode arch=compute_20,code=sm_20 vector_reduction.cu vector_reduction_gold.cpp -o q2.out $(COOL) 

omp:
	nvcc -O3 -gencode arch=compute_20,code=sm_20 vector_reduction.cu vector_reduction_gold.cpp -o q2.out -Xcompiler -fopenmp
