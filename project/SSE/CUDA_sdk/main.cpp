/*
 * Copyright 1993-2013 NVIDIA Corporation.  All rights reserved.
 *
 * Please refer to the NVIDIA end user license agreement (EULA) associated
 * with this source code for terms and conditions that govern your use of
 * this software. Any use, reproduction, disclosure, or distribution of
 * this software and related documentation outside the terms of the EULA
 * is strictly prohibited.
 *
 */

/*
* This sample implements a separable convolution filter
* of a 2D image with an arbitrary kernel.
*/

// CUDA runtime
#include <cuda_runtime.h>

// Utilities and system includes
#include <helper_functions.h>
#include <helper_cuda.h>

#include "convolutionSeparable_common.h"

////////////////////////////////////////////////////////////////////////////////
// Reference CPU convolution
////////////////////////////////////////////////////////////////////////////////
extern "C" void convolutionRowCPU(
    float *h_Result,
    float *h_Data,
    float *h_Kernel,
    int imageW,
    int imageH,
    int kernelR
);

extern "C" void convolutionColumnCPU(
    float *h_Result,
    float *h_Data,
    float *h_Kernel,
    int imageW,
    int imageH,
    int kernelR
);




////////////////////////////////////////////////////////////////////////////////
// Main program
////////////////////////////////////////////////////////////////////////////////
int main(int argc, char **argv)
{
    // start logs

    float
    *h_Kernel,
    *h_Input,
    *h_Buffer,
    *h_OutputCPU,
    *h_OutputGPU;

    float
    *d_Input,
    *d_Output,
    *d_Buffer;


    const int imageW = 8192;
    const int imageH = 8192;
    const int iterations = 1;

    StopWatchInterface *hTimer = NULL;

    //Use command-line specified CUDA device, otherwise use device with highest Gflops/s
    findCudaDevice(argc, (const char **)argv);

    sdkCreateTimer(&hTimer);
    int filter = KERNEL_LENGTH;
    printf("filter = %d\n", filter);
    h_Kernel    = (float *)malloc(KERNEL_LENGTH * sizeof(float));
    h_Input     = (float *)malloc(imageW * imageH * sizeof(float));
    h_Buffer    = (float *)malloc(imageW * imageH * sizeof(float));
    h_OutputCPU = (float *)malloc(imageW * imageH * sizeof(float));
    h_OutputGPU = (float *)malloc(imageW * imageH * sizeof(float));
    srand(200);

    for (unsigned int i = 0; i < KERNEL_LENGTH; i++)
    {
        h_Kernel[i] = (float)(rand() % 16);
    }

    for (unsigned i = 0; i < imageW * imageH; i++)
    {
        h_Input[i] = (float)(rand() % 16);
    }

    checkCudaErrors(cudaMalloc((void **)&d_Input,   imageW * imageH * sizeof(float)));
    checkCudaErrors(cudaMalloc((void **)&d_Output,  imageW * imageH * sizeof(float)));
    checkCudaErrors(cudaMalloc((void **)&d_Buffer , imageW * imageH * sizeof(float)));

    setConvolutionKernel(h_Kernel);
            sdkResetTimer(&hTimer);
            sdkStartTimer(&hTimer);
    checkCudaErrors(cudaMemcpy(d_Input, h_Input, imageW * imageH * sizeof(float), cudaMemcpyHostToDevice));


    for (int i = -1; i < iterations; i++)
    {
        //i == -1 -- warmup iteration
        if (i == 0)
        {
            checkCudaErrors(cudaDeviceSynchronize());
        }

        convolutionRowsGPU(
            d_Buffer,
            d_Input,
            imageW,
            imageH
        );

        convolutionColumnsGPU(
            d_Output,
            d_Buffer,
            imageW,
            imageH
        );
    }

    checkCudaErrors(cudaDeviceSynchronize());
    checkCudaErrors(cudaMemcpy(h_OutputGPU, d_Output, imageW * imageH * sizeof(float), cudaMemcpyDeviceToHost));

    sdkStopTimer(&hTimer);
    double gpuTime = 1 * sdkGetTimerValue(&hTimer) / (double)iterations;
    printf("Throughput = %.4f MPixels/sec, Time = %.5f s, Size = %u Pixels\n",
           (1.0e-6 * (double)(imageW * imageH)/ gpuTime), gpuTime);

            sdkResetTimer(&hTimer);
            sdkStartTimer(&hTimer);
    convolutionRowCPU(
        h_Buffer,
        h_Input,
        h_Kernel,
        imageW,
        imageH,
        KERNEL_RADIUS
    );

    convolutionColumnCPU(
        h_OutputCPU,
        h_Buffer,
        h_Kernel,
        imageW,
        imageH,
        KERNEL_RADIUS
    );
    sdkStopTimer(&hTimer);
    double cpuTime = 1 * sdkGetTimerValue(&hTimer) / (double)iterations;

    printf("cpu time = %.5f\n",  cpuTime);
    double sum = 0, delta = 0;

    for (unsigned i = 0; i < imageW * imageH; i++)
    {
        delta += (h_OutputGPU[i] - h_OutputCPU[i]) * (h_OutputGPU[i] - h_OutputCPU[i]);
        sum   += h_OutputCPU[i] * h_OutputCPU[i];
    }

    double L2norm = sqrt(delta / sum);


    checkCudaErrors(cudaFree(d_Buffer));
    checkCudaErrors(cudaFree(d_Output));
    checkCudaErrors(cudaFree(d_Input));
    free(h_OutputGPU);
    free(h_OutputCPU);
    free(h_Buffer);
    free(h_Input);
    free(h_Kernel);

    sdkDeleteTimer(&hTimer);

    cudaDeviceReset();

    if (L2norm > 1e-6)
    {
        printf("Test failed!\n");
        exit(EXIT_FAILURE);
    }

    printf("Test passed\n");
    exit(EXIT_SUCCESS);
}
