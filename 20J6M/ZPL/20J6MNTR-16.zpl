set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.4943, <2> 22.5306, <3> 20.8557, <4> 22.716, <5> 20.1316, <6> 18.1699, <7> 21.6819, <8> 26.4189, <9> 22.1816, <10> 18.5618, <11> 25.4561, <12> 27.458, <13> 24.7099, <14> 26.2257, <15> 23.6771, <16> 22.3634, <17> 22.7807, <18> 13.5902, <19> 24.9226, <20> 20.678;
param workload[JOB] := <1> 44.9094, <2> 49.5043, <3> 8.9818, <4> 29.6378, <5> 14.4647, <6> 9.333, <7> 29.64, <8> 6.8899, <9> 19.8066, <10> 34.5946, <11> 28.1127, <12> 8.8534, <13> 37.3861, <14> 22.4552, <15> 43.0446, <16> 49.1099, <17> 43.283, <18> 7.9613, <19> 45.246, <20> 33.3471;
param capacity[MACHINE] := <1> 70.8202, <2> 70.8202, <3> 70.8202, <4> 70.8202, <5> 70.8202, <6> 70.8202;

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
