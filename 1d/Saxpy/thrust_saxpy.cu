/*
* This Exmaple Shows The Working Of shared_vector With Thrust Code Without Breaking The Overloadings
* The shared_vector And thrust::transform Is Our Code
* The device_vector Is Using The Built-In Functions Of Thrust like fill,transform etc.
*/

#include <cstdio>
#include <iostream>
#include <vector>
#include <thrust/shared_vector.h>

namespace thrust
{

	namespace hybrid
	{
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
	}
}

class my_functor
{
	float a;
	public :

		my_functor(float b)
		{
			a = b;
		}


		
		__device__ float operator() (float x, float y)
		{

			float z;

			thrust::hybrid::synchronize ();

			z = a*x + y;

			thrust::hybrid::synchronize ();

			z += y;

			return z;
		}
};

int main ()
{
	int N = 15485863;

	my_functor functor(9.0);

	std::vector<float> a(N);	
	std::vector<float> b(N);

	for (int i=0;i<N;i++)
	{
		a[i] = 2.0f * (float)i;
		b[i] = 3.0f * (float)i;
	}	

	thrust::hybrid::shared_vector<float> d1 (a.begin(),a.end());
	thrust::hybrid::shared_vector<float> d2 (b.begin(),b.end());

	thrust::hybrid::transform (d1.begin (),d1.end (),d2.begin (),d2.begin (),functor);
		
	std::cout<<"Element at position 100 is "<<d2[100]<<"\n";

	return 0;
}


