#include <opencv2/opencv.hpp>
#include <omp.h>
using namespace cv;
void blendKernel(uchar * input1,uchar * input2, uchar * output,float alpha, int size)
{
  #pragma omp parallel for
  for(int index = 0 ; index<size; index++)
  {
    output[index] = input1[index]*alpha + input2[index]*(1-alpha);
  }
}

int main(int argc, char const *argv[]) {
  int dim = 4096;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  uchar *input1 = new uchar[dim*dim];
  uchar *input2 = new uchar[dim*dim];
  for (int i = 0; i<dim;i++)
  {
    for (int j = 0; j<dim;j++)
    {
      input1[i*dim+j] = (i*dim+j)%256;
      input2[i*dim+j] = (j*dim+i)%256;
    }
  }
  uchar *h_output = new uchar[dim*dim];
  double start, end;
  start = omp_get_wtime();
  blendKernel(input1,input2,h_output,0.3,dim*dim);
  end = omp_get_wtime();
  printf("%f\n",(end-start)*1000);
  return 0;
}
