set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0647, <2> 0.2579, <3> 43.4266, <4> 0.3485, <5> 12.4983, <6> 47.9942, <7> 32.4581, <8> 24.6827, <9> 49.3028, <10> 24.2074, <11> 10.8708, <12> 34.7728, <13> 38.645, <14> 30.2579, <15> 40.8362, <16> 45.5529, <17> 32.5875, <18> 10.1578, <19> 35.9346, <20> 3.1462;
param workload[JOB] := <1> 4.8026, <2> 0.5078, <3> 6.5899, <4> 0.5903, <5> 3.5353, <6> 6.9278, <7> 5.6972, <8> 4.9682, <9> 7.0216, <10> 4.9201, <11> 3.2971, <12> 5.8968, <13> 6.2165, <14> 5.5007, <15> 6.3903, <16> 6.7493, <17> 5.7085, <18> 3.1871, <19> 5.9945, <20> 1.7738;
param capacity[MACHINE] := <1> 13.7536, <2> 13.7536, <3> 13.7536, <4> 13.7536, <5> 13.7536, <6> 13.7536, <7> 13.7536;

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
