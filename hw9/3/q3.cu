#include <thrust/host_vector.h>
#include <thrust/device_vector.h>
#include <thrust/count.h>
#include <thrust/sort.h>
#include <stdio.h>
#include <stdlib.h>
#include <cstdio>

using namespace std;

struct count5{
  __host__ __device__
  bool operator()(int x) {
    return (x > 5);
  }
};

int main (int argc, char *argv[]) {
  const int N = 15;
  //populate data
  thrust::device_vector<int> day(N);
  day[0] = 0; day[1] = 0; day[2] = 1;
  day[3] = 2; day[4] = 5; day[5] = 5;
  day[6] = 6; day[7] = 6; day[8] = 7;
  day[9] = 8; day[10] = 9; day[11] = 9;
  day[12] = 9; day[13] = 10; day[14] = 11;

  thrust::device_vector<int> site(N);
  site[0] = 2; site[1] = 3; site[2] = 0;
  site[3] = 1; site[4] = 1; site[5] = 2;
  site[6] = 0; site[7] = 1; site[8] = 2;
  site[9] = 1; site[10] = 3; site[11] = 4;
  site[12] = 0; site[13] = 1; site[14] = 2;

  thrust::device_vector<int> mmt(N);
  mmt[0] = 9; mmt[1] = 5; mmt[2] = 6;
  mmt[3] = 3; mmt[4] = 3; mmt[5] = 8;
  mmt[6] = 2; mmt[7] = 6; mmt[8] = 5;
  mmt[9] = 10; mmt[10] = 9; mmt[11] = 11;
  mmt[12] = 8; mmt[13] = 4; mmt[14] = 1;

  thrust::device_vector<int> x(N);
  thrust::device_vector<int> y(N);

  thrust::reduce_by_key(day.begin(), day.end(), mmt.begin(), x.begin(), y.begin());

  int count = thrust::count_if(y.begin(), y.end(), count5());
  cout << "No. of days with rainfall > 5 = " << count << endl;

  thrust::sort_by_key(site.begin(), site.end(), mmt.begin());
  thrust::reduce_by_key(site.begin(), site.end(), mmt.begin(), x.begin(), y.begin());

  for (int i = 0; i < 5; i++) {
    cout << "Site: " << x[i] << " Rainfall: " << y[i] << endl;
  }
  return 0;
}

