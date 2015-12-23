set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 14.9041, <2> 22.202, <3> 21.9748, <4> 23.7575, <5> 22.0395, <6> 23.6084, <7> 9.7192, <8> 37.0359, <9> 23.7834, <10> 28.6871, <11> 16.5581, <12> 26.4128, <13> 18.1949, <14> 25.7137, <15> 21.5477, <16> 26.179, <17> 24.9526, <18> 18.2624, <19> 25.3896, <20> 17.9552;
param workload[JOB] := <1> 3.8606, <2> 4.7119, <3> 4.6877, <4> 4.8742, <5> 4.6946, <6> 4.8588, <7> 3.1176, <8> 6.0857, <9> 4.8768, <10> 5.356, <11> 4.0692, <12> 5.1393, <13> 4.2655, <14> 5.0709, <15> 4.642, <16> 5.1165, <17> 4.9953, <18> 4.2735, <19> 5.0388, <20> 4.2374;
param capacity[MACHINE] := <1> 93.9723, <2> 93.9723, <3> 93.9723, <4> 93.9723, <5> 93.9723, <6> 93.9723, <7> 93.9723;

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
