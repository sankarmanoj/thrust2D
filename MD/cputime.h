#ifndef _CPUTIME_H

#define _CPUTIME_H

static const double iCPS = 1.0/2500000000; /* (t2-t1)*iCPS = time taken in seconds */

#define nanotime_ia32 cputime
static __inline__ unsigned long long cputime(void)
  {
    unsigned long long lo,hi;

    /* Note: to avoid out-of-order execution, cpuid can be used. But it reduces the resolution of the timer */
    /* unsigned long long int eax, ebx, ecx, edx;
    const unsigned long long in=0;

     __asm__ __volatile__ ("cpuid" : "=a"(eax), "=b"(ebx), "=c"(ecx), "=d"(edx) : "a"(in)); */

    __asm__ __volatile__ ("rdtsc" : "=a"(lo), "=d"(hi));

    return ( (unsigned long long)lo)|( ((unsigned long long)hi)<<32 );
  }


#if 0
/* CPU Clock Freq. in Hz from routine in /usr/lib/librt.a */
/* extern unsigned long long __get_clockfreq(void); */


static __inline__ double cputime(void)
{
  static const double iCPS = 1.0/2500000000; /* This should be max clock frequency, not the actual one -- so, don't use the one given in /proc/cpuinfo. Also, note that /proc/cpuinfo should contain constant_tsc, for the timing to be accurate */

   
   return iCPS*nanotime_ia32();
}
#endif

#endif
