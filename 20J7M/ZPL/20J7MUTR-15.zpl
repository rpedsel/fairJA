set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.3452, <2> 40.544, <3> 16.1376, <4> 45.1762, <5> 21.856, <6> 31.4523, <7> 40.2677, <8> 30.1849, <9> 32.9754, <10> 19.8945, <11> 33.5057, <12> 13.764, <13> 6.8438, <14> 49.3868, <15> 11.619, <16> 15.5821, <17> 46.2081, <18> 41.1677, <19> 5.3042, <20> 38.579;
param workload[JOB] := <1> 45.2057, <2> 46.8457, <3> 23.3892, <4> 5.7911, <5> 22.7718, <6> 17.8659, <7> 47.33, <8> 31.7498, <9> 39.72, <10> 34.5055, <11> 31.2354, <12> 0.9897, <13> 32.326, <14> 41.2608, <15> 14.2581, <16> 20.9344, <17> 8.0255, <18> 15.6398, <19> 42.4643, <20> 19.8186;
param capacity[MACHINE] := <1> 58.0851, <2> 58.0851, <3> 58.0851, <4> 58.0851, <5> 58.0851, <6> 58.0851, <7> 58.0851;

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
