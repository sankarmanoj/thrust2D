#include "srad.h"
#include <stdio.h>

class SRADFunctor0
{
public:
	int cols;
	int rows;
	float q0sqr;

	SRADFunctor0 ()
	{
	}

	__device__ void operator() (thrust::window_2D<float> &w)
	{
		printf("%f\n", (float) w[0][0]);
	}

};

class SRADFunctor1
{
public:
	int cols;
	int rows;
	float q0sqr;

	SRADFunctor1 (int cols, int rows, float q0sqr)
	{
		this->cols = cols;
		this->rows = rows;
		this->q0sqr = q0sqr;
	}
	// __device__ float operator() (float x, float y)
	// {
	// 	return x + y;
	// }
	__device__ float operator() (thrust::window_2D<float> &w,thrust::window_2D<float> &yolo)
	{
		int ty = w.window_dim_y/2;
		int tx = w.window_dim_x/2;
		// int rty = w.start_y + ty;
		// int rtx = w.start_x + tx;
		int S = ty-1;
		int N = ty+1;
		int W = tx-1;
		int E = tx+1;

		// printf("functor %d %d \n",w.start_x,w.start_y);
		// printf("%f\n", (float) w[ty][tx]);

		float jc,n,s,we,e,g2,l,num,den,qsqr,c;
		jc = (float) w[ty][tx];
		n  = (float) w[N][tx] - jc;
    s  = (float) w[S][tx] - jc;
    we = (float) w[ty][W]  - jc;
    e  = (float) w[ty][E] - jc;


    g2 = ( n * n + s * s + we * we + e * e ) / (jc * jc);

    l = ( n + s + we + e ) / jc;

		num  = (0.5*g2) - ((1.0/16.0)*(l*l)) ;
		den  = 1 + (.25*l);
		qsqr = num/(den*den);
		// diffusion coefficent (equ 33)
		den = (qsqr-q0sqr) / (q0sqr * (1+q0sqr)) ;
		c = 1.0 / (1.0+den) ;


	  // saturate diffusion coefficent
		if(c<0)
		{
			c=0;
		}
		else if(c>1)
		{
			c=1;
		}
		yolo[ty][tx] = c;
		return 0.0;

		// printf("%f\n", (float) w[ty][tx]);
	}

};

class SRADFunctor2
{
public:
	int cols;
	int rows;
	float lambda;
	float q0sqr;

	SRADFunctor2 (int cols,int rows,float lambda,float q0sqr)
	{
		this->cols = cols;
		this->rows = rows;
		this->lambda = lambda;
		this->q0sqr = q0sqr;
	}

	__device__ void operator() (thrust::window_2D<float> w)
	{
		// printf("functor2\n");
		int ty = w.window_dim_y/2;
		int tx = w.window_dim_x/2;
		// int rty = w.start_y + ty;
		// int rtx = w.start_x + tx;
		int S = ty-1;
		int N = ty+1;
		int W = tx-1;
		int E = tx+1;

		float cc,cn,cs,cw,ce,d_sum;

		cc = (float) w[ty][tx];

		cn  = cc;
    cs  = (float) w[S][tx];
    cw  = cc;
    ce  = (float) w[ty][E];
		float jc,n,s,we,e,g2,l,num,den,qsqr,c;
		jc = (float) w[ty][tx];
		n  = (float) w[N][tx] - jc;
		s  = (float) w[S][tx] - jc;
		we = (float) w[ty][W]  - jc;
		e  = (float) w[ty][E] - jc;

		// divergence (equ 58)
		d_sum = cn * ((float) w[N][tx]) + cs * ((float) w[S][tx]) + cw * ((float) w[ty][W]) + ce * ((float) w[ty][E]);

		// image update (equ 61)
		w[ty][tx] = (float) w[ty][tx] + 0.25 * lambda * d_sum;
		// printf("%f\n", (float) w[ty][tx]);
	}

};
