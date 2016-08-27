
#include "primary.h"
void frame_calculate(int *frame, int rows, int cols,int niter, int nErode, float threshold,float lambda)
{
  float  q0sqr, sum, sum2,meanROI,varROI;
	unsigned int r1, r2, c1, c2,size_R;
  int iter,size_I = rows*cols;
  r1 = 0;
  r2 = rows - 1;
  c1 = 0;
  c2 = cols - 1;

  size_R = (r2-r1+1)*(c2-c1+1);
  thrust::Block_2D<int> J_cuda (cols,rows);
  thrust::Block_2D<float> J_square(cols,rows);
  thrust::Block_2D<float> d_c(cols,rows);
  thrust::Block_2D<float> J_floatcuda(cols,rows);
  thrust::fill(d_c.begin(),d_c.end(),0.0f);
  J_cuda.assign(frame[0],frame[size_I]);
  thrust::transform(J_cuda.begin(),J_cuda.end(),J_floatcuda.begin(),extractFunctor());


  printf("Start the SRAD main loop\n");
    for (iter=0; iter< niter; iter++)
  {
    thrust::copy(J_floatcuda.begin(),J_floatcuda.end(),J_square.begin());
    thrust::for_each(J_square.begin(),J_square.end(),square());
    sum = thrust::reduce(J_floatcuda.begin(),J_floatcuda.end());
    sum2 = thrust::reduce(J_square.begin(),J_square.end());
    meanROI = sum / size_R;
    varROI  = (sum2 / size_R) - meanROI*meanROI;
    q0sqr   = varROI / (meanROI*meanROI);
    SRADFunctor1 functor1(cols,rows,q0sqr);
    SRADFunctor2 functor2(cols,rows,lambda,q0sqr);
    thrust::window_vector<float> wv = thrust::window_vector<float>(&(J_floatcuda),3,3,1,1);
    thrust::window_vector<float> d_cwv = thrust::window_vector<float>(&(d_c),3,3,1,1);
    thrust::transform(wv.begin(),wv.end(),d_cwv.begin(),J_square.begin(),functor1);
    thrust::transform(wv.begin(),wv.end(),d_cwv.begin(),J_square.begin(),functor2);
  }
  printf("Binarize\n");
  thrust::transform(J_floatcuda.begin(),J_floatcuda.end(),J_cuda.begin(),binarizeFunctor(threshold));
  printf("Erode And Dilate\n");
  thrust::window_vector<int> erodeInputWindow = thrust::window_vector<int>(&(J_cuda),3,3,1,1);
  for(int erodeTimes = 0; erodeTimes < nErode ; erodeTimes++)
  {
    //Erode
      thrust::for_each(erodeInputWindow.begin(),erodeInputWindow.end(),erodeFunctor());
  }
  for(int erodeTimes = 0; erodeTimes < nErode ; erodeTimes++)
  {
    //Dilate
      thrust::for_each(erodeInputWindow.begin(),erodeInputWindow.end(),dilateFunctor());
  }

  printf("Computation Done\n");
  thrust::for_each(J_cuda.begin(),J_cuda.end(),compressFunctor());
  cudaMemcpy(frame,thrust::raw_pointer_cast(J_cuda.data()),size_I*sizeof(int),cudaMemcpyDeviceToHost);

}
