#pragma once
#include <thrust/system/cuda/window_transform.h>
namespace thrust
{
  ////////////////////////////////////////////////////////////////////////////////
  // Row convolution filter
  ////////////////////////////////////////////////////////////////////////////////
  #define   ROWS_BLOCKDIM_X 16
  #define   ROWS_BLOCKDIM_Y 4
  #define   ROWS_RESULT_STEPS 8
  #define   ROWS_HALO_STEPS 1

  template <class T, class U>
  __global__ void convolutionRowsKernel(
    T *d_Dst,
    T *d_Src,
    int imageW,
    int imageH,
    int pitch,
    int dim,
    U *c_kernel
  )
  {
    __shared__ T s_Data[ROWS_BLOCKDIM_Y][(ROWS_RESULT_STEPS + 2 * ROWS_HALO_STEPS) * ROWS_BLOCKDIM_X];

    //Offset to the left halo edge
    const int baseX = (blockIdx.x * ROWS_RESULT_STEPS - ROWS_HALO_STEPS) * ROWS_BLOCKDIM_X + threadIdx.x;
    const int baseY = blockIdx.y * ROWS_BLOCKDIM_Y + threadIdx.y;

    d_Src += baseY * pitch + baseX;
    d_Dst += baseY * pitch + baseX;

    //Load main data
    #pragma unroll

    for (int i = ROWS_HALO_STEPS; i < ROWS_HALO_STEPS + ROWS_RESULT_STEPS; i++)
    {
      s_Data[threadIdx.y][threadIdx.x + i * ROWS_BLOCKDIM_X] = d_Src[i * ROWS_BLOCKDIM_X];
    }

    //Load left halo
    #pragma unroll

    for (int i = 0; i < ROWS_HALO_STEPS; i++)
    {
      s_Data[threadIdx.y][threadIdx.x + i * ROWS_BLOCKDIM_X] = (baseX >= -i * ROWS_BLOCKDIM_X) ? d_Src[i * ROWS_BLOCKDIM_X] : 0;
    }

    //Load right halo
    #pragma unroll

    for (int i = ROWS_HALO_STEPS + ROWS_RESULT_STEPS; i < ROWS_HALO_STEPS + ROWS_RESULT_STEPS + ROWS_HALO_STEPS; i++)
    {
      s_Data[threadIdx.y][threadIdx.x + i * ROWS_BLOCKDIM_X] = (imageW - baseX > i * ROWS_BLOCKDIM_X) ? d_Src[i * ROWS_BLOCKDIM_X] : 0;
    }

    //Compute and store results
    __syncthreads();
    #pragma unroll

    for (int i = ROWS_HALO_STEPS; i < ROWS_HALO_STEPS + ROWS_RESULT_STEPS; i++)
    {
      T sum = 0;

      #pragma unroll

      for (int j = -(dim-1)/2; j <= (dim-1)/2; j++)
      {
        sum += c_kernel[(dim-1)/2 - j] * s_Data[threadIdx.y][threadIdx.x + i * ROWS_BLOCKDIM_X + j];
      }

      d_Dst[i * ROWS_BLOCKDIM_X] = sum;
    }
  }

  template<class T,class U>
  void convolutionRowsGPU(
    T *d_Dst,
    block_2d<T> *d_Src,
    int imageW,
    int imageH,
    int dim,
    U *c_kernel
  )
  {
    assert(ROWS_BLOCKDIM_X * ROWS_HALO_STEPS >= (dim-1)/2);
    assert(imageW % (ROWS_RESULT_STEPS * ROWS_BLOCKDIM_X) == 0);
    assert(imageH % ROWS_BLOCKDIM_Y == 0);

    dim3 blocks(imageW / (ROWS_RESULT_STEPS * ROWS_BLOCKDIM_X), imageH / ROWS_BLOCKDIM_Y);
    dim3 threads(ROWS_BLOCKDIM_X, ROWS_BLOCKDIM_Y);

    convolutionRowsKernel<<<blocks, threads>>>(
      d_Dst,
      d_Src->data_pointer,
      imageW,
      imageH,
      (int) d_Src->pitch/sizeof(T),
      dim,
      c_kernel
    );
  }



  ////////////////////////////////////////////////////////////////////////////////
  // Column convolution filter
  ////////////////////////////////////////////////////////////////////////////////
  #define   COLUMNS_BLOCKDIM_X 16
  #define   COLUMNS_BLOCKDIM_Y 8
  #define   COLUMNS_RESULT_STEPS 8
  #define   COLUMNS_HALO_STEPS 1

  template <class T,class U>
  __global__ void convolutionColumnsKernel(
    T *d_Dst,
    T *d_Src,
    int imageW,
    int imageH,
    int pitch,
    int dim,
    U *c_kernel
  )
  {
    __shared__ T s_Data[COLUMNS_BLOCKDIM_X][(COLUMNS_RESULT_STEPS + 2 * COLUMNS_HALO_STEPS) * COLUMNS_BLOCKDIM_Y + 1];

    //Offset to the upper halo edge
    const int baseX = blockIdx.x * COLUMNS_BLOCKDIM_X + threadIdx.x;
    const int baseY = (blockIdx.y * COLUMNS_RESULT_STEPS - COLUMNS_HALO_STEPS) * COLUMNS_BLOCKDIM_Y + threadIdx.y;
    d_Src += baseY * pitch + baseX;
    d_Dst += baseY * pitch + baseX;

    //Main data
    #pragma unroll

    for (int i = COLUMNS_HALO_STEPS; i < COLUMNS_HALO_STEPS + COLUMNS_RESULT_STEPS; i++)
    {
      s_Data[threadIdx.x][threadIdx.y + i * COLUMNS_BLOCKDIM_Y] = d_Src[i * COLUMNS_BLOCKDIM_Y * pitch];
    }

    //Upper halo
    #pragma unroll

    for (int i = 0; i < COLUMNS_HALO_STEPS; i++)
    {
      s_Data[threadIdx.x][threadIdx.y + i * COLUMNS_BLOCKDIM_Y] = (baseY >= -i * COLUMNS_BLOCKDIM_Y) ? d_Src[i * COLUMNS_BLOCKDIM_Y * pitch] : 0;
    }

    //Lower halo
    #pragma unroll

    for (int i = COLUMNS_HALO_STEPS + COLUMNS_RESULT_STEPS; i < COLUMNS_HALO_STEPS + COLUMNS_RESULT_STEPS + COLUMNS_HALO_STEPS; i++)
    {
      s_Data[threadIdx.x][threadIdx.y + i * COLUMNS_BLOCKDIM_Y]= (imageH - baseY > i * COLUMNS_BLOCKDIM_Y) ? d_Src[i * COLUMNS_BLOCKDIM_Y * pitch] : 0;
    }

    //Compute and store results
    __syncthreads();
    #pragma unroll

    for (int i = COLUMNS_HALO_STEPS; i < COLUMNS_HALO_STEPS + COLUMNS_RESULT_STEPS; i++)
    {
      T sum = 0;
      #pragma unroll

      for (int j = -(dim-1)/2; j <= (dim-1)/2; j++)
      {
        sum += c_kernel[(dim-1)/2 - j] * s_Data[threadIdx.x][threadIdx.y + i * COLUMNS_BLOCKDIM_Y + j];
      }

      d_Dst[i * COLUMNS_BLOCKDIM_Y * pitch] = sum;
    }
  }
  template <class T, class U>
  void convolutionColumnsGPU(
    T *d_Dst,
    T *d_Src,
    int imageW,
    int imageH,
    int dim,
    U *c_kernel
  )
  {
    assert(COLUMNS_BLOCKDIM_Y * COLUMNS_HALO_STEPS >= (dim-1)/2);
    assert(imageW % COLUMNS_BLOCKDIM_X == 0);
    assert(imageH % (COLUMNS_RESULT_STEPS * COLUMNS_BLOCKDIM_Y) == 0);

    dim3 blocks(imageW / COLUMNS_BLOCKDIM_X, imageH / (COLUMNS_RESULT_STEPS * COLUMNS_BLOCKDIM_Y));
    dim3 threads(COLUMNS_BLOCKDIM_X, COLUMNS_BLOCKDIM_Y);

    convolutionColumnsKernel<<<blocks, threads>>>(
      d_Dst,
      d_Src,
      imageW,
      imageH,
      imageW,
      dim,
      c_kernel
    );
  }


  template <class T,class U>
  void convolve(cuda::shared_policy,block_2d<T> *input, U *kernel,int dim,block_2d<T> *output)
  {
    U *c_kernel = get_constant_memory_pointer(kernel, kernel+dim*dim, cudaMemoryTypeHost);
    T *d_Output, *d_Buffer;
    const int imageW = input->dim_x;
    const int imageH = input->dim_y;
    cudaMalloc((void **)&d_Output, imageW * imageH * sizeof(T));
    cudaMalloc((void **)&d_Buffer, imageW * imageH * sizeof(T));
    convolutionRowsGPU<T>(
        d_Buffer,
        input,
        imageW,
        imageH,
        dim,
        c_kernel
    );
    convolutionColumnsGPU<T>(
        d_Output,
        d_Buffer,
        imageW,
        imageH,
        dim,
        c_kernel
    );
    cudaMemcpy2D(output->data_pointer,output->pitch, d_Output,imageW*sizeof(T), imageW*sizeof(T), imageH, cudaMemcpyDeviceToDevice);
  }

  template <class T,class U>
  class convolutionFunctor //:public thrust::shared_unary_window_transform_functor<uchar>
  {
  public:
    int dim;
    U *c_kernel;
    convolutionFunctor(int dim, U *kernel)
    {
      this->dim =dim;
      c_kernel = get_constant_memory_pointer(kernel, kernel+dim*dim, cudaMemoryTypeHost);
      // cudaMalloc((void **)&c_kernel, dim*dim*sizeof(U));
      // cudaMemcpy(c_kernel, kernel, dim*dim*sizeof(U),cudaMemcpyHostToDevice);
    }
    __device__ void operator() (const thrust::window_2d<T> &input_window,const thrust::window_2d<T> &output_window) const
    {
      T temp = 0;
      for(int i = 0; i< dim; i++)
      {
        for(int j = 0; j<dim; j++)
        {
          temp += (input_window[make_int2(j,i)]) * (c_kernel[i*dim + j]);
        }
      }
      output_window[dim/2][dim/2]=temp;
    }
  };

  template <class T,class U>
  void convolve(cuda::texture_policy,block_2d<T> *input, U *kernel,int dim,block_2d<T> *output)
  {
    window_vector<T> input_wv(input,dim,dim,1,1);
    window_vector<T> output_wv(output,dim,dim,1,1);
    convolutionFunctor<T,U> f(dim,kernel);
    transform(cuda::texture,input_wv.begin(),input_wv.end(),output_wv.begin(),f);
  }
}
