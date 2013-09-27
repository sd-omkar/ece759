#include <stdio.h>
#include <cuda.h>
#include <math.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/stat.h>

#define BLOCK_DIM 1024
#define SEED 26

__global__ void data(double *a, double *b, double *c, int count) {
  int t_id = blockDim.x * blockIdx.x + threadIdx.x;
  if (t_id < count)
    c[t_id] = a[t_id] + b[t_id];
}

int main (int argc, char *argv[]) {
  if (argc != 2) {
    printf("Usage: %s number\n", argv[0]);
    exit(1);
  }
  // Initialize host variables
  int i = 0;
  double *hA, *hB, *hC, *refC;
  int num = atoi(argv[1]);
  long size = num*sizeof(double);
  hA = (double *)malloc(size);
  hB = (double *)malloc(size);
  hC = (double *)malloc(size);
  refC = (double *)malloc(size);

  // Timing variables;
  cudaEvent_t incl_start, incl_end;
  cudaEvent_t excl_start, excl_end;
  float time_incl, time_excl;
  cudaEventCreate(&incl_start);
  cudaEventCreate(&incl_end);
  cudaEventCreate(&excl_start);
  cudaEventCreate(&excl_end);

  // Populate hA, hB, refC
  srand(SEED);
  for (i=0; i<num; i++) {
    hA[i] = -10 + rand() % 20;
    hB[i] = -10 + rand() % 20;
    refC[i] = hA[i] + hB[i];
  }

  // Device memory allocation
  double *dA, *dB, *dC;
  cudaMalloc((void **)&dA, size);
  cudaMalloc((void **)&dB, size);
  cudaMalloc((void **)&dC, size);
  cudaEventRecord(incl_start, 0);
  cudaMemcpy(dA, hA, size, cudaMemcpyHostToDevice);
  cudaMemcpy(dB, hB, size, cudaMemcpyHostToDevice);
  
  // Launch kernel
  int GRID_DIM = (num % BLOCK_DIM == 0) 
                ? num / BLOCK_DIM 
                : (int)(num / BLOCK_DIM) + 1;
  dim3 dimGrid(GRID_DIM, 1, 1);
  dim3 dimBlock(BLOCK_DIM, 1, 1);
  cudaEventRecord(excl_start, 0);
  data<<<dimGrid, dimBlock>>>(dA, dB, dC, num);
  cudaEventRecord(excl_end, 0);
  cudaEventSynchronize(excl_end);
  cudaMemcpy(hC, dC, size, cudaMemcpyDeviceToHost);
  cudaEventRecord(incl_end, 0);
  cudaEventSynchronize(incl_end);

  // Verify results
  for (i=0; i<num; i++) {
    if (fabs(refC[i] - hC[i]) > 1e-12) {
      printf("FAIL\n");
      exit(1);
    }
  }

  // Print metrics
  cudaEventElapsedTime(&time_incl, incl_start, incl_end);
  cudaEventElapsedTime(&time_excl, excl_start, excl_end);
  //time_incl *= 1000;
  //time_excl *= 1000;
  //printf("Inclusive: %f\n", incl_diff);
  //printf("Exclusive: %f\n", excl_diff);
  //printf("Size = %d\n Inclusive Time = %f\n Exclusive Time = %f\n", num, time_incl, time_excl);
  printf("%d\t%f\t%f\n", num, time_incl, time_excl);

  // Cleanup
  cudaFree(dA);
  cudaFree(dB);
  cudaFree(dC);
  free(hA);
  free(hB);
  free(hC);
  free(refC);

  return 0;
}

