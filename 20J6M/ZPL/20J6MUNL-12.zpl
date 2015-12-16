set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.5428, <2> 7.0385, <3> 16.086, <4> 26.2941, <5> 17.5752, <6> 8.1258, <7> 41.7, <8> 10.2672, <9> 27.9411, <10> 36.7787, <11> 26.3752, <12> 7.9332, <13> 28.168, <14> 47.6844, <15> 19.1893, <16> 34.9577, <17> 14.1327, <18> 2.2065, <19> 36.7176, <20> 0.14;
param workload[JOB] := <1> 32.5428, <2> 7.0385, <3> 16.086, <4> 26.2941, <5> 17.5752, <6> 8.1258, <7> 41.7, <8> 10.2672, <9> 27.9411, <10> 36.7787, <11> 26.3752, <12> 7.9332, <13> 28.168, <14> 47.6844, <15> 19.1893, <16> 34.9577, <17> 14.1327, <18> 2.2065, <19> 36.7176, <20> 0.14;
param capacity[MACHINE] := <1> 441.854, <2> 441.854, <3> 441.854, <4> 441.854, <5> 441.854, <6> 441.854;

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
