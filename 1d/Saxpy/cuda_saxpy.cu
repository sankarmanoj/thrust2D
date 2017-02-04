#include <iostream>
#include <cstdio>

__global__
void saxpy (int N,float a,float *d_x,float *d_y)
{	
	__shared__ float sm_x[1024];
	__shared__ float sm_y[1024];
			
	int idx =  blockIdx.x * blockDim.x + threadIdx.x;
	int num_threads = gridDim.x * blockDim.x;
	int id = threadIdx.x;
	
	for(int i = idx; i < N; i += num_threads) {
	
		sm_x[id] = d_x[i];
		sm_y[id] = d_y[i];
		
		sm_y[id] += sm_x[id] * a;
		
		d_y[i] = sm_y[id];	
	}	
}


int main () {

	int N = 15485863;

	float *d_x, *d_y;
	float *h_x, *h_y;
	
	h_x = (float*) malloc (N * sizeof(float));
	h_y = (float*) malloc (N * sizeof(float));
	
	cudaMalloc ((float**) &d_x, N * sizeof(float));
	cudaMalloc ((float**) &d_y, N * sizeof(float));
	
	for(int i = 0; i < N; i++)
	{
		h_x[i] = 2.0;
		h_y[i] = 3.0;
	}
	
	cudaMemcpy(d_x, h_x, N * sizeof(float), cudaMemcpyHostToDevice);
	cudaMemcpy(d_y, h_y, N * sizeof(float), cudaMemcpyHostToDevice);


	saxpy <<< 26, 1024 >>> (N, 9.0, d_x,d_y);

	cudaMemcpy(h_y, d_y, N * sizeof(float), cudaMemcpyDeviceToHost);

	printf("%lf\n", h_y[100]);
	
	cudaFree (d_x);	
	cudaFree (d_y);
	free (h_x);	
	free (h_y);	

	cudaDeviceReset();
	return 0;
}

