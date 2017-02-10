#pragma once

#include <thrust/device_vector.h>
#include "window_structures.h"
namespace thrust
{
  template <class Iterator1,class Iterator2, class Func>
  void transform(cuda::shared_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2, Func f);

  template <class Iterator1,class Iterator2,class Iterator3, class Func>
  void transform(cuda::shared_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2, Iterator3 begin3,Func f);

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
  template <class Iterator>
  void inclusive_scan (cuda::shared_policy,Iterator first,Iterator last,Iterator output);
}
#include <thrust/system/cuda/shared_for_each.inl>
#include <thrust/system/cuda/shared_reduce.inl>
