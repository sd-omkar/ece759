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


//KERNEL_SIMPLE
__kernel void Convolve(const __global  float * pInput,
                        __constant float * pFilter,
                        __global  float * pOutput,
                        const int nInWidth,
                        const int nFilterWidth)
{
    const int nWidth = get_global_size(0);

    const int xOut = get_global_id(0);
    const int yOut = get_global_id(1);

    const int xInTopLeft = xOut;
    const int yInTopLeft = yOut;

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
    }
    const int idxOut = yOut * nWidth + xOut;
    pOutput[idxOut] = sum;
}
//KERNEL_SIMPLE

//KERNEL_SIMPLE_UNROLL
__kernel void Convolve_Unroll(const __global  float * pInput,
                        __constant float * pFilter,
                        __global  float * pOutput,
                        const int nInWidth,
                        const int nFilterWidth)
{
    const int nWidth = get_global_size(0);

    const int xOut = get_global_id(0);
    const int yOut = get_global_id(1);

    const int xInTopLeft = xOut;
    const int yInTopLeft = yOut;

    float sum = 0;
    for (int r = 0; r < nFilterWidth; r++)
    {
        const int idxFtmp = r * nFilterWidth;

        const int yIn = yInTopLeft + r;
        const int idxIntmp = yIn * nInWidth + xInTopLeft;

        int c = 0;
        while (c <= nFilterWidth-4)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;
            sum += pFilter[idxF]*pInput[idxIn];
            idxF++;
            idxIn++;
            sum += pFilter[idxF]*pInput[idxIn];
            idxF++;
            idxIn++;
            sum += pFilter[idxF]*pInput[idxIn];
            idxF++;
            idxIn++;
            sum += pFilter[idxF]*pInput[idxIn];
            c += 4;
        }
        for (int c1 = c; c1 < nFilterWidth; c1++)
        {
            const int idxF  = idxFtmp  + c1;
            const int idxIn = idxIntmp + c1;    
            sum += pFilter[idxF]*pInput[idxIn];
        }
    }
    const int idxOut = yOut * nWidth + xOut;
    pOutput[idxOut] = sum;
}
//KERNEL_SIMPLE_UNROLL

//KERNEL_SIMPLE_UNROLL_IF
__kernel void Convolve_UnrollIf(const __global  float * pInput,
                        __constant float * pFilter,
                        __global  float * pOutput,
                        const int nInWidth,
                        const int nFilterWidth)
{
    const int nWidth = get_global_size(0);

    const int xOut = get_global_id(0);
    const int yOut = get_global_id(1);

    const int xInTopLeft = xOut;
    const int yInTopLeft = yOut;

    float sum = 0;
    for (int r = 0; r < nFilterWidth; r++)
    {
        const int idxFtmp = r * nFilterWidth;

        const int yIn = yInTopLeft + r;
        const int idxIntmp = yIn * nInWidth + xInTopLeft;

        int c = 0;
        while (c <= nFilterWidth-4)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;
            sum += pFilter[idxF]*pInput[idxIn];
            idxF++;
            idxIn++;
            sum += pFilter[idxF]*pInput[idxIn];
            idxF++;
            idxIn++;
            sum += pFilter[idxF]*pInput[idxIn];
            idxF++;
            idxIn++;
            sum += pFilter[idxF]*pInput[idxIn];
            c += 4;
        }

        int cMod = nFilterWidth - c;
        if (cMod == 1)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;    
            sum += pFilter[idxF]*pInput[idxIn];
        }
        else if (cMod == 2)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;    
            sum += pFilter[idxF]*pInput[idxIn];
            sum += pFilter[idxF+1]*pInput[idxIn+1];
        }
        else if (cMod == 3)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;    
            sum += pFilter[idxF]*pInput[idxIn];
            sum += pFilter[idxF+1]*pInput[idxIn+1];
            sum += pFilter[idxF+2]*pInput[idxIn+2];
        }
    }
    const int idxOut = yOut * nWidth + xOut;
    pOutput[idxOut] = sum;
}
//KERNEL_SIMPLE_UNROLL_IF

//KERNEL_DEF
__kernel void Convolve_Def(const __global  float * pInput,
                        __constant float * pFilter,
                        __global  float * pOutput,
                        const int nInWidth,
                        const int nFilterWidth)
{
    const int nWidth = get_global_size(0);

    const int xOut = get_global_id(0);
    const int yOut = get_global_id(1);

    const int xInTopLeft = xOut;
    const int yInTopLeft = yOut;

    float sum = 0;
    for (int r = 0; r < FILTER_WIDTH; r++)
    {
        const int idxFtmp = r * FILTER_WIDTH;

        const int yIn = yInTopLeft + r;
        const int idxIntmp = yIn * nInWidth + xInTopLeft;

        for (int c = 0; c < FILTER_WIDTH; c++)
        {
            const int idxF  = idxFtmp  + c;
            const int idxIn = idxIntmp + c;
            sum += pFilter[idxF]*pInput[idxIn];
        }
    }
    const int idxOut = yOut * nWidth + xOut;
    pOutput[idxOut] = sum;
}
//KERNEL_DEF

//KERNEL_DEF_UNROLL
__kernel void Convolve_Def_Unroll(const __global  float * pInput,
                        __constant float * pFilter,
                        __global  float * pOutput,
                        const int nInWidth,
                        const int nFilterWidth)
{
    const int nWidth = get_global_size(0);

    const int xOut = get_global_id(0);
    const int yOut = get_global_id(1);

    const int xInTopLeft = xOut;
    const int yInTopLeft = yOut;

    float sum = 0;
    for (int r = 0; r < FILTER_WIDTH; r++)
    {
        const int idxFtmp = r * FILTER_WIDTH;

        const int yIn = yInTopLeft + r;
        const int idxIntmp = yIn * nInWidth + xInTopLeft;

        int c = 0;
        while (c <= FILTER_WIDTH-4)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;
            sum += pFilter[idxF]*pInput[idxIn];
            idxF++;
            idxIn++;
            sum += pFilter[idxF]*pInput[idxIn];
            idxF++;
            idxIn++;
            sum += pFilter[idxF]*pInput[idxIn];
            idxF++;
            idxIn++;
            sum += pFilter[idxF]*pInput[idxIn];
            c += 4;
        }
        for (int c1 = c; c1 < FILTER_WIDTH; c1++)
        {
            const int idxF  = idxFtmp  + c1;
            const int idxIn = idxIntmp + c1;    
            sum += pFilter[idxF]*pInput[idxIn];
        }
    }
    const int idxOut = yOut * nWidth + xOut;
    pOutput[idxOut] = sum;
}
//KERNEL_DEF_UNROLL

//KERNEL_DEF_UNROLL_IF
__kernel void Convolve_Def_UnrollIf(const __global  float * pInput,
                        __constant float * pFilter,
                        __global  float * pOutput,
                        const int nInWidth,
                        const int nFilterWidth)
{
    const int nWidth = get_global_size(0);

    const int xOut = get_global_id(0);
    const int yOut = get_global_id(1);

    const int xInTopLeft = xOut;
    const int yInTopLeft = yOut;

    float sum = 0;
    for (int r = 0; r < FILTER_WIDTH; r++)
    {
        const int idxFtmp = r * FILTER_WIDTH;

        const int yIn = yInTopLeft + r;
        const int idxIntmp = yIn * nInWidth + xInTopLeft;

        int c = 0;
        while (c <= FILTER_WIDTH-4)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;
            sum += pFilter[idxF]*pInput[idxIn];
            idxF++;
            idxIn++;
            sum += pFilter[idxF]*pInput[idxIn];
            idxF++;
            idxIn++;
            sum += pFilter[idxF]*pInput[idxIn];
            idxF++;
            idxIn++;
            sum += pFilter[idxF]*pInput[idxIn];
            c += 4;
        }

        int cMod = FILTER_WIDTH - c;
        if (cMod == 1)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;    
            sum += pFilter[idxF]*pInput[idxIn];
        }
        else if (cMod == 2)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;    
            sum += pFilter[idxF]*pInput[idxIn];
            sum += pFilter[idxF+1]*pInput[idxIn+1];
        }
        else if (cMod == 3)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;    
            sum += pFilter[idxF]*pInput[idxIn];
            sum += pFilter[idxF+1]*pInput[idxIn+1];
            sum += pFilter[idxF+2]*pInput[idxIn+2];
        }
    }
    const int idxOut = yOut * nWidth + xOut;
    pOutput[idxOut] = sum;
}
//KERNEL_DEF_UNROLL_IF

//KERNEL_FLOAT4
__kernel void Convolve_Float4(const __global  float * pInput,
                         __constant float * pFilter,
                         __global  float * pOutput,
                         const int nInWidth,
                         const int nFilterWidth)
{
    const int nWidth = get_global_size(0);

    const int xOut = get_global_id(0);
    const int yOut = get_global_id(1);

    const int xInTopLeft = xOut;
    const int yInTopLeft = yOut;

    float4 sum4 = 0;
    for (int r = 0; r < nFilterWidth; r++)
    {
        const int idxFtmp = r * nFilterWidth;

        const int yIn = yInTopLeft + r;
        const int idxIntmp = yIn * nInWidth + xInTopLeft;

        int c = 0;
        int c4 = 0;
        while (c <= nFilterWidth-4)
        {
            float4 filter4 = vload4(c4, pFilter+idxFtmp);
            float4 in4     = vload4(c4, pInput +idxIntmp);
            sum4 += in4 * filter4;
            c += 4;
            c4++;
        }
        for (int c1 = c; c1 < nFilterWidth; c1++)
        {
            const int idxF  = idxFtmp  + c1;
            const int idxIn = idxIntmp + c1;    
            sum4.x += pFilter[idxF]*pInput[idxIn];
        }
    }
    const int idxOut = yOut * nWidth + xOut;
    pOutput[idxOut] = sum4.x + sum4.y + sum4.z + sum4.w;
}
//KERNEL_FLOAT4

//KERNEL_FLOAT4_IF
__kernel void Convolve_Float4If(const __global  float * pInput,
                         __constant float * pFilter,
                         __global  float * pOutput,
                         const int nInWidth,
                         const int nFilterWidth)
{
    const int nWidth = get_global_size(0);

    const int xOut = get_global_id(0);
    const int yOut = get_global_id(1);

    const int xInTopLeft = xOut;
    const int yInTopLeft = yOut;

    float4 sum4 = 0;
    for (int r = 0; r < nFilterWidth; r++)
    {
        const int idxFtmp = r * nFilterWidth;

        const int yIn = yInTopLeft + r;
        const int idxIntmp = yIn * nInWidth + xInTopLeft;

        int c = 0;
        int c4 = 0;
        while (c <= nFilterWidth-4)
        {
            float4 filter4 = vload4(c4, pFilter+idxFtmp);
            float4 in4     = vload4(c4, pInput +idxIntmp);
            sum4 += in4 * filter4;
            c += 4;
            c4++;
        }

        int cMod = nFilterWidth - c;
        if (cMod == 1)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;    
            sum4.x += pFilter[idxF]*pInput[idxIn];
        }
        else if (cMod == 2)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;    
            sum4.x += pFilter[idxF]*pInput[idxIn];
            sum4.y += pFilter[idxF+1]*pInput[idxIn+1];
        }
        else if (cMod == 3)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;    
            sum4.x += pFilter[idxF]*pInput[idxIn];
            sum4.y += pFilter[idxF+1]*pInput[idxIn+1];
            sum4.z += pFilter[idxF+2]*pInput[idxIn+2];
        }
    }
    const int idxOut = yOut * nWidth + xOut;
    pOutput[idxOut] = sum4.x + sum4.y + sum4.z + sum4.w;
}
//KERNEL_FLOAT4_IF

//KERNEL_DEF_FLOAT4
__kernel void Convolve_Def_Float4(const __global  float * pInput,
                         __constant float * pFilter,
                         __global  float * pOutput,
                         const int nInWidth,
                         const int nFilterWidth)
{
    const int nWidth = get_global_size(0);

    const int xOut = get_global_id(0);
    const int yOut = get_global_id(1);

    const int xInTopLeft = xOut;
    const int yInTopLeft = yOut;

    float4 sum4 = 0;
    for (int r = 0; r < FILTER_WIDTH; r++)
    {
        const int idxFtmp = r * FILTER_WIDTH;

        const int yIn = yInTopLeft + r;
        const int idxIntmp = yIn * nInWidth + xInTopLeft;

        int c = 0;
        int c4 = 0;
        while (c <= FILTER_WIDTH-4)
        {
            float4 filter4 = vload4(c4, pFilter+idxFtmp);
            float4 in4     = vload4(c4, pInput +idxIntmp);
            sum4 += in4 * filter4;
            c += 4;
            c4++;
        }
        for (int c1 = c; c1 < FILTER_WIDTH; c1++)
        {
            const int idxF  = idxFtmp  + c1;
            const int idxIn = idxIntmp + c1;    
            sum4.x += pFilter[idxF]*pInput[idxIn];
        }
    }
    const int idxOut = yOut * nWidth + xOut;
    pOutput[idxOut] = sum4.x + sum4.y + sum4.z + sum4.w;
}
//KERNEL_DEF_FLOAT4

//KERNEL_DEF_FLOAT4_IF
__kernel void Convolve_Def_Float4If(const __global  float * pInput,
                         __constant float * pFilter,
                         __global  float * pOutput,
                         const int nInWidth,
                         const int nFilterWidth)
{
    const int nWidth = get_global_size(0);

    const int xOut = get_global_id(0);
    const int yOut = get_global_id(1);

    const int xInTopLeft = xOut;
    const int yInTopLeft = yOut;

    float4 sum4 = 0;
    for (int r = 0; r < FILTER_WIDTH; r++)
    {
        const int idxFtmp = r * FILTER_WIDTH;

        const int yIn = yInTopLeft + r;
        const int idxIntmp = yIn * nInWidth + xInTopLeft;

        int c = 0;
        int c4 = 0;
        while (c <= FILTER_WIDTH-4)
        {
            float4 filter4 = vload4(c4, pFilter+idxFtmp);
            float4 in4     = vload4(c4, pInput +idxIntmp);
            sum4 += in4 * filter4;
            c += 4;
            c4++;
        }

        int cMod = FILTER_WIDTH - c;
        if (cMod == 1)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;    
            sum4.x += pFilter[idxF]*pInput[idxIn];
        }
        else if (cMod == 2)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;    
            sum4.x += pFilter[idxF]*pInput[idxIn];
            sum4.y += pFilter[idxF+1]*pInput[idxIn+1];
        }
        else if (cMod == 3)
        {
            int idxF  = idxFtmp  + c;
            int idxIn = idxIntmp + c;    
            sum4.x += pFilter[idxF]*pInput[idxIn];
            sum4.y += pFilter[idxF+1]*pInput[idxIn+1];
            sum4.z += pFilter[idxF+2]*pInput[idxIn+2];
        }
    }
    const int idxOut = yOut * nWidth + xOut;
    pOutput[idxOut] = sum4.x + sum4.y + sum4.z + sum4.w;
}
//KERNEL_DEF_FLOAT4_IF

