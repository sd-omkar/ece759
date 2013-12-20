// Base
for (int yOut = 0; yOut < nHeight; yOut++) {
    const int yInTopLeft = yOut;
    for (int xOut = 0; xOut < nWidth; xOut++) {
        const int xInTopLeft = xOut;
        float sum = 0;
        for (int r = 0; r < nFilterWidth; r++) {
            const int idxFtmp = r * nFilterWidth;
            const int yIn = yInTopLeft + r;
            const int idxIntmp = yIn * nInWidth + xInTopLeft;
            for (int c = 0; c < nFilterWidth; c++) {
                const int idxF  = idxFtmp  + c;
                const int idxIn = idxIntmp + c;    
                sum += pFilter[idxF]*pInput[idxIn];
            }
        }
        const int idxOut = yOut * nWidth + xOut;
        pOutput[idxOut] = sum;
    }
}

// SSE
float sum = 0;
__m128 prod __attribute__ ((aligned (16))) = _mm_set1_ps(0.0f);
__m128 acc __attribute__ ((aligned (16))) = _mm_set1_ps(0.0f);
__m128 data __attribute__ ((aligned (16)));
__m128 kernel __attribute__ ((aligned (16)));

for (int c = 0; c < nFilterWidth; c+=4) {
    const int idxF  = idxFtmp  + c;
    const int idxIn = idxIntmp + c;    
    data = _mm_loadu_ps(pInput + idxIn);
    kernel = _mm_loadu_ps(pFilter + idxF);
    prod = _mm_mul_ps(data, kernel);
    acc = _mm_add_ps(prod, acc);
}

__m128 t1 = _mm_hadd_ps(acc, acc);
__m128 t2 = _mm_hadd_ps(t1,t1);
float sum2 = _mm_cvtss_f32(t2);
const int idxOut = yOut * nWidth + xOut;
pOutput[idxOut] = sum2;

// SSE ASM
__m128 prod __attribute__ ((aligned (16))) = _mm_set1_ps(0.0f);
     961:        0f 29 85 b0 fe ff ff         movaps XMMWORD PTR [rbp-0x150],xmm0
     968:        b8 00 00 00 00               mov    eax,0x0
     96d:        89 85 5c ff ff ff            mov    DWORD PTR [rbp-0xa4],eax

prod = _mm_mul_ps(data, kernel);
     a89:        0f 29 85 b0 fe ff ff         movaps XMMWORD PTR [rbp-0x150],xmm0
     a90:        0f 28 85 b0 fe ff ff         movaps xmm0,XMMWORD PTR [rbp-0x150]
     a97:        0f 29 45 a0                  movaps XMMWORD PTR [rbp-0x60],xmm0
     a9b:        0f 28 85 c0 fe ff ff         movaps xmm0,XMMWORD PTR [rbp-0x140]
     aa2:        0f 29 45 90                  movaps XMMWORD PTR [rbp-0x70],xmm0

__m128 t1 = _mm_hadd_ps(acc, acc);
     b29:        0f 28 45 e0                  movaps xmm0,XMMWORD PTR [rbp-0x20]
     b2d:        f2 0f 7c 45 d0               haddps xmm0,XMMWORD PTR [rbp-0x30]

// AVX
__m256 prod __attribute__ ((aligned (32))) = _mm256_set1_ps(0.0f);
     919:        c5 fc 29 44 24 08            vmovaps YMMWORD PTR [rsp+0x8],ymm0
     91f:        b8 00 00 00 00               mov    eax,0x0
     924:        89 84 24 e4 01 00 00         mov    DWORD PTR [rsp+0x1e4],eax

prod = _mm256_mul_ps(data, kernel);
     a3f:        c5 fc 28 84 24 88 00         vmovaps ymm0,YMMWORD PTR [rsp+0x88]
     a46:        00 00 
     a48:        c5 fc 28 4c 24 68            vmovaps ymm1,YMMWORD PTR [rsp+0x68]
     a4e:        c5 f4 59 c0                  vmulps ymm0,ymm1,ymm0

__m256 acc = _mm256_hadd_ps(acc, acc);
     aea:        c5 fc 28 84 24 e8 00         vmovaps ymm0,YMMWORD PTR [rsp+0xe8]
     af1:        00 00 
     af3:        c5 ff 7c 84 24 08 01         vhaddps ymm0,ymm0,YMMWORD PTR [rsp+0x108]
     afa:        00 00

// OpenMP
#pragma omp parallel for num_threads(nNumThreads)
for (int yOut = 0; yOut < nHeight; yOut++) {
    .....  
    .....  
  for (int xOut = 0; xOut < nWidth; xOut++) {
      .....
      .....
    for (int r = 0; r < nFilterWidth; r++) {
        .....
        .....
      for (int c = 0; c < nFilterWidth; c++) {
          .....
          .....

// OpenCL
{
    const int nWidth = get_global_size(0);
    const int xOut = get_global_id(0);
    const int yOut = get_global_id(1);

    const int xInTopLeft = xOut;
    const int yInTopLeft = yOut;

    float sum = 0;
    for (int r = 0; r < nFilterWidth; r++) {
        const int idxFtmp = r * nFilterWidth;
        const int yIn = yInTopLeft + r;
        const int idxIntmp = yIn * nInWidth + xInTopLeft;

        for (int c = 0; c < nFilterWidth; c++) {
            const int idxF  = idxFtmp  + c;
            const int idxIn = idxIntmp + c;
            sum += pFilter[idxF]*pInput[idxIn];
        }
    }
    const int idxOut = yOut * nWidth + xOut;
    pOutput[idxOut] = sum;
}

// OpenCL Vectorized
    float4 sum4 = 0;
    for (int r = 0; r < nFilterWidth; r++) {
        const int idxFtmp = r * nFilterWidth;
        const int yIn = yInTopLeft + r;
        const int idxIntmp = yIn * nInWidth + xInTopLeft;

        int c = 0;
        int c4 = 0;
        while (c <= nFilterWidth-4) {
            float4 filter4 = vload4(c4, pFilter+idxFtmp);
            float4 in4     = vload4(c4, pInput +idxIntmp);
            sum4 += in4 * filter4;
            c += 4;
            c4++;
        }
        for (int c1 = c; c1 < nFilterWidth; c1++) {
            const int idxF  = idxFtmp  + c1;
            const int idxIn = idxIntmp + c1;    
            sum4.x += pFilter[idxF]*pInput[idxIn];
        }
    }
    const int idxOut = yOut * nWidth + xOut;
    pOutput[idxOut] = sum4.x + sum4.y + sum4.z + sum4.w;

// CUDA
__shared__ float sN[BLOCK_SIZE + 4][BLOCK_SIZE  + 4];
__constant__ float sM[KERNEL_SIZE][KERNEL_SIZE];

  float sum = 0.f;
  for (i = 0; i < KERNEL_SIZE; i++)
      for (j = 0; j < KERNEL_SIZE; j++)
          sum += sN[ty + i][tx + j] * sM[i][j];

  if (tx < N.width && ty < N.height)
      P.elements[tid] = sum;

// CUDA SDK Seperable
// Row
__shared__ float s_Data[ROWS_BLOCKDIM_Y][(ROWS_RESULT_STEPS + 2 * ROWS_HALO_STEPS) * ROWS_BLOCKDIM_X];
__constant__ float c_Kernel[KERNEL_LENGTH];

for (int i = ROWS_HALO_STEPS; i < ROWS_HALO_STEPS + ROWS_RESULT_STEPS; i++) {
        float sum = 0;
        for (int j = -KERNEL_RADIUS; j <= KERNEL_RADIUS; j++) {
            sum += c_Kernel[KERNEL_RADIUS - j] * s_Data[threadIdx.y][threadIdx.x + i * ROWS_BLOCKDIM_X + j];
        }
        d_Dst[i * ROWS_BLOCKDIM_X] = sum;
    }

// Column
__shared__ float s_Data[COLUMNS_BLOCKDIM_X][(COLUMNS_RESULT_STEPS + 2 * COLUMNS_HALO_STEPS) * COLUMNS_BLOCKDIM_Y + 1];
__constant__ float c_Kernel[KERNEL_LENGTH];

for (int i = COLUMNS_HALO_STEPS; i < COLUMNS_HALO_STEPS + COLUMNS_RESULT_STEPS; i++) {
        float sum = 0;
        for (int j = -KERNEL_RADIUS; j <= KERNEL_RADIUS; j++) {
            sum += c_Kernel[KERNEL_RADIUS - j] * s_Data[threadIdx.x][threadIdx.y + i * COLUMNS_BLOCKDIM_Y + j];
        }
        d_Dst[i * COLUMNS_BLOCKDIM_Y * pitch] = sum;
    }
