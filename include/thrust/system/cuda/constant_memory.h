#pragma once
#include <thrust/device_vector.h>
namespace thrust
{
  #define CSIZE 60536
  __constant__ unsigned char c_memory[CSIZE];
  static int c_position = 0;
  template<class T>
  T* get_constant_memory_pointer(thrust::detail::normal_iterator<thrust::device_ptr<T>>, thrust::detail::normal_iterator<thrust::device_ptr<T>>);

  template<class T>
  T* get_constant_memory_pointer(const T* begin,const T* end);
};
#include <thrust/system/cuda/constant_memory.inl>
