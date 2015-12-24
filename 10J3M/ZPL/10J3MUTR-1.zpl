set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 6.5669, <2> 0.094, <3> 21.2337, <4> 2.9565, <5> 36.3923, <6> 42.4691, <7> 35.6678, <8> 40.7319, <9> 28.2231, <10> 7.9198;
param workload[JOB] := <1> 48.4807, <2> 16.2819, <3> 4.4895, <4> 46.2038, <5> 6.8971, <6> 10.0649, <7> 32.5828, <8> 43.0349, <9> 21.6103, <10> 21.0628;
param capacity[MACHINE] := <1> 62.6772, <2> 62.6772, <3> 62.6772;

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
