#include <stdio.h>
#include <cuda.h>
#include <math.h>

#define BLOCK_DIM 16

__global__ void multiply(int *a, int *b, int *c, int wa) {
  int t_id = threadIdx.x;
  int i;
  c[t_id] = 0;
  for (i=0; i<wa; i++)
    c[t_id] += a[t_id * wa + i] * b[i];
}

int main (int argc, char *argv[]) {
  // Initialize host variables
  int i, j;
  int A[16][32];
  int b[32];
  int c[16];
  for (i=0; i<16; i++)
      for (j=0; j<32; j++)
        A[i][j] = i + j;
  for (i=0; i<32; i++)
    b[i] = i;

  // Timing variables;
  cudaEvent_t start, end;
  float time;
  cudaEventCreate(&start);
  cudaEventCreate(&end);

  // Device memory allocation
  int *dA, *dB, *dC;
  cudaMalloc((void **)&dA, sizeof(int)*16*32);
  cudaMalloc((void **)&dB, sizeof(int)*32);
  cudaMalloc((void **)&dC, sizeof(int)*16);
  cudaEventRecord(start, 0);
  cudaMemcpy(dA, A, sizeof(int)*16*32, cudaMemcpyHostToDevice);
  cudaMemcpy(dB, b, sizeof(int)*32, cudaMemcpyHostToDevice);
  
  // Launch kernel
  multiply<<<1, 16>>>(dA, dB, dC, 32);
  cudaMemcpy(c, dC, sizeof(int)*16, cudaMemcpyDeviceToHost);
  cudaEventRecord(end, 0);
  cudaEventSynchronize(end);

  cudaEventElapsedTime(&time, start, end);

  FILE *out;
  out = fopen("Problem1.out", "w");
  for (i=0; i<16; i++)
    fprintf(out, "%d\n", c[i]);

  cudaDeviceProp deviceProp;
  const int currentDevice = 0;
  if (cudaGetDeviceProperties(&deviceProp, currentDevice) == cudaSuccess) 
    printf("Device %d: %s\n", currentDevice, deviceProp.name);
  printf("Inclusive time = %fms\n", time);
  printf("Result in the file Problem1.out\n");

  // Cleanup
  cudaFree(dA);
  cudaFree(dB);
  cudaFree(dC);

  return 0;
}

