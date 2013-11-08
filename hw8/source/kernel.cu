
__global__ void scan_simple(float *out, float *in, int length) {
  volatile extern __shared__ float data[];
  int tid = threadIdx.x + blockIdx.x * blockDim.x;
  int tx = threadIdx.x;
  data[tx] = in[tid];
  int pout = 0; int pin = 1;
  
  if (tid < length) {
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
  if (tx == blockDim.x - 1) in[tid] = data[pout * blockDim.x + tx];
  }
}

__global__ void scan_tree(float *out, float *in, int length) {
  volatile extern __shared__ float data[];
  int tid = threadIdx.x + blockIdx.x * blockDim.x;
  int tx = threadIdx.x;
  int offset = 1;
  data[2*tx] = in[2*tid];
  data[2*tx + 1] = in[2*tid + 1];

  // Sum up
  for (int jump = blockDim.x; jump > 0; jump >>= 1) {
    __syncthreads();
    if (tx < jump) {
      int a = offset * (2*tx + 1) - 1;
      int b = offset * (2*tx + 2) - 1;
      data[b] += data[a];
    }
    offset <<= 1;
  }

  if (tx == 0) data[2*blockDim.x - 1] = in[2*blockDim.x * (blockIdx.x + 1) - 1];

  // Sum down
  for (int jump = 1; jump < blockDim.x<<1; jump <<= 1) {
    offset >>= 1;
    __syncthreads();

    if (tx < jump) {
      int a = offset * (2*tx + 1) - 1;
      int b = offset * (2*tx + 2) - 1;

      float temp = data[a];
      data[a] = data[b];
      data[b] += temp;
    }
  }
  __syncthreads();
  if (tx == 0) data[0] = in[tid];

  out[2*tid] = data[2*tx];
  out[2*tid + 1] = data[2*tx + 1];
}

__global__ void reduce(float *g_data, float *old_data) {
  volatile extern __shared__ float data[];
  int tid = threadIdx.x + blockIdx.x * blockDim.x;
  int bid = blockIdx.x + 1;
  int tx = threadIdx.x;

  // Load partially scanned blocks and partial sums
  data[tx] = g_data[tid + blockDim.x];
  
  // Add partial sum
  for (int i = 0; i < bid; i++)
    data[tx] += old_data[blockDim.x + i*blockDim.x - 1];
  __syncthreads();

  // Write back to global memory
  g_data[tid + blockDim.x] = data[tx];
}
