set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.6269, <2> 17.9861, <3> 32.1304, <4> 33.6639, <5> 30.0315, <6> 22.6938, <7> 34.0883, <8> 33.273, <9> 30.7403, <10> 24.7993, <11> 24.0398, <12> 35.0119, <13> 31.6487, <14> 26.9033, <15> 22.4783, <16> 26.448, <17> 21.804, <18> 22.9092, <19> 23.6632, <20> 29.307;
param workload[JOB] := <1> 41.7907, <2> 20.8055, <3> 39.1437, <4> 47.6806, <5> 14.3925, <6> 26.9298, <7> 46.6702, <8> 26.8841, <9> 32.6444, <10> 25.438, <11> 29.1541, <12> 9.4775, <13> 42.7613, <14> 2.1897, <15> 47.3293, <16> 18.025, <17> 12.2428, <18> 9.3, <19> 30.2372, <20> 28.1827;
param capacity[MACHINE] := <1> 59.0656, <2> 59.0656, <3> 59.0656, <4> 59.0656, <5> 59.0656, <6> 59.0656, <7> 59.0656;

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
