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

	__device__ void operator() (thrust::window_2D<float> w)
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

	__device__ void operator() (thrust::window_2D<float> w)
	{
		int ty = w.window_dim_y/2;
		int tx = w.window_dim_x/2;
		// int rty = w.start_y + ty;
		// int rtx = w.start_x + tx;
		int W = ty-1;
		int E = ty+1;
		int N = tx-1;
		int S = tx+1;

		// printf("functor %d %d \n",w.start_x,w.start_y);
		// printf("%f\n", (float) w[tx][ty]);

		float jc,n,s,we,e,g2,l,num,den,qsqr,c;
		jc = (float) w[tx][ty];
		n  = (float) w[N][ty] - jc;
    s  = (float) w[S][ty] - jc;
    we = (float) w[tx][W]  - jc;
    e  = (float) w[tx][E] - jc;


    g2 = ( n * n + s * s + we * we + e * e ) / (jc * jc);

    l = ( n + s + we + e ) / jc;

		num  = (0.5*g2) - ((1.0/16.0)*(l*l)) ;
		den  = 1 + (.25*l);
		qsqr = num/(den*den);
		// diffusion coefficent (equ 33)
		den = (qsqr-q0sqr) / (q0sqr * (1+q0sqr)) ;
		c = 1.0 / (1.0+den) ;

	  // saturate diffusion coefficent
		if (c < 0){w[tx][ty] = 0;}
		else if (c > 1) {w[tx][ty] = 1;}
		else {w[tx][ty] = c;}

		// printf("%f\n", (float) w[tx][ty]);
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
		int W = ty-1;
		int E = ty+1;
		int N = tx-1;
		int S = tx+1;

		float cc,cn,cs,cw,ce,d_sum;

		cc = (float) w[tx][ty];

		cn  = cc;
    cs  = (float) w[S][ty];
    cw  = cc;
    ce  = (float) w[tx][E];

		// divergence (equ 58)
		d_sum = cn * ((float) w[N][ty]) + cs * ((float) w[S][ty]) + cw * ((float) w[tx][W]) + ce * ((float) w[tx][E]);

		// image update (equ 61)
		w[tx][ty] = (float) w[tx][ty] + 0.25 * lambda * d_sum;
		// printf("%f\n", (float) w[tx][ty]);
	}

};
