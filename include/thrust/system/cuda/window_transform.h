#pragma once

#include <thrust/window_2d.h>
#include <thrust/execution_policy.h>

namespace thrust
{
    struct shared : device_execution_policy<shared> {};
    template <class Iterator>
    void convolve(shared,Iterator begin1, Iterator end1, Iterator begin2);
    template <class Iterator, class Func>
    void for_each(shared,Iterator begin1, Iterator end1, Func f);
    template <class Iterator, class Func>
    void transform(Iterator begin1, Iterator end1, Iterator begin2, Func f);
    template <class Iterator, class Func>
    void transform(shared,Iterator begin1, Iterator end1, Iterator begin2, Iterator begin3, Func f);
}
#include <thrust/system/cuda/window_transform.inl>
