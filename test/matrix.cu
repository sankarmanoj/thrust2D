#include <thrust/block_2d.h>
#include <thrust/matrix_operations.h>
#include <cuda_runtime.h>
#include <cublas_v2.h>

int main()
{
  thrust::block_2d<float> a(3,3,1),b(3,3,1);
  // thrust::transpose(&b);
  // c = thrust::matrix_multiply(&a,&b);
  cublasHandle_t handle;
  cublasStatus_t status;
  cublasCreate(&handle);
  thrust::sequence(a.begin(),a.end());

  thrust::host_block_2d<float> host_a(3,5,1);
  host_a = b;

  for (int i=0; i<5; i++)
  {
    for (int j=0; j<3; j++)
    {
      printf("%f ",host_a[make_int2(j,i)]);
    }
    printf("\n");
  }
  // for (int i=0; i<3; i++)
  // {
  //   for (int j=0; j<5; j++)
  //   {
  //     printf("%d ",b[make_int2(j,i)]);
  //   }
  //   printf("\n");
  // }
  // for (int i=0; i<5; i++)
  // {
  //   for (int j=0; j<5; j++)
  //   {
  //     printf("%d ",c[make_int2(j,i)]);
  //   }
  //   printf("\n");
  // }
  return 0;
}
