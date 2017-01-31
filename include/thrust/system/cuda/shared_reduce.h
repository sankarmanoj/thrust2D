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
  template<class Iterator,class Func>
  int reduce(cuda::shared_policy,Iterator begin1, Iterator end1);
};
#include <thrust/system/cuda/shared_reduce.inl>
