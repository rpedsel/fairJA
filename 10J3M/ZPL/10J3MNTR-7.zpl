set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.2336, <2> 21.5281, <3> 26.2291, <4> 16.9893, <5> 29.8033, <6> 18.4874, <7> 20.0652, <8> 20.7154, <9> 23.5646, <10> 26.7085;
param workload[JOB] := <1> 11.7097, <2> 40.0147, <3> 3.8116, <4> 42.6878, <5> 34.7212, <6> 20.974, <7> 4.7742, <8> 46.313, <9> 33.022, <10> 18.2013;
param capacity[MACHINE] := <1> 64.0573, <2> 64.0573, <3> 64.0573;

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
