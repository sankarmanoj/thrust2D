#include <stdio.h>
#include <assert.h>

const int TILE_DIM = 32;
const int BLOCK_ROWS = 8;

// Uses shared memory to achieve coalesing in both reads and writes
// Tile width == #banks causes shared memory bank conflicts.
__global__ void transposeCoalesced(int *odata, const int *idata)
{
	__shared__ float tile[TILE_DIM][TILE_DIM+1];
    
	int x = blockIdx.x * TILE_DIM + threadIdx.x;
	int y = blockIdx.y * TILE_DIM + threadIdx.y;
	int width = gridDim.x * TILE_DIM;

	for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
   	tile[threadIdx.y+j][threadIdx.x] = idata[(y+j)*width + x];

	__syncthreads();

	x = blockIdx.y * TILE_DIM + threadIdx.x;  // transpose block offset
	y = blockIdx.x * TILE_DIM + threadIdx.y;

	for (int j = 0; j < TILE_DIM; j += BLOCK_ROWS)
   	odata[(y+j)*width + x] = tile[threadIdx.x][threadIdx.y + j];
}

const int row = 10240;
const int col = 10240;

int a[row][col];

int main(int argc, char **argv)
{

    int *d_v_i; // Our Device Input Vector
    int *d_v_o; // Our Device Output Vector

	for (int i=0;i<row;i++)
	  for (int j=0; j<col;j++)
		a[i][j] = i*col+j;

	// Allocate And Copy The Memory In To d_v

	cudaMalloc ((int**)&d_v_i,(row*col*sizeof(int)));
	cudaMalloc ((int**)&d_v_o,(row*col*sizeof(int)));

	cudaMemcpy (d_v_i,&a[0][0],row*col*sizeof(int),cudaMemcpyHostToDevice);

	// Lets Do The Transpose

	dim3 dimGrid  (row/TILE_DIM, col/TILE_DIM, 1);
  	dim3 dimBlock (TILE_DIM, BLOCK_ROWS, 1);

/*  	const int num_iterations = 1000; // This Is For Profiling The Code To Get An Average Value
  	float elapsedTime = 0.0f;
	float total_time  = 0.0f;

	cudaEvent_t start, stop;

  	for (int i=0;i<num_iterations;i++)
  	{
  		cudaEventCreate(&start);
	    cudaEventCreate(&stop);
	    cudaEventRecord(start);
*/
  		transposeCoalesced<<<dimGrid, dimBlock>>>(d_v_o, d_v_i);
/*
  		cudaEventRecord(stop);
	    cudaEventSynchronize(stop);

	    cudaEventElapsedTime(&elapsedTime, start, stop);

	    total_time += elapsedTime;
  	}

	

	

	printf("Average Elapsed Time Is %lf\n", total_time/num_iterations);
*/

	cudaMemcpy (&a[0][0],d_v_o,row*col*sizeof(int),cudaMemcpyDeviceToHost);
	printf ("Element at Index 100 is %d\n",a[0][100]);


}

