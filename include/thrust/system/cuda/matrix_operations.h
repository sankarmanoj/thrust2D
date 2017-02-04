#pragma once

#include <thrust/window_2d.h>
#include <thrust/execution_policy.h>
#include <cublas_v2.h>
namespace thrust
{
#define MATRIX_TILE_WIDTH 2
template <class T>
block_2d<T> matrix_multiply(block_2d<T> &a, block_2d<T> &b,cublasHandle_t handle);
template <class T>
void transpose(block_2d<T> *a);
}
#include <thrust/system/cuda/matrix_operations.inl>
