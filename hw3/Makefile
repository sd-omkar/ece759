CC=nvcc

CFLAGS=-arch=sm_20

all: q1 q2_32 q2_1024

q1:
	nvcc -arch=sm_20 q1.cu -o q1.out
q2_32:
	nvcc -arch=sm_20 q2_32.cu -o q2_32.out -lm

q2_1024:
	nvcc -arch=sm_20 q2_1024.cu -o q2_1024.out -lm

clean:
	rm -f *.out
