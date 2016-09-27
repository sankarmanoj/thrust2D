#include <thrust/window_transform.h>
int main()
{
  thrust::Block_2D<int> a(3,5,1),b(5,3,1),c(5,5,0);
  // thrust::transpose(&b);
  c = thrust::matrix_multiply(&a,&b);
  for (int i=0; i<5; i++)
  {
    for (int j=0; j<3; j++)
    {
      printf("%d ",a[make_int2(j,i)]);
    }
    printf("\n");
  }
  for (int i=0; i<3; i++)
  {
    for (int j=0; j<5; j++)
    {
      printf("%d ",b[make_int2(j,i)]);
    }
    printf("\n");
  }
  for (int i=0; i<5; i++)
  {
    for (int j=0; j<5; j++)
    {
      printf("%d ",c[make_int2(j,i)]);
    }
    printf("\n");
  }
  return 0;
}
