#pragma once
#include <thrust/system/cuda/matrix_operations.h>
namespace thrust
{

  block_2d<float> matrix_multiply(block_2d<float> &a, block_2d<float> &b,cublasHandle_t handle)
  {
    assert(a.dim_x==b.dim_y);
    block_2d<float> c(b.dim_x,a.dim_y);
    const float* a_data = a.data_pointer;
    const float* b_data = b.data_pointer;
    const float* c_data = c.data_pointer;
    cublasSgemm(handle,CUBLAS_OP_N,CUBLAS_OP_N,a.dim_y,b.dim_x,a.dim_x,1,a_data,a.pitch/sizeof(float),b_data,b.pitch/sizeof(float),0,c_data,c.pitch/sizeof(float));
    return c;
  }

  template <class T>
  __global__ void MatrixTranspose(block_2d<T> *a, block_2d<T> *temp)
  {
    unsigned int col = MATRIX_TILE_WIDTH*blockIdx.x + threadIdx.x;
    unsigned int row = MATRIX_TILE_WIDTH*blockIdx.y + threadIdx.y;
    (*temp)[row][col] = (*a)[col][row];
  }
  template <class T>
  void transpose(block_2d<T> *a)
  {
    block_2d<T> temp(a->dim_y,a->dim_x);
    T *temp1 = (T*) std::malloc(sizeof(T)*a->dim_y*a->dim_x);
    dim3 dimGrid (a->dim_y/MATRIX_TILE_WIDTH, a->dim_x/MATRIX_TILE_WIDTH, 1);
    dim3 dimBlock(MATRIX_TILE_WIDTH, MATRIX_TILE_WIDTH, 1);
    MatrixTranspose<<<dimGrid,dimBlock>>>(a->device_pointer,temp.device_pointer);
    // cudaMemcpy(temp1,thrust::raw_pointer_cast(temp.data()),sizeof(T)*a->dim_y*a->dim_x,cudaMemcpyDeviceToHost);
    // a->assign(temp1, temp1 + (a->dim_y*a->dim_x));
    (*a) = temp;
  }
}
