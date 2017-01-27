#pragma once

#include <thrust/device_vector.h>
#include <thrust/execution_policy.h>
#define Iterator detail::normal_iterator<device_ptr<T> >
namespace thrust
{
  namespace cuda
  {
    struct shared_policy : device_execution_policy<shared_policy> {};
    shared_policy shared;
  }
  template <class T,class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1,Iterator begin2, Func f);

  template <class T,class Func>
  void transform(cuda::shared_policy,Iterator begin1, Iterator end1,Iterator begin2, Iterator begin3,Func f);

  template <class T,class Func>
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
}
#include <thrust/system/cuda/shared_for_each.inl>
