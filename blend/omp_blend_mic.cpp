#define THRUST_DEVICE_SYSTEM 2
#include <thrust/device_vector.h>
#include <stdio.h>
#include <thrust/transform.h>
typedef unsigned char uchar;
class blendFunctor
{
  float alpha;
public:
  blendFunctor(float alpha)
  {
    this->alpha = alpha;
  }
  uchar operator() (uchar &input1,uchar &input2) const
  {
    return alpha * input1+ (1-alpha) *  input2;
  }
};

int main(int argc, char const *argv[]) {
  int dim = 4096;
  double start,end;
  if(argc ==2)
  {
    dim = atoi(argv[1]);
  }
  start=omp_get_wtime();
  thrust::device_vector<uchar> input_vector1(dim*dim);
  thrust::device_vector<uchar> input_vector2(dim*dim);
  for (int i = 0; i<dim;i++)
  {
    for (int j = 0; j<dim;j++)
    {
      input_vector1[i*dim+j] = (i*dim+j)%256;
      input_vector2[i*dim+j] = (j*dim+i)%256;
    }
  }
  thrust::device_vector<uchar> output_vector(dim*dim);
  thrust::host_vector<uchar> host_output_vector(dim*dim);
  thrust::transform(input_vector1.begin(),input_vector1.end(),input_vector2.begin(),output_vector.begin(),blendFunctor(0.3));
  end = omp_get_wtime();
  printf("%f\n",(end-start)*1000);
  host_output_vector=output_vector;
  return 0;
}
