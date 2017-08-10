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
  __device__ void operator() (const thrust::window_2d<bool> &inputWindow) const
  {
      inputWindow[inputWindow.block_dim_y-1][0]=inputWindow[1][0];
      inputWindow[0][0]=inputWindow[inputWindow.block_dim_y-2][0];
  }
};
class ghostColsFunctor
{
public:
  __device__ void operator() (const thrust::window_2d<bool> &inputWindow) const
  {
      inputWindow[0][inputWindow.block_dim_x-1]=inputWindow[0][1];
      inputWindow[0][0]=inputWindow[0][inputWindow.block_dim_x-2];
  }
};

class GOLFunctor
{

public:
  __device__ int operator() (thrust::window_2d<bool> &inputWindow, thrust::window_2d<bool> &outputWindow) const
  {
      int numNeighbors;
      // Get the number of neighbors for a given grid point
      numNeighbors = inputWindow[0][1]+inputWindow[2][1]+
                  inputWindow[1][0]+inputWindow[1][2]+
                  inputWindow[0][0]+inputWindow[2][2]+
                  inputWindow[0][2]+inputWindow[2][0];
      int cell = inputWindow[1][1];
      // Here we have explicitly all of the game rules
      if (cell == 1 && numNeighbors < 2)
          outputWindow[1][1] = 0;
      else if (cell == 1 && (numNeighbors == 2 || numNeighbors == 3))
          outputWindow[1][1] = 1;
      else if (cell == 1 && numNeighbors > 3)
          outputWindow[1][1] = 0;
      else if (cell == 0 && numNeighbors == 3)
          outputWindow[1][1] = 1;
      else
          outputWindow[1][1] = cell;

      return 0;
  }
};
int main(int argc, char* argv[])
{
    int i,j,iter;


    int dim;
    if (argc==2)
     dim = atoi(argv[1]);
    else
     dim = 1024;
    int maxIter = 1<<10; //Number of game steps

    thrust::block_2d<bool> *d_grid = new thrust::block_2d<bool>(dim+2,dim+2);
    thrust::block_2d<bool> *d_new_grid = new thrust::block_2d<bool>(dim+2,dim+2);
    thrust::block_2d<bool> *d_temp_grid;
    thrust::device_vector<bool> null_vector(dim*dim);
    thrust::host_block_2d<bool> h_grid(dim+2,dim+2);

    // Assign initial population randomly
    srand(SRAND_VALUE);
    for(i = 1; i<=dim; i++) {
        for(j = 1; j<=dim; j++) {
            h_grid[i][j] = rand() % 2;
        }
    }

    // Copy over initial game grid (Dim-1 threads)
    *d_grid = h_grid;




    // Main game loop
    for (iter = 0; iter<maxIter; iter++) {

        thrust::window_vector<bool> ghostRowsWindows (d_grid,1,d_grid->dim_y,1,d_grid->dim_y);
        thrust::window_vector<bool> ghostColsWindows (d_grid,d_grid->dim_x,1,d_grid->dim_x,1);
        thrust::for_each(ghostRowsWindows.begin(),ghostRowsWindows.end(),ghostRowsFunctor());
        thrust::for_each(ghostColsWindows.begin(),ghostColsWindows.end(),ghostColsFunctor());
        thrust::window_vector<bool>GOLInputVector(d_grid,3,3,1,1);
        thrust::window_vector<bool>GOLOutputVector(d_new_grid,3,3,1,1);
        thrust::transform(GOLInputVector.begin(),GOLInputVector.end(),GOLOutputVector.begin(),null_vector.begin(),GOLFunctor());
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
    h_grid = *d_grid;
    int total = 0;
    for (i = 1; i<=dim; i++) {
        for (j = 1; j<=dim; j++) {
           total += h_grid[i][j];
        }
    }
    printf("Total Alive: %d\n", total);

    // Release memory

    return 0;
}
