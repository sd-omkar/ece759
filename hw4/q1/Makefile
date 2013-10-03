CC=nvcc

CFLAGS=-arch=sm_20

all: q1

q1:
	nvcc -arch=sm_20 q1.cu -o q1.out

clean:
	rm -f *.out
