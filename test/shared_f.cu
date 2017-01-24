#include <thrust/device_vector.h>
// #include <thrust/for_each.h>
#include <thrust/sequence.h>
#include <thrust/shared_for_each.h>
using namespace thrust;
class printFunctor
{
public:

__device__  void  operator() ( int  &a)
  {
    a=a*a;
  }
};
class copyFunctor
{
public:

__device__  int  operator() ( int  &a)
  {
    return a*a;
  }
};
class binaryFunctor
{
public:

__device__  int  operator() ( int  &a,int &b)
  {
    return a*b;
  }
};
int main()
{
device_vector<int> a(1250);
device_vector<int> b(1250);
device_vector<int> c(1250);

sequence(a.begin(),a.end());
sequence(b.begin(),b.end());
transform(cuda::shared,a.begin(),a.end(),b.begin(),c.begin(),binaryFunctor());
}
