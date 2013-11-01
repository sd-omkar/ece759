#include<iostream>
#include<stdlib.h>
#include<stdio.h>
#include <cuda.h>
#include <math.h>
#include <assert.h>
#include "scan_gold.cpp"

#define BLOCK_SIZE 512

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
}

__global__ void scan(float *out, float *in, int length) {
  extern __shared__ float data[];
  
  int tid = threadIdx.x + blockIdx.x * blockDim.x;
  int tx = threadIdx.x;
  int pout = 0; int pin = 1;

  data[tx] = in[tid];

  for (int offset = 1; offset < blockDim.x; offset <<= 1) {
    pout = 1 - pout;
    pin = 1 - pin;

    if (tx >= offset)
      data[pout * blockDim.x + tx] = data[pin * blockDim.x + tx] + data[pin * blockDim.x + tx - offset];
    else 
      data[pout * blockDim.x + tx] = data[pin * blockDim.x + tx];

    __syncthreads();
  }

  out[tid] = data[pout * blockDim.x + tx];
}

int main(int argc, char *argv[]) {
  if (argc != 2) {
    printf("Missing input N\n");                                                               
    exit(1);                                                                                   
    }
  int N = atoi(argv[1]);
  int size = N * sizeof(float); 
  
  //allocate resources
  float *h_in      = (float *)malloc(size);
  assert(h_in != NULL);
  
  float *h_out     = (float *)malloc(size); 
  assert(h_out != NULL);
  
  float *cuda_out  = (float *)malloc(size); 
  assert(cuda_out != NULL);
  
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
  
  dim3 grid;
  if (N <= 65536 * BLOCK_SIZE)
    grid.x = (N + BLOCK_SIZE - 1)/(BLOCK_SIZE);
  else {
    printf("Input %d too big\n", N);                                                          
    exit(1);                                                                                   
  }
  dim3 block(BLOCK_SIZE, 1, 1);
  
  cudaEventRecord(gpu_start, NULL);

  assert(cudaSuccess == cudaMemcpy(d_in, h_in, size, cudaMemcpyHostToDevice));
  
  scan<<<grid, block, sizeof(float)*BLOCK_SIZE*2>>>(d_out, d_in, N);
  
  assert(cudaSuccess == cudaMemcpy(cuda_out, d_out, size, cudaMemcpyDeviceToHost));
  
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
  nDiffs==0? std::cout<<"Looks good.\n": std::cout<<"Doesn't look good: " << nDiffs << "differences\n";
  std::cout << "GPU time =  " << gpu << "\n";
  std::cout << "CPU time =  " << cpu << "\n";

  //free resources
  free(h_in); 
  free(h_out); 
  free(cuda_out);
  cudaFree(d_in);  
  cudaFree(d_out);
  return 0;
}