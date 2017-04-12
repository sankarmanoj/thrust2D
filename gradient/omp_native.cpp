#include <omp.h>
#include <stdio.h>
#include <stdlib.h>
#include <fstream>
void getdotError(int N, int D, float * xvalues, float * weights, float * yvalues,float * error)
{
  #pragma omp parallel for
  for (size_t i = 0; i < N; i++)
  {
    float pred_value = 0;
    // #pragma omp parallel for reduction(+:pred_value)
    for(size_t j = 0; j<D;j++)
    {
      pred_value += xvalues[i*D + j]*(weights[j]);
    }
    error[i]=pred_value-yvalues[i];
  }
}

void getGradient(int N,int D,float * xvalues,float * error,float * gradient)
{
  #pragma omp parallel for
  for (size_t i = 0; i < D; i++)
  {
    float gradient_value = 0;
    for(size_t j = 0; j<N;j++)
    {
      gradient_value += xvalues[j*D + i]*error[j];
    }
    gradient[i]=gradient_value/N;
  }
}
void update_weights(int D, float * weights, float * gradient, float learn)
{
  #pragma omp parallel for
  for(size_t index = 0; index< D;index++)
  {
    weights[index] = weights[index] - learn * gradient[index];
  }
}
float getError(float * error, int N)
{
  float total_error = 0;
  //#pragma omp parallel for reduction(+:total_error)
  for (size_t i = 0; i < N; i++)
  {
      total_error+=(error[i]*error[i]);
  }
  return total_error;
}

int main(int argc, char **argv)
{
  omp_set_num_threads(8);
  std::ifstream values;
  values.open("./values.txt");
  int D,N,niter;
  float learn = 0.01;
  if(argc==3)
  {
    niter = atoi(argv[1]);
    learn = atof(argv[2]);
    // omp_set_num_threads(8);
    // printf("%s %s ",argv[1],argv[2]);
  }
  if(argc==4)
  {
    niter = atoi(argv[1]);
    learn = atof(argv[2]);
    // printf("%s %s %s",argv[1],argv[2],argv[3]);
    // omp_set_num_threads(atoi(argv[3]));
  }
  float *xvalues,*y_actual,*real_weights,*weights;
  values>>D>>N;
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
  float * gradient = new float[D];
  int count = 0;
  float threshold_error = N;
  float error_val;
  double start, end, total = 0;
  do
  {
    getdotError(N,D,xvalues,weights,y_actual,error);
    error_val = getError(error,N);
    start = omp_get_wtime();
    getGradient(N,D,xvalues,error,gradient);
    end = omp_get_wtime();
    // printf("Start = %f End = %f \n",start,end);
    total = end - start;
    update_weights(D,weights,gradient,learn);
    count++;
  }

  while(error_val>threshold_error);
  printf("%f\n%d\n",total/count,count );



}
