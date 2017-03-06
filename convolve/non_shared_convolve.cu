#include <stdlib.h>
#include <thrust/shared_for_each.h>
#define RG 10
// #define DSIZE (32768*1024)
#define FSIZE 17

void conv(const float *A, const float *B, float *out, int N, int P)
{
// P is assumed to be odd, and greater than 1
    int rb = (P-1)/2;
    int lb = -rb;
    for (int i = rb; i < N-rb; ++i)
        for (int j = lb; j <= rb; ++j)
            out[i] += A[i+j] * B[j+rb];
}

int main(int argc, char const *argv[])
{
  int DSIZE=321024;
  if(argc ==2)
  {
    DSIZE = atoi(argv[1]);
  }
  thrust::device_vector<float> a(DSIZE),b(FSIZE),c(DSIZE,0.0);
  thrust::host_vector<float> ha(DSIZE),hb(FSIZE),hc(DSIZE,0.0),C(DSIZE,0.0);

  //initialize host input data
  for (int i=0; i < DSIZE; i++)
    ha[i] = rand()%RG;
  for (int i=0; i < FSIZE; i++)
    hb[i] = 1;

  b=hb;
  a=ha;

  thrust::convolve(a,b,&c);
  hc=c;

  conv(ha.data(),hb.data(),C.data(),DSIZE,FSIZE);

  for (int i = 0; i < DSIZE; i++) if (C[i] != hc[i]) {printf("FAIL at %d, cpu: %f, gpu %f\n", i, C[i], hc[i]); return 1;}
  // {
  //   printf("%d %f %f\n", i, C[i],hc[i]);
  // }
  return 0;
}
