set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 3.2579, <2> 46.4412, <3> 45.7178, <4> 4.7599, <5> 1.5342, <6> 20.3752, <7> 39.675, <8> 43.3574, <9> 23.1339, <10> 26.2569, <11> 22.4777, <12> 15.9303, <13> 12.4512, <14> 27.3913, <15> 2.4387, <16> 29.472, <17> 5.6667, <18> 39.1571, <19> 36.7483, <20> 18.6562;
param workload[JOB] := <1> 23.2078, <2> 43.7809, <3> 19.7076, <4> 47.7808, <5> 27.0662, <6> 11.4401, <7> 27.9375, <8> 12.4008, <9> 43.5099, <10> 5.6144, <11> 14.9131, <12> 2.5134, <13> 49.7577, <14> 10.5157, <15> 28.2035, <16> 24.9351, <17> 21.9063, <18> 6.5264, <19> 20.2313, <20> 34.8108;
param capacity[MACHINE] := <1> 476.7593, <2> 476.7593, <3> 476.7593, <4> 476.7593, <5> 476.7593, <6> 476.7593;

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
