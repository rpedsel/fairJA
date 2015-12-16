set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 41.5876, <2> 19.8004, <3> 44.2881, <4> 27.2217, <5> 4.8528, <6> 28.3082, <7> 41.282, <8> 31.2355, <9> 49.1983, <10> 27.0051;
param workload[JOB] := <1> 6.4488, <2> 4.4498, <3> 6.6549, <4> 5.2174, <5> 2.2029, <6> 5.3205, <7> 6.4251, <8> 5.5889, <9> 7.0141, <10> 5.1966;
param capacity[MACHINE] := <1> 13.6297, <2> 13.6297, <3> 13.6297;

var x[JM] binary;
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
