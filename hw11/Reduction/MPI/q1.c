#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "mpi.h"

int main(int argc, char *argv[]) {
  // MPI setup
  int rank, size;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

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
  srand(26);
  for( unsigned int i = 0; i < num_elements; ++i) 
    h_data[i] = (double)((1000*rand()) % (2 * M + 1) - M);
    //h_data[i] = 1.f;

  float partial = 0.f;
  float final = 0.f;
  double start_s;
  double end_s;

  start_s = MPI_Wtime();
  for(int i=rank; i<=num_elements; i += size)
    partial += h_data[i];
  MPI_Reduce(&partial, &final, 1, MPI_FLOAT, MPI_SUM, 0, MPI_COMM_WORLD);
  end_s = MPI_Wtime();

  if (rank == 0) {
    printf("Rank = %d\tFinal Answer = %f\n", rank, final);
    printf("\t\tTime = %lf ms\n", 1000*(end_s - start_s));
  }

  MPI_Finalize();
  free(h_data);
  return 0;
}
