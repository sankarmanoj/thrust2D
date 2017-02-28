__constant__ float c_weights[10000];
int iDivUp(int a, int b)
{
    return (a % b != 0) ? (a / b + 1) : (a / b);
}
__global__ void getError(int N,int D,float *x,float *y,float *e)
{
  int index = threadIdx.x + blockIdx.x*blockDim.x;
  float sum=0;
  if(index>=N)
    return;
  for(int i = 0; i<D;i++)
  {
    sum+=x[i*N + index];
  }
  e[index]=y[index]-sum;
};
__global__ void updateWeight(int N,int D,float learn,float *x,float *e,float *w)
{
  int index = threadIdx.x + blockIdx.x*blockDim.x;
  if(index>=D)
    return;
  float sum = 0;
  for(int i = 0; i<N;i++)
  {
    sum+=x[index*N + i]*e[i];
  }
  w[index] -= learn*sum/N;
};
