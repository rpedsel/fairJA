set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.2525, <2> 32.391, <3> 37.9667, <4> 26.8995, <5> 22.6845, <6> 21.7591, <7> 30.4016, <8> 34.9696, <9> 25.4502, <10> 23.0029;
param workload[JOB] := <1> 16.2525, <2> 32.391, <3> 37.9667, <4> 26.8995, <5> 22.6845, <6> 21.7591, <7> 30.4016, <8> 34.9696, <9> 25.4502, <10> 23.0029;
param capacity[MACHINE] := <1> 90.5925, <2> 90.5925, <3> 90.5925;

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
