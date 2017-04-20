#pragma once
#include <thrust/device_vector.h>
namespace thrust
{
  #define CSIZE 60536
  __constant__ unsigned char c_storage[CSIZE];
  static int c_position = 0;
  template<class T>
  class constant_vector
  {
    int offset;
    typedef T value_type;
    typedef T* pointer;
  public:
    constant_vector()
    {
      offset = 0;
    }
    constant_vector(thrust::detail::normal_iterator<thrust::device_ptr<T> >, thrust::detail::normal_iterator<thrust::device_ptr<T> >);
    constant_vector(thrust::detail::normal_iterator<T *>, thrust::detail::normal_iterator<T*> );
    __device__ const T operator[] (unsigned long index);
    __device__ const T operator[] (unsigned long index) const;

  };

};
#include <thrust/system/cuda/constant_memory.inl>
