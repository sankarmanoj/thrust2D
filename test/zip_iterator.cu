#include <thrust/block_2d.h>
#include <thrust/window_2d.h>
#include <thrust/sequence.h>
#include <thrust/execution_policy.h>
#include <iostream>
#include <typeinfo>
#define X 7
#define Y 6
using namespace thrust;
// testing zip_iterator
class printFunctor
{
public:
  __device__ void operator() (window_2d<int> myWindow)
  {
    int value = myWindow[0][0];

    myWindow[0][0]=666;
    printf(" %d , %d , %d\n",myWindow.start_x, myWindow.start_y,value);

  }
};
class transformFunctor
{
public:
  __device__ int operator() (const window_2d<int> &myWindow, const int &a) const
  {
    int value = myWindow[0][0];

    myWindow[0][0]=666;
    printf(" %d , %d , %d\n",myWindow.start_x, myWindow.start_y,value);
    return a + value;

  }
};

int main()
{

  block_2d<int> a1(X,Y);
  block_2d<int> b = a1;
  device_vector<int> a(X*Y);
  sequence(a.begin(),a.end());
  b.copy(a.begin(),a.end());
  // std::cout<<"Size ="<<myVector.end()-myVector.begin()<<std::endl;
  // window_iterator<int> myIter = myVector.begin();
  // // myIter[0];

  // std::cout<<boost::typeindex::type_id<window_iterator<int> >().pretty_name()<<std::endl;
  // std::cout<<boost::typeindex::type_id<device_vector<int>::iterator::iterator_category>().pretty_name()<<std::endl;
  // std::cout<<boost::typeindex::type_id<window_iterator<int>::pointer >().pretty_name()<<std::endl;
  // std::cout<<boost::typeindex::type_id<window_iterator<int>::reference >().pretty_name()<<std::endl;
  // // std::cout<<boost::typeindex::type_id<window_iterator<int>::size_type >().pretty_name()<<std::endl;
  //   std::cout<<boost::typeindex::type_id<window_iterator<int>::difference_type >().pretty_name()<<std::endl;
  // b.copy(a.begin(),a.end());
  // typedef typename storage_type::value_type      value_type;
  // typedef typename storage_type::pointer         pointer;
  // typedef typename storage_type::const_pointer   const_pointer;
  // typedef typename storage_type::reference       reference;
  // typedef typename storage_type::const_reference const_reference;
  // typedef typename storage_type::size_type       size_type;
  // typedef typename storage_type::difference_type difference_type;
  // typedef typename storage_type::allocator_type  allocator_type;
  //
  // typedef typename storage_type::iterator        iterator;
  // typedef typename storage_type::const_iterator  const_iterator;
  std::cout<<"Window Vector Creation\n";
  window_vector<int> myVector = window_vector<int>(&b,3,3 ,1,1);
  std::cout<<"Size ="<<myVector.end()-myVector.begin()<<std::endl;
  std::cout<<"Size ="<<thrust::make_zip_iterator(thrust::make_tuple(myVector.end(),myVector.end()))-thrust::make_zip_iterator(thrust::make_tuple(myVector.begin(),myVector.begin()))<<std::endl;
  printf("!= = %d\n",thrust::make_zip_iterator(thrust::make_tuple(myVector.end(),myVector.end()))!=thrust::make_zip_iterator(thrust::make_tuple(myVector.begin(),myVector.begin())));
  printf("> = %d\n",thrust::make_zip_iterator(thrust::make_tuple(myVector.end(),myVector.end()))>thrust::make_zip_iterator(thrust::make_tuple(myVector.begin(),myVector.begin())));
  printf("< = %d\n",thrust::make_zip_iterator(thrust::make_tuple(myVector.end(),myVector.end()))<thrust::make_zip_iterator(thrust::make_tuple(myVector.begin(),myVector.begin())));
  printf("<= = %d\n",thrust::make_zip_iterator(thrust::make_tuple(myVector.end(),myVector.end()))<=thrust::make_zip_iterator(thrust::make_tuple(myVector.begin(),myVector.begin())));
  printf("== = %d\n",thrust::make_zip_iterator(thrust::make_tuple(myVector.end(),myVector.end()))==thrust::make_zip_iterator(thrust::make_tuple(myVector.begin(),myVector.begin())));
  printf("== = %d\n",myVector.begin() == myVector.end());
  printf("!= = %d\n",myVector.begin() != myVector.end());
  // for_each(myVector.begin(),myVector.end(),printFunctor());

  transform(myVector.begin(),myVector.end(),a.begin(),a.begin(),transformFunctor());
  return 0;
}
