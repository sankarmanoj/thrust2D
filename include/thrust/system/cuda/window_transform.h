#pragma once

#include <thrust/window_2d.h>
#include <thrust/execution_policy.h>

namespace thrust
{
    namespace cuda
    {
        struct shared_policy : device_execution_policy<shared_policy> {};
        shared_policy shared;
    }
    template <class Iterator>
    void convolve(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2);
    template <class Iterator, class Func>
    void for_each(cuda::shared_policy,Iterator begin1, Iterator end1, Func f);
    template <class Iterator, class Func>
    void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Func f);
    template <class Iterator, class Func>
    void transform(cuda::shared_policy,Iterator begin1, Iterator end1, Iterator begin2, Iterator begin3, Func f);
    #define MATRIX_TILE_WIDTH 2
    template <class T>
    Block_2D<T> matrix_multiply(Block_2D<T> *a, Block_2D<T> *b);
    template <class T>
    void transpose(Block_2D<T> *a);
}
#include <thrust/system/cuda/window_transform.inl>
