#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include "mpi.h"

#define N 1000001

#define fx(x) exp(sin(x))*cos(x/40.f)

int main(int argc, char *argv[]) {
  // MPI setup
  int rank, size;
  MPI_Init(&argc, &argv);
  MPI_Comm_rank(MPI_COMM_WORLD, &rank);
  MPI_Comm_size(MPI_COMM_WORLD, &size);

  // Problem-1
  // Coefficients
  float coeff[N];
  for (int i=0; i<N; i++)
    coeff[i] = 48.f;
  coeff[0] = coeff[N-0] = 17.f;
  coeff[1] = coeff[N-1] = 59.f;
  coeff[2] = coeff[N-2] = 43.f;
  coeff[3] = coeff[N-3] = 49.f;

  // x
  /*
  float x[N];
  for (int i=0; i<N; i++)
    //x[i] = (i+i+1)/2 * 0.0001;
    x[i] = (i) * 0.0001;
  */

  float partial = 0.f;
  float final = 0.f;
  double start_s;
  double end_s;

  start_s = MPI_Wtime();
  for(int i=rank; i<N; i += size)
    partial += coeff[i] * fx(i*0.0001);
  partial = partial * 0.0001 / 48;
  MPI_Reduce(&partial, &final, 1, MPI_FLOAT, MPI_SUM, 0, MPI_COMM_WORLD);
  end_s = MPI_Wtime();

  if (rank == 0) {
    printf("Rank = %d\tFinal Answer = %f\n", rank, final);
    printf("\t\tTime = %lf ms\n", 1000*(end_s - start_s));
  }

  MPI_Finalize();
  return 0;
}
