#include<iostream>
#include<stdlib.h>
#include<stdio.h>
#include <cuda.h>
#include <math.h>

//#define N 1000000
#define RADIUS 3

int checkResults(int startElem, int endElem, float* cudaRes, float* res)
{
    int nDiffs=0;
    const float smallVal = 0.000001f;
    for(int i=startElem; i<endElem; i++)
        if(fabs(cudaRes[i]-res[i])>smallVal)
            nDiffs++;
    return nDiffs;
}

void initializeWeights(float* weights, int rad)
{
    // for now hardcoded for RADIUS=3
    weights[0] = 0.50f;
    weights[1] = 0.75f;
    weights[2] = 1.25f;
    weights[3] = 2.00f;
    weights[4] = 1.25f;
    weights[5] = 0.75f;
    weights[6] = 0.50f;
}

void initializeArray(float* arr, int nElements)
{
    const int myMinNumber = -5;
    const int myMaxNumber = 5;
    srand(time(NULL));
    for( int i=0; i<nElements; i++)
        arr[i] = (float)(rand() % (myMaxNumber - myMinNumber + 1) + myMinNumber);
}

void applyStencil1D_SEQ(int sIdx, int eIdx, const float *weights, float *in, float *out) {
  
  for (int i = sIdx; i < eIdx; i++) {   
    out[i] = 0;
    //loop over all elements in the stencil
    for (int j = -RADIUS; j <= RADIUS; j++) {
      out[i] += weights[j + RADIUS] * in[i + j]; 
    }
    out[i] = out[i] / (2 * RADIUS + 1);
  }
}

__global__ void applyStencil1D(int sIdx, int eIdx, const float *weights, const float *input, float *out) {
    __shared__ float in[RADIUS * 2 + 1027];
    __shared__ float sw[RADIUS * 2 + 1];
    int tid = blockIdx.x*blockDim.x + threadIdx.x;
    int x = threadIdx.x + RADIUS;
    
    in[x] = input[tid];
    if (threadIdx.x < RADIUS) {
      in[x - RADIUS] = input[tid - RADIUS];
      in[x + blockDim.x] = input[tid + blockDim.x];
    }
    if (threadIdx.x < RADIUS * 2 + 1)
      sw[threadIdx.x] = weights[threadIdx.x];
    __syncthreads();
    
    float result = 0.f;
    if (tid < eIdx) {
    result += sw[0]*in[x-3];
    result += sw[1]*in[x-2];
    result += sw[2]*in[x-1];
    result += sw[3]*in[x];
    result += sw[4]*in[x+1];
    result += sw[5]*in[x+2];
    result += sw[6]*in[x+3];
    result /=7.f;
    }
    out[tid] = result;
}

int main(int argc, char *argv[]) {
  if (argc != 2) {
    printf("Missing input N\n");
    exit(1);
  }
  int N = atoi(argv[1]);
  int size = N * sizeof(float); 
  int wsize = (2 * RADIUS + 1) * sizeof(float); 
  //allocate resources
  float *weights   ; cudaMallocHost(&weights, wsize);
  float *in        ; cudaMallocHost(&in, size);
  float *out       ; cudaMallocHost(&out, size);
  float *cuda_out  ; cudaMallocHost(&cuda_out, size);
  initializeWeights(weights, RADIUS);
  initializeArray(in, N);
  float *d_weights;  cudaMalloc((void **)&d_weights, wsize);
  float *d_in;       cudaMalloc((void **)&d_in, size);
  float *d_out;      cudaMalloc((void **)&d_out, size);
  
  // Timing variables
  float cpu, gpu;
  cudaEvent_t gpu_start, gpu_end;
  cudaEvent_t cpu_start, cpu_end;
  cudaEventCreate(&gpu_start);
  cudaEventCreate(&gpu_end);
  cudaEventCreate(&cpu_start);
  cudaEventCreate(&cpu_end);

  cudaEventRecord(gpu_start, NULL);
  cudaMemcpy(d_weights,weights,wsize,cudaMemcpyHostToDevice);
  cudaMemcpy(d_in, in, size, cudaMemcpyHostToDevice);
  applyStencil1D<<<((N+1023)/1024), 1024>>>(RADIUS, N-RADIUS, d_weights, d_in, d_out);
  cudaMemcpy(cuda_out, d_out, size, cudaMemcpyDeviceToHost);
  cudaEventRecord(gpu_end, NULL);
  cudaEventSynchronize(gpu_end);
  cudaEventElapsedTime(&gpu, gpu_start, gpu_end);
  
  cudaEventRecord(cpu_start, NULL);
  applyStencil1D_SEQ(RADIUS, N-RADIUS, weights, in, out);
  cudaEventRecord(cpu_end, NULL);
  cudaEventSynchronize(cpu_end);
  cudaEventElapsedTime(&cpu, cpu_start, cpu_end);

  int nDiffs = checkResults(RADIUS, N-RADIUS, cuda_out, out);
  nDiffs==0? std::cout<<"Looks good.\n": std::cout<<"Doesn't look good: " << nDiffs << "differences\n";
  std::cout << "GPU time =  " << gpu*1000 << "\n";
  std::cout << "CPU time =  " << cpu*1000 << "\n";

  //free resources
  cudaFree(weights); cudaFree(in); cudaFree(out); cudaFree(cuda_out);
  cudaFree(d_weights);  cudaFree(d_in);  cudaFree(d_out);
  return 0;
}
