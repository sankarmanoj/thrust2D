#include <omp.h>
#include <stdio.h>
#include <fstream>
__declspec( target(mic) ) void getdotError(int N, int D, float * xvalues, float * weights, float * yvalues,float * error)
{
  #pragma omp parallel for
  for (size_t i = 0; i < N; i++)
  {
    float pred_value = 0;
    #pragma omp parallel for reduction(+:pred_value)
    for(size_t j = 0; j<D;j++)
    {
      pred_value += xvalues[i*D + j]*(weights[j]);
    }
    error[i]=pred_value-yvalues[i];
  }
}

__declspec( target(mic) ) void getGradient(int N,int D,float * xvalues,float * error,float * gradient)
{
  #pragma omp parallel for
  for (size_t i = 0; i < D; i++)
  {
    float gradient_value = 0;
    #pragma omp parallel for reduction(+:gradient_value)
    for(size_t j = 0; j<N;j++)
    {
      gradient_value += xvalues[j*D + i]*error[j];
    }
    gradient[i]=gradient_value/N;
  }
}
__declspec( target(mic) ) void update_weights(int D, float * weights, float * gradient, float learn)
{
  #pragma omp parallel for
  for(size_t index = 0; index< D;index++)
  {
    weights[index] = weights[index] - learn * gradient[index];
  }
}

int main(int argc, char **argv)
{
  omp_set_num_threads(8);
  std::ifstream values;
  values.open("/dev/shm/values.txt");
  int D,N;
  int niter = atoi(argv[1]);
  float learn = atof(argv[2]);
  float *xvalues,*y_actual,*real_weights,*weights;
  values>>D>>N;
  printf("N = %d D = %d learn = %f ",N,D,learn);
  xvalues = new float [D*N];
  for(int i = 0 ; i<N;i++)
  {
    for (int j = 0; j<D;j++)
    {
      values>>xvalues[i*D + j];
    }
  }
  y_actual = new float[N];
  for(int i = 0; i<N;i++)
  {
    values>>y_actual[i];
  }
  real_weights = new float[D];
  for(int i = 0; i<D;i++)
  {
    values>>real_weights[i];
  }
  weights = new float[D];
  for(int i = 0; i<D;i++)
  {
    values>>weights[i];
  }

  float * error = new float[N];
  printf("Done Reading Data\n");
  #pragma offload target(mic) in(xvalues:length(N*D)) in(y_actual:length(N)) in(weights:length(D)) inout(error:length(N))
  {int count = 0;
  float * gradient = new float[D];
  while(count<niter)
  {
    getdotError(N,D,xvalues,weights,y_actual,error);
    getGradient(N,D,xvalues,error,gradient);
    update_weights(D,weights,gradient,learn);
    count++;
  }
  }
  printf("\n\nError = ");
  for(int i = 1; i<10;i++)
  {
    printf("%f ",error[i]);
    if(i%10==0)
      printf("\n");
  }
    printf("\n");  printf("\n");


}
