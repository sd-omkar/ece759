/* ============================================================

Copyright (c) 2009 Advanced Micro Devices, Inc.  All rights reserved.
 
Redistribution and use of this material is permitted under the following 
conditions:
 
Redistributions must retain the above copyright notice and all terms of this 
license.
 
In no event shall anyone redistributing or accessing or using this material 
commence or participate in any arbitration or legal action relating to this 
material against Advanced Micro Devices, Inc. or any copyright holders or 
contributors. The foregoing shall survive any expiration or termination of 
this license or any agreement or access or use related to this material. 

ANY BREACH OF ANY TERM OF THIS LICENSE SHALL RESULT IN THE IMMEDIATE REVOCATION 
OF ALL RIGHTS TO REDISTRIBUTE, ACCESS OR USE THIS MATERIAL.

THIS MATERIAL IS PROVIDED BY ADVANCED MICRO DEVICES, INC. AND ANY COPYRIGHT 
HOLDERS AND CONTRIBUTORS "AS IS" IN ITS CURRENT CONDITION AND WITHOUT ANY 
REPRESENTATIONS, GUARANTEE, OR WARRANTY OF ANY KIND OR IN ANY WAY RELATED TO 
SUPPORT, INDEMNITY, ERROR FREE OR UNINTERRUPTED OPERA TION, OR THAT IT IS FREE 
FROM DEFECTS OR VIRUSES.  ALL OBLIGATIONS ARE HEREBY DISCLAIMED - WHETHER 
EXPRESS, IMPLIED, OR STATUTORY - INCLUDING, BUT NOT LIMITED TO, ANY IMPLIED 
WARRANTIES OF TITLE, MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, 
ACCURACY, COMPLETENESS, OPERABILITY, QUALITY OF SERVICE, OR NON-INFRINGEMENT. 
IN NO EVENT SHALL ADVANCED MICRO DEVICES, INC. OR ANY COPYRIGHT HOLDERS OR 
CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, PUNITIVE,
EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, REVENUE, DATA, OR PROFITS; OR 
BUSINESS INTERRUPTION) HOWEVER CAUSED OR BASED ON ANY THEORY OF LIABILITY 
ARISING IN ANY WAY RELATED TO THIS MATERIAL, EVEN IF ADVISED OF THE POSSIBILITY 
OF SUCH DAMAGE. THE ENTIRE AND AGGREGATE LIABILITY OF ADVANCED MICRO DEVICES, 
INC. AND ANY COPYRIGHT HOLDERS AND CONTRIBUTORS SHALL NOT EXCEED TEN DOLLARS 
(US $10.00). ANYONE REDISTRIBUTING OR ACCESSING OR USING THIS MATERIAL ACCEPTS 
THIS ALLOCATION OF RISK AND AGREES TO RELEASE ADVANCED MICRO DEVICES, INC. AND 
ANY COPYRIGHT HOLDERS AND CONTRIBUTORS FROM ANY AND ALL LIABILITIES, 
OBLIGATIONS, CLAIMS, OR DEMANDS IN EXCESS OF TEN DOLLARS (US $10.00). THE 
FOREGOING ARE ESSENTIAL TERMS OF THIS LICENSE AND, IF ANY OF THESE TERMS ARE 
CONSTRUED AS UNENFORCEABLE, FAIL IN ESSENTIAL PURPOSE, OR BECOME VOID OR 
DETRIMENTAL TO ADVANCED MICRO DEVICES, INC. OR ANY COPYRIGHT HOLDERS OR 
CONTRIBUTORS FOR ANY REASON, THEN ALL RIGHTS TO REDISTRIBUTE, ACCESS OR USE 
THIS MATERIAL SHALL TERMINATE IMMEDIATELY. MOREOVER, THE FOREGOING SHALL 
SURVIVE ANY EXPIRATION OR TERMINATION OF THIS LICENSE OR ANY AGREEMENT OR 
ACCESS OR USE RELATED TO THIS MATERIAL.

NOTICE IS HEREBY PROVIDED, AND BY REDISTRIBUTING OR ACCESSING OR USING THIS 
MATERIAL SUCH NOTICE IS ACKNOWLEDGED, THAT THIS MATERIAL MAY BE SUBJECT TO 
RESTRICTIONS UNDER THE LAWS AND REGULATIONS OF THE UNITED STATES OR OTHER 
COUNTRIES, WHICH INCLUDE BUT ARE NOT LIMITED TO, U.S. EXPORT CONTROL LAWS SUCH 
AS THE EXPORT ADMINISTRATION REGULATIONS AND NATIONAL SECURITY CONTROLS AS 
DEFINED THEREUNDER, AS WELL AS STATE DEPARTMENT CONTROLS UNDER THE U.S. 
MUNITIONS LIST. THIS MATERIAL MAY NOT BE USED, RELEASED, TRANSFERRED, IMPORTED,
EXPORTED AND/OR RE-EXPORTED IN ANY MANNER PROHIBITED UNDER ANY APPLICABLE LAWS, 
INCLUDING U.S. EXPORT CONTROL LAWS REGARDING SPECIFICALLY DESIGNATED PERSONS, 
COUNTRIES AND NATIONALS OF COUNTRIES SUBJECT TO NATIONAL SECURITY CONTROLS. 
MOREOVER, THE FOREGOING SHALL SURVIVE ANY EXPIRATION OR TERMINATION OF ANY 
LICENSE OR AGREEMENT OR ACCESS OR USE RELATED TO THIS MATERIAL.

NOTICE REGARDING THE U.S. GOVERNMENT AND DOD AGENCIES: This material is 
provided with "RESTRICTED RIGHTS" and/or "LIMITED RIGHTS" as applicable to 
computer software and technical data, respectively. Use, duplication, 
distribution or disclosure by the U.S. Government and/or DOD agencies is 
subject to the full extent of restrictions in all applicable regulations, 
including those found at FAR52.227 and DFARS252.227 et seq. and any successor 
regulations thereof. Use of this material by the U.S. Government and/or DOD 
agencies is acknowledgment of the proprietary rights of any copyright holders 
and contributors, including those of Advanced Micro Devices, Inc., as well as 
the provisions of FAR52.227-14 through 23 regarding privately developed and/or 
commercial computer software.

This license forms the entire agreement regarding the subject matter hereof and 
supersedes all proposals and prior discussions and writings between the parties 
with respect thereto. This license does not affect any ownership, rights, title,
or interest in, or relating to, this material. No terms of this license can be 
modified or waived, and no breach of this license can be excused, unless done 
so in a writing signed by all affected parties. Each term of this license is 
separately enforceable. If any term of this license is determined to be or 
becomes unenforceable or illegal, such term shall be reformed to the minimum 
extent necessary in order for this license to remain in effect in accordance 
with its terms as modified by such reformation. This license shall be governed 
by and construed in accordance with the laws of the State of Texas without 
regard to rules on conflicts of law of any state or jurisdiction or the United 
Nations Convention on the International Sale of Goods. All disputes arising out 
of this license shall be subject to the jurisdiction of the federal and state 
courts in Austin, Texas, and all defenses are hereby waived concerning personal 
jurisdiction and venue of these courts.

============================================================ */


#include <iostream>
#include <iomanip>
#include <string>
#include <vector>
#include <cstdio>
#include <stdlib.h>
#include <pmmintrin.h>
#include <xmmintrin.h>
#include <omp.h>
#include "Timer.h"
#include "Params.h"

#define SSE 1

using std::cout;
using std::cerr;
using std::endl;
using std::setw;
using std::string;

/////////////////////////////////////////////////////////////////
// Macros 
/////////////////////////////////////////////////////////////////

#define FREE(ptr, free_val) \
    if (ptr != free_val)    \
    {                       \
        free(ptr);          \
        ptr = free_val;     \
    }

/////////////////////////////////////////////////////////////////
// Globals
/////////////////////////////////////////////////////////////////

struct hostBufferStruct
{
    float * pInput;
    float * pFilter;
    float * pOutputCPU;
} hostBuffers;

struct timerStruct
{
    double dCpuTime;
    CPerfCounter counter;
} timers;

/////////////////////////////////////////////////////////////////
// Host buffers
/////////////////////////////////////////////////////////////////

void InitHostBuffers()
{
    hostBuffers.pInput  = NULL;
    hostBuffers.pOutputCPU = NULL;

    /////////////////////////////////////////////////////////////////
    // Allocate and initialize memory used by host 
    /////////////////////////////////////////////////////////////////
    int sizeInBytes = params.nInWidth * params.nInHeight * sizeof(float);
    hostBuffers.pInput = (float *) malloc(sizeInBytes);
    if (!hostBuffers.pInput) 
        throw(string("InitHostBuffers()::Could not allocate memory"));

    int sizeOutBytes = params.nWidth * params.nHeight * sizeof(float);
    hostBuffers.pOutputCPU = (float *) malloc(sizeOutBytes);
    if (!hostBuffers.pOutputCPU) 
        throw(string("InitHostBuffers()::Could not allocate memory"));

    int filterSizeBytes = params.nFilterWidth * params.nFilterWidth * sizeof(float);
    hostBuffers.pFilter = (float *) malloc(filterSizeBytes);
    if (!hostBuffers.pFilter) 
        throw(string("InitHostBuffers()::Could not allocate memory"));

    srand(0);
    #pragma omp parallel for num_threads(DEFAULT_NUM_THREADS)
    for (int i = 0; i < params.nInWidth * params.nInHeight; i++)
    {
        hostBuffers.pInput[i] = float(rand());
    }

    double dFilterSum = 0;
    int nFilterSize = params.nFilterWidth*params.nFilterWidth;
    for (int i = 0; i < nFilterSize; i++)
    {
        hostBuffers.pFilter[i] = float(rand());
        dFilterSum += hostBuffers.pFilter[i];
    }
    for (int i = 0; i < nFilterSize; i++)
        hostBuffers.pFilter[i] /= dFilterSum;
}

void ClearBuffer(float * pBuf)
{
    #pragma omp parallel for num_threads(DEFAULT_NUM_THREADS)
    for (int i = 0; i < params.nWidth*params.nHeight; i++)
    {
        pBuf[i] = -999.999f;
    }
}

void ReleaseHostBuffers()
{
    FREE(hostBuffers.pInput, NULL);
    FREE(hostBuffers.pOutputCPU, NULL);
    FREE(hostBuffers.pFilter, NULL);
}

/////////////////////////////////////////////////////////////////
// Convolution on CPU 
/////////////////////////////////////////////////////////////////

void Convolve(float * pInput, float * pFilter, float * pOutput,
          const int nInWidth, const int nWidth, const int nHeight,
          const int nFilterWidth, const int nNumThreads)
{
    #pragma omp parallel for num_threads(nNumThreads)
    for (int yOut = 0; yOut < nHeight; yOut++)
    {
        const int yInTopLeft = yOut;

        for (int xOut = 0; xOut < nWidth; xOut++)
        {
            const int xInTopLeft = xOut;

            // Core
            float sum = 0;
            __m128 prod __attribute__ ((aligned (16))) = _mm_set1_ps(0.0f);
            __m128 acc __attribute__ ((aligned (16))) = _mm_set1_ps(0.0f);
            __m128 data __attribute__ ((aligned (16)));
            __m128 kernel __attribute__ ((aligned (16)));
            for (int r = 0; r < nFilterWidth; r++)
            {
                const int idxFtmp = r * nFilterWidth;

                const int yIn = yInTopLeft + r;
                const int idxIntmp = yIn * nInWidth + xInTopLeft;

                if (!SSE) {
                for (int c = 0; c < nFilterWidth; c++)
                {
                    const int idxF  = idxFtmp  + c;
                    const int idxIn = idxIntmp + c;    
                    sum += pFilter[idxF]*pInput[idxIn];
                }
                }
                else {
                for (int c = 0; c < nFilterWidth; c+=4)
                {
                  const int idxF  = idxFtmp  + c;
                  const int idxIn = idxIntmp + c;    
                  data = _mm_loadu_ps(pInput + idxIn);
                  kernel = _mm_loadu_ps(pFilter + idxF);
                  prod = _mm_mul_ps(data, kernel);
                  acc = _mm_add_ps(prod, acc);
                }
                }
            } 
            if (SSE) {
            __m128 t1 = _mm_hadd_ps(acc, acc);
            __m128 t2 = _mm_hadd_ps(t1,t1);
            float sum2 = _mm_cvtss_f32(t2);
            const int idxOut = yOut * nWidth + xOut;
            pOutput[idxOut] = sum2;
            }
            else {
            const int idxOut = yOut * nWidth + xOut;
            pOutput[idxOut] = sum;
            }

        } 
    }
}

void RunCPU(int run)
{
    if (params.bCPUTiming)
    {
        cout << "\n********    Starting CPU (" << params.ompThreads[run]
             << "-threads) run    ********" << endl;

        timers.counter.Reset();
        timers.counter.Start();

        for (int i = 0; i < params.nIterations; i++)
            Convolve(hostBuffers.pInput, hostBuffers.pFilter, hostBuffers.pOutputCPU,
                        params.nInWidth,
                        params.nWidth, params.nHeight, 
                        params.nFilterWidth,
                        params.ompThreads[run]);

        timers.counter.Stop();
        timers.dCpuTime = timers.counter.GetElapsedTime()/double(params.nIterations);
    }
}

/////////////////////////////////////////////////////////////////
// Print info, timing 
/////////////////////////////////////////////////////////////////

void PrintInfo()
{
    cout << endl;
    cout << "Width:          " << params.nWidth << endl;
    cout << "Height:         " << params.nHeight << endl;
    cout << "Filter Size:    " << params.nFilterWidth << " x "
                                << params.nFilterWidth << endl;
    cout << "Iterations:     " << params.nIterations << endl;
    cout << "CPU Timing:     " << (params.bCPUTiming ? "True":"False") << endl;
    cout << "Testing:        ";

    if (params.bCPUTiming)
        for (int run = 0; run < params.nOmpRuns; run++)
            cout << "CPU (" << params.ompThreads[run] << "-threads) , ";

    cout << endl << endl;
}

void PrintCPUTime(int run)
{
    if (params.bCPUTiming)
        cout << "CPU (" << params.ompThreads[run] << "-threads): " << timers.dCpuTime << endl;
}

/////////////////////////////////////////////////////////////////
// Main 
/////////////////////////////////////////////////////////////////

int main(int argc, char * argv[])
{
    try
    {
        InitParams(argc, argv);
        PrintInfo();

        InitHostBuffers();

        for (int run = 0; run < params.nOmpRuns; run++)
        {
            ClearBuffer(hostBuffers.pOutputCPU);
            RunCPU(run);
            PrintCPUTime(run);
        }

        ReleaseHostBuffers();
    }
    catch(std::string msg)
    {
        cerr << "Exception caught in main(): " << msg << endl;
        ReleaseHostBuffers();
    }
    catch(...)
    {
        cerr << "Exception caught in main()" << endl;
        ReleaseHostBuffers();
    }

    return 0;
}
