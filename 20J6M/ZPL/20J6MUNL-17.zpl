set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 4.5614, <2> 12.0671, <3> 0.9979, <4> 38.6766, <5> 5.3168, <6> 28.4719, <7> 38.2189, <8> 22.9712, <9> 2.6131, <10> 39.8749, <11> 10.1365, <12> 47.3645, <13> 21.6167, <14> 4.4784, <15> 41.8909, <16> 11.2645, <17> 39.3702, <18> 23.185, <19> 36.6543, <20> 7.7761;
param workload[JOB] := <1> 4.5614, <2> 12.0671, <3> 0.9979, <4> 38.6766, <5> 5.3168, <6> 28.4719, <7> 38.2189, <8> 22.9712, <9> 2.6131, <10> 39.8749, <11> 10.1365, <12> 47.3645, <13> 21.6167, <14> 4.4784, <15> 41.8909, <16> 11.2645, <17> 39.3702, <18> 23.185, <19> 36.6543, <20> 7.7761;
param capacity[MACHINE] := <1> 437.5069, <2> 437.5069, <3> 437.5069, <4> 437.5069, <5> 437.5069, <6> 437.5069;

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
