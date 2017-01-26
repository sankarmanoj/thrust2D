
#include "cuda_runtime.h"
#include "device_launch_parameters.h"
#include <stdlib.h>
#include <stdio.h>



__global__ void saxpy(int N, float a, float *d_x, float *d_y, float *d_z)
{
	
	__shared__ float sm_x[1024];
	__shared__ float sm_y[1024];

	int idx =  blockIdx.x * blockDim.x + threadIdx.x;
	if(idx >=N)
		return;

	sm_x[threadIdx.x] = d_x[idx];
	sm_y[threadIdx.x] = d_y[idx];
	__syncthreads();

	d_z[idx] = a*sm_x[threadIdx.x] + sm_y[threadIdx.x];
	__syncthreads();

	d_z[idx] +=  + d_y[idx];
}

int main () 
{

	int N = 15485863;

	float *h_x, *h_y, *h_z;
	float *d_x, *d_y, *d_z;
	
	h_x = (float*) malloc (N * sizeof(float));
	h_y = (float*) malloc (N * sizeof(float));
	h_z = (float*) malloc (N * sizeof(float));
	
	cudaMalloc ((float**) &d_x, N * sizeof(float));
	cudaMalloc ((float**) &d_y, N * sizeof(float));
	cudaMalloc ((float**) &d_z, N * sizeof(float));

	for(int i = 0; i < N; i++)
	{
		h_x[i] = 2.0f*(float)i;
		h_y[i] = 3.0f*(float)i;
	}
	
	cudaMemcpy(d_x, h_x, N * sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(d_y, h_y, N * sizeof(float), cudaMemcpyHostToDevice);
	cudaMemset(d_z, 0, N * sizeof(float));

	int threads_block = 1024;
	int num_blocks = (N/threads_block) + (N%threads_block == 0?0:1);

	saxpy <<< num_blocks, threads_block>>> (N, 9.0, d_x, d_y, d_z);

	cudaMemcpy(h_z, d_z, N * sizeof(float), cudaMemcpyDeviceToHost);

	printf("Element in %d position is %f\n",100, h_z[100]);
	
	cudaFree (d_x);	
	cudaFree (d_y);
	cudaFree (d_z);

	free (h_x);	
	free (h_y);	
	free (h_z);
	cudaDeviceReset();
	return 0;
}