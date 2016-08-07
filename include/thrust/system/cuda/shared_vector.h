/*
* This Contains The shared_vector which inherits from the shared_vector
* We are inheriting to avoid the redundant work already written by thrust.
*/

#pragma once
#include <thrust/device_vector.h>
#include <thrust/detail/raw_pointer_cast.h>

#include <thrust/detail/config.h>
#include <thrust/detail/type_traits.h>
#include <thrust/iterator/detail/iterator_facade_category.h>
#include <thrust/iterator/detail/distance_from_result.h>

#include <iostream>

using namespace thrust;
namespace thrust
{
    namespace hybrid
    {

      /*
      * ********** SYNCHRONIZE WRAPPER ******************
      * NOTE :: This is the actual function which is to be implemented
      * To be uncommented after seeing the file thrust_saxpy.cu
      * Uncomment the following after removing the syncthreads implementation from the thrust_saxpy.cu
      */

      /*

      __device__
      void synchronize_device ()
      {
        __syncthreads ();
      }

      __host__  __device__  
      void synchronize_host ()
      {
        ;
      }

      __device__
      void synchronize ()
      {
        #if __BULK_HAS_CUDART__
          synchronize_device ();
        #else
          synchronize_host ();
        #endif
      }

      */

      template <class T>
      class shared_iterator : public thrust::detail::normal_iterator<thrust::device_ptr<T> >
            {

              public:

                thrust::detail::normal_iterator<thrust::device_ptr<T> > device_it;

                __host__ __device__
                shared_iterator(thrust::detail::normal_iterator<thrust::device_ptr<T> > device_itr) : thrust::detail::normal_iterator<thrust::device_ptr<T> > ((device_itr))
                {

                    this->device_it = device_itr;
                }

                __host__ __device__
                thrust::device_reference<T> operator[] (unsigned int index)
                {
                    return (thrust::device_reference<T>) device_it[index];


                }
                __host__ __device__
                const thrust::device_reference<T> operator[] (unsigned int index) const
                {
                    return (thrust::device_reference<T>) device_it[index];
                }

                __host__ __device__
                int operator- (const shared_iterator& it)
                {
                  return (int)(this->device_it-it.device_it);
                }

                __host__ __device__
                thrust::hybrid::shared_iterator<T> operator+ (long N)
                {
                  return shared_iterator(this->device_it+N);
                }

                __host__ __device__
                thrust::hybrid::shared_iterator<T> operator- (long N)
                {
                  return shared_iterator(this->device_it-N);
                }

                __host__ __device__
                shared_iterator (const shared_iterator& other) : thrust::detail::normal_iterator<thrust::device_ptr<T> >(other.device_it)
                {
                  this->device_it = other.device_it;
                }

                __host__ __device__
                thrust::hybrid::shared_iterator<T>& operator= (shared_iterator it)
                {
                  this->device_it = it.device_it;
                  return this;
                }

                __host__ __device__
                thrust::device_reference<T> operator* ()
                {

                  return *(this->device_it);
                }

                __host__ __device__
                const thrust::device_reference<T> operator* () const 
                {

                  return *(this->device_it);
                }

                __host__ __device__ __forceinline__
                thrust::hybrid::shared_iterator<T> operator+= (int N)
                {

                  this->device_it += N;
                  return *this;

                }

                __host__ __device__ __forceinline__
                const thrust::hybrid::shared_iterator<T> operator+= (int N) const 
                {

                  this->device_it += N;
                  return *this;
                  
                }

                __host__ __device__
                bool operator< (const shared_iterator<T>& it)
                {
                  return this->device_it < it.device_it;
                }


            };

        // Alloc = thrust::device_malloc_allocator<T> Means That We Are Allocating Memory In Device.
        template <typename T,typename Alloc = thrust::device_malloc_allocator<T> >
        class shared_vector : public device_vector <T,Alloc>
        {
        	private:

        		// We Have To Tell That The Parent Class Of shared_vector Is shared_vector
        		typedef thrust::device_vector<T,Alloc> Parent;

            // NOTE : This is the new flag introduced by us, to indicate whether to bring ot to shared memory or not.
            bool bring_to_shared;

        	public:

        		typedef typename Parent::size_type  size_type;
            typedef typename Parent::value_type value_type;

            public:

           	/*! This constructor creates an empty \p shared_vector.
             */
            __host__
            shared_vector(void)
              :Parent() {
                bring_to_shared = true;
              }

            /*! The destructor erases the elements.
             */
            //  Define an empty destructor to explicitly specify
            //  its execution space qualifier, as a workaround for nvcc warning
            __host__
            ~shared_vector(void) {

            }

            /*! This constructor creates a \p shared_vector with the given
             *  size.
             *  \param n The number of elements to initially create.
             */
            __host__
            explicit shared_vector(size_type n)
              :Parent(n) {
                bring_to_shared = true;
              }

            /*! This constructor creates a \p shared_vector with copies
             *  of an exemplar element.
             *  \param n The number of elements to initially create.
             *  \param value An element to copy.
             */
            __host__
            explicit shared_vector(size_type n, const value_type &value)
              :Parent(n,value) {
                bring_to_shared = true;
              }

            /*! Copy constructor copies from an exemplar \p shared_vector.
             *  \param v The \p shared_vector to copy.
             */
            __host__
            shared_vector(const shared_vector &v)
              :Parent(v) {
                bring_to_shared = true;
              }

            /*! Copy constructor copies from an exemplar \p shared_vector with different type.
             *  \param v The \p shared_vector to copy.
             */
            template<typename OtherT, typename OtherAlloc>
            __device__
            shared_vector(const shared_vector<OtherT,OtherAlloc> &v)
              :Parent(v) {
                bring_to_shared = true;
              }

            /*! Assign operator copies from an exemplar \p shared_vector with different type.
             *  \param v The \p shared_vector to copy.
             */
            template<typename OtherT, typename OtherAlloc>
            __device__
            shared_vector &operator=(const shared_vector<OtherT,OtherAlloc> &v)
            { Parent::operator=(v); return *this; }

            /*! Copy constructor copies from an exemplar \c std::vector.
             *  \param v The <tt>std::vector</tt> to copy.
             */
            template<typename OtherT, typename OtherAlloc>
            __host__
            shared_vector(const std::vector<OtherT,OtherAlloc> &v)
              :Parent(v) {
                bring_to_shared = true;
              }

            /*! Assign operator copies from an exemplar <tt>std::vector</tt>.
             *  \param v The <tt>std::vector</tt> to copy.
             */
            template<typename OtherT, typename OtherAlloc>
            __host__
            shared_vector &operator=(const std::vector<OtherT,OtherAlloc> &v)
            { Parent::operator=(v); return *this;}

            /*! Copy constructor copies from an exemplar \p host_vector with possibly different type.
             *  \param v The \p host_vector to copy.
             */
            template<typename OtherT, typename OtherAlloc>
            __host__
            shared_vector(const host_vector<OtherT,OtherAlloc> &v);

            /*! Assign operator copies from an examplar \p host_vector.
             *  \param v The \p host_vector to copy.
             */
            template<typename OtherT, typename OtherAlloc>
            __host__
            shared_vector &operator=(const host_vector<OtherT,OtherAlloc> &v)
            { Parent::operator=(v); return *this; }

            /*! This constructor builds a \p shared_vector from a range.
             *  \param first The beginning of the range.
             *  \param last The end of the range.
             */

            template<typename InputIterator>
            __host__
            shared_vector(InputIterator first, InputIterator last)
              :Parent(first,last) {
                bring_to_shared = true;

              }

            __host__
            void use_shared (bool flag)
            {
                bring_to_shared = flag;
            }

          public :

    			shared_iterator<T> begin ()
    			{
    				shared_iterator<T> it (Parent::begin());
    				return it;
    			}

    			shared_iterator<T> end ()
    			{
    				shared_iterator<T> it (Parent::end());
    				return it;
    			}

        };
    } // End Of Hybrid Namespace

}
// End of thrust namespace

#include <thrust/system/cuda/shared_vector.inl>
