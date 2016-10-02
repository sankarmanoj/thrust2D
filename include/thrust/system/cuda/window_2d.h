#pragma once

#include <thrust/block_2d.h>
namespace thrust
{
    template<class T> class window_2d_iterator;
    template <class T>
    class window_2d
    {
    public:
        typedef window_2d reference;
        int start_x,start_y;
        int block_dim_x, block_dim_y;
        int window_dim_x, window_dim_y;
        block_2d<T> *b;
        T * data;
        bool is_shared;
        __host__ __device__ window_2d ();
        __host__ __device__ window_2d (block_2d<T> *b, int start_x, int start_y, int window_dim_x, int window_dim_y);
        __host__ __device__ window_2d (T *data , int start_x, int start_y, int window_dim_x, int window_dim_y, int block_dim_x, int block_dim_y);
        __host__ __device__ window_2d (const window_2d &obj);
        __host__ __device__ window_2d_iterator<T> operator[] (long index);
        __host__ __device__ const window_2d_iterator<T> operator[] (long index) const;
        // __host__ __device__ operator device_reference<window_2d<T> >() const;
    };

    template<class T>
    class window_2d_iterator : private detail::normal_iterator<device_ptr<T> >
    {
        int position;
        T * data;
        block_2d<T> *b;
        bool is_shared;
    public:
        __host__ __device__ window_2d_iterator(T * data, long position);
        __host__ __device__ window_2d_iterator(block_2d<T> *b, long position);
        __host__ __device__ device_reference<T> operator[] (long index);
        __host__ __device__ device_reference<T> operator[] (long index) const;

    };

    template <class T>
    class window_iterator : private detail::normal_iterator<device_ptr<window_2d<T> > >
    {

        int position;
    public:
        block_2d<T> *b;
        typedef long difference_type;
        typedef T base_value_type;
        typedef window_2d<T > value_type;
        typedef detail::iterator_category_with_system_and_traversal<random_access_device_iterator_tag, system::cuda::detail::tag, random_access_traversal_tag> iterator_category;
        typedef window_2d<T> reference;
        typedef window_2d<T>* pointer;
        int window_dim_x;
        int window_dim_y;
        int block_dim_x;
        int block_dim_y;
        int stride_x;
        int stride_y;
        int windows_along_x, windows_along_y;
        __host__ window_iterator(block_2d<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y);
        __host__ window_iterator(block_2d<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y,int position);

        __host__ __device__ window_2d<T> operator[] (long index);
        __host__ __device__ const window_2d<T> operator[] (long index) const;
        __host__ __device__ window_2d<T> operator* ();
        __host__ __device__ const window_2d<T> operator* () const;

        __host__ __device__ long operator- (window_iterator& it);
        __host__ __device__ long operator- (const window_iterator& it);
        __host__ __device__ long operator- (const window_iterator& it) const;
        __host__ __device__ long operator- (window_iterator& it) const;


        __host__ __device__ window_iterator<T> operator+ (long N);

        __host__ __device__ window_iterator<T> operator++ ();

        __host__ __device__ window_iterator<T> operator- (long N);

        __host__  __device__ window_iterator<T> (const window_iterator<T>& other);

        __host__ __device__ window_iterator<T>& operator= (window_iterator<T>& it);

        __host__ __device__ bool operator!= (const window_iterator<T>& it) const;
        __host__ __device__ bool operator== (const window_iterator<T>& it) const;
        __host__ __device__ bool operator> (const window_iterator<T>& it) const;
        __host__ __device__ bool operator>= (const window_iterator<T>& it) const;
        __host__ __device__ bool operator< (const window_iterator<T>& it) const;
        __host__ __device__ bool operator<= (const window_iterator<T>& it) const;

        __host__ __device__ __forceinline__ window_iterator<T> operator+= (long N);
        __host__ __device__ __forceinline__ const window_iterator<T> operator+= (long N) const;


    };

    template <class T>
    class window_vector
    {
        int windows_along_x, windows_along_y;
        int position;
    public:
        block_2d<T> *b;
        int window_dim_x;
        int window_dim_y;
        int block_dim_x;
        int block_dim_y;
        int stride_x;
        int stride_y;
        window_vector(block_2d<T> *b, int window_dim_x, int window_dim_y, int stride_x, int stride_y);

        __host__ __device__ window_2d<T> operator[] (unsigned int index);
        __host__ __device__ const window_2d<T> operator[] (unsigned int index) const;
        __host__ __device__ window_2d<T> operator* ();
        __host__ __device__ const window_2d<T> operator* () const;


        window_iterator<T> begin();
        window_iterator<T> end();
    };
}
#include <thrust/system/cuda/window_2d.inl>
