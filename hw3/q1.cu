#include <stdio.h>
#include <cuda.h>

#define NUM 16

__global__ void data(int *array) {
  int t_id = blockDim.x * blockIdx.x + threadIdx.x;
  array[t_id] = threadIdx.x + blockIdx.x;
  printf("d_array[%d] = %d\n", t_id, array[t_id]);
}

int main () {
  // Initialize variables
  int h_array[NUM];
  int *d_array;
  size_t size = NUM*sizeof(int);
  int i = 0;

  // Device memory allocation
  dim3 dimGrid(2, 1, 1);
  dim3 dimBlock(8, 1, 1);
  cudaMalloc((void **)&d_array, size);
  printf("Device memory:\n");
  data<<<dimGrid, dimBlock>>>(d_array);
  cudaMemcpy(h_array, d_array, size, cudaMemcpyDeviceToHost);

  // Print data copied to host
  printf("Host memory:\n");
  for (i = 0; i < NUM; i++){
    printf("h_array[%d] = %d\n", i, h_array[i]);
  }

  // Cleanup
  cudaFree(d_array);

  return 0;
}

