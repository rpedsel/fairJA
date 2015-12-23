set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 34.5093, <2> 7.323, <3> 23.352, <4> 27.016, <5> 15.2113, <6> 8.0189, <7> 26.7969, <8> 14.9923, <9> 32.3156, <10> 1.9684, <11> 49.7769, <12> 49.5894, <13> 16.8983, <14> 24.598, <15> 2.3561, <16> 42.9163, <17> 42.3579, <18> 43.0345, <19> 36.8819, <20> 39.4928;
param workload[JOB] := <1> 34.5093, <2> 7.323, <3> 23.352, <4> 27.016, <5> 15.2113, <6> 8.0189, <7> 26.7969, <8> 14.9923, <9> 32.3156, <10> 1.9684, <11> 49.7769, <12> 49.5894, <13> 16.8983, <14> 24.598, <15> 2.3561, <16> 42.9163, <17> 42.3579, <18> 43.0345, <19> 36.8819, <20> 39.4928;
param capacity[MACHINE] := <1> 77.058, <2> 77.058, <3> 77.058, <4> 77.058, <5> 77.058, <6> 77.058, <7> 77.058;

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
