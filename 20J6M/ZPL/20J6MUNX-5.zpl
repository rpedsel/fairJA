set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.0209, <2> 36.7374, <3> 43.1216, <4> 3.6597, <5> 3.574, <6> 29.4376, <7> 11.8041, <8> 41.8103, <9> 49.5784, <10> 34.7292, <11> 15.4167, <12> 44.9398, <13> 47.0503, <14> 6.8497, <15> 45.5404, <16> 39.9843, <17> 22.9352, <18> 40.6892, <19> 24.6179, <20> 40.1891;
param workload[JOB] := <1> 2.4538, <2> 6.0611, <3> 6.5667, <4> 1.913, <5> 1.8905, <6> 5.4256, <7> 3.4357, <8> 6.4661, <9> 7.0412, <10> 5.8931, <11> 3.9264, <12> 6.7037, <13> 6.8593, <14> 2.6172, <15> 6.7484, <16> 6.3233, <17> 4.7891, <18> 6.3788, <19> 4.9616, <20> 6.3395;
param capacity[MACHINE] := <1> 102.7941, <2> 102.7941, <3> 102.7941, <4> 102.7941, <5> 102.7941, <6> 102.7941;

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
