#pragma once
#include <thrust/detail/vector_base.h>
#include <thrust/device_malloc_allocator.h>
#include <thrust/device_ptr.h>
#include <thrust/iterator/counting_iterator.h>
namespace thrust
{

  template<typename functional_operator>
  class functional_iterator
  {
public:
    long position;
    functional_operator f_op;
    typedef long difference_type;
    typedef long  value_type;
    // typedef typename count iterator;
    typedef typename counting_iterator<long>::iterator_category iterator_category;
    typedef long reference;
    typedef long* pointer;
    __host__ __device__ reference	operator* () const;
    __host__ __device__ reference	operator[] (const size_t index) const;
    __host__ __device__ functional_iterator (functional_operator f_op);
    __host__ __device__ functional_iterator (functional_operator f_op,long position);
    __host__ __device__ functional_iterator (const functional_iterator &pb);
    __host__ __device__ functional_iterator<functional_operator> operator+ (long value);
    __host__ __device__ difference_type operator- (const functional_iterator<functional_operator>& it) const;
    __host__ __device__ difference_type operator- (functional_iterator<functional_operator>& it) const;
    __host__ __device__ functional_iterator<functional_operator> operator-- ();
    __host__ __device__ functional_iterator<functional_operator>& operator+= (long N);
    __host__ __device__ functional_iterator<functional_operator>& operator++ ();
    __host__ __device__ functional_iterator<functional_operator> operator- (const long N);
    __host__ __device__ functional_iterator<functional_operator> operator- (const long N) const;
    __host__ __device__ bool operator!= (const functional_iterator<functional_operator>& it) const;
    __host__ __device__ bool operator== (const functional_iterator<functional_operator>& it) const;
    __host__ __device__ bool operator>= (const functional_iterator<functional_operator>& it) const;
    __host__ __device__ bool operator<= (const functional_iterator<functional_operator>& it) const;
    __host__ __device__ bool operator> (const functional_iterator<functional_operator>& it) const;
    __host__ __device__ bool operator< (const functional_iterator<functional_operator>& it) const;
  };

}
#include <thrust/iterator/detail/functional_iterator.inl>
