set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 39.0469, <2> 17.3932, <3> 39.4483, <4> 15.0677, <5> 15.2362, <6> 6.0309, <7> 37.247, <8> 8.4799, <9> 15.694, <10> 35.9239, <11> 23.7179, <12> 11.727, <13> 34.861, <14> 46.5945, <15> 20.2498, <16> 42.331, <17> 4.2449, <18> 28.3757, <19> 45.0449, <20> 29.5448;
param workload[JOB] := <1> 34.2447, <2> 42.4652, <3> 37.8616, <4> 16.6267, <5> 33.4605, <6> 41.2875, <7> 8.5909, <8> 47.9663, <9> 13.1396, <10> 36.8166, <11> 36.8511, <12> 42.3353, <13> 13.9055, <14> 17.1844, <15> 34.3605, <16> 44.2889, <17> 17.5175, <18> 40.9624, <19> 23.409, <20> 34.389;
param capacity[MACHINE] := <1> 617.6632, <2> 617.6632, <3> 617.6632, <4> 617.6632, <5> 617.6632, <6> 617.6632, <7> 617.6632;

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
