#pragma once
#include <thrust/iterator/functional_iterator.h>
namespace thrust
{
  template<typename functional_operator>
  __host__ __device__ functional_iterator<functional_operator>::reference	functional_iterator<functional_operator>::operator* () const
  {
    return f_op(this->position);
  }
  template<typename functional_operator>
  __host__ __device__ functional_iterator<functional_operator>::reference	functional_iterator<functional_operator>::operator[] (const size_t index) const
  {
    return f_op(this->position+index);
  }
  template<typename functional_operator>
  __host__ __device__ functional_iterator<functional_operator>::functional_iterator (const functional_iterator &obj)
  {
    this->position = obj.position;
    this->f_op = f_op;
  }
  template<typename functional_operator>
  __host__ __device__ functional_iterator<functional_operator>::functional_iterator (functional_operator f_op)
  {
    this->position = 0;
    this->f_op = f_op;
  }
  template<typename functional_operator>
  __host__ __device__ functional_iterator<functional_operator>::functional_iterator (functional_operator f_op,long position)
  {
    this->position = position;
    this->f_op = f_op;
  }
  template<typename functional_operator>
  __host__ __device__ functional_iterator<functional_operator> functional_iterator<functional_operator>::operator+ (long value)
  {
    return functional_iterator(this->f_op,this->position+value);
  }
  template<typename functional_operator>
  __host__ __device__ functional_iterator<functional_operator>::difference_type functional_iterator<functional_operator>::operator- (const functional_iterator& it) const
  {
    return this->position - it.position;
  }
  // __host__ __device__ difference_type operator- (functional_iterator& it) const;
  template<typename functional_operator>
  __host__ __device__ functional_iterator<functional_operator> functional_iterator<functional_operator>::operator-- ()
  {
    this->position++;
    return *this;
  }
  template<typename functional_operator>
  __host__ __device__ functional_iterator<functional_operator>& functional_iterator<functional_operator>::operator+= (long N)
  {
    this->position+=N;
    return *this;
  }
  template<typename functional_operator>
  __host__ __device__ functional_iterator<functional_operator>& functional_iterator<functional_operator>::operator++ ()
  {
    this->position++;
    return *this;
  }
  template<typename functional_operator>
  __host__ __device__ functional_iterator<functional_operator> functional_iterator<functional_operator>::operator- (const long N)
  {
    this->position=this->position-N;
    return *this;
  }
  template<typename functional_operator>
  // __host__ __device__ functional_iterator operator- (const long N) const;
  __host__ __device__ bool functional_iterator<functional_operator>::operator!= (const functional_iterator& it) const
  {
    return this->position!=it.position;
  }
  template<typename functional_operator>
  __host__ __device__ bool functional_iterator<functional_operator>::operator== (const functional_iterator& it) const
  {
    return this->position==it.position;
  }
  template<typename functional_operator>
  __host__ __device__ bool functional_iterator<functional_operator>::operator>= (const functional_iterator& it) const
  {
    return this->position>=it.position;
  }
  template<typename functional_operator>
  __host__ __device__ bool functional_iterator<functional_operator>::operator<= (const functional_iterator& it) const
  {
    return this->position<=it.position;
  }
  template<typename functional_operator>
  __host__ __device__ bool functional_iterator<functional_operator>::operator> (const functional_iterator& it) const
  {
    return this->position>it.position;
  }
  template<typename functional_operator>
  __host__ __device__ bool functional_iterator<functional_operator>::operator< (const functional_iterator& it) const
  {
    return this->position<it.position;
  }
}
