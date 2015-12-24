set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.1008, <2> 22.9213, <3> 27.3732, <4> 30.6531, <5> 10.6632, <6> 28.2909, <7> 27.158, <8> 24.0396, <9> 26.085, <10> 26.859;
param workload[JOB] := <1> 30.1008, <2> 22.9213, <3> 27.3732, <4> 30.6531, <5> 10.6632, <6> 28.2909, <7> 27.158, <8> 24.0396, <9> 26.085, <10> 26.859;
param capacity[MACHINE] := <1> 63.536, <2> 63.536, <3> 63.536;

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
