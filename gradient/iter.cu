#include <thrust/iterator/functional_iterator.h>
#include <thrust/device_vector.h>
#include <thrust/host_vector.h>
#include <thrust/transform.h>
#include <thrust/execution_policy.h>
#include <boost/type_index.hpp>

class transFunc
{
public:
 __device__ __host__ int operator() (int index)
  {
    return index;
  }
};
template <class T>
void foo(T) {
    std::cout << "\n Short name: " << boost::typeindex::type_id<T>().raw_name();
    std::cout << "\n Readable name: " << boost::typeindex::type_id<T>().pretty_name();
}
class printFunc
{
public:
 __device__ __host__ void operator() (int index)
  {
    printf("%d\n",(int) index);
  }
};
class funcOp
{
public:
  __host__ __device__ long operator() (long index) const
  {
    return index*2;
  }
};
int main()
{

  thrust::device_vector<int>a(100);
  printf("Hello World\n");
  funcOp as;
  thrust::functional_iterator<funcOp> bob(as);

  // printf("%d\n",(int)bob[43]);
  // foo(thrust::counting_);
  thrust::transform(bob,bob+100,a.begin(),transFunc());
  // thrust::host_vector<int> h_a = a;
  thrust::for_each(a.begin(),a.end(),printFunc());
  printf("Hello");
}
