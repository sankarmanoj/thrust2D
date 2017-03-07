#pragma once
#include <thrust/constant_memory.h>
#include <thrust/device_vector.h>
#include "window_structures.h"
namespace thrust
{
  unsigned int previous_power_of_two(unsigned int x )
  {
    if (x == 0) {
        return 0;
    }
    x--; //Uncomment this, if you want a strictly less than 'x' result.
    x |= (x >> 1);
    x |= (x >> 2);
    x |= (x >> 4);
    x |= (x >> 8);
    x |= (x >> 16);
    return x - (x >> 1);
  }

  template <class Iterator1,class Iterator2, class Func>
  void transform(cuda::shared_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2, Func f);

  template <class Iterator1,class Iterator2,class Iterator3, class Func>
  void transform(cuda::shared_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2, Iterator3 begin3,Func f);

  template <class Iterator1,class Iterator2,class Iterator3, class Func>
  void transform(cuda::shared_first_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2, Iterator3 begin3,Func f);

  template <class Iterator, class Func>
  void for_each(cuda::shared_policy,Iterator begin1, Iterator end1, Func f);

  template <class T>
  class shared_for_each_functor
  {
  public:
    __device__ virtual void operator() (const T &a) const = 0;
  };

  template <class T>
  class shared_unary_transform_functor
  {
  public:
    __device__ virtual T operator() (const T &a) const = 0;
  };

  template <class T>
  class shared_binary_transform_functor
  {
  public:
    __device__ virtual T operator() (const T &a,const T &b) const = 0;
  };

  template <class T>
  void convolve(device_vector<T> a, device_vector<T> b, device_vector<T> c);

  template <class T>
  void convolve(cuda::shared_policy,device_vector<T> a, device_vector<T> b, device_vector<T> c);

  template <class Iterator>
  typename thrust::iterator_traits<Iterator>::value_type reduce (cuda::shared_policy,Iterator first,Iterator last);
  template <class Iterator, class BinaryFunc>
  typename thrust::iterator_traits<Iterator>::value_type reduce (cuda::shared_policy,Iterator first,Iterator last, BinaryFunc b);
  // template <class Iterator>
  // void inclusive_scan (cuda::shared_policy,Iterator first,Iterator last,Iterator output);

  template <class Iterator, class Func>
  typename thrust::iterator_traits<Iterator>::value_type transform_reduce(cuda::shared_policy,Iterator begin, Iterator end, Func f);

  // template <class Iterator, class Func, class BinaryFunc>
  // typename thrust::iterator_traits<Iterator>::value_type transform_reduce(cuda::shared_policy,Iterator begin, Iterator end, Func f, BinaryFunc b);

  template <class Iterator1,class Iterator2, class Func>
  typename thrust::iterator_traits<Iterator1>::value_type transform_reduce(cuda::shared_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2,Func f);

  template <class Iterator1,class Iterator2, class Func, class BinaryFunc>
  typename thrust::iterator_traits<Iterator1>::value_type transform_reduce(cuda::shared_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2,Func f, BinaryFunc b);
}
#include <thrust/system/cuda/shared_for_each.inl>
#include <thrust/system/cuda/shared_reduce.inl>
#include <thrust/system/cuda/shared_generic_reduce.inl>
