#include <stdio.h>
#include <cuda.h>

int main (int argc, char *argv[]) {
  // Initialize variables
  if (argc != 2)
    exit(1);
  size_t size = atoi(argv[1]);

  void *host, *host2, *device, *device2;

  host = malloc(size);
  if (host == NULL)
    perror("malloc");

  if (cudaSuccess != cudaMallocHost(&host2, size))
    perror("cudaMallocHost");

  if (cudaSuccess != cudaMalloc(&device, size))
    perror("cudaMalloc");

  cudaEvent_t start, end;
  float time;
  cudaEventCreate(&start);
  cudaEventCreate(&end);

  cudaEventRecord(start, 0);
  cudaMemcpy(device, host, size, cudaMemcpyHostToDevice);
  cudaEventRecord(end, 0);
  cudaEventSynchronize(end);
  cudaEventElapsedTime(&time, start, end);
  printf ("%f\t", time);

  cudaEventRecord(start, 0);
  cudaMemcpy(device, host2, size, cudaMemcpyHostToDevice);
  cudaEventRecord(end, 0);
  cudaEventSynchronize(end);
  cudaEventElapsedTime(&time, start, end);
  printf ("%f\t", time);
  cudaFree(device);

  if (cudaSuccess != cudaMalloc(&device2, size))
    perror("cudaMalloc");

  cudaEventRecord(start, 0);
  cudaMemcpy(host, device2, size, cudaMemcpyDeviceToHost);
  cudaEventRecord(end, 0);
  cudaEventSynchronize(end);
  cudaEventElapsedTime(&time, start, end);
  printf ("%f\t", time);
 
  cudaEventRecord(start, 0);
  cudaMemcpy(host2, device2, size, cudaMemcpyDeviceToHost);
  cudaEventRecord(end, 0);
  cudaEventSynchronize(end);
  cudaEventElapsedTime(&time, start, end);
  printf ("%f\n", time);
  
  // Cleanup
  free(host);
  cudaFree(host2);
  cudaFree(device2);

  return 0;
}

