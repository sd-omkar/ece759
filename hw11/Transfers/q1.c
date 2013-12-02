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
  double start_s, end_s;
  MPI_Status status;

  if (argc != 2) {
    printf ("usgae: %s size\n", argv[0]);
    exit(1);
  }

  num_elements = atoi(argv[1]);
  
  const unsigned int array_mem_size = sizeof(int) * num_elements;
  int *s_data, *r_data;
  if ((s_data = (int*) malloc(array_mem_size)) == NULL)
    perror("malloc");
  if ((r_data = (int*) malloc(array_mem_size)) == NULL)
    perror("malloc");

  for( unsigned int i = 0; i < num_elements; ++i) 
    s_data[i] = i;

  start_s = MPI_Wtime();

  if (rank == 0) {
    MPI_Ssend(s_data, num_elements, MPI_INT, 1, 0, MPI_COMM_WORLD);
    MPI_Recv(r_data, num_elements, MPI_INT, 1, 0, MPI_COMM_WORLD, &status);
  }

  if (rank == 1) {
    MPI_Recv(r_data, num_elements, MPI_INT, 0, 0, MPI_COMM_WORLD, &status);
    MPI_Ssend(s_data, num_elements, MPI_INT, 0, 0, MPI_COMM_WORLD);
  }

  end_s = MPI_Wtime();

  if (rank == 0) {
    for (int j=0; j<num_elements; ++j)
      if (r_data[j] != j) {
        printf("Error in data\n");
        fflush(stdout);
        break;
      }
  }
  if (rank == 1) {
    for (int j=0; j<num_elements; ++j)
      if (r_data[j] != j) {
        printf("Error in data\n");
        fflush(stdout);
        break;
      }
  }

  if (rank == 0)
    printf("%d\t%lf\n", num_elements*4, 1000*(end_s - start_s));

  MPI_Finalize();
  free(s_data);
  free(r_data);
  return 0;
}
