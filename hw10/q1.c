#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <omp.h>

#define N 1000001

float fx(float x) {
  return ( exp(sin(x)) * cos(x/40.f) );
}

int main() {
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
  float x[N];
  for (int i=0; i<N; i++)
    //x[i] = (i+i+1)/2 * 0.0001;
    x[i] = (i) * 0.0001;

  float answer_s = 0.f;
  float answer_p = 0.f;
  double start_s, start_p;
  double end_s, end_p;

  // Serial
  start_s = omp_get_wtime();
  for(int i=0; i<N; i++)
    answer_s += coeff[i] * fx(x[i]);
  end_s = omp_get_wtime();
  
  answer_s = answer_s * 0.0001 / 48;
  printf("Serial\n");
  printf("\tAnswer = %f\n", answer_s);
  printf("\tTime = %lf ms\n", 1000*(end_s - start_s));

  // Parallel
  start_p = omp_get_wtime();
  #pragma omp parallel for reduction(+:answer_p)
  for(int i=0; i<N; i++)
     answer_p += coeff[i] * fx(x[i]);
  end_p = omp_get_wtime();

  answer_p = answer_p * 0.0001 / 48;
  printf("Parallel\n");
  printf("\tAnswer = %f\n", answer_p);
  printf("\tTime = %lf ms\n", 1000*(end_p - start_p));
  
  // Get environment info
  if (1 == 1) {
  int tid, procs, maxt; 
  #pragma omp parallel private(tid)   
  {
  tid = omp_get_thread_num();
  if (tid == 0) {
    procs = omp_get_num_procs();
    maxt = omp_get_max_threads();
    printf("Number of processors = %d\n", procs);
    printf("Max threads = %d\n", maxt);
  }
  }
  }

  return 0;
}
