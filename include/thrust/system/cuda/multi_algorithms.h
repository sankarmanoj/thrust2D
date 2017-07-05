#pragma once
#include <thrust/device_vector.h>
#include "window_structures.h"
namespace thrust
{
  namespace cuda
  {
    struct multi_policy : device_execution_policy<multi_policy> {};
    multi_policy multi;
  }
  template <class Iterator1,class Iterator2, class Func>
  void transform(cuda::multi_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2, Func f);

  template <class Iterator1,class Iterator2,class Iterator3, class Func>
  void transform(cuda::multi_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2, Iterator3 begin3,Func f);


  template <class Tp,class Func>
  void for_each(cuda::multi_policy,detail::normal_iterator<Tp> first,detail::normal_iterator<Tp> last, Func f);

  template <class T>
  class multi_for_each_functor
  {
  public:
    __device__ virtual void operator() (const T &a) const = 0;
  };

  template <class T>
  class multi_unary_transform_functor
  {
  public:
    __device__ virtual T operator() (const T &a) const = 0;
  };

  template <class T>
  class multi_binary_transform_functor
  {
  public:
    __device__ virtual T operator() (const T &a,const T &b) const = 0;
  };

  template <class T>
  void convolve(device_vector<T> a, device_vector<T> b, device_vector<T> c);

  template <class T>
  void convolve(cuda::multi_policy,device_vector<T> a, device_vector<T> b, device_vector<T> c);

  template <class Iterator, class BinaryFunc, class OutputType>
  OutputType reduce (cuda::multi_policy,Iterator first,Iterator last, OutputType init, BinaryFunc b);

  template <class Iterator, class Func, class OutputType, class BinaryFunc>
  OutputType transform_reduce(cuda::multi_policy,Iterator begin, Iterator end, Func f, OutputType init, BinaryFunc b);

  template <class Iterator1,class Iterator2, class Func, class OutputType, class BinaryFunc>
  OutputType transform_reduce(cuda::multi_policy,Iterator1 begin1, Iterator1 end1,Iterator2 begin2,Func f, OutputType init, BinaryFunc b);
}
#include <thrust/system/cuda/multi_for_each.inl>
#include <thrust/system/cuda/multi_generic_reduce.inl>
