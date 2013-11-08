#include<iostream>
#include<stdlib.h>
#include<stdio.h>
#include <cuda.h>
#include <math.h>
#include <assert.h>
#include "scan_gold.cpp"
#include "kernel.cu"

#define BLOCK_SIZE 1024 

int checkResults(int startElem, int endElem, float* cudaRes, float* res)
{
    int nDiffs=0;
    const float smallVal = 0.000001f;
    for(int i=startElem; i<endElem; i++)
        if(fabs(cudaRes[i]-res[i])>smallVal)
            nDiffs++;
    return nDiffs;
}

void initializeArray(float* arr, int nElements)
{
    const int myMinNumber = -5;
    const int myMaxNumber = 5;
    srand(26);
    for( int i=0; i<nElements; i++)
      arr[i] = (float)(rand() % (myMaxNumber - myMinNumber + 1) + myMinNumber);
      //arr[i] = 1.f;
}

int main(int argc, char *argv[]) {
  if (argc != 2) {
    printf("Missing input N\n");                                                               
    exit(1);                                                                                   
    }
  int N = atoi(argv[1]);
  int size = N * sizeof(float); 
  
  //allocate resources
  float *h_in;
  //h_in = (float *)malloc(size);
  //assert(h_in != NULL);
  assert(cudaSuccess == cudaMallocHost(&h_in, size));
  
  float *h_out;
  //h_out = (float *)malloc(size); 
  //assert(h_out != NULL);
  assert(cudaSuccess == cudaMallocHost(&h_out, size));
  
  float *cuda_out;
  //cuda_out = (float *)malloc(size); 
  //assert(cuda_out != NULL);
  assert(cudaSuccess == cudaMallocHost(&cuda_out, size));
  
  float *d_in;      
  assert(cudaSuccess == cudaMalloc(&d_in, size));
  
  float *d_out;     
  assert(cudaSuccess == cudaMalloc(&d_out, size));

  // Initialize input array
  initializeArray(h_in, N);

  // Timing variables
  float cpu, gpu;
  cudaEvent_t gpu_start, gpu_end;
  cudaEvent_t cpu_start, cpu_end;
  cudaEventCreate(&gpu_start);
  cudaEventCreate(&gpu_end);
  cudaEventCreate(&cpu_start);
  cudaEventCreate(&cpu_end);
  
  dim3 grid_simple, grid_tree;
  grid_simple.x = (N + BLOCK_SIZE - 1)/(BLOCK_SIZE);
  grid_tree.x = (N + 2*BLOCK_SIZE - 1)/(2*BLOCK_SIZE);
  dim3 block(BLOCK_SIZE, 1, 1);
  int blocks_left = grid_simple.x - 1;
  
  cudaEventRecord(gpu_start, NULL);

  assert(cudaSuccess == cudaMemcpy(d_in, h_in, size, cudaMemcpyHostToDevice));
  //cudaMemcpy(d_in, h_in, size, cudaMemcpyHostToDevice);
  
  scan_simple<<<grid_simple, block, sizeof(float)*BLOCK_SIZE*2>>>(d_out, d_in, N);
  //scan_tree<<<grid_tree, block, sizeof(float)*BLOCK_SIZE*2>>>(d_out, d_in, N);
  //int blocks_left = grid_tree.x - 1;

  // Cannot process more than 8192 block in one go
  // Max. shared limit of 48k
  if (blocks_left > 0)
    reduce<<<blocks_left, BLOCK_SIZE, sizeof(float)*(BLOCK_SIZE)>>>(d_out, d_in);
    //reduce<<<blocks_left, BLOCK_SIZE*2, sizeof(float)*(BLOCK_SIZE*2)>>>(d_out);
    //reduce2<<<grid_simple, block>>>(d_out, d_in, BLOCK_SIZE, N);

  
  assert(cudaSuccess == cudaMemcpy(cuda_out, d_out, size, cudaMemcpyDeviceToHost));
  //cudaMemcpy(cuda_out, d_out, size, cudaMemcpyDeviceToHost);
  
  cudaEventRecord(gpu_end, NULL);
  cudaEventSynchronize(gpu_end);
  cudaEventElapsedTime(&gpu, gpu_start, gpu_end);

  cudaEventRecord(cpu_start, NULL);
 
  // Compute on CPU
  computeGold(h_out, h_in, N);
  
  cudaEventRecord(cpu_end, NULL);
  cudaEventSynchronize(cpu_end);
  cudaEventElapsedTime(&cpu, cpu_start, cpu_end);

  int nDiffs = checkResults(1, N-1, cuda_out, h_out + 1);
  std::cout << "Size = " << N << "\n";
  nDiffs==0? std::cout<<"Looks good.\n": std::cout<<"Doesn't look good: " << nDiffs << " differences\n";
  std::cout << "GPU time =  " << gpu << "\n";
  std::cout << "CPU time =  " << cpu << "\n";
  std::cout << "Speedup = " << cpu/gpu << "\n";

  //free resources
  cudaFree(h_in); 
  cudaFree(h_out); 
  cudaFree(cuda_out);
  cudaFree(d_in);  
  cudaFree(d_out);
  return 0;
}
