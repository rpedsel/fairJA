set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.0272, <2> 19.8234, <3> 15.9223, <4> 33.432, <5> 37.1815, <6> 7.217, <7> 15.6142, <8> 31.0996, <9> 38.1005, <10> 14.0755, <11> 7.5753, <12> 43.4123, <13> 37.8576, <14> 36.2408, <15> 39.1582, <16> 13.049, <17> 42.2233, <18> 5.4906, <19> 25.9842, <20> 4.187;
param workload[JOB] := <1> 5.6593, <2> 4.4523, <3> 3.9903, <4> 5.782, <5> 6.0977, <6> 2.6864, <7> 3.9515, <8> 5.5767, <9> 6.1726, <10> 3.7517, <11> 2.7523, <12> 6.5888, <13> 6.1529, <14> 6.02, <15> 6.2577, <16> 3.6123, <17> 6.4979, <18> 2.3432, <19> 5.0975, <20> 2.0462;
param capacity[MACHINE] := <1> 95.4893, <2> 95.4893, <3> 95.4893, <4> 95.4893, <5> 95.4893, <6> 95.4893;

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
