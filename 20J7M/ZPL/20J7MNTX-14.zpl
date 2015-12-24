set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.9566, <2> 19.5129, <3> 31.2616, <4> 23.4663, <5> 25.5839, <6> 16.3326, <7> 14.8072, <8> 27.8627, <9> 23.2401, <10> 24.2374, <11> 13.9511, <12> 17.4311, <13> 27.3099, <14> 23.7344, <15> 24.262, <16> 26.7026, <17> 19.5581, <18> 29.1581, <19> 24.8575, <20> 18.6649;
param workload[JOB] := <1> 5.0948, <2> 4.4173, <3> 5.5912, <4> 4.8442, <5> 5.0581, <6> 4.0414, <7> 3.848, <8> 5.2785, <9> 4.8208, <10> 4.9231, <11> 3.7351, <12> 4.1751, <13> 5.2259, <14> 4.8718, <15> 4.9256, <16> 5.1675, <17> 4.4225, <18> 5.3998, <19> 4.9857, <20> 4.3203;
param capacity[MACHINE] := <1> 10.1943, <2> 10.1943, <3> 10.1943, <4> 10.1943, <5> 10.1943, <6> 10.1943, <7> 10.1943;

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
