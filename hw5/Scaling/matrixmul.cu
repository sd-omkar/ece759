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

/* Matrix multiplication: C = A * B.
* Host code.
*/

// includes, system
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <math.h>
#include <fstream>
using namespace std;
// includes, project
//#include <cutil.h>

// includes, kernels
#include "matrixmul_kernel.cu"

// include helper header
#include "tiledMatMult.h"

////////////////////////////////////////////////////////////////////////////////
// declarations, forward

extern "C"
void computeGold(float*, const float*, const float*, unsigned int, unsigned int, unsigned int);

Matrix AllocateDeviceMatrix(const Matrix M);
Matrix AllocateMatrix(int height, int width, int init);
Matrix PaddedMatrix(const Matrix& M, const int BLKSZ, int copyEntries);
void CopyToDeviceMatrix(Matrix Mdevice, const Matrix Mhost);
void CopyFromDeviceMatrix(Matrix Mhost, const Matrix Mdevice);
void ExtractFromPadded(Matrix M, const Matrix& Mpadded);
bool CompareResults(float* A, float* B, int elements, float eps);
int ReadFile(Matrix* M, char* file_name);
bool ReadParams(int* params, int size, char* file_name);
void WriteFile(Matrix M, char* file_name);
void FreeDeviceMatrix(Matrix* M);
void FreeMatrix(Matrix* M);

void MatrixMulOnDevice(const Matrix M, const Matrix N, Matrix P);

#define MAT_MAX_SIZE 4096
////////////////////////////////////////////////////////////////////////////////
// Program main
////////////////////////////////////////////////////////////////////////////////
int main(int argc, char** argv) {

   Matrix  M;
   Matrix  N;
   Matrix  P;
   int errorM = 0, errorN = 0;

  // Timing variables
   float cpu;
   cudaEvent_t cpu_start, cpu_end;
   cudaEventCreate(&cpu_start);
   cudaEventCreate(&cpu_end);

   srand(52);

   if(argc != 5 && argc != 4 & argc != 3) 
   {
      // Allocate and initialize the matrices
      int dummy;
      dummy = rand() % MAT_MAX_SIZE;
      int Mh = (dummy==0? 1: dummy);
      dummy = rand() % MAT_MAX_SIZE;
      int Mw = (dummy==0? 1: dummy);
      M  = AllocateMatrix(Mh, Mw, 1);
      dummy = rand() % MAT_MAX_SIZE;
      int Nw = (dummy==0? 1: dummy);
      N  = AllocateMatrix(Mw, Nw, 1);
      P  = AllocateMatrix(Mh, Nw, 0);
   }
   else if (argc == 3) {
     int x = atoi(argv[1]);
     int y = atoi(argv[2]);
      M  = AllocateMatrix(x, y, 1);
      N  = AllocateMatrix(x, y, 1);		
      P  = AllocateMatrix(x, y, 0);
   }
   else
   {
      // Allocate and read in matrices from disk
      int* params = (int*)malloc(3 * sizeof(int));
      unsigned int data_read = 3;
      ReadParams(params, data_read, argv[1]);
      if(data_read != 3){
         printf("Error reading parameter file\n");
         return 1;
      }

      M  = AllocateMatrix(params[0], params[1], 0);
      N  = AllocateMatrix(params[1], params[2], 0);		
      P  = AllocateMatrix(params[0], params[2], 0);
      errorM = ReadFile(&M, argv[2]);
      errorN = ReadFile(&N, argv[3]);
      if(errorM  || errorN )
      {
         printf("Error reading input files %d, %d\n", errorM, errorN);
         return 1;
      }
   }

   // M * N on the device
   MatrixMulOnDevice(M, N, P);

   printf("GPU computation complete\n");
   // compute the matrix multiplication on the CPU for comparison
   Matrix reference = AllocateMatrix(P.height, P.width, 0);
   printf("Start CPU computation\n");
   cudaEventRecord(cpu_start, NULL);
   computeGold(reference.elements, M.elements, N.elements, M.height, M.width, N.width);
   cudaEventRecord(cpu_end, NULL);
   cudaEventSynchronize(cpu_end);
   cudaEventElapsedTime(&cpu, cpu_start, cpu_end);

   printf("CPU computation complete in %f ms\n", cpu);
   // in this case check if the result is equivalent to the expected soluion
   bool res = CompareResults(reference.elements, P.elements, P.height*P.width, 0.01f);
   printf("Test %s\n", (1 == res) ? "PASSED" : "FAILED");
   printf("Dimension M[height,width]: %d  %d\n", M.height, M.width);
   printf("Dimension N[height,width]: %d  %d\n", N.height, N.width);

   if(argc == 5)
   {
      WriteFile(P, argv[4]);
   }
   else if(argc == 2)
   {
      WriteFile(P, argv[1]);
   }   

   // Free matrices
   FreeMatrix(&M);
   FreeMatrix(&N);
   FreeMatrix(&P);
   return 0;
}


////////////////////////////////////////////////////////////////////////////////
//  Multiply on the device
////////////////////////////////////////////////////////////////////////////////
void MatrixMulOnDevice(const Matrix Munpadded, const Matrix Nunpadded, Matrix Punpadded)
{
   // I'm going to take care of the padding here...
   Matrix M = PaddedMatrix(Munpadded, BLOCK_SIZE, 1);
   Matrix N = PaddedMatrix(Nunpadded, BLOCK_SIZE, 1);
   Matrix P = PaddedMatrix(Punpadded, BLOCK_SIZE, 0);

   // Timing variables
   float incl, excl;
   cudaEvent_t incl_start, incl_end;
   cudaEvent_t excl_start, excl_end;
   cudaEventCreate(&incl_start);
   cudaEventCreate(&incl_end);
   cudaEventCreate(&excl_start);
   cudaEventCreate(&excl_end);

   // Load M and N to the device
   Matrix Md = AllocateDeviceMatrix(M);
   Matrix Nd = AllocateDeviceMatrix(N);
   Matrix Pd = AllocateDeviceMatrix(P);
   
   // Setup the execution configuration
   // Come up with the number of blocks you need to call
   int bx = (Pd.width % BLOCK_SIZE == 0)
            ? Pd.width / BLOCK_SIZE
            : Pd.width / BLOCK_SIZE + 1;

   int by = (Pd.height % BLOCK_SIZE == 0)
            ? Pd.height / BLOCK_SIZE
            : Pd.height / BLOCK_SIZE + 1;
   dim3 grid(bx, by, 1);
   dim3 block(BLOCK_SIZE, BLOCK_SIZE, 1);
   
  cudaEventRecord(incl_start, NULL); 
   CopyToDeviceMatrix(Md, M);
   CopyToDeviceMatrix(Nd, N);
   CopyToDeviceMatrix(Pd, Punpadded); // Clear memory

   // Launch the device computation threads
  cudaEventRecord(excl_start, NULL); 
   MatrixMulKernel<<<grid, block>>>(Md, Nd, Pd);
  cudaEventRecord(excl_end, NULL); 
  cudaEventSynchronize(excl_end);
  cudaEventElapsedTime(&excl, excl_start, excl_end);

   // Read P from the device and then extract the submatrix with the result
   CopyFromDeviceMatrix(P, Pd); 
  cudaEventRecord(incl_end, NULL); 
  cudaEventSynchronize(incl_end);
  cudaEventElapsedTime(&incl, incl_start, incl_end);

   ExtractFromPadded(Punpadded, P);

   // Free device matrices
   FreeDeviceMatrix(&Md);
   FreeDeviceMatrix(&Nd);
   FreeDeviceMatrix(&Pd);

   // Free the helper padded matrices
   FreeMatrix(&M);
   FreeMatrix(&N);
   FreeMatrix(&P);
   printf("GPU Time:\n Exclusive = %f ms\n Inclusive = %f ms\n", excl, incl);
}

// Allocate a device matrix of same size as M.
Matrix AllocateDeviceMatrix(const Matrix M)
{
   Matrix Mdevice = M;
   int size = M.width * M.height * sizeof(float);
   cudaMalloc((void**)&Mdevice.elements, size);
   return Mdevice;
}

// Allocate a device matrix of dimensions height*width
//	If init == 0, initialize to all zeroes.  
//	If init == 1, perform random initialization.
//  If init == 2, initialize matrix parameters, but do not allocate memory 
Matrix AllocateMatrix(int height, int width, int init)
{
   Matrix M;
   M.width = M.pitch = width;
   M.height = height;
   int size = M.width * M.height;
   M.elements = NULL;

   // don't allocate memory on option 2
   if(init == 2)
      return M;

   M.elements = (float*) malloc(size*sizeof(float));

   for(unsigned int i = 0; i < M.height * M.width; i++)
   {
      M.elements[i] = (init == 0) ? (0.0f) : (rand()*3 / (float)RAND_MAX);
   }
   return M;
}	

// Copy a host matrix to a device matrix.
void CopyToDeviceMatrix(Matrix Mdevice, const Matrix Mhost)
{
   int size = Mhost.width * Mhost.height * sizeof(float);
   Mdevice.height = Mhost.height;
   Mdevice.width = Mhost.width;
   Mdevice.pitch = Mhost.pitch;
   cudaMemcpy(Mdevice.elements, Mhost.elements, size, 
      cudaMemcpyHostToDevice);
}

// Copy a device matrix to a host matrix.
void CopyFromDeviceMatrix(Matrix Mhost, const Matrix Mdevice)
{
   int size = Mdevice.width * Mdevice.height * sizeof(float);
   cudaMemcpy(Mhost.elements, Mdevice.elements, size, 
      cudaMemcpyDeviceToHost);
}

// Free a device matrix.
void FreeDeviceMatrix(Matrix* M)
{
   cudaFree(M->elements);
   M->elements = NULL;
}

// Free a host Matrix
void FreeMatrix(Matrix* M)
{
   free(M->elements);
   M->elements = NULL;
}


//compare the data stored in two arrays on the host
bool CompareResults(float* A, float* B, int elements, float eps)
{
   for(unsigned int i = 0; i < elements; i++){
      float error = A[i]-B[i];
      if(error>eps){
         return false;
      } 
   }
   return true;
}

bool ReadParams(int* params, int size, char* file_name){
   ifstream ifile(file_name);
   int i=0;
   for(int i=0; i<size; i++){
      if(ifile.fail()==false){
         ifile>>params[i];
      }
   }
   return (i==size)? 1:0;

}


// Read a floating point matrix in from file
// Returns zero if the number of elements read is 
//  equals M.height * M.width, and 1 otherwise
int ReadFile(Matrix* M, char* file_name)
{
   unsigned int data_read = M->height*M->width;
   std::ifstream ifile(file_name);
   unsigned int i = 0;
   for(; i < data_read; i++){
      ifile>>M->elements[i];
   }
   ifile.close();
   return (i==data_read)? 0:1;
}

// Write a 16x16 floating point matrix to file
void WriteFile(Matrix M, char* file_name)
{
   std::ofstream ofile(file_name);
   for(unsigned int i = 0; i < M.width*M.height; i++){
      ofile<<M.elements[i];
   }
   ofile.close();
}

// Given a matrix M, produce a padded matrix that has both dimensions a 
// multiple of BLKSZ.  The elements of the original M matrix can be 
// copied over to the new padded matrix provided the flag copyEntries
// is not zero.  Note that the assumption is that M.pitch <= M.width;
Matrix PaddedMatrix(const Matrix& M, const int BLKSZ, int copyEntries)
{
   Matrix Mpadded;
   int dummy = (M.height - 1)/BLKSZ + 1;
   Mpadded.height = dummy*BLKSZ;
   dummy = (M.width - 1)/BLKSZ + 1;
   Mpadded.width = dummy*BLKSZ;
   Mpadded.pitch = M.width;
   Mpadded.elements = (float*) calloc(Mpadded.width*Mpadded.height, sizeof(float));
   
   // copy entries of original matrix only if asked to
   if( copyEntries ) {
      for( int i=0; i<M.height; i++) {
         memcpy(&Mpadded.elements[i*Mpadded.width], &M.elements[i*M.width], M.width*sizeof(float));
      }
   }
   return Mpadded;
}

// The submatrix of dimensions M.width by M.height of Mpadded is copied over 
// from Mpadded into M.  Note that the assumption is that M.pitch <= M.width;
void ExtractFromPadded(Matrix M, const Matrix& Mpadded)
{
   if( Mpadded.pitch!=M.width ) {
      printf("Error extracting data from padded matrix: Number of rows %d, %d\n", Mpadded.pitch, M.width);
      exit(1);
   }

   if( Mpadded.height<M.height ) {
      printf("Error extracting data from padded matrix: Height too small%d, %d\n", Mpadded.height, M.height);
      exit(1);
   }

   for( int i=0; i<M.height; i++) {
      memcpy(&M.elements[i*M.width], &Mpadded.elements[i*Mpadded.width], M.width*sizeof(float));
   }

   return;
}
