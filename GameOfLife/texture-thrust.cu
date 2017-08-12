#include <stdio.h>
#include <stdlib.h>
#include <thrust/window_2d.h>
#include <thrust/block_2d.h>
#include <thrust/window_transform.h>
#define SRAND_VALUE 1985
#define BLOCK_SIZE 16

class ghostRowsFunctor
{
public:
  __device__ void operator() (const thrust::window_2d<short> &inputWindow) const
  {
      inputWindow[inputWindow.block_dim_y-1][0]=inputWindow[make_int2(0,1)];
      inputWindow[0][0]=inputWindow[make_int2(0,inputWindow.block_dim_y-2)];
  }
};
class ghostColsFunctor
{
public:
  __device__ void operator() (const thrust::window_2d<short> &inputWindow) const
  {
      inputWindow[0][inputWindow.block_dim_x-1]=inputWindow[make_int2(1,0)];
      inputWindow[0][0]=inputWindow[make_int2(inputWindow.block_dim_x-2,0)];
  }
};

class GOLFunctor
{

public:
  __device__ void operator() (cudaTextureObject_t texref,thrust::block_2d<short> &output) const
  {
      int numNeighbors;
      // Get the number of neighbors for a given grid point
      numNeighbors = tex2D<short>(texref,blockIdx.x*blockDim.x + threadIdx.x+ 0,threadIdx.y + blockIdx.y*blockDim.y +1)+tex2D<short>(texref,blockIdx.x*blockDim.x + threadIdx.x+ 2,threadIdx.y + blockIdx.y*blockDim.y +1)+
                  tex2D<short>(texref,blockIdx.x*blockDim.x + threadIdx.x+ 1,threadIdx.y + blockIdx.y*blockDim.y +0)+tex2D<short>(texref,blockIdx.x*blockDim.x + threadIdx.x+ 1,threadIdx.y + blockIdx.y*blockDim.y +2)+
                  tex2D<short>(texref,blockIdx.x*blockDim.x + threadIdx.x+ 0,threadIdx.y + blockIdx.y*blockDim.y +0)+tex2D<short>(texref,blockIdx.x*blockDim.x + threadIdx.x+ 2,threadIdx.y + blockIdx.y*blockDim.y +2)+
                  tex2D<short>(texref,blockIdx.x*blockDim.x + threadIdx.x+ 0,threadIdx.y + blockIdx.y*blockDim.y +2)+tex2D<short>(texref,blockIdx.x*blockDim.x + threadIdx.x+ 2,threadIdx.y + blockIdx.y*blockDim.y +0);
      output[threadIdx.y + blockIdx.y*blockDim.y +1][blockIdx.x*blockDim.x + 1]=(numNeighbors==3)||(tex2D<short>(texref,blockIdx.x*blockDim.x + 1,threadIdx.y + blockIdx.y*blockDim.y +1)&&(numNeighbors==2));

  }
};int main(int argc, char* argv[])
{
    int i,j,iter;


    int dim;
    int maxIter = 1<<10; //Number of game steps
    if (argc==2)
     dim = atoi(argv[1]);
    else if (argc==3)
    {
      dim = atoi(argv[1]);
      maxIter = atoi(argv[2]);
    }
    else
     dim = 1024;

    thrust::block_2d<short> *d_grid = new thrust::block_2d<short>(dim+2,dim+2);
    thrust::block_2d<short> *d_new_grid = new thrust::block_2d<short>(dim+2,dim+2);
    thrust::block_2d<short> *d_temp_grid;
    thrust::host_block_2d<short> h_grid(dim+2,dim+2);

    // Assign initial population randomly
    srand(SRAND_VALUE);
    for(i = 1; i<=dim; i++) {
        for(j = 1; j<=dim; j++) {
            h_grid[i][j] = rand() % 2;
            // printf("%d ",h_grid[i][j]);

        }
        // printf("\n");
    }

    // Copy over initial game grid (Dim-1 threads)
    *d_grid = h_grid;




    // Main game loop
    for (iter = 0; iter<maxIter; iter++) {

        thrust::window_vector<short> ghostRowsWindows (d_grid,1,d_grid->dim_y,1,d_grid->dim_y);
        thrust::window_vector<short> ghostColsWindows (d_grid,d_grid->dim_x,1,d_grid->dim_x,1);
        thrust::for_each(ghostRowsWindows.begin(),ghostRowsWindows.end(),ghostRowsFunctor());
        thrust::for_each(ghostColsWindows.begin(),ghostColsWindows.end(),ghostColsFunctor());
        thrust::window_vector<short>GOLInputVector(d_grid,3,3,1,1);
        thrust::window_vector<short>GOLOutputVector(d_new_grid,3,3,1,1);
        thrust::transform(thrust::cuda::texture,GOLInputVector.begin(),GOLInputVector.end(),GOLOutputVector.begin(),GOLFunctor());
        // ghostRows<<<cpyGridRowsGridSize, cpyBlockSize>>>(dim, d_grid);
        // ghostCols<<<cpyGridColsGridSize, cpyBlockSize>>>(dim, d_grid);
        // GOL<<<gridSize, blockSize>>>(dim, d_grid, d_newGrid);

        // Swap our grids and iterate again
        d_temp_grid = d_grid;
        d_grid = d_new_grid;
        d_new_grid = d_temp_grid;
    }//iter loop

    // Copy back results and sum
    // cudaMemcpy(h_grid, d_grid, bytes, cudaMemcpyDeviceToHost);

    // Sum up alive cells and print results
    printf("\n\nOutput \n\n\n");
    h_grid = *d_grid;
    int total = 0;
    for (i = 1; i<=dim; i++) {
        for (j = 1; j<=dim; j++) {
          // printf("%d ",h_grid[i][j]);
           total += h_grid[i][j];
        }
        // printf("\n");
    }
    printf("Total Alive: %d\n", total);

    // Release memory

    return 0;
}
