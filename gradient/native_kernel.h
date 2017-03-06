__constant__ float c_weights[10000];
int iDivUp(int a, int b)
{
    return (a % b != 0) ? (a / b + 1) : (a / b);
}
__global__ void getdotError(int N,int D,float *x,float *y,float *e)
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
// __global__ void multiply(int N, int D, float *x, float *e,float *y)
// {
//   int index = threadIdx.x + blockIdx.x*blockDim.x;
//   if(index>=D*N)
//     return;
//   y[index]=x[index]*e[index%N];
// }
template <unsigned int block_size>
__global__ void better_reduce_kernel (float *g_idata, float *e, float *g_odata, unsigned int n, unsigned int d)
{
  extern volatile __shared__ float sdata[];
  unsigned int tid=threadIdx.x;
  unsigned int i=blockIdx.x;
  unsigned int grid_size = block_size*2;
  sdata[tid]=0;
  int index = tid + i*blockDim.x*2;
  if (index<n)
  {
    sdata[tid] += (g_idata[index] * e[(index)%n]);
    if(index+block_size<n)
      sdata[tid] += (g_idata[index + block_size] * e[(index + block_size)%n]);
    // printf("%d+=(%d+%d)\n", sdata[tid], g_idata[i],g_idata[i+block_size]);
    index+=grid_size;
  }
  __syncthreads();

  if (block_size >= 1024)
  {
    if (tid < 512)
    {
      sdata[tid] += sdata[tid + 512];
    }
    __syncthreads();
  }
  if (block_size >= 512)
  {
    if (tid < 256)
    {
      sdata[tid] += sdata[tid + 256];
    }
    __syncthreads();
  }
  if (block_size >= 256)
  {
    if (tid < 128)
    {
      sdata[tid] += sdata[tid + 128];
    }
    __syncthreads();
  }
  if (block_size >= 128)
  {
    if (tid < 64)
    {
      sdata[tid] += sdata[tid + 64];
    }
    __syncthreads();
  }
  if (tid<32)
  {
    if (block_size >= 64)
      sdata[tid] += sdata[tid + 32];
    if (block_size >= 32)
      sdata[tid] += sdata[tid + 16];
    if (block_size >= 16)
      sdata[tid] += sdata[tid + 8];
    if (block_size >= 8)
      sdata[tid] += sdata[tid + 4];
    if (block_size >= 4)
      sdata[tid] += sdata[tid + 2];
    if (block_size >= 2)
      sdata[tid] += sdata[tid + 1];
  }
  __syncthreads();
  if(tid == 0)
  {
    g_odata[blockIdx.x] = sdata[0]/n;
  }
}
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
