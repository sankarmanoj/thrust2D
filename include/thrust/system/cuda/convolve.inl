#pragma once
#include <thrust/system/cuda/window_transform.h>
namespace thrust
{

  ////////////////////////////////////////////////////////////////////////////////
  // Convolution kernel size (the only parameter inlined in the code)
  ////////////////////////////////////////////////////////////////////////////////
  #define KERNEL_RADIUS 1
  #define KERNEL_LENGTH 51
  ////////////////////////////////////////////////////////////////////////////////
  // GPU-specific defines
  ////////////////////////////////////////////////////////////////////////////////
  //Maps to a single instruction on G8x / G9x / G10x
  #define IMAD(a, b, c) ( __mul24((a), (b)) + (c) )

  //Use unrolled innermost convolution loop
  #define UNROLL_INNER 0

  // //Round a / b to nearest higher integer value
  // inline int iDivUp(int a, int b)
  // {
  //     return (a % b != 0) ? (a / b + 1) : (a / b);
  // }

  //Align a to nearest higher multiple of b
  inline int iAlignUp(int a, int b)
  {
      return (a % b != 0) ? (a - a % b + b) : a;
  }

  ////////////////////////////////////////////////////////////////////////////////
  // Convolution kernel and input array storage
  ////////////////////////////////////////////////////////////////////////////////
  __constant__ float c_Kernel[KERNEL_LENGTH];

  void setConvolutionKernel(float *h_Kernel, int ksize)
  {
      cudaMemcpyToSymbol(c_Kernel, h_Kernel, ksize * sizeof(float));
  }

  // texture<T, 2, cudaReadModeElementType> texSrc;


  void setInputArray(cudaArray *a_Src)
  {
  }

  void detachInputArray(void)
  {
  }


  ////////////////////////////////////////////////////////////////////////////////
  // Loop unrolling templates, needed for best performance
  ////////////////////////////////////////////////////////////////////////////////
  template<int i,typename T> __device__ T  convolutionRow(float x, float y,cudaTextureObject_t texObjSrc)
  {
      return
          tex2D<T>(texObjSrc, x + (T )(KERNEL_RADIUS - i), y) * c_Kernel[i]
          + convolutionRow<i - 1,T>(x, y,texObjSrc);
  }

  template<> __device__ float  convolutionRow<-1>(float x, float y,cudaTextureObject_t texObjSrc)
  {
      return 0;
  }

  template<int i,typename T> __device__ T  convolutionColumn(float x, float y,cudaTextureObject_t texObjSrc)
  {
      return
          tex2D<T >(texObjSrc, x, y + (float)(KERNEL_RADIUS - i)) * c_Kernel[i]
          + convolutionColumn<i - 1,T>(x, y,texObjSrc);
  }

  template<> __device__ float convolutionColumn<-1>(float x, float y,cudaTextureObject_t texObjSrc)
  {
      return 0;
  }



  ////////////////////////////////////////////////////////////////////////////////
  // Row convolution filter
  ////////////////////////////////////////////////////////////////////////////////
  template<class T>
  __global__ void convolutionRowsKernel(
      T *d_Dst,
      int imageW,
      int imageH,
      int ksize,
      int pitch,
      cudaTextureObject_t texObjSrc
  )
  {
      const   int ix = IMAD(blockDim.x, blockIdx.x, threadIdx.x);
      const   int iy = IMAD(blockDim.y, blockIdx.y, threadIdx.y);
      const float  x = (float)ix + 0.5f;
      const float  y = (float)iy + 0.5f;

      if (ix >= imageW || iy >= imageH)
      {
          return;
      }

      T sum = 0;

  #if(UNROLL_INNER)
      sum = convolutionRow<2 *KERNEL_RADIUS,T>(x, y,texObjSrc);
  #else

      for (int k = -ksize/2 + 1; k <= ksize/2; k++)
      {
          sum += tex2D<T>(texObjSrc, x + (T)k, y) * c_Kernel[ksize/2 - k];
      }

  #endif

      d_Dst[IMAD(iy, pitch, ix)] = abs((float)sum);
  }

template <typename T>
void convolutionRowsGPU(
      T *d_Dst,
      cudaArray *a_Src,
      int imageW,
      int imageH,
      int ksize,
      int pitch
  )
  {
      dim3 threads(16, 12);
      dim3 blocks(iDivUp(imageW, threads.x), iDivUp(imageH, threads.y));

      cudaTextureObject_t texObjSrc;
      cudaResourceDesc resDesc;
      cudaTextureDesc texDesc;

      memset(&texDesc, 0, sizeof(texDesc));
      memset(&resDesc, 0, sizeof(resDesc));

      resDesc.resType=cudaResourceTypeArray;
      resDesc.res.array.array=(a_Src);
      cudaCreateTextureObject(&texObjSrc,&resDesc,&texDesc,NULL);
      // cudaBindTextureToArray(texSrc, a_Src);
      convolutionRowsKernel<<<blocks, threads>>>(
          d_Dst,
          imageW,
          imageH,
          ksize,
          pitch,
          texObjSrc
      );

  }



  ////////////////////////////////////////////////////////////////////////////////
  // Column convolution filter
  ////////////////////////////////////////////////////////////////////////////////
  template <typename T>
  __global__ void convolutionColumnsKernel(
      T *d_Dst,
      int imageW,
      int imageH,
      int ksize,
      int pitch,
      cudaTextureObject_t texObjSrc
  )
  {
      const   int ix = IMAD(blockDim.x, blockIdx.x, threadIdx.x);
      const   int iy = IMAD(blockDim.y, blockIdx.y, threadIdx.y);
      const float  x = (float)ix + 0.5f;
      const float  y = (float)iy + 0.5f;

      if (ix >= imageW || iy >= imageH)
      {
          return;
      }

      T sum = 0;

  #if(UNROLL_INNER)
      sum = convolutionColumn<2 *KERNEL_RADIUS,T>(x, y,texObjSrc);
  #else

      for (int k = -ksize/2 + 1; k <= ksize/2; k++)
      {
          sum += tex2D<T>(texObjSrc, x, y + (T)k) * c_Kernel[ksize/2 - k];
      }

  #endif

      d_Dst[IMAD(iy, pitch, ix)] = abs((float)sum);
  }

  template<class T>
 void convolutionColumnsGPU(
      T *d_Dst,
      cudaArray *a_Src,
      int imageW,
      int imageH,
      int ksize,
      int pitch
  )
  {
      dim3 threads(16, 12);
      dim3 blocks(iDivUp(imageW, threads.x), iDivUp(imageH, threads.y));
      cudaTextureObject_t texObjSrc;
      cudaResourceDesc resDesc;
      cudaTextureDesc texDesc;

      memset(&texDesc, 0, sizeof(texDesc));
      memset(&resDesc, 0, sizeof(resDesc));

      resDesc.resType=cudaResourceTypeArray;
      resDesc.res.array.array=(a_Src);
      cudaCreateTextureObject(&texObjSrc,&resDesc,&texDesc,NULL);
      // cudaBindTextureToArray(texSrc, a_Src);
      convolutionColumnsKernel<<<blocks, threads>>>(
          d_Dst,
          imageW,
          imageH,
          ksize,
          pitch,
          texObjSrc
      );
  }

  template <class T>
  void convolve(cuda::texture_policy,block_2d<T> *block, float *kernel, int ksize)
  {
    cudaArray *a_Src;
    // T *d_Output;
    const int imageW = block->dim_x;
    const int imageH = block->dim_y;
    cudaChannelFormatDesc TTex = cudaCreateChannelDesc<T>();
    cudaMallocArray(&a_Src, &TTex, imageW, imageH);
    // cudaMalloc((void **)&d_Output, imageW * imageH * sizeof(T));
    setConvolutionKernel(kernel,ksize);
    cudaMemcpy2DToArray(a_Src, 0, 0, block->data_pointer,block->pitch, imageW, imageH, cudaMemcpyHostToDevice);
    convolutionRowsGPU<T>(
        block->data_pointer,
        a_Src,
        imageW,
        imageH,
        ksize,
        block->pitch/sizeof(T)
    );
    cudaMemcpy2DToArray(a_Src, 0, 0, block->data_pointer,block->pitch, imageW, imageH, cudaMemcpyDeviceToDevice);
    convolutionColumnsGPU<T>(
        block->data_pointer,
        a_Src,
        imageW,
        imageH,
        ksize,
        block->pitch/sizeof(T)
    );
    // cudaMemcpy2D(block->data_pointer,block->pitch, d_Output,imageW*sizeof(T), imageW, imageH, cudaMemcpyDeviceToDevice);
  }
}
