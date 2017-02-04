#pragma once

#include <thrust/window_2d.h>
#include "window_structures.h"
#define maxThreadsPerBlock1 1024
#define minBlocksPerMultiprocessor 2

namespace thrust
{

  template <class Iterator, class Func>
  void for_each(cuda::shared_policy,Iterator begin1, Iterator end1, Func f);
  template <class T>
  class shared_window_for_each_functor
  {
  public:
    __device__ virtual void operator() (const window_2d<T> &w) const = 0;
  };
}
#include <thrust/system/cuda/window_for_each.inl>
