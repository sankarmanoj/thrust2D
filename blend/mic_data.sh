#!/bin/bash
for i in {100..10000..100}
  do 
    ./native_omp_mic.o $i 1>> native_blend.log
    ./omp_blend_mic.o $i 1>> thrust_blend.log

  done

