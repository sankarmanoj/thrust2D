#pragma once

#include <thrust/device_vector.h>
#include <thrust/execution_policy.h>
namespace thrust
{
  namespace cuda
  {
    struct shared_policy : device_execution_policy<shared_policy> {};
    shared_policy shared;
  }
  template <class T, class Alloc>
  typedef typename detail::normal_iterator<device_ptr<T> > Iterator;
  template <class Func>
  void for_each(cuda::shared_policy,Iterator begin1, Iterator end1, Func f);
  template <class T>
  class shared_for_each_functor
  {
  public:
    __device__ virtual void operator() (const T &a) const = 0;
  };
}
#include <thrust/system/cuda/shared_for_each.inl>
