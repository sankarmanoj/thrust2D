#pragma once

#include <thrust/window_2d.h>

namespace thrust
{
  template <class Iterator>
  void convolve(Iterator begin1, Iterator end1, Iterator begin2);
  template <class Iterator, class Func>
  void window_for_each(Iterator begin1, Iterator end1, Func f);
  template <class Iterator, class Func>
  void window_transform(Iterator begin1, Iterator end1, Iterator begin2, Func f);
  template <class Iterator, class Func>
  void window_transform(Iterator begin1, Iterator end1, Iterator begin2, Iterator begin3, Func f);
}
#include <thrust/system/cuda/window_transform.inl>
