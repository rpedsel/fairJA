set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 45.1781, <2> 0.1409, <3> 21.0899, <4> 4.7864, <5> 9.1472, <6> 24.2595, <7> 11.0975, <8> 16.6765, <9> 19.0869, <10> 37.9906, <11> 26.7436, <12> 8.8213, <13> 44.218, <14> 28.2567, <15> 27.7415, <16> 9.7574, <17> 17.4303, <18> 0.4437, <19> 1.634, <20> 27.4102;
param workload[JOB] := <1> 45.1781, <2> 0.1409, <3> 21.0899, <4> 4.7864, <5> 9.1472, <6> 24.2595, <7> 11.0975, <8> 16.6765, <9> 19.0869, <10> 37.9906, <11> 26.7436, <12> 8.8213, <13> 44.218, <14> 28.2567, <15> 27.7415, <16> 9.7574, <17> 17.4303, <18> 0.4437, <19> 1.634, <20> 27.4102;
param capacity[MACHINE] := <1> 63.6517, <2> 63.6517, <3> 63.6517, <4> 63.6517, <5> 63.6517, <6> 63.6517;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
