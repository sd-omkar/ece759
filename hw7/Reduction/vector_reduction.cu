/*
* Copyright 1993-2006 NVIDIA Corporation.  All rights reserved.
*
* NOTICE TO USER:   
*
* This source code is subject to NVIDIA ownership rights under U.S. and 
* international Copyright laws.  
*
* This software and the information contained herein is PROPRIETARY and 
* CONFIDENTIAL to NVIDIA and is being provided under the terms and 
* conditions of a Non-Disclosure Agreement.  Any reproduction or 
* disclosure to any third party without the express written consent of 
* NVIDIA is prohibited.     
*
* NVIDIA MAKES NO REPRESENTATION ABOUT THE SUITABILITY OF THIS SOURCE 
* CODE FOR ANY PURPOSE.  IT IS PROVIDED "AS IS" WITHOUT EXPRESS OR 
* IMPLIED WARRANTY OF ANY KIND.  NVIDIA DISCLAIMS ALL WARRANTIES WITH 
* REGARD TO THIS SOURCE CODE, INCLUDING ALL IMPLIED WARRANTIES OF 
* MERCHANTABILITY, NONINFRINGEMENT, AND FITNESS FOR A PARTICULAR PURPOSE.   
* IN NO EVENT SHALL NVIDIA BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL, 
* OR CONSEQUENTIAL DAMAGES, OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS 
* OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE 
* OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE 
* OR PERFORMANCE OF THIS SOURCE CODE.  
*
* U.S. Government End Users.  This source code is a "commercial item" as 
* that term is defined at 48 C.F.R. 2.101 (OCT 1995), consisting  of 
* "commercial computer software" and "commercial computer software 
* documentation" as such terms are used in 48 C.F.R. 12.212 (SEPT 1995) 
* and is provided to the U.S. Government only as a commercial end item.  
* Consistent with 48 C.F.R.12.212 and 48 C.F.R. 227.7202-1 through 
* 227.7202-4 (JUNE 1995), all U.S. Government End Users acquire the 
* source code with only those rights set forth herein.
*/

#ifdef _WIN32
#  define NOMINMAX 
#endif

// includes, system
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <fstream>
#include <omp.h>
using namespace std;
// includes, project

// includes, kernels
#include "vector_reduction_kernel.h"

////////////////////////////////////////////////////////////////////////////////
// declaration, forward
void runTest( int argc, char** argv);

double computeOnDevice(double* h_data, int array_mem_size);

extern "C" void computeGold( double* reference, double* idata, const unsigned int len);

////////////////////////////////////////////////////////////////////////////////
// Program main
////////////////////////////////////////////////////////////////////////////////
int 
main( int argc, char** argv) 
{
    runTest( argc, argv);
    return EXIT_SUCCESS;
}

////////////////////////////////////////////////////////////////////////////////
//! Run test
////////////////////////////////////////////////////////////////////////////////
void
runTest( int argc, char** argv) 
{
    unsigned int num_elements;
    int M = 0;

    if (argc != 3) {
      printf ("usgae: %s number M\n", argv[0]);
      exit(1);
    }

    num_elements = atoi(argv[1]);
    M = atoi(argv[2]);
    
    const unsigned int array_mem_size = sizeof(double) * num_elements;
    double* h_data;
    if ((h_data = (double*) malloc(array_mem_size)) == NULL)
      perror("malloc");
    //if (posix_memalign((void **)&h_data, 8, array_mem_size) != 0)
     // perror("aligned malloc");
    srand(26);
    for( unsigned int i = 0; i < num_elements; ++i) 
      h_data[i] = (double)((1000*rand()) % (2 * M + 1) - M);

    // compute reference solution
    double reference = 0.0f;  
    float cpu;
    cudaEvent_t cpu_start, cpu_end;
    cudaEventCreate(&cpu_start);
    cudaEventCreate(&cpu_end);
    cudaEventRecord(cpu_start, NULL);
    computeGold(&reference , h_data, num_elements);
    cudaEventRecord(cpu_end, NULL);
    cudaEventSynchronize(cpu_end);
    cudaEventElapsedTime(&cpu, cpu_start, cpu_end);
    printf("Cpu time = %f\n", cpu);
    
    // **===-------- Modify the body of this function -----------===**
    double result = computeOnDevice(h_data, num_elements);
    // **===-----------------------------------------------------------===**


    // Run accuracy test
    double epsilon = 0.0001;
    unsigned int result_regtest = (abs(result - reference) <= epsilon);
    printf( "Test %s\n", (1 == result_regtest) ? "PASSED" : "FAILED");
    printf( "device: %lf  host: %lf\n", result, reference);
    // cleanup memory
    free( h_data);
}

// **===----------------- Modify this function ---------------------===**
// Take h_data from host, copies it to device, setup grid and thread 
// dimensions, excutes kernel function, and copy result of scan back
// to h_data.
// Note: double* h_data is both the input and the output of this function.
double computeOnDevice(double* h_data, int num_elements)
{
  double result;
  double *d_data;
  int memSize = sizeof(double)*num_elements;
  cudaError_t err;
  // Allocate device memory
  err = cudaMalloc((void **)&d_data, memSize);
  if (err != cudaSuccess)
    printf("Error in cudaMalloc\n");
    
  float gpu;
  cudaEvent_t gpu_start, gpu_end;
  cudaEventCreate(&gpu_start);
  cudaEventCreate(&gpu_end);

  // Copy data to device
  cudaEventRecord(gpu_start, NULL);
  err = cudaMemcpy(d_data, h_data, memSize, cudaMemcpyHostToDevice);
  //if (err != cudaSuccess)
  //  printf("Error in cudaMemcpy\n");

  // Execute kernel
  int block = 1024;
  unsigned int num_blocks = (num_elements+1023)/1024;
  reduction<<<num_blocks, block>>>(d_data, num_elements);
  do {
  int new_elements = num_blocks;
  num_blocks = (new_elements+1023)/1024;
  //printf("num_blocks = %d\n", num_blocks);
  reduction<<<num_blocks, block>>>(d_data, new_elements);
  } while (num_blocks > 1);

  // Get data back
  err = cudaMemcpy(&result, d_data, sizeof(double), cudaMemcpyDeviceToHost);
  cudaEventRecord(gpu_end, NULL);
  cudaEventSynchronize(gpu_end);
  cudaEventElapsedTime(&gpu, gpu_start, gpu_end);
  printf("Gpu time = %f\n", gpu);
  //if (err != cudaSuccess)
  //  printf("Error in cudaMemcpy\n");

  // Cleanup and return the result
  cudaFree(d_data);
  return result;

}
     
