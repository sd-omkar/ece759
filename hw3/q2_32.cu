#include <stdio.h>
#include <cuda.h>
#include <math.h>
#include <sys/types.h>
#include <sys/time.h>
#include <sys/stat.h>

#define BLOCK_DIM 32
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
  struct timeval incl_start, incl_end;
  struct timeval excl_start, excl_end;
  long int incl_diff, excl_diff;

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
  gettimeofday(&incl_start, NULL);
  cudaMemcpy(dA, hA, size, cudaMemcpyHostToDevice);
  cudaMemcpy(dB, hB, size, cudaMemcpyHostToDevice);
  
  // Launch kernel
  int GRID_DIM = (num % BLOCK_DIM == 0) 
                ? num / BLOCK_DIM 
                : (int)(num / BLOCK_DIM) + 1;
  dim3 dimGrid(GRID_DIM, 1, 1);
  dim3 dimBlock(BLOCK_DIM, 1, 1);
  gettimeofday(&excl_start, NULL);
  data<<<dimGrid, dimBlock>>>(dA, dB, dC, num);
  gettimeofday(&excl_end, NULL);
  cudaMemcpy(hC, dC, size, cudaMemcpyDeviceToHost);
  gettimeofday(&incl_end, NULL);

  // Verify results
  for (i=0; i<num; i++) {
    if (fabs(refC[i] - hC[i]) > 1e-12) {
      printf("FAIL\n");
      exit(1);
    }
  }

  // Print metrics
  incl_diff = (incl_end.tv_usec + 1000000 * incl_end.tv_sec) - (incl_start.tv_usec + 1000000 * incl_start.tv_sec);
  excl_diff = (excl_end.tv_usec + 1000000 * excl_end.tv_sec) - (excl_start.tv_usec + 1000000 * excl_start.tv_sec);
  //printf("Inclusive: %ld\n", incl_diff);
  //printf("Exclusive: %ld\n", excl_diff);
  printf("Size = %d\n Inclusive Time = %ld\n Exclusive Time = %ld\n", num, incl_diff, excl_diff);

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

