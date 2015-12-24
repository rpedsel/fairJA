set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.2396, <2> 37.7426, <3> 35.9303, <4> 5.9444, <5> 9.1934, <6> 16.3066, <7> 32.1046, <8> 43.4323, <9> 18.1283, <10> 12.5584;
param workload[JOB] := <1> 20.2396, <2> 37.7426, <3> 35.9303, <4> 5.9444, <5> 9.1934, <6> 16.3066, <7> 32.1046, <8> 43.4323, <9> 18.1283, <10> 12.5584;
param capacity[MACHINE] := <1> 57.8951, <2> 57.8951, <3> 57.8951;

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
