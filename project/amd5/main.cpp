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

#define __CL_ENABLE_EXCEPTIONS

#include <iostream>
#include <iomanip>
#include <string>
#include <fstream>
#include <iostream>
#include <vector>
#include <math.h>
#include <omp.h>
#include <CL/cl.hpp>
#include "Timer.h"
#include "Params.h"

using std::cout;
using std::cerr;
using std::endl;
using std::setw;
using std::string;
using std::ifstream;

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
    float * pOutputCL;
    float * pOutputCPU;
} hostBuffers;

struct oclBufferStruct
{
    cl::Buffer  inputCL;
    cl::Buffer  filterCL;
    cl::Buffer  outputCL;
} oclBuffers;

struct oclHandleStruct
{
    cl::Context             context;
    std::vector<cl::Device> devices;
    cl::CommandQueue        queue;
    cl::Program             program;
    std::vector<cl::Kernel> kernel;
} oclHandles;

struct timerStruct
{
    double dCpuTime;
    double dDeviceTotal;
    double dDeviceKernel;
    CPerfCounter counter;
} timers;

bool bCPUResultsReady = false;

/////////////////////////////////////////////////////////////////
// Host buffers
/////////////////////////////////////////////////////////////////

void InitHostBuffers()
{
    hostBuffers.pInput  = NULL;
    hostBuffers.pOutputCL = NULL;
    hostBuffers.pOutputCPU = NULL;

    /////////////////////////////////////////////////////////////////
    // Allocate and initialize memory used by host 
    /////////////////////////////////////////////////////////////////
    int sizeInBytes = params.nInWidth * params.nInHeight * sizeof(float);
    hostBuffers.pInput = (float *) malloc(sizeInBytes);
    if (!hostBuffers.pInput) 
        throw(string("InitHostBuffers()::Could not allocate memory"));

    int sizeOutBytes = params.nWidth * params.nHeight * sizeof(float);
    hostBuffers.pOutputCL = (float *) malloc(sizeOutBytes);
    if (!hostBuffers.pOutputCL) 
        throw(string("InitHostBuffers()::Could not allocate memory"));
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
    FREE(hostBuffers.pOutputCL, NULL);
    FREE(hostBuffers.pOutputCPU, NULL);
    FREE(hostBuffers.pFilter, NULL);
}

/////////////////////////////////////////////////////////////////
// Utils
/////////////////////////////////////////////////////////////////

/*
 * Converts the contents of a file into a string
 */
string FileToString(const string fileName)
{
    ifstream f(fileName.c_str(), ifstream::in | ifstream::binary);

    try
    {
        size_t size;
        char*  str;
        string s;

        if(f.is_open())
        {
            size_t fileSize;
            f.seekg(0, ifstream::end);
            size = fileSize = f.tellg();
            f.seekg(0, ifstream::beg);

            str = new char[size+1];
            if (!str) throw(string("Could not allocate memory"));

            f.read(str, fileSize);
            f.close();
            str[size] = '\0';
        
            s = str;
            delete [] str;
            return s;
        }
    }
    catch(std::string msg)
    {
        cerr << "Exception caught in FileToString(): " << msg << endl;
        if(f.is_open())
            f.close();
    }
    catch(...)
    {
        cerr << "Exception caught in FileToString()" << endl;
        if(f.is_open())
            f.close();
    }
    string errorMsg = "FileToString()::Error: Unable to open file "
                            + fileName;
    throw(errorMsg);
}

/////////////////////////////////////////////////////////////////
// CL Buffers
/////////////////////////////////////////////////////////////////

void InitCLBuffers()
{
    /////////////////////////////////////////////////////////////////
    // Create OpenCL memory buffers
    /////////////////////////////////////////////////////////////////
    oclBuffers.inputCL = cl::Buffer(oclHandles.context,
                                    CL_MEM_READ_ONLY | CL_MEM_USE_HOST_PTR,
                                    sizeof(cl_float) * params.nInWidth*params.nInHeight,
                                    hostBuffers.pInput);

    oclBuffers.outputCL = cl::Buffer(oclHandles.context, 
                                    CL_MEM_WRITE_ONLY | CL_MEM_USE_HOST_PTR,
                                    sizeof(cl_float) * params.nWidth*params.nHeight,
                                    hostBuffers.pOutputCL);

    oclBuffers.filterCL = cl::Buffer(oclHandles.context, 
                                    CL_MEM_READ_ONLY | CL_MEM_USE_HOST_PTR,
                                    sizeof(cl_float) * params.nFilterWidth*params.nFilterWidth,
                                    hostBuffers.pFilter);
}

/////////////////////////////////////////////////////////////////
// Initialize CL 
/////////////////////////////////////////////////////////////////

/*
 * Create Context, Device list, Command Queue
 * Load CL file, compile, link CL source 
 * Build program and kernel objects
 */
void InitCL()
{
    /////////////////////////////////////////////////////////////////
    // Find the available platforms and select one
    /////////////////////////////////////////////////////////////////
    std::vector<cl::Platform> allPlatforms;
    std::vector<cl::Platform>::iterator iter;
    cl::Platform targetPlatform;

    cl::Platform::get(&allPlatforms);

    if (!(allPlatforms.size() > 0))
        throw (string("InitCL()::Error: No platforms found (cl::Platform::get())"));

    /* Select the target platform. Default: first platform */
    targetPlatform = allPlatforms[0];
    for (iter = allPlatforms.begin(); iter != allPlatforms.end(); iter++)
    {
        if ( (*iter).getInfo<CL_PLATFORM_VENDOR>() == "Advanced Micro Devices, Inc.")
        {
            targetPlatform = *iter;
            break;
        }
    }

    /////////////////////////////////////////////////////////////////
    // Create an OpenCL context
    /////////////////////////////////////////////////////////////////
    cl_context_properties cprops[3] = { CL_CONTEXT_PLATFORM, (cl_context_properties)targetPlatform(), 0 };
    oclHandles.context = cl::Context(CL_DEVICE_TYPE_CPU, cprops);
        
    /////////////////////////////////////////////////////////////////
    // Detect OpenCL devices
    /////////////////////////////////////////////////////////////////
    oclHandles.devices = oclHandles.context.getInfo<CL_CONTEXT_DEVICES>();

    /////////////////////////////////////////////////////////////////
    // Create an OpenCL command queue
    /////////////////////////////////////////////////////////////////
    oclHandles.queue = cl::CommandQueue(oclHandles.context, oclHandles.devices[0]);

    /////////////////////////////////////////////////////////////////
    // Load CL file, build CL program object, create CL kernel object
    /////////////////////////////////////////////////////////////////
    std::string  sourceStr = FileToString(params.kernelFile);

    cl::Program::Sources sources(1, std::make_pair(sourceStr.c_str(), sourceStr.length()));
    oclHandles.program = cl::Program(oclHandles.context, sources);

    /* create a cl program executable with some #defines */
    char options[128];
    sprintf(options, "-DFILTER_WIDTH=%d", params.nFilterWidth);
    oclHandles.program.build(oclHandles.devices, options);

    for (int nKernel = 0; nKernel < params.nTotalKernels; nKernel++)
    {
        /* get a kernel object handle for a kernel with the given name */
        cl::Kernel kernel = cl::Kernel(oclHandles.program, params.kernelNames[nKernel].c_str());
        oclHandles.kernel.push_back(kernel);
    }
}

/////////////////////////////////////////////////////////////////
// Convolution on CL device 
/////////////////////////////////////////////////////////////////

/*          
 *        Bind variables and CL buffers to kernel arguments 
 */
void SetKernelArgs(int nKernel)
{
    /* input image */
    oclHandles.kernel[nKernel].setArg(0, oclBuffers.inputCL);

    /* filter */
    oclHandles.kernel[nKernel].setArg(1, oclBuffers.filterCL);

    /* output image */
    oclHandles.kernel[nKernel].setArg(2, oclBuffers.outputCL);

    /* input image width*/
    oclHandles.kernel[nKernel].setArg(3, params.nInWidth);

    /* filter width*/
    oclHandles.kernel[nKernel].setArg(4, params.nFilterWidth);
}

void EnqueueKernel(int nKernel, bool bBlocking = false)
{   
    cl::Event e;

    oclHandles.queue.enqueueNDRangeKernel(oclHandles.kernel[nKernel],
                                            cl::NDRange(),
                                            params.globalNDRange,
                                            params.localNDRange,
                                            0,
                                            &e);

    /* wait for the kernel call to finish execution */
    if (bBlocking)
        e.wait();
}

void RunCL(int nKernel)
{
    if (params.bDeviceKernelTiming)
    {
        cout << "\n********    Kernel " 
                << params.kernelNames[nKernel] << "    ********" << endl;

        SetKernelArgs(nKernel);

        oclHandles.queue.finish();
        timers.counter.Reset();
        timers.counter.Start();

        for (int i = 0; i < params.nIterations; i++)
            EnqueueKernel(nKernel);

        oclHandles.queue.finish();
        timers.counter.Stop();
        timers.dDeviceKernel = timers.counter.GetElapsedTime()/double(params.nIterations);
    }
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

            float sum = 0;
            for (int r = 0; r < nFilterWidth; r++)
            {
                const int idxFtmp = r * nFilterWidth;

                const int yIn = yInTopLeft + r;
                const int idxIntmp = yIn * nInWidth + xInTopLeft;

                for (int c = 0; c < nFilterWidth; c++)
                {
                    const int idxF  = idxFtmp  + c;
                    const int idxIn = idxIntmp + c;    
                    sum += pFilter[idxF]*pInput[idxIn];
                }
            } //for (int r = 0...

            const int idxOut = yOut * nWidth + xOut;
            pOutput[idxOut] = sum;

        } //for (int xOut = 0...
    } //for (int yOut = 0...
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

        bCPUResultsReady = true;
    }
}

/////////////////////////////////////////////////////////////////
// Verification of CL output 
/////////////////////////////////////////////////////////////////

inline bool Compare(const float val0, const float val1)
{
    const float epsilon = (float)1e-4;
    float diff = (val1 - val0);
    if (fabs(val1) > epsilon)
        diff /= val0;            
    return (fabs(diff) > epsilon);
}

int CompareBuffers(const float* buf0, const float* buf1, const unsigned int size)
{
    int nequal = 0;
    #pragma omp parallel for reduction(+:nequal) num_threads(DEFAULT_NUM_THREADS)
    for (int i = 0; i < size; ++i)
    {
        if ((Compare(buf0[i], buf1[i])))
            nequal++;
    }
    return nequal;    
}

void VerifyOutput()
{
    if (!params.bVerify)
        return;

    cout << "\n********    Starting Verification    ********" << endl;

    if (!bCPUResultsReady)
    {
        Convolve(hostBuffers.pInput, hostBuffers.pFilter, hostBuffers.pOutputCPU,
                    params.nInWidth,
                    params.nWidth, params.nHeight, 
                    params.nFilterWidth, DEFAULT_NUM_THREADS);
        bCPUResultsReady = true;
    }

    int nErrors = CompareBuffers(hostBuffers.pOutputCL, hostBuffers.pOutputCPU, params.nWidth*params.nHeight);

    if (nErrors == 0)
        cout << "\n********    Passed!    ********\n" << endl;
    else
        cout << "\n********    FAILED!!! With " << nErrors << " errors!    ********\n" << endl;
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
    cout << "Workgroup:      " << (params.localNDRange)[0] << " x " 
                                << (params.localNDRange)[1] << endl;
    cout << "Verify:         " << (params.bVerify ? "True":"False") << endl;
    cout << "CPU Timing:     " << (params.bCPUTiming ? "True":"False") << endl;
    cout << "Device (kernel):" << (params.bDeviceKernelTiming ? "True":"False") << endl;
    cout << "Testing:        ";

    if (params.bCPUTiming)
        for (int run = 0; run < params.nOmpRuns; run++)
            cout << "CPU (" << params.ompThreads[run] << "-threads) , ";

    for (int nKernel = 0; nKernel < params.nTotalKernels; nKernel++)
        if (params.bDeviceKernelTiming)
            cout << params.kernelNames[nKernel] 
                    << " , ";
    cout << endl << endl;
}

void PrintCPUTime(int run)
{
    if (params.bCPUTiming)
        cout << "CPU (" << params.ompThreads[run] << "-threads): " << timers.dCpuTime << endl;
}

void PrintKernelTime(int nKernel)
{
    if (params.bDeviceKernelTiming)
        cout << "Kernel: " << params.kernelNames[nKernel] 
                << " : " << timers.dDeviceKernel << endl;
    cout << endl;
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
        InitCL();
        InitCLBuffers();

        for (int run = 0; run < params.nOmpRuns; run++)
        {
            ClearBuffer(hostBuffers.pOutputCPU);
            RunCPU(run);
            PrintCPUTime(run);
        }

        for (int nKernel = 0; nKernel < params.nTotalKernels; nKernel++)
        {
            ClearBuffer(hostBuffers.pOutputCL);
            RunCL(nKernel);
            VerifyOutput();
            PrintKernelTime(nKernel);
        }

        ReleaseHostBuffers();
    }
    catch (cl::Error err)
    {
        cerr << "cl::Error: " << err.what() << "(" << err.err() << ")" << endl;
		if (err.err() == CL_BUILD_PROGRAM_FAILURE)
		{
			string str = oclHandles.program.getBuildInfo<CL_PROGRAM_BUILD_LOG>(oclHandles.devices[0]);
			cout << "Program Info: " << str << endl;
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
